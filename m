Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 1646377F70
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:07:14 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p55so1026067qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:07:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=r1mTVSAycDmrlnhdPQlP64u9QVH7LBhueMlKJUjU0lk=;
	b=brx+k7y3gAt9kfbsPr2yyjYLX7ShAXV3EIQaYLpaX44xuTkc9P4kV1XBCuAACG0sZd
	7ZZaZHrOQFQAC7eUrGclkL+xIsv5YFNm0p1SzUGgNVswgg2fKOjFxtikMxgPqOOm7xqh
	RektZLZReqEQ59/miKU69sid42tnQTdQbCBYfVGf4YYihnJcyOu9MejQLP0sJJQyb7ma
	h9kYoUUnOGGUQ0US0Rb8NIMruJxclwSx91LYDqKTaB+DxjXEoqAwgqrdo2Q2U+8mPJdD
	cYcqcNtMgOiZLEGpaAj1SV4AWotcAYoWOaFoCtlviab3kWHm8GJV1Uoifn2bGquzmlww
	PO1w==
X-Gm-Message-State: AHPjjUgyyE+KWh5nMNXr53a9cS+HbNlwCjDv6Rpi6V/D2Q1MZfHr+UhV
	UvNKuWBAErbcs1cc
X-Google-Smtp-Source: ADKCNb71CXLmFtcLWuTPXI+FApXpm3EUFbHT752BIgG6APYKTo7nl67Dr7oHMKUqYXGVA/wslZmABQ==
X-Received: by 10.200.33.206 with SMTP id 14mr2709947qtz.182.1504559236101;
	Mon, 04 Sep 2017 14:07:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id p7sm4436424qkl.53.2017.09.04.14.07.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:07:15 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:07:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:08 -0300
Message-Id: <20170904210608.23764-8-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 7/7] go.bbclass: Use an auxiliary variable to add the build dependencies
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
X-List-Received-Date: Mon, 04 Sep 2017 21:07:15 -0000

This is going to easy the addition of nativesdk and virtual providers
in the future.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/classes/go.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index f80134bf8e..e77c6d4da4 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -24,6 +24,11 @@ GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
 GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
+DEPENDS_GOLANG_class-target = "go-cross-${TARGET_ARCH}"
+DEPENDS_GOLANG_class-native = "go-native"
+
+DEPENDS_append = " ${DEPENDS_GOLANG}"
+
 export GOBUILDFLAGS ?= "-x -v ${GO_EXTLDFLAGS}"
 GOBUILDFLAGS_prepend_task-compile = "${GO_PARALLEL_BUILD} "
 
@@ -43,9 +48,6 @@ export CGO_CPPFLAGS = "${TARGET_CPPFLAGS}"
 export CGO_CXXFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_CXXFLAGS}"
 export CGO_LDFLAGS = "${TARGET_CC_ARCH}${TOOLCHAIN_OPTIONS} ${TARGET_LDFLAGS}"
 
-DEPENDS += "go-cross-${TARGET_ARCH}"
-DEPENDS_class-native += "go-native"
-
 FILES_${PN}-staticdev += "${GOSRC_FINAL}/${GO_IMPORT}"
 FILES_${PN}-staticdev += "${GOPKG_FINAL}/${GO_IMPORT}*"
 
-- 
2.14.1


