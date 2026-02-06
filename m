Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC47DEA795E
	for <webhook@archiver.kernel.org>; Fri,  6 Feb 2026 17:24:24 +0000 (UTC)
Received: from smtp-8fad.mail.infomaniak.ch (smtp-8fad.mail.infomaniak.ch [83.166.143.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2790.1770398659962898863
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Feb 2026 09:24:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 83.166.143.173, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (unknown [IPv6:2001:1600:7:10::a6b])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4f71D22X61zPRY;
	Fri,  6 Feb 2026 18:24:18 +0100 (CET)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4f71D16Yr2zCYb;
	Fri,  6 Feb 2026 18:24:17 +0100 (CET)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 06 Feb 2026 18:23:58 +0100
Subject: [PATCH 6/7] add mesa-tools native-only recipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mesa-tools-native-v1-6-166935b0e379@cherry.de>
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
 <openembedded-core@lists.openembedded.org>; Fri, 06 Feb 2026 17:24:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230637

From: Quentin Schulz <quentin.schulz@cherry.de>

libclc is required for some drivers (asahi, panfrost and intel at the
very least).

libclc brings very expensive dependencies such as llvm (through its
spirv-llvm-translator dependency) and clang.

Building clang and llvm for each target architecture is very expensive,
but mesa allows to depend on prebuilt host binaries (mesa-clc and
precomp-compiler). Those are built by mesa as well, but can be compiled
in mesa-native instead of mesa, making the dependency expensive but only
once regardless of the number of target architectures to build for.
Ideally the mesa-clc and precomp-compiler would only be compiled in
mesa-native if target mesa requires libclc support, however this is not
possible as a target recipe cannot impact or depend on a native recipe's
configuration. We thus have two choices, always build libclc in
mesa-native with its heavy dependencies and impact every build, or force
the user to modify the mesa-native recipe in a custom layer (as a native
recipe cannot use target's OVERRIDES). The latter is unacceptable so the
former seems to be the only option. Another big downside is that
mesa-native currently builds drivers (amd, nouveau, svga) which we may
have absolutely no interest in building, increasing the build time and
possibly dependencies list.

A third choice is to spin-off the native mesa recipe with libclc support
into a new recipe without drivers and only what's necessary to build
mesa-clc and precomp-compiler binaries.
This allows to keep a "clean" mesa-native recipe for whoever needs those
drivers built-in (e.g. for testing, for qemu-native, or whatever else)
and only bring the libclc dependency when required by the target recipe.

This is the native mesa tool recipe from the third choice. The next
commit will make use of it in the mesa recipes.

Suggested-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/conf/distro/include/maintainers.inc        |  1 +
 meta/recipes-graphics/mesa/mesa-tools-native.bb | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index b231daf485..40b1c45a4f 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -525,6 +525,7 @@ RECIPE_MAINTAINER:pn-menu-cache = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-mesa = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-demos = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-mesa-gl = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-mesa-tools-native = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-meson = "Trevor Gamblin <tgamblin@baylibre.com>"
 RECIPE_MAINTAINER:pn-meta-environment-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
 RECIPE_MAINTAINER:pn-meta-environment-extsdk-${MACHINE} = "Richard Purdie <richard.purdie@linuxfoundation.org>"
diff --git a/meta/recipes-graphics/mesa/mesa-tools-native.bb b/meta/recipes-graphics/mesa/mesa-tools-native.bb
new file mode 100644
index 0000000000..50d2f5cbb0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-tools-native.bb
@@ -0,0 +1,19 @@
+require mesa.inc
+inherit_defer native
+
+SUMMARY += " (tools only)"
+
+PACKAGECONFIG = "tools asahi panfrost"
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

-- 
2.53.0


