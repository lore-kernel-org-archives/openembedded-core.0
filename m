Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id E5C3E73D29
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Apr 2015 17:37:06 +0000 (UTC)
Received: by iggg4 with SMTP id g4so7278690igg.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 06 Apr 2015 10:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=CrcECgrtFVap66OQbnlyo04kZqjrzjtkzxaWe5fArCc=;
	b=T+FkwSrFQZfIQElwdeSzlqZuwXI8YmG+fPKXHzOdDTWZTlE8G7KhsxJgJ/5+gAJzNX
	J4BnDptvL72TMQB7UUM1ofR0X5WDn70QGUp4Jx5UO4I5AvWACAstvP0fmtGuGoRfAb0A
	tw4SjOZ3+ee9kR3nIz5pNEH49ljwE8FQ56pMw+KOxnRsLdd3SwRM3HkzA3OF4j8s4vHp
	FdYUAwoRr+6/1Dk08WMNJEnG+AAMCHkBcY6/ZsuEw50XVF7NsM/fWL66M0fjdKo+Dgt+
	51KCUHem6GqycnBJezmdYrrEFg7utDer6krWCeYqanj4n3bWkhyRcHQ7EUIuDHl+vRlM
	seJQ==
X-Received: by 10.50.43.231 with SMTP id z7mr18657575igl.22.1428341827901;
	Mon, 06 Apr 2015 10:37:07 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id 7sm3063135iol.43.2015.04.06.10.37.07
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 06 Apr 2015 10:37:07 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Apr 2015 17:36:36 +0000
Message-Id: <446f3fc7390411a917682e3669050fde0623ab51.1428341478.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
References: <ff271af7055b2ee3ee93b5ae53dce06876585381.1428341478.git.raj.khem@gmail.com>
In-Reply-To: <cover.1428341477.git.raj.khem@gmail.com>
References: <cover.1428341477.git.raj.khem@gmail.com>
Subject: [PATCH 08/24] var/volatile: Mount it if doing ro-rfs
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
X-List-Received-Date: Mon, 06 Apr 2015 17:37:07 -0000

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
 meta/classes/image.bbclass                                          | 1 +
 meta/recipes-core/base-files/base-files/fstab                       | 1 -
 .../initscripts/initscripts-1.0/read-only-rootfs-hook.sh            | 2 +-
 meta/recipes-core/systemd/systemd/journald-volatile.conf            | 6 ++++++
 4 files changed, 8 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/journald-volatile.conf

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 03cbbf7..5ace087 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -230,6 +230,7 @@ read_only_rootfs_hook () {
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
new file mode 100644
index 0000000..9356a4e
--- /dev/null
+++ b/meta/recipes-core/systemd/systemd/journald-volatile.conf
@@ -0,0 +1,6 @@
+# If /var/volatile is a mount point then make sure to mount it before
+# the journal starts. This is because base-files creates a symlink
+# /var/log -> /var/volatile/log. And if the journal starts before the mount
+# happens, the journal will appear empty until restarted.
+[Unit]
+RequiresMountsFor=/var/volatile
-- 
2.1.4


