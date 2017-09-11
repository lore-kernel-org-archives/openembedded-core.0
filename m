Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 721CC719AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:29:44 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id r141so20428993qke.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=tSFDm9rWhZUzEpAFxjDSCCo1bFpD/RdSwQ2H9gwgi+o=;
	b=B8kqLUB4jHoX13B4dBysDYRuA9Ry3gOnSeQN8EsLF44D9GqrClmJrAPfnX7i6A9wn2
	d+0hgifE6BcuKm8YOea7Sf56ckjGgfRRgr/U19izB0bFjvyalVHVe3eop40VZCUYxE1F
	6aiA3Xtqbu0hc+W+J+qa4lSY3hJyXLD31IChHzJ9UqQZlrevIy07A9g/D2Q9fC1p3DlX
	l+etGMd5iq4J7UK85zJ3eoVj329JrXPKnhV9eRjKOEck66tmMgopgp2m40sGRdLA5eaf
	jhBHUsZRF13mUGejucBa8mBBtCNeB55xfUae8/g/AL1Nfa6tp5w5brCNEkN7IMsQPWMI
	iitA==
X-Gm-Message-State: AHPjjUgE9R+oHF0lD298GsJvPQ4zdLSsLwn24cPhDmybhL3XX9bPJWf0
	i7xDG1Z7DfQlXH/u
X-Google-Smtp-Source: AOwi7QCenrBJQFG6uFRgyj6AQnYwTgKNtSoYTpeOH8iwTtM3wOQmDECkhU9f06VSlJYLE45jIv3KnA==
X-Received: by 10.55.108.193 with SMTP id h184mr17201998qkc.48.1505154586030; 
	Mon, 11 Sep 2017 11:29:46 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	b26sm5999514qkj.64.2017.09.11.11.29.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:29:45 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:29:38 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:46 -0300
Message-Id: <20170911182853.11076-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 05/12] go.bbclass: remove some xxx_FINAL variables
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
X-List-Received-Date: Mon, 11 Sep 2017 18:29:45 -0000

From: Matt Madison <matt@madison.systems>

GOROOT_FINAL is used by the Go linker for rewriting
source paths when the build GOROOT is not the same
as the runtime GOROOT, but the other _FINAL variables
aren't really needed.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v7: None
Changes in v6:
- new patch

 meta/classes/go.bbclass | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 0ff82ca2bb..c0b117d155 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -21,8 +21,7 @@ GO_PARALLEL_BUILD ?= "${@get_go_parallel_make(d)}"
 
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR}/go"
-GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
-GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
+export GOROOT_FINAL = "${libdir}/go"
 
 DEPENDS_GOLANG_class-target = "virtual/${TARGET_PREFIX}go virtual/${TARGET_PREFIX}go-runtime"
 DEPENDS_GOLANG_class-native = "go-native"
@@ -38,18 +37,11 @@ GOTOOLDIR_class-native = "${STAGING_LIBDIR_NATIVE}/go/pkg/tool/${BUILD_GOTUPLE}"
 export GOTOOLDIR
 export CGO_ENABLED = "1"
 export GOROOT
-export GOROOT_FINAL = "${libdir}/go"
-export GOBIN_FINAL
-export GOPKG_FINAL = "${GOROOT_FINAL}/pkg/${TARGET_GOTUPLE}"
-export GOSRC_FINAL = "${GOROOT_FINAL}/src"
 export CGO_CFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CFLAGS}"
 export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
-FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
-
 GO_INSTALL ?= "${GO_IMPORT}/..."
 GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
@@ -92,10 +84,10 @@ go_do_compile() {
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
 go_do_install() {
-	install -d ${D}${GOROOT_FINAL}/src/${GO_IMPORT}
+	install -d ${D}${libdir}/go/src/${GO_IMPORT}
 	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs . | \
-		tar -C ${D}${GOROOT_FINAL}/src/${GO_IMPORT} --no-same-owner -xf -
-	tar -C ${B} -cf - pkg | tar -C ${D}${GOROOT_FINAL} --no-same-owner -xf -
+		tar -C ${D}${libdir}/go/src/${GO_IMPORT} --no-same-owner -xf -
+	tar -C ${B} -cf - pkg | tar -C ${D}${libdir}/go --no-same-owner -xf -
 
 	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
 		install -d ${D}${bindir}
@@ -104,3 +96,6 @@ go_do_install() {
 }
 
 EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
+
+FILES_${PN}-dev = "${libdir}/go/src"
+FILES_${PN}-staticdev = "${libdir}/go/pkg"
-- 
2.14.1


