Return-Path: <tomasz.meresinski@comarch.pl>
Received: from odzwierny3.comarch.com (odzwierny3.comarch.com [217.74.69.18])
	by mail.openembedded.org (Postfix) with ESMTP id 66150779C1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Sep 2017 10:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	authenticated as tomasz.meresinski@comarch.com
	by odzwierny3.comarch.com with esmtpsa (TLSv1:AES128-SHA:128)(ComArch
	ESMTP) id 1duFss-000C8x-KT; Tue, 19 Sep 2017 12:36:06 +0200
From: =?UTF-8?q?Tomasz=20Meresi=C5=84ski?= <tomasz.meresinski@comarch.pl>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Sep 2017 12:36:00 +0200
Message-Id: <20170919103600.19074-1-tomasz.meresinski@comarch.pl>
X-Mailer: git-send-email 2.12.3
MIME-Version: 1.0
X-CA-Antivirus: Scanned by ComArch Antivirus on odzwierny3.comarch.com
X-CA-Is-Spam: No
Subject: [PATCH] classes/image_live: fix using squashfs as image filesystem
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
X-List-Received-Date: Tue, 19 Sep 2017 10:36:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Different squashfs versions have IMAGE_TYPE with hyphen (eg squashfs-lz4).
Tasks on the other hand have names with underscore (eg do_image_squashfs_lz4).

Signed-off-by: Tomasz Meresiński <tomasz.meresinski@comarch.pl>
---
 meta/classes/image-live.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index c1862b1319..7a388d5c60 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -34,7 +34,7 @@ do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         ${MLPREFIX}syslinux:do_populate_sysroot \
                         syslinux-native:do_populate_sysroot \
                         ${@oe.utils.ifelse(d.getVar('COMPRESSISO', False),'zisofs-tools-native:do_populate_sysroot','')} \
-                        ${PN}:do_image_${LIVE_ROOTFS_TYPE} \
+                        ${PN}:do_image_${@d.getVar('LIVE_ROOTFS_TYPE').replace('-', '_')} \
                         "


--
2.12.3


