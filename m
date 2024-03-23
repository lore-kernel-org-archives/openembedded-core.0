Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B9BC54E58
	for <webhook@archiver.kernel.org>; Sat, 23 Mar 2024 17:58:00 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web10.14094.1711216678114410848
 for <openembedded-core@lists.openembedded.org>;
 Sat, 23 Mar 2024 10:57:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXz1kdZj;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-29b7164eef6so2352440a91.2
        for <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711216677; x=1711821477; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gjYx1xgDGKLIBRkyGRe1pXZqzAFpgkBP+xFfHvjeh18=;
        b=gXz1kdZjGUlfGbYtfW81OLOzzkm0TaHvPKo1//yhMHH1PDYgWVGrcjGwijYv4x1SdO
         pvXt8lTiveHP1Rh8o1VCxRfyhbqlIP4GeB+vxSHAvFc3KNXoOjmPZDpDGp8FI02KxndL
         jo4r/tE8d0lOn5ijaJ3UjvsOZ6Z/t0SAmA8BmgmD5jyPYmzrUyVwUg0HeYRtSap2Xke4
         YWKyYDfu7zagDgbrj9opfDEIQCVokom1ZzVFm1bLAzM/2vXsICU71h2Gak5Buthe59uT
         ieRoTRu29l8PbCLTtfHbkb+QgZ1B8thorKLjDdb8h4YJ5ZlYhaANTTko1moolnPpdtMI
         O19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711216677; x=1711821477;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gjYx1xgDGKLIBRkyGRe1pXZqzAFpgkBP+xFfHvjeh18=;
        b=gdXl1mYGVaHcGxytW+laFg0fCusl+TQVn61FUW25Kj6GvEZIBOWkxQdgAQayoCoCgI
         9wAc1fvrcvYknXefpyc9onsmeGi4wE/JFmiavg9zCRyUY0LEpLu9vPgwLgUiAUarB127
         4LjjNip+hG5p60cDvgjrEMsVO36fAtuIvky0IH2bWHIjFlSKe8TsPv9Qc8ZTGP3QchvR
         jvva6+wzaeLLEtUAgGKuieSbVuQyeaEYEBdiSqAmZI154pIHctRL+N/4ijVYURJs1DkV
         cHlfqCIUSj0TeqsfIjL9J3nEz10nuf4UlvE63d7vFZxnD15yrLfSErUxSH1XL+dirdBx
         4DTw==
X-Gm-Message-State: AOJu0Yxl6SWGjBB6IFGK1Bj1QlQUyXqNVwMHBq7Re764FAmNFQPaKNQl
	U1T0D/cdSd14uyNb2CkBLJN96xTnMIkTMwYi72I3JZBDUj3MynF2i+H0XyRh
X-Google-Smtp-Source: AGHT+IH5spZECFNgj8Uyk1Qmb0nXxRwNxHhK87QToAgnIVO8dBtjtTvizBjN5XpqPHHGLHoNnyCX6Q==
X-Received: by 2002:a17:90a:5213:b0:29b:2eab:6bda with SMTP id v19-20020a17090a521300b0029b2eab6bdamr2599418pjh.35.1711216677108;
        Sat, 23 Mar 2024 10:57:57 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::5eba])
        by smtp.gmail.com with ESMTPSA id k31-20020a635a5f000000b005d6a0b2efb3sm3394747pgm.21.2024.03.23.10.57.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Mar 2024 10:57:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] glibc: Repace aarch configure patch fix with a backport
Date: Sat, 23 Mar 2024 10:57:55 -0700
Message-ID: <20240323175755.927255-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 23 Mar 2024 17:58:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197464

despite it being an issue in gcc and still being open
glibc has fixed this problem upstream regardless, therefore
apply the backport instead.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-Pass-mcpu-along-with-march-to-dete.patch | 67 +++++++++++--------
 1 file changed, 38 insertions(+), 29 deletions(-)

diff --git a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
index 816471a8287..f6523c54989 100644
--- a/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
+++ b/meta/recipes-core/glibc/glibc/0023-aarch64-configure-Pass-mcpu-along-with-march-to-dete.patch
@@ -1,53 +1,62 @@
-From f761f5ca2d453e11d34fc7d552dab4a0e189dae9 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 4 Aug 2023 09:34:50 -0700
-Subject: [PATCH] aarch64/configure: Pass -mcpu along with -march to detect sve
- support
+From 73c26018ed0ecd9c807bb363cc2c2ab4aca66a82 Mon Sep 17 00:00:00 2001
+From: Szabolcs Nagy <szabolcs.nagy@arm.com>
+Date: Wed, 13 Mar 2024 14:34:14 +0000
+Subject: [PATCH] aarch64: fix check for SVE support in assembler
 
-SVE support logic in configure is rightly passing -march=<arch>+sve to
-compiler to override whatever user might have passed via environment,
-however GCC does not do as intended when -mcpu is part of environment
-compiler flags, then it overrides the -march computed from -mcpu and
-igonores other -march values so this test fails for lot of aarch64
-machines which pass -mcpu that does not support sve. This is seemingly a
-bug in GCC [1], until that is fixed we preempt -mcpu along with -march
-in the configure test itself. It does not change functionality and yet
-lets us through the GCC inconsistency.
+Due to GCC bug 110901 -mcpu can override -march setting when compiling
+asm code and thus a compiler targetting a specific cpu can fail the
+configure check even when binutils gas supports SVE.
 
-[1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=110901
-
-Upstream-Status: Inappropriate [Workaround for a GCC issue]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
+The workaround is that explicit .arch directive overrides both -mcpu
+and -march, and since that's what the actual SVE memcpy uses the
+configure check should use that too even if the GCC issue is fixed
+independently.
 
+Upstream-Status: Backport [https://sourceware.org/git/?p=glibc.git;a=commit;h=73c26018ed0ecd9c807bb363cc2c2ab4aca66a82]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Reviewed-by: Florian Weimer <fweimer@redhat.com>
 ---
- sysdeps/aarch64/configure    | 2 +-
- sysdeps/aarch64/configure.ac | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
+ sysdeps/aarch64/configure    | 5 +++--
+ sysdeps/aarch64/configure.ac | 5 +++--
+ 2 files changed, 6 insertions(+), 4 deletions(-)
+ mode change 100644 => 100755 sysdeps/aarch64/configure
 
 diff --git a/sysdeps/aarch64/configure b/sysdeps/aarch64/configure
-index 5e91fab023..39dddc66d4 100644
+old mode 100644
+new mode 100755
+index ca57edce47..9606137e8d
 --- a/sysdeps/aarch64/configure
 +++ b/sysdeps/aarch64/configure
-@@ -327,7 +327,7 @@ else $as_nop
+@@ -325,9 +325,10 @@ then :
+   printf %s "(cached) " >&6
+ else $as_nop
    cat > conftest.s <<\EOF
-         ptrue p0.b
+-        ptrue p0.b
++	.arch armv8.2-a+sve
++	ptrue p0.b
  EOF
 -if { ac_try='${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&5'
-+if { ac_try='${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&5'
++if { ac_try='${CC-cc} -c conftest.s 1>&5'
    { { eval echo "\"\$as_me\":${as_lineno-$LINENO}: \"$ac_try\""; } >&5
    (eval $ac_try) 2>&5
    ac_status=$?
 diff --git a/sysdeps/aarch64/configure.ac b/sysdeps/aarch64/configure.ac
-index 8a708f2ef4..b6a146d2be 100644
+index 27874eceb4..56d12d661d 100644
 --- a/sysdeps/aarch64/configure.ac
 +++ b/sysdeps/aarch64/configure.ac
-@@ -92,7 +92,7 @@ AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
+@@ -90,9 +90,10 @@ LIBC_CONFIG_VAR([aarch64-variant-pcs], [$libc_cv_aarch64_variant_pcs])
+ # Check if asm support armv8.2-a+sve
+ AC_CACHE_CHECK([for SVE support in assembler], [libc_cv_aarch64_sve_asm], [dnl
  cat > conftest.s <<\EOF
-         ptrue p0.b
+-        ptrue p0.b
++	.arch armv8.2-a+sve
++	ptrue p0.b
  EOF
 -if AC_TRY_COMMAND(${CC-cc} -c -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
-+if AC_TRY_COMMAND(${CC-cc} -c -mcpu=generic+sve -march=armv8.2-a+sve conftest.s 1>&AS_MESSAGE_LOG_FD); then
++if AC_TRY_COMMAND(${CC-cc} -c conftest.s 1>&AS_MESSAGE_LOG_FD); then
    libc_cv_aarch64_sve_asm=yes
  else
    libc_cv_aarch64_sve_asm=no
+-- 
+2.44.0
+
-- 
2.44.0


