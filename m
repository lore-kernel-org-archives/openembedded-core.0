Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 7A4ED763F0
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Apr 2016 15:04:09 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 01 Apr 2016 08:02:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,427,1455004800"; d="scan'208";a="679226937"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by FMSMGA003.fm.intel.com with ESMTP; 01 Apr 2016 08:02:45 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Apr 2016 18:02:42 +0300
Message-Id: <1459522962-30866-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <1459522962-30866-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1459522962-30866-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 2/2] oe/patch: print cleaner error message when patch fails to apply
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
X-List-Received-Date: Fri, 01 Apr 2016 15:04:10 -0000

[YOCTO #9344]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oe/patch.py | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index 6ab4427..9d36172 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -214,13 +214,17 @@ class PatchTree(PatchSet):
         if not force:
             shellcmd.append('--dry-run')
 
-        output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        try:
+            output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
 
-        if force:
-            return
+            if force:
+                return
 
-        shellcmd.pop(len(shellcmd) - 1)
-        output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+            shellcmd.pop(len(shellcmd) - 1)
+            output = runcmd(["sh", "-c", " ".join(shellcmd)], self.dir)
+        except CmdError as err:
+            raise bb.BBHandledException("Applying '%s' failed:\n%s" %
+                                        (os.path.basename(patch['file']), err.output))
 
         if not reverse:
             self._appendPatchFile(patch['file'], patch['strippath'])
-- 
2.6.2


