Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id B02DE78230
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:06:14 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id p55so2247185qtc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:06:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=xgKFAL7P3C5CYYZ2l13T+ECPmrsKFEr5cWdlqY9Q1i8=;
	b=hN7EZmSH/Ria5tTzTOHW7yxJVj9m3e/gfkZ4y3H1MJO7TdeksVb47K25s+n1TkVow2
	7Yo3tEfRQUX47FxSF8Sj1uPlbRGCA9wJFnvkE3yUZmdGziIowLLg7fr5VyNR47cTelFb
	j1zytviRJW3FEk2POC/KKx6h3T5/jWbhZYNYiY5++vTDsyDwIpYVsXLX05aVSYYZnhax
	GhfF9We76vub/xrpjG4ytew04PKF93RZQ7UwtnRPvqsjMYkoqRPcqoL3n7mWauVy99la
	9lkzZjpsuAefRpST10zY46L3Rmqzek7jyGKjrkbnV19V1RurEdyY2NBWkFapPU0V9vfu
	gs0w==
X-Gm-Message-State: AHPjjUgqakra2GQytDT7J3hz8hbPpL7mtSbFaBdi91iaw0pDL9OZkMHf
	JQNX7cAslV+6WoBj
X-Google-Smtp-Source: AOwi7QC41LMyNxFb2J86zA5RBhVYkxtJpefsqBe42dw1LW9rfnovcJ3l6txwoVfkh/LqtGDRkNU0qw==
X-Received: by 10.200.4.16 with SMTP id v16mr6472385qtg.265.1504904775693;
	Fri, 08 Sep 2017 14:06:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i186sm1831407qke.93.2017.09.08.14.06.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:06:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:06:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:39 -0300
Message-Id: <20170908210444.25763-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 09/14] go.bbclass: Use an auxiliary variable to add the build dependencies
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
X-List-Received-Date: Fri, 08 Sep 2017 21:06:14 -0000

This is going to easy the addition of nativesdk and virtual providers
in the future.

This change is based on the meta-golang[1] layer. Thanks to Matt
Madison <matt@madison.systems> for his work on this.

1. https://github.com/madisongh/meta-golang

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


