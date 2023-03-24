Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BCD2C6FD20
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 03:13:34 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.web11.92805.1679627606106300820
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Mar 2023 20:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kB0JplI9;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: zboszor@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id o12so2677356edb.9
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Mar 2023 20:13:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679627604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJtxaeJwcueWpHmCKmFLUXHGcZCVH4/Dwmge4HQ9lRE=;
        b=kB0JplI9n2QD+MJgfmCDFfyAydNQwfYxzqvSiqUiPlyCpOYfjcVthvJy4mbtNcJ52U
         qexw95+ZHIT19WBMuGLmMXUS2HCK2wh5Va/f2sNSVnJDDoVx6N62HXbVv/ABZpMve74k
         yg5u3UZyL2h/pCNaLfWO9lcLWv+rFfpVAUiuKpi9uMZRSjnPLHO7Mee9kcQN28NnxVuA
         P1SyTGUskq0twWvYa6BhWxoxZWXH8nxrnevzOgaBHZKUN66w+PTCKuWpQO+wWwuyExdV
         HEr8mWVN15ENd7gvMUiYSnWNdAmrH03+CQihWgPqhfYkLBPqK6YO7GGq6SP1ceRUCrJ/
         OMow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679627604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YJtxaeJwcueWpHmCKmFLUXHGcZCVH4/Dwmge4HQ9lRE=;
        b=RucnxRnPMvvIIOGn5wG5mAOgpHthkApMVSGq6lN+bWRDOI81uZI/MiFfTzYnZMmThW
         VmiDnL7mD9nV13gfpTgzw2Aobbgy2waBnLLnT4kLCNFxXlc1ao47YQuRq8JYqbsvOirV
         ye2z785DPbQ5QcnS1Hy1WCxcbaCVa8OXhmrVoDhojlwrWe6ZtBtt7y192YTHO6sfffg7
         us2z+q+xHjKm/ViThOqLbnvBk/SuRlR1zX/dHwnH2Q+eicYZ9wxzaVoLxkdCX9iOLPjE
         GBLXfPStVQnZkTtXW3wzkD+m5TvYnB0/3mPiqXEe2SCWHP+pu5KY0Ho+zt0mmgUzcE0T
         pdgQ==
X-Gm-Message-State: AAQBX9eRSaFtNIVnkbugVMH+VbcktmNd4+q0u7PJrvsXsyyTo7sqY8e7
	8KL5PTI/PVFcp9VvP33hstq226Tzoyk=
X-Google-Smtp-Source: AKy350YEQ3oHHO1GxaGpw95cvYqBfq8LlO939SRHhLVLX7YIo6YmDj4sj0ikp7sfne9T3UjqkRqbOQ==
X-Received: by 2002:a17:907:c70c:b0:91e:acf4:b009 with SMTP id ty12-20020a170907c70c00b0091eacf4b009mr1222853ejc.22.1679627603992;
        Thu, 23 Mar 2023 20:13:23 -0700 (PDT)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id x23-20020a50d617000000b004fa268da13esm10149769edi.56.2023.03.23.20.13.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 20:13:23 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross Burton <Ross.Burton@arm.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [PATCH v2] meson.bbclass: Split into meson-env and meson classes
Date: Fri, 24 Mar 2023 04:13:19 +0100
Message-Id: <20230324031319.4172410-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <174CE003EF809BC1.11516@lists.openembedded.org>
References: <174CE003EF809BC1.11516@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 03:13:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179011

The new meson-env class will be used by a new PEP517 python
build class using meson-python a.k.a. mesonpy.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
v2: The split-off part is called meson-env.bbclass
    because "common" is not liked.

 meta/classes-recipe/meson-env.bbclass | 141 ++++++++++++++++++++++++++
 meta/classes-recipe/meson.bbclass     | 136 +------------------------
 2 files changed, 142 insertions(+), 135 deletions(-)
 create mode 100644 meta/classes-recipe/meson-env.bbclass

diff --git a/meta/classes-recipe/meson-env.bbclass b/meta/classes-recipe/meson-env.bbclass
new file mode 100644
index 0000000000..e02b3e5ab6
--- /dev/null
+++ b/meta/classes-recipe/meson-env.bbclass
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
index 48688bed75..697cf6ecc8 100644
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
+inherit meson-env
 
 # Tell externalsrc that changes to this file require a reconfigure
 CONFIGURE_FILES = "meson.build"
-- 
2.39.2


