Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29D92CA0EC4
	for <webhook@archiver.kernel.org>; Tue, 12 Aug 2025 13:29:34 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.74120.1755005367086553173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 06:29:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=11+dhXcb;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.175, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-769a21bd4d5so5125860b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 06:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1755005366; x=1755610166; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BAV0neBkLjJUJw4Gxmyw7sPLVkeRMHVo4PLdCpom4gA=;
        b=11+dhXcbjUMwDhySwfhUW4oPxQ6CnLJFl0dNvxXTPrzzMEw3wl9/T/rcFpl3/pdYG5
         LAi+ah/BryQtg2TjCmk1/nG1x16y3Z3+LLwVmc9+i6M2C5HraF5XQaLO0Ak8nDM0sDMC
         8JzY98GRDX9xZl9V+LLt4wxX+lx8bJJplYuzj7SMnUX7jilSv1Pv/pVRiyLMs6fekrwY
         CZn+gSwcZm0auap46grVuxhfLY2YRyMcCbzlapsdONmlKsd3bEkXt0BWqKgIrHdjN11d
         Wwkw3M3AMkLJ+sDE3Qnx2X/1PwrXhFaM3SCOCJZbD8hgs6sprN0UHQvycYQmksWf6wSH
         yGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755005366; x=1755610166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BAV0neBkLjJUJw4Gxmyw7sPLVkeRMHVo4PLdCpom4gA=;
        b=CE09PJoSjojNkiJX6I5+cdmLfxGRgiiYT7eMZN1JaBQk0mnsNhJzfJPdkKtXbG72Nz
         +vDS0eU3Ko8PZeMmkV5kqX62XsScD0Y82tn6UyLPydvS/ZlqC9tllR4/rfk0y7VqK7oi
         voUpqCmezb0gZY/v8+LlLfLPeC1VVaHpfvQjCLYjm4pGw3c7SvJEAI2HqcRggpZ1SrjQ
         GTuo2qRjRI7RVp+P5tI2ZHDqp/z2zxnfMth+y8xeF83zYhnuo8CiUlBfDH9Rnae9Vfml
         RT0Y7Y5SZ/k5eW4rcKGnL6znaM7h6ZwnQQkiC6LHf/HLqSVjKX9gVphoyhnUFcvOynHS
         3i5Q==
X-Gm-Message-State: AOJu0YwPjWEeYW6aacjs31+jObq5uHTRPt9cz9AohqN4/lDs6537TXZb
	gECPokKdPPgIGmLBcuCmVgLCTwTAg4GDGxRgo2kXPgZFFeceA3aVF94RF9qpIrkOcuHXq542Q7k
	6ZvhB
X-Gm-Gg: ASbGncuB4idN+woFX9ADNkiEdNNJGMtJg+E18JT8Cew5zbjA1PzL/m0TJP86jC4p7T2
	mxD0HGZQ6+m8B4k2H+0drmnAp8AU5wI45radl8V/ziocnnxYzufvJbxPEqhOGOgQALkICOJJMhI
	PjQxIEE4103mGwL97n+37brKJPUNgCPtWevsCgfV7Vvq4lL+/V/BpanyVgHlE7UxUYkd3Fa//yx
	INDfPhNnXjUJ0ElkHJJLTJDlrxKFOx/0XiG4LvlkVwCPzyDtj6fG68A9aAoyGMe0wI15RWnqXfR
	oWZAl7GmBBwX4qKEeht0D9F8oOUK7QrHa6PRRF0P3n98u2HIODzpIEtPcHLYJNyowTfthWQWJlK
	h5NRDUbvkKC8JZfIFt0T1YXQD
X-Google-Smtp-Source: AGHT+IEndI4lMqKxbma1NeyPASX0YnQwF36pAXY/YC1SjlloRI4ekjtmk/FGHHMwNh2FUVm1Jof9kw==
X-Received: by 2002:a05:6a00:ac3:b0:76b:ffd1:7722 with SMTP id d2e1a72fcca58-76e0df57a02mr5318429b3a.24.1755005366229;
        Tue, 12 Aug 2025 06:29:26 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:43a9:39c9:3131:3b8a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bf067e310sm24664635b3a.25.2025.08.12.06.29.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 06:29:25 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 3/3] bitbake.conf: Switch prefix mapping to use -ffile-prefix-map
Date: Tue, 12 Aug 2025 06:29:15 -0700
Message-ID: <1a8f58b2e7c2005757fcf1a5d4b57f7239925133.1755005205.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1755005205.git.steve@sakoman.com>
References: <cover.1755005205.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 12 Aug 2025 13:29:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221772

From: Khem Raj <raj.khem@gmail.com>

-ffile-prefix map is more comprehensive when it comes to reproducible
builds and its superset of all prefix-mapping options in compilers

(From OE-Core rev: ff73fa7ef7666a6dbe34f15515bc3ab6e574c5b0)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/classes-recipe/kernel-arch.bbclass            |  6 ++----
 meta/conf/bitbake.conf                             | 14 +++++---------
 meta/lib/oe/package.py                             |  2 +-
 meta/recipes-devtools/gcc/libgfortran.inc          |  2 +-
 .../python/python3-maturin_1.8.3.bb                |  2 +-
 meta/recipes-devtools/rust/cargo_1.84.1.bb         |  2 +-
 6 files changed, 11 insertions(+), 17 deletions(-)

diff --git a/meta/classes-recipe/kernel-arch.bbclass b/meta/classes-recipe/kernel-arch.bbclass
index 36a6e0a60a..749a266ea3 100644
--- a/meta/classes-recipe/kernel-arch.bbclass
+++ b/meta/classes-recipe/kernel-arch.bbclass
@@ -73,10 +73,8 @@ HOST_OBJCOPY_KERNEL_ARCH ?= "${TARGET_OBJCOPY_KERNEL_ARCH}"
 
 KERNEL_CC = "${CCACHE}${HOST_PREFIX}gcc ${HOST_CC_KERNEL_ARCH} \
  -fuse-ld=bfd ${DEBUG_PREFIX_MAP} \
- -fdebug-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
- -fdebug-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
- -fmacro-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_DIR}=${KERNEL_SRC_PATH} \
+ -ffile-prefix-map=${STAGING_KERNEL_BUILDDIR}=${KERNEL_SRC_PATH} \
 "
 KERNEL_LD = "${HOST_PREFIX}ld.bfd ${HOST_LD_KERNEL_ARCH}"
 KERNEL_AR = "${HOST_PREFIX}ar ${HOST_AR_KERNEL_ARCH}"
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 501808204e..b1dae17267 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -652,15 +652,11 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
 ##################################################################
 TARGET_DBGSRC_DIR ?= "/usr/src/debug/${PN}/${PV}"
 # Beware: applied last to first
-DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
- -fmacro-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
- -fmacro-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
- -fdebug-prefix-map=${STAGING_DIR_HOST}= \
- -fmacro-prefix-map=${STAGING_DIR_HOST}= \
- -fdebug-prefix-map=${STAGING_DIR_NATIVE}= \
- -fmacro-prefix-map=${STAGING_DIR_NATIVE}= \
+DEBUG_PREFIX_MAP ?= "\
+ -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} \
+ -ffile-prefix-map=${STAGING_DIR_HOST}= \
+ -ffile-prefix-map=${STAGING_DIR_NATIVE}= \
 "
 DEBUG_LEVELFLAG ?= "-g"
 
diff --git a/meta/lib/oe/package.py b/meta/lib/oe/package.py
index 0db14f2164..0bcc04ea54 100644
--- a/meta/lib/oe/package.py
+++ b/meta/lib/oe/package.py
@@ -991,7 +991,7 @@ def copydebugsources(debugsrcdir, sources, d):
 
         prefixmap = {}
         for flag in cflags.split():
-            if not flag.startswith("-fdebug-prefix-map"):
+            if not flag.startswith("-ffile-prefix-map"):
                 continue
             if "recipe-sysroot" in flag:
                 continue
diff --git a/meta/recipes-devtools/gcc/libgfortran.inc b/meta/recipes-devtools/gcc/libgfortran.inc
index 4560421ed1..fa6aecaaa3 100644
--- a/meta/recipes-devtools/gcc/libgfortran.inc
+++ b/meta/recipes-devtools/gcc/libgfortran.inc
@@ -8,7 +8,7 @@ EXTRA_OECONF_PATHS = "\
 # An arm hard float target like raspberrypi4 won't build
 # as CFLAGS don't make it to the fortran compiler otherwise
 # (the configure script sets FC to $GFORTRAN unconditionally)
-export GFORTRAN = "${FC} -fcanon-prefix-map -fdebug-prefix-map=${S}=${TARGET_DBGSRC_DIR} -fdebug-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
+export GFORTRAN = "${FC} -ffile-prefix-map=${S}=${TARGET_DBGSRC_DIR} -ffile-prefix-map=${B}=${TARGET_DBGSRC_DIR} -gno-record-gcc-switches"
 
 do_configure () {
 	for target in libbacktrace libgfortran
diff --git a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
index 17c8fb7083..ad61aac856 100644
--- a/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
+++ b/meta/recipes-devtools/python/python3-maturin_1.8.3.bb
@@ -9,7 +9,7 @@ SRC_URI[sha256sum] = "304762f86fd53a8031b1bf006d12572a2aa0a5235485031113195cc015
 
 S = "${WORKDIR}/maturin-${PV}"
 
-CFLAGS += "-fdebug-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
+CFLAGS += "-ffile-prefix-map=${CARGO_HOME}=${TARGET_DBGSRC_DIR}/cargo_home"
 
 DEPENDS += "\
     python3-setuptools-rust-native \
diff --git a/meta/recipes-devtools/rust/cargo_1.84.1.bb b/meta/recipes-devtools/rust/cargo_1.84.1.bb
index db18ecfda9..150c2d2b80 100644
--- a/meta/recipes-devtools/rust/cargo_1.84.1.bb
+++ b/meta/recipes-devtools/rust/cargo_1.84.1.bb
@@ -19,7 +19,7 @@ CARGO_VENDORING_DIRECTORY = "${RUSTSRC}/vendor"
 
 inherit cargo pkgconfig
 
-DEBUG_PREFIX_MAP += "-fdebug-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
+DEBUG_PREFIX_MAP += "-ffile-prefix-map=${RUSTSRC}/vendor=${TARGET_DBGSRC_DIR}"
 
 do_cargo_setup_snapshot () {
 	${UNPACKDIR}/rust-snapshot-components/${CARGO_SNAPSHOT}/install.sh --prefix="${WORKDIR}/${CARGO_SNAPSHOT}" --disable-ldconfig
-- 
2.43.0


