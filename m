Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3927C88E5C
	for <webhook@archiver.kernel.org>; Wed, 16 Sep 2026 14:05:18 +0000 (UTC)
Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15890.1789567513872083338
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2026 07:05:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=RRTfiLah;
 spf=pass (domain: smile.fr, ip: 74.125.225.141, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so7638495e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 07:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1789567512; x=1790172312; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qC02JZ6z1JapbY0UR3wORvs+ZLaXm7DN94DQAx6YQA4=;
        b=RRTfiLahnXQ8AK6YZfflELSLiHt4o+VKmefAF4o6ThINHT+jB5JSYaHai1j7LWdiAe
         BHryPZpGOrM0HvdOc+hXBRh11PnSSHKzPRIP7zGhsp6ZYULtCGDwzTLC9CoOoNLVE1/D
         LwnxdZElNFg1/+/7zUTDmKw5UILvOnowKVPWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789567512; x=1790172312;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qC02JZ6z1JapbY0UR3wORvs+ZLaXm7DN94DQAx6YQA4=;
        b=cdGtTLK4XLOfZsvfRIF6WpZGeAkQdRg9neVqWNCLoa9ItTcmdTbSzTUIKlWr/Cpqqm
         FjBE+f58gNDc/9/R3yOPJLaBlDTN//nCfU9p9Jk47sYY6or+ZirnWuuFg3QMG+htc/CS
         DyYL5LzbzNIEURkWidovKCSycr6+8VL6hU3f+49PjycykIJecV2xDMKfhIP1TFb2pnVn
         Gc0q+MVikWBB9HAzhE9/QgHAibzTUtais6oYw0v30yOOG6zzgRGlLW5A5wwPX/4AYqQ5
         sWjfyabDAqItUTrwxzFyFYrKOmGdveBWzB50M/tynWWHCyVnsU77dsq+M8tlg2njnw46
         x3Tg==
X-Forwarded-Encrypted: i=1; AKwUvBxTCRXxIHrNSUhvA1az/SrnZx8poiqMB7XolfEdmO9i0okvFZa61FMR8MXEirwyGAq8/+aspUKW+kz+ZVjxX5/rBA==@lists.openembedded.org
X-Gm-Message-State: AFuF++ll+shkPAr/0KX9Bt0UqGsOiYytqHd1HmfmBCc98JNhJxQHDz6n
	TqobeUugM18OoJqoutJV54zDO3+FdNOb6UyzPCZSX0XVvBmjUMcqpCD/V/jnHDCjsUE=
X-Gm-Gg: AYBFou1vWwpDSBfk2s3a4Z17D9pvAj9aOwi2f+S2S2+MlrVMmJRwaifmFI4hzRU7Lvw
	mTr/e6FmSAg6rsARpP1ibt4MbALM6sWdB9+zKpmaGvykzpD0f94XXbtY2T9ydJrwdokz2y0QL0H
	wFg2yAjtGcu7QiT8quH8zDjTI/+3uGcSDGTOiIzNwX08aUNlRTqqOjyoEVkHQZUADiEcUttwO9z
	GNj/mYANMH2BeU+2cQ/oSfsxuk8udKt0HjsjJ0IzeOdv/4Owf16GXPJwHM32uhVLSvdrbnDUpDT
	wwH57gTHyvrRDBrg1GflOrtsOD+a0FWuz2Hx1HULfmfpsdjht+808K18rCIW9KZ9hDIilpesCVI
	KR7GXC5/y/xBHMAREDzATGEBQwGnJjD2HGhW1gEfz/kYfPJg+EWVP8+B5DoqRODriSyeTs8FFFz
	FaO4ZU5+iFhKTOGjR96/74qqQZiB8bJPqCYIv9i6yxVcRjJnXMqCpx/bwI+m9aAulFvgY5wIKa+
	3iM5M/mriDpB+Ua8D8TO7b391nrS4HLoOVVWVkoA2Y0vRs7WEff8L36utE=
X-Received: by 2002:a05:600c:698c:b0:49e:79c5:ee93 with SMTP id 5b1f17b1804b1-49eb731eccbmr30937445e9.8.1789567511923;
        Wed, 16 Sep 2026 07:05:11 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e83aead50sm91841185e9.7.2026.09.16.07.05.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2026 07:05:11 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 16 Sep 2026 16:05:11 +0200
Message-Id: <DLGSQL5WVBRG.2R6OMWQMQSRTS@smile.fr>
Subject: Re: [OE-core] [wrynose][PATCH 01/20] recipeutils: add optional
 stable_upgrade parameter to get_recipe_upgrade_status
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Chen Qi" <Qi.Chen@windriver.com>, "Antonin Godard"
 <antonin.godard@bootlin.com>, "Richard Purdie"
 <richard.purdie@linuxfoundation.org>
To: <daniel.turull@ericsson.com>, <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260902095920.2840293-1-daniel.turull@ericsson.com>
 <20260902095920.2840293-2-daniel.turull@ericsson.com>
In-Reply-To: <20260902095920.2840293-2-daniel.turull@ericsson.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2026 14:05:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245975

On Wed Sep 2, 2026 at 11:59 AM CEST, Daniel Turull via lists.openembedded.o=
rg wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> We want the ability to do stable version upgrades for recipes.
> To this end, add an optional stable_upgrade parameter to the
> get_recipe_upgrade_status function, which defaults to False and
> when enabled will try to get the latest stable version of the recipe.
>
> The UPSTREAM_STABLE_RELEASE_REGEX is respected. If a recipe sets
> it, it will be used as the filter_regex. If it's not set explicitly,
> it means that there's no stable updates or the recipe hasn't been
> checked yet.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 1ed8fdda035dcc21f3df71c0c996973224f4f683)
> Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
> ---
>  meta/lib/oe/recipeutils.py | 23 +++++++++++++++++------
>  1 file changed, 17 insertions(+), 6 deletions(-)
>
> diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
> index c6604f536d..7c1df518a8 100644
> --- a/meta/lib/oe/recipeutils.py
> +++ b/meta/lib/oe/recipeutils.py
> @@ -1009,7 +1009,7 @@ def get_recipe_pv_with_pfx_sfx(pv, uri_type):
> =20
>      return (pv, pfx, sfx)
> =20
> -def get_recipe_upstream_version(rd):
> +def get_recipe_upstream_version(rd, stable_upgrade):

I plan to backport the follow-up as well:
6f8ae1ecf38 (lib/oe/recipeutils: make stable_upgrade argument optional in g=
et_recipe_upstream_version(), 2026-06-08)

What do you think?

Thanks!
--=20
Yoann Congal
Smile ECS


