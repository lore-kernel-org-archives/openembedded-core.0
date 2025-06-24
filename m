Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5555C7EE32
	for <webhook@archiver.kernel.org>; Tue, 24 Jun 2025 12:44:48 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web10.7291.1750769083609969147
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Jun 2025 05:44:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246b])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4bRPmB1Y37zJmD;
	Tue, 24 Jun 2025 14:44:42 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4bRPm946X3zpCr;
	Tue, 24 Jun 2025 14:44:41 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Tue, 24 Jun 2025 14:44:25 +0200
Subject: [PATCH RFC 2/4] mesa: use native precompiled compilers instead of
 compiling them for the target recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-mesa-libclc-panfrost-v1-2-9ed8ca980e21@cherry.de>
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219263

From: Quentin Schulz <quentin.schulz@cherry.de>

Make mesa-native build and install precompiled compilers so that mesa
can use them.

The goal is to eventually remove the heavy dependencies for libclc in
the mesa target recipe.

As far as I know, this needs libclc in mesa-native but it's already
enabled by default.

Because we would need the mesa target recipe to know whether the
mesa-native has built and installed the precompiled compilers in order
to make use of them in the target recipe and that it is not possible to
do that (as it crosses the recipe boundary), we force the building and
installing of the precompiled compilers in mesa-native.

Since asahi and panfrost both have precompiled compilers, they are now
added to the default native PACKAGECONFIG. We technically wouldn't need
to build the drivers since only the tools are required in the native
recipe but this is necessary for both to appear in TOOLS variable, so
we'll leave it at that for the moment. We also don't really need to
compile panfrost and asahi drivers, only the panfrost and asahi tools
but the latter cannot be enabled without the former with the current
state of the recipe.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-graphics/mesa/mesa.inc | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1355c0c3ba5ee07ec24bc5e05f6adf0e17e9782a..330a04f1b098a2d3a6874f40feabe8836dd4cb37 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -73,7 +73,14 @@ def check_buildtype(d):
     return 'plain'
 MESON_BUILDTYPE = "${@check_buildtype(d)}"
 
+PRECOMP_COMPILER = "system"
+PRECOMP_COMPILER:class-native = "enabled"
+INSTALL_PRECOMP_COMPILER = "false"
+INSTALL_PRECOMP_COMPILER:class-native = "true"
+
 EXTRA_OEMESON = " \
+    -Dprecomp-compiler=${PRECOMP_COMPILER} \
+    -Dinstall-precomp-compiler=${INSTALL_PRECOMP_COMPILER} \
     -Dglx-read-only-text=true \
     -Dplatforms='${@",".join("${PLATFORMS}".split())}' \
 "
@@ -95,7 +102,7 @@ INHIBIT_DEFAULT_RUST_DEPS = "${@bb.utils.contains('PACKAGECONFIG', 'opencl', '',
 PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau svga"
 PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
+PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga panfrost asahi tools"
 
 # "gbm" requires "opengl"
 PACKAGECONFIG[gbm] = "-Dgbm=enabled,-Dgbm=disabled"
@@ -205,7 +212,8 @@ PACKAGECONFIG[vdpau] = "-Dgallium-vdpau=enabled,-Dgallium-vdpau=disabled,libvdpa
 
 PACKAGECONFIG[imagination] = "-Dimagination-srv=true,-Dimagination-srv=false"
 
-PACKAGECONFIG[asahi] = ""
+# Asahi requires precompiled compilers from mesa-native
+PACKAGECONFIG[asahi] = ",,${MESA_NATIVE}"
 
 PACKAGECONFIG[intel] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,crocus', '', d)}"
@@ -213,7 +221,8 @@ GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'intel', ',i915,c
 PACKAGECONFIG[lima] = ""
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'lima', ',lima', '', d)}"
 
-PACKAGECONFIG[panfrost] = ""
+# Panfrost requires precompiled compilers from mesa-native
+PACKAGECONFIG[panfrost] = ",,${MESA_NATIVE}"
 GALLIUMDRIVERS:append = "${@bb.utils.contains('PACKAGECONFIG', 'panfrost', ',panfrost', '', d)}"
 
 PACKAGECONFIG[tegra] = ""

-- 
2.49.0


