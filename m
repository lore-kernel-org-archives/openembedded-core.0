Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB371C7EE39
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from smtp-bc0c.mail.infomaniak.ch (smtp-bc0c.mail.infomaniak.ch [45.157.188.12])
 by mx.groups.io with SMTP id smtpd.web11.7441.1750769084573955245
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:44:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.12, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bRPmB6yLhz6Sl;
	Tue, 24 Jun 2025 14:44:42 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bRPmB1xlqznk7;
	Tue, 24 Jun 2025 14:44:42 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Jun 2025 14:44:26 +0200
Subject: [PATCH RFC 3/4] mesa: lighten up libclc dependencies for the
 target
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-mesa-libclc-panfrost-v1-3-9ed8ca980e21@cherry.de>
References: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
In-Reply-To: <20250624-mesa-libclc-panfrost-v1-0-9ed8ca980e21@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Jun 2025 12:44:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219264

From: Quentin Schulz <quentin.schulz@cherry.de>

By using mesa-native mesa-clc instead of libclc, we do not actually need
most of the heavy dependencies of the libclc PACKAGECONFIG as we simply
need to use the natively compiled mesa-clc instead. We thus can simply
depend on mesa-native for the target recipe.

libclc however is still required if opencl (rusticl) is selected.

Because asahi drivers are only enabled when libclc is also selected, we
can now remove the explicit dependency on MESA_NATIVE.
We do the same for panfrost even though libclc isn't enforced yet for
mesa for the target. Support for panfrost has been broken for a while
already anyway (because of the possibly missing libclc) but we'll fix it
in a later commit.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 330a04f1b098a2d3a6874f40feabe8836dd4cb37..eafe1697c48edc661b33a54c5856d8e577608fd5 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -158,7 +158,7 @@ PACKAGECONFIG[egl] = "-Degl=enabled, -Degl=disabled"
 
 # "opencl" also requires libclc and gallium-llvm to be present in PKGCONFIG!
 # Be sure to enable them both for the target and for the native build.
-PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native"
+PACKAGECONFIG[opencl] = "-Dgallium-rusticl=true, -Dgallium-rusticl=false, bindgen-cli-native libclc spirv-tools spirv-llvm-translator"
 
 PACKAGECONFIG[broadcom] = ""
 PACKAGECONFIG[etnaviv] = ",,python3-pycparser-native"
@@ -201,19 +201,21 @@ MESA_CLC = "system"
 MESA_CLC:class-native = "enabled"
 INSTALL_MESA_CLC = "false"
 INSTALL_MESA_CLC:class-native = "true"
-MESA_NATIVE = "mesa-native"
-MESA_NATIVE:class-native = ""
+# Reuse libclc from mesa-native instead of bringing heavy dependencies
+LIBCLC_DEPS = "mesa-native"
+LIBCLC_DEPS:class-native = "libclc spirv-tools spirv-llvm-translator"
 
 PACKAGECONFIG[gallium] = "-Dgallium-drivers=${@strip_comma('${GALLIUMDRIVERS}')}, -Dgallium-drivers='', libdrm"
 PACKAGECONFIG[gallium-llvm] = "-Dllvm=enabled -Dshared-llvm=enabled, -Dllvm=disabled, llvm llvm-native elfutils"
-PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,libclc spirv-tools spirv-llvm-translator ${MESA_NATIVE}"
+PACKAGECONFIG[libclc] = "-Dmesa-clc=${MESA_CLC} -Dinstall-mesa-clc=${INSTALL_MESA_CLC} -Dmesa-clc-bundle-headers=enabled,,${LIBCLC_DEPS}"
 PACKAGECONFIG[va] = "-Dgallium-va=enabled,-Dgallium-va=disabled,libva-initial"
 PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpau"
 
 PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 
-# Asahi requires precompiled compilers from mesa-native
-PACKAGECONFIG[asahi] = ",,${MESA_NATIVE}"
+# Asahi requires precompiled compilers and libclc from mesa-native
+# Make sure libclc is in mesa-native AND mesa PACKAGECONFIG
+PACKAGECONFIG[asahi] = ""
 
 PACKAGECONFIG[intel] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,crocus', '', d)}"
@@ -221,8 +223,9 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,c
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
-# Panfrost requires precompiled compilers from mesa-native
-PACKAGECONFIG[panfrost] = ",,${MESA_NATIVE}"
+# Panfrost requires precompiled compilers and libclc from mesa-native
+# Make sure libclc is in mesa-native AND mesa PACKAGECONFIG
+PACKAGECONFIG[panfrost] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""

-- 
2.49.0


