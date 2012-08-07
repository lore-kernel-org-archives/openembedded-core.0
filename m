Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SyefQ-0007n0-8t
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Aug 2012 09:57:28 +0200
Received: by mail-ey0-f175.google.com with SMTP id d12so1114468eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Aug 2012 00:45:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=3ldgcjvWDOmToOh8XZmSFzdrQ5zlkzX5TtlquJz6t0s=;
	b=KdN2Z0UyoxijaSlvvT4i6M6ZcYrplG7pnpXIK+SZDVe8JSRrkzrSWtaSuQZQSoJtGN
	x4Mu2+ZHcyfOQGkdsRaGMRBcQuP+s3loBdajzPE10MY+RpwAwKEhdYQyG1biXSglYuEs
	zf9xJouz6fVKTb1HbZEZX3BTJp3dml6vRYqk9DdTsst+1xI0oVJqmyRMwEsffDHCdfwZ
	ILA0NW+W4d53lxQ8HJCOTOOKt8CWxgcuKshJe0LXXl27+G3OEKvpWC9q9ZAkgSL+CxBb
	2jPnwKmno2OyfOh3QT7et4j1rkm6svnJw56K3CY9KPpARdWHqU9vnGZSHdmFP+AawWB3
	30wQ==
Received: by 10.14.223.9 with SMTP id u9mr16531311eep.10.1344325544851;
	Tue, 07 Aug 2012 00:45:44 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id 8sm53663771eeg.16.2012.08.07.00.45.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 07 Aug 2012 00:45:43 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Aug 2012 09:44:47 +0200
Message-Id: <1344325488-20479-7-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
References: <1344325488-20479-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnb/MWdy3mxLWpwA004XbI6XlwF8cdw/GsX8Rot2dyXwjtKrzN8xYKGAkzHqw+oP9cGyR46
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [PATCH][for-denzil 7/8] image_types.bbclass: Add XZ variable to set number of threads to be used while compressing
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
X-List-Received-Date: Tue, 07 Aug 2012 07:57:28 -0000

From: Andrei Gherzan <andrei@gherzan.ro>

Default this variable to 0. This will make xz use as many threads as there are CPU
cores on the system.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/image_types.bbclass |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 007c8a5..258be63 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -118,6 +118,7 @@ def imagetypes_getdepends(d):
 
 XZ_COMPRESSION_LEVEL ?= "-e -9"
 XZ_INTEGRITY_CHECK ?= "crc32"
+XZ_THREADS ?= "-T 0"
 
 IMAGE_CMD_jffs2 = "mkfs.jffs2 --root=${IMAGE_ROOTFS} --faketime --output=${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 -n ${EXTRA_IMAGECMD}"
 IMAGE_CMD_sum.jffs2 = "${IMAGE_CMD_jffs2} && sumtool -i ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.jffs2 \
@@ -215,7 +216,7 @@ COMPRESSIONTYPES = "gz bz2 lzma xz"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "bzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
+COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = ""
-- 
1.7.10



