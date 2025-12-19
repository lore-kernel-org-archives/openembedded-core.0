Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B413D74952
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 03:23:26 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9488.1766114604286940987
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 19:23:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cEn/Mkdh;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7ba55660769so1127372b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 19:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766114603; x=1766719403; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zi8AX0obZedfX/IUsvOsHttUN4wDgmzAgedMbUjBU7M=;
        b=cEn/MkdhEPKf7GorBBusn0n/4SrkKl/HjOtdxDlxL1XlURgGeVxJ1DwTzhTS63i0SF
         9G5ANaoScshTHI7maIDjSzpZcZI7LE/Ir9tNsL+zt4UkJ1Qdhoxw7ah0TeOe+k1iiYHW
         a5GNnVqxu9QC7oIdkEurQ3GMJcsQGevqjO9iHh8x/IM4h3S1jSBC/YTL6jHpvOISE9Ef
         tCXhGlGR2SjjZLQJjwI74m8z5lkwjPZCnncy/sqElh5bN+nVvhV52w2mjSb88sllMMuQ
         xXyrWroFaJlY72FWEjefL41T0UyvNx2Davl+6OdydmAtPMCVqQ4qSolqn9EOqxyOJEwQ
         TaYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766114603; x=1766719403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zi8AX0obZedfX/IUsvOsHttUN4wDgmzAgedMbUjBU7M=;
        b=hD9VxtXjZ+5fDFYP8YLLA18xTSuiuTFphWfynGeZIh89r6CPzJurD2InISsexK2CBX
         RLo5vOVbsIXLGLc6QALPTgoV+kkFsoWQgbOHtj3fZQoxz0IK/LNxrP7XOlP0avIuIXhh
         mLrD77JKhzGffc6OLSvM9aBYlvGaGvoGo+CUlYiz7sjnrUdPGn10cSSHM3joRJP0Yv7Y
         lU448tcNZ+HGbEo4HOaUKDiszirRQpECvaNgHI+9EDMJCPKPfQvGTrahH6KBGAgw+rHy
         8k+xhPfZf0qSJXl6lqwKwx6MPiYOXmN6YJMxRaRK1Wv18Y33kgiNDN/v/p8PW8JqQTdr
         YkEA==
X-Gm-Message-State: AOJu0YwV98iTIEhMHMg2/P5fturHW2ZHbLy2ykT/hbPvsDxLabMTqHBD
	tClIaug1uS6Fv21CiII0GxaNTkRrF0ieWVDrM+sL88UW9b1fnyL8lzvmoEGezw==
X-Gm-Gg: AY/fxX6Pph3WDbAXiOwt21dIh2YBw54LAVASL12yyVZFPl1NSdG5jFGRzqQ0Jscc5jt
	eDraeyo/VoQBg9smONY1Sk8kMp7hQ1Nr8oQwfIB1d+lARmQiatYOnmecHbEng5aqAIwUN5xm4aL
	afihxn9K/9nAE9jgYRULkeItMZj/p33T8jPL4Nqf9Sy5bBeeTyvpxBe3gyacyVqM7qJ807tQgjM
	87BdAxcg1hrznoT0cBDbEy8wGT2qalwqPOirkBlwrYeeFTcHRtrI0kcWRszlWtXgZqSz8frzr43
	B66QRMFqSGU4JZaSybr1L3TjYXPcsUfNiius1cm/K7d96ZnWnk1LWHDDX7gC95wvraL4NP/H45m
	EhLXVw3eZMJp/YiDO0GlsTXVo8dRuMjVSFD5HqQwZfAc81iI9nlKqqQszltt6fZky3wIxm63E6x
	vXzA9jzOOfYOkUax/+T2GhBbkF
X-Google-Smtp-Source: AGHT+IFAFT/cX3aiyGx7p235Mty0nAiQ+VTuYbbpfEPoDdhg5MqwwNbTVNS42N+HVy0gTDCk4mlK+w==
X-Received: by 2002:a05:6a00:3021:b0:780:ed4f:e191 with SMTP id d2e1a72fcca58-7ff648edfe0mr1453074b3a.23.1766114603502;
        Thu, 18 Dec 2025 19:23:23 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7b12a7dasm753360b3a.22.2025.12.18.19.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 19:23:23 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Robert Yang <liezhi.yang@windriver.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][whinlatter][PATCH v2 25/29] ccache: 4.12.1 -> 4.12.2
Date: Fri, 19 Dec 2025 08:52:04 +0530
Message-ID: <20251219032209.960840-26-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
References: <20251219032209.960840-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 03:23:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228193

From: Robert Yang <liezhi.yang@windriver.com>

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c422df7d511fe76e7662968ab52eb26a72d55fea)
Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/ccache/{ccache_4.12.1.bb => ccache_4.12.2.bb} (93%)

diff --git a/meta/recipes-devtools/ccache/ccache_4.12.1.bb b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
similarity index 93%
rename from meta/recipes-devtools/ccache/ccache_4.12.1.bb
rename to meta/recipes-devtools/ccache/ccache_4.12.2.bb
index 2d0b83e244..28f36e5ed7 100644
--- a/meta/recipes-devtools/ccache/ccache_4.12.1.bb
+++ b/meta/recipes-devtools/ccache/ccache_4.12.2.bb
@@ -17,7 +17,7 @@ DEPENDS = "zstd fmt xxhash"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/${BP}.tar.gz"
 
-SRC_URI[sha256sum] = "a3da50ab0fb0d42f60c17d1450312e6ace9b681f6221cb77c8a09a845f9d760c"
+SRC_URI[sha256sum] = "2a087efb66b62d4c66d4eb276748bbfa797ff3bde20adf44c53e5a8b9f3679af"
 
 inherit cmake github-releases
 

