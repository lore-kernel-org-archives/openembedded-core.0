Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: EFARHDBMwfvDWE8wupWqJandTX0QDP5IlX9iv4zij5wgrk23ybTnv8Fw3JXrS0cce048h6cb33
 JnhsyA2CFpUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236118"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236118"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:31 -0800
IronPort-SDR: MfYGsM/7Wdo+xcToptuJwbH1ISGw4aYSEhwWjZVIhKRnpAUlQpOAX4ZPEHKiZCYF7J3UHknMCH
 BIeehnIySsHg==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027693"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:29 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 27/35] go: Update to 1.15.5
Date: Wed, 23 Dec 2020 23:18:37 +0800
Message-Id: <0680d6ef692598fa6b765c927da50e07f008417f.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khem Raj <raj.khem@gmail.com>

Define CXX_FOR_TARGET and CC_FOR_TARGET for target go
since we are cross building it, it helps in defining the compiler
for cgo on target

backport a patch to fix CGO_LDFLAGS regression like below

Fixes
| Building std for target, linux/arm.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit a71d1b58e8cf0976a614c49aa2dfe1e0605dfe95)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
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

