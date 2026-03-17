Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77AB9FF6E60
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:23 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86394.1773779360653027590
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AI9Ff8VM;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6676d55d01dso1137942a12.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779359; x=1774384159; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSLrK9Z6Zrm7ayuP10b2zgv/PdH+18SB29ONY9griL8=;
        b=AI9Ff8VMb2IfeocvPz1WUdHlRazt9BI6YGZk1S8jbG1tC+iuISL/4aZi9hWACVyxhE
         ymzwGMLni9/cccdYogN/lXv7sP1STFXI5asmsWN4/KQV/w+YvuYrDH+obuDka4gnR4Ct
         Bz8hu/w9i/teMEZSpPvDw/Qy0uZKHeXGZDu3Lr12tkgAmNCfKqL6/jV9BGN2A7i4OWY1
         6zOI1fvna/M7MkbbnJBKGsalycem/f+1Nn5qX2LV/69FGltMfkUG9Yh5W3/QDM59sjKE
         jhg0cLANkI34ctxu0g5BO7JDUe1JZx7LQcRMqHApN5h/XRoXNsHawpxvgFMez1UNK9ZL
         F3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779359; x=1774384159;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WSLrK9Z6Zrm7ayuP10b2zgv/PdH+18SB29ONY9griL8=;
        b=dDvLDpVEHPoNs2afJZrDh1AIkTL2+0eqGiZURfQ1dp9P+jH1OdAZn04iX1UxS2xFHz
         FoidD37deZECViNYvljkFpN/tT6cZVdW7rK2AanhlP4kptIh9VJPArpzJUiwzngUWAFB
         xpu43d5iaamqj5lCDY/t4N6IzpSogCeF8WwjM0j2xVhTgYiUk5KSFxb/T+QE2GTOZMHq
         NY98qourUTmoTIHhHQVPLTO4EacErLhftDWCv2oV2IQqwyK9013BR+AGhOaiVk6Fzkl2
         SNjmrS7FSeNZx8hozVedU/kf/YKIfD9IsTp1PaU1j27THqiHZyZkjpAwGHZMxvxI1+Nw
         yaCw==
X-Gm-Message-State: AOJu0YzWuDngaAPit+SdENU55rDHnhoML2IdFMfVTTnj77mTrtnGzAaV
	dM9C4Eny1xzkrGUoBDe6U6uOdj6AwJJMw7/3giMFw0O8XGyj+4xRN0eZ
X-Gm-Gg: ATEYQzxJdPDVgsRULgJyaTMqf045QVGuRywjMkweUmUtIiMbaleucxnLsuH+n4wwgkl
	kSplImEDFKTywtOEuxoQ53piOlnLMNdeyAdr4jy5N90uSJiuqd2ciVmpG9WoK+GBD/HjRG90RDz
	6hDcVJhAxaTg04VO5aE4Am/SGp8RUWwwgzpwfz02qXQUEecMdFEZLhzZKfQgbQZOfsCyUJfc3ya
	6UD/urGHz/RYPeW/l/BoUjESmk8ODaIx0zQgeHam7zPALa8ZDl/vruDERBO1Td5bXoA72oek8fx
	fhWtVRP2CFd8rfTuFlqWmSgDkoJ/VIV9Rxq/iP/72RZu53/jMFjpls3Z578BQRyHMalXIE+IVnA
	qJe4x6uHiofPB1lTsPa2EHq3hVtoGl+ZHksdBx4NRqYSwNY/eFAhRcV7XPoeYIKbqMA8e9i8Xp2
	ulDht+m4Jztw9G0HFXpK373UJpnvGNfaVm2nwuhk4eyw+iUbqPWjRg8BRGzBA5vrg=
X-Received: by 2002:a05:6402:268c:b0:667:5336:6b86 with SMTP id 4fb4d7f45d1cf-667b18806c2mr741008a12.5.1773779358894;
        Tue, 17 Mar 2026 13:29:18 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:18 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:02 +0100
Subject: [PATCH v3 03/13] expat: Convert confusing append to assignment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-3-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233338

This is the only assignment to EXTRA_OECMAKE in this recipe, so using
`+=`, especially to a variable with an override can be confusing. Let's
avoid that and use explicit assignment.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/expat/expat_2.7.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/expat/expat_2.7.4.bb b/meta/recipes-core/expat/expat_2.7.4.bb
index 95a1ed52c4..a464f7c703 100644
--- a/meta/recipes-core/expat/expat_2.7.4.bb
+++ b/meta/recipes-core/expat/expat_2.7.4.bb
@@ -17,7 +17,7 @@ UPSTREAM_CHECK_REGEX = "releases/tag/R_(?P<pver>.+)"
 
 SRC_URI[sha256sum] = "e6af11b01e32e5ef64906a5cca8809eabc4beb7ff2f9a0e6aabbd42e825135d0"
 
-EXTRA_OECMAKE:class-native += "-DEXPAT_BUILD_DOCS=OFF"
+EXTRA_OECMAKE:class-native = "-DEXPAT_BUILD_DOCS=OFF"
 
 RDEPENDS:${PN}-ptest += "bash"
 

-- 
2.53.0


