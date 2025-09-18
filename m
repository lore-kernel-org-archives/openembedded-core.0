Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33A10CA1013
	for <webhook@archiver.kernel.org>; Thu, 18 Sep 2025 17:19:55 +0000 (UTC)
Received: from smtp-bc0e.mail.infomaniak.ch (smtp-bc0e.mail.infomaniak.ch [45.157.188.14])
 by mx.groups.io with SMTP id smtpd.web11.21356.1758215988268141198
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Sep 2025 10:19:48 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 45.157.188.14, mailfrom: foss+yocto@0leil.net)
Received: from smtp-3-0000.mail.infomaniak.ch (smtp-3-0000.mail.infomaniak.ch [10.4.36.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cSMnt2ty8z1q5;
	Thu, 18 Sep 2025 19:19:46 +0200 (CEST)
Received: from unknown by smtp-3-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cSMns5YmQz8KR;
	Thu, 18 Sep 2025 19:19:45 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 18 Sep 2025 19:19:30 +0200
Subject: [PATCH] mesa: upgrade 25.2.2 -> 25.2.3
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-mesa-25-2-3-v1-1-75682a574388@cherry.de>
X-B4-Tracking: v=1; b=H4sIACE/zGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDS0ML3dzU4kRdI1NdI11jXaNUC6OUJPOUlDRjQyWgjoKi1LTMCrBp0bG
 1tQCp4rO7XQAAAA==
X-Change-ID: 20250918-mesa-25-2-3-2e82db7ddf31
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Sep 2025 17:19:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223653

From: Quentin Schulz <quentin.schulz@cherry.de>

Changelog and sha256sum: https://docs.mesa3d.org/relnotes/25.2.3.html

0001-meson-fix-libcl-assert-reproducibility.patch was merged in 25.2.3
(see commit 3445cb5577058262a2648cff6fdcdbd289ce1147) so can be removed.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
Not build tested, have quickly checked the diff and nothing stands out
as requiring changes aside from the removal of one patch.

I'll let the autobuilder scream at me otherwise :)
---
 ...01-meson-fix-libcl-assert-reproducibility.patch | 43 ----------------------
 meta/recipes-graphics/mesa/mesa.inc                |  5 +--
 2 files changed, 2 insertions(+), 46 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch b/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch
deleted file mode 100644
index 118b52a22714594999f9c8d38a56b47afe4e4e66..0000000000000000000000000000000000000000
--- a/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-From b9d43acde2d2e21d321e57d632cac199e41048ef Mon Sep 17 00:00:00 2001
-From: Quentin Schulz <quentin.schulz@cherry.de>
-Date: Thu, 21 Aug 2025 17:24:08 +0200
-Subject: [PATCH] meson: fix libcl assert() reproducibility
-
-The current -fmacro-prefix-map only handles removal of relative paths
-but we still need to handle absolute paths.
-
-The following path can be found in libvulkan_panfrost.so when building
-with Yocto for example:
-/work/build/tmp/work/cortexa76-cortexa55-crypto-poky-linux/mesa/25.2.0/sources/mesa-25.2.0/src/panfrost/libpan/../../util/bitpack_helpers.h
-
-These paths currently seem to only appear in the binary in strings that
-start with "Shader assertion fail at " which seems to indicate there are
-calls to assert() with absolute paths as well as relative paths (which
-are already patched with fmacro-prefix-map).
-
-By stripping the global source and build root directories from the paths
-with -fmacro-prefix-map, we get rid of this reproducibility issue (which
-incidentally makes the build fail due to buildpaths QA issue).
-
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36927]
-
-Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
----
- meson.build | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/meson.build b/meson.build
-index 9cc75f6636e..d4779905020 100644
---- a/meson.build
-+++ b/meson.build
-@@ -52,6 +52,8 @@ relative_dir = fs.relative_to(meson.global_source_root(), meson.global_build_roo
- 
- cl_args = [
-   '-fmacro-prefix-map=@0@/='.format(relative_dir),
-+  '-fmacro-prefix-map=@0@/='.format(meson.global_source_root()),
-+  '-fmacro-prefix-map=@0@/='.format(meson.global_build_root()),
- 
-   # Set the OpenCL standard to CL 2.0, enabling everything at a frontend.
-   # Drivers may not actually support everything but that's ok.
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ee83c9546fa14b5a09cf9db57fc17180d03a31c5..c3751f3414c1187202b73c9e4a50712a69e49e9a 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,11 +17,10 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
-           file://0001-meson-fix-libcl-assert-reproducibility.patch \
 "
 
-SRC_URI[sha256sum] = "43d7abcd4aa8049d8fd75538344a374104765e81e17b4a6314cee2c0160e4412"
-PV = "25.2.2"
+SRC_URI[sha256sum] = "f2d6b28562f1d6cb9c17ee8e58eeade7aa5faf927ae71065eadb41e17f92b4f8"
+PV = "25.2.3"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

---
base-commit: 3710050655d8de5a1b4b7b5dcbc1366a8a9a6210
change-id: 20250918-mesa-25-2-3-2e82db7ddf31

Best regards,
-- 
Quentin Schulz <quentin.schulz@cherry.de>


