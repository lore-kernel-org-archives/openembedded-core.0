Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 96673771FE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 08:14:24 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1bXOee-00058p-Gy from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2016 01:14:24 -0700
Received: from awais-Precision-M4700.pkl.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.224.2; Wed, 10 Aug 2016 09:14:23 +0100
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 13:14:16 +0500
Message-ID: <1470816856-27919-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] init-install*: only pick root mmc devices
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
X-List-Received-Date: Wed, 10 Aug 2016 08:14:27 -0000
Content-Type: text/plain

Some eMMC devices show special sub-devices such as mmcblk0boot0
etc. The installation script currently pick all of them up and
displays it to the user which makes some confusions because these
sub-devices are pretty small and complete installation including
rootfs won't be possible in most cases.
We simply now drop these sub-devices and only present the user
with the root of such mmc devices.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 8 +++++++-
 meta/recipes-core/initrdscripts/files/init-install.sh     | 8 +++++++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f564f4e..776dcbb 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -29,7 +29,13 @@ esac
 
 echo "Searching for hard drives ..."
 
-for device in `ls /sys/block/`; do
+# Some eMMC devices have special sub devices such as mmcblk0boot0 etc
+# we're currently only interested in the root device so pick them wisely
+devices=`ls /sys/block/ | grep -v mmcblk`
+mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
+devices="$devices $mmc_devices"
+
+for device in $devices; do
     case $device in
         loop*)
             # skip loop device
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 72ce92b..9c4189b 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -28,7 +28,13 @@ esac
 
 echo "Searching for hard drives ..."
 
-for device in `ls /sys/block/`; do
+# Some eMMC devices have special sub devices such as mmcblk0boot0 etc
+# we're currently only interested in the root device so pick them wisely
+devices=`ls /sys/block/ | grep -v mmcblk`
+mmc_devices=`ls /sys/block/ | grep "mmcblk[0-9]\{1,\}$"`
+devices="$devices $mmc_devices"
+
+for device in $devices; do
     case $device in
         loop*)
             # skip loop device
-- 
1.9.1


