Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.148.1621289359787182265
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 May 2021 15:09:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mlwcTiT7;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id p6so3937417plr.11
        for <openembedded-core@lists.openembedded.org>; Mon, 17 May 2021 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=D6ZBOSfkcyzYIvyL8egCKtv/Yq1TS+2WTaHAp6HhdCU=;
        b=mlwcTiT7nb5jhmKkSLu2r7vfRY4MFAu+04uhxmCVYplEL6c1IR1ceBAk7aErecGAHC
         fYs0JXs4l38LzApi3X5d1XoPUzx5APFUII4SqIV7iwK38zpLPMXMSsWShK/5qDw4mVhr
         hcp0xceqcG7O0W5+/uBxhu1v8nqNHwMyQEjCdXd26IT1aXf+DZtVWc8yfr7sS4dbDpxw
         CDNHaLle7mkosnlqCrecsETiOcrlV1h8zVbblz/Pi0hYVqmUKj9Of+/R7to5DlWUNElt
         dhEVhldGPmgDxtpts9mmFimEEoehwtm4rzut4di4TAMkuYbkRhq53HxfEtvg1WI16Qxz
         LuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=D6ZBOSfkcyzYIvyL8egCKtv/Yq1TS+2WTaHAp6HhdCU=;
        b=hZ3IIEPBd0FTmpbYMiGzLu5PqNT+TB32OBNYLN4QUDOizsy0nUzPJbqwllf1D2HTNl
         /trBO3YWkUnXKN/Jrgh7m/vQtpfUxEczZvem64M8yWplDhYiH4W23nNA9Wi/MT7qGbp7
         aX7MX96AzRysjRupS5mkUiY4UlCwt//7yTWmiDcikDH7HtXW20rwCpdb6VK1gylK1+RT
         Fi/aS2fSaJIP6hZwyH6QZh8/1bkJO1hRbpXgLeZAIcjVFH01fcQG+vpzzJcaXmAnlpez
         xGA8+SV/QRvVbkYCnnabjyLc1JiPqYotficbNXGC2BulgtLQ5oH1e7KYoKU2Mh0wM6kz
         YicA==
X-Gm-Message-State: AOAM532UiFwkPA5KNtnMasK9rLC6CA/NiTQcQdVuKJjPmF9q270w9wFF
	71XRts0hlTYwWlSqb2O07RRstZNgQ7rrxg==
X-Google-Smtp-Source: ABdhPJxxX/3AAXSv/ULzhTJGD9HV+YsXSZDExODri7Zj9xinGE1RcqMkg9N8/SvYiLi/h48oSzyzSg==
X-Received: by 2002:a17:90a:bd01:: with SMTP id y1mr1298527pjr.166.1621289359020;
        Mon, 17 May 2021 15:09:19 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0:db81:2f56:60e4:2c64])
        by smtp.gmail.com with ESMTPSA id s184sm11307010pgc.29.2021.05.17.15.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 15:09:18 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/3] gcc: Extend .gccrelocprefix section support to musl configs
Date: Mon, 17 May 2021 15:09:14 -0700
Message-Id: <20210517220915.3760392-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210517220915.3760392-1-raj.khem@gmail.com>
References: <20210517220915.3760392-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

musl includes were not using the relocatable prefix like glibc
counterpart, this will mean that musl SDKs will behave better and find
the headers in right install directories

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...le-sysroot-support-for-nativesdk-gcc.patch | 179 +++++++++++++++++-
 1 file changed, 170 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
index 3958e9c212..b1054fa749 100644
--- a/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
+++ b/meta/recipes-devtools/gcc/gcc/0024-handle-sysroot-support-for-nativesdk-gcc.patch
@@ -1,4 +1,4 @@
-From 35c084a051bcd6587ebc73e4acb045cb2bdf7e99 Mon Sep 17 00:00:00 2001
+From 354682ad8f71f62643dcd83f64b51b5979615a0c Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 7 Dec 2015 23:39:54 +0000
 Subject: [PATCH] handle sysroot support for nativesdk-gcc
@@ -23,6 +23,9 @@ b) Add other paths which need relocation into a .gccrelocprefix section
 Upstream-Status: Inappropriate
 RP 2015/7/28
 
+Extend the gccrelocprefix support to musl config too, this ensures
+that gcc will get right bits in SDK installations
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
 Added PREFIXVAR and EXEC_PREFIXVAR to support runtime relocation.  Without
@@ -32,16 +35,18 @@ implementation.)
 
 Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
 ---
- gcc/c-family/c-opts.c |  4 +--
- gcc/cppdefault.c      | 63 ++++++++++++++++++++++++++-----------------
- gcc/cppdefault.h      | 13 ++++-----
- gcc/gcc.c             | 20 +++++++++-----
- gcc/incpath.c         | 12 ++++-----
- gcc/prefix.c          |  6 +++--
- 6 files changed, 70 insertions(+), 48 deletions(-)
+ gcc/c-family/c-opts.c     |  4 +--
+ gcc/config/linux.h        | 24 +++++++--------
+ gcc/config/rs6000/sysv4.h | 24 +++++++--------
+ gcc/cppdefault.c          | 63 ++++++++++++++++++++++++---------------
+ gcc/cppdefault.h          | 13 ++++----
+ gcc/gcc.c                 | 20 +++++++++----
+ gcc/incpath.c             | 12 ++++----
+ gcc/prefix.c              |  6 ++--
+ 8 files changed, 94 insertions(+), 72 deletions(-)
 
 diff --git a/gcc/c-family/c-opts.c b/gcc/c-family/c-opts.c
-index bd15b9cd902..2bd667e3f58 100644
+index 89e05a4c551..5577383665d 100644
 --- a/gcc/c-family/c-opts.c
 +++ b/gcc/c-family/c-opts.c
 @@ -1436,8 +1436,8 @@ add_prefixed_path (const char *suffix, incpath_kind chain)
@@ -55,6 +60,162 @@ index bd15b9cd902..2bd667e3f58 100644
  
    path = (char *) xmalloc (prefix_len + suffix_len + 1);
    memcpy (path, prefix, prefix_len);
+diff --git a/gcc/config/linux.h b/gcc/config/linux.h
+index b525bcd56b3..ba02c013e30 100644
+--- a/gcc/config/linux.h
++++ b/gcc/config/linux.h
+@@ -129,53 +129,53 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+  * Unfortunately, this is mostly duplicated from cppdefault.c */
+ #if DEFAULT_LIBC == LIBC_MUSL
+ #define INCLUDE_DEFAULTS_MUSL_GPP			\
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,		\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,	\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,	\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ 
+ #ifdef LOCAL_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_LOCAL			\
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },		\
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_LOCAL
+ #endif
+ 
+ #ifdef PREFIX_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_PREFIX			\
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_PREFIX
+ #endif
+ 
+ #ifdef CROSS_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_CROSS			\
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_CROSS
+ #endif
+ 
+ #ifdef TOOL_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_TOOL			\
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_TOOL
+ #endif
+ 
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+ #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET		\
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0},
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
+ #endif
+ 
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
+-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
+-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },	\
++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE
+ #endif
+@@ -200,7 +200,7 @@ see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+     INCLUDE_DEFAULTS_MUSL_TOOL				\
+     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
+     INCLUDE_DEFAULTS_MUSL_NATIVE			\
+-    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
+ #endif
+diff --git a/gcc/config/rs6000/sysv4.h b/gcc/config/rs6000/sysv4.h
+index 0c2bba5ea32..313a8de4417 100644
+--- a/gcc/config/rs6000/sysv4.h
++++ b/gcc/config/rs6000/sysv4.h
+@@ -959,53 +959,53 @@ ncrtn.o%s"
+ /* Include order changes for musl, same as in generic linux.h.  */
+ #if DEFAULT_LIBC == LIBC_MUSL
+ #define INCLUDE_DEFAULTS_MUSL_GPP			\
+-    { GPLUSPLUS_INCLUDE_DIR, "G++", 1, 1,		\
++    { GPLUSPLUS_INCLUDE_DIRVAR, "G++", 1, 1,		\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },		\
+-    { GPLUSPLUS_TOOL_INCLUDE_DIR, "G++", 1, 1,		\
++    { GPLUSPLUS_TOOL_INCLUDE_DIRVAR, "G++", 1, 1,	\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 1 },		\
+-    { GPLUSPLUS_BACKWARD_INCLUDE_DIR, "G++", 1, 1,	\
++    { GPLUSPLUS_BACKWARD_INCLUDE_DIRVAR, "G++", 1, 1,	\
+       GPLUSPLUS_INCLUDE_DIR_ADD_SYSROOT, 0 },
+ 
+ #ifdef LOCAL_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_LOCAL			\
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 2 },		\
+-    { LOCAL_INCLUDE_DIR, 0, 0, 1, 1, 0 },
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 2 },		\
++    { LOCAL_INCLUDE_DIRVAR, 0, 0, 1, 1, 0 },
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_LOCAL
+ #endif
+ 
+ #ifdef PREFIX_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_PREFIX			\
+-    { PREFIX_INCLUDE_DIR, 0, 0, 1, 0, 0},
++    { PREFIX_INCLUDE_DIRVAR, 0, 0, 1, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_PREFIX
+ #endif
+ 
+ #ifdef CROSS_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_CROSS			\
+-    { CROSS_INCLUDE_DIR, "GCC", 0, 0, 0, 0},
++    { CROSS_INCLUDE_DIRVAR, "GCC", 0, 0, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_CROSS
+ #endif
+ 
+ #ifdef TOOL_INCLUDE_DIR
+ #define INCLUDE_DEFAULTS_MUSL_TOOL			\
+-    { TOOL_INCLUDE_DIR, "BINUTILS", 0, 1, 0, 0},
++    { TOOL_INCLUDE_DIRVAR, "BINUTILS", 0, 1, 0, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_TOOL
+ #endif
+ 
+ #ifdef GCC_INCLUDE_SUBDIR_TARGET
+ #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET            \
+-    { STANDARD_STARTFILE_PREFIX_2 GCC_INCLUDE_SUBDIR_TARGET, "GCC", 0, 0, 1, 0},
++    { STANDARD_STARTFILE_PREFIX_2VAR, "GCC", 0, 0, 1, 0},
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET
+ #endif
+ 
+ #ifdef NATIVE_SYSTEM_HEADER_DIR
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE			\
+-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 2 },	\
+-    { NATIVE_SYSTEM_HEADER_DIR, 0, 0, 0, 1, 0 },
++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 2 },	\
++    { NATIVE_SYSTEM_HEADER_DIRVAR, 0, 0, 0, 1, 0 },
+ #else
+ #define INCLUDE_DEFAULTS_MUSL_NATIVE
+ #endif
+@@ -1030,7 +1030,7 @@ ncrtn.o%s"
+     INCLUDE_DEFAULTS_MUSL_TOOL				\
+     INCLUDE_DEFAULTS_MUSL_SUBDIR_TARGET			\
+     INCLUDE_DEFAULTS_MUSL_NATIVE			\
+-    { GCC_INCLUDE_DIR, "GCC", 0, 1, 0, 0 },		\
++    { GCC_INCLUDE_DIRVAR, "GCC", 0, 1, 0, 0 },		\
+     { 0, 0, 0, 0, 0, 0 }				\
+   }
+ #endif
 diff --git a/gcc/cppdefault.c b/gcc/cppdefault.c
 index d54d6ce0076..784a92a0c24 100644
 --- a/gcc/cppdefault.c
-- 
2.31.1

