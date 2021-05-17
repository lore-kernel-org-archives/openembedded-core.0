Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web08.184.1621289358935047899
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=u6d8I9ax;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id p6so3937398plr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEZ5wdsAoe2ZPufiCuXZSif6J0b1tPI5CYejPrCdHYE=;
        b=u6d8I9ax1yY+/1whxkSlKT6u/9oXkSpw4KPc9/3/bZwAkLNDefV0yJdw0xMurea2vE
         AtRy99Ww3l9YLTGmbNiA3/bd6+5AfYn/E87efv1oywycHzuPXcRbDYg09Y67XqgEcwSX
         zUAPD+LKHEM6J2m5ohfxFuU47rebPJRu06zrbYJ8T7edQR8eErS1wCLbC+gGnQfy2Efe
         gZs2ug7rYp6CnTITaY2/jSC1gbL9bOEDJxh+i/JNg9qzXuzBAQtur/bUVhlqJzjR+/UV
         kADrhlF02Lewn4T44QdzQNMNU7BiIDlOGbF5zDOfAQtXu0/i117FG3XINuze71lEcqRU
         gTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cEZ5wdsAoe2ZPufiCuXZSif6J0b1tPI5CYejPrCdHYE=;
        b=Ey83kfEcdWX113M+Au9w5h6gdrrXCGoV7DWswJd1/+LO5FpRJ0C3IWGHTwJJuyVQmp
         aX9S5fmaGvBZI6YmZRBRNhE+hbviBfbjQ2WyS9OGbzFtyGO4ihFefpcdBscIoi+FpRcL
         bVTEtFz8I/EBKsufkkodfnkNRbp9H+p8bx3tn4eYBrYmRgeiStgsDfpooydf2kOO8mr6
         MapCeWX9zP9du+PpRUXqkj8raznsFgcom55Y/pPG4XT/FZ3ZQH21OFpFtyXt6uEI/Q6G
         rF+UrHcJ4BDKrgs/+WOgSuuGoE39llF2BtjrOPeg25SD8BQy1qRfUgAXEGTbeg5IDBAj
         fnNg==
X-Gm-Message-State: AOAM530XzmmT2SOArFKFLJEvtUl3mwDJ6TRvIZfEkgqLTIhW+bo7dC2y
	sJp/nn3bQhl0WjRGwEIRn+vC7BcKsCQ/uA==
X-Google-Smtp-Source: ABdhPJzq6hiKJov/19WXS/bSE7N2MHiEi+TsaoaqlKH675JJ4AmmDQM7u2A0NY+i6uxGiLP4EjvDuA==
X-Received: by 2002:a17:902:ea06:b029:f1:9082:3ddc with SMTP id s6-20020a170902ea06b02900f190823ddcmr672231plg.43.1621289357984;
        Mon, 17 May 2021 15:09:17 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s184sm11307010pgc.29.2021.05.17.15.09.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:09:17 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 1/3] gcc: Add target gcc include search for musl config too
Date: Mon, 17 May 2021 15:09:13 -0700
Message-Id: <20210517220915.3760392-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Musl has different search order and therefore injects it
via INCLUDE_DEFAULTS and does not use the defaults from
gcc/cppdefaults.h, this ensures that same fix is extended
to musl configs too where it can search for compiler headers
It will fix builds with musl where omp.h is not found because
it is in gcc includes path on target ( not cross ) sysroot

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...e-target-gcc-headers-can-be-included.patch | 64 +++++++++++++++++--
 1 file changed, 60 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
index 98472dd2b5..120d5a29b2 100644
--- a/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
+++ b/meta/recipes-devtools/gcc/gcc/0019-Ensure-target-gcc-headers-can-be-included.patch
@@ -1,4 +1,4 @@
-From 9b4eb0e18a953d79d20c78d3ba741af6d71ab9ca Mon Sep 17 00:00:00 2001
+From 6f410ed8fb7eee11ba7a25634c2257666b98ef52 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 20 Feb 2015 10:25:11 +0000
 Subject: [PATCH] Ensure target gcc headers can be included
@@ -11,14 +11,18 @@ found by gcc with the existing search paths. Add support for
 picking up these headers under the sysroot supplied on the gcc
 command line in order to resolve this.
 
+Extend target gcc headers search to musl too
+
 Upstream-Status: Pending
 
 Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- gcc/Makefile.in  | 2 ++
- gcc/cppdefault.c | 4 ++++
- 2 files changed, 6 insertions(+)
+ gcc/Makefile.in           | 2 ++
+ gcc/config/linux.h        | 8 ++++++++
+ gcc/config/rs6000/sysv4.h | 8 ++++++++
+ gcc/cppdefault.c          | 4 ++++
+ 4 files changed, 22 insertions(+)
 
 diff --git a/gcc/Makefile.in b/gcc/Makefile.in
 index 59c45c81393..9b17d120aa1 100644
@@ -40,6 +44,58 @@ index 59c45c81393..9b17d120aa1 100644
    -DFIXED_INCLUDE_DIR=\"$(libsubdir)/include-fixed\" \
    -DGPLUSPLUS_INCLUDE_DIR=\"$(gcc_gxx_include_dir)\" \
    -DGPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT=$(gcc_gxx_include_dir_add_sysroot) \
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index 87efc5f69fe..b525bcd56b3 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -165,6 +165,13 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+ #define INCLUDE_DEFAULTS_MUSL_TOOL
+ #endif
+ 
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET		\
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
++#endif
++
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
+     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
+@@ -191,6 +198,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     INCLUDE_DEFAULTS_MUSL_PREFIX			\
+     INCLUDE_DEFAULTS_MUSL_CROSS				\
+     INCLUDE_DEFAULTS_MUSL_TOOL				\
++    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
+     INCLUDE_DEFAULTS_MUSL_NATIVE			\
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index 510abe169c5..0c2bba5ea32 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -995,6 +995,13 @@ ncrtn.o%s"
+ #define INCLUDE_DEFAULTS_MUSL_TOOL
+ #endif
+ 
++#ifdef GCC_INCLUDE_SUBDIR_TARGET
++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
++    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0},
++#else
++#define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
++#endif
++
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
+     { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
+@@ -1021,6 +1028,7 @@ ncrtn.o%s"
+     INCLUDE_DEFAULTS_MUSL_PREFIX			\
+     INCLUDE_DEFAULTS_MUSL_CROSS				\
+     INCLUDE_DEFAULTS_MUSL_TOOL				\
++    INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
+     INCLUDE_DEFAULTS_MUSL_NATIVE			\
+     { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
 index c503d14fc3f..d54d6ce0076 100644
 --- a/gcc/cppdefault.c
-- 
2.31.1

