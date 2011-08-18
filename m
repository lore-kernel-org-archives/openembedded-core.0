Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jingdong.Lu@windriver.com>) id 1QtylU-0000aQ-Hp
	for Openembedded-core@lists.openembedded.org;
	Thu, 18 Aug 2011 11:19:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7I9FC4g020563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 18 Aug 2011 02:15:12 -0700 (PDT)
Received: from localhost (128.224.162.156) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 18 Aug 2011 02:15:12 -0700
From: Jingdong.Lu@windriver.com
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 18 Aug 2011 17:00:52 +0800
Message-ID: <081e010443a3436dbd5415968aeb3ef4383e2686.1313657192.git.jingdong.lu@windriver.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313657192.git.jingdong.lu@windriver.com>
References: <cover.1313657192.git.jingdong.lu@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.162.156]
Subject: [PATCH 1/1] initrdscripts: fix init-live.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 18 Aug 2011 09:19:56 -0000
Content-Type: text/plain

From: Jingdong Lu <jingdong.lu@windriver.com>

Fix bug: [YOCTO #686]
Because the variable "ROOT_IMAGE" in init-live.sh is not correct, it fails to
run when using liveCD. Modify value of "ROOT_IMAGE" to "isolinux/rootfs.img".
If we want to use liveCD, we also need to add some kernel options related to
CDROM support when compling kernel.

Signed-off-by: Jingdong Lu <jingdong.lu@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |    2 +-
 .../initrdscripts/initramfs-live-boot_1.0.bb       |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index f3e5145..1cd87e8 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -1,7 +1,7 @@
 #!/bin/sh
 
 ROOT_MOUNT="/rootfs/"
-ROOT_IMAGE=rootfs.img
+ROOT_IMAGE="isolinux/rootfs.img"
 MOUNT="/bin/mount"
 UMOUNT="/bin/umount"
 
diff --git a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
index 7051cbd..140fb1d 100644
--- a/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
+++ b/meta/recipes-core/initrdscripts/initramfs-live-boot_1.0.bb
@@ -3,7 +3,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 SRC_URI = "file://init-live.sh"
 
-PR = "r3"
+PR = "r4"
 
 do_install() {
         install -m 0755 ${WORKDIR}/init-live.sh ${D}/init
-- 
1.7.0.4



