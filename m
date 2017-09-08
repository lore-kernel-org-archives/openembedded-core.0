Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 9415878190
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:49:08 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id g128so1562409qke.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:49:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=sbkCuSHgpkjCV6ZyUdtbHgJPCgY7lKEVnQmNm4+5+BI=;
	b=Se8lVJRuDLKbG5zVbRbfa1QXPQh/lc57PRsJkkwES1l/BwGxF0ihzK4a7yAtk27SmM
	Lb45ihTHTqLlykH3f12IeQqizgZSiun4gA5szYatfFVKIxzLsLe7bMr/1MaOU8IoG0XC
	Lh1MR36hjtWfxS1+isZ8XzoIjneD2sx4XmUasmBuRvs4dTtlJl8EdGacr5JGmmGAGHiX
	pm+v+dm5ntsbnuZOpmuYA0+BWJgNy8zp1PmKMJG9cGlZGHjQX/PPnyrLDpvqJz/J5CpE
	Lo/Pf6AZiuhJ37nXpypnFvE0ZLKJ9zhARjpFMbx8cLKoPh6KEDhcKP2m0MDzVTT6ct7S
	VvdQ==
X-Gm-Message-State: AHPjjUh/BoW6J41zUVF3zlm8aHiNKPm6eVsebEEuhKVRzrQhiN1E2CJl
	MOSNlBhUAxdM7tv/
X-Google-Smtp-Source: AOwi7QBOxxo7Qs6Cv9pTsMp59WliNGXt36K0R/8ZiMQLvNIdz5/EZ3ET1pGNUsIEs/Ju3ZnZL+siSA==
X-Received: by 10.55.77.72 with SMTP id a69mr3762883qkb.196.1504878549695;
	Fri, 08 Sep 2017 06:49:09 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 20sm1294199qtu.77.2017.09.08.06.49.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:49:09 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:49:02 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:55 -0300
Message-Id: <20170908134758.7570-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 08/11] go.bbclass: exported function cleanup
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
X-List-Received-Date: Fri, 08 Sep 2017 13:49:09 -0000

From: Matt Madison <matt@madison.systems>

Since this is a class, it should follow the
class function export mechanism for its task
functions, and should set directory-related
flags for directories they need.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3:
- new patch

Changes in v2: None

 meta/classes/go.bbclass | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f64b07fd82..6df73bf377 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -51,14 +51,14 @@ FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
 
-do_go_compile() {
+go_do_compile() {
 	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
 		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
 	fi
 }
 
-do_go_install() {
+go_do_install() {
 	rm -rf ${WORKDIR}/staging
 	install -d ${WORKDIR}/staging${GOROOT_FINAL} ${D}${GOROOT_FINAL}
 	tar -C ${S} -cf - . | tar -C ${WORKDIR}/staging${GOROOT_FINAL} -xpvf -
@@ -84,11 +84,7 @@ do_go_install() {
 		rmdir -p "${D}${GOBIN_FINAL}" || true
 	fi
 }
+do_install[dirs] =+ "${WORKDIR}/staging"
+do_install[cleandirs] += "${WORKDIR}/staging"
 
-do_compile() {
-	do_go_compile
-}
-
-do_install() {
-	do_go_install
-}
+EXPORT_FUNCTIONS do_compile do_install
-- 
2.14.1


