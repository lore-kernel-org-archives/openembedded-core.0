Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 3A98078513
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Nov 2017 03:09:27 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id d15so825475qte.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 19:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=NDxRfl1TcxhKtro2718wHMSUJ/zrNh637rMne58or0o=;
	b=K8S54VhWEEs4rdFXA+lCMwfTjMvnP0iQCVwUCof6TERp2yXEDLZIAD+ckUrVGnc0XZ
	oD08g1a2tuO4aS2RYJf0a+ArxPh4vmCu4Q3Xqq9mNwLMKy2eUzo/aWcXcxm8HR0vYf4c
	opvYB2sUhYEeRi71szmhSxczKDGxgAesElmVMNydO5u6X5iG7pBxKSSw2OGFb1rP/cE8
	zyMAlXvkZmPUhWKrZGEJT9KqPfQFlv4wqRmqvO+N5xfGannoEiS+zpIBWH99SoUACsiv
	xEpmegz2/myOn8Tg6IyfrjDTEktVkgwIx9dtJsBTWwheSHT+sZS/LmgYXu9umsaU0oKE
	LmmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=NDxRfl1TcxhKtro2718wHMSUJ/zrNh637rMne58or0o=;
	b=G01CeH98rrJJgpWLr9NXM6oA3+pgKhEip8UJ7wEbfs32GeMg3i9+96cwhU5Lv7Cetr
	FXIVnahxLc0R8BseZTqvgTWNJY5KWjj7SI5f/63oQx2NqNDepStG+BMT0GV/5nQRoh08
	jcA6OEu6+XU3/76pMxc1ioUa1iSUu5QaQ+VlZIOTnpnytxZec7F37ZFDS53odW0MgUbb
	xhWKf/AAmQJVULvWvbxVnBxnyArcYMK86aWJD0zfLnV5AmzL3nms9plWmzaNxwZKIa5G
	zUUo1cDH8sHJJgA4WXLwqvy4FhpXRO6kAPNG05CpiVj7WKcr1Lbzyttf8szhOmv1V04D
	y6pw==
X-Gm-Message-State: AJaThX7wkyDRV6lDEb46Zvo5dIdmG0rtzShz9HiI6T100qUx6hWAokWH
	KXcHu3D3ar7z7oHSZQihh9MerA==
X-Google-Smtp-Source: AGs4zMbcbMb1fI9MgqeAJDXV50IDisxuzaQIxR2xIXVjO0NaTwVRzLiwi9V8T+oqTYPpLi1MBkaQZg==
X-Received: by 10.55.182.129 with SMTP id g123mr22531853qkf.163.1510715368679; 
	Tue, 14 Nov 2017 19:09:28 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	r21sm7319968qkh.89.2017.11.14.19.09.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Nov 2017 19:09:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 19:09:12 -0800
Message-Id: <06752bc94a3a1ea507b714e6b0cda4cc4ea7f71b.1510715185.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1510715185.git.raj.khem@gmail.com>
References: <cover.1510715185.git.raj.khem@gmail.com>
Subject: [PATCH 1/8] go: Fix build with PIE on musl
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
X-List-Received-Date: Wed, 15 Nov 2017 03:09:28 -0000

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


