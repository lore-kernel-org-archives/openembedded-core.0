Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.10390.1606831221191202468
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 06:00:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: AO3f0mR0Ektb8JCIJYIg2LIpXaunuYbQ7lfmxlbMdatb+XF4bh0EwnYQWl9XoRIicpQ+YF3JMP
 vu1IUk6FRpMw==
X-IronPort-AV: E=McAfee;i="6000,8403,9821"; a="159882762"
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="159882762"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 06:00:14 -0800
IronPort-SDR: /JYF4aHm4onPdQwP99kH11zA4BgkqjibTbal7Lj2SS/V0HGfhF7fUwqHUn7wkbHKe4W9qI2spC
 U1tzIzrht4Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,384,1599548400"; 
   d="scan'208";a="434674082"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by fmsmga001.fm.intel.com with ESMTP; 01 Dec 2020 06:00:13 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [dunfell][PATCH] go: update to 1.14.12
Date: Tue,  1 Dec 2020 22:00:13 +0800
Message-Id: <20201201140013.61767-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

update minor version to 1.14.12

go1.14.8 includes security fixes to the net/http/cgi and net/http/fcgi packages.
go1.14.9 includes fixes to the compiler, linker, runtime, documentation, and the net/http and testing packages.
go1.14.10 includes fixes to the compiler, runtime, and the plugin and testing packages.
go1.14.11 includes fixes to the runtime, and the net/http and time packages.
go1.14.12 includes security fixes to the cmd/go and math/big packages.

Release notes:
https://golang.org/doc/devel/release.html#go1.14.minor

updates include fix for
CVE-2020-24553
CVE-2020-28362
CVE-2020-28366
CVE-2020-28367

Also backport patch to fix below CGO_LDFLAGS error

| Building std for target, linux/amd64.
| go build runtime/cgo: invalid flag in go:cgo_ldflag: -Wl,-O1

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 meta/recipes-devtools/go/go-1.14.inc          |  5 +-
 ...t-CGO_LDFLAGS-to-appear-in-go-ldflag.patch | 98 +++++++++++++++++++
 2 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch

diff --git a/meta/recipes-devtools/go/go-1.14.inc b/meta/recipes-devtools/go/go-1.14.inc
index 8f8ed89de8..02c40f4e25 100644
--- a/meta/recipes-devtools/go/go-1.14.inc
+++ b/meta/recipes-devtools/go/go-1.14.inc
@@ -1,7 +1,7 @@
 require go-common.inc
 
 GO_BASEVERSION = "1.14"
-GO_MINOR = ".7"
+GO_MINOR = ".12"
 PV .= "${GO_MINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
@@ -16,6 +16,7 @@ SRC_URI += "\
     file://0006-cmd-dist-separate-host-and-target-builds.patch \
     file://0007-cmd-go-make-GOROOT-precious-by-default.patch \
     file://0008-use-GOBUILDMODE-to-set-buildmode.patch \
+    file://0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch \
 "
 SRC_URI_append_libc-musl = " file://0009-ld-replace-glibc-dynamic-linker-with-musl.patch"
-SRC_URI[main.sha256sum] = "064392433563660c73186991c0a315787688e7c38a561e26647686f89b6c30e3"
+SRC_URI[main.sha256sum] = "b34f4b7ad799eab4c1a52bdef253602ce957125a512f5a1b28dce43c6841b971"
diff --git a/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
new file mode 100644
index 0000000000..85bf39c752
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.14/0010-cmd-go-permit-CGO_LDFLAGS-to-appear-in-go-ldflag.patch
@@ -0,0 +1,98 @@
+From 782cf560db4c919790fdb476d1bbe18e5ddf5ffd Mon Sep 17 00:00:00 2001
+From: Ian Lance Taylor <iant@golang.org>
+Date: Fri, 13 Nov 2020 11:05:37 -0800
+Subject: [PATCH] cmd/go: permit CGO_LDFLAGS to appear in //go:ldflag
+
+Fixes #42565
+
+Change-Id: If7cf39905d124dbd54dfac6a53ee38270498efed
+Reviewed-on: https://go-review.googlesource.com/c/go/+/269818
+Trust: Ian Lance Taylor <iant@golang.org>
+Run-TryBot: Ian Lance Taylor <iant@golang.org>
+TryBot-Result: Go Bot <gobot@golang.org>
+Reviewed-by: Jay Conrod <jayconrod@google.com>
+
+Upstream-Status: Backport [https://github.com/golang/go/commit/782cf560db4c919790fdb476d1bbe18e5ddf5ffd]
+Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
+---
+ src/cmd/go/internal/work/exec.go      | 15 +++++++++
+ src/cmd/go/testdata/script/ldflag.txt | 44 +++++++++++++++++++++++++++
+ 2 files changed, 59 insertions(+)
+ create mode 100644 src/cmd/go/testdata/script/ldflag.txt
+
+diff --git a/src/cmd/go/internal/work/exec.go b/src/cmd/go/internal/work/exec.go
+index 2c40a4bf001e..157ac4cafc70 100644
+--- a/src/cmd/go/internal/work/exec.go
++++ b/src/cmd/go/internal/work/exec.go
+@@ -2883,6 +2883,21 @@ func (b *Builder) cgo(a *Action, cgoExe, objdir string, pcCFLAGS, pcLDFLAGS, cgo
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
+index 000000000000..6ceb33bb70e7
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
-- 
2.17.1

