Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E8428719B0
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 08:55:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uB68tR2C014547
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Dec 2016 00:55:27 -0800 (PST)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 6 Dec 2016 00:55:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Dec 2016 00:55:20 -0800
Message-ID: <2ecbdf8cca844fb9b76df48f80b0762811dd1b04.1481014270.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1481014270.git.liezhi.yang@windriver.com>
References: <cover.1481014270.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 5/6] runqemu: fixes for slirp, network device and hostfwd
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
X-List-Received-Date: Tue, 06 Dec 2016 08:55:27 -0000
Content-Type: text/plain

Fixed:
- Add QB_NETWORK_DEVICE to set network device, it will be used by both
  slirp and tap.
- Set QB_NETWORK_DEVICE to "-device virtio-net-pci" in qemuboot.bbclass
  but runqemu will default to "-device e1000" when QB_NETWORK_DEVICE is
  not set, this is because oe-core's qemu targets support
  virtio-net-pci, but the one outside of oe-core may not,
  "-device e1000" is more common.
- Set hostfwd by default: 2222 -> 22, 2323 -> 23, and it will choose a
  usable port when the one like 222 is being used. This can avoid
  conflicts when multilib slirp qemus are running. We can forward more
  ports by default if needed, and bsp.conf can custom it.
- Use different mac sections for slirp and tap to fix conflicts when
  running both of them on the same host.

[YOCTO #7887]

CC: Nathan Rossi <nathan@nathanrossi.com>
CC: Randy Witt <randy.e.witt@linux.intel.com>
Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/qemuboot.bbclass              | 11 ++++--
 meta/conf/machine/include/qemuboot-x86.inc |  1 -
 meta/conf/machine/qemuarm64.conf           |  1 -
 scripts/runqemu                            | 58 ++++++++++++++++++++++++++----
 4 files changed, 59 insertions(+), 12 deletions(-)

diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 1f78a98..1b94af9 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -18,11 +18,15 @@
 # QB_AUDIO_OPT: qemu audio option, e.g., "-soundhw ac97,es1370", used
 #               when QB_AUDIO_DRV is set.
 # QB_KERNEL_ROOT: kernel's root, e.g., /dev/vda
+# QB_NETWORK_DEVICE: network device, e.g., "-device virtio-net-pci,netdev=net0,mac=@MAC@",
+#                    it needs work with QB_TAP_OPT and QB_SLIRP_OPT.
+#                    Note, runqemu will replace @MAC@ with a predefined mac, you can set
+#                    a custom one, but that may cause conflicts when multiple qemus are
+#                    running on the same host.
 # QB_TAP_OPT: netowrk option for 'tap' mode, e.g.,
-#             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0"
+#             "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no"
 #              Note, runqemu will replace "@TAP@" with the one which is used, such as tap0, tap1 ...
-# QB_SLIRP_OPT: network option for SLIRP mode, e.g.,
-#             "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
+# QB_SLIRP_OPT: network option for SLIRP mode, e.g., -netdev user,id=net0"
 # QB_ROOTFS_OPT: used as rootfs, e.g.,
 #               "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 #              Note, runqemu will replace "@ROOTFS@" with the one which is used, such as core-image-minimal-qemuarm64.ext4.
@@ -40,6 +44,7 @@ QB_SERIAL_OPT ?= "-serial mon:stdio -serial null"
 QB_DEFAULT_KERNEL ?= "${KERNEL_IMAGETYPE}"
 QB_DEFAULT_FSTYPE ?= "ext4"
 QB_OPT_APPEND ?= "-show-cursor"
+QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
diff --git a/meta/conf/machine/include/qemuboot-x86.inc b/meta/conf/machine/include/qemuboot-x86.inc
index 0870294..06ac983 100644
--- a/meta/conf/machine/include/qemuboot-x86.inc
+++ b/meta/conf/machine/include/qemuboot-x86.inc
@@ -13,4 +13,3 @@ QB_AUDIO_OPT = "-soundhw ac97,es1370"
 QB_KERNEL_CMDLINE_APPEND = "vga=0 uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci"
-QB_SLIRP_OPT = "-net nic,model=e1000 -net user,hostfwd=tcp::2222-:22"
diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index df2010c..7a5570c 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -18,7 +18,6 @@ QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
 # Add the 'virtio-rng-pci' device otherwise the guest may run out of entropy
 QB_OPT_APPEND = "-show-cursor -device virtio-rng-pci -monitor null"
 QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
-QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
 QB_TCPSERIAL_OPT = " -device virtio-serial-device -chardev socket,id=virtcon,port=@PORT@,host=127.0.0.1 -device virtconsole,chardev=virtcon"
diff --git a/scripts/runqemu b/scripts/runqemu
index a10270c..629b4ed 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -84,7 +84,7 @@ of the following environment variables (in any order):
 Examples:
   runqemu qemuarm
   runqemu tmp/deploy/images/qemuarm
-  runqemu tmp/deploy/images/qemux86/.qemuboot.conf
+  runqemu tmp/deploy/images/qemux86/<qemuboot.conf>
   runqemu qemux86-64 core-image-sato ext4
   runqemu qemux86-64 wic-image-minimal wic
   runqemu path/to/bzImage-qemux86.bin path/to/nfsrootdir/ serial
@@ -147,6 +147,19 @@ def get_first_file(cmds):
                     return f
     return ''
 
+def check_free_port(host, port):
+    """ Check whether the port is free or not """
+    import socket
+    from contextlib import closing
+
+    with closing(socket.socket(socket.AF_INET, socket.SOCK_STREAM)) as sock:
+        if sock.connect_ex((host, port)) == 0:
+            # Port is open, so not free
+            return False
+        else:
+            # Port is not open, so free
+            return True
+
 class BaseConfig(object):
     def __init__(self):
         # Vars can be merged with .qemuboot.conf, use a dict to manage them.
@@ -186,6 +199,15 @@ class BaseConfig(object):
         self.snapshot = False
         self.fstypes = ('ext2', 'ext3', 'ext4', 'jffs2', 'nfs', 'btrfs', 'cpio.gz', 'cpio', 'ramfs')
         self.vmtypes = ('hddimg', 'hdddirect', 'wic', 'vmdk', 'qcow2', 'vdi', 'iso')
+        self.network_device = "-device e1000,netdev=net0,mac=@MAC@"
+        # Use different mac section for tap and slirp to avoid
+        # conflicts, e.g., when one is running with tap, the other is
+        # running with slirp.
+        # The last section is dynamic, which is for avoiding conflicts,
+        # when multiple qemus are running, e.g., when multiple tap or
+        # slirp qemus are running.
+        self.mac_tap = "52:54:00:12:34:"
+        self.mac_slirp = "52:54:00:12:35:"
 
     def acquire_lock(self):
         logger.info("Acquiring lockfile %s..." % self.lock)
@@ -751,14 +773,35 @@ class BaseConfig(object):
 
         self.nfs_running = True
 
-
     def setup_slirp(self):
         """Setup user networking"""
 
         if self.fstype == 'nfs':
             self.setup_nfs()
         self.kernel_cmdline_script += ' ip=dhcp'
-        self.set('NETWORK_CMD', self.get('QB_SLIRP_OPT'))
+        # Port mapping
+        hostfwd = ",hostfwd=tcp::2222-:22,hostfwd=tcp::2323-:23"
+        qb_slirp_opt_default = "-netdev user,id=net0%s" % hostfwd
+        qb_slirp_opt = self.get('QB_SLIRP_OPT') or qb_slirp_opt_default
+        # Figure out the port
+        ports = re.findall('hostfwd=[^-]*:([0-9]+)-[^,-]*', qb_slirp_opt)
+        ports = [int(i) for i in ports]
+        mac = 2
+        # Find a free port to avoid conflicts
+        for p in ports[:]:
+            p_new = p
+            while not check_free_port('localhost', p_new):
+                p_new += 1
+                mac += 1
+                while p_new in ports:
+                        p_new += 1
+                        mac += 1
+            if p != p_new:
+                ports.append(p_new)
+                qb_slirp_opt = re.sub(':%s-' % p, ':%s-' % p_new, qb_slirp_opt)
+                logger.info("Port forward changed: %s -> %s" % (p, p_new))
+        mac = "%s%02x" % (self.mac_slirp, mac)
+        self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qb_slirp_opt))
 
     def setup_tap(self):
         """Setup tap"""
@@ -828,21 +871,22 @@ class BaseConfig(object):
         if self.fstype == 'nfs':
             self.setup_nfs()
         self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (client, gateway)
-        mac = "52:54:00:12:34:%02x" % client
+        mac = "%s%02x" % (self.mac_tap, client)
         qb_tap_opt = self.get('QB_TAP_OPT')
         if qb_tap_opt:
-            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap).replace('@MAC@', mac)
+            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap)
         else:
-            qemu_tap_opt = "-device virtio-net-pci,netdev=net0,mac=%s -netdev tap,id=net0,ifname=%s,script=no,downscript=no" % (mac, self.tap)
+            qemu_tap_opt = "-netdev tap,id=net0,ifname=%s,script=no,downscript=no" % (self.tap)
 
         if self.vhost_enabled:
             qemu_tap_opt += ',vhost=on'
 
-        self.set('NETWORK_CMD', qemu_tap_opt)
+        self.set('NETWORK_CMD', '%s %s' % (self.network_device.replace('@MAC@', mac), qemu_tap_opt))
 
     def setup_network(self):
         cmd = "stty -g"
         self.saved_stty = subprocess.Popen(cmd, shell=True, stdout=subprocess.PIPE).stdout.read().decode('utf-8')
+        self.network_device = self.get('QB_NETWORK_DEVICE') or self.network_device
         if self.slirp_enabled:
             self.setup_slirp()
         else:
-- 
2.9.0


