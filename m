Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C6D4178044
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:56:34 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h21so2330235qth.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=+Vb9v6UOZSlIZ+lw/2oSnU3sn4RGA5piaa+5mgykjDY=;
	b=foLC07Qs9Ns5zGKRiSr/H2ZfC6lkTqm9umgudqnjWCMF9ZKk4xZ+2dypYgXOnuk8qj
	oM+3aa8dDr8RbGcSjsgO1/yM/K9TWKRR8D++pexyPYZqTsfnLTjonyRVao/9pcvchKj9
	KpoPKLY1rudf+qye0qL2l00ExMjU7esEt/Scdyx0bPDyJPk+KoufHbvnS9UwIaUFkZAS
	e8PrjyTZzRaUhX51NqrijbkYveZI0sJl2EoBGTDVG7KotM3dhablkqjQcyAMvs1tN2c2
	eJADlw2HhnaocEKAbtvS/447EXU+5MsXsmxOsx0Jh3pkY4NYO7OjY7uhEFQkwCbXEuFJ
	toWg==
X-Gm-Message-State: AHPjjUieJuS/6KXoN6tMBxc3XwSkTSce29olCq+XVigIxr2A+o0c9lEC
	tDvHQIRKDSjRRkYG
X-Google-Smtp-Source: ADKCNb55I/u6qENakc4CAexL1HSE1xBxt1j+7koPPR0f95vBPFP6CQUFuY0QnwQ/zsHF6DQZVerI8Q==
X-Received: by 10.200.56.189 with SMTP id f58mr2995088qtc.88.1504623395701;
	Tue, 05 Sep 2017 07:56:35 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id v22sm491515qkb.64.2017.09.05.07.56.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:56:34 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:56:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:34 -0300
Message-Id: <20170905145536.21149-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 6/8] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Tue, 05 Sep 2017 14:56:35 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v2:
- Remove -x flag (madisongh)
- Remove GO_EXTLDFLAGS for now (madisongh)

 meta/classes/go.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e073cb91b5..720a504cd8 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -5,6 +5,8 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
+export GOBUILDFLAGS ?= "-v"
+
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
 export GOARM = "${TARGET_GOARM}"
@@ -32,7 +34,7 @@ GO_INSTALL ?= "${GO_IMPORT}/..."
 do_go_compile() {
 	GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go env
 	if [ -n "${GO_INSTALL}" ]; then
-		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install -v ${GO_INSTALL}
+		GOPATH=${S}:${STAGING_LIBDIR}/${TARGET_SYS}/go go install ${GOBUILDFLAGS} ${GO_INSTALL}
 	fi
 }
 
-- 
2.14.1


