Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@bigsur.com>) id 1TE4dl-000638-9E
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 22:43:29 +0200
Received: by pbcwy7 with SMTP id wy7so734495pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Sep 2012 13:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bigsur.com; s=bigsur.com;
	h=sender:from:to:subject:date:message-id:x-mailer;
	bh=PDsiLxBeNz96EqlhVsJqXzQOawXQE7HsVpps1AjpLMM=;
	b=Lw406uoFBsJ29VtxhWi1uaU0pEVboOyiUKlc5ErGr8CMIbAZeXcRahy1b5mAbiwUUs
	eYdYx0C08htuZXmPcYZU8J7aY267UGur4uWcpDeKthwRaDTodT98VDflmTVYyxmHiVRc
	R8AGUndindTaITbqatVaF22if4QRar3pFwiO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=sender:from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=PDsiLxBeNz96EqlhVsJqXzQOawXQE7HsVpps1AjpLMM=;
	b=Rs8zJPU2oDncdsZ142ai5TOi/oUha15F1KS9byyV5stK6sksV/lb6DIzBsHeFkXWsb
	HxbX7bxU2BtVM6zceLviE4ioeY+hhKET8WoArcL6SpyQk10KM6uhtXu3WZjy6pJVx3lR
	DOKaoiUUWwdSDdDw6SElFVIEvJx0oHDKAsZNIlQ5c+yIgHkgBTkix2LBIzdQ037RrMJ5
	nVWA1G0SQP6vOdxCD2yWSbEbBgyAYp1ZDnQ00Elm5GUAXYv/bXtTwa8TJpGN/Vyrr78I
	cmb80vQcWyGVCvaRumIRlgtLwUz4fh2V6yALr3bnyX/7zrQpSCiTOKXHrRstEnDjCItJ
	E8kg==
Received: by 10.68.225.199 with SMTP id rm7mr1595385pbc.150.1348000248076;
	Tue, 18 Sep 2012 13:30:48 -0700 (PDT)
Received: from localhost (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id tw5sm496257pbc.48.2012.09.18.13.30.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 18 Sep 2012 13:30:47 -0700 (PDT)
Sender: Saul Wold <sgw@bigsur.com>
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 13:30:34 -0700
Message-Id: <1348000234-9879-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
X-Gm-Message-State: ALoCoQkd/Oo2i+HhzUFrMJWiI1lLflaLejt76MRM6VvTL4DVsDrMif/rDAzF8pL4NK8r72zZ+hCL
Subject: [PATCH] image_types: fix squashfs-lzma image creation
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 18 Sep 2012 20:43:29 -0000

squashfs has the -comp option for lzma, so use it.

[YOCTO #3126]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 8d76cc9..bdb67b4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -166,7 +166,7 @@ IMAGE_CMD_btrfs () {
 }
 
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs ${EXTRA_IMAGECMD} -noappend"
-IMAGE_CMD_squashfs-lzma = "mksquashfs-lzma ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend"
+IMAGE_CMD_squashfs-lzma = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.squashfs-lzma ${EXTRA_IMAGECMD} -noappend -comp lzma"
 IMAGE_CMD_tar = "cd ${IMAGE_ROOTFS} && tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar ."
 
 CPIO_TOUCH_INIT () {
@@ -225,7 +225,7 @@ IMAGE_DEPENDS_ext3 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_ext4 = "genext2fs-native e2fsprogs-native"
 IMAGE_DEPENDS_btrfs = "btrfs-tools-native"
 IMAGE_DEPENDS_squashfs = "squashfs-tools-native"
-IMAGE_DEPENDS_squashfs-lzma = "squashfs-lzma-tools-native"
+IMAGE_DEPENDS_squashfs-lzma = "squashfs-tools-native"
 IMAGE_DEPENDS_elf = "virtual/kernel mkelfimage-native"
 IMAGE_DEPENDS_ubi = "mtd-utils-native"
 IMAGE_DEPENDS_ubifs = "mtd-utils-native"
-- 
1.7.9.5



