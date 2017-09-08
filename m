Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id F376578232
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:06 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id k2so2234901qte.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=pgAkXnG21CVaVSOBhQ8gz66JOYtSwS/SDL7//oBfU5I=;
	b=Ms+XoQijlBtwW0YgthvgIJgH6/BXTlBXE0p9TpswdQwzswG8zspicmuhKTl1pG03WF
	dqVQwHGDil53ST4yU25x4KRJL/S9KcUIW5HRiT3wxaOE4fQ3xTrC4crD9uOuE8M6mATw
	5E5zb6jV/7oUW9tPPmXeorklMOo2zJTvcIrJFsh+QJKu1hD5DjSI5GZ3cw0nN6VXwxw7
	6UC9KLjlxWkJc5yc7bkytRg+ig5QYJECD2M/9Ai6Ysn4JVZnmeaZ5+PzDpZCDpFHAJo+
	Fk6csJ22tLWTrZz9+Q+dfjnTMj2pS8yhAfhEA/HPythmx0pYQLI41GA9MkeKIUJNsOlv
	3zEQ==
X-Gm-Message-State: AHPjjUg9E0YTRQZUScKJWYjSouQ0MQt84LgWKlGaMHKX7QAVEQwlqebf
	1EowJYYMewSNR/3K
X-Google-Smtp-Source: AOwi7QAG3egj2sCF2xvQ0zY4ShRRcNbcv7ObhhZUUba5EAJlSlGKnmlEEqWowozqAi4zCaNMe1cn0w==
X-Received: by 10.237.35.203 with SMTP id k11mr6293871qtc.332.1504904767626;
	Fri, 08 Sep 2017 14:06:07 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	a91sm2074450qka.90.2017.09.08.14.06.03
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:06 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:00 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:38 -0300
Message-Id: <20170908210444.25763-9-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 08/14] go.bbclass: exported function cleanup
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:07 -0000

From: Matt Madison <matt@madison.systems>

Since this is a class, it should follow the
class function export mechanism for its task
functions, and should set directory-related
flags for directories they need.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
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


