Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SrkfI-0004tM-N7
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Jul 2012 08:56:48 +0200
Received: by wgbdr1 with SMTP id dr1so1904495wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 23:45:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:x-gm-message-state;
	bh=3ldgcjvWDOmToOh8XZmSFzdrQ5zlkzX5TtlquJz6t0s=;
	b=aWHgBETSZ9zk0EBAFIlN4chxLnpuUYs+MB/SADK4YuGY9R1nffDCpnJ78G5M1lqNZt
	y43u4gpc1VAO3ovYc0OtzpsVoV78YZWZ59C2ZOeDHDWz3F5rHVA3zSLuZu5DrHFH+ti7
	7UYy9ZmmULfakCMFL+6izey/xOTGau0yCnZH9JosACEjVlchzGMIWnOCPAwizBL+gJmC
	+Z04TGF/aWOpVezO9f5IdLvrmUzRPESjg6LRji1etzyOFI59/Keev5zXMdPvMjMAeGUn
	Wf4pRSLA8XtnvFq3qWcoq8BHOJDkxGTHR3hapFglmT0V1frpuclTS626JfxL7F9Fo1AH
	zg4w==
Received: by 10.216.240.10 with SMTP id d10mr405838wer.157.1342680327387;
	Wed, 18 Jul 2012 23:45:27 -0700 (PDT)
Received: from localhost (cl-267.ams-05.nl.sixxs.net. [2001:610:600:10a::2])
	by mx.google.com with ESMTPS id j4sm2961471eeo.11.2012.07.18.23.45.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 23:45:26 -0700 (PDT)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Jul 2012 08:44:45 +0200
Message-Id: <1342680286-12886-4-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
References: <1342680286-12886-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkFlG14lSjQls+K3QEo+TF3HfxHJknJUTOzRRRh6DIgzwSGPxMPxxlSr469CEcasnw+ZU6k
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [for-denzil][PATCH 4/5] image_types.bbclass: Add XZ variable to set number of threads to be used while compressing
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
X-List-Received-Date: Thu, 19 Jul 2012 06:56:48 -0000

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



