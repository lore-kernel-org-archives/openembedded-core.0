Return-Path: <stefanx.stanacar@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 218226B5A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 15:04:36 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 09 Aug 2013 08:04:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,846,1367996400"; d="scan'208";a="383852025"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 09 Aug 2013 08:04:36 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id 12EF32C8001
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Aug 2013 08:04:34 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  9 Aug 2013 18:04:30 +0300
Message-Id: <d8b5b32a1cadd19ea63ee286f7b9a264fde72e65.1376060086.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
In-Reply-To: <cover.1376060086.git.stefanx.stanacar@intel.com>
References: <cover.1376060086.git.stefanx.stanacar@intel.com>
Subject: [PATCH 2/4] classes/testimage: create a link for qemu boot log
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
X-List-Received-Date: Fri, 09 Aug 2013 15:04:36 -0000

The full name for the log is confusing when there are multiple files.
Also move the ssh log path stuff where it's needed.

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/classes/testimage.bbclass | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 903849d..86121e4 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -53,11 +53,6 @@ def testimage_main(d):
 
     testdir = d.getVar("TEST_LOG_DIR", True)
     bb.utils.mkdirhier(testdir)
-    sshlog = os.path.join(testdir, "ssh_target_log.%s" % d.getVar('DATETIME', True))
-    sshloglink = os.path.join(testdir, "ssh_target_log")
-    if os.path.islink(sshloglink):
-        os.unlink(sshloglink)
-    os.symlink(sshlog, sshloglink)
 
     # tests in TEST_SUITES become required tests
     # they won't be skipped even if they aren't suitable for a default image (like xorg for minimal)
@@ -103,9 +98,22 @@ def testimage_main(d):
     except ValueError:
         qemu.boottime = 500
 
+    qemuloglink = os.path.join(testdir, "qemu_boot_log")
+    if os.path.islink(qemuloglink):
+        os.unlink(qemuloglink)
+    os.symlink(qemu.logfile, qemuloglink)
+
+    sshlog = os.path.join(testdir, "ssh_target_log.%s" % d.getVar('DATETIME', True))
+    sshloglink = os.path.join(testdir, "ssh_target_log")
+    if os.path.islink(sshloglink):
+        os.unlink(sshloglink)
+    os.symlink(sshlog, sshloglink)
+
+
     bb.note("DISPLAY value: %s" % qemu.display)
     bb.note("rootfs file: %s" %  rootfs)
-    bb.note("Qemu logfile: %s" % qemu.logfile)
+    bb.note("Qemu log file: %s" % qemu.logfile)
+    bb.note("SSH log file: %s" %  sshlog)
 
     #catch exceptions when loading or running tests (mostly our own errors)
     try:
-- 
1.8.3.1


