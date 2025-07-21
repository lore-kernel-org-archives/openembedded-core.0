Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F8BC83F25
	for <webhook@archiver.kernel.org>; Mon, 21 Jul 2025 10:34:02 +0000 (UTC)
Received: from smtp-42af.mail.infomaniak.ch (smtp-42af.mail.infomaniak.ch [84.16.66.175])
 by mx.groups.io with SMTP id smtpd.web10.37289.1753094035384236843
 for <openembedded-core@lists.openembedded.org>;
 Mon, 21 Jul 2025 03:33:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.175, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4blxZn74wczP5B;
	Mon, 21 Jul 2025 12:33:53 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4blxZn3YB6zVBQ;
	Mon, 21 Jul 2025 12:33:53 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Mon, 21 Jul 2025 12:33:42 +0200
Subject: [PATCH RFC v2 5/6] mesa: use simpler mesa-tools-native recipe as
 dependency for libclc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-mesa-libclc-panfrost-v2-5-f713d0858949@cherry.de>
References: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
In-Reply-To: <20250721-mesa-libclc-panfrost-v2-0-f713d0858949@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Mon, 21 Jul 2025 10:34:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220678

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
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 21 +++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc             | 11 ++---------
 2 files changed, 23 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
new file mode 100644
index 0000000000000000000000000000000000000000..5f7c3a2dc2338e328e0e30b93c263f6c87b61eaa
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -0,0 +1,21 @@
+require mesa.inc
+inherit native
+
+SUMMARY += " (tools only)"
+
+S = "${UNPACKDIR}/mesa-${PV}"
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
index 5295b70fc9b4bb9570d86333f9229aef9114d93d..0fdb6d19655a06b645c6ac8815dfc62fa7e0c9eb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -126,7 +126,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
@@ -165,16 +165,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', '
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


