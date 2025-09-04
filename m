Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E61BDCA101C
	for <webhook@archiver.kernel.org>; Thu,  4 Sep 2025 14:04:00 +0000 (UTC)
Received: from smtp-190f.mail.infomaniak.ch (smtp-190f.mail.infomaniak.ch [185.125.25.15])
 by mx.groups.io with SMTP id smtpd.web11.40129.1756994639254932473
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Sep 2025 07:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 185.125.25.15, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4cHh6P6d57ztlv;
	Thu,  4 Sep 2025 16:03:57 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4cHh6P2shPzlT2;
	Thu,  4 Sep 2025 16:03:57 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Thu, 04 Sep 2025 16:03:39 +0200
Subject: [PATCH v7 10/13] mesa: avoid host paths poisoning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250904-mesa-libclc-panfrost-v7-10-e921a65412f7@cherry.de>
References: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
In-Reply-To: <20250904-mesa-libclc-panfrost-v7-0-e921a65412f7@cherry.de>
To: openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Markus Volk <f_l_k@t-online.de>, Trevor Woerner <twoerner@gmail.com>, 
 Ross Burton <ross.burton@arm.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.14.2
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Sep 2025 14:04:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222943

From: Quentin Schulz <quentin.schulz@cherry.de>

At least panfrost and asahi drivers are prone to host paths poisoning
due to unpatched __FILE__ macro in assert() of libcl.

The compilation units for files including this file all are passed
specific arguments via the cl_args meson variable which currently only
contains one fmacro-prefix-map entry for relative paths. However, there
are also absolute build and source paths that seem to make it to the
generated files and libraries so this patches mesa to also strip those
paths.

Note that out of the four paths in the default DEBUG_PREFIX_MAP, only
the source and build directories make it to the fmacro-prefix-map and
they aren't mapped like they are when used with ffile-prefix-map in
DEBUG_PREFIX_MAP as I'm not sure if it is at all possible for meson to
fetch this Yocto-provided path we should be mapping to in the current
mesa code base. I guess this is good enough for now.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 ...01-meson-fix-libcl-assert-reproducibility.patch | 43 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                |  1 +
 2 files changed, 44 insertions(+)

diff --git a/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch b/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch
new file mode 100644
index 0000000000000000000000000000000000000000..118b52a22714594999f9c8d38a56b47afe4e4e66
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-meson-fix-libcl-assert-reproducibility.patch
@@ -0,0 +1,43 @@
+From b9d43acde2d2e21d321e57d632cac199e41048ef Mon Sep 17 00:00:00 2001
+From: Quentin Schulz <quentin.schulz@cherry.de>
+Date: Thu, 21 Aug 2025 17:24:08 +0200
+Subject: [PATCH] meson: fix libcl assert() reproducibility
+
+The current -fmacro-prefix-map only handles removal of relative paths
+but we still need to handle absolute paths.
+
+The following path can be found in libvulkan_panfrost.so when building
+with Yocto for example:
+/work/build/tmp/work/cortexa76-cortexa55-crypto-poky-linux/mesa/25.2.0/sources/mesa-25.2.0/src/panfrost/libpan/../../util/bitpack_helpers.h
+
+These paths currently seem to only appear in the binary in strings that
+start with "Shader assertion fail at " which seems to indicate there are
+calls to assert() with absolute paths as well as relative paths (which
+are already patched with fmacro-prefix-map).
+
+By stripping the global source and build root directories from the paths
+with -fmacro-prefix-map, we get rid of this reproducibility issue (which
+incidentally makes the build fail due to buildpaths QA issue).
+
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+
+Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36927]
+
+Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
+---
+ meson.build | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/meson.build b/meson.build
+index 9cc75f6636e..d4779905020 100644
+--- a/meson.build
++++ b/meson.build
+@@ -52,6 +52,8 @@ relative_dir = fs.relative_to(meson.global_source_root(), meson.global_build_roo
+ 
+ cl_args = [
+   '-fmacro-prefix-map=@0@/='.format(relative_dir),
++  '-fmacro-prefix-map=@0@/='.format(meson.global_source_root()),
++  '-fmacro-prefix-map=@0@/='.format(meson.global_build_root()),
+ 
+   # Set the OpenCL standard to CL 2.0, enabling everything at a frontend.
+   # Drivers may not actually support everything but that's ok.
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4b1c11be55f7b3f54b5244674263b83a8703bc25..beaf99b796f117ab4b7b10bf9c9ea57d65995ddb 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -17,6 +17,7 @@ PE = "2"
 SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-freedreno-don-t-encode-build-path-into-binaries.patch \
+           file://0001-meson-fix-libcl-assert-reproducibility.patch \
 "
 
 SRC_URI[sha256sum] = "7c726b21c074d14d31d253d638b741422f3c0a497ce7f1b4aaaa917d10bd8d4f"

-- 
2.51.0


