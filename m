Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id A1C2D78431
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:42 +0000 (UTC)
Received: by mail-qk0-f181.google.com with SMTP id o129so24734691qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=LpSfU+PXPO+/zZczuuMbaeJbEjhJQfbqPilCVMq7B6o=;
	b=WbWMuOSp9Iw7fgrKPWMnfpok2fu17Tlu2px7ZViCnMT8mo/R6MMiGdMhTzm+kZ/gTB
	vaCjfS282WTzcGUpX9pFnvN8zPOeRgBtsPbKWOf1f4O0rY86H40/a+F/FB9j8V9XYZqv
	MnC8C23D3hDa9h1amntX/m9jlGJWYaEXu02tnF69KhrvmChhF9vk65NrRzr6eEoJz0Je
	j0D7/4BCHmRExN4764JvtLhKpHD+EDtKvSIktkFeOq1h+0xZ1XrpCpEhhpfyn1C93xH7
	4Fs4XKZ3mHtNHFwnpsiTETJ/m6T2wh3skvZveiAuVS/ZexhhxHEprM2+K9A4Q3kX1IZe
	jpqg==
X-Gm-Message-State: AHPjjUgLYhmnpfd+wyLmN9V+8aK8XEO7BzPc2gSQgTprAJt+/rRQHvMN
	CKalKr3CU2/8A5yo
X-Google-Smtp-Source: AOwi7QAwMFr3VCiqRlkajbIp5Vx2F6VDVxgYRv/vJ9LZaJxXfneQ00w6uAuSKT31mn0cSkdgQQl6vA==
X-Received: by 10.55.104.132 with SMTP id d126mr20068574qkc.142.1505220763298; 
	Tue, 12 Sep 2017 05:52:43 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	p60sm7652309qtd.93.2017.09.12.05.52.38
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:52:35 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:31 -0300
Message-Id: <20170912125031.4009-14-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 13/13] go-cross-canadian: add recipe
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:42 -0000

From: Matt Madison <matt@madison.systems>

Enable cross-canadian builds of the Go toolchain.  This
requires an additional patch to the Go source to allow us
to use the native GOTOOLDIR during the bootstrap phase.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8:
- Fix patch header

Changes in v7:
- Add patch header

Changes in v6:
- new patch

 meta/recipes-devtools/go/go-1.8.inc                |  1 +
 .../go/go-1.8/set-gotooldir-during-bootstrap.patch | 22 ++++++++
 meta/recipes-devtools/go/go-cross-canadian.inc     | 64 ++++++++++++++++++++++
 meta/recipes-devtools/go/go-cross-canadian_1.8.bb  |  2 +
 4 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian.inc
 create mode 100644 meta/recipes-devtools/go/go-cross-canadian_1.8.bb

diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
index 2920d06f60..141c0994c3 100644
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ b/meta/recipes-devtools/go/go-1.8.inc
@@ -15,6 +15,7 @@ SRC_URI += "\
        file://split-host-and-target-build.patch \
        file://gotooldir.patch \
        file://make-goroot-precious.patch \
+       file://set-gotooldir-during-bootstrap.patch \
 "
 SRC_URI[main.md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
 SRC_URI[main.sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch b/meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
new file mode 100644
index 0000000000..4b5e424d96
--- /dev/null
+++ b/meta/recipes-devtools/go/go-1.8/set-gotooldir-during-bootstrap.patch
@@ -0,0 +1,22 @@
+Set GOTOOLDIR during bootstrap 
+
+Signed-off-by: Matt Madison <matt@madison.systems>
+Upstream-Status: Pending
+
+Index: go/src/make.bash
+===================================================================
+--- go.orig/src/make.bash
++++ go/src/make.bash
+@@ -172,10 +172,11 @@ if [ "$do_host_build" = "yes" ]; then
+ 	mv cmd/dist/dist "$GOTOOLDIR"/dist
+ 	echo
+ 
++	GOTOOLDIR_BOOTSTRAP="${GOTOOLDIR_BOOTSTRAP:-$GOTOOLDIR}"
+ 	echo "##### Building packages and commands for host, $GOHOSTOS/$GOHOSTARCH."
+ 	# CC_FOR_TARGET is recorded as the default compiler for the go tool. When building for the host, however,
+ 	# use the host compiler, CC, from `cmd/dist/dist env` instead.
+-	CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH \
++	CC=$CC GOOS=$GOHOSTOS GOARCH=$GOHOSTARCH GOTOOLDIR="$GOTOOLDIR_BOOTSTRAP" \
+ 		"$GOTOOLDIR"/go_bootstrap install -gcflags "$GO_GCFLAGS" -ldflags "$GO_LDFLAGS" -v std cmd
+ 	echo
+ fi
diff --git a/meta/recipes-devtools/go/go-cross-canadian.inc b/meta/recipes-devtools/go/go-cross-canadian.inc
new file mode 100644
index 0000000000..f0315d558a
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross-canadian.inc
@@ -0,0 +1,64 @@
+inherit cross-canadian
+
+DEPENDS = "go-native virtual/${HOST_PREFIX}gcc-crosssdk virtual/nativesdk-${HOST_PREFIX}libc-for-gcc virtual/nativesdk-${HOST_PREFIX}compilerlibs"
+PN = "go-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+
+export GOHOSTOS = "${BUILD_GOOS}"
+export GOHOSTARCH = "${BUILD_GOARCH}"
+export GOOS = "${HOST_GOOS}"
+export GOARCH = "${HOST_GOARCH}"
+export GOARM = "${HOST_GOARM}"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
+export GOTOOLDIR_BOOTSTRAP = "${GOROOT_BOOTSTRAP}/pkg/tool/${BUILD_GOTUPLE}"
+export GOROOT_FINAL = "${libdir}/go"
+export CGO_ENABLED = "1"
+export CC_FOR_TARGET = "${HOST_CC}"
+export CXX_FOR_TARGET = "${HOST_CXX}"
+CC = "${@d.getVar('BUILD_CC', True).strip()}"
+export GO_LDFLAGS = '-linkmode external -extld ${HOST_PREFIX}gcc -extldflags "${TOOLCHAIN_OPTIONS} ${LDFLAGS}"'
+
+do_configure[noexec] = "1"
+
+do_compile() {
+	export GOBIN="${B}/bin"
+	rm -rf ${GOBIN} ${B}/pkg
+	mkdir ${GOBIN}
+	cd src
+	./make.bash --host-only --no-banner
+	cd ${B}
+}
+
+
+make_wrapper() {
+    rm -f ${D}${bindir}/$2
+    cat <<END >${D}${bindir}/$2
+#!/bin/bash
+here=\`dirname \$0\`
+native_goroot=\`readlink -f \$here/../../lib/${TARGET_SYS}/go\`
+export GOARCH="${TARGET_GOARCH}"
+export GOOS="${TARGET_GOOS}"
+export GOARM="\${GOARM:-${TARGET_GOARM}}"
+export GOTOOLDIR="\$native_goroot/pkg/tool/${HOST_GOTUPLE}"
+export GOROOT="\${GOROOT:-\$OECORE_TARGET_SYSROOT/${target_libdir}/go}"
+\$here/../../lib/${TARGET_SYS}/go/bin/$1 "\$@"
+END
+    chmod +x ${D}${bindir}/$2
+}
+
+do_install() {
+	install -d ${D}${libdir}/go
+	cp --preserve=mode,timestamps -R ${B}/pkg ${D}${libdir}/go/
+	install -d ${D}${libdir}/go/src
+	(cd ${S}/src; for d in *; do \
+		[ -d $d ] && cp --preserve=mode,timestamps -R ${S}/src/$d ${D}${libdir}/go/src/; \
+	done)
+	install -d ${D}${bindir} ${D}${libdir}/go/bin
+	for f in ${B}/bin/*
+	do
+		base=`basename $f`
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base ${TARGET_PREFIX}$base
+	done
+}
+
+FILES_${PN}-staticdev = "${libdir}/go/pkg"
diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.8.bb b/meta/recipes-devtools/go/go-cross-canadian_1.8.bb
new file mode 100644
index 0000000000..7ac9449e47
--- /dev/null
+++ b/meta/recipes-devtools/go/go-cross-canadian_1.8.bb
@@ -0,0 +1,2 @@
+require go-cross-canadian.inc
+require go-${PV}.inc
-- 
2.14.1


