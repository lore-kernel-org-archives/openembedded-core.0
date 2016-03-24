Return-Path: <kad@kad.name>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 3CC7560621
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 20:16:59 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id p65so883007wmp.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Mar 2016 13:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kad-name.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YyzAOq26SC3sQ6c9kAMABURgTwXxPwyws6q4tWL8t0A=;
	b=13AFE2GKC2acujvA4ctzzoy4byuuI7sElqgbIax53b/rMa5VwP7iT+wRHDfN4lVJn+
	3fE5tvUK7YaD+ZM2+2EALStSCuR5D709CsM7QKdfvrtCBFY06YzANRB60lG/v0NffrLY
	zDLizBcV9j/h4hnakYiKDFnF6q/A3kueWrCLWWoBiFGyv98WWhqfbNlX5XkWmNBBRZm2
	Mvl0fhTPJTBXwAc8ge/15AB+hk5YuqSoUn8BzgIs248LO0vWZGNiuLsEB121Ob+zd9VT
	Yb6kXcUgkKcfWdjWVRb7LJYw1FB5WvBtHK4Jf1ndHWpeUFeh7wsyQKfMZg39UKXhsPh+
	xjGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YyzAOq26SC3sQ6c9kAMABURgTwXxPwyws6q4tWL8t0A=;
	b=ab0Nx/XzS1FCe7kzc+2b9rwxfvzGm7fuaRGYrwq/QaPxlHbzWPaD4DrycDKBAmGQPw
	W53F1e8aY+GnQ5I9hevq1FJIEiasK+AUhPh50CyiRqDtXie6cvAarA128+f9xHt7xSy1
	TRPqfh8T/oI3EuprPQmoNFHyK2HioDFVga8pBExRQWWvVMrn5VZEURmmn8Q9yeqUxiZF
	Yu+g3Ji9Wu+m2oNipRIkTve/itU17MC3U0hF2uO4tC3sE402LS3Q+vJ38WqdyfqBLjr2
	D1IAg3kyQC5nMcMVeD4RoQFBkgBL3K9dAm3QMQ+44n5Qlc5zv6S6Z0IcxVBi03QDMJnv
	fERA==
X-Gm-Message-State: AD7BkJIMM6sft/+Hml5AMlrpdbl0kgTC5bFLIl/YTmV+AM3S23TDGIp/6dIfSSJP2vSK7Q==
X-Received: by 10.194.22.97 with SMTP id c1mr11736941wjf.19.1458850620361;
	Thu, 24 Mar 2016 13:17:00 -0700 (PDT)
Received: from localhost.localdomain (dsl-hkibrasgw3-54fb77-110.dhcp.inet.fi.
	[84.251.119.110]) by smtp.gmail.com with ESMTPSA id
	hh8sm8826815wjc.42.2016.03.24.13.16.58
	(version=TLS1 cipher=AES128-SHA bits=128/128);
	Thu, 24 Mar 2016 13:16:59 -0700 (PDT)
From: "Alexander D. Kanevskiy" <kad@kad.name>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Mar 2016 22:16:48 +0200
Message-Id: <1458850608-50481-1-git-send-email-kad@kad.name>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] image_types: use compress framework to produce checksums for images
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
X-List-Received-Date: Thu, 24 Mar 2016 20:17:01 -0000

Existing compress framework for producing various compressed versions
of images is powerfull enough to be extended for other uses, e.g. to
convert types of images.

It is possible to use it also to produce image checksums at the time
of image generation. This commit adds support for all supported
at the moment coreutils hashing algorithms: md5, sha1, sha224,
sha256, sha384 and sha512

Usage:
IMAGE_FSTYPES_append = " hddimg.sha256sum"

Signed-off-by: Alexander D. Kanevskiy <kad@kad.name>
---
 meta/classes/image_types.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 22719ad..3e98024 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -259,13 +259,19 @@ IMAGE_TYPES = " \
     wic wic.gz wic.bz2 wic.lzma \
 "
 
-COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
+COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum md5sum sha1sum sha224sum sha256sum sha384sum sha512sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz"
 COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}"
 COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz"
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.lz4"
 COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
+COMPRESS_CMD_md5sum = "md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.md5sum"
+COMPRESS_CMD_sha1sum = "sha1sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha1sum"
+COMPRESS_CMD_sha224sum = "sha224sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha224sum"
+COMPRESS_CMD_sha256sum = "sha256sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha256sum"
+COMPRESS_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha384sum"
+COMPRESS_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = "pbzip2-native"
-- 
2.7.4


