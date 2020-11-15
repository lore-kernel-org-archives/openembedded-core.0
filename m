Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web08.27431.1605483747328937414
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 15:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=D0eaB3FU;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id q5so11816652pfk.6
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 15:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9eS5uKhyfm2bSrNB36t3BZn3aFETYV/mt0X6OKLBZY=;
        b=D0eaB3FU0hBP84KTNSFVSI+3zjMZzrP2+zSEX+eepGBWgEdpCIevYBVJ+SGDaCW7Yu
         Q6vjdlSpeE1PXfh5DV2oCOU/W5OlZnkwHRBqeY1Ni0W/ILT3wkyF5dD9yCSj2npKLK/G
         ixYjrTA4NLpo+JUAGQ1rwrcjVgCFdwQSxb+VxQDmLe5JxXIES7DcmhDtlHCVPncAP7LR
         Txfhy8lnCiW00vH+VPmLcTxz2SS8iHDNS8ufj9Ziv+gbqPXrRxKVq/hGIqYDmn4KXJ9H
         2t6bOEX9ysDTtaeL3AGz1z3txjuPnrVCoOVw5dxsAua24GAhulHvGQjaAkFmyK2F28Jz
         k7Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Y9eS5uKhyfm2bSrNB36t3BZn3aFETYV/mt0X6OKLBZY=;
        b=tyiRiTT8QsnThNJi9s8CgMnxf+NjMV+jENAGqETstuGxza4baG+XziPgS4wIIsDVeB
         JEuhTNNmAsZwtAfGwlKEyPPcHKIPkl5AWTXPqVj4o3RbcLL2b+17VJ2WWJLxu5Xu91Q9
         yJpz/olS71KkYByuW/guEenREabBgdBGMVtFUWYDH/qCjdoM59nXMzYVXWuRSTLOe5XM
         4UM6ZrH0T9ZwXvVtw/Ocud4KkWzZJWsnYi60kL2+PFSlX6+IjSTTTJx6BM6mvCw3VIrT
         kci2XwNq65QnhP3OemM6bD9QyqYd/D/BJb7kIo8+PxSWpQtRaKtljW7uE+Qg8jwZsdpr
         gQXg==
X-Gm-Message-State: AOAM530FBU0EgVQwcEFZYcdi4QXxSTMaGOXf+srsEzR+rR4v4dYyBCmo
	6c65yuZsK/Q8tVtUUqxsrEydTFi9D8RPQQ==
X-Google-Smtp-Source: ABdhPJycaSE05Y8Jv/72Ffk4MuK8+rM8Z5VGqkpAzQXNFP75Y9uAZ8kkqSiHuHRMejDjpaEroywFVA==
X-Received: by 2002:a63:5d05:: with SMTP id r5mr11273183pgb.442.1605483746451;
        Sun, 15 Nov 2020 15:42:26 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::740e])
        by smtp.gmail.com with ESMTPSA id 64sm5798441pfe.0.2020.11.15.15.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 15:42:25 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] python-numpy: Add support for riscv32
Date: Sun, 15 Nov 2020 15:42:23 -0800
Message-Id: <20201115234223.2985120-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...1-numpy-core-Define-RISCV-32-support.patch | 35 +++++++++++++++++++
 .../python-numpy/python-numpy.inc             |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch

diff --git a/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
new file mode 100644
index 0000000000..b7a9e42b30
--- /dev/null
+++ b/meta/recipes-devtools/python-numpy/files/0001-numpy-core-Define-RISCV-32-support.patch
@@ -0,0 +1,35 @@
+From fff0371f043177b4a23998241beaaa2a3413106a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 15 Nov 2020 15:32:39 -0800
+Subject: [PATCH] numpy/core: Define RISCV-32 support
+
+Helps compile on riscv32
+
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/17780]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ numpy/core/include/numpy/npy_cpu.h | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
+index 4dbf9d84e..045e84d63 100644
+--- a/numpy/core/include/numpy/npy_cpu.h
++++ b/numpy/core/include/numpy/npy_cpu.h
+@@ -100,8 +100,12 @@
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

