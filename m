Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 97FDA78459
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 13:30:43 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDUhMm020208
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 15:30:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505223044;
	bh=ljEA1gTAyPTiNna2cOvpqUsdK68we2JNuCrTj/JPFJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Sender;
	b=V7xLYcPeA1EqtItlAXYSnrUMdXJLqSPgq5fZI0T2+rqBxPk3shvHs1JmpXlXdKjAu
	LM+phiPGziMfohfQXY6TYyxDgk5EUkdxD+NOZXuWijqbKL3h0F4jk/t+iNBfVqARbQ
	UbC5fPof3H+BXyTIGgJGCWn2VzUQ2uW5UpGTtsYc=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDUbAp021130 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 12 Sep 2017 15:30:37 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 1A7157C5EFF;
	Tue, 12 Sep 2017 15:25:34 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8CDUZQs021127
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 12 Sep 2017 15:30:35 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drlGt-0003cI-On; Tue, 12 Sep 2017 15:30:35 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Sep 2017 15:30:33 +0200
Message-Id: <20170912133033.13866-1-enrico.scholz@sigma-chemnitz.de>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20170908102218.23790-1-enrico.scholz@sigma-chemnitz.de>
References: <20170908102218.23790-1-enrico.scholz@sigma-chemnitz.de>
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Subject: [PATCH v2] image_types: support lz4 compressed squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 13:30:44 -0000

Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
---
 meta/classes/image_types.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 9b646e9..61dca62 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -107,6 +107,7 @@ IMAGE_CMD_btrfs () {
 IMAGE_CMD_squashfs = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs ${EXTRA_IMAGECMD} -noappend"
 IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-xz ${EXTRA_IMAGECMD} -noappend -comp xz"
 IMAGE_CMD_squashfs-lzo = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lzo ${EXTRA_IMAGECMD} -noappend -comp lzo"
+IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.squashfs-lz4 ${EXTRA_IMAGECMD} -noappend -comp lz4"
 
 # By default, tar from the host is used, which can be quite old. If
 # you need special parameters (like --xattrs) which are only supported
@@ -236,6 +237,7 @@ do_image_btrfs[depends] += "btrfs-tools-native:do_populate_sysroot"
 do_image_squashfs[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs_xz[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_squashfs_lzo[depends] += "squashfs-tools-native:do_populate_sysroot"
+do_image_squashfs_lz4[depends] += "squashfs-tools-native:do_populate_sysroot"
 do_image_elf[depends] += "virtual/kernel:do_populate_sysroot mkelfimage-native:do_populate_sysroot"
 do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
@@ -251,7 +253,7 @@ IMAGE_TYPES = " \
     btrfs \
     iso \
     hddimg \
-    squashfs squashfs-xz squashfs-lzo \
+    squashfs squashfs-xz squashfs-lzo squashfs-lz4 \
     ubi ubifs multiubi \
     tar tar.gz tar.bz2 tar.xz tar.lz4 \
     cpio cpio.gz cpio.xz cpio.lzma cpio.lz4 \
-- 
2.9.5


