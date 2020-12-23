Received: from mga12.intel.com (mga12.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.10343.1608736768391429647
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Dec 2020 07:19:32 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: ZC62OwJQ8NgadEMe45l8awnLiC+Yd6dIcrhEwYyRhhtXRejuYphCYRvolXNWGne/Gvcd5IXJxo
 Lu13v0cmSX9w==
X-IronPort-AV: E=McAfee;i="6000,8403,9843"; a="155236126"
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="155236126"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:32 -0800
IronPort-SDR: VoQbgLH5BndcsvsSHxT5eroCv1a5t6iac4FZVj2OlfbiydrEaV/ogtzlZ8N1BFEMrNNKuKBEp/
 gyta1KlfbJBA==
X-IronPort-AV: E=Sophos;i="5.78,441,1599548400"; 
   d="scan'208";a="374027705"
Received: from btang1-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.75.173])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2020 07:19:31 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 28/35] go: Update 1.15.5 -> 1.15.6
Date: Wed, 23 Dec 2020 23:18:38 +0800
Message-Id: <7c732ac7ce04e8bc9f08acdc910ec3120e4ee016.1608735614.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1608735614.git.anuj.mittal@intel.com>
References: <cover.1608735614.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

The deleted patch file mentioned below is removed since 1.15.6
already has the issue patched.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ab41033b4202341a3767d1c54c86e08c7e37610f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/go/go-1.15.inc          |   5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 100 ------------------
 ...e_1.15.5.bb => go-binary-native_1.15.6.bb} |   4 +-
 3 files changed, 4 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
 rename meta/recipes-devtools/go/{go-binary-native_1.15.5.bb => go-binary-native_1.15.6.bb} (83%)

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index ccfb0c5987..abe74e5eb7 100644
--- a/meta/recipes-devtools/go/go-1.15.inc
+++ b/meta/recipes-devtools/go/go-1.15.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.15"
-PV = "1.15.5"
+PV = "1.15.6"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -15,6 +15,5 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
-SRC_URI[main.sha256sum] = "c1076b90cf94b73ebed62a81d802cd84d43d02dea8c07abdc922c57a071c84f1"
+SRC_URI[main.sha256sum] = "890bba73c5e2b19ffb1180e385ea225059eb008eb91b694875dd86ea48675817"
diff --git a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
deleted file mode 100644
index b57041f1db..0000000000
--- a/meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 4759221d46b1666de96b8047cec3160bfe4d3d5d Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 13 Nov 2020 11:05:37 -0800
-Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
-
-Fixes #42565
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
-Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
-Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
-Trust: Ian Lance Taylor <iant@golang.org>
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Go Bot <gobot@golang.org>
-Reviewed-by: Jay Conrod <jayconrod@google.com>
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/cmd/go/internal/work/exec.go      | 15 +++++++++
- src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
- create mode 100644 src/cmd/go/testdata/script/ldflag.txt
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 575a2df..9209e3d 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -2821,6 +2821,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
- 				idx = bytes.Index(src, []byte(cgoLdflag))
- 			}
- 		}
-+
-+		// We expect to find the contents of cgoLDFLAGS in flags.
-+		if len(cgoLDFLAGS) > 0 {
-+		outer:
-+			for i := range flags {
-+				for j, f := range cgoLDFLAGS {
-+					if f != flags[i+j] {
-+						continue outer
-+					}
-+				}
-+				flags = append(flags[:i], flags[i+len(cgoLDFLAGS):]...)
-+				break
-+			}
-+		}
-+
- 		if err := checkLinkerFlags("LDFLAGS", "go:cgo_ldflag", flags); err != nil {
- 			return nil, nil, err
- 		}
-diff --git a/src/cmd/go/testdata/script/ldflag.txt b/src/cmd/go/testdata/script/ldflag.txt
-new file mode 100644
-index 0000000..6ceb33b
---- /dev/null
-+++ b/src/cmd/go/testdata/script/ldflag.txt
-@@ -0,0 +1,44 @@
-+# Issue #42565
-+
-+[!cgo] skip
-+
-+# We can't build package bad, which uses #cgo LDFLAGS.
-+cd bad
-+! go build
-+stderr no-such-warning
-+
-+# We can build package ok with the same flags in CGO_LDFLAGS.
-+env CGO_LDFLAGS=-Wno-such-warning -Wno-unknown-warning-option
-+cd ../ok
-+go build
-+
-+# Build a main program that actually uses LDFLAGS.
-+cd ..
-+go build -ldflags=-v
-+
-+# Because we passed -v the Go linker should print the external linker
-+# command which should include the flag we passed in CGO_LDFLAGS.
-+stderr no-such-warning
-+
-+-- go.mod --
-+module ldflag
-+
-+-- bad/bad.go --
-+package bad
-+
-+// #cgo LDFLAGS: -Wno-such-warning -Wno-unknown-warning
-+import "C"
-+
-+func F() {}
-+-- ok/ok.go --
-+package ok
-+
-+import "C"
-+
-+func F() {}
-+-- main.go --
-+package main
-+
-+import _ "ldflag/ok"
-+
-+func main() {}
--- 
-2.29.2
-
diff --git a/meta/recipes-devtools/go/go-binary-native_1.15.5.bb b/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
similarity index 83%
rename from meta/recipes-devtools/go/go-binary-native_1.15.5.bb
rename to meta/recipes-devtools/go/go-binary-native_1.15.6.bb
index 1fb11b0435..622557ad2b 100644
--- a/meta/recipes-devtools/go/go-binary-native_1.15.5.bb
+++ b/meta/recipes-devtools/go/go-binary-native_1.15.6.bb
@@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
 PROVIDES = "go-native"
 
 SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
-SRC_URI[go_linux_amd64.sha256sum] = "9a58494e8da722c3aef248c9227b0e9c528c7318309827780f16220998180a0d"
-SRC_URI[go_linux_arm64.sha256sum] = "a72a0b036beb4193a0214bca3fca4c5d68a38a4ccf098c909f7ce8bf08567c48"
+SRC_URI[go_linux_amd64.sha256sum] = "3918e6cc85e7eaaa6f859f1bdbaac772e7a825b0eb423c63d3ae68b21f84b844"
+SRC_URI[go_linux_arm64.sha256sum] = "f87515b9744154ffe31182da9341d0a61eb0795551173d242c8cad209239e492"
 
 UPSTREAM_CHECK_URI = "https://golang.org/dl/"
 UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
-- 
2.29.2

