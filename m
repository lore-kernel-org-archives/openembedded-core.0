Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web12.40494.1605556563830857937
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Nov 2020 11:56:03 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dJ8xekOD;
 spf=pass (domain: gmail.com, ip: 209.85.215.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f181.google.com with SMTP id 34so10888929pgp.10
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Nov 2020 11:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y1hvMeeIN3Z+62cD4GgG/ODJu6uG1IGNvkolp1/29ag=;
        b=dJ8xekODVrO5iW3ALR9gV3Dt/X65y3ou0rHFeNDAUwtv4W59KMCmTk2IZ384saOS1Z
         4NgWJhx8HXKlYfgSVtxtBIpbJNekgmvnyX4kzxe4kIl90Xm7A1o5UX6f9AR3DNPmxCYp
         vLSSYdtDmRpwY2rmcokDFXTzmgnd9BZ8Pa6mNnUPERrX/iURv2OLdYDcqMO1qeUtYA/z
         rk4xBHkATvX2W0lCOe3Y9rIIYfD8KoNJR41ZUwUg/M4xHGD2cWRy4FB8+4Cc2ut7r3oQ
         /jbqUq6jvjMsxuuBHqOGbUZrK5ABdkFQNi1paXKJSES57KxGqQcTLeCh7H3eLoo2BYmY
         WUbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y1hvMeeIN3Z+62cD4GgG/ODJu6uG1IGNvkolp1/29ag=;
        b=A8V9eh/bQOYD9udUBl5m1DGVl8+eLJLKqviOQpIJwRKQR9o+PP8cm7ph/3fxZKEqyd
         MoQ9P0JNgDn/vcmPZlRqCCWpYXvTqD07XoGjiF9smFtICx/aZrcSetzD81hCvtQbQdpB
         CA4Qj+T0BZr0w/Ss0CLfscAQD4A6G8AjuZr7c59Bq6PIotA6+OMlh1/1GK5b01Df3sN7
         ne03HMWJfsuCLDHNZxaz/oLePa6ZchEQd1y00z4qhQc3Sc5tNPTuM5ywNXEavB/6Xwpk
         VUM2o+UKEBggd2qSKrUZZl+jzUN1nOpU/VrwmfBqRgbcNVqoaPPBn1h1tykIW4UrP1Lg
         hU3w==
X-Gm-Message-State: AOAM533peuj4VYYoE/L4KMr0s4FgXpX5ozvHXCKY0VhS2V5W7sR6/5Ns
	VkgFYPf5Ev1hIFV1149QW84I8ai9Ed4eQQ==
X-Google-Smtp-Source: ABdhPJyZnKpJIV6/axPJlRPUf2igS8rGLHZ3gN3Matlg1q6wGWVcBTuYSlfOfFYWCOk8g8SvznNNgg==
X-Received: by 2002:a17:90a:ec04:: with SMTP id l4mr553366pjy.131.1605556562709;
        Mon, 16 Nov 2020 11:56:02 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::4611])
        by smtp.gmail.com with ESMTPSA id e8sm18614014pfn.175.2020.11.16.11.56.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2020 11:56:01 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH V2] python-numpy: Add support for riscv32
Date: Mon, 16 Nov 2020 11:55:59 -0800
Message-Id: <20201116195559.1240940-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Address upstream comments in proposed patch

 ...1-numpy-core-Define-RISCV-32-support.patch | 56 +++++++++++++++++++
 .../python-numpy/python-numpy.inc             |  1 +
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch

diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
new file mode 100644
index 0000000000..b60ca1d216
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
@@ -0,0 +1,56 @@
+From dbcf296f84e5cef6a3ff0f1c469a4508f1e0fb15 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 15:32:39 -0800
+Subject: [PATCH] numpy/core: Define RISCV-32 support
+
+Helps compile on riscv32
+
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ numpy/core/include/numpy/npy_cpu.h    | 9 +++++++--
+ numpy/core/include/numpy/npy_endian.h | 1 +
+ 2 files changed, 8 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
+index 4dbf9d84e..bc41a7eda 100644
+--- a/numpy/core/include/numpy/npy_cpu.h
++++ b/numpy/core/include/numpy/npy_cpu.h
+@@ -18,6 +18,7 @@
+  *              NPY_CPU_ARCEL
+  *              NPY_CPU_ARCEB
+  *              NPY_CPU_RISCV64
++ *              NPY_CPU_RISCV32
+  *              NPY_CPU_WASM
+  */
+ #ifndef _NPY_CPUARCH_H_
+@@ -100,8 +101,12 @@
+     #define NPY_CPU_ARCEL
+ #elif defined(__arc__) && defined(__BIG_ENDIAN__)
+     #define NPY_CPU_ARCEB
+-#elif defined(__riscv) && defined(__riscv_xlen) && __riscv_xlen == 64
+-    #define NPY_CPU_RISCV64
++#elif defined(__riscv)
++    #if __riscv_xlen == 64
++	#define NPY_CPU_RISCV64
++    #elif __riscv_xlen == 32
++	#define NPY_CPU_RISCV32
++    #endif
+ #elif defined(__EMSCRIPTEN__)
+     /* __EMSCRIPTEN__ is defined by emscripten: an LLVM-to-Web compiler */
+     #define NPY_CPU_WASM
+diff --git a/numpy/core/include/numpy/npy_endian.h b/numpy/core/include/numpy/npy_endian.h
+index aa367a002..d59484573 100644
+--- a/numpy/core/include/numpy/npy_endian.h
++++ b/numpy/core/include/numpy/npy_endian.h
+@@ -49,6 +49,7 @@
+             || defined(NPY_CPU_PPC64LE)       \
+             || defined(NPY_CPU_ARCEL)         \
+             || defined(NPY_CPU_RISCV64)       \
++            || defined(NPY_CPU_RISCV32)       \
+             || defined(NPY_CPU_WASM)
+         #define NPY_BYTE_ORDER NPY_LITTLE_ENDIAN
+     #elif defined(NPY_CPU_PPC)                \
+-- 
+2.29.2
+
diff --git a/meta/recipes-devtools/python-numpy/python-numpy.inc b/meta/recipes-devtools/python-numpy/python-numpy.inc
index b1058b26c8..40f81046ee 100644
--- a/meta/recipes-devtools/python-numpy/python-numpy.inc
+++ b/meta/recipes-devtools/python-numpy/python-numpy.inc
@@ -7,6 +7,7 @@ SRCNAME = "numpy"
 
 SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
            file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
+           file://0001-numpy-core-Define-RISCV-32-support.patch \
            "
 SRC_URI[sha256sum] = "9179d259a9bc53ed7b153d31fc3156d1ca560d61079f53191cf177c3efc4a498"
 
-- 
2.29.2

