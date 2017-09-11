Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id E999671AD9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:29:29 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id b1so11210094qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=+ZGAdmdCvCx0NKLFokTFrDHFH4VlbPHcgUZgev2cEVY=;
	b=pbEeGBB1PzANQUccm+a1YwJ2d4x80sUHqpM7og41vPFyFZoaRzipjPuIovC4cjWCpl
	8xIY6GTiPIWm450PnFUo2D33I6YlMEQ6TL3/MyY1RiJYNJktHB4EeEMo4PxThBL1Hg0v
	fYovAKPAwWzheOF8IXDNAHy9jKlyLreksmuXIxZ/NYLALFJjivLs0HDShJpYwBQH9thf
	y3G0fgI4VAMy2xlA6gJgukOKJUTd3QFhRG5vrQK45F1Vsln3iVpxNbnjbvN0eJ9xxZ33
	r91d5x4PsjELPfpqHPAGhGWwjsHIU0YjB2a7xKfp4Qa3yMi1vkkW8NLkccBdTvgM4l+L
	+r8w==
X-Gm-Message-State: AHPjjUhQi7DBerFm2KfJxPDVpJLSISyUTQ3DdFm4tlIhTCZ1TaAHUSpP
	MfEvNJoAxxqI4S2A
X-Google-Smtp-Source: AOwi7QBT3KryK1xE1/1jeYsfQeT5yxTCXw2viNph5gn7zmZP5fb9OPKjt/jm+dSQEOgdC0EQExyazw==
X-Received: by 10.237.33.188 with SMTP id l57mr3473321qtc.270.1505154570429;
	Mon, 11 Sep 2017 11:29:30 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j40sm6679200qtj.38.2017.09.11.11.29.26
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:29:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:29:21 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:44 -0300
Message-Id: <20170911182853.11076-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 03/12] go: split out go-runtime into separate recipe
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
X-List-Received-Date: Mon, 11 Sep 2017 18:29:30 -0000

From: Matt Madison <matt@madison.systems>

Reorganize the Go toolchain build to split out
the Go standard runtime libraries into a separate
recipe.  This simplifies the extension to crosssdk
and cross-canadian builds.

* Adds a patch to the go build tool to prevent it
  from trying to rebuild anything in GOROOT, which
  is now resident in the target sysroot.

* 'go' bb and inc files are now for building the
  compiler for the target only.

* 'go-cross' bb and inc files are now just for
  the cross-compiler.

* Adds virtual/<prefix> PROVIDES for the compiler
  and runtime

* Removes testdata directories from the sysroot
  during staging, as they are unnecessary and
  can cause strip errors (some of the test files
  are ELF files).

* Re-enables pacakage QA checks, adding selective
  INSANE_SKIP settings where needed.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7:
- Fix Upstream-Status header typo

Changes in v6:
- new patch

 meta/classes/go.bbclass                            | 22 +++----
 meta/recipes-devtools/go/go-1.8.inc                |  1 +
 .../go/go-1.8/make-goroot-precious.patch           | 21 +++++++
 meta/recipes-devtools/go/go-cross.inc              | 61 ++++++++++++++++---
 meta/recipes-devtools/go/go-cross_1.8.bb           |  5 +-
 meta/recipes-devtools/go/go-runtime.inc            | 58 ++++++++++++++++++
 meta/recipes-devtools/go/go-runtime_1.8.bb         |  2 +
 meta/recipes-devtools/go/go.inc                    | 68 ++++++----------------
 8 files changed, 167 insertions(+), 71 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
 create mode 100644 meta/recipes-devtools/go/go-runtime.inc
 create mode 100644 meta/recipes-devtools/go/go-runtime_1.8.bb

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cb1e96d88b..b3464d2105 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -20,11 +20,11 @@ def get_go_parallel_make(d):
 GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
-GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
+GOROOT = "${STAGING_LIBDIR}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
-DEPENDS_GOLANG_class-target = "go-cross-${TARGET_ARCH}"
+DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
 
 DEPENDS_append = " ${DEPENDS_GOLANG}"
@@ -32,14 +32,15 @@ DEPENDS_append = " ${DEPENDS_GOLANG}"
 export GOBUILDFLAGS ?= "-v"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
-export GOOS = "${TARGET_GOOS}"
-export GOARCH = "${TARGET_GOARCH}"
-export GOARM = "${TARGET_GOARM}"
+export GO = "${HOST_PREFIX}go"
+GOTOOLDIR = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
+GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
+export GOTOOLDIR
 export CGO_ENABLED = "1"
 export GOROOT
-export GOROOT_FINAL = "${libdir}/${TARGET_SYS}/go"
+export GOROOT_FINAL = "${libdir}/go"
 export GOBIN_FINAL
-export GOPKG_FINAL = "${GOROOT_FINAL}/pkg/${GOOS}_${GOARCH}"
+export GOPKG_FINAL = "${GOROOT_FINAL}/pkg/${TARGET_GOTUPLE}"
 export GOSRC_FINAL = "${GOROOT_FINAL}/src"
 export GO_GCFLAGS = "${TARGET_CFLAGS}"
 export GO_LDFLAGS = "${TARGET_LDFLAGS}"
@@ -55,6 +56,7 @@ GO_INSTALL ?= "${GO_IMPORT}/..."
 GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
+export GOPATH = "${B}"
 
 python go_do_unpack() {
     src_uri = (d.getVar('SRC_URI') or "").split()
@@ -75,7 +77,7 @@ python go_do_unpack() {
 }
 
 go_list_packages() {
-	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
+	${GO} list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
 		egrep -v '${GO_INSTALL_FILTEROUT}'
 }
 
@@ -84,9 +86,9 @@ go_do_configure() {
 }
 
 go_do_compile() {
-	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
+	${GO} env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} `go_list_packages`
+		${GO} install ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
index bfb26de01d..2920d06f60 100644
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ b/meta/recipes-devtools/go/go-1.8.inc
@@ -14,6 +14,7 @@ SRC_URI += "\
        file://fix-cc-handling.patch \
        file://split-host-and-target-build.patch \
        file://gotooldir.patch \
+       file://make-goroot-precious.patch \
 "
 SRC_URI[main.md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
 SRC_URI[main.sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch b/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
new file mode 100644
index 0000000000..28a7a34773
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.8/make-goroot-precious.patch
@@ -0,0 +1,21 @@
+Prevent GOROOT-resident packages from being rebuilt
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+Upstream-Status: Pending
+
+--- go.orig/src/cmd/go/pkg.go
++++ go/src/cmd/go/pkg.go
+@@ -1496,6 +1496,13 @@ func isStale(p *Package) (bool, string)
+ 		return true, "build ID mismatch"
+ 	}
+ 
++	// For OE builds, make anything in GOROOT non-stale,
++	// to prevent a package build from overwriting the
++	// build root.
++	if p.Goroot && os.Getenv("GOROOT_OVERRIDE") != "1" {
++		return false, "GOROOT-resident packages do not get rebuilt"
++	}
++
+ 	// Package is stale if a dependency is.
+ 	for _, p1 := range p.deps {
+ 		if p1.Stale {
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 1c2d9e3a3d..df3e4ea914 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -1,15 +1,60 @@
 inherit cross
 
-DEPENDS += "gcc-cross-${TARGET_ARCH}"
+PROVIDES = "virtual/${TARGET_PREFIX}go"
+DEPENDS += "go-native"
 
 PN = "go-cross-${TARGET_ARCH}"
 
-# Ignore how TARGET_ARCH is computed.
-TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
-# Ignore target os libc for cross compiler
-#TARGET_OS[vardepexclude] = "LIBCEXTENSION"
-FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
+export GOHOSTOS = "${BUILD_GOOS}"
+export GOHOSTARCH = "${BUILD_GOARCH}"
+export GOOS = "${TARGET_GOOS}"
+export GOARCH = "${TARGET_GOARCH}"
+export GOARM = "${TARGET_GOARM}"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
+export GOROOT_FINAL = "${libdir}/go"
+export CGO_ENABLED = "1"
+export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+CC = "${@d.getVar('BUILD_CC', True).strip()}"
 
-GOROOT_FINAL = "${libdir}/go"
-export GOROOT_FINAL
+do_configure[noexec] = "1"
 
+do_compile() {
+    export GOBIN="${B}/bin"
+    rm -rf ${GOBIN} ${B}/pkg
+    mkdir ${GOBIN}
+    cd src
+    ./make.bash --host-only
+    cd ${B}
+}
+
+
+make_wrapper() {
+    rm -f ${D}${bindir}/$2
+    cat <<END >${D}${bindir}/$2
+#!/bin/bash
+here=\`dirname \$0\`
+export GOARCH="${TARGET_GOARCH}"
+export GOOS="${TARGET_GOOS}"
+export GOARM="${TARGET_GOARM}"
+\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
+END
+    chmod +x ${D}${bindir}/$2
+}
+
+do_install() {
+    install -d ${D}${libdir}/go
+    cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+    install -d ${D}${libdir}/go/src
+    (cd ${S}/src; for d in *; do \
+        [ ! -d $d ] || cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
+    done)
+
+    install -d ${D}${bindir} ${D}${libdir}/go/bin
+    for f in ${B}/bin/*
+    do
+        base=`basename $f`
+        install -m755 $f ${D}${libdir}/go/bin
+        make_wrapper $base ${TARGET_PREFIX}$base
+    done
+}
diff --git a/meta/recipes-devtools/go/go-cross_1.8.bb b/meta/recipes-devtools/go/go-cross_1.8.bb
index 56ee084b10..80b5a03f6c 100644
--- a/meta/recipes-devtools/go/go-cross_1.8.bb
+++ b/meta/recipes-devtools/go/go-cross_1.8.bb
@@ -1,5 +1,2 @@
 require go-cross.inc
-require go_${PV}.bb
-
-# Go binaries are not understood by the strip tool.
-INHIBIT_SYSROOT_STRIP = "1"
+require go-${PV}.inc
diff --git a/meta/recipes-devtools/go/go-runtime.inc b/meta/recipes-devtools/go/go-runtime.inc
new file mode 100644
index 0000000000..e3eddda837
--- /dev/null
+++ b/meta/recipes-devtools/go/go-runtime.inc
@@ -0,0 +1,58 @@
+DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
+PROVIDES = "virtual/${TARGET_PREFIX}go-runtime"
+
+export GOHOSTOS = "${BUILD_GOOS}"
+export GOHOSTARCH = "${BUILD_GOARCH}"
+export GOOS = "${TARGET_GOOS}"
+export GOARCH = "${TARGET_GOARCH}"
+export GOARM = "${TARGET_GOARM}"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
+export GOROOT_FINAL = "${libdir}/go"
+export GO_TARGET_INSTALL = "std"
+export CGO_ENABLED = "1"
+export CC_FOR_TARGET="${CC}"
+export CXX_FOR_TARGET="${CXX}"
+export GOROOT_OVERRIDE = "1"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+	export GOBIN="${B}/bin"
+	export CC="${@d.getVar('BUILD_CC').strip()}"
+	rm -rf ${GOBIN} ${B}/pkg
+	mkdir ${GOBIN}
+	cd src
+	GO_FLAGS="" ./make.bash
+	cd ${B}
+}
+
+do_install() {
+	install -d ${D}${libdir}/go/src
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	if [ "${BUILD_GOTUPLE}" != "${TARGET_GOTUPLE}" ]; then
+		rm -rf ${D}${libdir}/go/pkg/${BUILD_GOTUPLE}
+		rm -rf ${D}${libdir}/go/pkg/obj/${BUILD_GOTUPLE}
+	fi
+	rm -rf ${D}${libdir}/go/pkg/tool
+	rm -rf ${D}${libdir}/go/pkg/obj
+	rm -rf ${D}${libdir}/go/pkg/bootstrap
+	find src -mindepth 1 -maxdepth 1 -type d | while read srcdir; do
+		[ "$srcdir" = "./cmd" ] || cp --preserve=mode,timestamps -R $srcdir ${D}${libdir}/go/src/
+	done
+}
+
+# These testdata directories aren't needed for builds and contain binaries
+# that can cause errors in sysroot_strip(), so just remove them.
+sysroot_stage_all_append() {
+	find ${SYSROOT_DESTDIR}${libdir}/go/src -depth -type d -name 'testdata' -exec rm -rf {} \;
+}
+
+ALLOW_EMPTY_${PN} = "1"
+FILES_${PN}-dev = "${libdir}/go/src ${libdir}/go/pkg/include"
+FILES_${PN}-staticdev = "${libdir}/go/pkg/${TARGET_GOTUPLE} ${libdir}/go/pkg/${TARGET_GOTUPLE}"
+# The testdata directories in the source tree include some binaries for various
+# architectures, scripts, and .a files
+INSANE_SKIP_${PN}-dev = "staticdev ldflags file-rdeps arch"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
diff --git a/meta/recipes-devtools/go/go-runtime_1.8.bb b/meta/recipes-devtools/go/go-runtime_1.8.bb
new file mode 100644
index 0000000000..43b68b4e46
--- /dev/null
+++ b/meta/recipes-devtools/go/go-runtime_1.8.bb
@@ -0,0 +1,2 @@
+require go-${PV}.inc
+require go-runtime.inc
diff --git a/meta/recipes-devtools/go/go.inc b/meta/recipes-devtools/go/go.inc
index 9efbd275bd..5984a60c28 100644
--- a/meta/recipes-devtools/go/go.inc
+++ b/meta/recipes-devtools/go/go.inc
@@ -1,16 +1,5 @@
 inherit goarch
-DEPENDS += "go-native"
-
-# libgcc is required for the target specific libraries to build
-# properly, but apparently not for go-cross and, more importantly,
-# also can't be used there because go-cross cannot depend on
-# the tune-specific libgcc. Otherwise go-cross also would have
-# to be tune-specific.
-DEPENDS += "${@ 'libgcc' if not oe.utils.inherits(d, 'cross') else ''}"
-
-# Prevent runstrip from running because you get errors when the host arch != target arch
-INHIBIT_PACKAGE_STRIP = "1"
-INHIBIT_SYSROOT_STRIP = "1"
+DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
@@ -22,13 +11,11 @@ export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
 export CC_FOR_TARGET = "${CC}"
 export CXX_FOR_TARGET = "${CXX}"
+export GO_TARGET_INSTALL = "cmd"
+export GO_FLAGS = "-a"
 
 do_configure[noexec] = "1"
 
-do_compile_prepend_class-cross() {
-	export CGO_ENABLED=0
-}
-
 do_compile() {
 	export GOBIN="${B}/bin"
 	export CC="${@d.getVar('BUILD_CC', True).strip()}"
@@ -39,43 +26,26 @@ do_compile() {
 	mkdir -p ${WORKDIR}/build-tmp
 
 	cd src
-	./make.bash --host-only
-	# Ensure cgo.a is built with the target toolchain
-	export GOBIN="${B}/target/bin"
-	rm -rf ${GOBIN}
-	mkdir -p ${GOBIN}
-	GO_FLAGS="-a" ./make.bash
-}
-
-do_install_class-target() {
-	install -d ${D}${libdir}/go
-	cp -a ${B}/pkg ${D}${libdir}/go/
-	install -d ${D}${libdir}/go/src
-	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
-	done)
-	install -d ${D}${bindir}
-	if [ -d ${B}/bin/${GOOS}_${GOARCH} ]
-	then
-		install -m 0755 ${B}/bin/${GOOS}_${GOARCH}/* ${D}${bindir}
-	else
-		install -m 0755 ${B}/bin/* ${D}${bindir}
-	fi
+	./make.bash
+	cd ${B}
 }
 
-do_install_class-cross() {
-	install -d ${D}${libdir}/go
-	cp -a ${B}/pkg ${D}${libdir}/go/
+do_install() {
+	install -d ${D}${libdir}/go/pkg/tool
+	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${libdir}/go/src
-	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp -a ${S}/src/$d ${D}${libdir}/go/src/; \
-	done)
+	cp --preserve=mode,timestamps -R ${S}/src/cmd ${D}${libdir}/go/src/
+	install -d ${D}${libdir}/go/bin
 	install -d ${D}${bindir}
-	for f in ${B}/bin/go*
-	do
-		install -m755 $f ${D}${bindir}
+	for f in ${B}/${GO_BUILD_BINDIR}/*; do
+		name=`basename $f`
+		install -m 0755 $f ${D}${libdir}/go/bin/
+		ln -sf ../${BASELIB}/go/bin/$name ${D}${bindir}/
 	done
 }
-do_package_qa[noexec] = "1"
 
-RDEPENDS_${PN} += "perl"
+PACKAGES = "${PN} ${PN}-dev"
+FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir}"
+FILES_${PN}-dev = "${libdir}/go"
+RDEPENDS_${PN}-dev = "perl bash"
+INSANE_SKIP_${PN} = "ldflags"
-- 
2.14.1


