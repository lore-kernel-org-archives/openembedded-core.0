Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id C7AB47868E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 17:55:11 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id r66so572689qke.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 10:55:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=X/cj8tyUAT0jrR74tsycreDrzuu6ErN+f2PZTciqsmI=;
	b=JQHjOzuuKPaeMkZ+KkTuJWXqOdjYTil1bKr9Lm2k+/r8LwOY/Vjg/BR8ojZxF0XKSf
	6BdUoRv0lqa3RHSasgGxWPRdI6jQsOxPzsu+Ys8jq+m2fAo66OeNdg9A2LaHhmpX5j2G
	bKJF4BBnxjFZAGRbd24DsWfgjZEijxj8HSYY5eX6zB84A/SIYznk5Ksm7y4BHdK87q+K
	84p/oJ9uUI+A2J3JIciUbmHyXNNRe6IsWLxIyThbb8qGn/cC+WZthuMVL/eJv509O+v5
	YzGimOIWhsIzj87zH9bgwPqPU7Rg/pHiTPZToojTugWtubUguiEpUxsIanPJxSacXBLh
	SxOQ==
X-Gm-Message-State: AHPjjUigtWedMP5DiaBctHIT0woIb4tfSw0Ol+C32Di/EHxi943mIkra
	Y1VqxtMc5Cc2PEnU
X-Google-Smtp-Source: ADKCNb44slkpdsH3j/N+GlF1jwVE3fTQ7ekf/22BYwBN0UH4d3FNt0Q41wydRRWnovYFRmxSsy7SNw==
X-Received: by 10.55.164.67 with SMTP id n64mr26602085qke.328.1505325312532;
	Wed, 13 Sep 2017 10:55:12 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	h19sm9703540qke.29.2017.09.13.10.55.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 13 Sep 2017 10:55:11 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 13 Sep 2017 14:55:05 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Sep 2017 14:54:07 -0300
Message-Id: <20170913175410.23041-7-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170913175410.23041-1-otavio@ossystems.com.br>
References: <20170913175410.23041-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 6/9] go.bbclass: Add "ldflags" to QA skip list
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
X-List-Received-Date: Wed, 13 Sep 2017 17:55:11 -0000

Currently every Go package will end with GNU_HASH in the ELF binary
however adding it to every recipe is cumbersome so instead we handle
that here.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v9: None

 meta/classes/go.bbclass                  | 2 ++
 meta/recipes-devtools/go/go-dep_0.3.0.bb | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index d805dc2713..4af148e302 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -109,3 +109,5 @@ EXPORT_FUNCTIONS do_unpack do_configure do_compile do_install
 
 FILES_${PN}-dev = "${libdir}/go/src"
 FILES_${PN}-staticdev = "${libdir}/go/pkg"
+
+INSANE_SKIP_${PN} += "ldflags"
diff --git a/meta/recipes-devtools/go/go-dep_0.3.0.bb b/meta/recipes-devtools/go/go-dep_0.3.0.bb
index 5e4544a104..abfeb48370 100644
--- a/meta/recipes-devtools/go/go-dep_0.3.0.bb
+++ b/meta/recipes-devtools/go/go-dep_0.3.0.bb
@@ -13,6 +13,4 @@ inherit go
 
 GO_INSTALL = "${GO_IMPORT}/cmd/dep"
 
-INSANE_SKIP_${PN} += "ldflags"
-
 RDEPENDS_${PN}-dev += "bash"
-- 
2.14.1


