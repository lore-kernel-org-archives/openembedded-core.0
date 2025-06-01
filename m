Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1768C5B543
	for <webhook@archiver.kernel.org>; Sun,  1 Jun 2025 22:26:40 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
 by mx.groups.io with SMTP id smtpd.web10.37010.1748816790890816319
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Jun 2025 15:26:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JII0AGEI;
 spf=pass (domain: konsulko.com, ip: 209.85.214.193, mailfrom: tim.orling@konsulko.com)
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-22e09f57ed4so40560645ad.0
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 15:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1748816789; x=1749421589; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4fehGZECawMvRKwCMKSaN5Hb+pGwJl1c0q27vJDvQCE=;
        b=JII0AGEIEZ5sX+jJ1Ss1eOe5S7kVluCuyNS7WhbVJzMw/EX5iVBnW/VLFZNd5QZf5I
         J8haqQ7Fr0nng0KlmOWi18gtYpmLQb5rDeWpOcIZx328FgQurjJ4n6bOcSqQsDuGdoFe
         LZkIQs6GEJdSNwuexgYZoQwfGLD4TcWY5EcYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816789; x=1749421589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4fehGZECawMvRKwCMKSaN5Hb+pGwJl1c0q27vJDvQCE=;
        b=unLuxolYB3qJ4i4TaaDn2hhcEIF/EbSegDVfpY1J4m9ToxyA7PUNwMw8Jlb6Ro8KbD
         p248eeWTMzq4R08Zi20z/EsEap29D7r3gv9auJC61QQhVmLg7kwNXn/vSAHDGzCWgsEP
         NaY+de4SDs/1ra5NpmPNR41w6HOfDY0ySrdNEiMl/kFZpcgPWW9ah9lBogIoelTju3r7
         vYfdXJQdsN+5e2cUSz0sdRnGp2wnF/ogVIsB0diKqNKHGPZ7YRhi7vFOePSvkyQ2qUqB
         3tkjsu8cNqIcw7QpkaFjCOkQTnuYRvGeOx1tM0J+cDBtxEOqFwWZqSkuXubMxCImKfts
         6S7A==
X-Gm-Message-State: AOJu0Yz4UcpQcl4iKCDrutLEPoj9J7RjNBLmMcx1gJs/pPWLmWdsDVdR
	aKhk962pqP9gpkRLtJIgl6+sZJvEaF0LKWXhWJWErREHnziuMhJ7Y7XdTBdEXDTIAw7YM/x2Ve1
	FWihi2c85ujCP
X-Gm-Gg: ASbGncvLo4kEw3TdTm/peR1Fce8XWKlbHSzQr6JacAAdEhe/HT8vn6+6G7/yXqiyyU6
	RBM+NC9fPnapRMXCudJ4dfQdsS3iarsejjVrN4NSuzzWu+cQbAuo6999Izzb6OfPwMY8krDt8TG
	Dbocep+ZXgFt/ZAnTmSWDUvRHgNXc+vF39+2PD0aIZJbnMThhfKV4dFuKH6DTJ+OrYTmQSVJ6F/
	4giH1KYFxG8saLcJsG1rFs7MB4S9UjxbcpMZqoJL/CPgd90Q/HckpoW2fAqAlD06nY2RxcYKIoJ
	+cVgEa285Z7C6sXvHI2R26FsRRj4GDYJXamDJId+zVCSvYdWcEKwQJGhBXIaC0EdEdHUeNCKPN6
	2TYoS02fHYa8cQ0I=
X-Google-Smtp-Source: AGHT+IEzyf7lGsS+cbqqlG1oTI2DTJuBKMxTNzGk7JnklxHQ6zgIHZU4o6IW8k+H1FkGhl+/sjA3uQ==
X-Received: by 2002:a17:902:db12:b0:234:b445:3f31 with SMTP id d9443c01a7336-234f6a089bcmr220340315ad.17.1748816789426;
        Sun, 01 Jun 2025 15:26:29 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506cf5029sm58966635ad.173.2025.06.01.15.26.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Jun 2025 15:26:28 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/8] python3-setuptools-rust: upgrade 1.11.0 -> 1.11.1
Date: Sun,  1 Jun 2025 15:26:14 -0700
Message-ID: <a990e135dd90dfa0853d1d40822aff762161f5a1.1748816484.git.tim.orling@konsulko.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1748816484.git.tim.orling@konsulko.com>
References: <cover.1748816484.git.tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Jun 2025 22:26:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217679

From: Tim Orling <tim.orling@konsulko.com>

Comparing changes since 0.11.0:
https://github.com/PyO3/setuptools-rust/compare/v1.11.0...v1.11.1

Fixed
* Fix finding cargo artifacts when filenames are empty. #521

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...uptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.11.0.bb => python3-setuptools-rust_1.11.1.bb} (91%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
similarity index 91%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
index fd6ebf2f613..417ded009ec 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.11.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.11.1.bb
@@ -9,7 +9,7 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI[sha256sum] = "f765d66f3def6fdc85e1e6d889c6a812aea1430c8dadcf1c7b6779b45f874fb2"
+SRC_URI[sha256sum] = "7dabc4392252ced314b8050d63276e05fdc5d32398fc7d3cce1f6a6ac35b76c0"
 
 PYPI_PACKAGE = "setuptools_rust"
 UPSTREAM_CHECK_PYPI_PACKAGE = "${PYPI_PACKAGE}"
-- 
2.43.0


