Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f194.google.com (mail-qt0-f194.google.com
	[209.85.216.194])
	by mail.openembedded.org (Postfix) with ESMTP id 28E7378235
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 12:48:22 +0000 (UTC)
Received: by mail-qt0-f194.google.com with SMTP id 7so5495893qtz.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 05:48:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=MTE59EsKGkg3bRdntwtsOe7yi1L2LzA96xcMEB4vSFI=;
	b=qgQkQj3pqGwk85HTiQ126zXCwPPhROeeg+D/5rpmz6UA4IQN2RZbwlDk52L91O7Kxp
	FNUPcaF8fzOQWwfZAx/rcdvUEyl5wvb9pziG3zURLkpWRU+0JzoL8lo4yZXmRKKn4rxY
	ODCAD8KPvRdxw5u8yeN5whqKK1PLG+oR54HKHiUBrzyefgoZXgTnS4nqs03MEKXC+edY
	lMiCftwLemNG9xoM0croGoZwRiJKa7ICPN5AlAREhIUt3W6PiFI/W/IxA6X2liTcmEkP
	nS4hwd6vp0/gxQkxIc8a/tK5ZtfZVa+mLH43JSVqcu9emkNB9UpFmxO8ommE1fY5SWIl
	S6AA==
X-Gm-Message-State: AHPjjUjNZankE5YWZr6f9WP86iZt2+8CM0qXf9VfxokPNhiA6iv1VMoo
	iT9vtRGRUcbk+tLv
X-Google-Smtp-Source: AOwi7QCRN9QHtdEGX/T2h8OnbSqoAwIadShMXRChPtTzKLl6gJqpl0/xmQ3kzlqcxi4zF8wrqkV+VA==
X-Received: by 10.200.23.82 with SMTP id u18mr16568596qtk.68.1505134103706;
	Mon, 11 Sep 2017 05:48:23 -0700 (PDT)
Received: from localhost.localdomain ([189.114.111.135])
	by smtp.gmail.com with ESMTPSA id
	d58sm6164347qte.92.2017.09.11.05.48.20
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 05:48:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 09:48:18 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 09:45:55 -0300
Message-Id: <20170911124558.2863-24-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911124558.2863-1-otavio@ossystems.com.br>
References: <20170911124558.2863-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 23/26] go: enable nativesdk builds for the toolchain
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
X-List-Received-Date: Mon, 11 Sep 2017 12:48:23 -0000

From: Matt Madison <matt@madison.systems>

All that's needed is setting BBCLASSEXTEND.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v6:
- new patch

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

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


