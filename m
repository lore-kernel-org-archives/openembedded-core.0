Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DF6B37823B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:22 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so2199151qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=oozhfkvLTc1pVoKlSsOMrJaIDeoEd5Gxh/YaC68Hjj0=;
	b=eCnxuu9NVU+ddTK1hDR4ZmpISZL56CpTu3mWlxNG7Dai73XPSp6cMTAPiyuzkrzd0M
	vci4bta64mKeef7qF3VM4WszknSOXol31l8LtD5x5mlv136E07owasWPG70k5/C9um8y
	HK82ECrFeS7BuxAp6MeTqpcMQhUARO+ox8RaG5b0UTFeM+jc7HEb4avtrwKcc9TGmsY2
	AZzbyPcZwJtqjRluEnXlgY2VCA4rZA8zse1CIaBGT199ERQyd/RUNiekdp1JjWNsPAz+
	IchBp65ySFmFTU4CZ6AaFgyjm0XZRznlNwo3mm1wFuuDhefqDo6K/Lpf/7SKDqL46Ya6
	uYaw==
X-Gm-Message-State: AHPjjUi1Pgq8tm9I56/VgQZC7snxNzbsRE0BYrSOD+i7Di8HtvZvDBiJ
	bG2rL4noPE6TBTRF
X-Google-Smtp-Source: AOwi7QDLN+fuiCjzRtANJ32hdGAY4jSrqHLg0+3DkjoDky+4bt6pPphqCv9JvhR7ItPjUk0bYQUDYg==
X-Received: by 10.233.220.199 with SMTP id q190mr5410576qkf.222.1504904783668; 
	Fri, 08 Sep 2017 14:06:23 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j61sm1753926qte.84.2017.09.08.14.06.19
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:16 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:40 -0300
Message-Id: <20170908210444.25763-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 10/14] go.bbclass: separate ${S} and ${B}
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:23 -0000

From: Matt Madison <matt@madison.systems>

Add a do_configure task to populate ${B} by symlinking
in the src subdirectory under ${S}, which lets us point
GOPATH at ${B}.  This lets us take advantage of the
automatic directory creation and cleaning for do_configure.

This necessitates a change to do_install to split the
installation of the sources and built artifacts.  Taking
advantage of some additional tar options, we can eliminate
the extra staging area and extra recursive chown command.
So overall efficiency should be improved.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3:
- new patch

Changes in v2: None

 meta/classes/go.bbclass | 46 ++++++++++++++++++----------------------------
 1 file changed, 18 insertions(+), 28 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 82b5f83aa0..cfe773e13d 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -53,40 +53,30 @@ FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
 
+B = "${WORKDIR}/build"
+
+go_do_configure() {
+	ln -snf ${S}/src ${B}/
+}
+
 go_do_compile() {
-	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
+	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
+		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
 	fi
 }
+do_compile[cleandirs] = "${B}/bin ${B}/pkg"
 
 go_do_install() {
-	rm -rf ${WORKDIR}/staging
-	install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINAL}
-	tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL} -xpvf -
-
-	find ${WORKDIR}/staging${GOROOT_FINAL} \( \
-		-name \*.indirectionsymlink -o \
-		-name .git\* -o                \
-		-name .hg -o                   \
-		-name .svn -o                  \
-		-name .pc\* -o                 \
-		-name patches\*                \
-		\) -print0 | \
-	xargs -r0 rm -rf
-
-	tar -C ${WORKDIR}/staging${GOROOT_FINAL} -cf - . | \
-	tar -C ${D}${GOROOT_FINAL} -xpvf -
-
-	chown -R root:root "${D}${GOROOT_FINAL}"
-
-	if [ -e "${D}${GOBIN_FINAL}" ]; then
-		install -d -m 0755 "${D}${bindir}"
-		find "${D}${GOBIN_FINAL}" ! -type d -print0 | xargs -r0 mv --target-directory="${D}${bindir}"
-		rmdir -p "${D}${GOBIN_FINAL}" || true
+	install -d ${D}${GOROOT_FINAL}/src/${GO_IMPORT}
+	tar -C ${S}/src/${GO_IMPORT} -cf - --exclude-vcs . | \
+		tar -C ${D}${GOROOT_FINAL}/src/${GO_IMPORT} --no-same-owner -xf -
+	tar -C ${B} -cf - pkg | tar -C ${D}${GOROOT_FINAL} --no-same-owner -xf -
+
+	if [ -n "`ls ${B}/${GO_BUILD_BINDIR}/`" ]; then
+		install -d ${D}${bindir}
+		install -m 0755 ${B}/${GO_BUILD_BINDIR}/* ${D}${bindir}/
 	fi
 }
-do_install[dirs] =+ "${WORKDIR}/staging"
-do_install[cleandirs] += "${WORKDIR}/staging"
 
-EXPORT_FUNCTIONS do_compile do_install
+EXPORT_FUNCTIONS do_configure do_compile do_install
-- 
2.14.1


