Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web09.11921.1625242814841293130
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jul 2021 09:20:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="196043433"
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="196043433"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:19 -0700
X-IronPort-AV: E=Sophos;i="5.83,317,1616482800"; 
   d="scan'208";a="626776361"
Received: from ypoh4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.64])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2021 09:20:18 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 05/22] devtool upgrade: rebase override-only patches as well
Date: Sat,  3 Jul 2021 00:19:47 +0800
Message-Id: <a4a5bebcc06637e097f074be9e401aafa8685c38.1625242066.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1625242066.git.anuj.mittal@intel.com>
References: <cover.1625242066.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

There's a number of recipes (such as nettle or glib) which were upgraded
incorrectly due to rebasing only the default set of patches in main SRC_URI.
Native-only or musl-only patches were not handled, causing do_patch fails
and overall misery.

Unfortunately, this also necessitates aborting any incomplete rebases as
devtool needs to be able to return to the original branch to complete
the upgrade command.

Also, do not add devtool-patched-%version tags, as they are not used anywhere,
and it's unclear how to extend them to cover multiple override branches.

(From OE-Core rev: 00131cbc969f6a73caffe068fcb983287cbe577f)

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
(cherry picked from commit 588d04748dd89b5371ca9144666e97ec82dd6204)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 scripts/lib/devtool/upgrade.py | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 5a057e95f5..4605355681 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -260,21 +260,20 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branch, kee
             logger.warning('By user choice, the following patches will NOT be applied to the new source tree:\n  %s' % '\n  '.join([os.path.basename(patch) for patch in patches]))
     else:
         __run('git checkout devtool-patched -b %s' % branch)
-        skiptag = False
-        try:
-            __run('git rebase %s' % rev)
-        except bb.process.ExecutionError as e:
-            skiptag = True
-            if 'conflict' in e.stdout:
-                logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
-            else:
-                logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
-        if not skiptag:
-            if uri.startswith('git://') or uri.startswith('gitsm://'):
-                suffix = 'new'
-            else:
-                suffix = newpv
-            __run('git tag -f devtool-patched-%s' % suffix)
+        (stdout, _) = __run('git branch --list devtool-override-*')
+        branches_to_rebase = [branch] + stdout.split()
+        for b in branches_to_rebase:
+            logger.info("Rebasing {} onto {}".format(b, rev))
+            __run('git checkout %s' % b)
+            try:
+                __run('git rebase %s' % rev)
+            except bb.process.ExecutionError as e:
+                if 'conflict' in e.stdout:
+                    logger.warning('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
+                    __run('git rebase --abort')
+                else:
+                    logger.warning('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        __run('git checkout %s' % branch)
 
     if tmpsrctree:
         if keep_temp:
-- 
2.31.1

