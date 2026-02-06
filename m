Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A2CEE6B44
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:25 +0000 (UTC)
Received: from smtp-bc09.mail.infomaniak.ch (smtp-bc09.mail.infomaniak.ch [45.157.188.9])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2791.1770398660425542868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.9, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D25h92zLk5;
	Fri,  6 Feb 2026 18:24:18 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D22tZ6z97d;
	Fri,  6 Feb 2026 18:24:18 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:59 +0100
Subject: [PATCH 7/7] mesa: depend on mesa-tools-native for less expensive
 libclc dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-7-166935b0e379@cherry.de>
References: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
In-Reply-To: <20260206-mesa-tools-native-v1-0-166935b0e379@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Ross Burton <ross.burton@arm.com>
X-Mailer: b4 0.15-dev-bab12
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230638

From: Quentin Schulz <quentin.schulz@cherry.de>

libclc is required for some drivers (asahi, panfrost and intel at the
very least).

libclc brings very expensive per-target dependencies such as llvm and
clang.

However, we can make libclc depend on native tools (mesa-clc and
precomp-compiler via mesa-tools-native) such that this cost exists only
once (for the native build machine) and not for each machine to build.

So this migrates the libclc dependency to make use of the newly
introduced mesa-tools-native to make use of mesa-clc=system and
precomp-compiler=system.

We told the user to have libclc PACKAGECONFIG when selecting opencl
PACKAGECONFIG but its dependencies are now gone since we're using
mesa-tools-native for libclc. Therefore, this also moves the previous
dependencies of libclc PACKAGECONFIG to opencl such that we can still
build rusticl which still requires all dependencies from previous
implementation of libclc (as specified in meson.build[1][2][3][4]).

For some reason, libclc PACKAGECONFIG is still required otherwise
rusticl fails to build with the following (stripped) message:

"""
FAILED: [code=101] src/gallium/frontends/rusticl/rusticl_libc_bindings.rs
/build/tmp/work/cortexa35-poky-linux/mesa/25.3.3/recipe-sysroot-native/usr/bin/bindgen
../sources/mesa-25.3.3/src/gallium/frontends/rusticl/rusticl_libc_bindings.h
--output /build/tmp/work/cortexa35-poky-linux/mesa/25.3.3/build/src/gallium/frontends/rusticl/rusticl_libc_bindings.rs
[...]
-MD -MQ ../sources/mesa-25.3.3/src/gallium/frontends/rusticl/rusticl_libc_bindings.h
-MF src/gallium/frontends/rusticl/rusticl_libc_bindings.h.d

thread 'main' (3601157) panicked at bindgen/lib.rs:616:27:
Unable to find libclang: "couldn't find any valid shared libraries
matching: ['libclang.so', 'libclang-*.so', 'libclang.so.*',
'libclang-*.so.*'], set the `LIBCLANG_PATH` environment variable to a
path where one of these files can be found (invalid: [])"
note: run with `RUST_BACKTRACE=1` environment variable to display a backtrace
"""

libclang.so is available in the sysroot. Exporting LIBCLANG_PATH with
"${STAGING_LIB_DIR}" in the recipe doesn't do anything.

So for now, we keep telling the user to add libclc PACKAGECONFIG when
opencl is selected (and keep it in mesa.bb when DISTRO_FEATURES has
opencl) and maybe can figure out why we cannot build rusticl without
libclc PACKAGECONFIG later on. I'm also not sure if the

Note that does mean that when selecting opencl, mesa will bring the
expensive dependencies again, but I'm not sure there's anything we can
do about that at the moment.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.3.4/meson.build?ref_type=tags#L838-L839
[2] https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.3.4/meson.build?ref_type=tags#L850-L852
[3] https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.3.4/meson.build?ref_type=tags#L1849-L1850
[4] https://gitlab.freedesktop.org/mesa/mesa/-/blob/mesa-25.3.4/meson.build?ref_type=tags#L1855-L1856
Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 8e5f9657fd..48cd9981c2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -90,9 +90,9 @@ PACKAGECONFIG[glvnd] = "-Dglvnd=enabled, -Dglvnd=disabled, libglvnd"
 
 PACKAGECONFIG[opengl] = "-Dopengl=true, -Dopengl=false"
 
-# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
+# "opencl" also requires libclc and gallium-llvm to be present in PACKAGECONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true -Dmesa-clc-bundle-headers=enabled, -Dgallium-rusticl=false, bindgen-cli-native clang libclc spirv-tools spirv-llvm-translator"
 
 X11_DEPS = "xorgproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes xrandr xorgproto libxshmfence"
 # "x11" requires "opengl"
@@ -203,14 +203,7 @@ GALLIUMDRIVERS .= "${@bb.utils.contains('PACKAGECONFIG', 'zink', ',zink', '', d)
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
 
-MESA_CLC = "system"
-MESA_CLC:class-native = "enabled"
-INSTALL_MESA_CLC = "false"
-INSTALL_MESA_CLC:class-native = "true"
-MESA_NATIVE = "mesa-native"
-MESA_NATIVE:class-native = ""
-
-PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=system -Dprecomp-compiler=system,,mesa-tools-native"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 
 PACKAGECONFIG[perfetto] = "-Dperfetto=true,-Dperfetto=false,libperfetto"

-- 
2.53.0


