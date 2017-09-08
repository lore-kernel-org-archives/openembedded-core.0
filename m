Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 01EB3781DD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 13:48:20 +0000 (UTC)
Received: by mail-qk0-f182.google.com with SMTP id z143so6363579qkb.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 06:48:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=oDA92edgQmrB3kRxlImthwMpSZR0PequbQCidEGMx0k=;
	b=jvNAM72XOxTLDs1baYnVlPL3hiVBQEm7yYevQDlPaOH8swvzVOoK2pKPIbaFOoK9dZ
	IT2lIrryvZeRk2QLPahh4x5/PDHIj7ZEWTGL/Yw//ulNM89tOQ6dvTmO2AVQL13BwrhD
	8O79qfqMkJYBrSq6JqMbYtERz13KzEPoN97WLWyGD3hdLwB6jDw+tjw0U1YbRT+DvSZd
	1ls/jv2ueTIBvIp9m7Gyzhj7/PAbTQQhJvw3TYlFd99J1RQ/mmOqtTW5uqRzz/Ci9AUe
	GaxPVaTh6an6lPu4oAdAEKQQmfVkkvdZiWtEMnheTHme6xX9+yFkYAPrMkY0Tne8A4A5
	0oBg==
X-Gm-Message-State: AHPjjUih/MSCo/KD1knuz5DLomzW4yE1fTkNFag3poHZdqM8S44hX2mp
	B87JAfAQsHTLorJ1
X-Google-Smtp-Source: AOwi7QA6+uLyLQFL86RCtA8hJ8+IM7hi0Nk7UKstkMaOyTyqsubGGMzORn3XuPN8B672lOHbKVKSIA==
X-Received: by 10.55.17.156 with SMTP id 28mr3987684qkr.336.1504878501666;
	Fri, 08 Sep 2017 06:48:21 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	l11sm1295708qke.19.2017.09.08.06.48.17
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 06:48:20 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 10:48:14 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 10:47:49 -0300
Message-Id: <20170908134758.7570-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908134758.7570-1-otavio@ossystems.com.br>
References: <20170908134758.7570-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 02/11] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Fri, 08 Sep 2017 13:48:21 -0000

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


