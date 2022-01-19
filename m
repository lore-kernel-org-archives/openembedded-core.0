Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 057F9C433F5
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:41:29 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.4788.1642588887530781929
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ONN+H6a+;
 spf=pass (domain: gmail.com, ip: 209.85.128.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id n8so4468256wmk.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ou6Ka/QHG9Fo4oqWU/QjvwTMcL7dB9foG1WaQGdUmmY=;
        b=ONN+H6a+W1ySu1yHrXg09Ra7ovT/6VnK58JZ+2u4MIq3Yvr1KmZfq4oxxywAW4RI7x
         JfQrY/tU+zn/mcouOuE1YxRa9e4GvOxEifzPSdm2oOgj2OyCq2bta1KoSRuYWdj7S0Yz
         31SZHyQucVBDRM+1HdvT5HskCaJsAbvnqREuW/uVdD+ys8TYhx/1+4B8yRF1Saq7jy48
         UuxOM+kqTNG4PkXCmhiLHAbxEkl7VJJxVwH14wDB2rPhdgZQzhkhDT1DHFaJNw7QJ72h
         PaH7+jgb9GB+takgvan6aaavRDvHf/wr4+fw/yfViS0EcFxazB0ixF+63KP+I7pGztCM
         KKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ou6Ka/QHG9Fo4oqWU/QjvwTMcL7dB9foG1WaQGdUmmY=;
        b=gC3G6BzLOaNuv4JJ3Eam9dmIId/k2N8NfVQ3lphHJQGSNiSHxUccYZTXroZpGSN3Y9
         U52Y24fjl44OCAl+dupD6+HarCbg4Cj71Q7jY7gPGCgi2QhLz6QqWYclUi59wjHbeskQ
         puFUI6gcHmuGmx6SyhZzg23CHgzdheqbbK8Nj2YnS7Mp5oIJ08iz/TPumylCZ+Bich7n
         Ai3FiUzeAR+GsDOE8K5sp1Wp/z3+GekWI3bTLUzZa3fZ8I0UAiFr2E96KPFf+6F8fCNW
         4YwKweYx9hf4LHCAPOdjdqgx3FnaP4iarqw+bkDnXUYyCPpyoUZ5wG4WI5uaViLBa1uS
         AzPg==
X-Gm-Message-State: AOAM532aCMxZtySZGk3c0gOR9vTqdzp4MDsDtTz4ywA/DI/RC7WLDleH
	FGVPct/98XAZpgpg3Iu96VkW3wyWlIM=
X-Google-Smtp-Source: 
 ABdhPJx0gQwyu+/J2AZUoGoWdXIr7TiyeCNtQ5TbdEAlZpqIC24+1e/QhYiW67oo7tQ5g0I4K3JBpw==
X-Received: by 2002:adf:fe8e:: with SMTP id
 l14mr14480537wrr.678.1642588886119;
        Wed, 19 Jan 2022 02:41:26 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 o5sm4667956wmc.39.2022.01.19.02.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 02:41:25 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 02/39] meson: fold nativesdk into the main recipe
Date: Wed, 19 Jan 2022 11:40:40 +0100
Message-Id: <20220119104117.2120127-2-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220119104117.2120127-1-alex@linutronix.de>
References: <20220119104117.2120127-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:41:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160693

This allows automated version updates when possible, and reduces friction in manual ones.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/conf/distro/include/maintainers.inc      |   1 -
 meta/recipes-devtools/meson/meson.inc         |  37 -----
 meta/recipes-devtools/meson/meson_0.60.3.bb   | 135 +++++++++++++++++-
 .../meson/nativesdk-meson_0.60.3.bb           | 104 --------------
 4 files changed, 133 insertions(+), 144 deletions(-)
 delete mode 100644 meta/recipes-devtools/meson/meson.inc
 delete mode 100644 meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 55ec826249..ae25287c11 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -524,7 +524,6 @@ RECIPE_MAINTAINER:pn-nasm = "Richard Purdie <richard.purdie@linuxfoundation.org>
 RECIPE_MAINTAINER:pn-nativesdk-buildtools-perl-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-icecc-toolchain = "Joshua Watt <JPEWhacker@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-libtool = "Richard Purdie <richard.purdie@linuxfoundation.org>"
-RECIPE_MAINTAINER:pn-nativesdk-meson = "Alexander Kanavin <alex.kanavin@gmail.com>"
 RECIPE_MAINTAINER:pn-nativesdk-packagegroup-sdk-host = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-nativesdk-qemu-helper = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-nativesdk-sdk-provides-dummy = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
deleted file mode 100644
index 042cf130e4..0000000000
--- a/meta/recipes-devtools/meson/meson.inc
+++ /dev/null
@@ -1,37 +0,0 @@
-HOMEPAGE = "http://mesonbuild.com"
-SUMMARY = "A high performance build system"
-DESCRIPTION = "Meson is a build system designed to increase programmer \
-productivity. It does this by providing a fast, simple and easy to use \
-interface for modern software development tools and practices."
-
-LICENSE = "Apache-2.0"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
-
-SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
-           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
-           file://0001-python-module-do-not-manipulate-the-environment-when.patch \
-           file://disable-rpath-handling.patch \
-           file://0001-Make-CPU-family-warnings-fatal.patch \
-           file://0002-Support-building-allarch-recipes-again.patch \
-           file://0001-is_debianlike-always-return-False.patch \
-           "
-SRC_URI[sha256sum] = "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
-
-UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
-UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
-
-inherit setuptools3
-
-RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
-
-FILES:${PN} += "${datadir}/polkit-1"
-
-do_install:append () {
-	# As per the same issue in the python recipe itself:
-	# Unfortunately the following pyc files are non-deterministc due to 'frozenset'
-	# being written without strict ordering, even with PYTHONHASHSEED = 0
-	# Upstream is discussing ways to solve the issue properly, until then let's
-	# just not install the problematic files.
-	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
-	rm ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
-}
diff --git a/meta/recipes-devtools/meson/meson_0.60.3.bb b/meta/recipes-devtools/meson/meson_0.60.3.bb
index de9b905c12..62ca09465b 100644
--- a/meta/recipes-devtools/meson/meson_0.60.3.bb
+++ b/meta/recipes-devtools/meson/meson_0.60.3.bb
@@ -1,4 +1,135 @@
-include meson.inc
+HOMEPAGE = "http://mesonbuild.com"
+SUMMARY = "A high performance build system"
+DESCRIPTION = "Meson is a build system designed to increase programmer \
+productivity. It does this by providing a fast, simple and easy to use \
+interface for modern software development tools and practices."
 
-BBCLASSEXTEND = "native"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
 
+SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${PV}.tar.gz \
+           file://0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch \
+           file://0001-python-module-do-not-manipulate-the-environment-when.patch \
+           file://disable-rpath-handling.patch \
+           file://0001-Make-CPU-family-warnings-fatal.patch \
+           file://0002-Support-building-allarch-recipes-again.patch \
+           file://0001-is_debianlike-always-return-False.patch \
+           "
+SRC_URI[sha256sum] = "87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e"
+
+UPSTREAM_CHECK_URI = "https://github.com/mesonbuild/meson/releases"
+UPSTREAM_CHECK_REGEX = "meson-(?P<pver>\d+(\.\d+)+)\.tar"
+
+inherit setuptools3
+
+RDEPENDS:${PN} = "ninja python3-modules python3-pkg-resources"
+
+FILES:${PN} += "${datadir}/polkit-1"
+
+do_install:append () {
+	# As per the same issue in the python recipe itself:
+	# Unfortunately the following pyc files are non-deterministc due to 'frozenset'
+	# being written without strict ordering, even with PYTHONHASHSEED = 0
+	# Upstream is discussing ways to solve the issue properly, until then let's
+	# just not install the problematic files.
+	# More info: http://benno.id.au/blog/2013/01/15/python-determinism
+	rm ${D}${libdir}/python*/site-packages/mesonbuild/dependencies/__pycache__/mpi.cpython*
+}
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit meson-routines
+
+SRC_URI:append:class-nativesdk = " file://meson-setup.py \
+                                     file://meson-wrapper"
+
+# The cross file logic is similar but not identical to that in meson.bbclass,
+# since it's generating for an SDK rather than a cross-compile. Important
+# differences are:
+# - We can't set vars like CC, CXX, etc. yet because they will be filled in with
+#   real paths by meson-setup.sh when the SDK is extracted.
+# - Some overrides aren't needed, since the SDK injects paths that take care of
+#   them.
+def var_list2str(var, d):
+    items = d.getVar(var).split()
+    return items[0] if len(items) == 1 else ', '.join(repr(s) for s in items)
+
+def generate_native_link_template(d):
+    val = ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-L@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${libdir_native}',
+           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
+           '-Wl,--allow-shlib-undefined'
+        ]
+    build_arch = d.getVar('BUILD_ARCH')
+    if 'x86_64' in build_arch:
+        loader = 'ld-linux-x86-64.so.2'
+    elif 'i686' in build_arch:
+        loader = 'ld-linux.so.2'
+    elif 'aarch64' in build_arch:
+        loader = 'ld-linux-aarch64.so.1'
+    elif 'ppc64le' in build_arch:
+        loader = 'ld64.so.2'
+
+    if loader:
+        val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
+
+    return repr(val)
+
+do_install:append:class-nativesdk() {
+    install -d ${D}${datadir}/meson
+
+    cat >${D}${datadir}/meson/meson.native.template <<EOF
+[binaries]
+c = ${@meson_array('BUILD_CC', d)}
+cpp = ${@meson_array('BUILD_CXX', d)}
+ar = ${@meson_array('BUILD_AR', d)}
+nm = ${@meson_array('BUILD_NM', d)}
+strip = ${@meson_array('BUILD_STRIP', d)}
+readelf = ${@meson_array('BUILD_READELF', d)}
+pkgconfig = 'pkg-config-native'
+
+[built-in options]
+c_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
+c_link_args = ${@generate_native_link_template(d)}
+cpp_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
+cpp_link_args = ${@generate_native_link_template(d)}
+[properties]
+sys_root = '@OECORE_NATIVE_SYSROOT'
+EOF
+
+    cat >${D}${datadir}/meson/meson.cross.template <<EOF
+[binaries]
+c = @CC
+cpp = @CXX
+ar = @AR
+nm = @NM
+strip = @STRIP
+pkgconfig = 'pkg-config'
+
+[built-in options]
+c_args = @CFLAGS
+c_link_args = @LDFLAGS
+cpp_args = @CPPFLAGS
+cpp_link_args = @LDFLAGS
+
+[properties]
+needs_exe_wrapper = true
+sys_root = @OECORE_TARGET_SYSROOT
+
+[host_machine]
+system = '${SDK_OS}'
+cpu_family = '${@meson_cpu_family("SDK_ARCH", d)}'
+cpu = '${SDK_ARCH}'
+endian = '${@meson_endian("SDK", d)}'
+EOF
+
+    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
+    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
+
+    # We need to wrap the real meson with a thin env setup wrapper.
+    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
+    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
+}
+
+FILES:${PN}:append:class-nativesdk = "${datadir}/meson ${SDKPATHNATIVE}"
diff --git a/meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb b/meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb
deleted file mode 100644
index 7b77041c7e..0000000000
--- a/meta/recipes-devtools/meson/nativesdk-meson_0.60.3.bb
+++ /dev/null
@@ -1,104 +0,0 @@
-include meson.inc
-
-inherit meson-routines
-inherit nativesdk
-
-SRC_URI += "file://meson-setup.py \
-            file://meson-wrapper"
-
-# The cross file logic is similar but not identical to that in meson.bbclass,
-# since it's generating for an SDK rather than a cross-compile. Important
-# differences are:
-# - We can't set vars like CC, CXX, etc. yet because they will be filled in with
-#   real paths by meson-setup.sh when the SDK is extracted.
-# - Some overrides aren't needed, since the SDK injects paths that take care of
-#   them.
-def var_list2str(var, d):
-    items = d.getVar(var).split()
-    return items[0] if len(items) == 1 else ', '.join(repr(s) for s in items)
-
-def generate_native_link_template(d):
-    val = ['-L@{OECORE_NATIVE_SYSROOT}${libdir_native}',
-           '-L@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
-           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${libdir_native}',
-           '-Wl,-rpath-link,@{OECORE_NATIVE_SYSROOT}${base_libdir_native}',
-           '-Wl,--allow-shlib-undefined'
-        ]
-    build_arch = d.getVar('BUILD_ARCH')
-    if 'x86_64' in build_arch:
-        loader = 'ld-linux-x86-64.so.2'
-    elif 'i686' in build_arch:
-        loader = 'ld-linux.so.2'
-    elif 'aarch64' in build_arch:
-        loader = 'ld-linux-aarch64.so.1'
-    elif 'ppc64le' in build_arch:
-        loader = 'ld64.so.2'
-
-    if loader:
-        val += ['-Wl,--dynamic-linker=@{OECORE_NATIVE_SYSROOT}${base_libdir_native}/' + loader]
-
-    return repr(val)
-
-do_install:append() {
-    install -d ${D}${datadir}/meson
-
-    cat >${D}${datadir}/meson/meson.native.template <<EOF
-[binaries]
-c = ${@meson_array('BUILD_CC', d)}
-cpp = ${@meson_array('BUILD_CXX', d)}
-ar = ${@meson_array('BUILD_AR', d)}
-nm = ${@meson_array('BUILD_NM', d)}
-strip = ${@meson_array('BUILD_STRIP', d)}
-readelf = ${@meson_array('BUILD_READELF', d)}
-pkgconfig = 'pkg-config-native'
-
-[built-in options]
-c_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
-c_link_args = ${@generate_native_link_template(d)}
-cpp_args = ['-isystem@{OECORE_NATIVE_SYSROOT}${includedir_native}' , ${@var_list2str('BUILD_OPTIMIZATION', d)}]
-cpp_link_args = ${@generate_native_link_template(d)}
-[properties]
-sys_root = '@OECORE_NATIVE_SYSROOT'
-EOF
-
-    cat >${D}${datadir}/meson/meson.cross.template <<EOF
-[binaries]
-c = @CC
-cpp = @CXX
-ar = @AR
-nm = @NM
-strip = @STRIP
-pkgconfig = 'pkg-config'
-
-[built-in options]
-c_args = @CFLAGS
-c_link_args = @LDFLAGS
-cpp_args = @CPPFLAGS
-cpp_link_args = @LDFLAGS
-
-[properties]
-needs_exe_wrapper = true
-sys_root = @OECORE_TARGET_SYSROOT
-
-[host_machine]
-system = '${SDK_OS}'
-cpu_family = '${@meson_cpu_family("SDK_ARCH", d)}'
-cpu = '${SDK_ARCH}'
-endian = '${@meson_endian("SDK", d)}'
-EOF
-
-    install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
-    install -m 0755 ${WORKDIR}/meson-setup.py ${D}${SDKPATHNATIVE}/post-relocate-setup.d/
-
-    # We need to wrap the real meson with a thin env setup wrapper.
-    mv ${D}${bindir}/meson ${D}${bindir}/meson.real
-    install -m 0755 ${WORKDIR}/meson-wrapper ${D}${bindir}/meson
-}
-
-RDEPENDS:${PN} += "\
-    nativesdk-ninja \
-    nativesdk-python3 \
-    nativesdk-python3-setuptools \
-    "
-
-FILES:${PN} += "${datadir}/meson ${SDKPATHNATIVE}"
-- 
2.20.1


