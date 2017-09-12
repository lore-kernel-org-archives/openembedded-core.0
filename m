Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id D12BC78449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:52:18 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id r66so6953709qke.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=hsiC3QH3obHFl/cKZKK+wSRy1AD8PbMyRAFS6jqsIps=;
	b=VcDUaWqHfIlRugpthYsmNNtx4uCaygy+pueNGKYyeEtM96CqXqm1L75gEE+nfMgkSn
	m0Lx8DWcb6aWWpRT9jrM/ufOSYE209Z/zxX+dTDWsFneYAsVnogCacfhvzHikUB8aNoM
	QFL0OKpNyfJs0otckrBBfyj3STEJLbb4AAEftpxx/6EnUxuA8P+G2nnzgzC7NwEjY970
	Z/hjAW78iYf6xOcvGejmblJQVfXNdG5z56KQbQHshFvB0QrCJe/sWxDj/hX6XiOF8q87
	OY1SL2ZbMc18UKCz1V3772H5DU5aTNJZ+76yrb7LypLtJr8OSxn1C+/aG0lJw2hW/rJW
	qsbQ==
X-Gm-Message-State: AHPjjUhYfg9AwFqZc0vcTPXFVeFTInqxRsoLnfYIze3NABK117obna5x
	SfFjZg3RJtsuqMFp
X-Google-Smtp-Source: AOwi7QDi5chcvyUJiWwyjag9HKJhD0ilqDKWY0PylSTUvvBCggPVJKTQC/aORNXlSFb+Nm66eRz2kQ==
X-Received: by 10.55.132.131 with SMTP id g125mr20220875qkd.87.1505220739526; 
	Tue, 12 Sep 2017 05:52:19 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	r11sm8092172qkh.80.2017.09.12.05.52.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:52:18 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:52:12 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:28 -0300
Message-Id: <20170912125031.4009-11-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 10/13] go: enable nativesdk builds for the toolchain
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
X-List-Received-Date: Tue, 12 Sep 2017 12:52:19 -0000

From: Matt Madison <matt@madison.systems>

All that's needed is setting BBCLASSEXTEND.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/go-target.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/go/go-target.inc b/meta/recipes-devtools/go/go-target.inc
index 5984a60c28..0d80bf0d97 100644
--- a/meta/recipes-devtools/go/go-target.inc
+++ b/meta/recipes-devtools/go/go-target.inc
@@ -1,5 +1,6 @@
 inherit goarch
 DEPENDS = "virtual/${TARGET_PREFIX}go go-native"
+DEPENDS_class-nativesdk = "virtual/${TARGET_PREFIX}go-crosssdk go-native"
 
 export GOHOSTOS = "${BUILD_GOOS}"
 export GOHOSTARCH = "${BUILD_GOARCH}"
@@ -49,3 +50,5 @@ FILES_${PN} = "${libdir}/go/bin ${libdir}/go/pkg/tool/${TARGET_GOTUPLE} ${bindir
 FILES_${PN}-dev = "${libdir}/go"
 RDEPENDS_${PN}-dev = "perl bash"
 INSANE_SKIP_${PN} = "ldflags"
+
+BBCLASSEXTEND = "nativesdk"
-- 
2.14.1


