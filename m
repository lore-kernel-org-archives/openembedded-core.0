Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 83A04781F7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:46:17 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id q8so1680102qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:46:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=PfyYqAcqJjn3UC5D64rCaxjpYDzFt0FHBX0SxLg0OEI=;
	b=fcipRzfjqT20oauBzJaJFgy3V+0G62t8ZaLk1tUir6Nruio11zUqi3yYj9UhOguecq
	ZElLScrpqX+oQls1mKv3s+Q97Kt7EqSkiHfMY2RCN1m4MmGM15l91fknHRCbfnVxrZcJ
	Hi4BEvCJVinraR1pg5PxglLbSc9ttAFhVecNu8rdmupo1DSNP/bCtxBu0VsmvEqAHeCP
	G0xAZ13HlVZaXWJXnZ9BeJrHVIFLhuE+pXwKBpU8CLC3di3ilppctiWkjv5AZX5qoShr
	TatVyv8On8PNLwRCTFvVmk5vpATBf2hIKUEWo0PBjlpiydpo6eVPne/kW0covJ5S2Wmb
	bjDw==
X-Gm-Message-State: AHPjjUghojNtmfSHJHXHD8am30vNGi+bunb2ztd+dkbJOnP6KRHP4mM0
	AueFbOODKRu7iaxt
X-Google-Smtp-Source: AOwi7QBP3IUGVhMtcjQw7QYdKCoqgqdm/QrdA5woAos/xztI/aYjaFhwcuZE/xnOvC9VBWK5TCPuXA==
X-Received: by 10.200.54.3 with SMTP id m3mr4637176qtb.197.1504881978403;
	Fri, 08 Sep 2017 07:46:18 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	n12sm1326917qkn.83.2017.09.08.07.46.14
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:46:17 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:46:11 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:51 -0300
Message-Id: <20170908144454.14308-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 09/12] go.bbclass: exported function cleanup
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
X-List-Received-Date: Fri, 08 Sep 2017 14:46:17 -0000

From: Matt Madison <matt@madison.systems>

Since this is a class, it should follow the
class function export mechanism for its task
functions, and should set directory-related
flags for directories they need.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v4: None
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


