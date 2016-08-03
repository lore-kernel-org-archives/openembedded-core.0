Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 74124731D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Aug 2016 21:24:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 03 Aug 2016 14:24:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,467,1464678000"; d="scan'208";a="1019191859"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by fmsmga001.fm.intel.com with ESMTP; 03 Aug 2016 14:24:14 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2016 13:21:30 +0000
Message-Id: <eb3a646c9f6acc426951a6446246e0f94565d8ac.1470230446.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1470230446.git.mariano.lopez@linux.intel.com>
References: <cover.1470230446.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] python-smartpm_git.bb: Add patch for debugging random errors
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
X-List-Received-Date: Wed, 03 Aug 2016 21:24:20 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This will add a patch to debug random errors seen in the
autobuilders, it won't solve the errors, but will give us
a better idea of what is happening.

[YOCTO #8383]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 ...art-add-deugging-when-targetpath-is-empty.patch | 47 ++++++++++++++++++++++
 meta/recipes-devtools/python/python-smartpm_git.bb |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch

diff --git a/meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch b/meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch
new file mode 100644
index 0000000..5e80804
--- /dev/null
+++ b/meta/recipes-devtools/python/python-smartpm/smart-add-deugging-when-targetpath-is-empty.patch
@@ -0,0 +1,47 @@
+From 01e51afd03131947f8d74b9a23fdbc0078249499 Mon Sep 17 00:00:00 2001
+From: Mariano Lopez <mariano.lopez@linux.intel.com>
+Date: Wed, 3 Aug 2016 07:47:09 +0000
+Subject: [PATCH] fetcher.py: Add debugging when targetpath is empty
+
+There are several errors when openining files or manipulating
+path strings, those errors point targetpath passed to
+setSucceeded() is empty. This patch won't solve the problems,
+but will add debugging to give an idea why is failing.
+
+Upstream-Status: Inappropriate [debugging]
+
+Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
+---
+ smart/fetcher.py | 16 ++++++++++++++++
+ 1 file changed, 16 insertions(+)
+
+diff --git a/smart/fetcher.py b/smart/fetcher.py
+index dd3ff6b..64aa979 100644
+--- a/smart/fetcher.py
++++ b/smart/fetcher.py
+@@ -594,6 +594,22 @@ class FetchItem(object):
+                 self._eta = None
+ 
+     def setSucceeded(self, targetpath, fetchedsize=0):
++        # It seems the in some odd cases targetpath here
++        # is empty, this will lead to bugs in several places
++        if not targetpath:
++            import traceback
++            tb_str = ""
++            for threadId, stack in sys._current_frames().items():
++                tb_str += '\nThreadID: %s' % threadId
++                for filename, lineno, name, line in traceback.extract_stack(stack):
++                    tb_str += '\nFile: "%s", line %d, in %s' % (filename, lineno, name)
++                    if line:
++                        tb_str += "\n  %s" % line.strip()
++            error_string = ["No file path specified",
++                            "URL: %s" % self._url,
++                            "Status: %s" % self._status,
++                            "Traceback: %s" % tb_str]
++            raise Error, _("\n".join(error_string))
+         if self._status is not FAILED:
+             self._status = SUCCEEDED
+             self._targetpath = targetpath
+-- 
+2.6.6
+
diff --git a/meta/recipes-devtools/python/python-smartpm_git.bb b/meta/recipes-devtools/python/python-smartpm_git.bb
index 81e45b7..668d171 100644
--- a/meta/recipes-devtools/python/python-smartpm_git.bb
+++ b/meta/recipes-devtools/python/python-smartpm_git.bb
@@ -25,6 +25,7 @@ SRC_URI = "\
           file://smart-channel-remove-all.patch \
           file://smart-locale.patch \
           file://smartpm-rpm5-support-check-signatures.patch \
+          file://smart-add-deugging-when-targetpath-is-empty.patch \
          "
 
 SRCREV = "407a7eca766431257dcd1da15175cc36a1bb22d0"
-- 
2.6.6


