Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id C479A7833C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 19:32:01 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 17so2064065pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Oct 2017 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Sh+IMYXbMa3XCPVYeSg4W1aYMNUTicp5QUyXxEbkHjg=;
	b=pZ2onb2RfoM4xnMqjUmUKSNIG2r9UG7wUaMsnkKYL2Fmy9Pbcd7blmIRvp8+cTlycG
	bOykyEYZFvLeNQxuvB1Rp1IgDwJnSyZzMR9PkZuhBTCkygsePCUuG2Wl7lw9xTEYFnUp
	V67PzE0CDh/qXnd18r06hBdNfzQRrFBNSheSv4rw7KLhEKZbbd1o3LLK4eYJqE9EBSgw
	BRnOqb7TQ1UlqkzA7hn/WsqO77y64wYjMUGNWO6nRfm+W5x597iFs9AjOK4t79+WYILr
	V1JiS2SV9XOyZOj0AvHrS3lcQUmrXfPWuCbXoIVvmocX+KRjPveZcWzr20Oa/b4cEozD
	oovw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Sh+IMYXbMa3XCPVYeSg4W1aYMNUTicp5QUyXxEbkHjg=;
	b=V65HWJegs7/uf+ghSagxOZ8r8l0+kquLiT1Qx/SW8CIlQVN6kTRpwDSziZ4v6sXKGp
	wqdsX7H5Iiv8MUCbCQ5m0UQJ1vlVjEu0k4P//2sNjpldxZ+kpsy4XYV30Ef4C4MsJkAw
	pR3gFl57Lgw7yWVEtENWWv+7og1oypqYdf5yeC1I/s8EWE9mBk+OkaDAylYiwi9UVLih
	Hy8wjUhbaxflMe9TvdLoVCwbABcWKTObDWui0uPYAchlOYoDbyNC5m5RQg7uQeVEiqK7
	TwdwjYuaQk6zj+eHnnJM6D0fmhm2yI5Lf87xolUiZgd+UfQGm+kBinPGedWHu3oWf5Zu
	f3Ww==
X-Gm-Message-State: AMCzsaW2187NLxVejDuiKXbgZVDMlrvB5MpkeAUxZhls8HiSgtTnPeTg
	s4NSCq+f5Xo+8xg/8P6+Bq5r5Q==
X-Google-Smtp-Source: AOwi7QBZlh5gl6mFBfOBIvL005BrQWsNc1BE+1LE8+5VrvW1MFLT5FOfX4CNFXIgAiv/3Dz+jAXGDg==
X-Received: by 10.99.131.66 with SMTP id h63mr11654876pge.156.1508268722610;
	Tue, 17 Oct 2017 12:32:02 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::d2ab])
	by smtp.gmail.com with ESMTPSA id
	h10sm19086417pgn.73.2017.10.17.12.32.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 12:32:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Oct 2017 12:31:54 -0700
Message-Id: <20171017193154.15715-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH V2] go: Fix build with PIE on musl
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2017 19:32:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes since v1: Document the patches

 meta/recipes-devtools/go/go-1.9.inc                |   3 +
 .../go/go-1.9/default-buildmode-pie.patch          |  18 ++++
 .../go/go-1.9/set-external-linker.patch            | 111 +++++++++++++++++++++
 3 files changed, 132 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8d72..f52abb5735 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -15,6 +15,9 @@ SRC_URI += "\
         file://0007-ld-add-soname-to-shareable-objects.patch \
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
+        file://default-buildmode-pie.patch \
 "
+SRC_URI_append_libc-musl = " file://set-external-linker.patch"
+
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
new file mode 100644
index 0000000000..a7933bd39e
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
@@ -0,0 +1,18 @@
+Default to PIE on linux platforms
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+diff -upr src/go.orig/src/cmd/go/internal/work/build.go src/go/src/cmd/go/internal/work/build.go
+--- go.orig/src/cmd/go/internal/work/build.go	2017-08-27 17:38:26.354750979 +0200
++++ go/src/cmd/go/internal/work/build.go	2017-08-27 17:40:27.555130105 +0200
+@@ -304,7 +304,8 @@ func BuildModeInit() {
+ 		ldBuildmode = "c-shared"
+ 	case "default":
+ 		switch platform {
+-		case "android/arm", "android/arm64", "android/amd64", "android/386":
++		case "linux/386", "linux/amd64", "linux/arm", "linux/arm64", "linux/ppc64le", "linux/s390x",
++			"android/arm", "android/arm64", "android/amd64", "android/386":
+ 			codegenArg = "-shared"
+ 			ldBuildmode = "pie"
+ 		case "darwin/arm", "darwin/arm64":
diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
new file mode 100644
index 0000000000..d6bd7fa39c
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
@@ -0,0 +1,111 @@
+Change the dynamic linker hardcoding to use musl when not using glibc
+this should be applied conditional to musl being the system C library
+
+Upstream-Status: Inappropriate [Real Fix should be portable across libcs]
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Index: go/src/cmd/link/internal/amd64/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/amd64/obj.go
++++ go/src/cmd/link/internal/amd64/obj.go
+@@ -67,7 +67,7 @@ func Init() {
+ 	ld.Thearch.Append64 = ld.Append64l
+ 	ld.Thearch.TLSIEtoLE = tlsIEtoLE
+ 
+-	ld.Thearch.Linuxdynld = "/lib64/ld-linux-x86-64.so.2"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-x86_64.so.1"
+ 	ld.Thearch.Freebsddynld = "/libexec/ld-elf.so.1"
+ 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
+ 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
+Index: go/src/cmd/link/internal/arm/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/arm/obj.go
++++ go/src/cmd/link/internal/arm/obj.go
+@@ -63,7 +63,7 @@ func Init() {
+ 	ld.Thearch.Append32 = ld.Append32l
+ 	ld.Thearch.Append64 = ld.Append64l
+ 
+-	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.3" // 2 for OABI, 3 for EABI
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-armhf.so.1"
+ 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
+ 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
+ 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
+Index: go/src/cmd/link/internal/arm64/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/arm64/obj.go
++++ go/src/cmd/link/internal/arm64/obj.go
+@@ -62,7 +62,7 @@ func Init() {
+ 	ld.Thearch.Append32 = ld.Append32l
+ 	ld.Thearch.Append64 = ld.Append64l
+ 
+-	ld.Thearch.Linuxdynld = "/lib/ld-linux-aarch64.so.1"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-aarch64.so.1"
+ 
+ 	ld.Thearch.Freebsddynld = "XXX"
+ 	ld.Thearch.Openbsddynld = "XXX"
+Index: go/src/cmd/link/internal/mips/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/mips/obj.go
++++ go/src/cmd/link/internal/mips/obj.go
+@@ -77,7 +77,7 @@ func Init() {
+ 		ld.Thearch.Append64 = ld.Append64b
+ 	}
+ 
+-	ld.Thearch.Linuxdynld = "/lib/ld.so.1"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-mipsle.so.1"
+ 
+ 	ld.Thearch.Freebsddynld = "XXX"
+ 	ld.Thearch.Openbsddynld = "XXX"
+Index: go/src/cmd/link/internal/mips64/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/mips64/obj.go
++++ go/src/cmd/link/internal/mips64/obj.go
+@@ -75,7 +75,7 @@ func Init() {
+ 		ld.Thearch.Append64 = ld.Append64b
+ 	}
+ 
+-	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
++	ld.Thearch.Linuxdynld = "/lib64/ld-musl-mips64le.so.1"
+ 
+ 	ld.Thearch.Freebsddynld = "XXX"
+ 	ld.Thearch.Openbsddynld = "XXX"
+Index: go/src/cmd/link/internal/ppc64/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/ppc64/obj.go
++++ go/src/cmd/link/internal/ppc64/obj.go
+@@ -77,7 +77,7 @@ func Init() {
+ 	}
+ 
+ 	// TODO(austin): ABI v1 uses /usr/lib/ld.so.1
+-	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-powerpc64le.so.1"
+ 
+ 	ld.Thearch.Freebsddynld = "XXX"
+ 	ld.Thearch.Openbsddynld = "XXX"
+Index: go/src/cmd/link/internal/s390x/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/s390x/obj.go
++++ go/src/cmd/link/internal/s390x/obj.go
+@@ -62,7 +62,7 @@ func Init() {
+ 	ld.Thearch.Append32 = ld.Append32b
+ 	ld.Thearch.Append64 = ld.Append64b
+ 
+-	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-s390x.so.1"
+ 
+ 	// not relevant for s390x
+ 	ld.Thearch.Freebsddynld = "XXX"
+Index: go/src/cmd/link/internal/x86/obj.go
+===================================================================
+--- go.orig/src/cmd/link/internal/x86/obj.go
++++ go/src/cmd/link/internal/x86/obj.go
+@@ -63,7 +63,7 @@ func Init() {
+ 	ld.Thearch.Append32 = ld.Append32l
+ 	ld.Thearch.Append64 = ld.Append64l
+ 
+-	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.2"
++	ld.Thearch.Linuxdynld = "/lib/ld-musl-i386.so.1"
+ 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
+ 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
+ 	ld.Thearch.Netbsddynld = "/usr/libexec/ld.elf_so"
-- 
2.14.2


