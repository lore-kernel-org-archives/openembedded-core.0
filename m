Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6CAC44515
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 08:33:23 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4536.1784536393924521224
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 01:33:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Gdsl0hQe;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso7352235e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 01:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1784536392; x=1785141192; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iYIRZ4eakC3UqifAnPcIJLx545QEiFzO6joMe6nlvxk=;
        b=Gdsl0hQerCqu8JHQOr+LXmmgwEwUQnxNIN1vYuS3qNBljIhfnHzbxXExuCzd+saugl
         DXKdjsNm9l5TNQonfX/E037lI55eSL8MZDrrYjPqAPMNXUFh+b14Vltrzfv5f+wxg61Z
         aU+93VnOEPZ0r/Wmxhg75XzgTU03rO0qcYXBE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784536392; x=1785141192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=iYIRZ4eakC3UqifAnPcIJLx545QEiFzO6joMe6nlvxk=;
        b=h1HTQYrcoTlICv9dJHw5qkQQFUHb29dtRLzSGj7YqnCdAtjQBa+7OpWzQhRx2jVAb9
         nUOIj7RLSbrtTjq4AGZkR495Vb9+lw4fR6j5OpVK8K98vCnzBo9Wa7rXdvpoaiF7LU+J
         Ll2Shuk7KDQZuYEuj52+Q58lva+R1qpRSdqK/9GGTtfcB2Ltr/ab2sKYtRJLiaKPU5io
         5vRF+bc5rhkPNJgWpaZJkkO+SNzWV25zRBFTGVrP5U/IgEuBgoaEJvrvw/9zu1remMDr
         W4fYWfYbHTLiz5KxnY/WmcHFISxdZ/Iq3IQyTKd3KCaZeZw5LlLH8mZkXHiz6VwVhcJ2
         ePfA==
X-Gm-Message-State: AOJu0YxGmUPDQyMsw46IWNykKuCeHe32hHBG5yu3ZjiIZbb7eK00a+ua
	rJJeRF/ZHjuOKcOi021bU53im/eIyyL8V8azgkMmSQXID10dz/Tce9pfMwS3CGAr9IAWQ58JZXL
	KGeIMiGY=
X-Gm-Gg: AfdE7clWtQTKDC8iDuU2xzJCHXTXGcIyB8JjwMhGMSoC6ZT6d7GAzHhJ1G7TGTmnl/5
	18fw0GMQg4RFj/XE3lYazREf45H6nxa7kwbB2S7aAcUvrWqXRaki9F7yGsEcb9m0nWyhzZJBLgN
	mwoos8iCUOjWGHlgoIZrwlzN0srUedC4AnnL4r/NcXGb18m7YIVqdReHQFrbpdIxnfWLoCLTkOf
	sBQNsSxyBl4ZykKken2UY7ceAfrKry/gnZ1JqMS154ceT0Yac95gSsXUtlB+AoZ7KQW8m1Qaszu
	IUpC7kd1HODfbaMmOnT58FAJXwZU526FPMGAISMMHJ1cPQwxdxJbWLyeqy4OMm/a3R794cx6sWk
	noVpWL50L3bqhrHS6XrnsZOwujuaWzWgxPZ676M8o70o5D1MIJ4+6o+FSxQpw6oqXGxq6VfzbV2
	u7fJmMt75C5u/p53+E7lmukfu2NyU3Sv4=
X-Received: by 2002:a05:600c:3515:b0:495:5b4a:53c9 with SMTP id 5b1f17b1804b1-4955b95bfbbmr42586125e9.39.1784536392052;
        Mon, 20 Jul 2026 01:33:12 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:f231:f082:3d95:2084])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954a2aa698sm241732125e9.4.2026.07.20.01.33.09
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 01:33:09 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/5] mesa: Ugrade 26.1.4 -> 26.1.5
Date: Mon, 20 Jul 2026 09:32:58 +0100
Message-ID: <20260720083258.770582-5-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
References: <20260720083258.770582-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 08:33:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241345

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...-freedreno-don-t-encode-build-path-into-binaries.patch | 4 ++--
 .../0001-gallivm-Fix-armhf-build-against-LLVM-22.patch    | 4 ++--
 ...001-meson-misdetects-64bit-atomics-on-mips-clang.patch | 2 +-
 ...intel-compiler-jay-fix-GCC-10-case-label-declara.patch | 5 +----
 ...intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch | 5 +----
 ...util-u_math.c-do-not-use-arm-fpu-instructions-if.patch | 8 ++++----
 meta/recipes-graphics/mesa/mesa.inc                       | 4 ++--
 7 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
index e976b3399f4..3e00556b71e 100644
--- a/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
+++ b/meta/recipes-graphics/mesa/files/0001-freedreno-don-t-encode-build-path-into-binaries.patch
@@ -1,4 +1,4 @@
-From 4ef7487109f9acfa2baf1a2224da31a0ae0c74c6 Mon Sep 17 00:00:00 2001
+From ddb43c52638b96c17392d08508609525b7db9a06 Mon Sep 17 00:00:00 2001
 From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
 Date: Wed, 10 Dec 2025 02:27:16 +0200
 Subject: [PATCH] freedreno: don't encode build path into binaries
@@ -25,7 +25,7 @@ Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
  2 files changed, 5 insertions(+), 2 deletions(-)
 
 diff --git a/src/freedreno/meson.build b/src/freedreno/meson.build
-index a4bfd33..330b646 100644
+index e8f01b8..8144a75 100644
 --- a/src/freedreno/meson.build
 +++ b/src/freedreno/meson.build
 @@ -4,9 +4,10 @@
diff --git a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
index 065dd373a7b..7e5a8276615 100644
--- a/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
+++ b/meta/recipes-graphics/mesa/files/0001-gallivm-Fix-armhf-build-against-LLVM-22.patch
@@ -1,4 +1,4 @@
-From 2a40c481affef4df729d794daf378ed2e0184895 Mon Sep 17 00:00:00 2001
+From 41306cf1df603613e98baf2cbab2fc27dad95ea7 Mon Sep 17 00:00:00 2001
 From: Alessandro Astone <ales.astone@gmail.com>
 Date: Sun, 1 Mar 2026 18:14:09 +0100
 Subject: [PATCH] gallivm: Fix armhf build against LLVM 22
@@ -13,7 +13,7 @@ Signed-off-by: Jose Quaresma <jose.quaresma@oss.qualcomm.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
-index d3ad342..c95d86e 100644
+index ce8ca02..86779f0 100644
 --- a/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 +++ b/src/gallium/auxiliary/gallivm/lp_bld_misc.cpp
 @@ -331,7 +331,7 @@ lp_build_fill_mattrs(std::vector<std::string> &MAttrs)
diff --git a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
index b039ac213ea..82293dbf6e3 100644
--- a/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
+++ b/meta/recipes-graphics/mesa/files/0001-meson-misdetects-64bit-atomics-on-mips-clang.patch
@@ -1,4 +1,4 @@
-From 8943b38a0c14b220e3e173c038c87ce9a697c173 Mon Sep 17 00:00:00 2001
+From c21d65f05381c7a836d93494acdb7e5ffb28aefe Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 13 Jan 2020 15:23:47 -0800
 Subject: [PATCH] meson misdetects 64bit atomics on mips/clang
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
index b8b87189798..3340b7e103d 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-fix-GCC-10-case-label-declara.patch
@@ -1,4 +1,4 @@
-From 0b4b577b7fc926d374234c80267a4bf9dcccb7ef Mon Sep 17 00:00:00 2001
+From 03df406963de6ebc40809dc22415c1715a08a905 Mon Sep 17 00:00:00 2001
 From: Wang Mingyu <wangmy@fujitsu.com>
 Date: Tue, 16 Jun 2026 09:12:34 +0000
 Subject: [PATCH] src/intel/compiler/jay: fix GCC 10 case label declaration
@@ -37,6 +37,3 @@ index 62b9576..a0a9498 100644
  
     case JAY_OPCODE_DESWIZZLE_EVEN:
        brw_set_default_exec_size(p, BRW_EXECUTE_16);
--- 
-2.43.0
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
index 904b20d4400..bc8b3e99e97 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-intel-compiler-jay-jay_ir.h-do-not-used-typed-en.patch
@@ -1,4 +1,4 @@
-From 3adae0d97f655c2991d5b428a3bc95a972e6228b Mon Sep 17 00:00:00 2001
+From 7735c1b9b97809ab97c38cd6bed26f3af1c28d5b Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Sun, 14 Jun 2026 17:42:19 +0200
 Subject: [PATCH] src/intel/compiler/jay/jay_ir.h: do not used typed enum
@@ -34,6 +34,3 @@ index 8307044..abf175a 100644
     enum jay_conditional_mod conditional_mod;
  
     jay_def cond_flag; /**< conditional flag */
--- 
-2.47.3
-
diff --git a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
index be79e29e420..2c381828fdb 100644
--- a/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
+++ b/meta/recipes-graphics/mesa/files/0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch
@@ -1,4 +1,4 @@
-From 013717829278f02b0815d80a423e05e4bd567ae3 Mon Sep 17 00:00:00 2001
+From 589921de37e1658b0ca4984ec68d45ecb8c57659 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex@linutronix.de>
 Date: Wed, 1 Jul 2026 22:48:15 +0200
 Subject: [PATCH] src/util/u_math.c: do not use arm fpu instructions if fpu is
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex@linutronix.de>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/src/util/u_math.c b/src/util/u_math.c
-index 337baa9..9ad03bf 100644
+index 722eac7..8bcfefa 100644
 --- a/src/util/u_math.c
 +++ b/src/util/u_math.c
-@@ -86,7 +86,7 @@ util_fpstate_get(void)
+@@ -90,7 +90,7 @@ util_fpstate_get(void)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_GET_FPSCR
        fpstate = __builtin_arm_get_fpscr();
@@ -23,7 +23,7 @@ index 337baa9..9ad03bf 100644
        __asm__ volatile("vmrs %0, fpscr" : "=r"(fpstate));
  #endif
     }
-@@ -151,7 +151,7 @@ util_fpstate_set(unsigned fpstate)
+@@ -157,7 +157,7 @@ util_fpstate_set(unsigned fpstate)
     if (util_get_cpu_caps()->has_neon) {
  #ifdef HAVE___BUILTIN_ARM_SET_FPSCR
        __builtin_arm_set_fpscr(fpstate);
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index bb071e24119..15d56c804dc 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -23,8 +23,8 @@ SRC_URI = "https://archive.mesa3d.org/mesa-${PV}.tar.xz \
            file://0001-src-util-u_math.c-do-not-use-arm-fpu-instructions-if.patch \
            "
 
-SRC_URI[sha256sum] = "072705caa9adf4740f1489194b13e278ad959166863b5271fe423a86353c9ab6"
-PV = "26.1.4"
+SRC_URI[sha256sum] = "79e421c7ce18cd9e790b8375920325779f10798630bf30e0b22f1a21c8617122"
+PV = "26.1.5"
 
 UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
 

