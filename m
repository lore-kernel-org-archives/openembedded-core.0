Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E86EFCCD199
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 14:59:03 +0000 (UTC)
Received: from smtp-190a.mail.infomaniak.ch (smtp-190a.mail.infomaniak.ch [185.125.25.10])
 by mx.groups.io with SMTP id smtpd.web10.11244.1760626739061581490
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 07:58:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.10, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cnWLT1v62zXSl;
	Thu, 16 Oct 2025 16:58:57 +0200 (CEST)
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4cnWLS2w6Mzrn4;
	Thu, 16 Oct 2025 16:58:56 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 16 Oct 2025 16:58:45 +0200
Subject: [PATCH] mesa: upgrade 25.2.4 -> 25.2.5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-mesa-25-2-5-v1-1-08035df5e74e@cherry.de>
X-B4-Tracking: v=1; b=H4sIACQI8WgC/x3MQQqAIBBA0avIrBvQMV10lWghOtUsslCIQLp70
 vIt/m9QuQhXmFSDwrdUOXOHGRTEPeSNUVI3kCZntPF4cA1IDgkd+tHGpFOIHC304iq8yvPf5uV
 9P65JoatdAAAA
X-Change-ID: 20251016-mesa-25-2-5-643cd0dacec3
To: openembedded-core@lists.openembedded.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.3
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Oct 2025 14:59:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224971

From: Quentin Schulz <quentin.schulz@cherry.de>

See https://docs.mesa3d.org/relnotes/25.2.5.html.

0001-glx-provide-glx.pc.patch is in 25.2.5 via commit 293a26135d83
("glx: provide glx.pc") so can be dropped.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Only build tested. kmscube run on Ringneck PX30 (Aarch64 Rockchip
board).

I have quickly glanced at the diff, one new header included (commit
5eb46a78d8dd ("vulkan/query_pool: Store video encode feedback")) but
it's already part of the dependencies listed in vulkan_lite_runtime_deps
and its companion C file is also in vulkan_lite_runtime_files so it
should be just fine without a change in the recipe.

A meson config file changed in commit 4ea070a741bf ("amd: require LLVM
when amd-use-llvm is enabled") but AFAICT we don't use this meson option
so it changes nothing for us.
---
 .../mesa/files/0001-glx-provide-glx.pc.patch       | 41 ----------------------
 meta/recipes-graphics/mesa/mesa.inc                |  5 ++-
 2 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch b/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
deleted file mode 100644
index dbe58fcc89..0000000000
--- a/meta/recipes-graphics/mesa/files/0001-glx-provide-glx.pc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4fed044aaed5911fdc58d2a634f34a7186836935 Mon Sep 17 00:00:00 2001
-From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Date: Sun, 12 Oct 2025 23:54:25 +0300
-Subject: [PATCH] glx: provide glx.pc
-
-New Vulkan CTS 1.4.4 started requiring glx.pc pkg-config file. Provide
-one if GLVND is not used in order to let VK CTS and other programs find
-Mesa GLX implementation.
-
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/37834]
----
- src/glx/meson.build | 12 ++++++++++++
- 1 file changed, 12 insertions(+)
-
-diff --git a/src/glx/meson.build b/src/glx/meson.build
-index 04fdf26ba6a2..28313f83a783 100644
---- a/src/glx/meson.build
-+++ b/src/glx/meson.build
-@@ -134,6 +134,18 @@ libgl = shared_library(
-   install : true,
- )
- 
-+if not with_glvnd
-+  pkg.generate(
-+    name : 'glx',
-+    description : 'Mesa GLX Library',
-+    version : meson.project_version(),
-+    libraries : libgl,
-+    libraries_private : gl_priv_libs,
-+    requires_private : gl_priv_reqs,
-+    variables : ['glx_tls=yes'],
-+  )
-+endif
-+
- if with_symbols_check
-   libgl_symbols_file = with_glvnd ? 'glvnd-symbols.txt' : 'libgl-symbols.txt'
- 
--- 
-2.51.0
-
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 1485e0b727..6a36aea259 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,11 +17,10 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-glx-provide-glx.pc.patch \
 "
 
-SRC_URI[sha256sum] = "a370b4c549cbfbe646b319e34d73edb50ed883978f5e95133f282f0eae39ab52"
-PV = "25.2.4"
+SRC_URI[sha256sum] = "bb6243e7a6f525febfa1e6ab50827ca4d4bfdad73812377b0ca9b6c50998b03e"
+PV = "25.2.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

---
base-commit: 5284c01374eb3957ab13ff3f271424e9ee7b9840
change-id: 20251016-mesa-25-2-5-643cd0dacec3

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


