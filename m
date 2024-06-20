Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7485C27C79
	for <webhook@archiver.kernel.org>; Thu, 20 Jun 2024 15:10:31 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.50093.1718896226689983783
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jun 2024 08:10:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=u8gs/Ex9;
 spf=pass (domain: baylibre.com, ip: 209.85.166.178, mailfrom: tgamblin@baylibre.com)
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3758fa1cc8eso3603035ab.3
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 08:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718896226; x=1719501026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=C8howk5Cw3HWT4FUNgn69T+PSbJnlSmxdBdSkzKK0C0=;
        b=u8gs/Ex9AtEMW0ugrf0U3QlHsn6+9FB/iZorjWO3WaOF/zNNDhGgTUN9uQQXujH2TX
         DPhl7BK/JQOmSymaEbERwwBWuOe7488ozv+DRuT9HEzwkavKr8KN6G0gMAAXMw8b8dTF
         gSSA5GbKlNoweEAqXYycbhbEsO+FfqTXnLqhMvr1RMZgnqRMabTVjWPQ8abgJGUz3LDE
         Zkg81PjoFzluAlzD6YVokzpcIu3HqzWTqhjf+xfKVP4G38ufS5SGX7WeKcjwOvFZI0aj
         E4XrBc49mNWVJDARnbp8fcz+hvmbgq7LjTFN2a2xWbl/Y3GkQ44jK3JN0lwDqIi6JK6X
         GRsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718896226; x=1719501026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C8howk5Cw3HWT4FUNgn69T+PSbJnlSmxdBdSkzKK0C0=;
        b=MKOPGXBn+Hi89WFBtaaxJIVWa1XyCY8wOp/B2ZhHfPCOhQN5TGx6kOSzV7tYbyehih
         bU3GaFUcgqdbNC+BMlerwkp2voc16d3WcY9f6AwhZ1eLma9lO7AFwU3aySqxzB+RrH1Z
         r6QF8O+wUy5KD4TYhcqu2FYzPpP+lD4znlWir8O0e3ifUgjvtGlWEr42k0mtOWz/+4Re
         RvE7IxEXG0pXHNAh2sZrhdV1MPRHzp3kzVhTAX+iz4bs8qL0gBN3VmME+j1j14cCQe1Q
         guiDgy2RFoZSDduKdRZ9oTmqrht0PQTahu9GoaQvBnTwlpyOZ2MYz1dUW3lq5FMvIumo
         h3YA==
X-Gm-Message-State: AOJu0YwPedRJ1teHzlHUEp+P7GvhfnjzJgGG86FYhEHy0RLNhXt/s/id
	8gc7gQIFkOEmF66EY4t2aFGXGs4cghlmP6WM/Y99JMHaBbLF5SvTlc7OhxafDD7AOSCF4ZaPuLm
	y
X-Google-Smtp-Source: AGHT+IHn+/WOjMgWG5mhkwL4yys3YR2skCo/WBu7cPCw98koc9HjT/xOVrv7fIJGDiiy0gHG0XqjuQ==
X-Received: by 2002:a05:6e02:1383:b0:374:aa87:bcaa with SMTP id e9e14a558f8ab-3761d6beb6fmr68145695ab.14.1718896225763;
        Thu, 20 Jun 2024 08:10:25 -0700 (PDT)
Received: from megalith.oryx-coho.ts.net (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-375fa54fad8sm19820685ab.11.2024.06.20.08.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 08:10:25 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: ross.burton@arm.com,
	Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][RFC][PATCH] python3-numpy: upgrade 1.26.4 -> 2.0.0
Date: Thu, 20 Jun 2024 11:10:23 -0400
Message-ID: <20240620151023.407966-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jun 2024 15:10:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200964

This release contains numerous API changes and bug fixes.

Changelog: https://github.com/numpy/numpy/releases/tag/v2.0.0

The build backend has switched to mesonpy.

Patch 0001-numpy-core-Define-RISCV-32-support.patch had to be updated to
change the paths for the target files. It's still waiting to be merged
upstream and will need a rebase, so I've added a comment on the PR:

https://github.com/numpy/numpy/pull/17780

License-Update: Change copyright year to 2024

---
When trying to build the recipe, I see this error during do_compile:

| Found Pkg-config: NO
| Run-time dependency python found: YES 3.12
| Has header "Python.h" with dependency python: NO
|
| ../numpy-2.0.0/meson.build:44:2: ERROR: Problem encountered: Cannot compile `Python.h`. Perhaps you need to install python-dev|python-devel
|
| A full log can be found at /home/tgamblin/workspace/yocto/poky/build/tmp/work/core2-64-poky-linux/python3-numpy/2.0.0/build/meson-logs/meson-log.txt

I thought it might be a simple need for python3-native in DEPENDS, but
it doesn't help. Does anyone know what's missing for that?
---

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 28 +++++++++++--------
 ...numpy_1.26.4.bb => python3-numpy_2.0.0.bb} |  6 ++--
 2 files changed, 19 insertions(+), 15 deletions(-)
 rename meta/recipes-devtools/python/{python3-numpy_1.26.4.bb => python3-numpy_2.0.0.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
index 676bdbb3af..8dfb20edbb 100644
--- a/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
+++ b/meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
@@ -1,4 +1,4 @@
-From eb6d6579150bf4684603ce377c51e90ad3bb8109 Mon Sep 17 00:00:00 2001
+From df38843aaa7184115d262f14eae23ff38a20372a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 15 Nov 2020 15:32:39 -0800
 Subject: [PATCH] numpy/core: Define RISCV-32 support
@@ -7,15 +7,19 @@ Helps compile on riscv32
 
 Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Update the patch with the new paths for numpy release 2.0.0.
+
+Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
 ---
- numpy/core/include/numpy/npy_cpu.h    | 3 +++
- numpy/core/include/numpy/npy_endian.h | 1 +
+ numpy/_core/include/numpy/npy_cpu.h    | 3 +++
+ numpy/_core/include/numpy/npy_endian.h | 1 +
  2 files changed, 4 insertions(+)
 
-diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
-index 78d229e..04be511 100644
---- a/numpy/core/include/numpy/npy_cpu.h
-+++ b/numpy/core/include/numpy/npy_cpu.h
+diff --git a/numpy/_core/include/numpy/npy_cpu.h b/numpy/_core/include/numpy/npy_cpu.h
+index a19f8e6bbd..d824d4efb6 100644
+--- a/numpy/_core/include/numpy/npy_cpu.h
++++ b/numpy/_core/include/numpy/npy_cpu.h
 @@ -19,6 +19,7 @@
   *              NPY_CPU_ARCEB
   *              NPY_CPU_RISCV64
@@ -33,10 +37,10 @@ index 78d229e..04be511 100644
  #elif defined(__loongarch__)
      #define NPY_CPU_LOONGARCH
  #elif defined(__EMSCRIPTEN__)
-diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
-index 5e58a7f..0926212 100644
---- a/numpy/core/include/numpy/npy_endian.h
-+++ b/numpy/core/include/numpy/npy_endian.h
+diff --git a/numpy/_core/include/numpy/npy_endian.h b/numpy/_core/include/numpy/npy_endian.h
+index 5e58a7f52c..09262120bf 100644
+--- a/numpy/_core/include/numpy/npy_endian.h
++++ b/numpy/_core/include/numpy/npy_endian.h
 @@ -49,6 +49,7 @@
              || defined(NPY_CPU_PPC64LE)       \
              || defined(NPY_CPU_ARCEL)         \
@@ -46,5 +50,5 @@ index 5e58a7f..0926212 100644
              || defined(NPY_CPU_WASM)
          #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
 -- 
-2.20.1
+2.45.2
 
diff --git a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-numpy_1.26.4.bb
rename to meta/recipes-devtools/python/python3-numpy_2.0.0.bb
index ccd08147af..45441be382 100644
--- a/meta/recipes-devtools/python/python3-numpy_1.26.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.0.0.bb
@@ -3,7 +3,7 @@ HOMEPAGE = "https://numpy.org/"
 DESCRIPTION = "NumPy is the fundamental package needed for scientific computing with Python."
 SECTION = "devel/python"
 LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF-2.0 & Apache-2.0 & MIT"
-LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=a752eb20459cf74a9d84ee4825e8317c"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=1de863c37a83e71b1e97b64d036ea78b"
 
 SRCNAME = "numpy"
 
@@ -13,14 +13,14 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "2a02aba9ed12e4ac4eb3ea9421c420301a0c6460d9830d74a9df87efa4912010"
+SRC_URI[sha256sum] = "cf5d1c9e6837f8af9f92b6bd3e86d513cdc11f60fd62185cc49ec7d1aba34864"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
 
 DEPENDS += "python3-cython-native"
 
-inherit ptest setuptools3 github-releases
+inherit ptest python_mesonpy github-releases
 
 S = "${WORKDIR}/numpy-${PV}"
 
-- 
2.45.2


