Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SpO4S-00029W-UU
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:25:05 +0200
Received: by yenl13 with SMTP id l13so2529080yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2012 11:13:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=8X4s4LIPuEMIdqit4skjAD9IB5CMxFs4JtFaHyYCkSM=;
	b=bh4sGl6iMDFEHJOfrsCl7VfaxRglwgQK5g+5mbNv0PJAX/dpUyEGo+GM0+f2ZJpDO0
	75kJThaJ29m2HEu4Dt3cuo1jILYhJ51B8d+sia7M+cl9gBM3o3dBGydVxXmxxNVTVBlb
	NA6V2S71Yp4u7HsulYrQP4kqtovSBPuVKyIHQjahh2Od86v/1SX/DDSrgwNvSeQhTDl5
	jaL8zVEtIClZW3fUtJDZURLu16u1NoGVbDMCw005BgZD2rmuya2t1FLAnH7/FcleblQj
	EHe8w1RqJk6IJwobpSatczZ3iuQlTt5VWkRaTlvsTsbiEM06vQ3JXVFi7nboW/ZP5sn0
	tOQA==
Received: by 10.50.217.193 with SMTP id pa1mr18270591igc.39.1342116827059;
	Thu, 12 Jul 2012 11:13:47 -0700 (PDT)
Received: from otp-agherzan-l1.corp.ad.wrs.com ([89.121.200.106])
	by mx.google.com with ESMTPS id if4sm35476igc.10.2012.07.12.11.13.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Jul 2012 11:13:46 -0700 (PDT)
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jul 2012 21:13:36 +0300
Message-Id: <065917316a9ae48c5cee6f11bedfd2df38e85a7a.1342116650.git.andrei@gherzan.ro>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <5f8d84b63b15ef27f5bad8187db54cdd7d55fea6.1342116650.git.andrei@gherzan.ro>
References: <5f8d84b63b15ef27f5bad8187db54cdd7d55fea6.1342116650.git.andrei@gherzan.ro>
In-Reply-To: <cover.1342116650.git.andrei@gherzan.ro>
References: <cover.1342116650.git.andrei@gherzan.ro>
X-Gm-Message-State: ALoCoQmWRclIjWIvxyABbT6uOpXpu6a8+hPMU7kGKD7ZkTN/K3gYxU7WHHrb8dX86Uc1SyHcVGW3
Subject: [PATCH 2/3] image_types.bbclass: Add XZ variable to set number of threads to be used while compressing
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
X-List-Received-Date: Thu, 12 Jul 2012 18:25:05 -0000

Default this variable to 0. This will make xz use as many threads as there are CPU
cores on the system.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
---
 meta/classes/image_types.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 0e79820..b19ad3b 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -124,6 +124,7 @@ def imagetypes_getdepends(d):
 
 XZ_COMPRESSION_LEVEL ?= "-e -9"
 XZ_INTEGRITY_CHECK ?= "crc32"
+XZ_THREADS ?= "-T 0"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
 IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
@@ -236,7 +237,7 @@ COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.9.5



