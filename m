Return-Path: <armccurdy@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 54806758E1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 19:47:01 +0000 (UTC)
Received: by pdcu2 with SMTP id u2so59588055pdc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Jun 2015 12:47:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=f+eJlR6GJKt8arw1TDzhPqsdlQgfn1628yoiUL5ZN0s=;
	b=Esc5gp7etbWmVUa9J0uQevRwoTN9TTI2pp6tycdNfPpFagKmL3p1p3RvaJIxB9KlnM
	oipOGnLAWyUUOdf+XVav3W3maYPYxlHvrnHwvcA/+8xdTrN5WvJ0eRA6HtQ2J8S+pYxE
	vSj3OQcxxHeIXEM6lplQSbM7gxEt7tgxbyU6KhFx1TIkrR4CYQkiRsJSPxS07NMU8vUO
	lzxgMmem1jDeiK9XSLA0b1cZRJJ0XnWyLFOfU8/Kyk6Ufr0iTdK6k8Q0aVwhefvVp7og
	MAsiF01Z8eCqzmTKpr7fBEeNF1IvZFxg6WoTIAe81FvejI8FOcu0lkkjRzsr55qHvitB
	NiQw==
X-Received: by 10.66.234.134 with SMTP id ue6mr93543011pac.146.1435261623309; 
	Thu, 25 Jun 2015 12:47:03 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id
	i10sm30936327pdr.78.2015.06.25.12.47.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 25 Jun 2015 12:47:02 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Jun 2015 12:46:46 -0700
Message-Id: <1435261607-2512-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
References: <1435261607-2512-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 2/3] image_types.bbclass: use pbzip2 for images requiring bz2 compression
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
X-List-Received-Date: Thu, 25 Jun 2015 19:47:03 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/image_types.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index d86d108..9668bad 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -162,13 +162,13 @@ IMAGE_TYPES = " \
 COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
-COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
+COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
 COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
-COMPRESS_DEPENDS_bz2 = ""
+COMPRESS_DEPENDS_bz2 = "pbzip2-native"
 COMPRESS_DEPENDS_xz = "xz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
-- 
1.9.1


