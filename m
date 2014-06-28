Return-Path: <blloyd@familyhonor.net>
Received: from mho-02-ewr.mailhop.org (mho-02-ewr.mailhop.org [204.13.248.72])
	by mail.openembedded.org (Postfix) with ESMTP id 5E3DE65FEC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Jun 2014 15:49:32 +0000 (UTC)
Received: from [98.142.68.171] (helo=lloydserv.home.familyhonor.net)
	by mho-02-ewr.mailhop.org with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.72) (envelope-from <blloyd@familyhonor.net>)
	id 1X0usf-0008z9-71 for openembedded-core@lists.openembedded.org;
	Sat, 28 Jun 2014 15:49:33 +0000
Received: from omclinuxballt.home.familyhonor.net ([192.168.0.83])
	(authenticated bits=0)
	by lloydserv.home.familyhonor.net (8.14.7/8.14.6) with ESMTP id
	s5SFn9wq022766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Sat, 28 Jun 2014 10:49:31 -0500
X-Mail-Handler: Dyn Standard SMTP by Dyn
X-Originating-IP: 98.142.68.171
X-Report-Abuse-To: abuse@dyndns.com (see
	http://www.dyndns.com/services/sendlabs/outbound_abuse.html for
	abuse reporting information)
X-MHO-User: U2FsdGVkX1/Cv4x4ApCpDn4d8HE2dOMVTfWzHBprQZw=
From: Brian Lloyd <blloyd@familyhonor.net>
To: openembedded-core@lists.openembedded.org
Date: Sat, 28 Jun 2014 10:48:24 -0500
Message-Id: <1403970504-26097-2-git-send-email-blloyd@familyhonor.net>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1403970504-26097-1-git-send-email-blloyd@familyhonor.net>
References: <1403970504-26097-1-git-send-email-blloyd@familyhonor.net>
Subject: [PATCH 1/1] Move boot media to /media/realroot for easy access after boot.
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
X-List-Received-Date: Sat, 28 Jun 2014 15:49:32 -0000

There are cases where software after boot may need to know the
current boot disk.  Under the current system, it is not guaranteed
which disk is the boot.  While /media/sda is a good guess, it
isn't always right, nor is it a good assumption that only one boot
disk is in the system.  This gives a standard path to the original
boot disk mount which can be used to, for instance, update the
syslinux file on the boot media with a newer kernel, or updating
the boot parameters to add user options for future boots.  Knowing
which disk is the boot media keeps from updating the non-boot
disk when for instance multiple syslinux boot medias are plugged in
(ie ensure correct syslinux is updated when the booted system is
updated).

Signed-off-by: Brian Lloyd <blloyd@familyhonor.net>
---
 meta/recipes-core/initrdscripts/files/init-live.sh         | 10 +++++++++-
 meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb |  4 ++--
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 0be9b6f..d9ff2ea 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -8,6 +8,8 @@ MOUNT="/bin/mount"
 UMOUNT="/bin/umount"
 ISOLINUX=""
 
+ROOT_DISK=""
+
 # Copied from initramfs-framework. The core of this script probably should be
 # turned into initramfs-framework modules to reduce duplication.
 udev_daemon() {
@@ -80,6 +82,10 @@ boot_live_root() {
     udevadm settle --timeout=3 --quiet
     killall "${_UDEV_DAEMON##*/}" 2>/dev/null
 
+    # Allow for identification of the real root even after boot
+    mkdir -p  ${ROOT_MOUNT}/media/realroot
+    mount -n --move "/run/media/${ROOT_DISK}" ${ROOT_MOUNT}/media/realroot
+
     # Move the mount points of some filesystems over to
     # the corresponding directories under the real root filesystem.
     for dir in `awk '/\/dev.* \/run\/media/{print $2}' /proc/mounts`; do
@@ -116,10 +122,12 @@ do
   for i in `ls /run/media 2>/dev/null`; do
       if [ -f /run/media/$i/$ROOT_IMAGE ] ; then
 		found="yes"
+		ROOT_DISK="$i"
 		break
 	  elif [ -f /run/media/$i/isolinux/$ROOT_IMAGE ]; then
 		found="yes"
 		ISOLINUX="isolinux"
+		ROOT_DISK="$i"
 		break	
       fi
   done
@@ -150,7 +158,7 @@ mount_and_boot() {
     mkdir $ROOT_MOUNT
     mknod /dev/loop0 b 7 0 2>/dev/null
 
-    if ! mount -o rw,loop,noatime,nodiratime /run/media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+    if ! mount -o rw,loop,noatime,nodiratime /run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 	fatal "Could not mount rootfs image"
     fi
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 2d378e2..ac54902 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -5,7 +5,7 @@ DEPENDS = "virtual/kernel"
 RDEPENDS_${PN} = "udev udev-extraconf"
 SRC_URI = "file://init-live.sh"
 
-PR = "r11"
+PR = "r12"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
@@ -13,5 +13,5 @@ do_install() {
 
 FILES_${PN} += " /init "
 
-# Due to kernel depdendency
+# Due to kernel dependency
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.0


