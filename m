Return-Path: <nathan.rossi@xilinx.com>
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0094.outbound.protection.outlook.com [65.55.169.94])
	by mail.openembedded.org (Postfix) with ESMTP id C482560809
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Dec 2014 05:50:27 +0000 (UTC)
Received: from BL2FFO11FD052.protection.gbl (10.173.160.33) by
	BL2FFO11HUB026.protection.gbl (10.173.161.50) with Microsoft SMTP
	Server (TLS) id 15.1.26.17; Tue, 9 Dec 2014 05:50:25 +0000
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
	BL2FFO11FD052.mail.protection.outlook.com (10.173.161.214) with
	Microsoft
	SMTP Server (TLS) id 15.1.26.17 via Frontend Transport; Tue, 9 Dec 2014
	05:50:25 +0000
Received: from unknown-38-66.xilinx.com ([149.199.38.66] helo=xsj-pvapsmtp01)
	by xsj-pvapsmtpgw01 with esmtp (Exim 4.63)
	(envelope-from <nathan.rossi@xilinx.com>) id 1XyDeA-0004vd-Ud
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Dec 2014 21:47:42 -0800
From: Nathan Rossi <nathan.rossi@xilinx.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Dec 2014 15:50:07 +1000
X-Mailer: git-send-email 2.1.1
In-Reply-To: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
References: <1418104207-1294-1-git-send-email-nathan.rossi@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-7.5.0.1018-21160.005
X-TM-AS-User-Approved-Sender: Yes;Yes
Message-ID: <fadd632833d54592911644f415af526c@BL2FFO11FD052.protection.gbl>
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; IPV:NLI; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(6009001)(438002)(50944004)(189002)(199003)(20776003)(104016003)(50226001)(4396001)(2351001)(21056001)(48376002)(99396003)(50986999)(229853001)(110136001)(106466001)(74316001)(53416004)(50466002)(64706001)(92566001)(450100001)(77156002)(87936001)(89996001)(76176999)(108616004)(120916001)(31966008)(47776003)(6806004)(86362001)(19580405001)(46102003)(107046002)(92726002)(62966003)(19580395003)(107986001)(24736002)(23106004);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BL2FFO11HUB026;
	H:xsj-pvapsmtpgw01; FPR:; SPF:Pass; MLV:sfv;
	PTR:unknown-60-83.xilinx.com; MX:1; A:1; LANG:en; 
MIME-Version: 1.0
X-Microsoft-Antispam: UriScan:;
X-Microsoft-Antispam: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB026;
X-Exchange-Antispam-Report-Test: UriScan:;
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB026;
X-Forefront-PRVS: 0420213CCD
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
	149.199.60.83 as permitted sender) receiver=protection.outlook.com;
	client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Authentication-Results: spf=pass (sender IP is 149.199.60.83)
	smtp.mailfrom=nathan.rossi@xilinx.com; 
X-Exchange-Antispam-Report-CFA-Test: BCL:0;PCL:0;RULEID:;SRVR:BL2FFO11HUB026;
X-OriginatorOrg: xilinx.com
Cc: Nathan Rossi <nathan.rossi@xilinx.com>
Subject: [PATCH 3/3] initscripts: Handle mounting /dev in mountall.sh
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
X-List-Received-Date: Tue, 09 Dec 2014 05:50:31 -0000
Content-Type: text/plain

Setup mountall.sh to mount only /dev first. This is done first so that
the /dev/pts and /dev/shm directories can be created and subsequently be
mounted by the primary mount -a call.

This moves the common mounting proceedures contained in udev/mdev init
scripts into mountall.sh, allowing for a common definition of the /dev,
/dev/pts and /dev/shm mounts via /etc/fstab. This makes it easier for
machines/bsps to define custom mounts for /dev* via the fstab file.

Due to mountall.sh handling the mounting of /dev/pts the devpts.sh init
script is no longer needed. (note: /dev/ptmx is handled by devtmpfs) In
addition the /dev/pts interface is setup earlier than the devpts script
would previously setup, allowing for other rc scripts to use it earlier,
this is particularly important for bootlogd which was dependent on the
legacy pty setup which required a kernel to be built with
CONFIG_LEGACY_PTYS.

This change also allows for systems to run entirely on devtmpfs and have
no dependence on a dev manager. This is useful for very tightly
constrained setups.

Signed-off-by: Nathan Rossi <nathan.rossi@xilinx.com>
---
 meta/recipes-core/busybox/files/mdev               | 13 ----------
 .../initscripts/initscripts-1.0/devpts.sh          | 28 ----------------------
 .../initscripts/initscripts-1.0/mountall.sh        | 14 +++++++++++
 meta/recipes-core/initscripts/initscripts_1.0.bb   |  6 -----
 meta/recipes-core/udev/udev/init                   | 14 -----------
 5 files changed, 14 insertions(+), 61 deletions(-)
 delete mode 100755 meta/recipes-core/initscripts/initscripts-1.0/devpts.sh

diff --git a/meta/recipes-core/busybox/files/mdev b/meta/recipes-core/busybox/files/mdev
index 9625247..7d2c4d8 100755
--- a/meta/recipes-core/busybox/files/mdev
+++ b/meta/recipes-core/busybox/files/mdev
@@ -1,19 +1,6 @@
 #!/bin/sh
 
-mount -t tmpfs tmpfs /dev  -o size=64k,mode=0755
-mkdir /dev/pts /dev/shm
-chmod 777 /dev/shm
-mount -t devpts devpts /dev/pts
 touch /dev/mdev.seq
 echo "/sbin/mdev" > /proc/sys/kernel/hotplug
 mdev -s
 
-#
-# We might have mounted something over /dev, see if /dev/initctl is there.
-#
-if test ! -p /dev/initctl
-then
-        rm -f /dev/initctl
-        mknod -m 600 /dev/initctl p
-fi
-
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh b/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
deleted file mode 100755
index c6043fb..0000000
--- a/meta/recipes-core/initscripts/initscripts-1.0/devpts.sh
+++ /dev/null
@@ -1,28 +0,0 @@
-#!/bin/sh
-### BEGIN INIT INFO
-# Provides:          devpts
-# Required-Start: udev
-# Required-Stop:
-# Default-Start:     S
-# Default-Stop:
-# Short-Description: Mount /dev/pts file systems.
-### END INIT INFO
-
-. /etc/default/devpts
-
-if grep -q devpts /proc/filesystems
-then
-	#
-	#	Create multiplexor device.
-	#
-	test -c /dev/ptmx || mknod -m 666 /dev/ptmx c 5 2
-
-	#
-	#	Mount /dev/pts if needed.
-	#
-	if ! grep -q devpts /proc/mounts
-	then
-		mkdir -p /dev/pts
-		mount -t devpts devpts /dev/pts -ogid=${TTYGRP},mode=${TTYMODE}
-	fi
-fi
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
index 94bae42..000102f 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/mountall.sh
@@ -12,6 +12,20 @@
 . /etc/default/rcS
 
 #
+# Mount /dev/ filesystems in /etc/fstab. This needs to be done in order
+# to allow creation of directories which then have filesystems mounted
+# under /dev/.
+#
+test "$VERBOSE" != no && echo "Mounting /dev/ filesystem..."
+mount -a /dev 2>/dev/null
+
+#
+# Create the /dev/pts and /dev/shm directories for mounting.
+#
+[ -e /dev/pts ] || mkdir -m 0755 /dev/pts
+[ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+
+#
 # Mount local filesystems in /etc/fstab. For some reason, people
 # might want to mount "proc" several times, and mount -v complains
 # about this. So we mount "proc" filesystems without -v.
diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
index afdc538..dccc406 100644
--- a/meta/recipes-core/initscripts/initscripts_1.0.bb
+++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
@@ -10,8 +10,6 @@ INHIBIT_DEFAULT_DEPS = "1"
 SRC_URI = "file://functions \
            file://halt \
            file://umountfs \
-           file://devpts.sh \
-           file://devpts \
            file://hostname.sh \
            file://mountall.sh \
            file://banner.sh \
@@ -89,8 +87,6 @@ do_install () {
 	install -m 0755    ${WORKDIR}/single		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/umountnfs.sh	${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/urandom		${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/devpts.sh	${D}${sysconfdir}/init.d
-	install -m 0755    ${WORKDIR}/devpts		${D}${sysconfdir}/default
 	install -m 0755    ${WORKDIR}/sysfs.sh		${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/populate-volatile.sh ${D}${sysconfdir}/init.d
 	install -m 0755    ${WORKDIR}/read-only-rootfs-hook.sh ${D}${sysconfdir}/init.d
@@ -127,7 +123,6 @@ do_install () {
 	update-rc.d -r ${D} sysfs.sh start 02 S .
 	update-rc.d -r ${D} populate-volatile.sh start 37 S .
 	update-rc.d -r ${D} read-only-rootfs-hook.sh start 29 S .
-	update-rc.d -r ${D} devpts.sh start 38 S .
 	if [ "${TARGET_ARCH}" = "arm" ]; then
 	        update-rc.d -r ${D} alignment.sh start 06 S .
 	fi
@@ -141,7 +136,6 @@ MASKED_SCRIPTS = " \
   bootmisc \
   checkfs \
   checkroot \
-  devpts \
   dmesg \
   hostname \
   mountall \
diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index d26cbfc..152d08f 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -42,20 +42,6 @@ case "$1" in
     # propagate /dev from /sys
     echo "Starting udev"
 
-    # Check for requireed devtmpfs before trying to start udev and
-    # mount a no-existant fs.
-    if ! grep -q devtmpfs /proc/filesystems
-    then
-        echo "Missing devtmpfs, which is required for udev to run";
-        echo "Halting..."
-        halt
-    fi
-    # mount the devtmpfs on /dev, if not already done
-    LANG=C awk '$2 == "/dev" && ($3 == "devtmpfs") { exit 1 }' /proc/mounts && {
-            mount -n -o mode=0755 -t devtmpfs none "/dev"
-    }
-    [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
-    [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
     # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
     # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
     # /var/volatile/tmp directory to be available.
-- 
2.1.1


