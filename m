Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7731A103A9B1
	for <webhook@archiver.kernel.org>; Wed, 25 Mar 2026 11:31:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19961.1774438291923797961
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 04:31:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HigCo4pr;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so46478265e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 04:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774438290; x=1775043090; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UstkksMKHqFicv9Rvxi4gvDU3++3BkTN4cPcY+3GxSY=;
        b=HigCo4prMZCcm2M1ZpCssQKb5HV1hC8J3FAM9sUZv9Cr1KpI3SPvpUVayCUpxWUWVD
         i4HiIh4mPUmYoRcfKRPLRreEjEqcH3h+0YUmWjp3p5BnQcAqzc14IpZssYmIbpuo8WjD
         13dSeEq9ZeyXRXJ2x7i1NzUlSIxiKLpHm609MKxjbisdWtu6OEjt3d8fa/J5yvgS2niq
         fLz0akjqxHyOPV8VyGdGwPsTTsCmYO9EP71AfKINH47hTECQ3r7iXDbeCErNEQj0s1wu
         s47Zi5lt5OXC7sdqpBokXI/xLCv+yT6iELpiWIHJc/E3QLFyz3Yav3hmUzkcEyg1egeQ
         0xuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774438290; x=1775043090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UstkksMKHqFicv9Rvxi4gvDU3++3BkTN4cPcY+3GxSY=;
        b=kt93qk6n/7604Wrtfc8i6IyjCGWtM14QCR91YFIS+9VWO1n+V4T4dO2nbkLLoXR8RP
         QUGA6Vt72hl7qF7EsMK5vkoNUkBdkf5zm8v0yvk/vdmnuN10oEFB1Wo6E/O2StPfmsdx
         aTzFD6hBDpLxxbtOGrtAJkK628ktBXMcv1UHtfhXwycgrFdGtlg6c5epCjobKOjF/SuJ
         Y2o7888aRIa1hC91I5yJGD35JJ0OU8MNNie54+aV1ZIdb/OYusnimlJHvQmenOGMNZu0
         ITdD1t/tIcGYN7uQe6DUtEZNYGIRUREsbdk8RHsLU7NWfqT/Pr9vIkOzXd2zetPKkKKd
         YzBA==
X-Gm-Message-State: AOJu0YzxfXlywRW1kDaOC5m3nDbbXOHPoC4fLUNfngZ8aR1M7SzKwt4k
	RW3ys3dUxHUpbStkF9o6Ywlym/xydMjIYtGUuaJqYskjtdFfuR6EqAuqUI9bsw==
X-Gm-Gg: ATEYQzzkC/56KORKWGIqLDtHt6x4+PWNWdWhIb9xqshml+Z4UFzgZYDOb7I2IL8f6Ox
	7xId0d6mUYBmub39VmZYI6HEvkLGw64IVrvD3R/YuboCDa2YNQAff8PTuXIradTuD0qCuh+B8a4
	kejPM22qrHrD/i0HtA9eyH4jaqesAq0V/J4zoQtWPwdeQ9XtgpyDy+RUpGt+M0D6kkl/1wnaJVK
	hRfrYe91I+vzlrP66ET82YqQLpcC68Ww+cnRHIA6xU3RxVi8hGnsMs+pnENn4oB2Dr+h00Yoi5F
	f6Ow/cW1rBBQXt99/f5bWEOAuWv7ESxrBGrdi8nIa7hJ73NugEC8wXJ/5fX7pvcxo4dsxrG6dHA
	GIA8u0o58vj4DkMdJ97rUAaiWTcwrgKCBwSFrkwYTUV+04AM5wYbAZYFD3EOqbTpBfUE5oH/j1M
	UfuHMOlDnQ9CTiRA==
X-Received: by 2002:a05:600c:8b2a:b0:485:2a85:e5ec with SMTP id 5b1f17b1804b1-48715fc36aemr45271575e9.2.1774438289838;
        Wed, 25 Mar 2026 04:31:29 -0700 (PDT)
Received: from term011.lan (95C810F6.dsl.pool.telekom.hu. [149.200.16.246])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711693a08sm170539955e9.2.2026.03.25.04.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 04:31:28 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [RFC][PATCH 02/14] python3: Adapt recipe to freethreading
Date: Wed, 25 Mar 2026 12:24:12 +0100
Message-ID: <20260325113112.1163632-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260325113112.1163632-1-zboszor@gmail.com>
References: <20260325113112.1163632-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Mar 2026 11:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233876

Set the previously added PACKAGECONFIG[freethreading] based on
the new DISTRO_FEATURE=python_freethreading.

Now inherit python3-dir. The PYTHON_MAJMIN private variable was
removed, and its usages were replaced with the proper variables
from python3-dir.bbclass to simplify the settings and for
consistency.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3_3.14.3.bb | 61 ++++++++++---------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-devtools/python/python3_3.14.3.bb b/meta/recipes-devtools/python/python3_3.14.3.bb
index 7a1ad1e386..59e4412b71 100644
--- a/meta/recipes-devtools/python/python3_3.14.3.bb
+++ b/meta/recipes-devtools/python/python3_3.14.3.bb
@@ -47,19 +47,17 @@ UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
 
 CVE_PRODUCT = "python:python python_software_foundation:python cpython"
 
-PYTHON_MAJMIN = "3.14"
-
 S = "${UNPACKDIR}/Python-${PV}"
 
 BBCLASSEXTEND = "native nativesdk"
 
-inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+inherit autotools pkgconfig qemu python3-dir ptest multilib_header update-alternatives
 
 MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
 
 ALTERNATIVE:${PN}-dev = "python3-config"
-ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
-ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
+ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/${PYTHON_DIR}-config"
+ALTERNATIVE_TARGET[python3-config] = "${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}"
 
 DEPENDS = "\
     autoconf-archive-native \
@@ -86,7 +84,7 @@ EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
 EXTRA_OECONF:append:class-target = " --with-build-python=nativepython3 PLATFORM_TRIPLET=${HOST_ARCH}-${HOST_OS}"
 EXTRA_OECONF:append:class-nativesdk = " --with-build-python=nativepython3"
 
-export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+export CROSSPYTHONPATH = "${STAGING_LIBDIR_NATIVE}/${PYTHON_DIR}/lib-dynload/"
 
 EXTRANATIVEPATH += "python3-native"
 
@@ -111,7 +109,10 @@ CACHED_CONFIGUREVARS:append:libc-musl = "\
 "
 
 # PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
-PACKAGECONFIG ??= "editline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+PACKAGECONFIG ??= "editline gdbm \
+    ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'python_freethreading', 'freethreading', '', d)} \
+"
 PACKAGECONFIG[freethreading] = "--disable-gil,--enable-gil"
 PACKAGECONFIG[readline] = "--with-readline=readline,,readline,,,editline"
 PACKAGECONFIG[editline] = "--with-readline=editline,,libedit,,,readline"
@@ -178,7 +179,7 @@ do_install:prepend() {
 }
 
 do_install:append:class-target() {
-        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+        oe_multilib_header ${PYTHON_DIR}/pyconfig.h
 }
 
 do_install:append:class-native() {
@@ -203,20 +204,20 @@ do_install:append:class-native() {
 
         # Nothing should be looking into ${B} for python3-native
         sed -i -e 's:${B}:/build/path/unavailable/:g' \
-                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
+                ${D}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile
 
         # disable the lookup in user's site-packages globally
-        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/python${PYTHON_MAJMIN}/site.py
+        sed -i 's#ENABLE_USER_SITE = None#ENABLE_USER_SITE = False#' ${D}${libdir}/${PYTHON_DIR}/site.py
 
         # python3-config needs to be in /usr/bin and not in a subdir of it to work properly
         mv ${D}/${bindir}/${PN}/python*config ${D}/${bindir}/
 }
 
 do_install:append() {
-        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${D}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
-        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
+        rm -f ${D}${libdir}/${PYTHON_DIR}/__pycache__/_sysconfigdata*.cpython*
 
         mkdir -p ${D}${libdir}/python-sysconfigdata
         sysconfigfile=`find ${D} -name _sysconfig*.py`
@@ -224,8 +225,8 @@ do_install:append() {
                 -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
                 -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
                 -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
-                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
-                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/python${PYTHON_MAJMIN}'\,,g" \
+                -e "s,^ 'INCLUDEPY'.*, 'INCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
+                -e "s,^ 'CONFINCLUDEPY'.*, 'CONFINCLUDEPY': '${STAGING_INCDIR}/${PYTHON_DIR}'\,,g" \
                 -e "s,${B},/build/path/unavailable/,g" \
                 $sysconfigfile
         cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
@@ -241,7 +242,7 @@ do_install:append:class-nativesdk () {
     for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
          sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
     done
-    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+    create_wrapper ${D}${bindir}/${PYTHON_DIR} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
 }
 
 do_install_ptest:append:class-target:libc-musl () {
@@ -257,7 +258,7 @@ SYSROOT_PREPROCESS_FUNCS:append:class-nativesdk = " provide_target_config_script
 provide_target_config_script() {
         install -d ${SYSROOT_DESTDIR}${prefix}/python-target-config/
         install ${D}/${bindir}/python3-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
-        install ${D}/${bindir}/python${PYTHON_MAJMIN}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
+        install ${D}/${bindir}/${PYTHON_DIR}-config ${SYSROOT_DESTDIR}/${prefix}/python-target-config/
 }
 SYSROOT_DIRS += "${prefix}/python-target-config/"
 
@@ -280,13 +281,13 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
-                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
-                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
+                ${PKGD}/${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}*/Makefile \
+                ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py \
+                ${PKGD}/${bindir}/${PYTHON_DIR}-config
 
         # Reformat _sysconfigdata after modifying it so that it remains
         # reproducible
-        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+        for c in ${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfigdata*.py; do
             python3 ${UNPACKDIR}/reformat_sysconfig.py $c
         done
 
@@ -301,7 +302,7 @@ py_package_preprocess () {
              -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
         cd -
 
-        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
+        mv ${PKGD}/${bindir}/${PYTHON_DIR}-config ${PKGD}/${bindir}/${PYTHON_DIR}-config-${MULTILIB_SUFFIX}
 
         #Remove the unneeded copy of target sysconfig data
         rm -rf ${PKGD}/${libdir}/python-sysconfigdata
@@ -313,7 +314,7 @@ py_package_preprocess () {
                 -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
                 -e 's:${RECIPE_SYSROOT}::g' \
                 -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
-		${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfig_vars*.json
+		${PKGD}/${libdir}/${PYTHON_DIR}/_sysconfig_vars*.json
 }
 
 # We want bytecode precompiled .py files (.pyc's) by default
@@ -414,7 +415,7 @@ do_create_manifest() {
     cp ${UNPACKDIR}/get_module_deps3.py ${WORKDIR}
     cd ${WORKDIR}
     # This needs to be executed by python-native and NOT by HOST's python
-    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
+    nativepython3 create_manifest3.py ${PYTHON_MAINVERSION}
     cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
 }
 
@@ -429,11 +430,12 @@ RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX
 
 # For historical reasons PN is empty and provided by python3-modules
 FILES:${PN} = ""
+FILES:${PN}-core += "${bindir}/python${PYTHON_MAINVERSION} ${bindir}/python${PYTHON_BASEVERSION}"
 RPROVIDES:${PN}-modules = "${PN}"
 
-FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
-FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
-FILES:${PN}-tkinter += "${libdir}/python${PYTHON_MAJMIN}/lib-dynload/_tkinter.*.so"
+FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAINVERSION} ${bindir}/pydoc3"
+FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAINVERSION}"
+FILES:${PN}-tkinter += "${libdir}/${PYTHON_DIR}/lib-dynload/_tkinter.*.so"
 
 # provide python-pyvenv from python3-venv
 RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
@@ -441,13 +443,14 @@ RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
 # package libpython3
 PACKAGES =+ "libpython3 libpython3-staticdev"
 FILES:libpython3 = "${libdir}/libpython*.so.*"
-FILES:libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+FILES:libpython3-staticdev += "${libdir}/${PYTHON_DIR}/config-${PYTHON_MAINVERSION}-*/lib${PYTHON_DIR}.a"
 INSANE_SKIP:${PN}-dev += "dev-elf"
 INSANE_SKIP:${PN}-ptest = "dev-deps"
 
 # catch all the rest (unsorted)
 PACKAGES += "${PN}-misc"
 RDEPENDS:${PN}-misc += "\
+    bash \
     ${PN}-audio \
     ${PN}-codecs \
     ${PN}-core \
@@ -459,7 +462,7 @@ RDEPENDS:${PN}-misc += "\
 RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
 RDEPENDS:${PN}-modules:append:class-target = " ${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '${MLPREFIX}python3-gdbm', '', d)}"
-FILES:${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
+FILES:${PN}-misc = "${libdir}/${PYTHON_DIR} ${libdir}/${PYTHON_DIR}/lib-dynload"
 
 # catch manpage
 PACKAGES += "${PN}-man"
@@ -499,5 +502,5 @@ RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
 # Python's tests contain large numbers of files we don't need in the recipe sysroots
 SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
 py3_sysroot_cleanup () {
-	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/${PYTHON_DIR}/test
 }
-- 
2.53.0


