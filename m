Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01287C47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 13:08:29 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.1532.1705496907077158703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 05:08:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Q6OLs4cg;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40e80046264so29016645e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 05:08:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1705496905; x=1706101705; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LvryT2Y8SYHfT+R29BLz71Ed+LTg7jdExt0ao4Q6j6o=;
        b=Q6OLs4cg5//vHAWbPajnZ2q6A8Mvo3z3iM2LrO6cVhYJk7n3h0VgBq2DLg8W/bffoc
         4sBLURyNKtfu+XhVls1eIwJKPsU76hlIaoCfcYUoYpI5vYzjJls+iu6y2I/LNGpfOI3i
         YSBOqwQJjy0Uxdc81Vx4q5MKRzfjPCM/dDZmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705496905; x=1706101705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LvryT2Y8SYHfT+R29BLz71Ed+LTg7jdExt0ao4Q6j6o=;
        b=Hf5+gC1wu6y0QOq1sBPpUec+hSWL/kGD7ySgyME90ni7yk1pHnF3MJQNBeRb8mBaDZ
         PvTG2hGxWZt9f+ZsZaRhcXTGM7efHDY0iCc/WBzSzLCUWMwnI+86zUmV4WQwt1uAyks5
         MVvQOy55iaWFrkPowMKZxOq0h48H/v6nfOSPiVtcKJzKjTKDH7NAMBSFMUg5G2vIYhHZ
         lL3A496DnoFPd5ITU6yzw7ZaLJdMznhHQg/PkhQWLnqvRTz6XYheqjMuj6iHW1uv7595
         6PZrM16yFJnvKqhi/nrbJf9hTu0bmg6wul2473oULDinOdxVkP0vLSRI6lejdH2ucciI
         guqA==
X-Gm-Message-State: AOJu0YyrjRto3q5XuHzOnAmVOPLAAq6br612IgeHwwbKsomo1AAAi+8R
	ferZnKyADu6142icnBkXMdfRTsoio5zgV3SoEnpKLl3hhpw=
X-Google-Smtp-Source: AGHT+IGF3V+zxI+CR46taF3InmvjMvbLf0XgLz2FXMh19eKSlkN2Z+qIIoz2DfxntTs7/JpvziKz9A==
X-Received: by 2002:a05:600c:144:b0:40e:4252:e26 with SMTP id w4-20020a05600c014400b0040e42520e26mr4758607wmm.69.1705496905203;
        Wed, 17 Jan 2024 05:08:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3c1d:bf3d:325f:7bb3])
        by smtp.gmail.com with ESMTPSA id k20-20020a05600c1c9400b0040e54f15d3dsm26263349wms.31.2024.01.17.05.08.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 05:08:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] libtool: Update prefixmap and clang patches to match upstream submission
Date: Wed, 17 Jan 2024 13:08:20 +0000
Message-Id: <20240117130822.3928928-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
References: <20240117130822.3928928-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 13:08:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193910

The patches were submitted upstream and adjusted after discussion. Update to match
the changes requested.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...in.in-Parse-additional-clang-options.patch | 31 +++++++++++--------
 ...-prefix-map-compiler-options-correct.patch | 31 ++++++++++++-------
 2 files changed, 38 insertions(+), 24 deletions(-)

diff --git a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
index 0285c143d28..0dcf963dcca 100644
--- a/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
+++ b/meta/recipes-devtools/libtool/libtool/0001-ltmain.in-Parse-additional-clang-options.patch
@@ -1,21 +1,26 @@
-From: Khem Raj <raj.khem@gmail.com>
-Subject: [PATCH] ltmain.in: Parse additional clang options
+ltmain.in: Parse additional clang options
 
-clang uses -rtlib and --unwindlib to select proper compiler runtime in
-some cases. There fore pass these options to linker when found in
+clang uses -rtlib and --unwindlib to select proper compiler
+runtime in some cases. Therefore pass these options to linker when found in
 ldflags
 
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+* build-aux/ltmain.in: Handle clang linker options
 
-Index: libtool-2.4.7/build-aux/ltmain.in
-===================================================================
---- libtool-2.4.7.orig/build-aux/ltmain.in
-+++ libtool-2.4.7/build-aux/ltmain.in
-@@ -5420,10 +5420,12 @@ func_mode_link ()
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00110.html]
+
+---
+ build-aux/ltmain.in | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index 037f009..ba5c816 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -5414,10 +5414,12 @@ func_mode_link ()
        # -fsanitize=*         Clang/GCC memory and address sanitizer
        # -fuse-ld=*           Linker select flags for GCC
-       # -f*-prefix-map*      needed for lto linking
+       # -f{file|debug|macro|profile}-prefix-map* needed for lto linking
 +      # -rtlib=*             select c runtime lib with clang
 +      # --unwindlib=*        select unwinder library with clang
        # -Wa,*                Pass flags directly to the assembler
@@ -23,6 +28,6 @@ Index: libtool-2.4.7/build-aux/ltmain.in
        -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
 -      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
 +      -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*|-rtlib=*|--unwindlib=*| \
-       -specs=*|-fsanitize=*|-fuse-ld=*|-f*-prefix-map*|-Wa,*)
+       -specs=*|-fsanitize=*|-fuse-ld=*|-ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*|-fprofile-prefix-map=*|-Wa,*)
          func_quote_arg pretty "$arg"
  	arg=$func_quote_arg_result
diff --git a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
index 4945533badd..c0627795b45 100644
--- a/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
+++ b/meta/recipes-devtools/libtool/libtool/0011-ltmain.in-Handle-prefix-map-compiler-options-correct.patch
@@ -1,28 +1,37 @@
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Subject: [PATCH 11/12] ltmain.in: Handle prefix-map compiler options correctly
+ltmain.in: Handle prefix-map compiler options correctly
+
+If lto is enabled, we need the prefix-map variables to be passed to the linker
+to correctly link the objects using correctly mapped paths.
 
-If lto is enabled, we need the prefix-map variables to be passed to the linker.
 Add these to the list of options libtool passes through.
 
+* build-aux/ltmain.in: Handle prefix-map compiler options
+
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html]
+https://lists.gnu.org/archive/html/libtool-patches/2021-10/msg00019.html
+https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00066.html
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/libtool-patches/2024-01/msg00109.html]
+
+---
+ build-aux/ltmain.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
 
-Index: libtool-2.4.7/build-aux/ltmain.in
-===================================================================
---- libtool-2.4.7.orig/build-aux/ltmain.in
-+++ libtool-2.4.7/build-aux/ltmain.in
-@@ -5419,11 +5419,12 @@ func_mode_link ()
+diff --git a/build-aux/ltmain.in b/build-aux/ltmain.in
+index 0a50f5b..037f009 100644
+--- a/build-aux/ltmain.in
++++ b/build-aux/ltmain.in
+@@ -5413,11 +5413,12 @@ func_mode_link ()
        # -stdlib=*            select c++ std lib with clang
        # -fsanitize=*         Clang/GCC memory and address sanitizer
        # -fuse-ld=*           Linker select flags for GCC
-+      # -f*-prefix-map*      needed for lto linking
++      # -f{file|debug|macro|profile}-prefix-map* needed for lto linking
        # -Wa,*                Pass flags directly to the assembler
        -64|-mips[0-9]|-r[0-9][0-9]*|-xarch=*|-xtarget=*|+DA*|+DD*|-q*|-m*| \
        -t[45]*|-txscale*|-p|-pg|--coverage|-fprofile-*|-F*|@*|-tp=*|--sysroot=*| \
        -O*|-g*|-flto*|-fwhopr*|-fuse-linker-plugin|-fstack-protector*|-stdlib=*| \
 -      -specs=*|-fsanitize=*|-fuse-ld=*|-Wa,*)
-+      -specs=*|-fsanitize=*|-fuse-ld=*|-f*-prefix-map*|-Wa,*)
++      -specs=*|-fsanitize=*|-fuse-ld=*|-ffile-prefix-map=*|-fdebug-prefix-map=*|-fmacro-prefix-map=*|-fprofile-prefix-map=*|-Wa,*)
          func_quote_arg pretty "$arg"
  	arg=$func_quote_arg_result
          func_append compile_command " $arg"
-- 
2.39.2


