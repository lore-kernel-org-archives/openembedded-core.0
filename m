Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by mail.openembedded.org (Postfix) with ESMTP id DF5BE77FF5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:06:59 +0000 (UTC)
Received: by mail-qt0-f195.google.com with SMTP id q8so278498qtb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=7QH0WcwDoBB9BrSWXazTh3FRw4hes8nyZ2I3uX8sI6E=;
	b=AfQ7bF/Z9we0sTpynsT9IHpLxFCCi7idjzCDaYq1EjfSnT61ON5XFCsRWmR/18V+6o
	TY9xZE7Yxx8netTMPaAU+ObZf9HD+HMDpowrrbz+dbDOjMowYi01xPPn+yng/ayTxtP1
	heIQchX7rhYN5Fd3K9swo2lwqAtRfuXr8ncv3fMPfrurfITSALEOUQ4phywbxjTrDoZg
	G4Pp84/aulO7ZDN/mY3kwlvNonaxT3AN8OlZDi1CQinjOTB/G/eoDr/O/dAnPEOmi78f
	3P9tjTt66RID8t3BUOPHoDTSpjD0aGSp29nUiWyEFJK1dshXhaCNKbdRSS5h/rCXmIzt
	b/rQ==
X-Gm-Message-State: AHPjjUhMH33Yd5IwMSjAR01vGxv0xHVOhOhfNrUHtXa/zamcTag+hV3u
	EP4LHj5tNOQqSiQt
X-Google-Smtp-Source: ADKCNb6/F069x2qvQhLEi8AF+g3kx0MYBuBNX/UWwOmVeCWRJIurgWEBlpRM3XHkJxgTZnVVTITbWQ==
X-Received: by 10.200.22.231 with SMTP id y36mr2564333qtk.31.1504559220713;
	Mon, 04 Sep 2017 14:07:00 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j60sm5456467qtb.66.2017.09.04.14.06.56
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:07:00 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:06:53 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:06 -0300
Message-Id: <20170904210608.23764-6-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 5/7] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Mon, 04 Sep 2017 21:07:00 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/go.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index e073cb91b5..45f2add810 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -5,6 +5,8 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
+export GOBUILDFLAGS ?= "-x -v ${GO_EXTLDFLAGS}"
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


