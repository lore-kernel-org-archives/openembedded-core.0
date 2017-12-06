Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id 2D22478684
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:17:20 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id m59so7967592qte.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:17:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=ppDKyN359kEhgj7EzDTweunW13XSqpcWpKPOk9gcBUE=;
	b=lFo/gYNpwr3kSOWi4s0qQ5Smq19lPi8G4yNuF3uaFrlTTarVMVuKa1fqUAXR/EqmYC
	Nwy/nEo/55naUss0O+raEHnQPY7zm4DTvdO1fLxkGqvkwkWhbO0D7ZVgnr7S1ofSmHYg
	jYsU0vx8/W7AVINTFQdf840NActgCEIVTXhVZGyDYW4P52YEmBRl1J1BdQihEtbER8MM
	iQ+4m4KhpidoHSoTpzMIhynR/nhsvq+fHe1t8mxoC88zgK/xc7x+nyOxAeZyscGDV1Pa
	DR+WAyGDnp+mj2Eeo7przOdEfce2JpdLo45HNc1SdffbHheJdbdHkZE0140WtsQfY8x9
	giug==
X-Gm-Message-State: AKGB3mLWKGP3Y9F6u/sy60h6HLKrr6iSnEd+zE+s/LfmIhVd9AtEiQK3
	rl/huzRFCxgZwIibtDgcGOBG4g==
X-Google-Smtp-Source: AGs4zMaFes3pgJp2OuohzPfxfEzBI5uJwUNPo1z/oANDbfOhZvmfYyKbHkn0WqGvkgdIeKpcyFHGRw==
X-Received: by 10.200.23.18 with SMTP id w18mr3896543qtj.47.1512559041110;
	Wed, 06 Dec 2017 03:17:21 -0800 (PST)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	w143sm1253782qka.84.2017.12.06.03.17.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 06 Dec 2017 03:17:20 -0800 (PST)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 06 Dec 2017 09:17:14 -0200
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  6 Dec 2017 09:17:02 -0200
Message-Id: <20171206111703.13684-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20171206111703.13684-1-otavio@ossystems.com.br>
References: <20171206111703.13684-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [rocko PATCH 2/3] go: Use right dynamic linker on musl
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
X-List-Received-Date: Wed, 06 Dec 2017 11:17:20 -0000

From: Khem Raj <raj.khem@gmail.com>

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
(cherry picked from commit 0d6e83757fc26d3e88bfe3c2437b5c7c9be09118)
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-devtools/go/go-1.9.inc                |   2 +
 .../go/go-1.9/set-external-linker.patch            | 111 +++++++++++++++++++++
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index 65adaa8d72..60292651df 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -16,5 +16,7 @@ SRC_URI += "\
         file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
         file://0009-cmd-go-buildmode-pie-forces-external-linking-mode-on.patch \
 "
+SRC_URI_append_libc-musl = " file://set-external-linker.patch"
+
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
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
2.15.1


