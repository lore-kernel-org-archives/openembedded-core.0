Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 77C9277EE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:08 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i14so5332017qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=3oYBvSeC1/j1tNPYzScrSfqiN03pyER9sOMJTpO2Q64=;
	b=ukL/njygMuu9TE+TMOKiPn6D7z/c5kDAs2A5sl2NrNnrnPpBkTgsOWYLT+nBn7QC62
	qvEVJ2dO87pIW4L7NvYOiWgFSzWQIU60UoglaRh0izQRbV2dHIUH1ZsWu2KhrtivO3TG
	qHlsdHB2WF3m2vZFtbQ4Og5AEv7OvwNZRGWb2V5xe6sbUgC3Qjj6srI0Va/wTuQEPbOc
	x9mFAWZcjcyGbZfIz0BkmxCn8XOeHFOncbNfY/ZOLQPNLieTt/83SRYxOAbJpMxAolZ9
	8dRvF6Vdn8yAZnk8BdoAmTRqjz40stsTnHvA7lBpAaWI+Qe9dA1qoIz524JMLIYFvegW
	8A2Q==
X-Gm-Message-State: AHPjjUgyOQysPbX+LEsrfmqqHGrU/7VMnx3+aQWY93nEEU9NFSO+s1YV
	IGK9bM3RYhuD2n2b
X-Google-Smtp-Source: AOwi7QARNIbFhEefD9hQmxNQddYBNC7Y3y5cxNKIfRuZJsrcicVsk8IYoga5bDr3eQS+hPrjYshxqg==
X-Received: by 10.55.82.197 with SMTP id g188mr10580838qkb.240.1505134029114; 
	Mon, 11 Sep 2017 05:47:09 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id h67sm5864209qkf.6.2017.09.11.05.47.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:08 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:03 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:42 -0300
Message-Id: <20170911124558.2863-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 10/26] go.bbclass: separate ${S} and ${B}
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:08 -0000

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

Changes in v6: None
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


