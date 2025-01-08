Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB18DE7719B
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 08:42:49 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.14226.1736325765154997671
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 00:42:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OTltezuT;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so28751059a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 00:42:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736325763; x=1736930563; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHrzH0lZ55Ccfqbw/psQigbnfitEWMl6ifNmtzmZNnk=;
        b=OTltezuTwPNAios8iq0ccZUiJAh7EZgHvGvDFs00KrlaIsD2pWfvbPYooWTLUG3cTz
         ZUBTGmwxrQaEMiRgHZqwyJLvTe3xzfW+i3NTrAm4qvi6/n/QXkY9/TKtf44xYDzYoHV6
         v96q8gy1j4DhNP4nZfTy1VIMWGR90K0Cc/YDNY6VXm4Iq3s/UTuuVwJgGDOIlfJ+U32k
         MqNxBj1IxtUOGzntzsT3kelIFGMQlkOLYPGtbGosAQYnt2XxvO1GRXwp56joBUXC7l2A
         aL69r/Pdr4rCgw7hyCbhGZlmXx9sdk2geJ0K0rtOF7WssXIY27ZbaKDJDYTywyEHbpw1
         14Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736325763; x=1736930563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sHrzH0lZ55Ccfqbw/psQigbnfitEWMl6ifNmtzmZNnk=;
        b=urgWfTTUW2horAIAdbwptUrTLCGFmAYTSsZJYZiQVnAWxZAdG9BU4iLYh4dQ66hF6M
         BDdYiZxyoICyPWGK/75RV6F5Q5bq6pgfm0QPh/fPnsokTByH6hUQY+0+CQTrauMebU66
         TRg+ZEQ074gS0tAbyBliBDJOW+HkKdQwTYacoPNeQ5v+mtJh17GjEhInv3cSyZnzdYOT
         aEGwxZil8IFrJ7wqNC3uDYXzYwMAM8PjhBrGHZikjwdYDVDkuR5smTXepHYDIllWdxRF
         SPuU06BWG/4fWsDGwBsHfdeglvqQJydNhAIm4F/RTp+9HF5cHSkMZIIypsZqOxpuOPf6
         DKTw==
X-Gm-Message-State: AOJu0YyQKVlAzaPbQCGAfgcOblXygFLyRiLQ4Lq6ang3/85KeaDGeSxS
	R+wBlBaPooaWQuSmAEp+6YxZdStDa6PqMZ6RE+jIIXzOtsN90nwC8eWiww==
X-Gm-Gg: ASbGncvsoDgWCuMeEpjOkBSdoQJiuu1AD77Sq9CI+BA23WCFFDPuBnM2lCW0B19UCKi
	teITZ5BCJmLGhI0BRusERwQV3HB60lEnWHeUsm7ZkKrNEfXGHdR6j8nujQN8NnPs7+NcE4eixhL
	5Zx/X8DxRDALuoOsDT32ADh61gmaiJHVI8BNuy/SOCo3e+XWA9810LxFvC2CBeazLTbEXkMVgaN
	NyS5ZllRPC3LR7e9rIRO94M8IdjWRTIlFHvCygXOsYEYzl6uolye+bLtz2sHzGSZo5BPZ3uIXER
	bXTKZejzsfT/UKHYyg==
X-Google-Smtp-Source: AGHT+IHj7cW5se22d6K7pGL3MDo3vKaCi2BrplNw0izT12bkhOj84mB+Mx81V0xJcPV9U6cfPcnqEQ==
X-Received: by 2002:a17:906:7956:b0:aa6:707a:af59 with SMTP id a640c23a62f3a-ab2abdc36c5mr121690766b.50.1736325762379;
        Wed, 08 Jan 2025 00:42:42 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0f06c7c2sm2499661766b.188.2025.01.08.00.42.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 00:42:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 18/20] python3-numpy: upgrade 2.1.3 -> 2.2.1
Date: Wed,  8 Jan 2025 09:42:24 +0100
Message-Id: <20250108084226.117178-18-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250108084226.117178-1-alex.kanavin@gmail.com>
References: <20250108084226.117178-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 08:42:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209541

From: Alexander Kanavin <alex@linutronix.de>

Add a svml option, disabled by default
(it's avx-512 only, and uses randomly generated
intermediate .o file names, which makes the installed
library non-reproducible).

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-and-so-on-for-libraries-by-default-.patch |  7 +--
 ...1-numpy-core-Define-RISCV-32-support.patch | 58 -------------------
 .../python3-numpy/fix_reproducibility.patch   | 23 +++++---
 ...-numpy_2.1.3.bb => python3-numpy_2.2.1.bb} |  5 +-
 4 files changed, 21 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.1.3.bb => python3-numpy_2.2.1.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
index bbe309c5568..4a673081062 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -1,4 +1,4 @@
-From 46eea664cf89d0602e7ff16d587c37c045b125b7 Mon Sep 17 00:00:00 2001
+From 16a973c118989674afeeda2c2ccc24c9c366210e Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 10 Dec 2015 13:20:30 +0200
 Subject: [PATCH] Don't search /usr and so on for libraries by default to
@@ -8,16 +8,15 @@ Subject: [PATCH] Don't search /usr and so on for libraries by default to
 Upstream-Status: Inappropriate (As the code stands, this is a hack)
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  numpy/distutils/system_info.py | 42 +++++-----------------------------
  1 file changed, 6 insertions(+), 36 deletions(-)
 
 diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
-index feb28f6..a48d6d1 100644
+index 6478548..c0620e7 100644
 --- a/numpy/distutils/system_info.py
 +++ b/numpy/distutils/system_info.py
-@@ -327,44 +327,14 @@ def add_system_root(library_root):
+@@ -326,44 +326,14 @@ def add_system_root(library_root):
          add_system_root(os.path.join(conda_dir, 'Library'))
  
  else:
diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
deleted file mode 100644
index 6da9047ec57..00000000000
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From 0e2b652a0eff85798584116c905a2d6ad8f25d5f Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sun, 15 Nov 2020 15:32:39 -0800
-Subject: [PATCH] numpy/core: Define RISCV-32 support
-
-Helps compile on riscv32
-
-Upstream-Status: Backport
-(https://github.com/numpy/numpy/pull/17780/commits/0e2b652a0eff85798584116c905a2d6ad8f25d5f)
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- numpy/_core/include/numpy/npy_cpu.h    | 9 +++++++--
- numpy/_core/include/numpy/npy_endian.h | 1 +
- 2 files changed, 8 insertions(+), 2 deletions(-)
-
-diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
-index a19f8e6bbd..15f9f12931 100644
---- a/numpy/_core/include/numpy/npy_cpu.h
-+++ b/numpy/_core/include/numpy/npy_cpu.h
-@@ -18,6 +18,7 @@
-  *              NPY_CPU_ARCEL
-  *              NPY_CPU_ARCEB
-  *              NPY_CPU_RISCV64
-+ *              NPY_CPU_RISCV32
-  *              NPY_CPU_LOONGARCH
-  *              NPY_CPU_WASM
-  */
-@@ -102,8 +103,12 @@
-     #define NPY_CPU_ARCEL
- #elif defined(__arc__) && defined(__BIG_ENDIAN__)
-     #define NPY_CPU_ARCEB
--#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
--    #define NPY_CPU_RISCV64
-+#elif defined(__riscv)
-+    #if __riscv_xlen == 64
-+	#define NPY_CPU_RISCV64
-+    #elif __riscv_xlen == 32
-+	#define NPY_CPU_RISCV32
-+    #endif
- #elif defined(__loongarch__)
-     #define NPY_CPU_LOONGARCH
- #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
-index 5e58a7f52c..09262120bf 100644
---- a/numpy/_core/include/numpy/npy_endian.h
-+++ b/numpy/_core/include/numpy/npy_endian.h
-@@ -49,6 +49,7 @@
-             || defined(NPY_CPU_PPC64LE)       \
-             || defined(NPY_CPU_ARCEL)         \
-             || defined(NPY_CPU_RISCV64)       \
-+            || defined(NPY_CPU_RISCV32)       \
-             || defined(NPY_CPU_LOONGARCH)     \
-             || defined(NPY_CPU_WASM)
-         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
--- 
-2.39.5
-
diff --git a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
index d952aed00c6..18d7f3f84e4 100644
--- a/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
+++ b/meta/recipes-devtools/python/python3-numpy/fix_reproducibility.patch
@@ -1,7 +1,11 @@
-This regex decides whether to use O3 opimisation on numpy or not.
+From cde931f4380745b9818b55d7b06a43d347518967 Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Fri, 29 Sep 2023 22:53:24 +0100
+Subject: [PATCH] This regex decides whether to use O3 opimisation on numpy or
+ not.
 
 It includes "od", which happens to be a substring of "reproducible"
-but not "qemux86-world". 
+but not "qemux86-world".
 
 The regex will run against all compiler options including things like:
 
@@ -17,12 +21,15 @@ reproducible target ran first and won the race to populate sstate.
 
 Upstream-Status: Inappropriate [upstream have dropped distutils and switched to meson]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
-
-Index: numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-===================================================================
---- numpy-1.26.0.orig/numpy/distutils/ccompiler_opt.py
-+++ numpy-1.26.0/numpy/distutils/ccompiler_opt.py
-@@ -990,7 +990,7 @@ class _CCompiler:
+---
+ numpy/distutils/ccompiler_opt.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/numpy/distutils/ccompiler_opt.py b/numpy/distutils/ccompiler_opt.py
+index b1a6fa3..7b0302b 100644
+--- a/numpy/distutils/ccompiler_opt.py
++++ b/numpy/distutils/ccompiler_opt.py
+@@ -991,7 +991,7 @@ def __init__(self):
              ("cc_is_nocc",     "", ""),
          )
          detect_args = (
diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.1.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_2.1.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.1.bb
index 0120bee4390..251e7b0c64d 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.1.bb
@@ -9,11 +9,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
+SRC_URI[sha256sum] = "45681fd7128c8ad1c379f0ca0776a8b0c6583d2f69889ddac01559dfe4390918"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
@@ -22,6 +21,8 @@ inherit pkgconfig ptest python_mesonpy github-releases cython
 
 S = "${WORKDIR}/numpy-${PV}"
 
+PACKAGECONFIG[svml] = "-Ddisable-svml=false,-Ddisable-svml=true"
+
 # Remove references to buildpaths from numpy's __config__.py
 do_install:append() {
     sed -i \
-- 
2.39.5


