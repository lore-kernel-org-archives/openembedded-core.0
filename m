Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.556.1609884402667951909
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Jan 2021 14:06:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sP89+QRD;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id i7so793028pgc.8
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Jan 2021 14:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS4lErOKjS8Ms7deoMKlZFEYoY4V9Kn3FiC7zMIrb68=;
        b=sP89+QRDpdXkwwilnAkE7ni5DSVR7qlGtJ11NzTn0ucG8se14Nw4MM3xgQVLYMWxj7
         MRIoFHRQisfv0HmIAKMjf1/Jq7BZHN/aU+A8ZG++LWSwkmxbUrJWZUpAfoDupvtInECd
         s+CSR5vuRR83Xq/9FWfZ9v28QvU3WxfVbnOPg5eY6WzUlGwSW3Gtmrb1TdSm3axXwc9b
         BHINy/ET4k95sZrE9IChWRuLXRADS6SDeet64dwDQlLvjd3GMAs35hh44theiCeItwNL
         tBAS9mAN6DRb4olbiSDGciNVJCsDgQhvmEotuV/heADVDvfaFrfABOIBnt30u8DXJB87
         +/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qS4lErOKjS8Ms7deoMKlZFEYoY4V9Kn3FiC7zMIrb68=;
        b=h8KSHVpA77OXE/r/Yngj3MONB9cmDWh+Wbfn7Gel1z8zxJSzgXaIl+ORpU76E+9Gts
         m1C2RzaNqwrzNZMTJY8cJlqG5+vMk60P7saAbUY+u3A7u5top5ttfvwpZN1l74vPaID5
         UqDrHws+934LNQ3h+BwqIPBHkLDXZXhulIA14rhoAgDteZ8WT2tI2uNMU7aeOPXx+BRh
         cDF7z7Jhog4CEiGqDIoGWgVt7pE1KLKHz0ikEVDOPNm2a9c6oFgtcZ2ifvs4FVwc5YgK
         K15qEHZaof81VyqfH0V3TVNv4JOV05lto0dtDJpYzjuXUYLy+tlQ2lny3QiaybeSjIpt
         nVsQ==
X-Gm-Message-State: AOAM532+dMO7ZWGOKKvzExtRjy8kJQCNnpTOHt1DMOo+oqDA3wnV0V3p
	O0xduMyk3h70dT0e4mv1f2G/MWYxzrkn7A==
X-Google-Smtp-Source: ABdhPJyQzXkUgzJTKIXYvUbkFUvuVM07Bh8Bu8LYL6Vhq8nKsejeapaD0jy9BEUeERBbSqPKzmNJAA==
X-Received: by 2002:a63:751c:: with SMTP id q28mr1206334pgc.231.1609884401895;
        Tue, 05 Jan 2021 14:06:41 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::8fb0])
        by smtp.gmail.com with ESMTPSA id i6sm168182pgc.58.2021.01.05.14.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jan 2021 14:06:41 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] ccache: Fix build on aarch64/clang
Date: Tue,  5 Jan 2021 14:06:38 -0800
Message-Id: <20210105220638.3544107-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

asm option checks in cmake gets it wrong to just check compiler options
to decide if SSE/AVX is supported, this accidentally then succeeds on
aarch64 and ends up compiler failures on aarch64 with clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...blake3-Remove-asm-checks-for-sse-avx.patch | 35 +++++++++++++++++++
 meta/recipes-devtools/ccache/ccache_4.1.bb    |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch

diff --git a/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch b/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch
new file mode 100644
index 0000000000..bdabb381aa
--- /dev/null
+++ b/meta/recipes-devtools/ccache/ccache/0001-blake3-Remove-asm-checks-for-sse-avx.patch
@@ -0,0 +1,35 @@
+From 0448eddcf2863ebf911e7dd445bca1c7eee2a239 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Tue, 5 Jan 2021 13:55:34 -0800
+Subject: [PATCH] blake3: Remove asm checks for sse/avx
+
+This ends up passing on clang/linux wrongly when building for aarch64
+the check in else part is good to detect the feature support and this
+check can be removed, it was setting
+
+HAVE_ASM_AVX* and HAVE_ASM_SSE* macros which are not used in the build
+anyway
+
+Upstream-Status: Submitted [https://github.com/ccache/ccache/pull/768]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/third_party/blake3/CMakeLists.txt | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/third_party/blake3/CMakeLists.txt b/src/third_party/blake3/CMakeLists.txt
+index cc24253c..856b5721 100644
+--- a/src/third_party/blake3/CMakeLists.txt
++++ b/src/third_party/blake3/CMakeLists.txt
+@@ -25,8 +25,6 @@ function(add_source_if_enabled feature compile_flags intrinsic)
+       AND CMAKE_CXX_COMPILER_VERSION VERSION_LESS 9.0)
+     message(STATUS "Detected unsupported compiler for ${have_feature} - disabled")
+     set(${have_feature} FALSE)
+-  elseif(${blake_source_type} STREQUAL "asm")
+-    check_asm_compiler_flag(${compile_flags} ${have_feature})
+   else()
+     set(CMAKE_REQUIRED_FLAGS ${compile_flags})
+     check_c_source_compiles(
+-- 
+2.30.0
+
diff --git a/meta/recipes-devtools/ccache/ccache_4.1.bb b/meta/recipes-devtools/ccache/ccache_4.1.bb
index 96254a3875..551b4c7e5c 100644
--- a/meta/recipes-devtools/ccache/ccache_4.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.1.bb
@@ -14,6 +14,7 @@ DEPENDS = "zstd"
 SRC_URI = "https://github.com/ccache/ccache/releases/download/v${PV}/${BP}.tar.gz \
            file://0001-Improve-SIMD-detection-735.patch \
            file://0002-Always-use-64bit-to-print-time_t.patch \
+           file://0001-blake3-Remove-asm-checks-for-sse-avx.patch \
            "
 SRC_URI[sha256sum] = "cdeefb827b3eef3b42b5454858123881a4a90abbd46cc72cf8c20b3bd039deb7"
 
-- 
2.30.0

