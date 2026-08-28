Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08859C61DB9
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 11:00:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3840.1787914807842175688
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Aug 2026 04:00:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Bf73CMjR;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-49b8687630fso5485705e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 04:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787914806; x=1788519606; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tywg5UYu5zzCvr4ouOsrAz6Ulsqfg/MsZQi70F6xBQ4=;
        b=Bf73CMjR1OAxwx6ciD3DRmwLpvE4ebRet09axo2SDhzpxI4YEbdJIwdL1RWA09+wUm
         jfBaQ4rt3ngjSV8/E1D2TK76XN71GigKLtIcpHBcHLJPunUf6rwMZibE3hApPiaPxCxh
         5XtFx1MJf5WziS9NGYTRfzWE+tDL5iQHFsxyU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787914806; x=1788519606;
        h=in-reply-to:references:to:from:subject:message-id:date:content-type
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tywg5UYu5zzCvr4ouOsrAz6Ulsqfg/MsZQi70F6xBQ4=;
        b=TY/IGz92Kk8gRP4iReKlQWvZyuZ9h5/DEvdobzrrQk5RmCVs675qw361KFd7s89Z1h
         lIY1tq1+425yyug44nWO3wh+iDhBwOkHYyBHTKdI948k2quNwutYApmH1pp5TvbtoBbL
         n22J34KK6dIDX/Pn/Zjla91Kl9J0KnovvFyznsGjbATbs5s60D4X250+Gz6OzagaONH8
         r6WiXE5WCPUFkRn9Gnssy3GueQYayoNdRv7J1Wy41K4qo86rKzip92jiItkuPh8hr7xi
         fpT2I4JCEe9IPrDD4EgyJQLfToX5zcdMpS8Xc9Mm57YMVeN5uh+DbyCQrflu/aLoiNKe
         tCPg==
X-Forwarded-Encrypted: i=1; AHgh+RpKxV/Sx19u6jm2ydIPSUG/EKfJcPaIL3CqcZe9bDUy/nWMGctK7FnVlA3uD6EwkwL+0LhE3WibRcmwDEDQa0jerw==@lists.openembedded.org
X-Gm-Message-State: AFuF++m/OYfsJ8uFjyGArNWJ2eQQ7ee7Az0fYOsMvENh65X7/nKiSrkk
	6tVIUxGtl37Mw5ti4LYHJyVAHrZYTvxsS9JssAMU++sMWh5VC66KAo9vCZQf7w8y/kGtKkXMqCM
	x5uqiQcA=
X-Gm-Gg: AR+sD110M2T8DcfOpeemnMk05Kz9GswX85gOq6ps5lE7pPGC3DtyQaCVj6jBDZL56AZ
	44dnh1eEjr+e3IVEyctfExRPmX/At/VgG5pqGwwJH7VNbGNZ6GqOHU9vM1mcRFEdC+ap2QqORxm
	waFKXQPzIYE26vObBwiqBzpUZY6I/gaEMtRQ8y8GLY+SNwhZf6EjiDrljEdCcTYdI8IkhJmkYp1
	19bH6c3XYwvXOjanBnwtAUF3ytD0KV2eXsa1Vzn9OiruLyuB9/yyIv8mslG8bmugjWsH+moUn1P
	BSFu7YoA76K6JuWchDHeND7hYXDQOQtv1sb5GLq0J+q7E2tdTaEn7B6gDR0iCK/Iw2SIarBWADQ
	LPL8vlRHbVgVwlXB2bygmddAkqcGfc2jE+T34Xi5DwbcfredCvk2KSYMo4BtgaMsXUSVz714Ilo
	jUAhfGrhW4cyT1lSK7AucA8YYcpXWIvOxDH9mwTqGsZXaSUA3F3rT2JLFerATyOugVzP+xYTouh
	cgSHsKTqftw2TX/nHBWokkBBf8Vw0pxG8+040M26MMyO+1RyRCvhw==
X-Received: by 2002:a05:600c:858b:b0:49b:928a:3f9e with SMTP id 5b1f17b1804b1-49b928a4006mr55199965e9.5.1787914805935;
        Fri, 28 Aug 2026 04:00:05 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49c44feb966sm18955685e9.6.2026.08.28.04.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 04:00:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Aug 2026 13:00:04 +0200
Message-Id: <DL0IWIE8CAAI.187JTOKG1O68N@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 4/6] libxml2: upgrade 2.15.2 ->
 2.15.3
From: "Yoann Congal" <yoann.congal@smile.fr>
To: <peter.marko@siemens.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260804200356.2093270-1-peter.marko@siemens.com>
 <20260804200356.2093270-4-peter.marko@siemens.com>
In-Reply-To: <20260804200356.2093270-4-peter.marko@siemens.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 11:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244532

On Tue Aug 4, 2026 at 10:03 PM CEST, Peter Marko via lists.openembedded.org=
 wrote:
> From: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (From OE-Core rev: fd9928e49da740d11f402e13b00cf5401c81d5cd)

Hello Peter,

I really appreciate that you took the time to add the changelog, that
helps me.
>
> Release Notes:
> * https://gitlab.gnome.org/GNOME/libxml2/-/releases/v2.13.3

But in this case, the URL and below changelog are wrong (2.13.3 vs
2.15.3)

I've fixed it in my branch.

>   * Security
>     * [CVE-2024-40896] Fix XXE protection in downstream code
>   * Regressions
>     * autotools: Use AC_CHECK_DECL to check for getentropy
>     * xinclude: Fix fallback for text includes
>     * io: Don't call getcwd in xmlParserGetDirectory
>     * io: Fix return value of xmlFileRead
>     * parser: Fix error return of xmlParseBalancedChunkMemory
>   * Improvements
>     * xinclude: Set error handler when parsing text
>     * Undeprecate xmlKeepBlanksDefault
>
> Signed-off-by: Peter Marko <peter.marko@siemens.com>
> ---
>  ...ake-Fix-installation-directories-in-libxml2.patch | 12 ++++++------
>  meta/recipes-core/libxml/libxml2/install-tests.patch |  9 +++------
>  .../libxml/{libxml2_2.15.2.bb =3D> libxml2_2.15.3.bb}  |  2 +-
>  3 files changed, 10 insertions(+), 13 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.15.2.bb =3D> libxml2_2.15.3.b=
b} (97%)
>

Thanks!
--=20
Yoann Congal
Smile ECS


