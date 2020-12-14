Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.28779.1607910497260007076
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 17:48:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: khairul.rohaizzat.jamaluddin@intel.com)
IronPort-SDR: xgsZvg3qXVr70UyqVciesAv8BulL3hF2qVs39qpBhij+NvdgYA5P6jDVjiUtdmXD4OMSEiM9Hz
 4//pBG1Kagyw==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="171133624"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="171133624"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 17:48:16 -0800
IronPort-SDR: GtBGMZuxRlVap2JF8dS3X/uKYXYmy1Sm5cyvipBTiqUTZnyKI2h/0GHHo6WmhOChYwr9lJh9tm
 gq0ls96jRaMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="331645015"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by fmsmga008.fm.intel.com with ESMTP; 13 Dec 2020 17:48:15 -0800
From: "Jamaluddin, Khairul Rohaizzat" <khairul.rohaizzat.jamaluddin@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] go: Update 1.15.5 -> 1.15.6
Date: Mon, 14 Dec 2020 09:48:14 +0800
Message-Id: <1607910494-12730-1-git-send-email-khairul.rohaizzat.jamaluddin@intel.com>
X-Mailer: git-send-email 2.7.4

From: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>

The deleted patch file mentioned below is removed since 1.15.6
already has the issue patched.

Signed-off-by: Khairul Rohaizzat Jamaluddin <khairul.rohaizzat.jamaluddin@intel.com>
---
 meta/recipes-devtools/go/go-1.15.inc               |   5 +-
 ...permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 100 ---------------------
 2 files changed, 2 insertions(+), 103 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.15/0009-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.15.inc b/meta/recipes-devtools/go/go-1.15.inc
index ccfb0c5..abe74e5 100644
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
index b57041f..0000000
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
-- 
2.7.4

