Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2618065CBC
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Nov 2015 14:49:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Nov 2015 06:49:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,266,1444719600"; d="scan'208";a="596917395"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Nov 2015 06:49:55 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Nov 2015 16:50:23 +0200
Message-Id: <64f4f7a99b64b27737dc77df4a230d22d87d0599.1447080392.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
References: <cover.1447080392.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/29] qemu.bbclass: add qemu_wrapper_cmdline()
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
X-List-Received-Date: Mon, 09 Nov 2015 14:50:01 -0000

The class had qemu_run_binary() which was not suitable for gobject-introspection,
as it required the name of the binary to run.

qemu_wrapper_cmdline() returns just the command line string needed to run
binaries, and does not require the binary name.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/qemu.bbclass | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 601f587..fe69425 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -13,7 +13,19 @@ def qemu_target_binary(data):
         target_arch = "ppc64"
 
     return "qemu-" + target_arch
-#
+
+def qemu_wrapper_cmdline(data, rootfs_path, library_paths):
+    import string
+
+    qemu_binary = qemu_target_binary(data)
+    if qemu_binary == "qemu-allarch":
+        qemu_binary = "qemuwrapper"
+
+    qemu_options = data.getVar("QEMU_OPTIONS", True)    
+
+    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
+            + " -E LD_LIBRARY_PATH=" + string.join(library_paths, ":") + " "
+
 # Next function will return a string containing the command that is needed to
 # to run a certain binary through qemu. For example, in order to make a certain
 # postinstall scriptlet run at do_rootfs time and running the postinstall is
@@ -23,17 +35,10 @@ def qemu_target_binary(data):
 # ${@qemu_run_binary(d, '$D', '/usr/bin/test_app')} [test_app arguments]
 #
 def qemu_run_binary(data, rootfs_path, binary):
-    qemu_binary = qemu_target_binary(data)
-    if qemu_binary == "qemu-allarch":
-        qemu_binary = "qemuwrapper"
-
     libdir = rootfs_path + data.getVar("libdir", False)
     base_libdir = rootfs_path + data.getVar("base_libdir", False)
-    qemu_options = data.getVar("QEMU_OPTIONS", True)
 
-    return "PSEUDO_UNLOAD=1 " + qemu_binary + " " + qemu_options + " -L " + rootfs_path\
-            + " -E LD_LIBRARY_PATH=" + libdir + ":" + base_libdir + " "\
-            + rootfs_path + binary
+    return qemu_wrapper_cmdline(data, rootfs_path, [libdir, base_libdir]) + rootfs_path + binary
 
 # QEMU_EXTRAOPTIONS is not meant to be directly used, the extensions are 
 # PACKAGE_ARCH, not overrides and hence have to do this dance. Simply being arch 
-- 
2.1.4


