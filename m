Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 01A73781E2
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:46:02 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id i14so1642694qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=9bUd1Ja4QEWnzFASNrFLt86lNtQsdHFlReU0104btk4=;
	b=Ro/e3EgB+Iq6d+xk6flFb0Eo0j3qb9ELxacHAGxqdslfMHcEa8+NSgn4Fqf0YCg8Zj
	lhMjt71Fjn6n1Hw57jfpcs2RIlN+dsZhqGaTTe7PBNOYox5ciijGRxk1Kyw+iJ6GEANH
	5Ab2gG7gmj1C1PANADyliyM81WUX1jKIvr+Z16qZPPD5KR9kPsvpzFp+CvzyR30YG3nY
	6NqJAQFa0m1KjrWHmKQ+P3muvrTAd93P8/Ce+JowwZIY1ADVOiUtWG5+mlK6NxuPOLRK
	B1RtCUVBFK0hvp8gIXviT4Dz0XofiTiQ6c1ujYGjD+aB+YBUTxl4bt4VnDNmxGOu5jiR
	jaXg==
X-Gm-Message-State: AHPjjUg8Hb9pv44bzxTQmUWfkOgciVNYBiOhrgghrS9Hy+WP6TkS3u9o
	IkLLoio5Rd7D59+G
X-Google-Smtp-Source: AOwi7QAgCKKM5cW1yFuSWbElBvcsmzSzLqUs5eajoj2MzJshVMdI3dn9rsNbuGc4ee9hGXG3Jn/Gcw==
X-Received: by 10.55.31.211 with SMTP id n80mr4251672qkh.324.1504881963181;
	Fri, 08 Sep 2017 07:46:03 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	e39sm1365933qtb.67.2017.09.08.07.45.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:46:00 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:54 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:49 -0300
Message-Id: <20170908144454.14308-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 07/12] go.bbclass: Use a global Go build flags
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
X-List-Received-Date: Fri, 08 Sep 2017 14:46:02 -0000

We now use a GOBUILDFLAGS to provide a global variable to control the
build flags to be given to Go.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


