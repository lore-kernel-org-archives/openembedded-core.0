Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f170.google.com (mail-ie0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id B3AE973AB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 08:33:48 +0000 (UTC)
Received: by iecsl2 with SMTP id sl2so18762755iec.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 01:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=IThg4R+kZxCcDSRgxGbghox5+RbtuTHHP0c7BHmZ04k=;
	b=MJg8T4u6EYmpwBQDTdmUwJVrdexnZQsXA6vEDypdrfVMFj08/uKCWMumd9YyT2F/73
	ZvIRnu3Vj296QePlGDzO65jWg8vG7iOQ5YrKiLouYrRb4sVjStX1Lg4ItQltlHlFez41
	8oHeGaCcDcKc917O6muQKu4xMIYIOUCXgfy28XKk0/9VfGCgg7XrPkIjZY8MHzaROwn2
	7E4c6HtT3SxmN2iFOqmU3rnsBqgxspjKagN27qJkxx729iu4KI+wXPF6fgWNRv0zYbaI
	/moTP24Kb9naIr3LFDj1Ny8XWsxkyJxQs3vRHNmTylOb2A2CyK55LNhg8iSfxd+RmP6/
	8JkQ==
X-Received: by 10.42.47.73 with SMTP id n9mr40414120icf.20.1426062830208;
	Wed, 11 Mar 2015 01:33:50 -0700 (PDT)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id e3sm3183837igg.16.2015.03.11.01.33.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Mar 2015 01:33:49 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 08:33:29 +0000
Message-Id: <1426062809-1844-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 08:33:56 -0000

- Do not mount /var/volatile to be tmpfs always only when generating
  readonly rootfs
- Generate var-volatile.mount unit when using system in readonly-rootfs
  to mount /var/volatile as tmpfs
- for sysvinit, mount /var/volatile to be tmpfs if its not already
  mounted so
- Use RequiresMountsFor instead of After=, so systemd figures out the
  needed dependencies for making /var/volatile accessible for journald
  and not us.

Change-Id: I0b176b3e1c1e88e84d2c93154aac04cef565d8ea
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/image.bbclass                                             | 1 +
 meta/recipes-core/base-files/base-files/fstab                          | 1 -
 meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh | 2 +-
 meta/recipes-core/systemd/systemd/journald-volatile.conf               | 2 +-
 4 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 89eb5f3..7e49e7a 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -228,6 +228,7 @@ read_only_rootfs_hook () {
 	fi
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+	    sed -i -e 's#/tmp#/var/volatile#g' ${IMAGE_ROOTFS}/lib/systemd/system/tmp.mount > ${IMAGE_ROOTFS}/lib/systemd/system/var-volatile.mount
 	    # Update user database files so that services don't fail for a read-only systemd system
 	    for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
 		[ -e $conffile ] || continue
diff --git a/meta/recipes-core/base-files/base-files/fstab b/meta/recipes-core/base-files/base-files/fstab
index 739b844..56b14d7 100644
--- a/meta/recipes-core/base-files/base-files/fstab
+++ b/meta/recipes-core/base-files/base-files/fstab
@@ -5,7 +5,6 @@ proc                 /proc                proc       defaults              0  0
 devpts               /dev/pts             devpts     mode=0620,gid=5       0  0
 usbdevfs             /proc/bus/usb        usbdevfs   noauto                0  0
 tmpfs                /run                 tmpfs      mode=0755,nodev,nosuid,strictatime 0  0
-tmpfs                /var/volatile        tmpfs      defaults              0  0
 
 # uncomment this if your device has a SD/MMC/Transflash slot
 #/dev/mmcblk0p1       /media/card          auto       defaults,sync,noauto  0  0
diff --git a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
index 1a0328d..3ff39f4 100644
--- a/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
+++ b/meta/recipes-core/initscripts/initscripts-1.0/read-only-rootfs-hook.sh
@@ -29,7 +29,7 @@ is_on_read_only_partition () {
 
 if [ "$1" = "start" ] ; then
 	if [ `is_on_read_only_partition /var/lib` = "yes" ]; then
-		grep -q "tmpfs /var/volatile" /proc/mounts || mount /var/volatile
+		grep -q "tmpfs /var/volatile" /proc/mounts || mount -t tmpfs -o strictatime tmpfs /var/volatile
 		mkdir -p /var/volatile/lib
 		cp -a /var/lib/* /var/volatile/lib
 		mount --bind /var/volatile/lib /var/lib
diff --git a/meta/recipes-core/systemd/systemd/journald-volatile.conf b/meta/recipes-core/systemd/systemd/journald-volatile.conf
index b11e160..9356a4e 100644
--- a/meta/recipes-core/systemd/systemd/journald-volatile.conf
+++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
@@ -3,4 +3,4 @@
 # /var/log -> /var/volatile/log. And if the journal starts before the mount
 # happens, the journal will appear empty until restarted.
 [Unit]
-After=var-volatile.mount
+RequiresMountsFor=/var/volatile
-- 
2.1.4


