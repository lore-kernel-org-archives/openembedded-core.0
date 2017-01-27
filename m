Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 02DBB77442
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jan 2017 17:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHgEkc019780; Fri, 27 Jan 2017 17:42:14 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id ZK-3GeD3ki6u; Fri, 27 Jan 2017 17:42:14 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	v0RHg9U8019761
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 27 Jan 2017 17:42:10 GMT
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1cXAXJ-0001WP-ME; Fri, 27 Jan 2017 17:42:09 +0000
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jan 2017 17:42:03 +0000
Message-Id: <1485538927-5797-3-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1485538927-5797-1-git-send-email-richard.purdie@linuxfoundation.org>
Subject: [PATCH 3/7] gzip/pigz/expat/image: Simplify gzip-native/pigz-native
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
X-List-Received-Date: Fri, 27 Jan 2017 17:42:17 -0000

With recipe specific sysroots, the gzip-replacement-native dance/class
is obsolete, simplify the code accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/gzipnative.bbclass          | 5 -----
 meta/classes/image.bbclass               | 2 --
 meta/classes/image_types.bbclass         | 2 +-
 meta/recipes-core/expat/expat.inc        | 6 +++---
 meta/recipes-extended/gzip/gzip_1.8.bb   | 1 -
 meta/recipes-extended/pigz/pigz_2.3.4.bb | 2 --
 6 files changed, 4 insertions(+), 14 deletions(-)
 delete mode 100644 meta/classes/gzipnative.bbclass

diff --git a/meta/classes/gzipnative.bbclass b/meta/classes/gzipnative.bbclass
deleted file mode 100644
index 326cbbb..0000000
--- a/meta/classes/gzipnative.bbclass
+++ /dev/null
@@ -1,5 +0,0 @@
-EXTRANATIVEPATH += "pigz-native gzip-native"
-DEPENDS += "gzip-native"
-
-# tar may get run by do_unpack or do_populate_lic which could call gzip
-do_unpack[depends] += "gzip-native:do_populate_sysroot"
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index b4e5432..0ffe99f 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -9,8 +9,6 @@ TOOLCHAIN_TARGET_TASK += "${PACKAGE_INSTALL}"
 TOOLCHAIN_TARGET_TASK_ATTEMPTONLY += "${PACKAGE_INSTALL_ATTEMPTONLY}"
 POPULATE_SDK_POST_TARGET_COMMAND += "rootfs_sysroot_relativelinks; "
 
-inherit gzipnative
-
 LICENSE = "MIT"
 PACKAGES = ""
 DEPENDS += "${MLPREFIX}qemuwrapper-cross depmodwrapper-cross"
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index ddd52f1..005d1e2 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -359,7 +359,7 @@ CONVERSION_CMD_sha384sum = "sha384sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}
 CONVERSION_CMD_sha512sum = "sha512sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.sha512sum"
 CONVERSION_CMD_bmap = "bmaptool create ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type} -o ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.bmap"
 CONVERSION_DEPENDS_lzma = "xz-native"
-CONVERSION_DEPENDS_gz = ""
+CONVERSION_DEPENDS_gz = "pigz-native"
 CONVERSION_DEPENDS_bz2 = "pbzip2-native"
 CONVERSION_DEPENDS_xz = "xz-native"
 CONVERSION_DEPENDS_lz4 = "lz4-native"
diff --git a/meta/recipes-core/expat/expat.inc b/meta/recipes-core/expat/expat.inc
index fe9d7e7..9fa0ca2 100644
--- a/meta/recipes-core/expat/expat.inc
+++ b/meta/recipes-core/expat/expat.inc
@@ -7,12 +7,12 @@ LICENSE = "MIT"
 SRC_URI = "${SOURCEFORGE_MIRROR}/expat/expat-${PV}.tar.bz2 \
            file://autotools.patch \
 	  "
-
-inherit autotools lib_package gzipnative
+inherit autotools lib_package
 
 # This package uses an archive format known to have issue with some
 # versions of gzip
-do_unpack[depends] += "gzip-native:do_populate_sysroot"
+DEPENDS += "pigz-native"
+do_unpack[depends] += "pigz-native:do_populate_sysroot"
 
 do_configure_prepend () {
 	rm -f ${S}/conftools/libtool.m4
diff --git a/meta/recipes-extended/gzip/gzip_1.8.bb b/meta/recipes-extended/gzip/gzip_1.8.bb
index a19b965..11be846 100644
--- a/meta/recipes-extended/gzip/gzip_1.8.bb
+++ b/meta/recipes-extended/gzip/gzip_1.8.bb
@@ -9,7 +9,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://gzip.h;beginline=8;endline=20;md5=6e47caaa630e0c8bf9f1bc8d94a8ed0e"
 
 PROVIDES_append_class-native = " gzip-replacement-native"
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
 
 BBCLASSEXTEND = "native"
 
diff --git a/meta/recipes-extended/pigz/pigz_2.3.4.bb b/meta/recipes-extended/pigz/pigz_2.3.4.bb
index 87b61bf..53c56c5 100644
--- a/meta/recipes-extended/pigz/pigz_2.3.4.bb
+++ b/meta/recipes-extended/pigz/pigz_2.3.4.bb
@@ -7,7 +7,5 @@ SRC_URI = "https://github.com/madler/pigz/archive/v${PV}.tar.gz"
 SRC_URI[md5sum] = "c109057050b15edf3eb9bb4d0805235e"
 SRC_URI[sha256sum] = "763f2fdb203aa0b7b640e63385e38e5dd4e5aaa041bc8e42aa96f2ef156b06e8"
 
-NATIVE_PACKAGE_PATH_SUFFIX = "/${PN}"
-
 BBCLASSEXTEND = "native nativesdk"
 
-- 
2.7.4


