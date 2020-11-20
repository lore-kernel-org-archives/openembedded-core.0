Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web09.22396.1605860124133780615
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2020 00:15:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Rcs4mSNB;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id 10so7144601pfp.5
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2020 00:15:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+U2HxRHgqZKlPXiEewU3UTRWFrHlgziBRBIdHpKyRE=;
        b=Rcs4mSNBRMhwxYx9AMRQZC+MoywmchNP+aF5Wi2mxx/gGp+/bRkDB+2rdkHQZiH0V4
         JgAE62VzG7oBeOaMIMqM7ITsrlxhDMpZruFxtrEr4nLXG8DVScpIrQVFcPNBxHXWV60V
         /RKFKHku+UAxk8gFynpPRPTCKpSSpYLqMe8weAobPoeK4z/OEtPCAhkJLwEWditRjJjf
         6WdNvrygjCBB0nrmo6UohVRvKnMprokR28zOycsCP37MKE/TR248XOD1c8aOD/BUhQjS
         BwKeWMZBjJzo2eAFMziHlUS+AsktprCdKcwHDdHbveEJu2sfUvuNRbGbT3T7e0JwS36E
         F+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0+U2HxRHgqZKlPXiEewU3UTRWFrHlgziBRBIdHpKyRE=;
        b=HjbOXQQc2dY5J0zSI7QWR/t2ChE1IVTdtH5HnZtnrHU2zJ97MMVQx6ltSpOKaM0k//
         ruIcVtXYlKtW8XV2f67x/rLRSJXWnOJsNeGXgde/JlCcgnBWwMGxEOlTdoCLcyU0gV33
         YxLhz8bH8t9XK9KGihfEYS2hEdYo6iqi9S/BiYJMkZaNbNTxTKguswxmjKR6Vt88X9MJ
         FKAVM0I2VKJbWzn6LZMb7y2jCLFnoKy225ELyuhCqqTnUDB7onnZUnkFI9jNqWWOWCOg
         3u6pQzNnrpzf3sEo+OHOgfnxMnS3rGsBClib4gIXw9SpepcIE3hBvjt7xr90Bshcnmo6
         yoyQ==
X-Gm-Message-State: AOAM533tT6SxFMSIIF+0Yect102I2zh06vpgKa/8jankXx/YSJaEVK4k
	v7fv09tHOZkpkwGM6enAFpsTJsAxh2h/rQ==
X-Google-Smtp-Source: ABdhPJwAbwryxbz33gS4AV155UFZn/Kk6TDibfpPKM8/04DklS/CB/j+w9hjhIMYWHTJbCb4vxVwuA==
X-Received: by 2002:a17:90a:d491:: with SMTP id s17mr9282060pju.2.1605860123085;
        Fri, 20 Nov 2020 00:15:23 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id o133sm2550652pfg.97.2020.11.20.00.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 00:15:22 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] go: Update to 1.15.5
Date: Fri, 20 Nov 2020 00:15:20 -0800
Message-Id: <20201120081520.1356830-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
since we are cross building it, it helps in defining the compiler
for cgo on target

Disable CGO_LDFLAGS for go-runtime since it confuses the linker

Fixes
| Building std for target, linux/arm.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Fix go-runtime build

 meta/recipes-devtools/go/go-1.15.inc                          | 4 ++--
 ...{go-binary-native_1.15.3.bb => go-binary-native_1.15.5.bb} | 4 ++--
 meta/recipes-devtools/go/go-runtime.inc                       | 1 -
 meta/recipes-devtools/go/go_1.15.bb                           | 2 ++
 4 files changed, 6 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/go/{go-binary-native_1.15.3.bb => go-binary-native_1.15.5.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index a35921c1f8..31e68d14ee 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.3"
+PV = "1.15.5"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -16,4 +16,4 @@ SRC_URI += "\
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
 "
-SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
+SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.3.bb b/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.3.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.5.bb
index aeab91a80f..1fb11b0435 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.3.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "010a88df924a81ec21b293b5da8f9b11c176d27c0ee3962dc1738d2352d3c02d"
-SRC_URI[go_linux_arm64.sha256sum] = "b8b88a87ada918ef5189fa5938ef4c46a4f61952a34317612aaac705f4275f80"
+SRC_URI[go_linux_amd64.sha256sum] = "9a58494e8da722c3aef248c9227b0e9c528c7318309827780f16220998180a0d"
+SRC_URI[go_linux_arm64.sha256sum] = "a72a0b036beb4193a0214bca3fca4c5d68a38a4ccf098c909f7ce8bf08567c48"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
index 21179a83a0..37a8c95203 100644
--- a/meta/recipes-devtools/go/go-runtime.inc
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -5,7 +5,6 @@ PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
 export CGO_CFLAGS = "${CFLAGS}"
 export CGO_CPPFLAGS = "${CPPFLAGS}"
 export CGO_CXXFLAGS = "${CXXFLAGS}"
-export CGO_LDFLAGS = "${LDFLAGS}"
 export GOCACHE = "${B}/.cache"
 
 GO_EXTLDFLAGS ?= "${HOST_CC_ARCH}${TOOLCHAIN_OPTIONS} ${LDFLAGS}"
diff --git a/meta/recipes-devtools/go/go_1.15.bb b/meta/recipes-devtools/go/go_1.15.bb
index cc4c3fe45d..d4812c0f0a 100644
--- a/meta/recipes-devtools/go/go_1.15.bb
+++ b/meta/recipes-devtools/go/go_1.15.bb
@@ -6,6 +6,8 @@ inherit linuxloader
 export GOBUILDMODE=""
 export CGO_ENABLED_riscv64 = ""
 export GO_LDSO = "${@get_linuxloader(d)}"
+export CC_FOR_TARGET = "gcc"
+export CXX_FOR_TARGET = "g++"
 
 # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv and its
 # variants.
-- 
2.29.2

