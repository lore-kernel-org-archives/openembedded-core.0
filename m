Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCB4E77197
	for <webhook@archiver.kernel.org>; Thu,  2 Jan 2025 09:41:37 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.5204.1735810887524862453
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Jan 2025 01:41:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=MaR5/ve5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4361dc6322fso73206445e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 01:41:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1735810885; x=1736415685; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUU4lqxxnhaTFM3RwUmmZVnrgfs0iqabOxmTG02hVSw=;
        b=MaR5/ve5oz6YmAU5PDlkju/aFL6VRHO32tSv5e6uKhwTf77k84YUgHl182plZyMFz5
         Pk07CnnM1RMkIcUf9iE8BWWi/dvLTwQFyYI6l5LldegAlDdWmxb5NHNFqHx/rHrFUvZU
         iR/FVeSTyTgCycm0t9TVz5CVuWbJhJPm3PB4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735810885; x=1736415685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xUU4lqxxnhaTFM3RwUmmZVnrgfs0iqabOxmTG02hVSw=;
        b=Ds7VqMIfzup7PkItthRiJLkKXCg/8cpNQ38oFDmg20Z3AAsA1rXPCOd32zh1JMlTpr
         pHeJeb4EN2U3j6cJtf8INMEoZ05cKSjeJueO5WJ3Zx935qoulrJs8CCJ7v88q6nG60na
         q+t2SKn68O8tt2N4m022FyB/pKYzJgTfFCoNstqOIIZ9RiAsUbBWYTUvY4UCK8fPxYkr
         MeAsIQyUV3+oIHG07E8TZsC3iTHUzgmROnW6CsZN1X0JBZrjf9bEY9UtFUFl/WMMovXV
         5JhpWxzgdsPArpY3OVELh1pdLI38XQWy6SA4Y8dPd1hBAuNsGkjLWW8L/4rAXdfY+Zui
         Ppug==
X-Gm-Message-State: AOJu0YyqOquPudltjFnmnXNqaMjX5hLfyLuKaROAXQ/sSpv8WRv8RnX9
	ZuoQQNRpnMq07jTQBNDRWDsAZXIpYhgimdVzYFO8hYOEDMXXdpJ1rw3D4TklmwI2kBO0XTApxje
	+bnU=
X-Gm-Gg: ASbGncts3huOaqLjhscRG3/E+ONDinBbIBPBBf5AWSsw5ZykzcCJVdncDBghbrVt0vy
	6khZ4nR1yDp+N/3reHEsHfERVKxSe/hyqoNHe6ZAP8V90R0LOIo9k9+kGFwYX0MPnOZZPJXz6mI
	JeuEf8bT2HETAH8Dyxa/+8SzJJxuvhsGWO6UoKHlrk3Jnp4W+zctAyoqI4K5+0IJb5WoutjymPb
	+3mpWlq4XtUwPJtMsUtv0Mj4wm71eMa3XEltinZwqkTbxa9hNo9C80Ug7MDG5MVtvtBNRF5KQpI
	a/5FAGrlAg==
X-Google-Smtp-Source: AGHT+IFes2C/YKs4yoC7agd+vUP73kP/FQ2cZ7N2haiVYnAjuHfUi8gMiemiHM7546cTmGaP4hcSZg==
X-Received: by 2002:a05:600c:470a:b0:434:e9ee:c1e with SMTP id 5b1f17b1804b1-43668b7a33dmr412762945e9.31.1735810885390;
        Thu, 02 Jan 2025 01:41:25 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:ae2e:9f02:55c2:739d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43656b119ccsm479785625e9.24.2025.01.02.01.41.24
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 01:41:24 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 17/21] python3-pyparsing: upgrade 3.2.0 -> 3.2.1
Date: Thu,  2 Jan 2025 09:40:48 +0000
Message-ID: <20250102094059.322187-17-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
References: <20250102094059.322187-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Jan 2025 09:41:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209277

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../{python3-pyparsing_3.2.0.bb => python3-pyparsing_3.2.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyparsing_3.2.0.bb => python3-pyparsing_3.2.1.bb} (90%)

diff --git a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb b/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
similarity index 90%
rename from meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
rename to meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
index f1be9debbc2..ab4eba129a1 100644
--- a/meta/recipes-devtools/python/python3-pyparsing_3.2.0.bb
+++ b/meta/recipes-devtools/python/python3-pyparsing_3.2.1.bb
@@ -10,7 +10,7 @@ BUGTRACKER = "https://github.com/pyparsing/pyparsing/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=657a566233888513e1f07ba13e2f47f1"
 
-SRC_URI[sha256sum] = "cbf74e27246d595d9a74b186b810f6fbb86726dbf3b9532efb343f6d7294fe9c"
+SRC_URI[sha256sum] = "61980854fd66de3a90028d679a954d5f2623e83144b5afe5ee86f43d762e5f0a"
 
 inherit pypi python_flit_core
 

