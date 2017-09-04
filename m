Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f173.google.com (mail-qt0-f173.google.com
	[209.85.216.173])
	by mail.openembedded.org (Postfix) with ESMTP id C623377E99
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Sep 2017 21:06:36 +0000 (UTC)
Received: by mail-qt0-f173.google.com with SMTP id i50so5945491qtf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Sep 2017 14:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=AwVwNfpHDfB9+OaReTtx30wcO2Gtr8yzM9M3nfq/zPM=;
	b=GUdTbdpKc12ZTSZKQHvEdE+L2/PsICEHCKNLQ+tyMlD1+vApjHxPBDMQfIdy62Rd5A
	UCL03UZQdcIJgrChNDduGTcCeVhHZ9cYpDCVrQTXtjr4Cyd/tIldncehkZjuUidnf/wM
	lhKaZwBDMJ5wN9/lmnLVvgcWnFGBKXVm+WmhW0dWKN6WD1H4ws/XnQPK0ckmOi8Y8/rh
	2dVMQ9WJD8S9NFuOFuyPpjRROIUpzEmIHy5zIIHAq6Faqf5HoepwydrPpFOc3i7hlPWH
	hzIuKUImRU1oBjpvLD7DzEpf6gTOuES/qlyJRYIhBauWUxdyJH33eiG2D1Gv4z2kaIRT
	cB/w==
X-Gm-Message-State: AHPjjUjkmxcB8frDpNoAUXNIj9Zbs0tFeMuksFtdNJY169cyNCQzcFD8
	omlaVkI0liLJQzMC
X-Google-Smtp-Source: ADKCNb6KScs1w/yuU/sWoio+xSOgcdyPPXMi9hQB1SIGT2GykVAe+KLi5zr6MvzF4c9+YhAGBUKZPw==
X-Received: by 10.200.20.133 with SMTP id l5mr2605931qtj.46.1504559197759;
	Mon, 04 Sep 2017 14:06:37 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	j126sm2166381qka.97.2017.09.04.14.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 04 Sep 2017 14:06:37 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Mon, 04 Sep 2017 18:06:28 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon,  4 Sep 2017 18:06:03 -0300
Message-Id: <20170904210608.23764-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170904210608.23764-1-otavio@ossystems.com.br>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/7] go.bbclass: Fix binary installation path detection
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
X-List-Received-Date: Mon, 04 Sep 2017 21:06:36 -0000

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


