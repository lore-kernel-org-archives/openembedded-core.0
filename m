Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id CC00765CB6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 15:49:09 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id e64so12614189pfk.9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 14 Oct 2017 08:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jgYjwkcXnIkEDBk27KOF/axNZWibQXV890S5BNtHl/4=;
	b=BWRv18EmQCyJORqos9zkXPT8fF1U+7eAp+4tozFKrFbG/WLX1L6aS01hxrtXS2F/Br
	6CtzRQ1Xd4KdGG2CVmBCbRPq3fSOdJ2IdCzw0FjyHHimO890YiQciV+l9C8leuTDPxFt
	WbXiVUVcm6DtItuS7EbfZfDbUhSzxtdOp4V6why4sWRVVg1SB1sKHzobL06OvDZ/cnj7
	wh+P0n9cJy4VNt7iIymzB5t38VnrnpKkI+tQspqa+a4JoVa0b1GsJJ39D8XRZdMOvoT1
	CCNRRCRybqjI4a6Ss0mxOYA5ZIP5hpcloDUbyI5+6F83WzS5Lpj46+rsS/eDwUdJim77
	ru+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jgYjwkcXnIkEDBk27KOF/axNZWibQXV890S5BNtHl/4=;
	b=DRe7XXII+DXbic7s0PSrs8xYe/cUHKcElxZQpUBLb7NhDK6TOQpvsV/j4/RoOTUeax
	zZkhCOlhcMOMzLCuu6qvXrcBJO1QZ8ptdywI+uF9sulo6LqA9FdFZywHgI82C7Rzi9iG
	lfal37z6gxcJVeIMS8Q6kbGNxkH5cJlVg2o8lHUDSJMFyy0MPNyd4VNG236Q7NYHuhDb
	jtHYn8lX+EhNonbYG5aNLummtqUZxQG76vZ3dzC9N0zCUYKTRXWQhvcAdVBrkWvKoeWa
	gNemUUtn/xpL1sHUTmWntfMMYOIjd1sewQtoKCt81qM7n8t8C5z462D34zFoVSdSIF+H
	pkgA==
X-Gm-Message-State: AMCzsaVdq9lsK68W2JtTpwGapZY5ZktCZQcSLXE2qHPg/dNVTj04jv5o
	LH5E5u5/hxDshrIS2dL+jsrxxg==
X-Google-Smtp-Source: AOwi7QC50wTYkVvq885xeoTd1jCL2IUsYheO3fHmB00RzCy0vbaBSUEUmtRIpcCnoCDyFE4G0fUzJw==
X-Received: by 10.84.240.140 with SMTP id z12mr4463725plk.328.1507996150687;
	Sat, 14 Oct 2017 08:49:10 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::74e7])
	by smtp.gmail.com with ESMTPSA id r9sm8384819pfd.6.2017.10.14.08.49.08
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 14 Oct 2017 08:49:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 14 Oct 2017 08:48:53 -0700
Message-Id: <20171014154858.35123-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171014154858.35123-1-raj.khem@gmail.com>
References: <20171014154858.35123-1-raj.khem@gmail.com>
Subject: [PATCH 2/7] go: Fix build with PIE on musl
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
X-List-Received-Date: Sat, 14 Oct 2017 15:49:10 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.9.inc                |   3 +
 .../go/go-1.9/default-buildmode-pie.patch          |  13 +++
 .../go/go-1.9/set-external-linker.patch            | 104 +++++++++++++++++++++
 3 files changed, 120 insertions(+)
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
index 0000000000..cc8aef0ad0
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
@@ -0,0 +1,13 @@
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
index 0000000000..79eaff7205
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/set-external-linker.patch
@@ -0,0 +1,104 @@
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


