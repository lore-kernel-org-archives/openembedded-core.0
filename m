Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 9FD56781E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:49:24 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id p55so1583885qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:49:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=b6x7CcZFLRhMQffk6fLjdhjD4RhbLfYo4crxASlHHxM=;
	b=irtjTAHI0CaYF+SaDy/7dFfPYVEnluO+PeoLuu0rUJzbV1O9v5AdyUkdDyOIlK/MOW
	b7YOW8/UiRNjAbnhCOYddCwK8r44hiDB7oiLv/Qx1PzIkjor7x8h9hUEktWfYkES8LjW
	yFV3FO7VV6bSBs/zp8D0jQqNn7f87t1O5iPw4oZnqO8mWigBbu/t8HHjaxcoFEOKCOZh
	0PkqdizxvD1krx7lX5T8xDx14xdbXQnuTT8aXIcWT129UQgf9Xtd4FLlFKxN1RKhIaGo
	AX291gBSfV7ARddhT0xhdrbFGp3t4PYVp3dmdgn+0opti9kNsUrHMCrMyVgHF2Xo/782
	nVFQ==
X-Gm-Message-State: AHPjjUjh4t0lVcPVzBs3NHTAPMCQVSqjTDoS4K7I/CjxeoMkkVL4Mij1
	Acq3fwiKGsaeY755
X-Google-Smtp-Source: AOwi7QCHEhZF+/RPDZWF39WIFF+DyjspK6X0l+v3u4z+WPeItABrV3wfjnIo0tQcL/fOS3aIZaH+Ug==
X-Received: by 10.200.39.24 with SMTP id g24mr4035865qtg.230.1504878565349;
	Fri, 08 Sep 2017 06:49:25 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id y23sm638834qtj.32.2017.09.08.06.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:49:24 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:49:18 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:57 -0300
Message-Id: <20170908134758.7570-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 10/11] go.bbclass: separate ${S} and ${B}
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
X-List-Received-Date: Fri, 08 Sep 2017 13:49:24 -0000

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


