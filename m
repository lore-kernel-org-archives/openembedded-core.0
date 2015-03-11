Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id 5EA0F7392B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 18:07:32 +0000 (UTC)
Received: by igkb16 with SMTP id b16so14573325igk.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Mar 2015 11:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wen0BgBxwcrVJkGF/TjLvdGf2nnqbud8hx4YeXWM5wo=;
	b=UOPWqXVYCMPrUjtv6q0eiZqmMDSOXXZYiardesvwcjZTo5Yo5u0LmQLOaeKFj7YGtU
	Lch0Y2xkxAMHwvd/5gv6mzR1RGqZmeCkseAiMPXK/UuM25WT3TU9uNV1Pid1H4kdcu2m
	XavSmtvA3VUEy8VzWX7D6KsfE7ph/4hgBMgAK5Z67YaskL21mbZ5jPNo1TiBa84gIDVC
	hezGC7PXYHhXHdcGTFjeh3/2qnb7fTamA8LwgbnIQDquce/BHUIV1p85+kdFhl3i9hBR
	/RegWGVEwgJ/QTlOTI8jzTKcc5J1sF7YX9dfb+PgFyhJCLgB6GjXd8c8o+RCo0ESofal
	lhCw==
X-Received: by 10.42.119.202 with SMTP id c10mr36410545icr.4.1426097254026;
	Wed, 11 Mar 2015 11:07:34 -0700 (PDT)
Received: from kraj-ch2e.sys.comcast.net (a-96-119-88-205.sys.comcast.net.
	[96.119.88.205])
	by mx.google.com with ESMTPSA id b6sm2881088igb.15.2015.03.11.11.07.33
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 11 Mar 2015 11:07:33 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Mar 2015 18:07:14 +0000
Message-Id: <1426097234-10554-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH V2] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Wed, 11 Mar 2015 18:07:33 -0000

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
index 89eb5f3..818af86 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -228,6 +228,7 @@ read_only_rootfs_hook () {
 	fi
 
 	if ${@bb.utils.contains("DISTRO_FEATURES", "systemd", "true", "false", d)}; then
+	    sed -e 's#/tmp#/var/volatile#g' ${IMAGE_ROOTFS}/lib/systemd/system/tmp.mount > ${IMAGE_ROOTFS}/lib/systemd/system/var-volatile.mount
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


