Return-Path: <michalwsieron@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CC5FF6E6E
	for <webhook@archiver.kernel.org>; Tue, 17 Mar 2026 20:29:35 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.86402.1773779368307666347
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Mar 2026 13:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=c66I+cDR;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: michalwsieron@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-660dcafc85aso145020a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 13:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773779366; x=1774384166; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ICspnqCZVwH/wFlPh9dv77GKF8G9FGcjQkvbMTZ9WAc=;
        b=c66I+cDRY2zVVqPncVymLB15XyMJ7Y+IZbrP/RTr78zazZnmtGx1gEWsjFwdvniNyO
         lwdceIdf1kPRVSRvybXg1srE/lB/4qDrLHW8kABi1K0mPw6l5DfttCNWpG7LCem0c4dx
         yXxJ1pVWTUkuRWWaNT/NjdGOI+VPofwZU9J7jLjKshMCvyW6WTZ1To77BVebcW+gfjqY
         x5+SgFoyrjFHR4GXTqZaWHX8w4d7ELz6FSyFHfjYLvYrchhbMnVaXzyglQbIEv33a1Ei
         PpLlXIXPBjMf8RyHKmfr2Otk3eUEyYp3ylBv+0g924O2QzIDjwU7ypa+BGEVCHz0RaFw
         L7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773779366; x=1774384166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ICspnqCZVwH/wFlPh9dv77GKF8G9FGcjQkvbMTZ9WAc=;
        b=pjgTLN/ixzy4NFz6dJVNY/ii3TBie/ZdhyZoETV5llALFfPX/fNZQpmHC0M170a2fv
         wZxabg3AJVqE8dCEXnazO8lKdUbcjLtsKG6SwEUylWA4as+oM9LH0p4nEWlobi99X3Ot
         XIppJeAHs/YaAU3AcTiUrS7GBX4Zg6c1xjFKrOaBLSivZVGLjNhAhFgbGkV97wOSIPGm
         JixZPjqpiTwAH0M/f6ehBMJEm47yyejmrvUf/KsNP8+adnUUpRC30y7AzJaSjwB2Dstx
         gU7XQ3aJ0Qpn5vuUTQNsM2lhgXyxaF9ZwtrdCta7qpgUXkidKgDOzgdf4P0knwCPX1Cf
         AVPQ==
X-Gm-Message-State: AOJu0YwPE1eC85ekIZdCH214nADmAhiN5c9vyRiY8UP2D+CmdzZkXbqm
	LtYmvMCEuob7kia26KpVQ4CjHeDOjzpTADoLRxy40PhD4ZxISZWSBPNzwo6fNg==
X-Gm-Gg: ATEYQzy9e5btvKprmiKwoIH4hayaXKVsZsaIqFIiQdsDD+FMR3VUaY0mmrBgs53xFAf
	UciowvRT1wA9Aw+C9VDQe6k3wil/CxiO9k2h4vgrLOzrqbugDYMPb4eFSYUVy8OfMi5SuzqWXf3
	EaMp5xcESFaZPvKvFnUI99qXIJBReam0kfm7WJOsoPsXaQSlyYRs51RNX1aSgX2mZ+UbSVTr4It
	f/LiTDRlphQ1FwkdeuHys8BkUtSFZG3GnPsy7fYcXRsUTPe9ei+Uf+yRP1dW46ZN26B/pwGHmaq
	HUUCMXwdKRXPauFKVP6IzMuxrgOin7yBDR91Z4e9OnaawKSorKQ2u0igN+02NRlRkUYTA9FHjMx
	SH9e4f0omjUOK/TsROdPcHsIVYxYN0RCvB2Wt3yUrQimkbs2xKcaQOqi1xGlZAgPdlNC98tCi8M
	CccTe3nBqfImApQ3ZgiUNaDxMTXnRw1DWWqwkGQj/kepfnUpmtq+LkiBwzqUFaIu4=
X-Received: by 2002:a05:6402:84f:b0:665:33eb:22f3 with SMTP id 4fb4d7f45d1cf-667b2342723mr738969a12.8.1773779366515;
        Tue, 17 Mar 2026 13:29:26 -0700 (PDT)
Received: from [127.0.1.1] (185-164-141-154.cgnat.inetia.pl. [185.164.141.154])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-667b0eb9c02sm451909a12.19.2026.03.17.13.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 13:29:26 -0700 (PDT)
From: Michal Sieron <michalwsieron@gmail.com>
Date: Tue, 17 Mar 2026 21:29:12 +0100
Subject: [PATCH v3 13/13] musl-locales: Fix locale-base-sr-sr typo
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260317-fix-invalid-appends-v3-13-59452f073f31@gmail.com>
References: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
In-Reply-To: <20260317-fix-invalid-appends-v3-0-59452f073f31@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Michal Sieron <michalwsieron@gmail.com>
X-Mailer: b4 0.14.3
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Mar 2026 20:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233348

Package name is locale-base-sr->>rs<<.

Signed-off-by: Michal Sieron <michalwsieron@gmail.com>
---
 meta/recipes-core/musl/musl-locales_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl-locales_git.bb b/meta/recipes-core/musl/musl-locales_git.bb
index 3573a32062..f8369509e7 100644
--- a/meta/recipes-core/musl/musl-locales_git.bb
+++ b/meta/recipes-core/musl/musl-locales_git.bb
@@ -96,7 +96,7 @@ RRECOMMENDS:locale-base-nb-no += "${PN}"
 RRECOMMENDS:locale-base-nl-nl += "${PN}"
 RRECOMMENDS:locale-base-pt-br += "${PN}"
 RRECOMMENDS:locale-base-ru-ru += "${PN}"
-RRECOMMENDS:locale-base-sr-sr += "${PN}"
+RRECOMMENDS:locale-base-sr-rs += "${PN}"
 RRECOMMENDS:locale-base-sv-se += "${PN}"
 
 UPSTREAM_CHECK_COMMITS = "1"

-- 
2.53.0


