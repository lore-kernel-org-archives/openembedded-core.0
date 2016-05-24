Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4C96E6FF23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 04:19:39 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 23 May 2016 21:19:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="983340979"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by orsmga002.jf.intel.com with ESMTP; 23 May 2016 21:19:20 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 16:18:51 +1200
Message-Id: <47264e626abd0db3dcd724c89f34f76e75f04436.1464063465.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464063465.git.paul.eggleton@linux.intel.com>
References: <cover.1464063465.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464063465.git.paul.eggleton@linux.intel.com>
References: <cover.1464063465.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/3] devtool: upgrade: tweak conflict handling
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 24 May 2016 04:19:39 -0000

Make a couple of changes to the rebase operation:

1) Only wrap the actual rebase command in try...except since a failure
   in any of the other commands should be an error, not a warning
2) If it's a conflict (which unfortunately we can only tell by checking
   for the keyword "conflict" since git doesn't return error codes based
   on the type of error) then print a message clarifying that the user
   needs to resolve the issue themselves to finish the upgrade.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index e34234a..7e6aa42 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -236,16 +236,22 @@ def _extract_new_source(newpv, srctree, no_patch, srcrev, branch, keep_temp, tin
             for patch in patches:
                 logger.warn("%s" % os.path.basename(patch))
     else:
+        __run('git checkout devtool-patched -b %s' % branch)
+        skiptag = False
         try:
-            __run('git checkout devtool-patched -b %s' % branch)
             __run('git rebase %s' % rev)
+        except bb.process.ExecutionError as e:
+            skiptag = True
+            if 'conflict' in e.stdout:
+                logger.warn('Command \'%s\' failed:\n%s\n\nYou will need to resolve conflicts in order to complete the upgrade.' % (e.command, e.stdout.rstrip()))
+            else:
+                logger.warn('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
+        if not skiptag:
             if uri.startswith('git://'):
                 suffix = 'new'
             else:
                 suffix = newpv
             __run('git tag -f devtool-patched-%s' % suffix)
-        except bb.process.ExecutionError as e:
-            logger.warn('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
     if tmpsrctree:
         if keep_temp:
-- 
2.5.5


