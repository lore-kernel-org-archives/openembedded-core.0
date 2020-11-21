Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web11.3674.1605947000275884418
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Nov 2020 00:23:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=FnM1t1RJ;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id w14so10174427pfd.7
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Nov 2020 00:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=deDZCikgz5sg1qNpjZjH47AQs9akaCXEJnWqH345Ga0=;
        b=FnM1t1RJqqeBaw9aLinFyNVvqS7KvSKj7fC5JFb/fQTKesexY0E2MhtDSplThcNDns
         ulHBwhHa6dPUEVHdymGRm+yXUG/wKnlv6a/5xESP0sALRdItDyiwfzVNK+ja2qHe6caZ
         9Znx33fjjvggkqy/pSA1aMWOUqVN8Lco/A/+D8/wSWZCfIlYKwPSVaG5tRQUfGR3sVIq
         pbVAcZKDhiBEqUNS4psfCvCCawthcQRIRCAFn+L5xbJ6NCP1hwedP1EwsMqNjB9zZHdN
         5dy7myEB6I4673H1emJqDL2dC5HYY/xoczZqqytHbhLAVEQkTrdQ0gF2uWrPbfgY8HLG
         lvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=deDZCikgz5sg1qNpjZjH47AQs9akaCXEJnWqH345Ga0=;
        b=ThBX8Bo7dTiBmnYdBMcrwCXapZgqkipsaDiqr6/gshhTKWqhCQDICL1znHp7t/PR1y
         jAFaQmLHv4mTV7xXiK53DSLbOeUqlNjnKtk/5hwNr8SGoz08WvfNS+B5jIRCyCVcnzwp
         pv2I8nYRIbLQH4V7BX9YZrd8x6sSBtjexYUdzNRjpKrD+dQPoueUfJWPhauW7B9td58J
         AHRHuYaqnuwNnduSTF5W+2entWMlsrzU4lnAKM3JcbK+ckaMdmCIZFLynHiFHCG8j0Ma
         bKLXuoGouwI6nsMjSulvwOmIvJZ3njz6En1YPzaqFSEKPr8/A7Ci7zy06DvTww3etbFJ
         +8Ig==
X-Gm-Message-State: AOAM533ZngxlUEc8Tv/9bf5rNB9SHR3d1dWO55qbCf6cUiuJ6MyzYeTl
	GmEvNrMZaSxGUx4yyhgu+9Si4nimSHmpyA==
X-Google-Smtp-Source: ABdhPJx4ZXtxM3S+9BKLZYastRYiVxqZDPBrwicO9Cv7FJLIjWWuTun6khdWT4IKh2aotwGeP6hvqg==
X-Received: by 2002:a17:90a:a81:: with SMTP id 1mr14101210pjw.165.1605946999326;
        Sat, 21 Nov 2020 00:23:19 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::b756])
        by smtp.gmail.com with ESMTPSA id q12sm7254216pjl.41.2020.11.21.00.23.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 00:23:18 -0800 (PST)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2] go: Update to 1.15.5
Date: Sat, 21 Nov 2020 00:23:16 -0800
Message-Id: <20201121082316.980961-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
since we are cross building it, it helps in defining the compiler
for cgo on target

backport a patch to fix CGO_LDFLAGS regression like below

Fixes
| Building std for target, linux/arm.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Backport a patch to fix CGO_LDFLAGS regression

 meta/recipes-devtools/go/go-1.15.inc          |   5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 100 ++++++++++++++++++
 ...e_1.15.3.bb => go-binary-native_1.15.5.bb} |   4 +-
 meta/recipes-devtools/go/go_1.15.bb           |   2 +
 4 files changed, 107 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.3.bb => go-binary-native_1.15.5.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index a35921c1f8..ccfb0c5987 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.3"
+PV = "1.15.5"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -15,5 +15,6 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
-SRC_URI[main.sha256sum] = "896a602570e54c8cdfc2c1348abd4ffd1016758d0bd086ccd9787dbfc9b64888"
+SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
diff --git a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
new file mode 100644
index 0000000000..b57041f1db
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
@@ -0,0 +1,100 @@
+From 4759221d46b1666de96b8047cec3160bfe4d3d5d Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Fri, 13 Nov 2020 11:05:37 -0800
+Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
+
+Fixes #42565
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
+Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
+Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
+Trust: Ian Lance Taylor <iant@golang.org>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Jay Conrod <jayconrod@google.com>
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ src/cmd/go/internal/work/exec.go      | 15 +++++++++
+ src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+)
+ create mode 100644 src/cmd/go/testdata/script/ldflag.txt
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 575a2df..9209e3d 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -2821,6 +2821,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
+ 				idx = bytes.Index(src, []byte(cgoLdflag))
+ 			}
+ 		}
++
++		// We expect to find the contents of cgoLDFLAGS in flags.
++		if len(cgoLDFLAGS) > 0 {
++		outer:
++			for i := range flags {
++				for j, f := range cgoLDFLAGS {
++					if f != flags[i+j] {
++						continue outer
++					}
++				}
++				flags = append(flags[:i], flags[i+len(cgoLDFLAGS):]...)
++				break
++			}
++		}
++
+ 		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
+ 			return nil, nil, err
+ 		}
+diff --git a/src/cmd/go/testdata/script/ldflag.txt b/src/cmd/go/testdata/script/ldflag.txt
+new file mode 100644
+index 0000000..6ceb33b
+--- /dev/null
++++ b/src/cmd/go/testdata/script/ldflag.txt
+@@ -0,0 +1,44 @@
++# Issue #42565
++
++[!cgo] skip
++
++# We can't build package bad, which uses #cgo LDFLAGS.
++cd bad
++! go build
++stderr no-such-warning
++
++# We can build package ok with the same flags in CGO_LDFLAGS.
++env CGO_LDFLAGS=-Wno-such-warning -Wno-unknown-warning-option
++cd ../ok
++go build
++
++# Build a main program that actually uses LDFLAGS.
++cd ..
++go build -ldflags=-v
++
++# Because we passed -v the Go linker should print the external linker
++# command which should include the flag we passed in CGO_LDFLAGS.
++stderr no-such-warning
++
++-- go.mod --
++module ldflag
++
++-- bad/bad.go --
++package bad
++
++// #cgo LDFLAGS: -Wno-such-warning -Wno-unknown-warning
++import "C"
++
++func F() {}
++-- ok/ok.go --
++package ok
++
++import "C"
++
++func F() {}
++-- main.go --
++package main
++
++import _ "ldflag/ok"
++
++func main() {}
+-- 
+2.29.2
+
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

