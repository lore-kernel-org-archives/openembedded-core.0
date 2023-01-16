Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83159C54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 15:30:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.169571.1673883040123835558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 07:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HiggkNbU;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id o17-20020a05600c511100b003db021ef437so1044553wms.4
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BC/yHzJG8t7qrANC1VjPK0P7Hwu48Z1ymxop3xIQkuY=;
        b=HiggkNbUGoIGmq0V075UvYhrMHNddBXk9ZZ0u26BpJ1QQhaXzo1ZjhRb79TppbeckD
         76a8NveojBmva65ZeNYFblIcjcgYD0prcj7FFSFWtagPHCjXXLYDMji1f117IYdoFklO
         hMDQGGIPcl1kQa/dzo8aVyFyj+1RcWrz5JzOwcMMv7sSvBSYY6k4JkFFNVUn/dA65DxO
         Vb0QR0Rd/Zmt2pVOQEjrJAdB1tLGMZ1mdZyrZFEyNEfJbZLUUXgQgMUidZdDW5WCTvUy
         i4wHZXZffVt7/n2yI0gsCuanrUZ9oQwy/RqcJ66rNcSoEuhCnrpV/+P7rjytpJyECgoE
         +xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BC/yHzJG8t7qrANC1VjPK0P7Hwu48Z1ymxop3xIQkuY=;
        b=j6njvlLmd38ueIH0wazbaBijTfI5ZdRSF4Mjiq2/L/B6/Wk4aA52Kp+zbMvDkC20hC
         T1paLvLTE+14DKlGipSA1QFP3cIAej1C21tYNxYX+Pe4piCTQBumsMefGWKvJrEGSVkj
         wZVUqjPWVqG0xuM8dd11GkdXdD2ZZNnQLlC473f+AWYgJlW+xySBATYNLJH36DllWIij
         7K4K9qAuH515Y0gWkk5EyuR+aAgACfMgRMziwAVS5KRBdSfQq++I9SnsUeY8EBxKqGYC
         70bS/I3CZmsyFjctPBvgXHXyllyzzKu9ffAS+pL3gfPjULrEsL9zUgb7kmTTniS8U1qy
         UG7Q==
X-Gm-Message-State: AFqh2kql//m8lQEVfGf1NEH+2o50HFp458M1be9uTYpn2haHeevKTO5s
	hFixDq40IJU8M8Wvv6Y0OAwanCuDP40=
X-Google-Smtp-Source: AMrXdXtZPqip1uy07EoF1rRe9xYaa4oJ9YHbwubwZn8KxVWeFvwO1KdYyn8RSM3C3DgWFWolSxnbYA==
X-Received: by 2002:a05:600c:4e08:b0:3d3:5c21:dd9d with SMTP id b8-20020a05600c4e0800b003d35c21dd9dmr66616730wmq.19.1673883038401;
        Mon, 16 Jan 2023 07:30:38 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id o9-20020a05600c510900b003c6f8d30e40sm43667810wms.31.2023.01.16.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jan 2023 07:30:38 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: kai.kang@windriver.com,
	Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH] mesa: update submitted patch with backported version
Date: Mon, 16 Jan 2023 16:30:35 +0100
Message-Id: <20230116153035.3226400-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 15:30:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175996

* this version was merged to main in:
  https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911
  and cherry-picked to staging/23.0 as well in:
  https://gitlab.freedesktop.org/mesa/mesa/-/commit/54cfb552abc50e8167cdc46d87455a9a414d7c65

  and as a bonus it doesn't break the build with DEBUG_BUILD
  for newer toolchain, so we can apply it for target build as well, see:
  https://lists.openembedded.org/g/openembedded-core/message/169002
  https://lists.openembedded.org/g/openembedded-core/message/170930

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...ove-fix-ALWAYS_INLINE-compiler-error.patch | 81 ++++++-------------
 meta/recipes-graphics/mesa/mesa.inc           |  5 +-
 2 files changed, 26 insertions(+), 60 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
index 7989843eb4..1cf23492fe 100644
--- a/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
+++ b/meta/recipes-graphics/mesa/files/0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch
@@ -1,67 +1,36 @@
-From da6e47f1717f34c73de388c56ffaf4861a07fdc5 Mon Sep 17 00:00:00 2001
-From: t bettler <thomas.bettler@gmail.com>
-Date: Sat, 9 Jul 2022 09:28:51 +0000
+From 267dd1f4d571ee606141aa66f1665aa152b4e911 Mon Sep 17 00:00:00 2001
+From: t0b3 <thomas.bettler@gmail.com>
+Date: Sat, 10 Dec 2022 14:32:53 +0100
 Subject: [PATCH] nir/nir_opt_move: fix ALWAYS_INLINE compiler error
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
 
-Backport merge request to fix mesa compile error when debug build
-enabled.
-
-Upstream-Status: Submitted [https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439]
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
-
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-fix call to ‘always_inline’ ‘src_is_ssa’
-
-Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/6825
-Fixes: f1d20ec67c3f186886b97de94f74484650f8fda1 ("nir/nir_opt_move: handle non-SSA defs ")
+Reviewed-by: Iago Toral Quiroga <itoral@igalia.com>
+Reviewed-by: Adam Jackson <ajax@redhat.com>
+Closes: #6825
+Fixes: f1d20ec6 ("nir/nir_opt_move: handle non-SSA defs ")
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/17439>
 
+Upstream-Status: Backport [https://gitlab.freedesktop.org/mesa/mesa/-/commit/267dd1f4d571ee606141aa66f1665aa152b4e911]
 ---
- src/compiler/nir/nir_inline_helpers.h | 10 ++++++++--
- src/compiler/nir/nir_opt_move.c       |  2 +-
- 2 files changed, 9 insertions(+), 3 deletions(-)
+ src/compiler/nir/nir_opt_move.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
 
-diff --git a/src/compiler/nir/nir_inline_helpers.h b/src/compiler/nir/nir_inline_helpers.h
-index 125dd8a..ec33f05 100644
---- a/src/compiler/nir/nir_inline_helpers.h
-+++ b/src/compiler/nir/nir_inline_helpers.h
-@@ -73,8 +73,8 @@ nir_foreach_dest(nir_instr *instr, nir_foreach_dest_cb cb, void *state)
-    return _nir_foreach_dest(instr, cb, state);
- }
- 
--static inline bool
--nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
-+static ALWAYS_INLINE bool
-+_nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
- {
-    switch (instr->type) {
-    case nir_instr_type_alu: {
-@@ -162,3 +162,9 @@ nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
-    dest_state.cb = cb;
-    return _nir_foreach_dest(instr, _nir_visit_dest_indirect, &dest_state);
- }
-+
-+static inline bool
-+nir_foreach_src(nir_instr *instr, nir_foreach_src_cb cb, void *state)
-+{
-+   return _nir_foreach_src(instr, cb, state);
-+}
 diff --git a/src/compiler/nir/nir_opt_move.c b/src/compiler/nir/nir_opt_move.c
-index 81bcde5..051c3cc 100644
+index 81bcde5c436..9aeb9f4cf86 100644
 --- a/src/compiler/nir/nir_opt_move.c
 +++ b/src/compiler/nir/nir_opt_move.c
-@@ -60,7 +60,7 @@ src_is_ssa(nir_src *src, void *state)
- static ALWAYS_INLINE bool
- instr_reads_register(nir_instr *instr)
+@@ -51,13 +51,13 @@
+  * lower register pressure.
+  */
+ 
+-static ALWAYS_INLINE bool
++static inline bool
+ src_is_ssa(nir_src *src, void *state)
  {
--   return !nir_foreach_src(instr, src_is_ssa, NULL);
-+   return !_nir_foreach_src(instr, src_is_ssa, NULL);
+    return src->is_ssa;
  }
  
- static bool
+-static ALWAYS_INLINE bool
++static inline bool
+ instr_reads_register(nir_instr *instr)
+ {
+    return !nir_foreach_src(instr, src_is_ssa, NULL);
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5fdb67ca2a..866b7fc462 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -18,11 +18,8 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-meson.build-check-for-all-linux-host_os-combinations.patch \
            file://0001-meson-misdetects-64bit-atomics-on-mips-clang.patch \
            file://0001-util-format-Check-for-NEON-before-using-it.patch \
-           ${NATIVE_PATCHES} \
+           file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch \
            "
-NATIVE_PATCHES ?= ""
-# required by mesa-native on Ubuntu 18.04 with gcc 7.5 when DEBUG_BUILD enabled
-NATIVE_PATCHES:class-native = "file://0001-nir-nir_opt_move-fix-ALWAYS_INLINE-compiler-error.patch"
 
 SRC_URI[sha256sum] = "bed799788bf2bd9ef079d97cd8e09348bf53cb086818578e40773b2b17812922"
 
-- 
2.39.0


