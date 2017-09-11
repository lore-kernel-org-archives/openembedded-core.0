Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 215877821E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:47:02 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r66so5175129qke.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=My5zFw+OFMO3i9yuf/q2GIcT3lX7SAeyy+9IlsWh34s=;
	b=OaPvZEGngEHPtYO2NAleh/YfHDvUpY9v7BdCqbtXra3RG1bdjZefxWbHbg8r03rPyF
	MX8VSO7V2vgTr+HUzSo7xwRLFNYLF9znlp6AuAKLe+XcTXDtiGA+DeQrp+JPU1JQ9lEQ
	oCx4EaQifb6hqw5VdDAqV6z3ykVpbXG4UShPXbGZiKVg1R9KHZ849PVkoO2v2KR1fmlT
	KaH2dsvebU1tjFuV9X6Pd3KHeJ5p1lMCR4IcVQ3IsGKSd61XJRvpEGa9Bk/2fEF9ljlC
	pSnetaEgz1ywjiY4PLlrtqAF9enAA+APwC9EeDH21u0DG+kon6LbjvRtQYrocGZWEKHm
	BX7w==
X-Gm-Message-State: AHPjjUhu8lUYAf1w10zTJZ6V1vbnGGsWIVyLeFF1kvJCMBDWFDV7lqDM
	5p+BScPIUbzDA0jV
X-Google-Smtp-Source: AOwi7QB3zAqvDSSeogiHx+p+uAjeqUOn1yKn5aq2aKw1zlag/1cYolfGg+vI9c1FZOO7nN8EtLfX7w==
X-Received: by 10.55.20.16 with SMTP id e16mr16100858qkh.97.1505134023326;
	Mon, 11 Sep 2017 05:47:03 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	a125sm5987266qkg.13.2017.09.11.05.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:47:02 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:46:57 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:41 -0300
Message-Id: <20170911124558.2863-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 09/26] go.bbclass: Use an auxiliary variable to add the build dependencies
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
X-List-Received-Date: Mon, 11 Sep 2017 12:47:02 -0000

This is going to easy the addition of nativesdk and virtual providers
in the future.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
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


