Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 676E778449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:26 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id i50so25315467qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=0z+MgZDbp22YUyutAKiNHYt/TOHbK/mAjdTR7sIY+Kg=;
	b=ktY+Ab9BXQjkGO24+FQUaZlwDe4+S2t4dMLlDktXCYMpf3LntSK8moRgVSLH4nncnb
	7sVnv3DLLYbkb+9o04p7u98jG2bRqCSAXNV/syVcHlhJoKgDTZyIDnj0IPcdT5JwECJQ
	FqctEz63Rba4JeDCx5Hjx71J34oKo8ttqbyo6HudZVaS1pdHbtMKBJbq2w+TIss6TdV7
	X14xmea/gMzpGNF5BkI2nwy88PtHDSRTDUkds05Ma/UI6+uBfnWwW4VYpg0TVO2GHBp1
	3MRtAkoPS26VguyDSS19EkoeWw8rT6hAJYSZij+x041a9iOO4lilWsO0PPJik6nZ2aEn
	49pQ==
X-Gm-Message-State: AHPjjUhjWBQptJG21+rSm68vpcz7znLESEyZSphqMkIP6DTt5yugg8jU
	ZwhG9zrPl7l8xVah
X-Google-Smtp-Source: AOwi7QBqR/PJvhJ2gS9p3waMEVc8FaAbWAkRJ5BVHRf81Y96uNvHLuD3xBcQYIV9e0Lv8X/AK0Rg1g==
X-Received: by 10.200.54.240 with SMTP id b45mr20597682qtc.264.1505220747269; 
	Tue, 12 Sep 2017 05:52:27 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c11sm7463025qth.13.2017.09.12.05.52.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:26 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:52:20 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:29 -0300
Message-Id: <20170912125031.4009-12-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 11/13] go-crosssdk: add recipe
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:26 -0000

From: Matt Madison <matt@madison.systems>

Enable crosssdk builds for the Go toolchain.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/go-crosssdk.inc    | 55 +++++++++++++++++++++++++++++
 meta/recipes-devtools/go/go-crosssdk_1.8.bb |  2 ++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-devtools/go/go-crosssdk.inc
 create mode 100644 meta/recipes-devtools/go/go-crosssdk_1.8.bb

diff --git a/meta/recipes-devtools/go/go-crosssdk.inc b/meta/recipes-devtools/go/go-crosssdk.inc
new file mode 100644
index 0000000000..e9bc677131
--- /dev/null
+++ b/meta/recipes-devtools/go/go-crosssdk.inc
@@ -0,0 +1,55 @@
+inherit crosssdk
+
+DEPENDS = "go-native virtual/${TARGET_PREFIX}gcc-crosssdk virtual/nativesdk-${TARGET_PREFIX}compilerlibs virtual/${TARGET_PREFIX}binutils-crosssdk"
+PN = "go-crosssdk-${TARGET_ARCH}"
+PROVIDES = "virtual/${TARGET_PREFIX}go-crosssdk"
+
+export GOHOSTOS = "${BUILD_GOOS}"
+export GOHOSTARCH = "${BUILD_GOARCH}"
+export GOOS = "${TARGET_GOOS}"
+export GOARCH = "${TARGET_GOARCH}"
+export GOROOT_BOOTSTRAP = "${STAGING_LIBDIR_NATIVE}/go"
+export GOROOT_FINAL = "${libdir}/go"
+export CGO_ENABLED = "1"
+export CC_FOR_TARGET="${TARGET_PREFIX}gcc ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+export CXX_FOR_TARGET="${TARGET_PREFIX}g++ ${TARGET_CC_ARCH} --sysroot=${STAGING_DIR_TARGET}"
+CC = "${@d.getVar('BUILD_CC', True).strip()}"
+
+do_configure[noexec] = "1"
+
+do_compile() {
+	export GOBIN="${B}/bin"
+	rm -rf ${GOBIN} ${B}/pkg
+	mkdir ${GOBIN}
+	cd src
+	./make.bash --host-only
+	cd ${B}
+}
+
+make_wrapper() {
+    rm -f ${D}${bindir}/$2
+    cat <<END >${D}${bindir}/$2
+#!/bin/bash
+here=\`dirname \$0\`
+export GOARCH="${TARGET_GOARCH}"
+export GOOS="${TARGET_GOOS}"
+\$here/../../lib/${CROSS_TARGET_SYS_DIR}/go/bin/$1 "\$@"
+END
+    chmod +x ${D}${bindir}/$2
+}
+
+do_install() {
+	install -d ${D}${libdir}/go
+	install -d ${D}${libdir}/go/bin
+	install -d ${D}${libdir}/go/pkg/tool
+	install -d ${D}${bindir}
+	cp --preserve=mode,timestamps -R ${S}/pkg/tool/${TARGET_GOTUPLE} ${D}${libdir}/go/pkg/tool/
+	for f in ${B}/${GO_BUILD_BINDIR}/*
+	do
+		base=`basename $f`
+		install -m755 $f ${D}${libdir}/go/bin
+		make_wrapper $base ${TARGET_PREFIX}$base
+	done
+}
+
+FILES_${PN}-staticdev = "${libdir}/go/pkg"
diff --git a/meta/recipes-devtools/go/go-crosssdk_1.8.bb b/meta/recipes-devtools/go/go-crosssdk_1.8.bb
new file mode 100644
index 0000000000..1857c8a577
--- /dev/null
+++ b/meta/recipes-devtools/go/go-crosssdk_1.8.bb
@@ -0,0 +1,2 @@
+require go-crosssdk.inc
+require go-${PV}.inc
-- 
2.14.1


