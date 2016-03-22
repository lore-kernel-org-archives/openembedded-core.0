Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 049C065CB6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 22:09:26 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 22 Mar 2016 15:09:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,379,1455004800"; d="scan'208";a="674045745"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Mar 2016 15:09:18 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Mar 2016 14:04:01 +0000
Message-Id: <9534f7323095b29ac128b484534b3e78c7c17821.1458655100.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1458655100.git.mariano.lopez@linux.intel.com>
References: <cover.1458655100.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 2/4] archiver.bbclass: Fix use of ARCHIVER_WORKDIR and ARCHIVER_OUTDIR
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
X-List-Received-Date: Tue, 22 Mar 2016 22:09:27 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Currently do_unpack_and_patch() and do_ar_configured() are using
the ARCHIVER_OUTDIR as the ARCHIVER_WORKDIR, this lead to have
duplicated files inside the tars when using the archiver class
for patched and configured source.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/archiver.bbclass | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbclass
index 221c7f4..4064674 100644
--- a/meta/classes/archiver.bbclass
+++ b/meta/classes/archiver.bbclass
@@ -156,8 +156,9 @@ python do_ar_patched() {
 
     # Get the ARCHIVER_OUTDIR before we reset the WORKDIR
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
+    ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
     bb.note('Archiving the patched source...')
-    d.setVar('WORKDIR', ar_outdir)
+    d.setVar('WORKDIR', ar_workdir)
     create_tarball(d, d.getVar('S', True), 'patched', ar_outdir)
 }
 
@@ -250,21 +251,20 @@ python do_unpack_and_patch() {
             [ 'patched', 'configured'] and \
             d.getVarFlag('ARCHIVER_MODE', 'diff', True) != '1':
         return
-    # Change the WORKDIR to make do_unpack do_patch run in another dir.
     ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
-    d.setVar('WORKDIR', ar_outdir)
-
-    # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
-    # possibly requiring of the following tasks (such as some recipes's
-    # do_patch required 'B' existed).
-    bb.utils.mkdirhier(d.getVar('B', True))
+    ar_workdir = d.getVar('ARCHIVER_WORKDIR', True)
 
     # The kernel class functions require it to be on work-shared, so we dont change WORKDIR
     if not bb.data.inherits_class('kernel-yocto', d):
-        ar_outdir = d.getVar('ARCHIVER_OUTDIR', True)
-        d.setVar('WORKDIR', ar_outdir)
-        bb.build.exec_func('do_unpack', d)
+        # Change the WORKDIR to make do_unpack do_patch run in another dir.
+        d.setVar('WORKDIR', ar_workdir)
 
+        # The changed 'WORKDIR' also caused 'B' changed, create dir 'B' for the
+        # possibly requiring of the following tasks (such as some recipes's
+        # do_patch required 'B' existed).
+        bb.utils.mkdirhier(d.getVar('B', True))
+
+        bb.build.exec_func('do_unpack', d)
 
     # Save the original source for creating the patches
     if d.getVarFlag('ARCHIVER_MODE', 'diff', True) == '1':
-- 
2.6.2


