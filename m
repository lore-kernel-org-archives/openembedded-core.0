Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EA70A6AE9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:33 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7mZjR019398
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:35 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:52 +0800
Message-ID: <83a204bebbbda43e90cd59774b1941323471f4be.1372394016.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372394016.git.Qi.Chen@windriver.com>
References: <cover.1372394016.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 1/2] initrdscripts: unionfs cleanup
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:34 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The unionfs has been disabled for more than a year and it's not going
to be used any more.

This patch cleans up the unionfs related code.

[YOCTO #4761]
[YOCTO #1487]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   22 +++-----------------
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    7 -------
 2 files changed, 3 insertions(+), 26 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 804e16e..00c2558 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -7,7 +7,6 @@ ROOT_IMAGE="rootfs.img"
 MOUNT="/bin/mount"
 UMOUNT="/bin/umount"
 ISOLINUX=""
-UNIONFS="no"
 
 # Copied from initramfs-framework. The core of this script probably should be
 # turned into initramfs-framework modules to reduce duplication.
@@ -140,25 +139,10 @@ case $label in
     boot)
 	mkdir $ROOT_MOUNT
 	mknod /dev/loop0 b 7 0 2>/dev/null
-
-	
-	if [ "$UNIONFS" = "yes" ]; then
-	    mkdir /rootfs-tmp
-
-	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs-tmp ; then
-		fatal "Could not mount rootfs image"
-	    else
-		mkdir /cow
-		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /cow
-		mount -t unionfs -o dirs=/cow:/rootfs-tmp=ro unionfs $ROOT_MOUNT
-		boot_live_root
-	    fi
+	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+	    fatal "Could not mount rootfs image"
 	else
-	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
-		fatal "Could not mount rootfs image"
-	    else
-		boot_live_root
-	    fi
+	    boot_live_root
 	fi
 	;;
     install|install-efi)
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 0cbfe02..8626bb5 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -7,13 +7,6 @@ SRC_URI = "file://init-live.sh"
 
 PR = "r11"
 
-do_compile() {
-	#if grep -q "CONFIG_UNION_FS=y" ${STAGING_KERNEL_DIR}/.config; then
-	#	sed -i 's/UNIONFS="no"/UNIONFS="yes"/g' ${WORKDIR}/init-live.sh
-	#fi
-	:
-}
- 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
 }
-- 
1.7.9.5


