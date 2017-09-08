Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 797FF78220
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:53 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i14so1548242qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=0tqerx52SfCCiSWgjWZsTVMlwnk70wnvWEUDOxKsIvo=;
	b=JZKMFJ9w8f2h3wK12zUbRuf0HemtEolyEeVrEBBsDmtPqxJ8obSVum3Int3m4TCtPP
	SZRQx9Rwq2VEGBBJujVOWBntCK3jEtQzOdDmTqy5c41LjVTcqpgy3q0x/9Gl59oiIk9F
	CCOUqNdTnMzxRcIFsYhRkLYxiMi41DRG8DjeEBXGPey3j596o+HpjOvEjTJhSOU5Gk1D
	4B0CJtBhHYK+nukmS2fnPXxjZMgU3ocJ1CeLNwcGG8Dl8lkSNTVW9Bjm02CmwgZDU3E/
	K/MOJDy2Gx4bDodFRkkQDYj9DQSiOGsqcwmO4VayjdgidOqRbaP8EHNjgoxPjJKo0tBI
	XEkQ==
X-Gm-Message-State: AHPjjUgLXg1nOu9WbXv6B4hzjg/f8nL9nP+xb+BmuZk1xjc/9EC/pZEj
	dAPY/Zn9pVEGPK5L
X-Google-Smtp-Source: AOwi7QA6AnvsmbLEo0dov5i5MfgWmQBbvT1LKjilTeyg2CkGO0MCPWxQi91kppI0/5FI8hxD2Mr5og==
X-Received: by 10.55.54.12 with SMTP id d12mr3635685qka.20.1504878534680;
	Fri, 08 Sep 2017 06:48:54 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id f6sm1207032qtb.68.2017.09.08.06.48.50
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:54 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:47 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:53 -0300
Message-Id: <20170908134758.7570-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 06/11] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:53 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


