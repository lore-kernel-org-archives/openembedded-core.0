Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12113C55196
	for <webhook@archiver.kernel.org>; Fri, 20 Feb 2026 10:39:02 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35859.1771583933703682094
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Feb 2026 02:38:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bh9FReEp;
 spf=pass (domain: smile.fr, ip: 209.85.128.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4837907f535so17008075e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 02:38:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1771583932; x=1772188732; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Hmcd739KGJH9ETMgb999X2+VAno1ltskuSRIhheI+I=;
        b=bh9FReEpoaLwuYOvtCFTwwpAVlDA1I6Zvl4vbYl4Rrk8yzMKzpNWp0tBtUbgEun/NV
         s+F43TAIFlr0WY/w/T1EezY4ttzxIwgVhhP3faZ2bZVJCeJ3QJJEOtzqdvu99WsHUzn2
         5EfGJRzZdmiSiN5mizE6K70N2hOO0JU1fUHgc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771583932; x=1772188732;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Hmcd739KGJH9ETMgb999X2+VAno1ltskuSRIhheI+I=;
        b=Xd+F8lXzAIxXeyF8BC6Cno/DH9ap6h3yvet6Kkke787TcL/lW4/RunsFcxf5nvLVhO
         z4Z89IxC4Ysqs8nH17vDd5N/oZw52BdaXZdgMjj5RS1adqkRxO7YF9GNny6p8P3rD+lQ
         P1DLAY0/NBaTlhxjr2mXEo69WZRhk+xQ9qDZ1gb0TfccLxGRtfyGGK83HnjR5L1LJ2c4
         +niZiLToEvXMDGGJDoq4Zn7dKXUYONF+NroW5Xs1Zo/hnaFr81KiQU9PggJWsXVowX9P
         HxbAzyrfDmvNk4KwFeUJ+QNUeYFxZ9T6rocPHgfY/YE7hGB4SrHhIeAPwgoL9tlAdBkp
         FeZg==
X-Forwarded-Encrypted: i=1; AJvYcCXtuR6cuggXEe8SKsMJ21TG5GnKXRVePv2+Ghj8Rg7zkVL9Iu3IOdfZwhVgXwW3es4eKNHlS8V7HmY/GmH0KbrHTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6ki+T+NNoGgse0SDr14owTdYeHIvtKPemtXUJ1HjtFHIRvJ9j
	wjAbVsfRD7gLf3wppx/E1wbtB/KiH3UIK7PtxGTLF7HzoacvUxrVfV7rt0/dhmQt12w=
X-Gm-Gg: AZuq6aKrmb5HYDIfFEETiSlw4NLXm0364YS+JVPDTk+Sc8bcMmIi8DEq6EoZ29AUP7y
	Zy/4pdCYbmMszfkAqL3sS+oiwft5c/Onh+2VZY+ZpE/8hbTpkQExc0n9YvaVtQzTkAZgOcxp5Rq
	bPNbkqNln057a547XUfeDg+heZk+ParjlzyZokr7ePlt5Tf3AghupKQL8d9z936KShMatBY1Sod
	2CksfrzKtJfcfvVPNOz4oitqIN25xV78GJLQXZZqzL4mCP8qnKS9epPrSA7/qz/jw4j3UCk05Di
	XRC5Knid/goTukyxNRfnCCQBaTLv8EscopKPG4+67fClYRDkZsG7cEcOEUl5Kw5SEeXxqzxJgRi
	eLF7S+rQJ+8skNWYQiJhYTeVEPfLvLEMd3SDFWZHuRtVBTILBpzO9Ta/vKH8fUcWqPiMORIlW+u
	bQVT6V46EvlsUTTu5Xf7uvuZpQjRdvnD4hy4Z7Es0+W6T9NFhCn+DYQ6nXUQLbE3Q/vuS7WpBzD
	AxnSSKUnBTdOCDx
X-Received: by 2002:a05:600c:3e0d:b0:477:7b16:5f9f with SMTP id 5b1f17b1804b1-48379be7576mr363692155e9.31.1771583932011;
        Fri, 20 Feb 2026 02:38:52 -0800 (PST)
Received: from localhost (2a01cb001331aa00a792cb868d374456.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a792:cb86:8d37:4456])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796ad0166sm55855714f8f.35.2026.02.20.02.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:38:51 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 11:38:51 +0100
Message-Id: <DGJQ3AMFGIWX.34CKNI3RZFQUL@smile.fr>
To: <vanusuri@mvista.com>, <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][scarthgap][patch] bind: Upgrade 9.18.41 -> 9.18.44
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20260212143013.75735-1-vanusuri@mvista.com>
In-Reply-To: <20260212143013.75735-1-vanusuri@mvista.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Feb 2026 10:39:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231507

On Thu Feb 12, 2026 at 3:30 PM CET, Vijay Anusuri via lists.openembedded.or=
g wrote:
> This upgrade fixes CVE-2025-13878

As far as I can tell, this CVE does impact whinlatter, can you send the
upgrade for it?

Thanks!

> Changelog
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://downloads.isc.org/isc/bind9/9.18.44/doc/arm/html/notes.html
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../bind/{bind_9.18.41.bb =3D> bind_9.18.44.bb}                   | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-connectivity/bind/{bind_9.18.41.bb =3D> bind_9.18.44=
.bb} (97%)
>
> diff --git a/meta/recipes-connectivity/bind/bind_9.18.41.bb b/meta/recipe=
s-connectivity/bind/bind_9.18.44.bb
> similarity index 97%
> rename from meta/recipes-connectivity/bind/bind_9.18.41.bb
> rename to meta/recipes-connectivity/bind/bind_9.18.44.bb
> index a83ec29bb4..d424edcb4e 100644
> --- a/meta/recipes-connectivity/bind/bind_9.18.41.bb
> +++ b/meta/recipes-connectivity/bind/bind_9.18.44.bb
> @@ -20,7 +20,7 @@ SRC_URI =3D "https://ftp.isc.org/isc/bind9/${PV}/${BPN}=
-${PV}.tar.xz \
>             file://0001-avoid-start-failure-with-bind-user.patch \
>             "
> =20
> -SRC_URI[sha256sum] =3D "6ddc1d981511c4da0b203b0513af131e5d15e5f1c2611457=
36fe1f35dd1fe79d"
> +SRC_URI[sha256sum] =3D "81f5035a25c576af1a93f0061cf70bde6d00a0c7bd1274ab=
f73f5b5389a6f82d"
> =20
>  UPSTREAM_CHECK_URI =3D "https://ftp.isc.org/isc/bind9/"
>  # follow the ESV versions divisible by 2


--=20
Yoann Congal
Smile ECS


