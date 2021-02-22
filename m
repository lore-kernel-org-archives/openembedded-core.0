Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web12.33127.1613990477041465103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 02:41:17 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: uIHdwTNqff01tF3MvkLLV8eDppcI4YTWG3VQyxKxdOA5RtEUlb1m00e3Hq/MbMT2QmfIz4cpbX
 u018Spg3fzkg==
X-IronPort-AV: E=McAfee;i="6000,8403,9902"; a="163611542"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="163611542"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 02:41:16 -0800
IronPort-SDR: csyUG3Zu3TS40GKZiuxJUebT1+mpdmv6UvymETPv1aAzd5wFwF6ZyKb7S++UbjOg/VLVdIIYyy
 7hxiBkcwHA9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="595928788"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga005.fm.intel.com with ESMTP; 22 Feb 2021 02:41:15 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][dunfell] go: update to 1.14.15
Date: Mon, 22 Feb 2021 18:41:14 +0800
Message-Id: <20210222104114.24109-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

updates include fixes for
CVE-2021-3114
CVE-2021-3115

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 98 -------------------
 2 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 02c40f4e25..3dfd671d11 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".12"
+GO_MINOR = ".15"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -16,7 +16,6 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
-    file://0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "b34f4b7ad799eab4c1a52bdef253602ce957125a512f5a1b28dce43c6841b971"
+SRC_URI[main.sha256sum] = "7ed13b2209e54a451835997f78035530b331c5b6943cdcd68a3d815fdc009149"
diff --git a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
deleted file mode 100644
index 85bf39c752..0000000000
--- a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
+++ /dev/null
@@ -1,98 +0,0 @@
-From 782cf560db4c919790fdb476d1bbe18e5ddf5ffd Mon Sep 17 00:00:00 2001
-From: Ian Lance Taylor <iant@golang.org>
-Date: Fri, 13 Nov 2020 11:05:37 -0800
-Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
-
-Fixes #42565
-
-Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
-Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
-Trust: Ian Lance Taylor <iant@golang.org>
-Run-TryBot: Ian Lance Taylor <iant@golang.org>
-TryBot-Result: Go Bot <gobot@golang.org>
-Reviewed-by: Jay Conrod <jayconrod@google.com>
-
-Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
-Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
----
- src/cmd/go/internal/work/exec.go      | 15 +++++++++
- src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
- 2 files changed, 59 insertions(+)
- create mode 100644 src/cmd/go/testdata/script/ldflag.txt
-
-diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
-index 2c40a4bf001e..157ac4cafc70 100644
---- a/src/cmd/go/internal/work/exec.go
-+++ b/src/cmd/go/internal/work/exec.go
-@@ -2883,6 +2883,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
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
-index 000000000000..6ceb33bb70e7
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
-- 
2.17.1

