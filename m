Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6A378208
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Sep 2017 14:45:21 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h15so1688537qta.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Sep 2017 07:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=cxpKKGdj73aR3D76zWbvA4Ynr7koPXv8arSS3sUFI5U=;
	b=hNfrMxJI8BY6FTCgxslo+eaWEK0UsthB/bVoGAxn3FZYcqd1i6ft1jPnBiqFfpEB3v
	bC/3OL0mHT1QEfboAePzsB36NCGeafRb2lwMJqKd6JNssYnIwo70me8PdYWTr6HRleLT
	T1HpOWLorEaks3UTP72Fg42quYE2mQjRT+AffvNYZJU22dhS6KYPx4RNrU3uPNMEW9Iy
	xOJz3YdRSzeZyQUExtROKU3ysx4ZIAXAlN28o8C+HOrz6aodyzzCXo8RFyjKSk1jQlrz
	30F5g3wCOrN4NGP4lDq8r+4t1KE/ZBUTe39ce2scL6O/99PsK1jHGhighTq4pS4Wt6ZB
	toSA==
X-Gm-Message-State: AHPjjUg30YYhIZr3tZFVLGUe2G+i4J64bChikBslGnZYsBsjyJvJDWdJ
	BEkFTXGSdDAPDV3L
X-Google-Smtp-Source: AOwi7QAujIEsCg3Q7GuxS/Va9cQKsraqQngfS8bezLO5bHfAnNtfHUexRcQqFlOX8WiQcqvsZDhOTQ==
X-Received: by 10.200.45.195 with SMTP id q3mr4147875qta.43.1504881922970;
	Fri, 08 Sep 2017 07:45:22 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	i39sm1420444qte.11.2017.09.08.07.45.18
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 08 Sep 2017 07:45:22 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 08 Sep 2017 11:45:15 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri,  8 Sep 2017 11:44:44 -0300
Message-Id: <20170908144454.14308-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908144454.14308-1-otavio@ossystems.com.br>
References: <20170908144454.14308-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v4 02/12] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Fri, 08 Sep 2017 14:45:22 -0000

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


