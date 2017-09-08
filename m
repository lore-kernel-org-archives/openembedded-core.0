Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 1491E78230
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 21:05:15 +0000 (UTC)
Received: by mail-qk0-f195.google.com with SMTP id i14so2197705qke.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 14:05:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=RaCowGDZhJlr4INXaZtFYNgqPKCbQ5h4Ed5u16XKBLo=;
	b=m7EQuRixPUL9ObLM3wD1ysaM9TpQT0+ilH6NN9mdPRo2dfUdtYRk78jylN0BpMI65Z
	7EjOIsTWfAXSTwEa13GYWO+J+05fPGnN1uIO1CZYdSs8larctOamcAzQtNJCJk4VMORa
	CdmuvXvhjT0+OgJ9AjvAHpF2pAzAehLKF5xxz13aTt4wWw7ZgKY2rNQoFX7ZJUGj2Tf9
	dcrlE0qt5RcPSazdyqq+m61UsR2V0ut89cYvk0NCVsBJkBClHefev568NgIEn/WagPgQ
	D2+oHAPXrNEzVVa5c6fqQK1XaLPPSgqMJHoajwkrE8VNhVFMZOBcUOq0T6cMrW9giYKx
	uUcg==
X-Gm-Message-State: AHPjjUhB3/p9ibCx0Ho1gDFH5GZBG67q2UOgnVv4ue8Py9SlQ9aw0a/l
	D1AEQN5j8gzJoRWI
X-Google-Smtp-Source: ADKCNb45jzRjzPCY/c0C74jXtecNHSQJzTRq/MROUkIuTdJe/GpaZSAex3ugCysO16RJDeUftFL0Yw==
X-Received: by 10.55.25.150 with SMTP id 22mr5917750qkz.91.1504904715800;
	Fri, 08 Sep 2017 14:05:15 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u17sm1961729qtc.15.2017.09.08.14.05.11
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 14:05:14 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 18:05:08 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 18:04:32 -0300
Message-Id: <20170908210444.25763-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908210444.25763-1-otavio@ossystems.com.br>
References: <20170908210444.25763-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v5 02/14] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Fri, 08 Sep 2017 21:05:16 -0000

Go toolchain changes the installation path when building for the same
architecture as the build host. This was already been considered in
the GO_BUILD_BINDIR variable but was not being used by the go class.

This fixes following error:

,----
| ERROR: go-dep-0.3.0-r0 do_package: QA Issue: go-dep: Files/directories
| were installed but not shipped in any package:
|   /usr/lib/x86_64-oel-linux/go/bin/dep
| Please set FILES such that these items are packaged. Alternatively if
| they are unneeded, avoid installing them or delete them within
| do_install.
`----

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None

 meta/classes/go.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/go.bbclass b/meta/classes/go.bbclass
index cedda68c55..e073cb91b5 100644
--- a/meta/classes/go.bbclass
+++ b/meta/classes/go.bbclass
@@ -3,7 +3,7 @@ inherit goarch
 GOROOT_class-native = "${STAGING_LIBDIR_NATIVE}/go"
 GOROOT = "${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
 GOBIN_FINAL_class-native = "${GOROOT_FINAL}/bin"
-GOBIN_FINAL = "${GOROOT_FINAL}/bin/${GOOS}_${GOARCH}"
+GOBIN_FINAL = "${GOROOT_FINAL}/${GO_BUILD_BINDIR}"
 
 export GOOS = "${TARGET_GOOS}"
 export GOARCH = "${TARGET_GOARCH}"
-- 
2.14.1


