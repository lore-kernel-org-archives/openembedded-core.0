Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4E2E7717F
	for <webhook@archiver.kernel.org>; Mon, 16 Dec 2024 15:44:50 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web10.59688.1734363882909030187
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 07:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=M7Uz2NUy;
 spf=pass (domain: baylibre.com, ip: 209.85.219.46, mailfrom: tgamblin@baylibre.com)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6d8a3e99e32so37282256d6.2
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 07:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1734363882; x=1734968682; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kqeVkW2VTAWCc4tbkrBnRkof2WMAyRrfhzQHZ0Z4xls=;
        b=M7Uz2NUySNqm9CP6ON4pO9vq4AQHlp2fyGULXocS/r6DAjynjG3BoZjyNTJiw3sSDF
         Rz9WImmOQQkrUC+pIJPJ/ebzu8K4xBX72G1R9pVoC2FQ1+Ao1ZnjRuIrXURfe54Akncz
         juhJwLiNjWmApFfiO9xyVUsUgCART5GS6qLsxBNh/mNMvHu9kvsBBcz55GLEcE0AunFe
         pmIhEyVh2lGoNNx/Pq3TC4hvZVdkpgu0zZRSFcgtYmQD3RnpkMWUPBvekU24ohX+Rdk3
         IKaBs7upuLT4DesiyFuCqs5f9QRRLCy3cLOrcwvB7o7qn3cfoex93PHgy6uSxgzdIlTk
         COFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734363882; x=1734968682;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kqeVkW2VTAWCc4tbkrBnRkof2WMAyRrfhzQHZ0Z4xls=;
        b=XMc2SlQBtKKobjQIMGImXC0xPaZ91XIHlWu/N6Qp+hL6DeastbsrzfnCNIarRBKmU5
         A/qS4ZAb+bOhwYTqXDj0l1ne1Lz4PDB6zci1OlX5Tie3MbWyR6FoWBuK9DgzAPPBaS7K
         2aGl0RzGP7SZz1Axw4ZLTGHQ9SjH2Ni3VBhX42C6H37+IG3X80Q/7DngzB7Bw6ee0NEq
         nU9KOhf46m8dR74R8xqtJUK9CL4Wq29SqrHHbftVB1c+vNVQ0PBeM+4ViK7nd+Ftr9dO
         SwfRHYbillnHK/amwgL6JkREA0cbkNrhSLlt7FEsG14uS/SjtNE/msXNnFJ4bfEq6GEa
         TIyA==
X-Gm-Message-State: AOJu0YzoVS6GZHfBqupI4YiWTsxdiUnGakAGE0djVrrm8HMZBa30xHVB
	ErsY40gCaAbakNHrXmNC6CYGQCAfaEzq/2gRZFZf6J3/GAXckSDJcYLQTzG2z8gseXmPGt7Gdos
	r
X-Gm-Gg: ASbGncv2go6ewFbcx1kRRFKWSJFB7u6+pFVd5iOFOTkcSAKkh3EXIA725rpVfjj5PF2
	bjn5tfs7NWzo3DjVW799fIGUp/NzBQMe/5lZ4a8dZjmO8BIeb50F7czkmQX2NBwmxBDSJPFCVpz
	NEsybS9aocMWgV4CftnvvyQ6atFqK9k1mMjrsBWfSu3QtcMpGIHEbutP75SfvOBf4nGx1L8cwcU
	kmyPCrlLfHUb1kJcy0AT7osygZWkqVGwpvST9BKeVVdPIy6cNg40NE6yoNJOKmW8o6pblX8nehL
	o9LgAUedzQRxe+t5
X-Google-Smtp-Source: AGHT+IEWcAr5fBTAi0AhosV6JqZ9VHtcO8aoPTYfxEs8maN7qDxw2wZ93Bba4Dsc062Y20lWxO72jA==
X-Received: by 2002:ad4:5fc8:0:b0:6d8:99cf:77b9 with SMTP id 6a1803df08f44-6dc8ca6913emr240150296d6.19.1734363881568;
        Mon, 16 Dec 2024 07:44:41 -0800 (PST)
Received: from localhost (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dccd256e1asm28542136d6.29.2024.12.16.07.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 07:44:41 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: Trevor Gamblin <tgamblin@baylibre.com>
Subject: [OE-core][PATCH] python3-numpy: upgrade 2.1.3 -> 2.2.0
Date: Mon, 16 Dec 2024 10:44:38 -0500
Message-Id: <20241216154438.2864156-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Dec 2024 15:44:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208777

Patch '0001-numpy-core-Define-RISCV-32-support.patch' is included in
v2.2.0, so remove it from the SRC_URI list:

|tgamblin@megalith ~/workspace/git/pythonsrc/numpy (main)$ git tag --contains 0e2b652a0eff85798584116c905a2d6ad8f25d5f
|v2.2.0

Changelog: https://github.com/numpy/numpy/releases/tag/v2.2.0

Build log:

|BUILDALL-QEMU LOG FOR python3-numpy
|START TIME: 2024-12-13_16:55:19
|HOSTNAME: megalith
|HOST OS: Debian GNU/Linux 12 (bookworm)
|HOST KERNEL: 6.1.0-28-amd64
|===============
|BUILD RESULTS:
|[glibc]
|FAIL: qemuloongarch64
|PASS: qemuriscv32
|PASS: qemuarmv5
|PASS: qemuppc
|PASS: qemumips64
|PASS: qemuriscv64
|PASS: qemuarm64
|PASS: qemuarm
|PASS: qemux86-64
|PASS: qemuppc64
|PASS: qemux86
|PASS: qemumips
|[musl]
|FAIL: qemuloongarch64
|FAIL: qemuriscv32
|PASS: qemuarmv5
|PASS: qemuppc
|PASS: qemumips64
|PASS: qemuriscv64
|PASS: qemuarm64
|PASS: qemuarm
|PASS: qemux86-64
|PASS: qemuppc64
|PASS: qemux86
|PASS: qemumips
|===============
|PASSED: 21
|FAILED: 3

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 58 -------------------
 ...-numpy_2.1.3.bb => python3-numpy_2.2.0.bb} |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-numpy/0001-numpy-core-Define-RISCV-32-support.patch
 rename meta/recipes-devtools/python/{python3-numpy_2.1.3.bb => python3-numpy_2.2.0.bb} (94%)

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
diff --git a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb b/meta/recipes-devtools/python/python3-numpy_2.2.0.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-numpy_2.1.3.bb
rename to meta/recipes-devtools/python/python3-numpy_2.2.0.bb
index 0120bee4390..522f9682a5b 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.1.3.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.2.0.bb
@@ -9,11 +9,10 @@ SRCNAME = "numpy"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
-           file://0001-numpy-core-Define-RISCV-32-support.patch \
            file://fix_reproducibility.patch \
            file://run-ptest \
            "
-SRC_URI[sha256sum] = "aa08e04e08aaf974d4458def539dece0d28146d866a39da5639596f4921fd761"
+SRC_URI[sha256sum] = "140dd80ff8981a583a60980be1a655068f8adebf7a45a06a6858c873fcdcd4a0"
 
 GITHUB_BASE_URI = "https://github.com/numpy/numpy/releases"
 UPSTREAM_CHECK_REGEX = "releases/tag/v?(?P<pver>\d+(\.\d+)+)$"
-- 
2.39.5


