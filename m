Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f68.google.com (mail-pg0-f68.google.com [74.125.83.68])
	by mail.openembedded.org (Postfix) with ESMTP id 904A378878
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 21:41:20 +0000 (UTC)
Received: by mail-pg0-f68.google.com with SMTP id l4so4573509pgp.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 14:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=omT+ogPcGP/DSifCGv2w3w3whS3StxBl/uM9OXcIWN4=;
	b=uJbsgwlJiyj/8wWdrus2t94ujGT0E5R91BwGqxxPOMmcT5DOhyeLTKu5IrylWxhWQV
	8dRpXQ2JWk3cI13p9FAOHkbmykYiKn5fKg6pJVaXSurr9YnnesbSNKxcNnz3g/o7BHx+
	VVSVB1p5dUF+CgTJeh0qBxBrOGjysF9NxSsYGq8GWnS/RaWPEux06JtUE6NrVAnxgm6O
	jWCVeHxqR6sWRTnPIA4GLD7bYw2M2x/LlgAbUt5PmLMkFlXQXyGazQJ/J4DCek7RfFa/
	2M5JucEXiYYnr+qlpA0658vF9uEyZCG+7Y7Fi1cEJp+T5zgcxdUzEsJ3BX9MXscy9xvm
	xaIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=omT+ogPcGP/DSifCGv2w3w3whS3StxBl/uM9OXcIWN4=;
	b=ks3H590VnvDVepmkzue+9CGs6wmOSMGIuqWGYH38awFqdGpSj+5McOlN8ANp6s4zT8
	ZyUn8rk+4fhuIwHp/OUAFr0Cdp653dERXqr0u6JgVgb+TgXvFAHLDaM04j/bUp9mUvPC
	LqYOTKdT52grInjGb/lzEMGt6lcpF/H/2rQckz2i1w4YN9s7JCCZ6C9MooyV5hbq/D6k
	CTxcOn60cGzvYw6EFGN4mPc1WudsJwDpIdPOkGGp9o59dKbvs48MVeaZBRGtFmllFTTK
	+KL79CZ154yoBkjSsWJCWqpMs6NhhL2Jybat9HXelKLmkqDWBrx10Q3E3r2ItJm+evXF
	dkJQ==
X-Gm-Message-State: AElRT7GPuuazgacLopK1iwCu0N3ZHBedl7UWwSSOiO6nkoRLMoZWQKw6
	C0601MmUKjZDFhzZxisZE8vqCw==
X-Google-Smtp-Source: AG47ELtl/BLewcoitKigGuLLEGRiFwjZRylYYR4uTjH768cw1mNtOd8+vwla16abfx/TNGCLih1wfg==
X-Received: by 10.99.136.194 with SMTP id l185mr2678085pgd.419.1521236482231; 
	Fri, 16 Mar 2018 14:41:22 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	d186sm17533219pfd.1.2018.03.16.14.41.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 14:41:21 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 14:41:12 -0700
Message-Id: <20180316214112.42299-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH V3] gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
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
X-List-Received-Date: Fri, 16 Mar 2018 21:41:21 -0000

We allow to set LINKER_HASH_STYLE to be empty so this would fail
since --with-linker-hash-style needs an argument and cant be empty

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
Changes in v3:
- Fix typo in gcc option

Changes in v2:
- Use inline if statement instead of old syntax

 meta/recipes-devtools/gcc/gcc-7.3.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index d56d2c5e06..a80926216b 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -100,7 +100,7 @@ EXTRA_OECONF_BASE = "\
     --disable-bootstrap \
     --disable-libmudflap \
     --with-system-zlib \
-    --with-linker-hash-style=${LINKER_HASH_STYLE} \
+    ${@'--with-linker-hash-style=${LINKER_HASH_STYLE}' if '${LINKER_HASH_STYLE}' else ''} \
     --enable-linker-build-id \
     --with-ppl=no \
     --with-cloog=no \
-- 
2.16.2


