Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f179.google.com (mail-qk0-f179.google.com
	[209.85.220.179])
	by mail.openembedded.org (Postfix) with ESMTP id 280C0744A3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 14:32:59 +0000 (UTC)
Received: by mail-qk0-f179.google.com with SMTP id n139so2029300qke.11
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 07:33:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=o49qUCrkwEvP4fnEQVnIli1liCczYhlmbRKpo3f3X0M=;
	b=jX380MyzIozBTBXtAdRLRqcnuimn34yeNJKIDtqGmaTByuC6E05/Hm4Jb6GisDy3aV
	WwkmVw6QQIzETILE9AItanTndmH2hkpPeHn//oW1LTIGugxsj3x4LWt9SHM7ducFnjfn
	7+9rP4bujtZOwfJ9Xb2vKtfAQ7pP3yzYx+t9nalvlI6ihutL2NALjr4kTWl38AIUMBZT
	Ftwj0Dl70vmN+TvjKPM1c4jClr6UhK56NM02STsG4Au93iSXwpJjWE6GK9Tc2776gWtj
	LVuaMvz3xrjkeSt6PIK+pta9Yu0s2TsvCNBnwzXP/7EDOS8iZzQ4doVwDeutZzcZlwe1
	OZMw==
X-Gm-Message-State: ALQs6tBomGGVpcBkjxKneIic/n7KEC+SCFu989guNQFyRczzCKWrMNiG
	8zbz5XEbYI/csT6YA9+JI6Sj8w==
X-Google-Smtp-Source: AIpwx48ZEDVcPrOioEgKtI51OCLdhjpZdBNTZGS1SwC15zSpUT+a4VlmpQR0lP/6FFlJIcEwWRnOmw==
X-Received: by 10.55.75.87 with SMTP id y84mr7184814qka.34.1523457180533;
	Wed, 11 Apr 2018 07:33:00 -0700 (PDT)
Received: from localhost.localdomain ([177.194.217.140])
	by smtp.gmail.com with ESMTPSA id f96sm990150qtb.86.2018.04.11.07.32.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 11 Apr 2018 07:32:59 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 11 Apr 2018 11:32:52 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 11:32:52 -0300
Message-Id: <20180411143252.21109-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.17.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] distro: default: Change Go default version to 1.9
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
X-List-Received-Date: Wed, 11 Apr 2018 14:33:00 -0000

For the time being, there is a serious bug[1] in Go 1.10 when it comes to
use the shared runtime support which cases problems in multiple projects.

 1. https://github.com/golang/go/issues/24640

It is still unclear if the problem arises from a bug inside the
compiler itself or it makes a real problem more visible. Either way,
using 1.10 as default seems to be a risk so we are changing back to
1.9 for now.

Refs: [YOCTO: #12631]

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/conf/distro/include/tcmode-default.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 7862edb6333..00399ae820c 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -72,7 +72,7 @@ PREFERRED_VERSION_nativesdk-qemu ?= "${QEMUVERSION}"
 # Setup suitable toolchain flags
 require conf/distro/include/as-needed.inc
 
-GOVERSION ?= "1.10%"
+GOVERSION ?= "1.9%"
 PREFERRED_VERSION_virtual/${TARGET_PREFIX}go ?= "${GOVERSION}"
 PREFERRED_VERSION_go-cross-${TARGET_ARCH} ?= "${GOVERSION}"
 PREFERRED_VERSION_go-crosssdk-${SDK_ARCH} ?= "${GOVERSION}"
-- 
2.17.0


