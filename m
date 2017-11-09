Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1E678784ED
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:59:01 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id o7so3444829pgc.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NDxRfl1TcxhKtro2718wHMSUJ/zrNh637rMne58or0o=;
	b=MEZInTsZA/rXvgtDyLFomsmBvg3zHwdF7JWRBrFkhWYVG9nQGwIEW7XIJnufH8DCvC
	jv0BYEZvzq9wf1GO3hJ7hwZY1Ona6TPQ6RHi/rKXGjehqJLwrSM4lIus7sKm4VQBMsVt
	zwfHCUnJzV4Dx7U/fTqn6NCOjeUi+dhEcr5iLnplvV58Nk/gUjzO8rywZdWQ+Odtr53T
	KpOxLcRmg6dVjj0rmjnPrAt1UapD+QOUckIXjWCjH2u+TBUXAzM/QbLi1q/WbmODdRX6
	vIMwd0VcciHRdioNDRDmXmYUo9PEbOHz6vBTWr/ENShurEXnZZO8EJr7Cl7M2VsI3Snl
	ZXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NDxRfl1TcxhKtro2718wHMSUJ/zrNh637rMne58or0o=;
	b=cg8zShTAORWCV4P/TMOKrJCkwbC70VpRj5McPj32SFOBB63eZK97yayFPqfGkHn1q1
	6f/Tmo1lx0L9QhQrIkHEyhbtsHrasbKRDKeh1kAudehXz/p0xulhkhHjuVQfhCwhI+Ne
	E3eiy+j8zDJnYexE6cDHwOn+M/vKhAh1pKobjnJ67H8xaWZCRBb6HxxHOTtntVtyTZkt
	Si5r+cglcQCyc0JAlvQTuc6LSGR+98R7ln8SeIH/gQ0W3OKoNJw1m/JV7fIiYLB0nF/c
	qVtMZadtqKWx4sxJIhV355f/WUD2Zv4Ar+rtqE5wSzeI6xlR+kS7pLXqX/LaGSdLRzgN
	U0zg==
X-Gm-Message-State: AJaThX685wOnyZ2mMf7PC2kxP9IdDl+/+OdPKPbIeZSSm/HmfgauUaSs
	659ZX1C1kXJASCuWqCXAYiBhbQ==
X-Google-Smtp-Source: ABhQp+RBfM1VHdct0k4LZcYvWpYzp9WUM/rXDTJxDpPW8FoPy4d7bwewFaT5Fxan4DBbwR2tXZIugg==
X-Received: by 10.101.81.139 with SMTP id h11mr2258681pgq.233.1510192743141;
	Wed, 08 Nov 2017 17:59:03 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	w17sm10156709pfa.70.2017.11.08.17.59.01
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 17:59:01 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:58:49 -0800
Message-Id: <59fa19d2f199771d480a8443fee2f7b728ad38e2.1510192517.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510192517.git.raj.khem@gmail.com>
References: <cover.1510192517.git.raj.khem@gmail.com>
Subject: [PATCH 2/5] go: Fix build with PIE on musl
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
X-List-Received-Date: Thu, 09 Nov 2017 01:59:02 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
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
2.15.0


