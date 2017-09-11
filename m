Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id BDA0B78457
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 18:30:16 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id i14so5912066qke.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 11:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=v4X6YbYzy/TJWv+tCxstiyppSAc/lbKYqWo4EfBOD+w=;
	b=Ga05z++TtOaZvj4huhHvx/4j/DYnPbH/qje0IdEncUPaXDYB1a9+NIvvQkgo4wSuGb
	tmlxYmmw9AWihYQ9dFeeLO8aXXCTrUy4XX4WwYk0pLULAL5Xjc6y80VWSYB17l0fDn/E
	sVmt9eaVnlXLGX8ZN/3RFjgFRCZJ8sH5iRgjmsYKD4aAutuZpOaHFGnxsHiWTYMCGHAE
	IQ8TEvlbFnENWyCbDS460M7rYHQ0SyzHnz7f0I4mNfFqrwzaW28waS9oyxFZTkF84sWx
	KqDF9BSCeBqOsX/nE6H9SNCeNusoS7rXFbjhBENNRRkW7vc0mqdGpgyYl9h4qker4J8n
	ngvA==
X-Gm-Message-State: AHPjjUjwFNhR8umzjlspm//xle4Tf5+wtutNsPm6OhWHAlI13u4mf0v2
	CLcHHyjzDXnFKR3j
X-Google-Smtp-Source: AOwi7QARJ7SAIZ+U/z+MsgRj1jNt6Mp+pm9PPfHWujoUOhfq0rrw27bd7a96AC8xIn1c3metfbeGPw==
X-Received: by 10.55.15.170 with SMTP id 42mr17331353qkp.262.1505154617463;
	Mon, 11 Sep 2017 11:30:17 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	c185sm6229393qke.60.2017.09.11.11.30.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Sep 2017 11:30:16 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 11 Sep 2017 15:30:09 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Sep 2017 15:28:50 -0300
Message-Id: <20170911182853.11076-10-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170911182853.11076-1-otavio@ossystems.com.br>
References: <20170911182853.11076-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v7 09/12] go: enable nativesdk builds for the toolchain
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
X-List-Received-Date: Mon, 11 Sep 2017 18:30:16 -0000

From: Matt Madison <matt@madison.systems>

All that's needed is setting BBCLASSEXTEND.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

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


