Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f196.google.com (mail-qt0-f196.google.com
	[209.85.216.196])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF5478237
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:46:41 +0000 (UTC)
Received: by mail-qt0-f196.google.com with SMTP id u48so2599493qtc.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:46:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=GYykCiR2ppZ+iI36k7v9Qeopkn9jNFiZ4jV27vvPcGs=;
	b=QE4cq8LBVEza37yrS2acy/YNRsTgjtUKjib1ya+EqYyS2uY0PyDie9bL9tuQ1YWhCu
	AOgCclUoIoaNue3DEz5JxoWCAdG7t22CqqUpoZ9Kw0qoE22L8yk8XSay4woqwp3Wld1/
	ywDNS12211AoKh3HJJlLKS9JjcMnKHWsgqj9BvlvByTZKf9kT2KrBDxK/xp8P2vDZyp/
	LQYUMv7+D8627A0n0AbEwzi1w8hyQkhcnI9RImwyynob8JG6jCglmfSIkzywV2NR4CNH
	e9ewRuFI52xOjGN6KrrlbU40klAsmePEnVVzuxi5SDXsWisKAGc6V9UwaNRMVUiLkqdv
	FlUQ==
X-Gm-Message-State: AHPjjUgrV1sNB+EkvQSc3rrRv8p1moQfdpuK3GMplSXFrr3PkBGhfn/6
	qCyd9sX65xLEWtgd
X-Google-Smtp-Source: AOwi7QAdiJdi6u2DYS5L1Pl95ahSyxVIBXbVV6tqb/SomqPV3fNgSYpVMC4Q3GSvdfS1HfpcRyWxlQ==
X-Received: by 10.237.33.211 with SMTP id m19mr15178864qtc.272.1505134002869; 
	Mon, 11 Sep 2017 05:46:42 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id 36sm6255121qtz.89.2017.09.11.05.46.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:46:42 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:36 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:38 -0300
Message-Id: <20170911124558.2863-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 06/26] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Mon, 11 Sep 2017 12:46:42 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
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


