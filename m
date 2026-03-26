Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B168610A88FF
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 18:15:01 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54429.1774548898410202772
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 11:14:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BAk9BOj7;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so10211385e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774548897; x=1775153697; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyG7IADqW/LWqpg0IJEFGrw/gJdTlkod5Hzjd0IlyDI=;
        b=BAk9BOj7BjROviplwPa8SW8fjA0q0kJQhS5InU2oC/ROcv0xdN3MVdGULmeomrJoSi
         6ahchmOzJsYl+YTPnR3CT8TGbF5TxOwq4f4+zbnvK1IuO/taGFZZ5V3zChUYSr54NPR1
         BXBJqwnJXn+ROQs1y+81r/YwtIUvbEIKZGCSmZh9phEn43F+SAphAYcC3Im10yR3Q4D7
         SxEjcCt+I5m8ifaDiW9hSuaoXW5Ylh1q9XG/d1zNs8nvQbUjnCG71+PXHLYhyRJJKnZK
         cyP2GWSPUQH+CbtZj5nrYHLK3lPCoAXe8LynxpdTnRgBTtwO/TtLJCen9Qb8S+/iAN4M
         q2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774548897; x=1775153697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WyG7IADqW/LWqpg0IJEFGrw/gJdTlkod5Hzjd0IlyDI=;
        b=NU1HYfFUAf4xvDXhBlCQ3hzitMZktgOals77aRUKQ08r+FhWEXZVbOKNyXbZsKv7Iy
         9RfzPJEyz26hXgvDNv5XTG2ENbT5SeuvouUyq44BnCxopExMY2MNai6cBlcvGpHtVP23
         k4uXlms36IGszwwnqjydcWZfUYuiLKgM/J29BvilWcxE6ZDZwWACRvucDfo67N/tqnU/
         DssodyPyurCvjm0LQjnMlG2+CKhfGQIaHSim8d1U+Sc4hZklu3kapSDCagi5KD84THgZ
         DBxW0scIt2XRUP0wgh8P0svqNM005IQa11+VEVQIT7F/QZT0fbt4a7dL7j/P9YFobRIc
         q9uw==
X-Gm-Message-State: AOJu0YxqRCPtdOTQilOqZUntQVRkVcTiJi2ZMmmDbVHUaTnNALnPU5fN
	OdMWvGF53VcZew4SxCcB+BFLC/l+6noffhXgaVr6rZd/GCVAfyL5/RLOSFtjCd1l
X-Gm-Gg: ATEYQzz8WEm+kC636ocClT/V/HVTelSF4MR0N89HZRCKPcgQf6kbioVM9GGaHi7Ttr8
	CGTYUVOapVuGVOQ+ThyQTlBJeB/c1xOUmuil/ZqMAo+e9SomCsgKrtr7z9a4cbXWnEKkfkKhQ6v
	crIqe9VPQHJrFAfduEaGNY4UUXMIK8FcuXJn+ymnzAGP5yJ55HpvZBNbK9J00J0Rd+ZuSEojjht
	lXG9oxdzjVXLdwl9o+QJd3Zw7t5yAyNeMVS7YDuGAA5WLqJLvlQd6Nc3OHMQ8DHmVGbOaMqqild
	gJ3SfssDiIxEoWUh4VsrMG1Shpr0ltAX6+6vjNCn/PxoxinDDKM3Aw86ZPPgOjkN+aOmCw4jYG4
	wdC0nUsdXAji2kQTSmR3remztDCkBEfTSTMMchLGnMDwGw/p7mQ/UjU/15tsWkp8p9JVxdS7pEv
	1gtUKUeHTpFjUgRlJgcvTRYRwwHg==
X-Received: by 2002:a05:600c:c0cd:b0:480:6bef:63a0 with SMTP id 5b1f17b1804b1-48716031822mr93102525e9.21.1774548896677;
        Thu, 26 Mar 2026 11:14:56 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722cb10fcsm43644315e9.14.2026.03.26.11.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 11:14:56 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH 2/6] pseudo: Add fix for glibc 2.43
Date: Thu, 26 Mar 2026 19:14:46 +0100
Message-ID: <20260326181450.1262870-2-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260326181450.1262870-1-martin.jansa@gmail.com>
References: <20260326181450.1262870-1-martin.jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 18:15:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234036

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Update to add a fix for a function definition to work with glibc 2.43.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/pseudo/pseudo_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/pseudo/pseudo_git.bb b/meta/recipes-devtools/pseudo/pseudo_git.bb
index 0f063f1881..3ae560487b 100644
--- a/meta/recipes-devtools/pseudo/pseudo_git.bb
+++ b/meta/recipes-devtools/pseudo/pseudo_git.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-nativesdk = " \
     file://older-glibc-symbols.patch"
 SRC_URI[prebuilt.sha256sum] = "ed9f456856e9d86359f169f46a70ad7be4190d6040282b84c8d97b99072485aa"
 
-SRCREV = "43cbd8fb4914328094ccdb4bb827d74b1bac2046"
+SRCREV = "56e1f8df4761da60e41812fc32b1de797d1765e9"
 S = "${WORKDIR}/git"
 PV = "1.9.3+git"
 

