Return-Path: <lorenz@sigma-star.at>
Received: from lilium.sigma-star.at (lilium.sigma-star.at [109.75.188.150])
	by mail.openembedded.org (Postfix) with ESMTP id 964737FD97
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 09:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by lilium.sigma-star.at (Postfix) with ESMTP id 12F271810A9AD
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Sep 2019 11:50:35 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new,
	port 10032)
	with ESMTP id u7WU1TOeVe6k; Thu, 19 Sep 2019 11:50:34 +0200 (CEST)
Received: from lilium.sigma-star.at ([127.0.0.1])
	by localhost (lilium.sigma-star.at [127.0.0.1]) (amavisd-new,
	port 10026)
	with ESMTP id ovJuZK_Qj2Jr; Thu, 19 Sep 2019 11:50:33 +0200 (CEST)
From: Lorenz Kofler <lorenz@sigma-star.at>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Sep 2019 11:49:54 +0200
Message-Id: <20190919094954.2494-1-lorenz@sigma-star.at>
X-Mailer: git-send-email 2.16.4
Subject: [PATCH] Copy hidden files too
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
X-List-Received-Date: Thu, 19 Sep 2019 09:50:34 -0000

From: Lorenz <lorenz@sigma-star.at>

The install scripts did not copy hidden files to the
new rootfs. Changed the cp command that it copies
them too.

Signed-off-by: Lorenz <lorenz@sigma-star.at>
---
 .../recipes-core/initrdscripts/files/init-install-efi-testfs.sh | 2 +-
 meta/recipes-core/initrdscripts/files/init-install-efi.sh       | 2 +-
 meta/recipes-core/initrdscripts/files/init-install-testfs.sh    | 2 +-
 meta/recipes-core/initrdscripts/files/init-install.sh           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
index b351985a61..e28785df1d 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
@@ -131,7 +131,7 @@ mount $rootfs /ssd
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /rootmnt
 
 echo "Copying rootfs files..."
-cp -a /rootmnt/* /ssd
+cp -a /rootmnt/. /ssd/
 
 touch /ssd/etc/masterimage
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index b6855b5aac..c2ceb6d7cf 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -221,7 +221,7 @@ mkdir -p /boot
 mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
-cp -a /src_root/* /tgt_root
+cp -a /src_root/. /tgt_root/
 if [ -d /tgt_root/etc/ ] ; then
     boot_uuid=$(blkid -o value -s UUID ${bootfs})
     swap_part_uuid=$(blkid -o value -s PARTUUID ${swap})
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
index ac62160528..ed746925c1 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
@@ -156,7 +156,7 @@ mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 
 echo "Copying rootfs files..."
-cp -a /src_root/* /tgt_root
+cp -a /src_root/. /tgt_root/
 
 touch /tgt_root/etc/masterimage
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index e71579631b..4b7c3726d8 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -246,7 +246,7 @@ mkdir -p /boot
 mount $rootfs /tgt_root
 mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /src_root
 echo "Copying rootfs files..."
-cp -a /src_root/* /tgt_root
+cp -a /src_root/. /tgt_root/
 if [ -d /tgt_root/etc/ ] ; then
     if [ $grub_version -ne 0 ] ; then
         boot_uuid=$(blkid -o value -s UUID ${bootfs})
-- 
2.23.0


