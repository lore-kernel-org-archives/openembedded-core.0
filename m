Return-Path: <psaavedra@igalia.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C854C433F5
	for <webhook@archiver.kernel.org>; Mon, 18 Oct 2021 15:29:23 +0000 (UTC)
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by mx.groups.io with SMTP id smtpd.web09.38008.1634570961432426720
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Oct 2021 08:29:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@igalia.com header.s=20170329 header.b=KyumfuRE;
 spf=pass (domain: igalia.com, ip: 178.60.130.6,
 mailfrom: psaavedra@igalia.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329;
	h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=z7Qr/7VAG4nxiwTCRWZrnoUltT2+XmSO6eL0ARPpPJY=;
	b=KyumfuRESIzuX9twlmJkG/mH6YCh64Inju8CHpc3+CvOc23hEWqF856VKYze00gvhCDoiZc7J241GuiYxu0H0rsmXV9YH7Zkcs4vv363Qni2VxRl4Gi6OrM7SPrfCEQTQ+bwVszO719s5MJqmcxMif1OlIzYwLaYNEor9kXfmXSAzf/rQ0wTNSeqkFX9zy5dvkwkD1pL+PgIJNI58CJaxjFsWB/lkoK3oVPpljk216/iJuCPKHnDJpDxSp6HBlpbzq4IMhc4vsgHRMouYRRnF9+6v1d3UUEwxxD4cJIJPVNLuiBw7HgiwshuYqaHUgk/+G+MxGBw/XzyGQNrut4LPg==;
Received: from 164.25.165.83.dynamic.reverse-mundo-r.com ([83.165.25.164]
 helo=golpe.local.igalia.com)
	by fanzine.igalia.com with esmtpsa
	(Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
	id 1mcUZg-0005Sz-Cn; Mon, 18 Oct 2021 17:29:16 +0200
From: Pablo Saavedra <psaavedra@igalia.com>
To: openembedded-core@lists.openembedded.org
Cc: Pablo Saavedra <psaavedra@igalia.com>
Subject: [OE-core][PATCH v2] mesa: upgrade 21.2.1 -> 21.2.4
Date: Mon, 18 Oct 2021 17:28:20 +0200
Message-Id: <20211018152820.3216421-1-psaavedra@igalia.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <CANNYZj9DEyAL9H2Et9npSjYP_yYo=iETxb7-2xKoaR_41tpYrQ@mail.gmail.com>
References: 
 <CANNYZj9DEyAL9H2Et9npSjYP_yYo=iETxb7-2xKoaR_41tpYrQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Oct 2021 15:29:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157082

Contains 'Make YUV formats we're going to emulate external-only' [1]
was applied in 21.2.4. This fixes red label issues on video for VC4,
Freedreno and others.

Deletes meta/recipes-graphics/mesa/files/without-neon.patch [2]
already in Mesa since 21.2.

Release notes:

* 21.2.2: https://docs.mesa3d.org/relnotes/21.2.2.html
* 21.2.3: https://docs.mesa3d.org/relnotes/21.2.3.html
* 21.2.4: https://docs.mesa3d.org/relnotes/21.2.4.html

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/13038
[2] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12569

Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
---
 .../mesa/files/without-neon.patch             | 53 -------------------
 .../{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb}  |  0
 meta/recipes-graphics/mesa/mesa.inc           |  3 +-
 .../mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb}   |  0
 4 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/files/without-neon.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_21.2.1.bb => mesa-gl_21.2.4.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.2.1.bb => mesa_21.2.4.bb} (100%)

diff --git a/meta/recipes-graphics/mesa/files/without-neon.patch b/meta/recipes-graphics/mesa/files/without-neon.patch
deleted file mode 100644
index 56e4aa7769..0000000000
--- a/meta/recipes-graphics/mesa/files/without-neon.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-Since 80923e8d ("util/format: Add some NEON intrinsics-based u_format_unpack.")
-upstream the build fails on Arm platforms which use the soft-float ABI, such as
-qemuarmv5:
-
- arm_neon.h:31:2: error: #error "NEON intrinsics not available with the
- soft-float ABI.  Please use -mfloat-abi=softfp or -mfloat-abi=hard"
-
-Take a patch from upstream to check the ABI being used before trying to
-use NEON instructions.
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/12569]
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From 5dcce985a6dd3b7856d65e21db753e2c7a0f5dd5 Mon Sep 17 00:00:00 2001
-From: Adrian Bunk <bunk@debian.org>
-Date: Thu, 26 Aug 2021 22:35:49 +0300
-Subject: [PATCH] util/format: NEON is not available with the soft-float ABI
-
-Fixes: 80923e8d58cc ("util/format: Add some NEON intrinsics-based u_format_unpack.")
----
- src/util/format/u_format.c             | 2 +-
- src/util/format/u_format_unpack_neon.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/util/format/u_format.c b/src/util/format/u_format.c
-index c49b3788c82..31f1f240efc 100644
---- a/src/util/format/u_format.c
-+++ b/src/util/format/u_format.c
-@@ -1138,7 +1138,7 @@ static void
- util_format_unpack_table_init(void)
- {
-    for (enum pipe_format format = PIPE_FORMAT_NONE; format < PIPE_FORMAT_COUNT; format++) {
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined NO_FORMAT_ASM
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
-       const struct util_format_unpack_description *unpack = util_format_unpack_description_neon(format);
-       if (unpack) {
-          util_format_unpack_table[format] = unpack;
-diff --git a/src/util/format/u_format_unpack_neon.c b/src/util/format/u_format_unpack_neon.c
-index 7456d7aaa88..a4a5cb1f723 100644
---- a/src/util/format/u_format_unpack_neon.c
-+++ b/src/util/format/u_format_unpack_neon.c
-@@ -23,7 +23,7 @@
- 
- #include <u_format.h>
- 
--#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined NO_FORMAT_ASM
-+#if (defined(PIPE_ARCH_AARCH64) || defined(PIPE_ARCH_ARM)) && !defined(NO_FORMAT_ASM) && !defined(__SOFTFP__)
- 
- /* armhf builds default to vfp, not neon, and refuses to compile neon intrinsics
-  * unless you tell it "no really".
--- 
-GitLab
-
diff --git a/meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb b/meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_21.2.1.bb
rename to meta/recipes-graphics/mesa/mesa-gl_21.2.4.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 4e95911165..f1a1e57062 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -19,10 +19,9 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0002-meson.build-make-TLS-ELF-optional.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-futex.h-Define-__NR_futex-if-it-does-not-exist.patch \
-           file://without-neon.patch \
            "
 
-SRC_URI[sha256sum] = "2c65e6710b419b67456a48beefd0be827b32db416772e0e363d5f7d54dc01787"
+SRC_URI[sha256sum] = "fe6ede82d1ac02339da3c2ec1820a379641902fd351a52cc01153f76eff85b44"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 
diff --git a/meta/recipes-graphics/mesa/mesa_21.2.1.bb b/meta/recipes-graphics/mesa/mesa_21.2.4.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa_21.2.1.bb
rename to meta/recipes-graphics/mesa/mesa_21.2.4.bb
-- 
2.30.2


