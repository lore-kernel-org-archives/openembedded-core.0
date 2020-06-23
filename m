Received: from mail-ej1-f68.google.com (mail-ej1-f68.google.com [209.85.218.68])
 by mx.groups.io with SMTP id smtpd.web12.16880.1592946542950437786
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 14:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=TgChxssX;
 spf=pass (domain: gmail.com, ip: 209.85.218.68, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f68.google.com with SMTP id i14so178467ejr.9
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jun 2020 14:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1gys1ODiu9ShUy0TRhCfV7KNYzjj2NH5po8qo7rh+M=;
        b=TgChxssXvkLs3yV297EBbIGnnx9uv+PJx2IFg47adjx142nDrjLZ3ssLh7Tzy4vc7T
         Zdl8NdJ+rkWGplB9sXzBeaRyf/xwIfSW6VDh997edPRytGF6a/0w6nQJoST2frKxYgUm
         /QPbjLX+xzFZCqIDEGHCJYtmaVg+BkiM3WnrznzV3c75pF5spqo8Dw8LIpYBUCEDZHXx
         goOElJ3oL9l2OYREYCssQL2AyvZsuHIYcIk1pOFHWoxbcEMXMTFg8Ol9ATt4aITTXdXz
         USGpumMx2eT7OfLj4Xe/48baj/8fossD4cldn3TljJwuevlzBkOYaXRX335aFDtPA3LH
         RIvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=u1gys1ODiu9ShUy0TRhCfV7KNYzjj2NH5po8qo7rh+M=;
        b=ttlAR/04yBQRQ6SVby0udYO5JEcTSkkZHeWT56venP91eZvcRnZZ0u6g8JkleU6+Wd
         Dog7qiQ9Fgpa5y9CuaMtxX8m0QAs9Y5K/MnVgY1uqdia8/1WYVl2G9qsWdl6r0KCzd2f
         B+nslCsTsVL9bvBOwi4UqYOhoIM0bPsqxXneeWEk63P5LEqie8kNfvBW4PHoqfSfSGkM
         PgNUvCB6It+f6dHXvKs/Gc6nvEOt9Xf9qju22ku+/FFoK3ImlxSyfU6YDHa9EIqBElmE
         0FCxziW/v5dzwahJlPFQOJRez+G729Ieg9eVcu2nhmgAySHawur+WXZTI68pKeFsYpKo
         KlLw==
X-Gm-Message-State: AOAM530/XfsQyF8/ncYM5ElXbDPO05iR5l5HbAT4KtyMJ60YMXM4p/Gb
	19+ygv+GykftdcooHsF0/KVDHT1nt1U=
X-Google-Smtp-Source: ABdhPJzZR0j2+9OY/S3cUweHPs1LXZv1lh1N8FMT516HvdqG8+qlcxrDrJHLzHdoaGYWtfI/nBXBtw==
X-Received: by 2002:a17:906:dce:: with SMTP id p14mr7814326eji.442.1592946540978;
        Tue, 23 Jun 2020 14:09:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id q3sm136435ejb.118.2020.06.23.14.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2020 14:09:00 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/2] icu: merge .inc into main recipe
Date: Tue, 23 Jun 2020 23:08:36 +0200
Message-Id: <20200623210837.26222-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both parts are rather convoluted, so it is better to have them in a single file.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-support/icu/icu.inc     | 84 ---------------------------
 meta/recipes-support/icu/icu_67.1.bb | 85 +++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-support/icu/icu.inc

diff --git a/meta/recipes-support/icu/icu.inc b/meta/recipes-support/icu/icu.inc
deleted file mode 100644
index 6d9728903d..0000000000
--- a/meta/recipes-support/icu/icu.inc
+++ /dev/null
@@ -1,84 +0,0 @@
-SUMMARY = "International Component for Unicode libraries"
-DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
-portable set of C/C++ and Java libraries for Unicode support, software \
-internationalization (I18N) and globalization (G11N), giving applications the \
-same results on all platforms."
-HOMEPAGE = "http://site.icu-project.org/"
-
-LICENSE = "ICU"
-DEPENDS = "icu-native"
-DEPENDS_class-native = ""
-
-CVE_PRODUCT = "international_components_for_unicode"
-
-S = "${WORKDIR}/icu/source"
-SPDX_S = "${WORKDIR}/icu"
-STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
-
-BINCONFIG = "${bindir}/icu-config"
-
-ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
-
-inherit autotools pkgconfig binconfig multilib_script
-
-MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
-
-# ICU needs the native build directory as an argument to its --with-cross-build option when
-# cross-compiling. Taken the situation that different builds may share a common sstate-cache
-# into consideration, the native build directory needs to be staged.
-EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
-EXTRA_OECONF_class-native = ""
-EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
-
-EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
-
-ASNEEDED = ""
-
-do_compile_prepend_class-target () {
-	# Make sure certain build host references do not end up being compiled
-	# in the image. This only affects libicutu and icu-dbg
-	sed  \
-	    -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
-	    -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -i ${B}/tools/toolutil/Makefile
-}
-
-PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
-do_install_append_class-native() {
-	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
-	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
-	cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
-	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
-	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
-	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
-}
-
-do_install_append_class-target() {
-    # The native pkgdata can not generate the correct data file.
-    # Use icupkg to re-generate it.
-    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
-        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
-        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
-    fi
-	
-	# Remove build host references...
-	sed -i  \
-	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-	    -e 's|${DEBUG_PREFIX_MAP}||g' \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
-	    ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
-}
-
-PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
-
-FILES_${PN}-dev += "${libdir}/${BPN}/"
-
-FILES_libicudata = "${libdir}/libicudata.so.*"
-FILES_libicuuc = "${libdir}/libicuuc.so.*"
-FILES_libicui18n = "${libdir}/libicui18n.so.*"
-FILES_libicutu = "${libdir}/libicutu.so.*"
-FILES_libicuio = "${libdir}/libicuio.so.*"
-
-BBCLASSEXTEND = "native nativesdk"
diff --git a/meta/recipes-support/icu/icu_67.1.bb b/meta/recipes-support/icu/icu_67.1.bb
index 58638507c9..5814fa41bd 100644
--- a/meta/recipes-support/icu/icu_67.1.bb
+++ b/meta/recipes-support/icu/icu_67.1.bb
@@ -1,4 +1,87 @@
-require icu.inc
+SUMMARY = "International Component for Unicode libraries"
+DESCRIPTION = "The International Component for Unicode (ICU) is a mature, \
+portable set of C/C++ and Java libraries for Unicode support, software \
+internationalization (I18N) and globalization (G11N), giving applications the \
+same results on all platforms."
+HOMEPAGE = "http://site.icu-project.org/"
+
+LICENSE = "ICU"
+DEPENDS = "icu-native"
+DEPENDS_class-native = ""
+
+CVE_PRODUCT = "international_components_for_unicode"
+
+S = "${WORKDIR}/icu/source"
+SPDX_S = "${WORKDIR}/icu"
+STAGING_ICU_DIR_NATIVE = "${STAGING_DATADIR_NATIVE}/${BPN}/${PV}"
+
+BINCONFIG = "${bindir}/icu-config"
+
+ICU_MAJOR_VER = "${@d.getVar('PV').split('.')[0]}"
+
+inherit autotools pkgconfig binconfig multilib_script
+
+MULTILIB_SCRIPTS = "${PN}-dev:${bindir}/icu-config"
+
+# ICU needs the native build directory as an argument to its --with-cross-build option when
+# cross-compiling. Taken the situation that different builds may share a common sstate-cache
+# into consideration, the native build directory needs to be staged.
+EXTRA_OECONF = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
+EXTRA_OECONF_class-native = ""
+EXTRA_OECONF_class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE}"
+
+EXTRA_OECONF_append_class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
+TARGET_CXXFLAGS_append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+
+ASNEEDED = ""
+
+do_compile_prepend_class-target () {
+	# Make sure certain build host references do not end up being compiled
+	# in the image. This only affects libicutu and icu-dbg
+	sed  \
+	    -e 's,DU_BUILD=,DU_BUILD_unused=,g' \
+	    -e '/^CPPFLAGS.*/ s,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -i ${B}/tools/toolutil/Makefile
+}
+
+PREPROCESS_RELOCATE_DIRS = "${datadir}/${BPN}/${PV}"
+do_install_append_class-native() {
+	mkdir -p ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/config/icucross.mk ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/config/icucross.inc ${D}/${STAGING_ICU_DIR_NATIVE}/config
+	cp -r ${B}/lib ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/bin ${D}/${STAGING_ICU_DIR_NATIVE}
+	cp -r ${B}/tools ${D}/${STAGING_ICU_DIR_NATIVE}
+}
+
+do_install_append_class-target() {
+    # The native pkgdata can not generate the correct data file.
+    # Use icupkg to re-generate it.
+    if [ "${SITEINFO_ENDIANNESS}" = "be" ] ; then
+        rm -f ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+        icupkg -tb ${S}/data/in/icudt${ICU_MAJOR_VER}l.dat ${D}/${datadir}/${BPN}/${PV}/icudt${ICU_MAJOR_VER}b.dat
+    fi
+	
+	# Remove build host references...
+	sed -i  \
+	    -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
+	    -e 's|${DEBUG_PREFIX_MAP}||g' \
+	    -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${bindir}/icu-config ${D}/${libdir}/${BPN}/${PV}/Makefile.inc \
+	    ${D}/${libdir}/${BPN}/${PV}/pkgdata.inc
+}
+
+PACKAGES =+ "libicudata libicuuc libicui18n libicutu libicuio"
+
+FILES_${PN}-dev += "${libdir}/${BPN}/"
+
+FILES_libicudata = "${libdir}/libicudata.so.*"
+FILES_libicuuc = "${libdir}/libicuuc.so.*"
+FILES_libicui18n = "${libdir}/libicui18n.so.*"
+FILES_libicutu = "${libdir}/libicutu.so.*"
+FILES_libicuio = "${libdir}/libicuio.so.*"
+
+BBCLASSEXTEND = "native nativesdk"
 
 LIC_FILES_CHKSUM = "file://../LICENSE;md5=a3808a5b70071b07f87ff2205e4d75a0"
 
-- 
2.27.0

