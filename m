Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id A107B7822D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:19 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id g128so5350044qke.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=onpX8H/6c/ldAUljPUuBEQ1UEPIC5Eiap4E1LfNc8Ho=;
	b=nqTSdFiPekiLfpJsxJTsTfOiTAnxO5ARzHei1zPzClo8Iz6xERljOANvwLgZ4iZpWN
	49gvHHSS4ti6uDzuitZpcmZKu/8MNtDJoNUrIyfpVAHZ4vlGGFczf/292lICvSL3Ajzh
	5ScjxnvgLB3WGyq3TB785EcjMrcFm/kySPCmAZJZYc6tmsJo66VvYVMXyv/dIRQpes6H
	AxOSB+GBTHor9eXJydt2sDophnyfW0BQlylEy/saQ/GBg51aJ3jyvIU5Zzm4Dd8dPX7Q
	iP3M6a9men8DmrCDSz0yDnCUWlOUp2+V9uElxZZc2/X/t6rf43q8dBOkvRnIu+3Jf4O1
	wUXg==
X-Gm-Message-State: AHPjjUhvcUS9/ELtpLcYg9jxRwu/LvVFmYCJNaIvxjZBK+dgU8OHY3XH
	LB5k0oQ0lApWHpz8
X-Google-Smtp-Source: AOwi7QDQ2uqIkqfiUlyXHFIS5hbqqyj+UAB6Mm1Y4VBVqudAqhxAef+HYNUpOhISATK3+cKJmZ6pDg==
X-Received: by 10.55.1.202 with SMTP id u71mr14567653qkg.80.1505134040660;
	Mon, 11 Sep 2017 05:47:20 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	a125sm5987735qkg.13.2017.09.11.05.47.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:19 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:47:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:44 -0300
Message-Id: <20170911124558.2863-13-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 12/26] go.bbclass: add GO_INSTALL_FILTEROUT variable
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:19 -0000

From: Matt Madison <matt@madison.systems>

When using the Go 'vendor' mechanism to bring in
dependencies for a Go package, the default GO_INSTALL
setting, which uses the '...' wildcard, will include
the vendored packages in the build, which produces
incorrect results.

There are also some Go packages that are structured
poorly, so that the '...' wildcard results in building
example or test code that should not be included in
the build, or fail to build.

This patch adds a mechanism for filtering out a
subset of the sources.  It defaults to filtering
out everything under the 'vendor' subdirectory
under package's main directory, which is the
normal location for vendored packages, but can
be overridden by a recipe to filter out other
subdirectories, if needed.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5:
- new patch

Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index c1ef01fafe..cb1e96d88b 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -52,6 +52,7 @@ FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
 FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
 GO_INSTALL ?= "${GO_IMPORT}/..."
+GO_INSTALL_FILTEROUT ?= "${GO_IMPORT}/vendor/"
 
 B = "${WORKDIR}/build"
 
@@ -73,6 +74,11 @@ python go_do_unpack() {
         raise bb.build.FuncFailed(e)
 }
 
+go_list_packages() {
+	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go list -f '{{.ImportPath}}' ${GOBUILDFLAGS} ${GO_INSTALL} | \
+		egrep -v '${GO_INSTALL_FILTEROUT}'
+}
+
 go_do_configure() {
 	ln -snf ${S}/src ${B}/
 }
@@ -80,7 +86,7 @@ go_do_configure() {
 go_do_compile() {
 	GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
+		GOPATH=${B}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} `go_list_packages`
 	fi
 }
 do_compile[cleandirs] = "${B}/bin ${B}/pkg"
-- 
2.14.1


