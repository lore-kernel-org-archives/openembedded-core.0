Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2C9907404A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jun 2015 18:23:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 26 Jun 2015 11:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,686,1427785200"; d="scan'208";a="718306509"
Received: from josuerfi-mobl1.amr.corp.intel.com (HELO
	swold-mobl.amr.corp.intel.com) ([10.254.73.119])
	by orsmga001.jf.intel.com with ESMTP; 26 Jun 2015 11:23:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 26 Jun 2015 11:23:06 -0700
Message-Id: <1435342986-5353-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH][master & fido] rootfs.py: Add check for kernel modules before running depmod
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
X-List-Received-Date: Fri, 26 Jun 2015 18:23:07 -0000

Add a check for kernel modules so we don't un-necessarily run the depmods, this
will also handle the case with linux-dummy does not place the kernel-abiversion
since it also does not have kernel modules.

[YOCTO #7884]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 18 ++++++++++++++++--
 1 file changed, 16 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index a9a6c85..e86480c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -254,16 +254,30 @@ class Rootfs(object):
             self._exec_shell_cmd(['ldconfig', '-r', self.image_rootfs, '-c',
                                   'new', '-v'])
 
+    def _check_for_kernel_modules(self, modules_dir):
+        for root, dirs, files in os.walk(modules_dir, topdown=True):
+            for name in files:
+                found_ko = name.endswith(".ko")
+                if found_ko:
+                    return found_ko
+        return False
+
     def _generate_kernel_module_deps(self):
+        modules_dir = os.path.join(self.image_rootfs, 'lib', 'modules')
+        # if we don't have any modules don't bother to do the depmod
+        if not self._check_for_kernel_modules(modules_dir):
+            bb.note("No Kernel Modules found, not running depmod")
+            return
+
         kernel_abi_ver_file = oe.path.join(self.d.getVar('PKGDATA_DIR', True), "kernel-depmod",
                                            'kernel-abiversion')
         if not os.path.exists(kernel_abi_ver_file):
             bb.fatal("No kernel-abiversion file found (%s), cannot run depmod, aborting" % kernel_abi_ver_file)
 
         kernel_ver = open(kernel_abi_ver_file).read().strip(' \n')
-        modules_dir = os.path.join(self.image_rootfs, 'lib', 'modules', kernel_ver)
+        versioned_modules_dir = os.path.join(self.image_rootfs, modules_dir, kernel_ver)
 
-        bb.utils.mkdirhier(modules_dir)
+        bb.utils.mkdirhier(versioned_modules_dir)
 
         self._exec_shell_cmd(['depmodwrapper', '-a', '-b', self.image_rootfs, kernel_ver])
 
-- 
2.1.0


