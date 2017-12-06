Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3B678684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:17:12 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id w10so7984678qtb.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:17:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=eKfa6nSGlLeDlrDKY/6WF319Hg29RxupUhBPJbmWKmQ=;
	b=ZzTXvIQEKodWS4TlvK6h9fkCy/HnUbyWavotFOF/hRPp+j60+kuZjK938UznHUBgf7
	fDJMhNT35sj2mCYULKxJcdF6VeHlJ60aW0zX7dj5pFW1uMKPOr7j8PEKmHTwKdv1sgy5
	VLYioU/OrpOs90A7hz31lQxYlC4+nfqPj/RkZ/MTnXFtq1ktoe9AKxarOKyouBthxdqW
	rw53vPx+2Rqq0wYYiNvWKrgCUQP0Aa2UH/a6jzt9HZyqBtSZq/jJxRumxZX4PqiVdGDU
	0HnFO1bX+pO82sNBTe+ClvD4G/T71Y4EvzFnZ33R6uBEFzG1glzNk5ioDnNh6wEhjb6k
	CySw==
X-Gm-Message-State: AKGB3mJwCQ+UiJs8qZeg+rFd19z7jQEzXtzZvV4q2bXYMWP5D97yd2Ki
	ZgrJ1fNmbO2tTXryh96w05dhsA==
X-Google-Smtp-Source: AGs4zMZIpjFjeaqeBlRe/5sxArAuOHzW7XKVL2BFN3GAYmvmqOv75BaKtdqM1NY1mFx9EEXOtiJjYA==
X-Received: by 10.55.151.71 with SMTP id z68mr24811790qkd.83.1512559033961;
	Wed, 06 Dec 2017 03:17:13 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n145sm1477852qke.38.2017.12.06.03.17.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Dec 2017 03:17:13 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 06 Dec 2017 09:17:05 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  6 Dec 2017 09:17:01 -0200
Message-Id: <20171206111703.13684-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko PATCH 1/3] Revert "go: Fix build with PIE on musl"
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
X-List-Received-Date: Wed, 06 Dec 2017 11:17:13 -0000

This reverts commit d6fcf91c06a3d118e8741273fac6903100141db4.

This commit was included on the rocko update by mistake. It ended
being dropped from master merge queue but forgotten in rocko one.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc                |   3 -
 .../go/go-1.9/default-buildmode-pie.patch          |  18 ----
 .../go/go-1.9/set-external-linker.patch            | 111 ---------------------
 3 files changed, 132 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index f52abb5735..65adaa8d72 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -15,9 +15,6 @@ SRC_URI += "\
         file://0007-ld-add-soname-to-shareable-objects.patch \
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
-        file://default-buildmode-pie.patch \
 "
-SRC_URI_append_libc-musl = " file://set-external-linker.patch"
-
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
deleted file mode 100644
index a7933bd39e..0000000000
--- a/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Default to PIE on linux platforms
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-diff -upr src/go.orig/src/cmd/go/internal/work/build.go src/go/src/cmd/go/internal/work/build.go
---- go.orig/src/cmd/go/internal/work/build.go	2017-08-27 17:38:26.354750979 +0200
-+++ go/src/cmd/go/internal/work/build.go	2017-08-27 17:40:27.555130105 +0200
-@@ -304,7 +304,8 @@ func BuildModeInit() {
- 		ldBuildmode = "c-shared"
- 	case "default":
- 		switch platform {
--		case "android/arm", "android/arm64", "android/amd64", "android/386":
-+		case "linux/386", "linux/amd64", "linux/arm", "linux/arm64", "linux/ppc64le", "linux/s390x",
-+			"android/arm", "android/arm64", "android/amd64", "android/386":
- 			codegenArg = "-shared"
- 			ldBuildmode = "pie"
- 		case "darwin/arm", "darwin/arm64":
diff --git a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
deleted file mode 100644
index d6bd7fa39c..0000000000
--- a/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
+++ /dev/null
@@ -1,111 +0,0 @@
-Change the dynamic linker hardcoding to use musl when not using glibc
-this should be applied conditional to musl being the system C library
-
-Upstream-Status: Inappropriate [Real Fix should be portable across libcs]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: go/src/cmd/link/internal/amd64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/amd64/obj.go
-+++ go/src/cmd/link/internal/amd64/obj.go
-@@ -67,7 +67,7 @@ func Init() {
- 	ld.Thearch.Append64 = ld.Append64l
- 	ld.Thearch.TLSIEtoLE = tlsIEtoLE
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld-linux-x86-64.so.2"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-x86_64.so.1"
- 	ld.Thearch.Freebsddynld = "/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
-Index: go/src/cmd/link/internal/arm/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/arm/obj.go
-+++ go/src/cmd/link/internal/arm/obj.go
-@@ -63,7 +63,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.3" // 2 for OABI, 3 for EABI
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-armhf.so.1"
- 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/libexec/ld.elf_so"
-Index: go/src/cmd/link/internal/arm64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/arm64/obj.go
-+++ go/src/cmd/link/internal/arm64/obj.go
-@@ -62,7 +62,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux-aarch64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-aarch64.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/mips/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/mips/obj.go
-+++ go/src/cmd/link/internal/mips/obj.go
-@@ -77,7 +77,7 @@ func Init() {
- 		ld.Thearch.Append64 = ld.Append64b
- 	}
- 
--	ld.Thearch.Linuxdynld = "/lib/ld.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-mipsle.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/mips64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/mips64/obj.go
-+++ go/src/cmd/link/internal/mips64/obj.go
-@@ -75,7 +75,7 @@ func Init() {
- 		ld.Thearch.Append64 = ld.Append64b
- 	}
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib64/ld-musl-mips64le.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/ppc64/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/ppc64/obj.go
-+++ go/src/cmd/link/internal/ppc64/obj.go
-@@ -77,7 +77,7 @@ func Init() {
- 	}
- 
- 	// TODO(austin): ABI v1 uses /usr/lib/ld.so.1
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-powerpc64le.so.1"
- 
- 	ld.Thearch.Freebsddynld = "XXX"
- 	ld.Thearch.Openbsddynld = "XXX"
-Index: go/src/cmd/link/internal/s390x/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/s390x/obj.go
-+++ go/src/cmd/link/internal/s390x/obj.go
-@@ -62,7 +62,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32b
- 	ld.Thearch.Append64 = ld.Append64b
- 
--	ld.Thearch.Linuxdynld = "/lib64/ld64.so.1"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-s390x.so.1"
- 
- 	// not relevant for s390x
- 	ld.Thearch.Freebsddynld = "XXX"
-Index: go/src/cmd/link/internal/x86/obj.go
-===================================================================
---- go.orig/src/cmd/link/internal/x86/obj.go
-+++ go/src/cmd/link/internal/x86/obj.go
-@@ -63,7 +63,7 @@ func Init() {
- 	ld.Thearch.Append32 = ld.Append32l
- 	ld.Thearch.Append64 = ld.Append64l
- 
--	ld.Thearch.Linuxdynld = "/lib/ld-linux.so.2"
-+	ld.Thearch.Linuxdynld = "/lib/ld-musl-i386.so.1"
- 	ld.Thearch.Freebsddynld = "/usr/libexec/ld-elf.so.1"
- 	ld.Thearch.Openbsddynld = "/usr/libexec/ld.so"
- 	ld.Thearch.Netbsddynld = "/usr/libexec/ld.elf_so"
-- 
2.15.1


