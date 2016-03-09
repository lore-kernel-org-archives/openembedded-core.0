Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id F405F6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083542"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:15 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:47 +0200
Message-Id: <70a49725090804ddf8e7ab7c9baf3769272010e3.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 01/24] qemu.bbclass: add qemu_wrapper_cmdline()
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:54 -0000

The class had qemu_run_binary() which was not suitable for gobject-introspection,
as it required the name of the binary to run.

qemu_wrapper_cmdline() returns just the command line string needed to run
binaries, and does not require the binary name.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/qemu.bbclass | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index c696085..f3d3be8 100644
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
+            + " -E LD_LIBRARY_PATH=" + ":".join(library_paths) + " "
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
 # PACKAGE_ARCH, *NOT* overrides.
-- 
2.7.0


