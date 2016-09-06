Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 67B0877534
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 13:46:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86DkDlA030222 for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:46:13 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id AldtmwvppUpK
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Sep 2016 14:46:13 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u86DkAuu030219
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Sep 2016 14:46:11 +0100
Message-ID: <1473169570.20226.51.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 06 Sep 2016 14:46:10 +0100
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Subject: [PATCH] runqemu: Allow unique network interface MAC addresses
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
X-List-Received-Date: Tue, 06 Sep 2016 13:46:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Current qemu instances all share the same MAC address. This shouldn't be an
issue as they are all on separate network interfaces, however on the slight
chance this is causing problems, its easy enough to ensure we use unique
MAC addresses based on the IP numbers we assign.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/conf/machine/qemuarm64.conf b/meta/conf/machine/qemuarm64.conf
index df76ee6..da59c33 100644
--- a/meta/conf/machine/qemuarm64.conf
+++ b/meta/conf/machine/qemuarm64.conf
@@ -16,7 +16,7 @@ QB_MACHINE = "-machine virt"
 QB_CPU = "-cpu cortex-a57"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyAMA0,38400"
 QB_OPT_APPEND = "-show-cursor"
-QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-device,netdev=net0,mac=@MAC@"
 QB_SLIRP_OPT = "-netdev user,id=net0 -device virtio-net-device,netdev=net0"
 QB_ROOTFS_OPT = "-drive id=disk0,file=@ROOTFS@,if=none,format=raw -device virtio-blk-device,drive=disk0"
 QB_SERIAL_OPT = "-device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
diff --git a/meta/conf/machine/qemuppc.conf b/meta/conf/machine/qemuppc.conf
index 939c834..e4c8dac 100644
--- a/meta/conf/machine/qemuppc.conf
+++ b/meta/conf/machine/qemuppc.conf
@@ -17,4 +17,4 @@ QB_MACHINE = "-machine mac99"
 QB_CPU = "-cpu G4"
 QB_KERNEL_CMDLINE_APPEND = "console=ttyS0 console=tty"
 QB_OPT_APPEND = "-show-cursor -usb -usbdevice tablet"
-QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0"
+QB_TAP_OPT = "-netdev tap,id=net0,ifname=@TAP@,script=no,downscript=no -device virtio-net-pci,netdev=net0,mac=@MAC@"
diff --git a/scripts/runqemu b/scripts/runqemu
index 867e818..2b5e588 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -681,11 +681,12 @@ class BaseConfig(object):
         if self.fstype == 'nfs':
             self.setup_nfs()
         self.kernel_cmdline_script += " ip=192.168.7.%s::192.168.7.%s:255.255.255.0" % (n2, n1)
+        mac = "52:54:00:12:34:%02x" % n2
         qb_tap_opt = self.get('QB_TAP_OPT')
         if qb_tap_opt:
-            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap)
+            qemu_tap_opt = qb_tap_opt.replace('@TAP@', tap).replace('@MAC@', mac)
         else:
-            qemu_tap_opt = "-net nic,model=virtio -net tap,vlan=0,ifname=%s,script=no,downscript=no" % self.tap
+            qemu_tap_opt = "-net nic,model=virtio,mac=%s -net tap,vlan=0,ifname=%s,script=no,downscript=no" % (mac, self.tap)
 
         if self.vhost_enabled:
             qemu_tap_opt += ',vhost=on'



