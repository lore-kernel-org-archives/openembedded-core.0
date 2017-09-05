Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5409177F38
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Sep 2017 14:56:01 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id o129so12368305qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 07:56:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=L1UCzqbq45uVHUJUVTBdse1R/amrNsL/pz0qd1mkxcA=;
	b=G4np5xGysWueSPdiMizPYc0DBTJFXzM9DxFxU/H9rrYlVuZQ03qPClplt2lOVX9Zj+
	oYsf40UizEbPyBIfwxVBawE6BwGrajknNH+t88BeJGhhogVVJ0jcOK32t/A39VsAybgA
	7otR+5E0K6rW7sx2kyaGeYiOrX5R2Y2AgY22rpT1vokm3zib7RTmC1124NEKkCmXHAbS
	0Hymv7zBojKDUFZOcIL6EL865hmaEBm9t7IIh5t8Oc/BhOTDrNgw8kaSYtdZa2laMu9/
	PkoyA54mdcTPMj33rFsjHfgOufxHYznEAvrxngiBLD0mXhafdyTWPCjTPoAEu89AOliG
	Dnaw==
X-Gm-Message-State: AHPjjUhzHP7sfG1EK+2P1fbPA87J+sLdgJygdx9yVQfKz/n5/yY3qokW
	qg2XtPswL7Pjre84
X-Google-Smtp-Source: ADKCNb4HOny9CmjVy54hpUqfBDfXJ3eb7fhWbqkVjf3+3WkNoB870P2J9dpnvf5iIsD6ynDb5wCypg==
X-Received: by 10.55.197.29 with SMTP id p29mr5215634qki.207.1504623362276;
	Tue, 05 Sep 2017 07:56:02 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id 36sm493302qtz.89.2017.09.05.07.55.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 05 Sep 2017 07:56:01 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 05 Sep 2017 11:55:55 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue,  5 Sep 2017 11:55:30 -0300
Message-Id: <20170905145536.21149-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170905145536.21149-1-otavio@ossystems.com.br>
References: <20170905145536.21149-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v2 2/8] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Tue, 05 Sep 2017 14:56:01 -0000

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


