Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E8D176AC1E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:25:13 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP; 24 Aug 2015 00:25:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,736,1432623600"; d="scan'208";a="789702169"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2015 00:25:05 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 00:25:03 -0700
Message-Id: <1440401103-22072-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] runqemu: Add a tcpserial option
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
X-List-Received-Date: Mon, 24 Aug 2015 07:25:14 -0000

The option was added so that the qemurunner could start a second tcp
serial port without adding machine conditional logic to qemurunner.

The issue that made this necessary was that when "virt" is passed to
qemu-system-aarch64, the normal mechanism for specifying a tcp serial
port does not work. This is because the hardware for the "virt" machine
is hardcoded in the device tree blob and the addition devices must be
virtio devices.

So runqemu can specify virtio for qemuarm64 whereas it seems all other
qemu machines work with the "-serial tcp*" option.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 4 ++--
 scripts/runqemu                   | 4 ++++
 scripts/runqemu-internal          | 8 ++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index e976fd0..33f3185 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -92,7 +92,7 @@ class QemuRunner:
         # Set this flag so that Qemu doesn't do any grabs as SDL grabs interact
         # badly with screensavers.
         os.environ["QEMU_DONT_GRAB"] = "1"
-        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:{} -serial tcp:127.0.0.1:{}"'.format(threadport, self.serverport)
+        self.qemuparams = 'bootparams="console=tty1 console=ttyS0,115200n8" qemuparams="-serial tcp:127.0.0.1:{}"'.format(threadport)
         if qemuparams:
             self.qemuparams = self.qemuparams[:-1] + " " + qemuparams + " " + '\"'
 
@@ -102,7 +102,7 @@ class QemuRunner:
             fcntl.fcntl(o, fcntl.F_SETFL, fl | os.O_NONBLOCK)
             return os.read(o.fileno(), 1000000)
 
-        launch_cmd = 'runqemu %s %s %s' % (self.machine, self.rootfs, self.qemuparams)
+        launch_cmd = 'runqemu tcpserial=%s %s %s %s' % (self.serverport, self.machine, self.rootfs, self.qemuparams)
         # FIXME: We pass in stdin=subprocess.PIPE here to work around stty
         # blocking at the end of the runqemu script when using this within
         # oe-selftest (this makes stty error out immediately). There ought
diff --git a/scripts/runqemu b/scripts/runqemu
index 09c507d..8271160 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -68,6 +68,7 @@ SCRIPT_QEMU_OPT=""
 SCRIPT_QEMU_EXTRA_OPT=""
 SCRIPT_KERNEL_OPT=""
 SERIALSTDIO=""
+TCPSERIAL_PORTNUM=""
 KVM_ENABLED="no"
 KVM_ACTIVE="no"
 
@@ -150,6 +151,9 @@ while true; do
             SCRIPT_KERNEL_OPT="$SCRIPT_KERNEL_OPT console=ttyS0"
             SERIALSTDIO="1"
             ;;
+        "tcpserial="*)
+            TCPSERIAL_PORTNUM=${arg##tcpserial=}
+            ;;
 	"biosdir="*)
             CUSTOMBIOSDIR="${arg##biosdir=}"
 	    ;;
diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d743322..b317358 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -620,6 +620,14 @@ if [ "x$QEMUOPTIONS" = "x" ]; then
     return 1
 fi
 
+if [ $TCPSERIAL_PORTNUM != "" ]; then
+    if [ "$MACHINE" = "qemuarm64" ]; then
+        QEMUOPTIONS="$QEMUOPTIONS -device virtio-serial-device -chardev socket,id=virtcon,port=$TCPSERIAL_PORTNUM,host=127.0.0.1 -device virtconsole,chardev=virtcon"
+    else
+        QEMUOPTIONS="$QEMUOPTIONS -serial tcp:127.0.0.1:$TCPSERIAL_PORTNUM"
+    fi
+fi
+
 PATH=$OECORE_NATIVE_SYSROOT/usr/bin:$PATH
 
 QEMUBIN=`which $QEMU 2> /dev/null`
-- 
2.4.3


