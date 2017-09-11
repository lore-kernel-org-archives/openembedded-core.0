Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id E5E1C78442
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:30:24 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id o129so20454631qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:30:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=jone6syvR2c72cRGHO63hYirkHdLAl/M4fp6mg50FpA=;
	b=asVCdDVwuhZTRD1ViSq9F55OnW0Yx2tjj/Y47QZtwX9qHbNv6VPYrwlhPWTBNVVVU8
	6FSBX51+D2en3uJ1r63qKuwN6HjX786DYKAyhEAMRuZPlMB9X6Rg5n302byukYz9Za/X
	Egv7fFIOFuryV4sxnvvaVmxaDYf1jXDf8BVOpfi2UhIDUFIIYONZwYL/z4WU9qjkjdfu
	/FvQytjNaPRQJ7soX62xKVPibfcfZ5nCM7GggMxfEyGZ98FlyjzdWYx8aIux7hmeuqDi
	wcG4wsSjxR+LxhnviQKphReC/f0Yw8EDNS4DIB6iunReKag47DSF8QGeObzbJ4SlDLQL
	nACg==
X-Gm-Message-State: AHPjjUjErvWNArhPPKcMQBt3zIlfg+fRw7dhgVb5ALwsD8s7zsNz9WeU
	XjVrVyy6dTywkjSv
X-Google-Smtp-Source: AOwi7QDloQ9YWiViqECpv6iGp3/b0lSU6BpWoodWNtH8TuRZSQVv5WjdM5JWK1wwYUxqImiWTso3+A==
X-Received: by 10.55.97.68 with SMTP id v65mr17066381qkb.124.1505154625324;
	Mon, 11 Sep 2017 11:30:25 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	d186sm6308899qkg.46.2017.09.11.11.30.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:30:24 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:30:18 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:51 -0300
Message-Id: <20170911182853.11076-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 10/12] go-crosssdk: add recipe
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
X-List-Received-Date: Mon, 11 Sep 2017 18:30:25 -0000

From: Matt Madison <matt@madison.systems>

Enable crosssdk builds for the Go toolchain.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


