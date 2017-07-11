Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 34E7E77DB1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 14:47:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 11 Jul 2017 07:47:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171152251"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 07:47:02 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 6914F5808DD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 07:47:01 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 17:34:23 +0300
Message-Id: <fa98d97a532bddf275cc1f602977f540a5d892de.1499783283.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1499783283.git.ed.bartosh@linux.intel.com>
References: <cover.1499783283.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/2] runqemu: reworked exception handling
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
X-List-Received-Date: Tue, 11 Jul 2017 14:47:01 -0000

Introduced custom RunQemuException that script raises on known
errors. This exception is handled in one place and prints
error output without printing Python traceback. This shoud make
error output less scary for the end user.

Handling of unknown errors has not been changed - both error and
traceback will be printed.

Reimplemented OEPathError exception code to handle it similarly
to RunQemuException.

Moved exception handling code into main() to keep it in one place.

[YOCTO #11719]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/runqemu | 113 ++++++++++++++++++++++++++++----------------------------
 1 file changed, 56 insertions(+), 57 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 41b870c..c33741d 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -28,14 +28,18 @@ import shutil
 import glob
 import configparser
 
-class OEPathError(Exception):
+class RunQemuError(Exception):
+    """Custom exception to raise on known errors."""
+    pass
+
+class OEPathError(RunQemuError):
     """Custom Exception to give better guidance on missing binaries"""
     def __init__(self, message):
-        self.message = "In order for this script to dynamically infer paths\n \
+        super().__init__("In order for this script to dynamically infer paths\n \
 kernels or filesystem images, you either need bitbake in your PATH\n \
 or to source oe-init-build-env before running this script.\n\n \
 Dynamic path inference can be avoided by passing a *.qemuboot.conf to\n \
-runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message
+runqemu, i.e. `runqemu /path/to/my-image-name.qemuboot.conf`\n\n %s" % message)
 
 
 def create_logger():
@@ -101,10 +105,10 @@ def check_tun():
     """Check /dev/net/tun"""
     dev_tun = '/dev/net/tun'
     if not os.path.exists(dev_tun):
-        raise Exception("TUN control device %s is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)" % dev_tun)
+        raise RunQemuError("TUN control device %s is unavailable; you may need to enable TUN (e.g. sudo modprobe tun)" % dev_tun)
 
     if not os.access(dev_tun, os.W_OK):
-        raise Exception("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
+        raise RunQemuError("TUN control device %s is not writable, please fix (e.g. sudo chmod 666 %s)" % (dev_tun, dev_tun))
 
 def check_libgl(qemu_bin):
     cmd = 'ldd %s' % qemu_bin
@@ -137,7 +141,7 @@ def check_libgl(qemu_bin):
             logger.error("You need libGL.so and libGLU.so to exist in your library path to run the QEMU emulator.")
             logger.error("Ubuntu package names are: libgl1-mesa-dev and libglu1-mesa-dev.")
             logger.error("Fedora package names are: mesa-libGL-devel mesa-libGLU-devel.")
-            raise Exception('%s requires libGLU, but not found' % qemu_bin)
+            raise RunQemuError('%s requires libGLU, but not found' % qemu_bin)
 
 def get_first_file(cmds):
     """Return first file found in wildcard cmds"""
@@ -273,7 +277,7 @@ class BaseConfig(object):
                 fst = 'cpio.gz'
             self.fstype = fst
         else:
-            raise Exception("Conflicting: FSTYPE %s and %s" % (self.fstype, fst))
+            raise RunQemuError("Conflicting: FSTYPE %s and %s" % (self.fstype, fst))
 
     def set_machine_deploy_dir(self, machine, deploy_dir_image):
         """Set MACHINE and DEPLOY_DIR_IMAGE"""
@@ -329,7 +333,7 @@ class BaseConfig(object):
                 else:
                     logger.warn("%s doesn't exist" % qb)
             else:
-                raise Exception("Can't find FSTYPE from: %s" % p)
+                raise RunQemuError("Can't find FSTYPE from: %s" % p)
 
         elif os.path.isdir(p) or re.search(':', p) and re.search('/', p):
             if self.is_deploy_dir_image(p):
@@ -341,16 +345,16 @@ class BaseConfig(object):
         elif os.path.basename(p).startswith('ovmf'):
             self.ovmf_bios.append(p)
         else:
-            raise Exception("Unknown path arg %s" % p)
+            raise RunQemuError("Unknown path arg %s" % p)
 
     def check_arg_machine(self, arg):
         """Check whether it is a machine"""
         if self.get('MACHINE') == arg:
             return
         elif self.get('MACHINE') and self.get('MACHINE') != arg:
-            raise Exception("Maybe conflicted MACHINE: %s vs %s" % (self.get('MACHINE'), arg))
+            raise RunQemuError("Maybe conflicted MACHINE: %s vs %s" % (self.get('MACHINE'), arg))
         elif re.search('/', arg):
-            raise Exception("Unknown arg: %s" % arg)
+            raise RunQemuError("Unknown arg: %s" % arg)
 
         logger.info('Assuming MACHINE = %s' % arg)
 
@@ -381,7 +385,7 @@ class BaseConfig(object):
         if s:
             deploy_dir_image = s.group(1)
         else:
-            raise Exception("bitbake -e %s" % self.bitbake_e)
+            raise RunQemuError("bitbake -e %s" % self.bitbake_e)
         if self.is_deploy_dir_image(deploy_dir_image):
             self.set_machine_deploy_dir(arg, deploy_dir_image)
         else:
@@ -435,7 +439,9 @@ class BaseConfig(object):
                 if (not unknown_arg) or unknown_arg == arg:
                     unknown_arg = arg
                 else:
-                    raise Exception("Can't handle two unknown args: %s %s" % (unknown_arg, arg))
+                    raise RunQemuError("Can't handle two unknown args: %s %s\n"
+                                       "Try 'runqemu help' on how to use it" % \
+                                        (unknown_arg, arg))
         # Check to make sure it is a valid machine
         if unknown_arg:
             if self.get('MACHINE') == unknown_arg:
@@ -461,7 +467,7 @@ class BaseConfig(object):
             return
 
         if not self.get('QB_CPU_KVM'):
-            raise Exception("QB_CPU_KVM is NULL, this board doesn't support kvm")
+            raise RunQemuError("QB_CPU_KVM is NULL, this board doesn't support kvm")
 
         self.qemu_opt_script += ' %s %s' % (self.get('QB_MACHINE'), self.get('QB_CPU_KVM'))
         yocto_kvm_wiki = "https://wiki.yoctoproject.org/wiki/How_to_enable_KVM_for_Poky_qemu"
@@ -473,30 +479,30 @@ class BaseConfig(object):
         if not kvm_cap:
             logger.error("You are trying to enable KVM on a cpu without VT support.")
             logger.error("Remove kvm from the command-line, or refer:")
-            raise Exception(yocto_kvm_wiki)
+            raise RunQemuError(yocto_kvm_wiki)
 
         if not os.path.exists(dev_kvm):
             logger.error("Missing KVM device. Have you inserted kvm modules?")
             logger.error("For further help see:")
-            raise Exception(yocto_kvm_wiki)
+            raise RunQemuError(yocto_kvm_wiki)
 
         if os.access(dev_kvm, os.W_OK|os.R_OK):
             self.qemu_opt_script += ' -enable-kvm'
         else:
             logger.error("You have no read or write permission on /dev/kvm.")
             logger.error("Please change the ownership of this file as described at:")
-            raise Exception(yocto_kvm_wiki)
+            raise RunQemuError(yocto_kvm_wiki)
 
         if self.vhost_enabled:
             if not os.path.exists(dev_vhost):
                 logger.error("Missing virtio net device. Have you inserted vhost-net module?")
                 logger.error("For further help see:")
-                raise Exception(yocto_paravirt_kvm_wiki)
+                raise RunQemuError(yocto_paravirt_kvm_wiki)
 
         if not os.access(dev_kvm, os.W_OK|os.R_OK):
                 logger.error("You have no read or write permission on /dev/vhost-net.")
                 logger.error("Please change the ownership of this file as described at:")
-                raise Exception(yocto_kvm_wiki)
+                raise RunQemuError(yocto_kvm_wiki)
 
     def check_fstype(self):
         """Check and setup FSTYPE"""
@@ -505,7 +511,7 @@ class BaseConfig(object):
             if fstype:
                 self.fstype = fstype
             else:
-                raise Exception("FSTYPE is NULL!")
+                raise RunQemuError("FSTYPE is NULL!")
 
     def check_rootfs(self):
         """Check and set rootfs"""
@@ -517,7 +523,7 @@ class BaseConfig(object):
             if not self.rootfs:
                 self.rootfs = self.get('ROOTFS')
             elif self.get('ROOTFS') != self.rootfs:
-                raise Exception("Maybe conflicted ROOTFS: %s vs %s" % (self.get('ROOTFS'), self.rootfs))
+                raise RunQemuError("Maybe conflicted ROOTFS: %s vs %s" % (self.get('ROOTFS'), self.rootfs))
 
         if self.fstype == 'nfs':
             return
@@ -533,10 +539,10 @@ class BaseConfig(object):
             cmds = (cmd_name, cmd_link)
             self.rootfs = get_first_file(cmds)
             if not self.rootfs:
-                raise Exception("Failed to find rootfs: %s or %s" % cmds)
+                raise RunQemuError("Failed to find rootfs: %s or %s" % cmds)
 
         if not os.path.exists(self.rootfs):
-            raise Exception("Can't find rootfs: %s" % self.rootfs)
+            raise RunQemuError("Can't find rootfs: %s" % self.rootfs)
 
     def check_ovmf(self):
         """Check and set full path for OVMF firmware and variable file(s)."""
@@ -550,7 +556,7 @@ class BaseConfig(object):
                     self.ovmf_bios[index] = path
                     break
             else:
-                raise Exception("Can't find OVMF firmware: %s" % ovmf)
+                raise RunQemuError("Can't find OVMF firmware: %s" % ovmf)
 
     def check_kernel(self):
         """Check and set kernel, dtb"""
@@ -573,10 +579,10 @@ class BaseConfig(object):
             cmds = (kernel_match_name, kernel_match_link, kernel_startswith)
             self.kernel = get_first_file(cmds)
             if not self.kernel:
-                raise Exception('KERNEL not found: %s, %s or %s' % cmds)
+                raise RunQemuError('KERNEL not found: %s, %s or %s' % cmds)
 
         if not os.path.exists(self.kernel):
-            raise Exception("KERNEL %s not found" % self.kernel)
+            raise RunQemuError("KERNEL %s not found" % self.kernel)
 
         dtb = self.get('QB_DTB')
         if dtb:
@@ -586,7 +592,7 @@ class BaseConfig(object):
             cmds = (cmd_match, cmd_startswith, cmd_wild)
             self.dtb = get_first_file(cmds)
             if not os.path.exists(self.dtb):
-                raise Exception('DTB not found: %s, %s or %s' % cmds)
+                raise RunQemuError('DTB not found: %s, %s or %s' % cmds)
 
     def check_biosdir(self):
         """Check custombiosdir"""
@@ -606,7 +612,7 @@ class BaseConfig(object):
             self.qemu_opt_script += ' -L %s' % biosdir
         else:
             logger.error("Custom BIOS directory not found. Tried: %s, %s, and %s" % (self.custombiosdir, biosdir_native, biosdir_host))
-            raise Exception("Invalid custombiosdir: %s" % self.custombiosdir)
+            raise RunQemuError("Invalid custombiosdir: %s" % self.custombiosdir)
 
     def check_mem(self):
         s = re.search('-m +([0-9]+)', self.qemu_opt_script)
@@ -634,7 +640,7 @@ class BaseConfig(object):
         # Check audio
         if self.audio_enabled:
             if not self.get('QB_AUDIO_DRV'):
-                raise Exception("QB_AUDIO_DRV is NULL, this board doesn't support audio")
+                raise RunQemuError("QB_AUDIO_DRV is NULL, this board doesn't support audio")
             if not self.get('QB_AUDIO_OPT'):
                 logger.warn('QB_AUDIO_OPT is NULL, you may need define it to make audio work')
             else:
@@ -689,7 +695,7 @@ class BaseConfig(object):
             return
 
         if not os.path.exists(self.qemuboot):
-            raise Exception("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
+            raise RunQemuError("Failed to find %s (wrong image name or BSP does not support running under qemu?)." % self.qemuboot)
 
         logger.info('CONFFILE: %s' % self.qemuboot)
 
@@ -815,12 +821,12 @@ class BaseConfig(object):
                 elif os.path.exists(src2):
                     src = src2
                 if not src:
-                    raise Exception("No NFS_DIR is set, and can't find %s or %s to extract" % (src1, src2))
+                    raise RunQemuError("No NFS_DIR is set, and can't find %s or %s to extract" % (src1, src2))
                 logger.info('NFS_DIR not found, extracting %s to %s' % (src, dest))
                 cmd = 'runqemu-extract-sdk %s %s' % (src, dest)
                 logger.info('Running %s...' % cmd)
                 if subprocess.call(cmd, shell=True) != 0:
-                    raise Exception('Failed to run %s' % cmd)
+                    raise RunQemuError('Failed to run %s' % cmd)
                 self.clean_nfs_dir = True
                 self.rootfs = dest
 
@@ -828,7 +834,7 @@ class BaseConfig(object):
         cmd = 'runqemu-export-rootfs start %s' % self.rootfs
         logger.info('Running %s...' % cmd)
         if subprocess.call(cmd, shell=True) != 0:
-            raise Exception('Failed to run %s' % cmd)
+            raise RunQemuError('Failed to run %s' % cmd)
 
         self.nfs_running = True
 
@@ -911,7 +917,7 @@ class BaseConfig(object):
             if os.path.exists(nosudo_flag):
                 logger.error("Error: There are no available tap devices to use for networking,")
                 logger.error("and I see %s exists, so I am not going to try creating" % nosudo_flag)
-                raise Exception("a new one with sudo.")
+                raise RunQemuError("a new one with sudo.")
 
             gid = os.getgid()
             uid = os.getuid()
@@ -1053,7 +1059,7 @@ class BaseConfig(object):
         if not qemu_system:
             qemu_system = self.guess_qb_system()
         if not qemu_system:
-            raise Exception("Failed to boot, QB_SYSTEM_NAME is NULL!")
+            raise RunQemuError("Failed to boot, QB_SYSTEM_NAME is NULL!")
 
         qemu_bin = '%s/%s' % (self.bindir_native, qemu_system)
 
@@ -1202,42 +1208,35 @@ class BaseConfig(object):
             if os.path.exists(result):
                 self.set('STAGING_BINDIR_NATIVE', result)
                 return result
-            raise Exception("Native sysroot directory %s doesn't exist" % result)
+            raise RunQemuError("Native sysroot directory %s doesn't exist" % result)
         else:
-            raise Exception("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
+            raise RunQemuError("Can't find STAGING_BINDIR_NATIVE in '%s' output" % cmd)
 
 
 def main():
     if "help" in sys.argv or '-h' in sys.argv or '--help' in sys.argv:
         print_usage()
         return 0
-    config = BaseConfig()
     try:
+        config = BaseConfig()
         config.check_args()
-    except Exception as esc:
-        logger.error(esc)
-        logger.error("Try 'runqemu help' on how to use it")
-        return 1
-    config.read_qemuboot()
-    config.check_and_set()
-    config.print_config()
-    try:
+        config.read_qemuboot()
+        config.check_and_set()
+        config.print_config()
         config.setup_network()
         config.setup_rootfs()
         config.setup_final()
         config.start_qemu()
+    except RunQemuError as err:
+        logger.error(err)
+        return 1
+    except Exception as err:
+        import traceback
+        traceback.print_exc()
+        return 1
     finally:
+        print("Cleanup")
         config.cleanup()
-    return 0
 
 if __name__ == "__main__":
-    try:
-        ret = main()
-    except OEPathError as err:
-        ret = 1
-        logger.error(err.message)
-    except Exception as esc:
-        ret = 1
-        import traceback
-        traceback.print_exc()
-    sys.exit(ret)
+    sys.exit(main())
-- 
2.1.4


