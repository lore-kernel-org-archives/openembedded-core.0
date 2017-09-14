Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8ED96785DF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 19:23:07 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id i13so326195qtc.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 12:23:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=LcZ0jz0ew6KCKWwYzA2GyN9/5P+V+PMtr7I05dSvs8I=;
	b=eZ/wHsrGBrjCvTAn/Y+UkZ/HIv+UVtX78g3+D87sqy0gIbC0JQefxESRPR7SE6hMEd
	BO4jGFAmVpZG+G9WLnVe/MyUb7bY0ndGabDr1Fz7ArrAS4AzVY04N1mf+mDL/Dio4oqw
	EtkWgNbqF4stQZiR5lT3L0yigszr6me2XgXg0GUEd03Riu+qu8mAOhTOZDj4uzeaRzyu
	6nr/AQXBpa6zmxeQHLJtRvEavq71fPrJAJftDzATvN8QpHy1oi9T2z4neqRStWvqU6je
	BM34LRruhX5rwUH+nJQcKexncmXl5hpPAiEZ0iL4coOx8Xnlbxsq3s5fwFPy65bkz8mO
	HRTg==
X-Gm-Message-State: AHPjjUhDTXC/jRtU+5MF52hf05eM0Mm6kNRWhzulepVHwxSZ+zLJ96gZ
	ttl5E0KdmkDS1MgW
X-Google-Smtp-Source: AOwi7QBjO2r7jjMid4RMR7hvQOuQYU2yR3l5c2Bp7W0b3pTk1lGO8IcpfwoK7eyFeHY+gjFsRnEpIQ==
X-Received: by 10.200.5.132 with SMTP id a4mr34015082qth.318.1505416987991;
	Thu, 14 Sep 2017 12:23:07 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	o17sm10191793qkl.14.2017.09.14.12.23.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 14 Sep 2017 12:23:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Thu, 14 Sep 2017 16:22:58 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Sep 2017 16:22:29 -0300
Message-Id: <20170914192231.15002-4-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170914192231.15002-1-otavio@ossystems.com.br>
References: <20170914192231.15002-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v10 3/5] go: fixes for cross-canadian builds
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
X-List-Received-Date: Thu, 14 Sep 2017 19:23:07 -0000

From: Matt Madison <matt@madison.systems>

* Add patch for go's make script to allow for
  build system != host system

* Add dependencies on the appropriate crosssdk recipes,
  and use the crosssdk C compiler and linker

* Remove bashism in the wrapper script

* Restrict installation to only the tool binaries
  to address some packaging errors

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v10:
- new patch

 meta/recipes-devtools/go/go-1.9.inc                |  1 +
 ...dd-GOHOSTxx-indirection-for-cross-canadia.patch | 33 ++++++++++++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc     | 40 ++++++++++------------
 3 files changed, 52 insertions(+), 22 deletions(-)
 create mode 100644 meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch

diff --git a/meta/recipes-devtools/go/go-1.9.inc b/meta/recipes-devtools/go/go-1.9.inc
index d538f4c3a3..0b0aca3fbe 100644
--- a/meta/recipes-devtools/go/go-1.9.inc
+++ b/meta/recipes-devtools/go/go-1.9.inc
@@ -13,6 +13,7 @@ SRC_URI += "\
         file://0005-cmd-go-make-GOROOT-precious-by-default.patch \
         file://0006-make.bash-add-GOTOOLDIR_BOOTSTRAP-environment-variab.patch \
         file://0007-ld-add-soname-to-shareable-objects.patch \
+        file://0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch \
 "
 SRC_URI[main.md5sum] = "da2d44ea384076efec43ee1f8b7d45d2"
 SRC_URI[main.sha256sum] = "a4ab229028ed167ba1986825751463605264e44868362ca8e7accc8be057e993"
diff --git a/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch b/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
new file mode 100644
index 0000000000..0977c78350
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.9/0008-make.bash-add-GOHOSTxx-indirection-for-cross-canadia.patch
@@ -0,0 +1,33 @@
+From 03e6c339d4fb712fbb8c4ca6ef2fc7100dcdb3d7 Mon Sep 17 00:00:00 2001
+From: Matt Madison <matt@madison.systems>
+Date: Thu, 14 Sep 2017 05:38:10 -0700
+Subject: [PATCH 8/8] make.bash: add GOHOSTxx indirection for cross-canadian
+ builds
+
+Add environment variables for specifying the host OS/arch
+that we are building the compiler for, so it can differ from
+the build host OS/arch.
+
+Upstream-Status: Pending
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+---
+ src/make.bash | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/make.bash b/src/make.bash
+index 2e6fb05..0bdadc6 100755
+--- a/src/make.bash
++++ b/src/make.bash
+@@ -173,6 +173,8 @@ if [ "$do_host_build" = "yes" ]; then
+ 	echo
+ 
+ 	GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
++	GOHOSTOS="${GOHOSTOS_CROSS:-$GOHOSTOS}"
++	GOHOSTARCH="${GOHOSTARCH_CROSS:-$GOHOSTARCH}"
+ 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
+ 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
+ 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
index 0068f34d04..f3ab7351db 100644
--- a/meta/recipes-devtools/go/go-cross-canadian.inc
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -1,21 +1,24 @@
 inherit cross-canadian
 
-DEPENDS = "go-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc virtual/nativesdk-${HOST_PREFIX}compilerlibs"
+DEPENDS = "go-native virtual/${HOST_PREFIX}go-crosssdk virtual/nativesdk-${HOST_PREFIX}go-runtime \
+           virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc \
+           virtual/nativesdk-${HOST_PREFIX}compilerlibs"
 PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
-export GOOS = "${HOST_GOOS}"
-export GOARCH = "${HOST_GOARCH}"
-export GOARM = "${HOST_GOARM}"
+export GOHOSTOS_CROSS = "${HOST_GOOS}"
+export GOHOSTARCH_CROSS = "${HOST_GOARCH}"
 export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
-export GOTOOLDIR_BOOTSTRAP = "${GOROOT_BOOTSTRAP}/pkg/tool/${BUILD_GOTUPLE}"
+export GOTOOLDIR_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/${HOST_SYS}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOROOT_FINAL = "${libdir}/go"
 export CGO_ENABLED = "1"
-export CC_FOR_TARGET = "${HOST_CC}"
-export CXX_FOR_TARGET = "${HOST_CXX}"
-CC = "${@d.getVar('BUILD_CC', True).strip()}"
-export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "${TOOLCHAIN_OPTIONS} ${LDFLAGS}"'
+export CC_FOR_TARGET = "${TARGET_PREFIX}gcc"
+export CXX_FOR_TARGET = "${TARGET_PREFIX}g++"
+CC = "${HOST_PREFIX}gcc"
+export CGO_CFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${CFLAGS}"
+export CGO_LDFLAGS = "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"
+export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "--sysroot=${STAGING_DIR_TARGET} ${HOST_CC_ARCH} ${LDFLAGS}"'
 
 do_configure[noexec] = "1"
 
@@ -32,34 +35,27 @@ do_compile() {
 make_wrapper() {
     rm -f ${D}${bindir}/$2
     cat <<END >${D}${bindir}/$2
-#!/bin/bash
+#!/bin/sh
 here=\`dirname \$0\`
 native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
 export GOARCH="${TARGET_GOARCH}"
 export GOOS="${TARGET_GOOS}"
-export GOARM="\${GOARM:-${TARGET_GOARM}}"
+test -n "\$GOARM" || export GOARM="${TARGET_GOARM}"
 export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
-export GOROOT="\${GOROOT:-\$OECORE_TARGET_SYSROOT/${target_libdir}/go}"
+test -n "\$GOROOT" || export GOROOT="\$OECORE_TARGET_SYSROOT/${target_libdir}/go"
 \$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
 END
     chmod +x ${D}${bindir}/$2
 }
 
 do_install() {
-	install -d ${D}${libdir}/go
-	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
-	install -d ${D}${libdir}/go/src
-	(cd ${S}/src; for d in *; do \
-		[ -d $d ] && cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
-	done)
-	rm -rf ${D}${libdir}/go/src/runtime/pprof/testdata
+	install -d ${D}${libdir}/go/pkg/tool
+	cp --preserve=mode,timestamps -R ${B}/pkg/tool/${HOST_GOTUPLE} ${D}${libdir}/go/pkg/tool/
 	install -d ${D}${bindir} ${D}${libdir}/go/bin
-	for f in ${B}/bin/*
+	for f in ${B}/${GO_BUILD_BINDIR}/*
 	do
 		base=`basename $f`
 		install -m755 $f ${D}${libdir}/go/bin
 		make_wrapper $base ${TARGET_PREFIX}$base
 	done
 }
-
-FILES_${PN}-staticdev = "${libdir}/go/pkg"
-- 
2.14.1


