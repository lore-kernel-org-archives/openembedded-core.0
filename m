Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34B8D73BB8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 22:38:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 28 Sep 2015 15:38:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,604,1437462000"; d="scan'208";a="653944952"
Received: from bitbang.jf.intel.com ([10.7.201.51])
	by orsmga003.jf.intel.com with ESMTP; 28 Sep 2015 15:38:27 -0700
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 15:38:23 -0700
Message-Id: <1443479903-32731-1-git-send-email-randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] runqemu-internal: Make sure two serial ports always exist
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
X-List-Received-Date: Mon, 28 Sep 2015 22:38:27 -0000

Since inittab for qemu images now always tries to start getty on a
second serial device, make sure that device exists.

Otherwise the following message will be spammed:
    INIT: Id "S1" respawning too fast: disabled for 5 minutes

[YOCTO #8374]

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 scripts/runqemu-internal | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d6b1102..078545e 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -700,6 +700,38 @@ if [ "x$SERIALSTDIO" = "x1" ]; then
         stty intr ^]
 fi
 
+
+# Preserve the multiplexing behavior for the monitor that would be there based
+# on whether nographic is used.
+if echo "$QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT" | grep -- "-nographic"; then
+    FIRST_SERIAL_OPT="-serial mon:stdio"
+else
+    FIRST_SERIAL_OPT="-serial mon:vc"
+fi
+
+# qemuarm64 uses virtio for any additional serial ports so the normal mechanism
+# of using -serial will not work
+if [ "$MACHINE" = "qemuarm64" ]; then
+    SECOND_SERIAL_OPT="$SCRIPT_QEMU_EXTRA_OPT -device virtio-serial-device -chardev null,id=virtcon -device virtconsole,chardev=virtcon"
+else
+    SECOND_SERIAL_OPT="-serial null"
+fi
+
+# We always want a ttyS1. Since qemu by default adds a serial port when
+# nodefaults is not specified, it seems that all that would be needed is to
+# make sure a "-serial" is there. However, it appears that when "-serial" is
+# specified, it ignores the default serial port that is normally added.
+# So here we make sure to add two -serial if there are none. And only one
+# if there is one -serial already.
+NUM_SERIAL_OPTS=`echo $QEMUOPTIONS $SERIALOPTS $SCRIPT_QEMU_OPT $SCRIPT_QEMU_EXTRA_OPT | sed -e 's/ /\n/g' | grep --count -- -serial`
+
+if [ "$NUM_SERIAL_OPTS" = "0" ]; then
+    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $FIRST_SERIAL_OPT $SECOND_SERIAL_OPT"
+elif [ "$NUM_SERIAL_OPTS" = "1" ]; then
+    SCRIPT_QEMU_EXTRA_OPT="$SCRIPT_QEMU_EXTRA_OPT $SECOND_SERIAL_OPT"
+fi
+
+
 echo "Running $QEMU..."
 # -no-reboot is a mandatory option - see bug #100
 if [ "$FSTYPE" = "vmdk" -o "$FSTYPE" = "hddimg" -o "$FSTYPE" = "hdddirect" ]; then
-- 
2.4.3


