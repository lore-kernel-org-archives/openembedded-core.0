Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D60FB5E95
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 00:03:45 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.65249.1773705819819302877
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Mar 2026 17:03:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FMiAJmZV;
 spf=pass (domain: gmail.com, ip: 209.85.218.43, mailfrom: michalwsieron@gmail.com)
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b97b1012d14so39889766b.0
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Mar 2026 17:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773705818; x=1774310618; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r2iWER64NgngMX0nHNPl/9BKzVhKE6yhAUGRni8KcSI=;
        b=FMiAJmZVIZpR89+4RrXznJLYlQIEr0roX3vYskLpSH6GHjXo+Qboe2XPLTmRJc9xmk
         mEnXBmq11LgWLqu0W4V/vuW7Gusu8V1Ktqb4D89Mps+G3XzJAQXUKOb6MVJmZ/nhdhXI
         l9ZqpTWLG+KU34vWpss2f/FPiCOw/VJsZAZja/vC9wbdTeF+yV/1K6vA8lRNhV4r+Vpx
         DIaDw4fT0RevJ8+kvFuvX46s+hSiZohbtbYWC2CCYlNk/Ujxlaxu+zxf5dSAW3E0ZSR/
         FzOZxNfBo7lTkk5vJtjfB3kuAEtafHBFZZ/z43RGGo/Fv+muTVY+5tHnM+W2Ng88+Vhw
         Wbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773705818; x=1774310618;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=r2iWER64NgngMX0nHNPl/9BKzVhKE6yhAUGRni8KcSI=;
        b=CWu1WUiZkNcIeNPigaVzN5GhQg+SS/pBoeeFlbmz57T9ma3Bnrlmw3MnJQgwLPVimE
         Z5NU6TovxlGaYOamZR4gFr2VfLicCksQHbSgQeCFHrt9Rbr8ukIdJ0U/l6sWqQ9glgwu
         oczCaeWy5F1kgS8G5+NQnHql7M7TcKwgFe9rGxGuIpsd8tEhw5mrOY7xiCsAfKAX5KAJ
         R4kBIacDAxX0Pr9zOokozCP1LIzizQ5hlW08KDfsFk5Dwcn/r89ZEze9L46ofw/BhblW
         EhtjIxHnkHaygr5xckZVivfPSiHVIGiQjNnWhQFkZ+Ts3B3FiBCk4WE1gPY9heyYCLQv
         /hfQ==
X-Gm-Message-State: AOJu0YxneP7C5hN5ctZ+LD9nWVV4rV9uwsKVcUil7UvItELpFPJX2heZ
	DKk7oZZ/UxL1GfHPMATJEr4rLhw7LeLC9jQ+uFFYfx+boADEN/A/frOI
X-Gm-Gg: ATEYQzyhJTP13ABfcjcAxbw3z6wTSRR+Apd+2PgNL0LLgrB+sQurr+tzeZr2mroFGP4
	NaC8qJZdsQFJuCbUWtVe4cI9ZaagTW1eV0gvIf/2SghxSyOVsxU+0XfSo5JQzeQYJ2tQCLY7zac
	ZnEKBbCpLc7EeC0hiaz1gKTeTXQ2R9mr10YlSdXf/pV08GRwR3XtPP/dN3vmjLFG5JDAm8zpuZp
	AjNLdz+gB0TzdUGQGptnnZPA+408dKOfJSvhGS7iFk1DLazn8RYtt6T1jFeihyGDPJHH9A659uK
	Hd8PChDi4HWGr4d0sLcWNVf0XYLHI0CqErXdTvbgHua5xiQKf1+pxeYUg5u/fi1Wvtvm4rcGGAJ
	3/uSGnms+MFZuEfJVuSeIo/adeewiU89pemArmLrMUab27LEt6pXNu1lBYCCwc09jGvYCMhIv7G
	Ur60oijihvVcwtflJ8mdIBecl9BW6S43TOIcUbCtNfoEhLB6KIK+4MGJg=
X-Received: by 2002:a17:906:d54d:b0:b93:8275:795a with SMTP id a640c23a62f3a-b97d6d99d28mr89810466b.15.1773705817992;
        Mon, 16 Mar 2026 17:03:37 -0700 (PDT)
Received: from [127.0.1.1] (93-159-20-97.cgnat.inetia.pl. [93.159.20.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976cf49fa6sm654584766b.58.2026.03.16.17.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 17:03:37 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 01:03:11 +0100
Subject: [PATCH v2 07/12] pigz: Convert confusing append to override syntax
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v2-7-5c65ae5787d9@gmail.com>
References: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v2-0-5c65ae5787d9@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 00:03:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233280

In this case `PROVIDES:class-native +=` doesn't override the default
provide of ${PN} only because that one is `:prepend`ed and thus cannot
be overriden. To avoid any surprises in the future let's use
`:append:class-native =` syntax here.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-extended/pigz/pigz_2.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pigz/pigz_2.8.bb b/meta/recipes-extended/pigz/pigz_2.8.bb
index fcf0c93e41..d4640eddce 100644
--- a/meta/recipes-extended/pigz/pigz_2.8.bb
+++ b/meta/recipes-extended/pigz/pigz_2.8.bb
@@ -10,7 +10,7 @@ LIC_FILES_CHKSUM = "file://pigz.c;md5=9ae6dee8ceba9610596ed0ada493d142;beginline
 
 SRC_URI = "http://zlib.net/${BPN}/fossils/${BP}.tar.gz"
 SRC_URI[sha256sum] = "eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0"
-PROVIDES:class-native += "gzip-native"
+PROVIDES:append:class-native = " gzip-native"
 
 # Point this at the homepage in case /fossils/ isn't updated
 UPSTREAM_CHECK_URI = "http://zlib.net/${BPN}/"

-- 
2.53.0


