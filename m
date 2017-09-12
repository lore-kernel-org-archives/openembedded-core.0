Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 5FE0878410
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:51:05 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id b23so24747693qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=8xTpaKR2cVu60Z5ba5mct+M3KzzEefEmf2a9hX2U/3w=;
	b=gE6XY1RnHii1EaisFFr7OuXdhDte/GTQkKHviAG7kR9hi/AtIAIG3yEf+A0zOxtNjZ
	5b6FgE3aezVKy09xtCgyIOEmG5Bmt1jN5HL6cHgTP8lTQ6bNUVLJVzddklSL3F/LBy5Q
	Jr2v+jOeqT1DrWo1w+K5t5Bz/epGnZ4cijEvjt3qyR8lEUdy7co6z4Uw6qRq6WVQeYP9
	e3wErWWXD9VttjOu78buC31UgfJpa/NwH3fND7FPL4I51hV3tUO7S0sVHZyY/j61tsSh
	+Gtotmfouz9fzxElRR5XJ7Pkc2bV3MQzvCUxczmgVyt4YWqSzSWPfAigAdVp6P2kMiV6
	UV6w==
X-Gm-Message-State: AHPjjUhv7tGPNE0+ARVbrr6plY/qHp9deARZyiQ/FJ7LU8iA0hnEinTR
	LuFwH+LqN7/XavGp
X-Google-Smtp-Source: AOwi7QDiucTBJGXFKXAZVV42jgOI7RwPxc7E5mIWJCB7f+KRXejCX+/L00yf7IkE+eA+tWDEuCzatg==
X-Received: by 10.55.98.19 with SMTP id w19mr20341917qkb.261.1505220666849;
	Tue, 12 Sep 2017 05:51:06 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	g132sm7413081qke.11.2017.09.12.05.51.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:51:04 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:50:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:19 -0300
Message-Id: <20170912125031.4009-2-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 01/13] go-native: remove dependency on go-bootstrap-native
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
X-List-Received-Date: Tue, 12 Sep 2017 12:51:06 -0000

From: Matt Madison <matt@madison.systems>

The go1.4 toolchain is only required for bootstrapping
go-native, and should not be used for anything else,
so build it as part of the go-native build. This way,
we don't have to carry around its built artifacts in
the native sysroot.

The go-cross and target toolchains can then just depend
on go-native, using that for their 'bootstrap' toolchain.

Also removed some unnecessary package-related noexec
settings, since native recipes inherit nopackages.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/go-1.8.inc       |  4 +--
 meta/recipes-devtools/go/go-common.inc    |  2 +-
 meta/recipes-devtools/go/go-native.inc    | 48 +++++++++++++++++--------------
 meta/recipes-devtools/go/go-native_1.8.bb |  1 -
 meta/recipes-devtools/go/go.inc           |  4 +--
 5 files changed, 32 insertions(+), 27 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
index 3690f310bd..bfb26de01d 100644
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ b/meta/recipes-devtools/go/go-1.8.inc
@@ -15,5 +15,5 @@ SRC_URI += "\
        file://split-host-and-target-build.patch \
        file://gotooldir.patch \
 "
-SRC_URI[md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
-SRC_URI[sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
+SRC_URI[main.md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
+SRC_URI[main.sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-common.inc b/meta/recipes-devtools/go/go-common.inc
index f74b8b7650..ce1eb86812 100644
--- a/meta/recipes-devtools/go/go-common.inc
+++ b/meta/recipes-devtools/go/go-common.inc
@@ -14,7 +14,7 @@ LICENSE = "BSD-3-Clause"
 
 inherit goarch
 
-SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz"
+SRC_URI = "http://golang.org/dl/go${PV}.src.tar.gz;name=main"
 S = "${WORKDIR}/go"
 B = "${S}"
 
diff --git a/meta/recipes-devtools/go/go-native.inc b/meta/recipes-devtools/go/go-native.inc
index c21f8fda78..9eb2b3211f 100644
--- a/meta/recipes-devtools/go/go-native.inc
+++ b/meta/recipes-devtools/go/go-native.inc
@@ -1,16 +1,28 @@
+# Use immediate assingment here to get the original (/usr/lib)
+# instead of the one rewritten by native.bbclass.
+nonstaging_libdir := "${libdir}"
+
 inherit native
 
-BOOTSTRAP ?= ""
+SRC_URI_append = " http://golang.org/dl/go1.4.3.src.tar.gz;name=bootstrap;subdir=go1.4"
+SRC_URI[bootstrap.md5sum] = "dfb604511115dd402a77a553a5923a04"
+SRC_URI[bootstrap.sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
+
 export GOOS = "${BUILD_GOOS}"
 export GOARCH = "${BUILD_GOARCH}"
-export GOROOT_FINAL = "${STAGING_LIBDIR_NATIVE}/go${BOOTSTRAP}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go1.4"
+CC = "${@d.getVar('BUILD_CC', True).strip()}"
+
 export CGO_ENABLED = "1"
 
-do_configure[noexec] = "1"
+do_configure() {
+    cd ${WORKDIR}/go1.4/go/src
+    CGO_ENABLED=0 GOROOT=${WORKDIR}/go1.4/go ./make.bash
+}
 
 do_compile() {
 	export GOBIN="${B}/bin"
+	export GOROOT_FINAL="${nonstaging_libdir}/go"
+	export GOROOT_BOOTSTRAP="${WORKDIR}/go1.4/go"
 	rm -rf ${GOBIN}
 	mkdir ${GOBIN}
 
@@ -18,7 +30,7 @@ do_compile() {
 	mkdir -p ${WORKDIR}/build-tmp
 
 	cd src
-	CGO_ENABLED=0 ./make.bash --host-only
+	./make.bash --host-only
 }
 
 make_wrapper() {
@@ -26,31 +38,25 @@ make_wrapper() {
 	cat <<END >${D}${bindir}/$2$3
 #!/bin/bash
 here=\`dirname \$0\`
-export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go$3\`}"
-\$here/../lib/go$3/bin/$1 "\$@"
+export GOROOT="${GOROOT:-\`readlink -f \$here/../lib/go\`}"
+\$here/../lib/go/bin/$1 "\$@"
 END
-	chmod +x ${D}${bindir}/$2$3
+	chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
-	install -d ${D}${libdir}/go${BOOTSTRAP}
-	cp -a ${B}/pkg ${D}${libdir}/go${BOOTSTRAP}/
-	install -d ${D}${libdir}/go${BOOTSTRAP}/src
+	install -d ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	install -d ${D}${libdir}/go/src
 	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go${BOOTSTRAP}/src/; \
+		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
 	done)
 
-	install -d ${D}${bindir} ${D}${libdir}/go${BOOTSTRAP}/bin
+	install -d ${D}${bindir} ${D}${libdir}/go/bin
 	for f in ${B}/bin/*
 	do
 		base=`basename $f`
-		install -m755 $f ${D}${libdir}/go${BOOTSTRAP}/bin
-		make_wrapper $base $base ${BOOTSTRAP}
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base $base
 	done
 }
-
-do_package[noexec] = "1"
-do_packagedata[noexec] = "1"
-do_package_write_ipk[noexec] = "1"
-do_package_write_deb[noexec] = "1"
-do_package_write_rpm[noexec] = "1"
diff --git a/meta/recipes-devtools/go/go-native_1.8.bb b/meta/recipes-devtools/go/go-native_1.8.bb
index 182fca27a0..bbf3c0dd73 100644
--- a/meta/recipes-devtools/go/go-native_1.8.bb
+++ b/meta/recipes-devtools/go/go-native_1.8.bb
@@ -1,3 +1,2 @@
 require ${PN}.inc
 require go-${PV}.inc
-DEPENDS += "go-bootstrap-native"
diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 52abbebd7e..9efbd275bd 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -1,5 +1,5 @@
 inherit goarch
-DEPENDS += "go-bootstrap-native"
+DEPENDS += "go-native"
 
 # libgcc is required for the target specific libraries to build
 # properly, but apparently not for go-cross and, more importantly,
@@ -17,7 +17,7 @@ export GOHOSTARCH = "${BUILD_GOARCH}"
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
-export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go1.4"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
 export CC_FOR_TARGET = "${CC}"
-- 
2.14.1


