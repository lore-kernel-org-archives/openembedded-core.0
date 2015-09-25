Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id C632E73BB8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Sep 2015 05:00:00 +0000 (UTC)
Received: by qgev79 with SMTP id v79so61620150qge.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 22:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DGBfrY2fwy81xvp6BKuXrxhrHHfEwIPkG8frjuCSJ0g=;
	b=xRsjOeO7mC6VZhw9lPIXFRWD1e7GSkw/Gk2aRfPPGV3O7j4uZN8TS80iFJvowlxgYC
	9ktHqje7OPNqzLBk9Rg5dp+n4rzgYSPnBsbk4y8gNRpe76HgvzoqNhx1fBX0EiqguwOn
	WGPgPszerEkgnTwmLICjZTx0FvjgIOg8vAWXbMNyuD5HJ9IrbBE2LR/YHUpb+xcLAWDh
	N7J5xlZqksRl99EjyhT2TRaknttFt9cIIcTC/4QYILRi7UdLYI00i01X82p6YkDYdGrt
	8XZRxwwDT7JSTGXyuNlGbLukgdenJhmv8x4LsnmrN9U1USYoh7gYqmp/Y6Hxr1AZEbV5
	x5Aw==
X-Received: by 10.140.234.130 with SMTP id f124mr4012612qhc.103.1443157200655; 
	Thu, 24 Sep 2015 22:00:00 -0700 (PDT)
Received: from ip-96-114-220-84.ae.ccp.cable.comcast.com ([96.114.220.84])
	by smtp.gmail.com with ESMTPSA id
	c188sm768477qka.37.2015.09.24.22.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 24 Sep 2015 22:00:00 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 25 Sep 2015 04:59:14 +0000
Message-Id: <1443157157-33969-3-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 2.5.3
In-Reply-To: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
References: <1443157157-33969-1-git-send-email-raj.khem@gmail.com>
Subject: [PATCH] pxz: Add recipe and use it for xz image type
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
X-List-Received-Date: Fri, 25 Sep 2015 05:00:00 -0000

pxz results in significant time saving when generating xz filetypes for
images due to parallelization support

a simple test on ubuntu build host with 16 CPUs

time xz -M 50% -f -k -c -e -9 --check=crc32 CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz

real
23m42.299s
user 23m36.947s
sys 0m5.101s

time pxz -M 50% -f -k -c -e -9 --check=crc32 CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio >CX041AEI_PROD_default_20150610000105sdy-dbg.rootfs.cpio.xz

real2m59.666s
user 24m38.529s
sys 0m10.056s

Signed-off-by: Khem Raj <raj.khem@gmail.com
---
 meta/classes/image_types.bbclass     |  4 ++--
 meta/recipes-extended/pxz/pxz_git.bb | 31 +++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/pxz/pxz_git.bb

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 306403e..d766cd2 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -233,13 +233,13 @@ COMPRESSIONTYPES = "gz bz2 lzma xz lz4 sum"
 COMPRESS_CMD_lzma = "lzma -k -f -7 ${IMAGE_NAME}.rootfs.${type}"
 COMPRESS_CMD_gz = "gzip -f -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.gz"
 COMPRESS_CMD_bz2 = "pbzip2 -f -k ${IMAGE_NAME}.rootfs.${type}"
-COMPRESS_CMD_xz = "xz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
+COMPRESS_CMD_xz = "pxz -f -k -c ${XZ_COMPRESSION_LEVEL} ${XZ_THREADS} --check=${XZ_INTEGRITY_CHECK} ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.xz"
 COMPRESS_CMD_lz4 = "lz4c -9 -c ${IMAGE_NAME}.rootfs.${type} > ${IMAGE_NAME}.rootfs.${type}.lz4"
 COMPRESS_CMD_sum = "sumtool -i ${IMAGE_NAME}.rootfs.${type} -o ${IMAGE_NAME}.rootfs.${type}.sum ${JFFS2_SUM_EXTRA_ARGS}"
 COMPRESS_DEPENDS_lzma = "xz-native"
 COMPRESS_DEPENDS_gz = ""
 COMPRESS_DEPENDS_bz2 = "pbzip2-native"
-COMPRESS_DEPENDS_xz = "xz-native"
+COMPRESS_DEPENDS_xz = "pxz-native"
 COMPRESS_DEPENDS_lz4 = "lz4-native"
 COMPRESS_DEPENDS_sum = "mtd-utils-native"
 
diff --git a/meta/recipes-extended/pxz/pxz_git.bb b/meta/recipes-extended/pxz/pxz_git.bb
new file mode 100644
index 0000000..fe21be6
--- /dev/null
+++ b/meta/recipes-extended/pxz/pxz_git.bb
@@ -0,0 +1,31 @@
+# Copyright (C) 2015 Khem Raj <raj.khem@gmail.com>
+# Released under the MIT license (see COPYING.MIT for the terms)
+
+SUMMARY = "Parallel LZMA compressor compatible with XZ"
+DESCRIPTION = "Parallel XZ is a compression utility that takes advantage of running LZMA compression of different parts of an input file on multiple cores and processors simultaneously. Its primary goal is to utilize all resources to speed up compression time with minimal possible influence on compression ratio"
+HOMEPAGE = "https://jnovy.fedorapeople.org/pxz/"
+LICENSE = "GPL-2.0+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+SECTION = "console/utils"
+DEPENDS = "xz"
+
+SRCREV = "ae808463c2950edfdedb8fb49f95006db0a18667"
+PV = "4.999.9beta+git${SRCPV}"
+SRC_URI = "git://github.com/jnovy/pxz.git"
+
+S = "${WORKDIR}/git"
+
+CFLAGS_append = " -fopenmp -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE"
+LDFLAGS_append = " -llzma"
+
+do_compile ()  {
+	oe_runmake
+}
+
+do_install ()  {
+	oe_runmake DESTDIR=${D} INSTALL="install -p"
+}
+
+deltask do_configure
+
+BBCLASSEXTEND = "native"
-- 
2.5.3


