Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CD0FCA0EFA
	for <webhook@archiver.kernel.org>; Tue, 19 Aug 2025 08:16:32 +0000 (UTC)
Received: from smtp-42a8.mail.infomaniak.ch (smtp-42a8.mail.infomaniak.ch [84.16.66.168])
 by mx.groups.io with SMTP id smtpd.web10.8641.1755591381834373431
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Aug 2025 01:16:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.168, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4c5j8h2RBKz8Cc;
	Tue, 19 Aug 2025 10:16:20 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4c5j8g5Z6fzQTV;
	Tue, 19 Aug 2025 10:16:19 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 19 Aug 2025 10:16:08 +0200
Subject: [PATCH v5 8/9] mesa: use simpler mesa-tools-native recipe as
 dependency for libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-mesa-libclc-panfrost-v5-8-b8b89e6af908@cherry.de>
References: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
In-Reply-To: <20250819-mesa-libclc-panfrost-v5-0-b8b89e6af908@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Otavio Salvador <otavio.salvador@ossystems.com.br>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Aug 2025 08:16:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222085

From: Quentin Schulz <quentin.schulz@cherry.de>

libclc is required for some drivers (asahi, panfrost and intel at the
very least).
libclc brings very expensive dependencies such as llvm and clang.
Building clang and llvm for each target architecture is very expensive,
but mesa allows to depend on prebuilt host binaries (mesa-clc and
precomp-compiler). Those are built by mesa as well, but can be compiled
in mesa-native instead of mesa, making the dependency expensive but only
once regardless of the number of target architectures to build for.
Ideally the mesa-clc and precomp-compiler would only be compiled in
mesa-native if target mesa requires libclc support, however this is not
possible as a target recipe cannot impact or depend on a native recipe's
configuration. We thus have two choices, always build libclc in
mesa-native with its heavy dependencies and impact every build or force
the user to modify the mesa-native recipe in a custom layer (as a native
recipe cannot use target's OVERRIDES). The latter is unacceptable so the
former seems to be the only option. Another big downside is that
mesa-native currently builds drivers (amd, nouveau, svga) which we may
have absolutely no interest in building, increasing the build time and
possibly dependencies list).

A third choice is to spin-off the native mesa recipe with libclc support
into a new recipe without drivers and only what's necessary to build
mesa-clc and precomp-compiler binaries.
This allows to keep a "clean" mesa-native recipe for whoever needs those
drivers built-in (e.g. for testing, for qemu-native, or whatever else)
and only bring the libclc dependency when required by the target recipe.

Because libclc is now only built for the host, opencl support now needs
to explicitly bring libclc and others to build as libclc won't bring it
in the build environment anymore.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 19 +++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc             | 15 ++++-----------
 2 files changed, 23 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
new file mode 100644
index 0000000000000000000000000000000000000000..144b5101f155c4be9fca9f72add4aa41c8b80e59
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -0,0 +1,19 @@
+require mesa.inc
+inherit native
+
+SUMMARY += " (tools only)"
+
+PACKAGECONFIG = "tools asahi intel panfrost"
+# llvm required for libclc
+PACKAGECONFIG += "gallium-llvm"
+# Doesn't compile without wayland-scanner if PLATFORMS has wayland in, and,
+# doesn't compile at all if PLATFORMS is empty so add x11 and wayland
+# to PACKAGECONFIG like in mesa.inc
+PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'x11 wayland', d)}"
+
+DEPENDS += "libclc-native spirv-tools-native spirv-llvm-translator-native"
+
+EXTRA_OEMESON += " \
+    -Dmesa-clc=enabled -Dinstall-mesa-clc=true -Dmesa-clc-bundle-headers=enabled \
+    -Dprecomp-compiler=enabled -Dinstall-precomp-compiler=true \
+"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 81b099bf6e5fe624e91e6a780f8bb55854580c2d..e4c606e4a253a5c2b0d641fbae7156665dc447a2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -125,9 +125,9 @@ PACKAGECONFIG[gles] = "-Dgles1=enabled -Dgles2=enabled, -Dgles1=disabled -Dgles2
 # "egl" requires "opengl"
 PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
-# "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
-# Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
+# "opencl" also requires gallium-llvm to be present in PACKAGECONFIG!
+# Be sure to enable it for the target and for the native build.
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
@@ -166,16 +166,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'amd', ',r600', '', d)}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'virgl', ',virgl', '', d)}"
 
-MESA_CLC = "system"
-MESA_CLC:class-native = "enabled"
-INSTALL_MESA_CLC = "false"
-INSTALL_MESA_CLC:class-native = "true"
-MESA_NATIVE = "mesa-native"
-MESA_NATIVE:class-native = ""
-
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=system -Dprecomp-compiler=system,,mesa-tools-native"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 

-- 
2.50.1


