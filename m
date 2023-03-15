Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15752C61DA4
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 08:00:29 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.2576.1678867227595893104
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 01:00:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ePBDdh9R;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id p13-20020a05600c358d00b003ed346d4522so302505wmq.2
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 01:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678867226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cigYckuyjDL1P+SNtH77uOQ44jfz8cU44vcfGCHE9Co=;
        b=ePBDdh9Rnp3bqK/b6Tn43vbi2nkXmvk0Yl2gWpInSqTAmhtYC4RZjC9OtcyIzsKX4b
         NCmSwRfK1fG4OBV+WdDab49kWk2r/xLFT2JNoIK8AMpq/6Vjl7gODwtEXBqm+IAJVNPk
         rXtbgI7DS57Ba3zO1FBN387YO48lYBZ7cfm91oJXEAh8aO7NxLWhEkuTBnHacYr+Xf0R
         aiCZh7ocH9am2+L9QGBL7tbuxcJqhieE3VR5Qh/xubcu4/lboxrM/MIjU3fcsTdFh1Lg
         +lIrE0QxQziQqUnY+JMbEYvxpGULlagxeDvDXtkCAbwsqox9ZzmpFaf1Q+U2Hh845l2Z
         aSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867226;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cigYckuyjDL1P+SNtH77uOQ44jfz8cU44vcfGCHE9Co=;
        b=6Y/wMF8LiN2v/xgrgpVgBfmCf1kMbnFHt06KyR6lX2p12pSSwzaE+9CjzK6sRyTOHD
         XeNumGvp4X6WaHgfA6RGmMztBAVtmW2cJgu7/4leWbE+imoYAK8OGUVnncPO6sHTBObE
         TiObgJauKlmtS80rVyGI3z2/ReZxt0BNkRyHoppKbD3Fse5kTLQJweqaAq8t5hheBF8R
         WH7BSK+L5KoVcPLJgwEUommWSVR6XOH2bOskL2oLo3mFxRh43hngWeKp5b/A2SDAA5xd
         f/QFNDWLf9qEyIF+bbxPyKca1RRQRMe1tU03UNCCypjC/aSkoYbxN1JdfzUu8bgRLwxs
         W7PA==
X-Gm-Message-State: AO0yUKXvEVG1QD+Ri7MOUcP9DlhdQmoXJWfEfrxfqwWAiPalawCmFWg1
	LO0E5NM8rip7ap/CvznlvyCcPVJugdU=
X-Google-Smtp-Source: AK7set+3krn6ScDjnpY0SuiqkW1ONs3xmjJZwHDsfw8XHhonICfnNmncFlAohsrQ6aGpUYTRH+uWbA==
X-Received: by 2002:a05:600c:3b12:b0:3ed:2a3e:2574 with SMTP id m18-20020a05600c3b1200b003ed2a3e2574mr6227358wms.7.1678867225577;
        Wed, 15 Mar 2023 01:00:25 -0700 (PDT)
Received: from localhost.lan ([188.36.64.204])
        by smtp.gmail.com with ESMTPSA id s20-20020a7bc394000000b003ed2433aa4asm956956wmj.41.2023.03.15.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 01:00:25 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH] meson.bbclass: Split into meson-common and meson classes
Date: Wed, 15 Mar 2023 09:00:20 +0100
Message-Id: <20230315080020.2648416-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 08:00:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178526

The new meson-common class will be used by a new PEP517 python
build class using meson-python a.k.a. mesonpy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/classes-recipe/meson-common.bbclass | 141 +++++++++++++++++++++++
 meta/classes-recipe/meson.bbclass        | 136 +---------------------
 2 files changed, 142 insertions(+), 135 deletions(-)
 create mode 100644 meta/classes-recipe/meson-common.bbclass

diff --git a/meta/classes-recipe/meson-common.bbclass b/meta/classes-recipe/meson-common.bbclass
new file mode 100644
index 0000000000..e02b3e5ab6
--- /dev/null
+++ b/meta/classes-recipe/meson-common.bbclass
@@ -0,0 +1,141 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+inherit python3native meson-routines qemu
+
+DEPENDS:append = " meson-native ninja-native"
+
+EXEWRAPPER_ENABLED:class-native = "False"
+EXEWRAPPER_ENABLED:class-nativesdk = "False"
+EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
+DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
+
+# As Meson enforces out-of-tree builds we can just use cleandirs
+B = "${WORKDIR}/build"
+do_configure[cleandirs] = "${B}"
+
+# Where the meson.build build configuration is
+MESON_SOURCEPATH = "${S}"
+
+def noprefix(var, d):
+    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
+
+MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
+MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
+MESONOPTS = " --prefix ${prefix} \
+              --buildtype ${MESON_BUILDTYPE} \
+              --bindir ${@noprefix('bindir', d)} \
+              --sbindir ${@noprefix('sbindir', d)} \
+              --datadir ${@noprefix('datadir', d)} \
+              --libdir ${@noprefix('libdir', d)} \
+              --libexecdir ${@noprefix('libexecdir', d)} \
+              --includedir ${@noprefix('includedir', d)} \
+              --mandir ${@noprefix('mandir', d)} \
+              --infodir ${@noprefix('infodir', d)} \
+              --sysconfdir ${sysconfdir} \
+              --localstatedir ${localstatedir} \
+              --sharedstatedir ${sharedstatedir} \
+              --wrap-mode nodownload \
+              --native-file ${WORKDIR}/meson.native"
+
+EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
+
+MESON_CROSS_FILE = ""
+MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
+MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
+
+# Needed to set up qemu wrapper below
+export STAGING_DIR_HOST
+
+def rust_tool(d, target_var):
+    rustc = d.getVar('RUSTC')
+    if not rustc:
+        return ""
+    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
+    return "rust = %s" % repr(cmd)
+
+addtask write_config before do_configure
+do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
+do_write_config() {
+    # This needs to be Py to split the args into single-element lists
+    cat >${WORKDIR}/meson.cross <<EOF
+[binaries]
+c = ${@meson_array('CC', d)}
+cpp = ${@meson_array('CXX', d)}
+cython = 'cython3'
+ar = ${@meson_array('AR', d)}
+nm = ${@meson_array('NM', d)}
+strip = ${@meson_array('STRIP', d)}
+readelf = ${@meson_array('READELF', d)}
+objcopy = ${@meson_array('OBJCOPY', d)}
+pkgconfig = 'pkg-config'
+llvm-config = 'llvm-config'
+cups-config = 'cups-config'
+g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
+g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
+${@rust_tool(d, "HOST_SYS")}
+${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
+
+[built-in options]
+c_args = ${@meson_array('CFLAGS', d)}
+c_link_args = ${@meson_array('LDFLAGS', d)}
+cpp_args = ${@meson_array('CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('LDFLAGS', d)}
+
+[properties]
+needs_exe_wrapper = true
+
+[host_machine]
+system = '${@meson_operating_system('HOST_OS', d)}'
+cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
+cpu = '${HOST_ARCH}'
+endian = '${@meson_endian('HOST', d)}'
+
+[target_machine]
+system = '${@meson_operating_system('TARGET_OS', d)}'
+cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
+cpu = '${TARGET_ARCH}'
+endian = '${@meson_endian('TARGET', d)}'
+EOF
+
+    cat >${WORKDIR}/meson.native <<EOF
+[binaries]
+c = ${@meson_array('BUILD_CC', d)}
+cpp = ${@meson_array('BUILD_CXX', d)}
+cython = 'cython3'
+ar = ${@meson_array('BUILD_AR', d)}
+nm = ${@meson_array('BUILD_NM', d)}
+strip = ${@meson_array('BUILD_STRIP', d)}
+readelf = ${@meson_array('BUILD_READELF', d)}
+objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
+pkgconfig = 'pkg-config-native'
+${@rust_tool(d, "BUILD_SYS")}
+
+[built-in options]
+c_args = ${@meson_array('BUILD_CFLAGS', d)}
+c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
+cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
+cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
+EOF
+}
+
+do_write_config:append:class-target() {
+    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
+    # can run target helper binaries through that.
+    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
+    cat > ${WORKDIR}/meson-qemuwrapper << EOF
+#!/bin/sh
+# Use a modules directory which doesn't exist so we don't load random things
+# which may then get deleted (or their dependencies) and potentially segfault
+export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
+
+# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
+unset LD_LIBRARY_PATH
+
+$qemu_binary "\$@"
+EOF
+    chmod +x ${WORKDIR}/meson-qemuwrapper
+}
diff --git a/meta/classes-recipe/meson.bbclass b/meta/classes-recipe/meson.bbclass
index 48688bed75..f1273aa1c0 100644
--- a/meta/classes-recipe/meson.bbclass
+++ b/meta/classes-recipe/meson.bbclass
@@ -4,141 +4,7 @@
 # SPDX-License-Identifier: MIT
 #
 
-inherit python3native meson-routines qemu
-
-DEPENDS:append = " meson-native ninja-native"
-
-EXEWRAPPER_ENABLED:class-native = "False"
-EXEWRAPPER_ENABLED:class-nativesdk = "False"
-EXEWRAPPER_ENABLED ?= "${@bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', 'True', 'False', d)}"
-DEPENDS:append = "${@' qemu-native' if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ''}"
-
-# As Meson enforces out-of-tree builds we can just use cleandirs
-B = "${WORKDIR}/build"
-do_configure[cleandirs] = "${B}"
-
-# Where the meson.build build configuration is
-MESON_SOURCEPATH = "${S}"
-
-def noprefix(var, d):
-    return d.getVar(var).replace(d.getVar('prefix') + '/', '', 1)
-
-MESON_BUILDTYPE ?= "${@oe.utils.vartrue('DEBUG_BUILD', 'debug', 'plain', d)}"
-MESON_BUILDTYPE[vardeps] += "DEBUG_BUILD"
-MESONOPTS = " --prefix ${prefix} \
-              --buildtype ${MESON_BUILDTYPE} \
-              --bindir ${@noprefix('bindir', d)} \
-              --sbindir ${@noprefix('sbindir', d)} \
-              --datadir ${@noprefix('datadir', d)} \
-              --libdir ${@noprefix('libdir', d)} \
-              --libexecdir ${@noprefix('libexecdir', d)} \
-              --includedir ${@noprefix('includedir', d)} \
-              --mandir ${@noprefix('mandir', d)} \
-              --infodir ${@noprefix('infodir', d)} \
-              --sysconfdir ${sysconfdir} \
-              --localstatedir ${localstatedir} \
-              --sharedstatedir ${sharedstatedir} \
-              --wrap-mode nodownload \
-              --native-file ${WORKDIR}/meson.native"
-
-EXTRA_OEMESON:append = " ${PACKAGECONFIG_CONFARGS}"
-
-MESON_CROSS_FILE = ""
-MESON_CROSS_FILE:class-target = "--cross-file ${WORKDIR}/meson.cross"
-MESON_CROSS_FILE:class-nativesdk = "--cross-file ${WORKDIR}/meson.cross"
-
-# Needed to set up qemu wrapper below
-export STAGING_DIR_HOST
-
-def rust_tool(d, target_var):
-    rustc = d.getVar('RUSTC')
-    if not rustc:
-        return ""
-    cmd = [rustc, "--target", d.getVar(target_var)] + d.getVar("RUSTFLAGS").split()
-    return "rust = %s" % repr(cmd)
-
-addtask write_config before do_configure
-do_write_config[vardeps] += "CC CXX LD AR NM STRIP READELF CFLAGS CXXFLAGS LDFLAGS RUSTC RUSTFLAGS"
-do_write_config() {
-    # This needs to be Py to split the args into single-element lists
-    cat >${WORKDIR}/meson.cross <<EOF
-[binaries]
-c = ${@meson_array('CC', d)}
-cpp = ${@meson_array('CXX', d)}
-cython = 'cython3'
-ar = ${@meson_array('AR', d)}
-nm = ${@meson_array('NM', d)}
-strip = ${@meson_array('STRIP', d)}
-readelf = ${@meson_array('READELF', d)}
-objcopy = ${@meson_array('OBJCOPY', d)}
-pkgconfig = 'pkg-config'
-llvm-config = 'llvm-config'
-cups-config = 'cups-config'
-g-ir-scanner = '${STAGING_BINDIR}/g-ir-scanner-wrapper'
-g-ir-compiler = '${STAGING_BINDIR}/g-ir-compiler-wrapper'
-${@rust_tool(d, "HOST_SYS")}
-${@"exe_wrapper = '${WORKDIR}/meson-qemuwrapper'" if d.getVar('EXEWRAPPER_ENABLED') == 'True' else ""}
-
-[built-in options]
-c_args = ${@meson_array('CFLAGS', d)}
-c_link_args = ${@meson_array('LDFLAGS', d)}
-cpp_args = ${@meson_array('CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('LDFLAGS', d)}
-
-[properties]
-needs_exe_wrapper = true
-
-[host_machine]
-system = '${@meson_operating_system('HOST_OS', d)}'
-cpu_family = '${@meson_cpu_family('HOST_ARCH', d)}'
-cpu = '${HOST_ARCH}'
-endian = '${@meson_endian('HOST', d)}'
-
-[target_machine]
-system = '${@meson_operating_system('TARGET_OS', d)}'
-cpu_family = '${@meson_cpu_family('TARGET_ARCH', d)}'
-cpu = '${TARGET_ARCH}'
-endian = '${@meson_endian('TARGET', d)}'
-EOF
-
-    cat >${WORKDIR}/meson.native <<EOF
-[binaries]
-c = ${@meson_array('BUILD_CC', d)}
-cpp = ${@meson_array('BUILD_CXX', d)}
-cython = 'cython3'
-ar = ${@meson_array('BUILD_AR', d)}
-nm = ${@meson_array('BUILD_NM', d)}
-strip = ${@meson_array('BUILD_STRIP', d)}
-readelf = ${@meson_array('BUILD_READELF', d)}
-objcopy = ${@meson_array('BUILD_OBJCOPY', d)}
-pkgconfig = 'pkg-config-native'
-${@rust_tool(d, "BUILD_SYS")}
-
-[built-in options]
-c_args = ${@meson_array('BUILD_CFLAGS', d)}
-c_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
-cpp_args = ${@meson_array('BUILD_CXXFLAGS', d)}
-cpp_link_args = ${@meson_array('BUILD_LDFLAGS', d)}
-EOF
-}
-
-do_write_config:append:class-target() {
-    # Write out a qemu wrapper that will be used as exe_wrapper so that meson
-    # can run target helper binaries through that.
-    qemu_binary="${@qemu_wrapper_cmdline(d, '$STAGING_DIR_HOST', ['$STAGING_DIR_HOST/${libdir}','$STAGING_DIR_HOST/${base_libdir}'])}"
-    cat > ${WORKDIR}/meson-qemuwrapper << EOF
-#!/bin/sh
-# Use a modules directory which doesn't exist so we don't load random things
-# which may then get deleted (or their dependencies) and potentially segfault
-export GIO_MODULE_DIR=${STAGING_LIBDIR}/gio/modules-dummy
-
-# meson sets this wrongly (only to libs in build-dir), qemu_wrapper_cmdline() and GIR_EXTRA_LIBS_PATH take care of it properly
-unset LD_LIBRARY_PATH
-
-$qemu_binary "\$@"
-EOF
-    chmod +x ${WORKDIR}/meson-qemuwrapper
-}
+inherit meson-common
 
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
-- 
2.39.2


