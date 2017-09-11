Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f172.google.com (mail-qk0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 83F7878227
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:28 +0000 (UTC)
Received: by mail-qk0-f172.google.com with SMTP id b23so18208259qkg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=aEODjGiweHVL2NfDbxTFxU2m7eqT19aiYNs85paOfpE=;
	b=n+J9TL+Cd2VKV8I6JYENwrds6gw2twehcIvKlvQWs6TKaOSHCNKtm5jGhf61wGq7GV
	v7b34gvhydjiXmpFuLnDNXyvk/TdybG1v6OXSsO0iwujadgfw43bztu+dHatCXGOCb2a
	WLQ02iAN/Fe3vyjMtPK7/JHcgVBgV+AQCFr5MZBVWlIVrxvpy1PpMH/KVszhNtQ8e8nD
	fTDzcot4HQotlb8VR9uGd0AaG+HFN2Vk3Giy94+FUpjqHANcjfuwbbYuzA5TACLoNNbv
	yUTBBXLxnaCCrUQj7HSk6VR5wWjjh5lWPuXE9JHbpj0dJT03CiRUkpgToNg/fP0FRN0B
	fjCQ==
X-Gm-Message-State: AHPjjUiRc+R8EykXatmsvIJooPmnrOOs674PldtZu2Qa/Ik9rKa+Ls+Y
	Ay5X2P6xgzmZLQr/
X-Google-Smtp-Source: AOwi7QBgPYnZUYbul7c5Ft2q4ubYEstpyAd7hVnMiGEzCM8ianxxY8Qb/08ktsQsBww0Kasc0zUJZQ==
X-Received: by 10.55.146.195 with SMTP id u186mr14239184qkd.14.1505134109381; 
	Mon, 11 Sep 2017 05:48:29 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	y11sm5909979qkb.20.2017.09.11.05.48.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:28 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:24 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:56 -0300
Message-Id: <20170911124558.2863-25-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 24/26] go-crosssdk: add recipe
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:28 -0000

From: Matt Madison <matt@madison.systems>

Enable crosssdk builds for the Go toolchain.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

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


