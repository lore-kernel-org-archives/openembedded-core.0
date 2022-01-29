Return-Path: <alhe@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FD94C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 19:48:50 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web12.10347.1643485729163977619
 for <openembedded-core@lists.openembedded.org>;
 Sat, 29 Jan 2022 11:48:49 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com
 header.s=default header.b=A+oOmZtH;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: alhe@linux.microsoft.com)
Received: from alsamon-xub.lan (cpe-70-112-59-126.austin.res.rr.com
 [70.112.59.126])
	by linux.microsoft.com (Postfix) with ESMTPSA id EFD0F20B6C61;
	Sat, 29 Jan 2022 11:48:47 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EFD0F20B6C61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1643485728;
	bh=FM9N0eZFSi3AOXYlr9osA6OLFhanNtBoo9ij7XmiBK0=;
	h=From:To:Cc:Subject:Date:From;
	b=A+oOmZtH1xQ5THDrH04+TL9YYHQYXg9DWHy03nX/yzlALci5Yr9tKwMhTvFrvwBjW
	 X3NqPClFDk3265wY92hun2DP9ySpsDzwDrxs0NqvwAIdzHHJx8F+zH3Hpb0rMiFbac
	 m0TAnh6XmaW0amTbzXdewAmQYAMClabEMa9fJETs=
From: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
To: openembedded-core@lists.openembedded.org
Cc: bruce.ashfield@gmail.com,
	Alejandro Enedino Hernandez Samaniego <alhe@linux.microsoft.com>
Subject: [PATCH v2] initramfs-framework: Add overlayroot module
Date: Sat, 29 Jan 2022 12:48:39 -0700
Message-Id: <20220129194839.3280002-1-alhe@linux.microsoft.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 19:48:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161102

When installed, this module mounts a read-write (RW) overlay on
top of a root filesystem, which is kept read-only (RO), free
from modifications by the user, this might prove to be useful
if we want to access or restore the original unmodified rootfs.

The existing overlay-etc.bbclass does something similar, it
mounts an overlay on top of the /etc directory, however doing
the same for root causes the original root to be inaccessible
once the system is booted, hence why this module is added to
the initramfs boot flow, allowing us to mount the RW overlay,
while keeping the original rootfs mounted at /rofs once the
system finishes booting. This script is loosely based on that
class.

This module requires rootrw=3D<foo> to be passed as a kernel
parameter to specify the device/partition to be used as RW by the
overlay and has a dependency on overlayfs support being present
in the running kernel.

It does not require the read-only IMAGE_FEATURE to be enabled.

The module needs to be executed after the initramfs-module-rootfs
since it relies on it to mount the filesystem at initramfs startup
but before the finish module which normally switches root.
After overlayroot is executed the usual boot flow continues from
the real init process.

If something goes wrong while running this module, the rootfs
is still mounted RO (with no overlay) and the finish module is
executed to continue booting normally.

Its worth noting that, on purpose, this isnt installed by default
on any images that use initramfs-framework to keep the boot flow
unmodified, only when a user manually requests to install it,
then it becomes functional.

Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.microsof=
t.com>
---
 .../initramfs-framework/overlayroot           | 112 ++++++++++++++++++
 .../initrdscripts/initramfs-framework_1.0.bb  |   9 ++
 2 files changed, 121 insertions(+)
 create mode 100644 meta/recipes-core/initrdscripts/initramfs-framework/o=
verlayroot

diff --git a/meta/recipes-core/initrdscripts/initramfs-framework/overlayr=
oot b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
new file mode 100644
index 0000000000..d40342dc59
--- /dev/null
+++ b/meta/recipes-core/initrdscripts/initramfs-framework/overlayroot
@@ -0,0 +1,112 @@
+#!/bin/sh
+
+# SPDX-License-Identifier: MIT
+#
+# Copyright 2022 (C), Microsoft Corporation
+
+# Simple initramfs module intended to mount a read-write (RW)
+# overlayfs on top of /, keeping the original root filesystem
+# as read-only (RO), free from modifications by the user.
+#
+# NOTE: The read-only IMAGE_FEATURE is not required for this to work
+#
+# This script is based on the overlay-etc.bbclass, which sets up
+# an overlay on top of the /etc directory, but in this case allows
+# accessing the original, unmodified rootfs at /rofs after boot.
+#
+# It relies on the initramfs-module-rootfs to mount the original
+# root filesystem, and requires 'rootrw=3D<foo>' to be passed as a
+# kernel parameter, specifying the device/partition intended to
+# use as RW.
+#
+# This module needs to be executed after the initramfs-module-rootfs
+# since it relies on it to mount the filesystem at initramfs startup
+# but before the finish module which normally switches root.
+# After overlayroot is executed the usual boot flow continues from
+# the real init process.
+#
+# If something goes wrong while running this module, the rootfs
+# is still mounted RO (with no overlay) and the finish module is
+# executed to continue booting normally.
+#
+# It also has a dependency on overlayfs being enabled in the
+# running kernel via KERNEL_FEATURES (kmeta) or any other means.
+
+
+PATH=3D/sbin:/bin:/usr/sbin:/usr/bin
+
+# We get OLDROOT from the rootfs module
+OLDROOT=3D"/rootfs"
+
+NEWROOT=3D"${RWMOUNT}/root"
+RWMOUNT=3D"/overlay"
+ROMOUNT=3D"${RWMOUNT}/rofs"
+UPPER_DIR=3D"${RWMOUNT}/upper"
+WORK_DIR=3D"${RWMOUNT}/work"
+
+MODULES_DIR=3D/init.d
+
+# Something went wrong, make sure / is mounted as read only anyway.
+exit_gracefully() {
+    echo $1 >/dev/console
+    echo >/dev/console
+    echo "OverlayRoot mounting failed, starting system as read-only" >/d=
ev/console
+    echo >/dev/console
+
+    # The following is borrowed from rootfs-postcommands.bbclass
+    # This basically looks at the real rootfs mounting options and
+    # replaces them with "ro"
+
+    # Tweak the mount option and fs_passno for rootfs in fstab
+    if [ -f ${OLDROOT}/etc/fstab ]; then
+        sed -i -e '/^[#[:space:]]*\/dev\/root/{s/defaults/ro/;s/\([[:spa=
ce:]]*[[:digit:]]\)\([[:space:]]*\)[[:digit:]]$/\1\20/}' ${OLDROOT}/etc/f=
stab
+    fi
+
+    # Tweak the "mount -o remount,rw /" command in busybox-inittab initt=
ab
+    if [ -f ${OLDROOT}/etc/inittab ]; then
+        sed -i 's|/bin/mount -o remount,rw /|/bin/mount -o remount,ro /|=
' ${OLDROOT}/etc/inittab
+    fi
+
+    # Continue as if the overlayroot module didn't exist to continue boo=
ting
+    . $MODULES_DIR/99-finish
+    eval "finish_run"
+}
+
+
+if [ -z "$bootparam_rootrw" ]; then
+    exit_gracefully "rootrw=3D kernel parameter doesn't exist and its re=
quired to mount the overlayfs"
+fi
+
+mkdir -p ${RWMOUNT}
+
+# Mount RW device
+if mount -n -t ${bootparam_rootfstype:-ext4} -o ${bootparam_rootflags:-d=
efaults} ${bootparam_rootrw} ${RWMOUNT}
+then
+    # Set up overlay directories
+    mkdir -p ${UPPER_DIR}
+    mkdir -p ${WORK_DIR}
+    mkdir -p ${NEWROOT}
+    mkdir -p ${ROMOUNT}
+
+    # Remount OLDROOT as read-only
+    mount -o bind ${OLDROOT} ${ROMOUNT}
+    mount -o remount,ro ${ROMOUNT}
+
+    # Mount RW overlay
+    mount -t overlay overlay -o lowerdir=3D${ROMOUNT},upperdir=3D${UPPER=
_DIR},workdir=3D${WORK_DIR} ${NEWROOT} || exit_gracefully "initramfs-over=
layroot: Mounting overlay failed"
+else
+    exit_gracefully "initramfs-overlayroot: Mounting RW device failed"
+fi
+
+# Set up filesystems on overlay
+mkdir -p ${NEWROOT}/proc
+mkdir -p ${NEWROOT}/dev
+mkdir -p ${NEWROOT}/sys
+mkdir -p ${NEWROOT}/rofs
+
+mount -n --move ${ROMOUNT} ${NEWROOT}/rofs
+mount -n --move /proc ${NEWROOT}/proc
+mount -n --move /sys ${NEWROOT}/sys
+mount -n --move /dev ${NEWROOT}/dev
+
+exec chroot ${NEWROOT}/ ${bootparam_init:-/sbin/init} || exit_gracefully=
 "Couldn't chroot into overlay"
diff --git a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb b=
/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
index 9e8c1dc3ab..4e76e20026 100644
--- a/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-framework_1.0.bb
@@ -18,6 +18,7 @@ SRC_URI =3D "file://init \
            file://e2fs \
            file://debug \
            file://lvm \
+           file://overlayroot \
           "
=20
 S =3D "${WORKDIR}"
@@ -49,6 +50,9 @@ do_install() {
     # lvm
     install -m 0755 ${WORKDIR}/lvm ${D}/init.d/09-lvm
=20
+    # overlayroot needs to run after rootfs module but before finish
+    install -m 0755 ${WORKDIR}/overlayroot ${D}/init.d/91-overlayroot
+
     # Create device nodes expected by some kernels in initramfs
     # before even executing /init.
     install -d ${D}/dev
@@ -64,6 +68,7 @@ PACKAGES =3D "${PN}-base \
             initramfs-module-rootfs \
             initramfs-module-debug \
             initramfs-module-lvm \
+            initramfs-module-overlayroot \
            "
=20
 FILES:${PN}-base =3D "/init /init.d/99-finish /dev"
@@ -107,3 +112,7 @@ FILES:initramfs-module-debug =3D "/init.d/00-debug"
 SUMMARY:initramfs-module-lvm =3D "initramfs lvm rootfs support"
 RDEPENDS:initramfs-module-lvm =3D "${PN}-base"
 FILES:initramfs-module-lvm =3D "/init.d/09-lvm"
+
+SUMMARY:initramfs-module-overlayroot =3D "initramfs support for mounting=
 a RW overlay on top of a RO root filesystem"
+RDEPENDS:initramfs-module-overlayroot =3D "${PN}-base initramfs-module-r=
ootfs"
+FILES:initramfs-module-overlayroot =3D "/init.d/91-overlayroot"
--=20
2.25.1


