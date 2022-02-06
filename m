Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD701C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 21:53:22 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.14507.1644184401876582665
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vp9Oohbr;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id y3so15717940ejf.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 13:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3LsnS1NqggL8LGa0CxXwM1H6D2fgmpOO932NW5EgwU=;
        b=Vp9OohbrguWukG6iHWCdinth7swfu3JIY/Hm2xJrBONJtlAaUm01JlqE589lgjKlsS
         CMMXv97o26NlHfUibzQFXYeaXjikjjhWnzTzv5/335tCK/HIqxrevLZvHB5rdcCvrXYu
         vzYc7y9cB/LgZm4Rm7AIzzsZAMmn3qY6gt3rDf54RRTVG9XAZtu1hbKOZ4Eol+zhuuOZ
         jFRMtcVqNUiP5kJ4n5iIenWEWrxR2IoNrT4HXM1XWYGMyX9Z36IDviPpqwKjbiJrHlva
         u8G9zODBCzaKBcusq938Tg/JEuITgRVog6svtHAILC7WQmVdlz+K9pjVL5vpHidtxYfo
         U11g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=O3LsnS1NqggL8LGa0CxXwM1H6D2fgmpOO932NW5EgwU=;
        b=oIMg2hw8eJgeaCWDuvSJ6Yh4CF8GWY8MAagaHR8ljEJZ/hXXZ5z42hdhSOxFop9iSc
         e28AJE71W9sMdLoFtB9JxXCt4/GZbikIZ3TMQpZ55mE1dIv3rGOJq+zeqPf+P4KUZceO
         JCNx68DaNKC2BabpFDXOX1BIpSO9C3eDlt2BE00PN8dUMn3fdn6VNH3tcAf7lQm759iA
         +BGespFh2GcwJFDF6Xbq2N9O8BzADkDhhKqDrj/VXLNT8omBFH7JaHrlOoDQcez04d+W
         Su8prsYU5/rihXcf1+CtNoMcNELaGNauglwxjXJqf1b1Msnff0dh8YKck6xNgEopHRmC
         Z0vw==
X-Gm-Message-State: AOAM533/eBlSHMFdUtMGfLF1bLJFVXdqGvHEYd148qFd+ZMrIfq0dtY/
	oe8/FzVR5kIlZSuYgGO/WXPMNVY9EdY=
X-Google-Smtp-Source: 
 ABdhPJyOVauSCS5PL5VJp19oRg5iCgY7Kyw2pgHvtFeTqjMqTR03f5/eSaVEe+OyUZFnl9p/BpOXYQ==
X-Received: by 2002:a17:906:7712:: with SMTP id
 q18mr7457950ejm.434.1644184400046;
        Sun, 06 Feb 2022 13:53:20 -0800 (PST)
Received: from nereus.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 j11sm1191927ejb.110.2022.02.06.13.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 13:53:19 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 1/8] mesa: fold mesa-gl variant into the main recipe using
 mcextend class
Date: Sun,  6 Feb 2022 22:53:09 +0100
Message-Id: <20220206215316.367469-1-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 21:53:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161413

This reduces friction in version updates and allows fully automated ones.

There was a concern that using mcextend this way may clash with proper
multiconfig setups; I have tweaked the multiconfig selftest to include
mesa packages in both multiconfig images, and ran the test with
preferred provider set to mesa, and then to mesa-gl - all passed.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb |  16 -
 meta/recipes-graphics/mesa/mesa.inc          | 316 -----------------
 meta/recipes-graphics/mesa/mesa_21.3.5.bb    | 337 ++++++++++++++++++-
 3 files changed, 336 insertions(+), 333 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa.inc

diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb b/meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
deleted file mode 100644
index 142bb743b1..0000000000
--- a/meta/recipes-graphics/mesa/mesa-gl_21.3.5.bb
+++ /dev/null
@@ -1,16 +0,0 @@
-require mesa.inc
-
-SUMMARY += " (OpenGL only, no EGL/GLES)"
-
-PROVIDES = "virtual/libgl virtual/mesa"
-
-S = "${WORKDIR}/mesa-${PV}"
-
-# At least one DRI rendering engine is required to build mesa.
-# When no X11 is available, use osmesa for the rendering engine.
-PACKAGECONFIG ??= "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-PACKAGECONFIG:class-target = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
-
-# 21.0.0 version fails to build when any driver is enabled in DRIDRIVERS
-# ./mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dri drivers require at least one windowing system
-DRIDRIVERS ?= ""
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
deleted file mode 100644
index e8093f5665..0000000000
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ /dev/null
@@ -1,316 +0,0 @@
-SUMMARY = "A free implementation of the OpenGL API"
-DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
-a system for rendering interactive 3D graphics.  \
-A variety of device drivers allows Mesa to be used in many different environments \
-ranging from software emulation to complete hardware acceleration for modern GPUs. \
-Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
-environment."
-
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
-
-PE = "2"
-
-SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
-           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
-           file://0002-meson.build-make-TLS-ELF-optional.patch \
-           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
-           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://0001-util-format-Check-for-NEON-before-using-it.patch \
-           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
-           "
-
-SRC_URI[sha256sum] = "d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c"
-
-UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
-
-#because we cannot rely on the fact that all apps will use pkgconfig,
-#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
-do_install:append() {
-    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
-        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
-    fi
-}
-
-DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
-EXTRANATIVEPATH += "chrpath-native"
-PROVIDES = " \
-    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
-    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
-    virtual/mesa \
-    "
-
-inherit meson pkgconfig python3native gettext features_check
-
-BBCLASSEXTEND = "native nativesdk"
-
-ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
-
-PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
-
-export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
-export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
-export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
-export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
-
-MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
-
-# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
-# by default the upstream mesa sources build a debug release
-# here we assume the user will want a release build by default
-MESA_BUILD_TYPE ?= "release"
-def check_buildtype(d):
-    _buildtype = d.getVar('MESA_BUILD_TYPE')
-    if _buildtype not in ['release', 'debug']:
-        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
-    if _buildtype == 'debug':
-        return 'debugoptimized'
-    return 'plain'
-MESON_BUILDTYPE = "${@check_buildtype(d)}"
-
-EXTRA_OEMESON = " \
-    -Dshared-glapi=enabled \
-    -Dgallium-opencl=disabled \
-    -Dglx-read-only-text=true \
-    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
-"
-
-def strip_comma(s):
-    return s.strip(',')
-
-PACKAGECONFIG:class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium virgl', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
-                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-                   elf-tls \
-		   "
-PACKAGECONFIG:class-native ?= "gbm gallium egl opengl elf-tls x11"
-PACKAGECONFIG:class-nativesdk ?= "gbm gallium egl opengl elf-tls x11"
-
-PACKAGECONFIG:remove:libc-musl = "elf-tls"
-
-# "gbm" requires "dri", "opengl"
-PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
-
-X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
-# "x11" requires "opengl"
-PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
-PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
-PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
-PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
-
-# "dri" requires "opengl"
-PACKAGECONFIG[dri] = "-Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}, -Ddri-drivers='', xorgproto libdrm"
-PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
-
-# Vulkan drivers need dri3 enabled
-# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
-VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86:class-target = ",intel"
-VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
-PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
-
-PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
-
-# "gles" requires "opengl"
-PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
-
-# "egl" requires "dri", "opengl"
-PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
-
-PACKAGECONFIG[broadcom] = ""
-PACKAGECONFIG[etnaviv] = ""
-PACKAGECONFIG[freedreno] = ""
-PACKAGECONFIG[kmsro] = ""
-PACKAGECONFIG[vc4] = ""
-PACKAGECONFIG[v3d] = ""
-
-GALLIUMDRIVERS = "swrast"
-# gallium swrast was found to crash Xorg on startup in x32 qemu
-GALLIUMDRIVERS:x86-x32 = ""
-GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
-GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
-
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
-
-# radeonsi requires LLVM
-GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
-GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
-GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
-GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
-
-PACKAGECONFIG[r600] = ""
-PACKAGECONFIG[virgl] = ""
-
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
-GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
-
-PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
-PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
-                               elfutils"
-PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
-PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
-
-PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
-
-PACKAGECONFIG[lima] = ""
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
-
-PACKAGECONFIG[panfrost] = ""
-GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
-
-PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
-
-PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
-
-PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
-
-# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
-FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
-
-CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
-CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
-
-# Remove the mesa dependency on mesa-dev, as mesa is empty
-RDEPENDS:${PN}-dev = ""
-
-# Khronos documentation says that include/GLES2/gl2ext.h can be used for
-# OpenGL ES 3 specification as well as for OpenGL ES 2.
-# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
-# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
-# development package of libgles3.
-RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
-
-PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
-             libgl-mesa libgl-mesa-dev \
-             libglapi libglapi-dev \
-             libgbm libgbm-dev \
-             libgles1-mesa libgles1-mesa-dev \
-             libgles2-mesa libgles2-mesa-dev \
-             libgles3-mesa libgles3-mesa-dev \
-             libxatracker libxatracker-dev \
-             mesa-megadriver mesa-vulkan-drivers \
-             mesa-vdpau-drivers \
-            "
-
-do_install:append () {
-    # Drivers never need libtool .la files
-    rm -f ${D}${libdir}/dri/*.la
-    rm -f ${D}${libdir}/egl/*.la
-    rm -f ${D}${libdir}/gallium-pipe/*.la
-    rm -f ${D}${libdir}/gbm/*.la
-
-    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
-    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
-
-    # libwayland-egl has been moved to wayland 1.15+
-    rm -f ${D}${libdir}/libwayland-egl*
-    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
-}
-
-# For the packages that make up the OpenGL interfaces, inject variables so that
-# they don't get Debian-renamed (which would remove the -mesa suffix), and
-# RPROVIDEs/RCONFLICTs on the generic libgl name.
-python __anonymous() {
-    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
-    suffix = ""
-    if "-native" in d.getVar("PN"):
-        suffix = "-native"
-    for p in (("egl", "libegl", "libegl1"),
-              ("dri", "libgl", "libgl1"),
-              ("gles", "libgles1", "libglesv1-cm1"),
-              ("gles", "libgles2", "libglesv2-2"),
-              ("gles", "libgles3",)):
-        if not p[0] in pkgconfig:
-            continue
-        mlprefix = d.getVar("MLPREFIX")
-        fullp = mlprefix + p[1] + "-mesa" + suffix
-        mlprefix = d.getVar("MLPREFIX")
-        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
-
-        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
-
-        # For -dev, the first element is both the Debian and original name
-        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
-        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
-        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
-        d.appendVar("RREPLACES:" + fullp, pkgs)
-        d.appendVar("RPROVIDES:" + fullp, pkgs)
-        d.appendVar("RCONFLICTS:" + fullp, pkgs)
-}
-
-python mesa_populate_packages() {
-    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
-    for pkg in pkgs:
-        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
-
-    import re
-    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
-    if os.path.isdir(dri_drivers_root):
-        dri_pkgs = sorted(os.listdir(dri_drivers_root))
-        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
-        for p in dri_pkgs:
-            m = re.match(r'^(.*)_dri\.so$', p)
-            if m:
-                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
-                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
-                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
-                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
-
-    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
-    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
-}
-
-PACKAGESPLITFUNCS:prepend = "mesa_populate_packages "
-
-PACKAGES_DYNAMIC += "^mesa-driver-.*"
-PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
-
-FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
-FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
-FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
-FILES:libegl-mesa = "${libdir}/libEGL.so.*"
-FILES:libgbm = "${libdir}/libgbm.so.*"
-FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
-FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
-FILES:libgl-mesa = "${libdir}/libGL.so.*"
-FILES:libglapi = "${libdir}/libglapi.so.*"
-FILES:libosmesa = "${libdir}/libOSMesa.so.*"
-FILES:libxatracker = "${libdir}/libxatracker.so.*"
-
-FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
-FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES:libglapi-dev = "${libdir}/libglapi.*"
-FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-FILES:libgles3-mesa-dev = "${includedir}/GLES3"
-FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
-FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
-                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
-                          ${libdir}/pkgconfig/xatracker.pc"
-
-# Fix upgrade path from mesa to mesa-megadriver
-RREPLACES:mesa-megadriver = "mesa"
-RCONFLICTS:mesa-megadriver = "mesa"
-RPROVIDES:mesa-megadriver = "mesa"
diff --git a/meta/recipes-graphics/mesa/mesa_21.3.5.bb b/meta/recipes-graphics/mesa/mesa_21.3.5.bb
index 4cb7e80eb5..e4f20f6e24 100644
--- a/meta/recipes-graphics/mesa/mesa_21.3.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_21.3.5.bb
@@ -1,5 +1,340 @@
-require ${BPN}.inc
+SUMMARY = "A free implementation of the OpenGL API"
+DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
+a system for rendering interactive 3D graphics.  \
+A variety of device drivers allows Mesa to be used in many different environments \
+ranging from software emulation to complete hardware acceleration for modern GPUs. \
+Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
+environment."
+
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.rst;md5=17a4ea65de7a9ab42437f3131e616a7f"
+
+PE = "2"
+
+SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
+           file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
+           file://0002-meson.build-make-TLS-ELF-optional.patch \
+           file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
+           file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
+           file://0001-util-format-Check-for-NEON-before-using-it.patch \
+           file://0001-v3dv-account-for-64bit-time_t-on-32bit-arches.patch \
+           "
+
+SRC_URI[sha256sum] = "d93b2a9d2464ee856d7637a07dff6b7cd950f295ad58518bb959f76882cf4a4c"
+
+UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
+
+#because we cannot rely on the fact that all apps will use pkgconfig,
+#make eglplatform.h independent of MESA_EGL_NO_X11_HEADER
+do_install:append() {
+    if ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'true', 'false', d)}; then
+        sed -i -e 's/^#elif defined(__unix__) && defined(EGL_NO_X11)$/#elif defined(__unix__) \&\& defined(EGL_NO_X11) || ${@bb.utils.contains('PACKAGECONFIG', 'x11', '0', '1', d)}/' ${D}${includedir}/EGL/eglplatform.h
+    fi
+}
+
+DEPENDS = "expat makedepend-native flex-native bison-native libxml2-native zlib chrpath-replacement-native python3-mako-native gettext-native"
+EXTRANATIVEPATH += "chrpath-native"
+PROVIDES = " \
+    ${@bb.utils.contains('PACKAGECONFIG', 'opengl', 'virtual/libgl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gles', 'virtual/libgles1 virtual/libgles2 virtual/libgles3', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'egl', 'virtual/egl', '', d)} \
+    ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'virtual/libgbm', '', d)} \
+    virtual/mesa \
+    "
+
+inherit meson pkgconfig python3native gettext features_check
+
+BBCLASSEXTEND = "native nativesdk"
+
+ANY_OF_DISTRO_FEATURES:class-target = "opengl vulkan"
+
+PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)}"
+
+export YOCTO_ALTERNATE_EXE_PATH = "${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE}/llvm-config"
+export YOCTO_ALTERNATE_MULTILIB_NAME = "${base_libdir}"
+export LLVM_CONFIG = "${STAGING_BINDIR_NATIVE}/llvm-config${MESA_LLVM_RELEASE}"
+export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
+
+MESA_LLVM_RELEASE ?= "${LLVMVERSION}"
+
+# set the MESA_BUILD_TYPE to either 'release' (default) or 'debug'
+# by default the upstream mesa sources build a debug release
+# here we assume the user will want a release build by default
+MESA_BUILD_TYPE ?= "release"
+def check_buildtype(d):
+    _buildtype = d.getVar('MESA_BUILD_TYPE')
+    if _buildtype not in ['release', 'debug']:
+        bb.fatal("unknown build type (%s), please set MESA_BUILD_TYPE to either 'release' or 'debug'" % _buildtype)
+    if _buildtype == 'debug':
+        return 'debugoptimized'
+    return 'plain'
+MESON_BUILDTYPE = "${@check_buildtype(d)}"
+
+EXTRA_OEMESON = " \
+    -Dshared-glapi=enabled \
+    -Dgallium-opencl=disabled \
+    -Dglx-read-only-text=true \
+    -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
+"
+
+def strip_comma(s):
+    return s.strip(',')
+
+PACKAGECONFIG:class-target ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri gallium virgl', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11 dri3', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
+                   elf-tls \
+		   "
+PACKAGECONFIG:class-native ?= "gbm gallium egl opengl elf-tls x11"
+PACKAGECONFIG:class-nativesdk ?= "gbm gallium egl opengl elf-tls x11"
+
+PACKAGECONFIG:remove:libc-musl = "elf-tls"
+
+# "gbm" requires "dri", "opengl"
+PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
+
+X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr"
+# "x11" requires "opengl"
+PACKAGECONFIG[x11] = ",-Dglx=disabled,${X11_DEPS}"
+PACKAGECONFIG[elf-tls] = "-Delf-tls=true, -Delf-tls=false"
+PACKAGECONFIG[xvmc] = "-Dgallium-xvmc=enabled,-Dgallium-xvmc=disabled,libxvmc"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm wayland-protocols"
+
+# "dri" requires "opengl"
+PACKAGECONFIG[dri] = "-Ddri-drivers=${@strip_comma('${DRIDRIVERS}')}, -Ddri-drivers='', xorgproto libdrm"
+PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
+
+# Vulkan drivers need dri3 enabled
+# amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
+VULKAN_DRIVERS = ""
+VULKAN_DRIVERS:append:x86:class-target = ",intel"
+VULKAN_DRIVERS:append:x86-64:class-target = ",intel"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
+PACKAGECONFIG[vulkan] = "-Dvulkan-drivers=${@strip_comma('${VULKAN_DRIVERS}')}, -Dvulkan-drivers='',"
+
+PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
+
+# "gles" requires "opengl"
+PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2=disabled"
+
+# "egl" requires "dri", "opengl"
+PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
+
+PACKAGECONFIG[broadcom] = ""
+PACKAGECONFIG[etnaviv] = ""
+PACKAGECONFIG[freedreno] = ""
+PACKAGECONFIG[kmsro] = ""
+PACKAGECONFIG[vc4] = ""
+PACKAGECONFIG[v3d] = ""
+
+GALLIUMDRIVERS = "swrast"
+# gallium swrast was found to crash Xorg on startup in x32 qemu
+GALLIUMDRIVERS:x86-x32 = ""
+GALLIUMDRIVERS:append:x86:class-target = ",i915,iris,crocus"
+GALLIUMDRIVERS:append:x86-64:class-target = ",i915,iris,crocus"
+
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'etnaviv', ',etnaviv', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'kmsro', ',kmsro', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'vc4', ',vc4', '', d)}"
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'v3d', ',v3d', '', d)}"
+
+# radeonsi requires LLVM
+GALLIUMDRIVERS_RADEONSI = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',radeonsi', '', d)}"
+GALLIUMDRIVERS_LLVM = "r300,nouveau${GALLIUMDRIVERS_RADEONSI}"
+GALLIUMDRIVERS_LLVM:append:x86:class-target = ",svga"
+GALLIUMDRIVERS_LLVM:append:x86-64:class-target = ",svga"
+
+PACKAGECONFIG[r600] = ""
+PACKAGECONFIG[virgl] = ""
+
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',${GALLIUMDRIVERS_LLVM}', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'r600', ',r600', '', d)}"
+GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
+
+PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
+PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm${MESA_LLVM_RELEASE} llvm-native \
+                               elfutils"
+PACKAGECONFIG[xa]  = "-Dgallium-xa=enabled, -Dgallium-xa=disabled"
+PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
+
+PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
+
+PACKAGECONFIG[lima] = ""
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
+
+PACKAGECONFIG[panfrost] = ""
+GALLIUMDRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
+
+PACKAGECONFIG[osmesa] = "-Dosmesa=true,-Dosmesa=false"
+
+PACKAGECONFIG[unwind] = "-Dlibunwind=enabled,-Dlibunwind=disabled,libunwind"
+
+PACKAGECONFIG[lmsensors] = "-Dlmsensors=enabled,-Dlmsensors=disabled,lmsensors"
+
+# llvmpipe is slow if compiled with -fomit-frame-pointer (e.g. -O2)
+FULL_OPTIMIZATION:append = " -fno-omit-frame-pointer"
+
+CFLAGS:append:armv5 = " -DMISSING_64BIT_ATOMICS"
+CFLAGS:append:armv6 = " -DMISSING_64BIT_ATOMICS"
+
+# Remove the mesa dependency on mesa-dev, as mesa is empty
+RDEPENDS:${PN}-dev = ""
+
+# Khronos documentation says that include/GLES2/gl2ext.h can be used for
+# OpenGL ES 3 specification as well as for OpenGL ES 2.
+# There can be applications including GLES2/gl2ext.h instead of GLES3/gl3ext.h
+# meaning we should probably bring in GLES2/gl2ext.h if someone asks for
+# development package of libgles3.
+RDEPENDS:libgles3-mesa-dev += "libgles2-mesa-dev"
+
+PACKAGES =+ "libegl-mesa libegl-mesa-dev \
+             libosmesa libosmesa-dev \
+             libgl-mesa libgl-mesa-dev \
+             libglapi libglapi-dev \
+             libgbm libgbm-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
+             libgles3-mesa libgles3-mesa-dev \
+             libxatracker libxatracker-dev \
+             mesa-megadriver mesa-vulkan-drivers \
+             mesa-vdpau-drivers \
+            "
+
+do_install:append () {
+    # Drivers never need libtool .la files
+    rm -f ${D}${libdir}/dri/*.la
+    rm -f ${D}${libdir}/egl/*.la
+    rm -f ${D}${libdir}/gallium-pipe/*.la
+    rm -f ${D}${libdir}/gbm/*.la
+
+    # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
+    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
+
+    # libwayland-egl has been moved to wayland 1.15+
+    rm -f ${D}${libdir}/libwayland-egl*
+    rm -f ${D}${libdir}/pkgconfig/wayland-egl.pc
+}
+
+# For the packages that make up the OpenGL interfaces, inject variables so that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    pkgconfig = (d.getVar('PACKAGECONFIG') or "").split()
+    suffix = ""
+    if "-native" in d.getVar("PN"):
+        suffix = "-native"
+    for p in (("egl", "libegl", "libegl1"),
+              ("dri", "libgl", "libgl1"),
+              ("gles", "libgles1", "libglesv1-cm1"),
+              ("gles", "libgles2", "libglesv2-2"),
+              ("gles", "libgles3",)):
+        if not p[0] in pkgconfig:
+            continue
+        mlprefix = d.getVar("MLPREFIX")
+        fullp = mlprefix + p[1] + "-mesa" + suffix
+        mlprefix = d.getVar("MLPREFIX")
+        pkgs = " " + " ".join(mlprefix + x + suffix for x in p[1:])
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.appendVar("RREPLACES:" + fullp, pkgs)
+        d.appendVar("RPROVIDES:" + fullp, pkgs)
+        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+
+        d.appendVar("RRECOMMENDS:" + fullp, " ${MLPREFIX}mesa-megadriver" + suffix)
+
+        # For -dev, the first element is both the Debian and original name
+        fullp = mlprefix + p[1] + "-mesa-dev" + suffix
+        pkgs = " " + mlprefix + p[1] + "-dev" + suffix
+        d.setVar("DEBIAN_NOAUTONAME:" + fullp, "1")
+        d.appendVar("RREPLACES:" + fullp, pkgs)
+        d.appendVar("RPROVIDES:" + fullp, pkgs)
+        d.appendVar("RCONFLICTS:" + fullp, pkgs)
+}
+
+python mesa_populate_packages() {
+    pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
+    for pkg in pkgs:
+        d.setVar("RPROVIDES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RCONFLICTS:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+        d.setVar("RREPLACES:%s" % pkg, pkg.replace("mesa", "mesa-dri", 1))
+
+    import re
+    dri_drivers_root = oe.path.join(d.getVar('PKGD'), d.getVar('libdir'), "dri")
+    if os.path.isdir(dri_drivers_root):
+        dri_pkgs = sorted(os.listdir(dri_drivers_root))
+        lib_name = d.expand("${MLPREFIX}mesa-megadriver")
+        for p in dri_pkgs:
+            m = re.match(r'^(.*)_dri\.so$', p)
+            if m:
+                pkg_name = " ${MLPREFIX}mesa-driver-%s" % legitimize_package_name(m.group(1))
+                d.appendVar("RPROVIDES:%s" % lib_name, pkg_name)
+                d.appendVar("RCONFLICTS:%s" % lib_name, pkg_name)
+                d.appendVar("RREPLACES:%s" % lib_name, pkg_name)
+
+    pipe_drivers_root = os.path.join(d.getVar('libdir'), "gallium-pipe")
+    do_split_packages(d, pipe_drivers_root, r'^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
+}
+
+PACKAGESPLITFUNCS:prepend = "mesa_populate_packages "
+
+PACKAGES_DYNAMIC += "^mesa-driver-.*"
+PACKAGES_DYNAMIC:class-native = "^mesa-driver-.*-native"
+
+FILES:mesa-megadriver = "${libdir}/dri/* ${datadir}/drirc.d/00-mesa-defaults.conf"
+FILES:mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
+FILES:${PN}-vdpau-drivers = "${libdir}/vdpau/*.so.*"
+FILES:libegl-mesa = "${libdir}/libEGL.so.*"
+FILES:libgbm = "${libdir}/libgbm.so.*"
+FILES:libgles1-mesa = "${libdir}/libGLESv1*.so.*"
+FILES:libgles2-mesa = "${libdir}/libGLESv2.so.*"
+FILES:libgl-mesa = "${libdir}/libGL.so.*"
+FILES:libglapi = "${libdir}/libglapi.so.*"
+FILES:libosmesa = "${libdir}/libOSMesa.so.*"
+FILES:libxatracker = "${libdir}/libxatracker.so.*"
+
+FILES:${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan ${libdir}/vdpau/*.so"
+FILES:libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES:libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
+FILES:libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES:libglapi-dev = "${libdir}/libglapi.*"
+FILES:libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES:libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
+FILES:libgles3-mesa-dev = "${includedir}/GLES3"
+FILES:libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/GL/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
+FILES:libxatracker-dev = "${libdir}/libxatracker.so ${libdir}/libxatracker.la \
+                          ${includedir}/xa_tracker.h ${includedir}/xa_composite.h ${includedir}/xa_context.h \
+                          ${libdir}/pkgconfig/xatracker.pc"
+
+# Fix upgrade path from mesa to mesa-megadriver
+RREPLACES:mesa-megadriver = "mesa"
+RCONFLICTS:mesa-megadriver = "mesa"
+RPROVIDES:mesa-megadriver = "mesa"
+
+# basic mesa recipe
 DRIDRIVERS ??= ""
 DRIDRIVERS:append:x86:class-target = ",r100,r200,nouveau,i965"
 DRIDRIVERS:append:x86-64:class-target = ",r100,r200,nouveau,i965"
 
+# mesa-gl variant
+inherit mcextend
+
+BBCLASSEXTEND += "mcextend:gl"
+
+S:virtclass-mcextend-gl = "${WORKDIR}/mesa-${PV}"
+
+SUMMARY:append:virtclass-mcextend-gl = " (OpenGL only, no EGL/GLES)"
+
+PROVIDES:virtclass-mcextend-gl = "virtual/libgl virtual/mesa"
+
+# At least one DRI rendering engine is required to build mesa.
+# When no X11 is available, use osmesa for the rendering engine.
+PACKAGECONFIG:virtclass-mcextend-gl = "opengl dri ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', 'osmesa gallium', d)}"
+
+# 21.0.0 version fails to build when any driver is enabled in DRIDRIVERS
+# ./mesa-21.0.0/meson.build:519:4: ERROR: Problem encountered: building dri drivers require at least one windowing system
+DRIDRIVERS:virtclass-mcextend-gl = ""
-- 
2.20.1


