Return-Path: <l.stach@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66AB5C35274
	for <webhook@archiver.kernel.org>; Fri, 15 Dec 2023 13:37:49 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
 by mx.groups.io with SMTP id smtpd.web11.62720.1702647459116339717
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Dec 2023 05:37:39 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.201.7, mailfrom: l.stach@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rE8Nl-0007gh-1p
	for openembedded-core@lists.openembedded.org; Fri, 15 Dec 2023 14:37:37 +0100
Received: from [2a0a:edc0:0:1101:1d::54] (helo=dude05.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <l.stach@pengutronix.de>)
	id 1rE8Nk-00G2X5-49
	for openembedded-core@lists.openembedded.org; Fri, 15 Dec 2023 14:37:36 +0100
From: Lucas Stach <l.stach@pengutronix.de>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] mesa: upgrade 23.2.1 -> 23.3.1
Date: Fri, 15 Dec 2023 14:37:36 +0100
Message-Id: <20231215133736.117536-1-l.stach@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: openembedded-core@lists.openembedded.org
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Dec 2023 13:37:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192431

- build amd vulkan driver for x86 platforms
- drop included patch
[https://gitlab.freedesktop.org/mesa/mesa/-/blob/1fbdd37d4c1133ced5eb9812daa1fff04cbf5daa/meson.build#L1711]

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
Based on the 23.3.0 update patch [1] from Markus Volk, but bumped to 23.3.1
and fixed sstate mismatches between 32bit and 64bit.

[1] https://lore.kernel.org/openembedded-core/POQF5S.M9F40QH9IVRS1@t-online.de/
---
 ...e-cmake-dependency-detector-for-llvm.patch | 42 -------------------
 .../{mesa-gl_23.2.1.bb => mesa-gl_23.3.1.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  9 ++--
 .../mesa/{mesa_23.2.1.bb => mesa_23.3.1.bb}   |  0
 4 files changed, 4 insertions(+), 47 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_23.2.1.bb => mesa-gl_23.3.1.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_23.2.1.bb => mesa_23.3.1.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch b/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
deleted file mode 100644
index 4cded0546dc4..000000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-Disable-cmake-dependency-detector-for-llvm.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 00d41cd5aa3f4b494dc276c9b4ccdc096310c91f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 28 Sep 2023 15:34:22 -0700
-Subject: [PATCH] meson: use llvm-config instead of cmake to fix linking errors with meson 1.2.1
-
-meson dependency auto dependency detection uses cmake and then
-config-tool to process dependencies, in mesa the logic to detect llvm is
-using auto detection which means if it finds cmake then it will try to
-use cmake method. Cmake method works ok except a case when llvm-dev
-package is installed on the build host then it generates its own
-native.meson file and ignores OE supplied meson.native file which has
-correct llvm-config tool specified which is pointing to llvm-config from
-native sysroot. The generated meson.native file points to one found in
-/usr/bin and there onwards detector finds native install of llvm and
-configures that into building native mesa package.
-
-Since cmake detector does not always work, disable it by default and use
-config-tool which works in all cases. This is suggested in below issues
-too
-
-A similar issue is open in meson upstream [1] and mesa [2]
-
-[1] https://github.com/mesonbuild/meson/issues/10483
-[2] https://gitlab.freedesktop.org/mesa/mesa/-/issues/6738
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/25438]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- meson.build | 1 +
- 1 file changed, 1 insertion(+)
-
---- a/meson.build
-+++ b/meson.build
-@@ -1659,6 +1659,7 @@ with_llvm = false
- if _llvm.allowed()
-   dep_llvm = dependency(
-     'llvm',
-+    method : host_machine.system() == 'windows' ? 'auto' : 'config-tool',
-     version : _llvm_version,
-     modules : llvm_modules,
-     optional_modules : llvm_optional_modules,
diff --git a/meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_23.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_23.2.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_23.3.1.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index e5c405a9728c..5f5c8ceb4c84 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,10 +18,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-gallium-Fix-build-with-llvm-17.patch \
-           file://0001-meson-Disable-cmake-dependency-detector-for-llvm.patch \
 "
 
-SRC_URI[sha256sum] = "64de0616fc2d801f929ab1ac2a4f16b3e2783c4309a724c8a259b20df8bbc1cc"
+SRC_URI[sha256sum] = "6e48126d70fdb3f20ffeb246ca0c2e41ffdc835f0663a03d4526b8bf5db41de6"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
@@ -105,10 +104,10 @@ PACKAGECONFIG[dri3] = "-Ddri3=enabled, -Ddri3=disabled, xorgproto libxshmfence"
 # Vulkan drivers need dri3 enabled
 # amd could be enabled as well but requires gallium-llvm with llvm >= 3.9
 VULKAN_DRIVERS = ""
-VULKAN_DRIVERS:append:x86 = ",intel"
-VULKAN_DRIVERS:append:x86-64 = ",intel"
+VULKAN_DRIVERS:append:x86 = ",intel,amd"
+VULKAN_DRIVERS:append:x86-64 = ",intel,amd"
 # i686 is a 32 bit override for mesa-native
-VULKAN_DRIVERS:append:i686 = ",intel"
+VULKAN_DRIVERS:append:i686 = ",intel,amd"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'freedreno', ',freedreno', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'broadcom', ',broadcom', '', d)}"
 VULKAN_DRIVERS:append ="${@bb.utils.contains('PACKAGECONFIG', 'gallium-llvm', ',swrast', '', d)}"
diff --git a/meta/recipes-graphics/mesa/mesa_23.2.1.bb b/meta/recipes-graphics/mesa/mesa_23.3.1.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_23.2.1.bb
rename to meta/recipes-graphics/mesa/mesa_23.3.1.bb
-- 
2.43.0


