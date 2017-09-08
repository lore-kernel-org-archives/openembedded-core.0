Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id D5AEE781A5
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:49:16 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id d70so1557652qkc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:49:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=IjxR5mTK9jMIkarZWq7PfmkHDksCuvxE6zfjRLj5c+Q=;
	b=RjE6uZAQ6uSB3Lo4cEgf46cBEGlgsnDE23ORgv+vzBXNHX8cL4OBHlr5X8YHTFnvNt
	KhjMoJ9gGpj5LiYbVoT3UtdKifTqlc1Q+pVufjbWQAIzYU52EB3P7+wosx4p44yilgvX
	yazTG9Qmw1PwMxmqog6FNOk5JdF6bpvAQxILgxJNUkXRVYtkb64H5GalEpiYXG3z9lVX
	XxsOEpNIt+ervuakDWIAKmjBiAIq1KtHEArrxHq+T1v6ZbtgcrrFGbJl6yiwH2KMOwrk
	OQKjEPcTmkGa1B6z+0iiKqyhHy1yM9+cvP8Kk+2qxAlsGIt6YcbmdXtNllHhN1vB7ypc
	2K/w==
X-Gm-Message-State: AHPjjUjsk14TBHy7WRD4rI14V2XtGo67xYJc/doLOm3ekq0K+qaY2suV
	ifJjHr+qGdv0TZQO
X-Google-Smtp-Source: AOwi7QCTKOv0PlxuiMgEcqohRbM8DxoTjuoYHJnxAqOlXrYnHWKutzHMfTSF7Pg6fu/0H/G7YHNpIg==
X-Received: by 10.55.113.4 with SMTP id m4mr3765183qkc.349.1504878557887;
	Fri, 08 Sep 2017 06:49:17 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	k51sm1286700qtc.46.2017.09.08.06.49.13
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:49:17 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:49:10 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:56 -0300
Message-Id: <20170908134758.7570-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 09/11] go.bbclass: Use an auxiliary variable to add the build dependencies
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
X-List-Received-Date: Fri, 08 Sep 2017 13:49:17 -0000

This is going to easy the addition of nativesdk and virtual providers
in the future.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index 6df73bf377..82b5f83aa0 100644
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
 export GOBUILDFLAGS ?= "-v"
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


