Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8C0C3DA63
	for <webhook@archiver.kernel.org>; Tue, 23 Jul 2024 14:33:02 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.45347.1721745174610914822
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jul 2024 07:32:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NeGgByiw;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-427b1d4da32so27522315e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 07:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721745173; x=1722349973; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wQRoTmOfNDqY+Fc3sQKB2cYpMHod3wKvqZyPzZUVv5A=;
        b=NeGgByiwRM/gJsVF2UdFEM2BC93RlRWUqQXfOPQyI4H3BPVgKfifBow75q9Md5PIBI
         +qSu6362hDkejNncYKJyQTARGj6Cj/aqiVtSmB68/rLBfefN6G2X+wbmPu3vAdRhY18+
         jbsaL5/xfIys0HDVOYUmkFpwAYq48n7wDVsNDwSgPUl7dxNeuhyO7PaN8UrnMTR0oMOo
         pxw4dmhe/B8g7tle/J8tj+218Njm0aWOm1WyceeGNUntDCF/VIUIjfMej1/hH0hsuEA9
         rArLOC6CsGprBn6juePAVNeUHw+Bazbcz3n0UKx11a4tAOXh+HcXcBvU/Api4DyNIzPa
         ZMbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721745173; x=1722349973;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wQRoTmOfNDqY+Fc3sQKB2cYpMHod3wKvqZyPzZUVv5A=;
        b=AwxUqJztOn0gGxJWcF5mhVapmtupjSLa5yYrLWBI3bfmvwOAB4Je1K11rwPqTvsF3G
         gkGSApFPl5fbJhln0ZTUjTLiZa7prHch2v2A0D78ZTm/oEmPpLZeYNXkwlAKfc35ZTUD
         s/6WbA9ZWLCbRz4oWsX7hs0TUgCPZLs33Rbo2/klXdmObnTtXEoCPwh7AOlkJ+dZO+ML
         T1SU2v8k+jbpERgnxP5rbRXgNbpWXRZNSfPWBnmU6Te/qvYd2kfSKUz0UWwPeKEgIXpg
         0DoAhThMKyYSktS17Wu1LHL6cTLKVbcWGJB1DonMWYOuHbGwz9Hf0XUEnCfnoKt0D56z
         czyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXkmQ3+9PQ0rfLIxuk6ja7KIBrJFdLNs/cHH+KsZzevzmOqLpl1VM3LPSNSrWXDdOSbP/y5pzBCaxgStJXLfQTtqAaCaOindMlIgk+GFvnukD24Ew1qv70
X-Gm-Message-State: AOJu0Ywif5rCR0+YPFSTINaw0+0prQqEwWBugrkUhe/sSZXYMwbh8FWJ
	3O/uYblioQdlYt1gi7SxG4k32xYdj16zrtByefSOF8gAaeF1xJBJ
X-Google-Smtp-Source: AGHT+IF27WJheAHXBf7FAgj3gfHxI9arQxyvp++XvM6IXqsDPrNPuLrM+5I6idH5pt1ptyWDOucnUg==
X-Received: by 2002:a05:600c:45c9:b0:427:aab7:976b with SMTP id 5b1f17b1804b1-427ef32e4f7mr17492035e9.5.1721745172443;
        Tue, 23 Jul 2024 07:32:52 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d68f789csm176932035e9.6.2024.07.23.07.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jul 2024 07:32:52 -0700 (PDT)
Message-ID: <f038c7ff-ecbb-4cbb-a1c5-5712d1e4e985@gmail.com>
Date: Tue, 23 Jul 2024 16:32:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap 02/17] mesa: upgrade 24.0.5 -> 24.0.7
To: steve@sakoman.com, openembedded-core@lists.openembedded.org
References: <cover.1721740245.git.steve@sakoman.com>
 <247f62169d1fff5df16606c64aed38b642f36857.1721740245.git.steve@sakoman.com>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <247f62169d1fff5df16606c64aed38b642f36857.1721740245.git.steve@sakoman.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Jul 2024 14:33:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202365

24.0.9 is the latest bugfix release

2024. 07. 23. 15:13 keltezéssel, Steve Sakoman via lists.openembedded.org írta:
> From: Wang Mingyu <wangmy@fujitsu.com>
>
> Mesa 24.0.7 is a bug fix release
>
> Changelog:
>   https://docs.mesa3d.org/relnotes/24.0.7.html
>
> Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 55d962ff7e3475d2c46e1a76d9efa55e1de6e940)
> Signed-off-by: Steve Sakoman <steve@sakoman.com>
> ---
>   .../mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb}               | 0
>   meta/recipes-graphics/mesa/mesa.inc                             | 2 +-
>   meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb}   | 0
>   3 files changed, 1 insertion(+), 1 deletion(-)
>   rename meta/recipes-graphics/mesa/{mesa-gl_24.0.5.bb => mesa-gl_24.0.7.bb} (100%)
>   rename meta/recipes-graphics/mesa/{mesa_24.0.5.bb => mesa_24.0.7.bb} (100%)
>
> diff --git a/meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb b/meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa-gl_24.0.5.bb
> rename to meta/recipes-graphics/mesa/mesa-gl_24.0.7.bb
> diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
> index 7cc48e8a04..9157fe9c3f 100644
> --- a/meta/recipes-graphics/mesa/mesa.inc
> +++ b/meta/recipes-graphics/mesa/mesa.inc
> @@ -21,7 +21,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
>              file://0001-Revert-meson-do-not-pull-in-clc-for-clover.patch \
>   "
>   
> -SRC_URI[sha256sum] = "38cc245ca8faa3c69da6d2687f8906377001f63365348a62cc6f7fafb1e8c018"
> +SRC_URI[sha256sum] = "7454425f1ed4a6f1b5b107e1672b30c88b22ea0efea000ae2c7d96db93f6c26a"
>   
>   UPSTREAM_CHECK_GITTAGREGEX = "mesa-(?P<pver>\d+(\.\d+)+)"
>   
> diff --git a/meta/recipes-graphics/mesa/mesa_24.0.5.bb b/meta/recipes-graphics/mesa/mesa_24.0.7.bb
> similarity index 100%
> rename from meta/recipes-graphics/mesa/mesa_24.0.5.bb
> rename to meta/recipes-graphics/mesa/mesa_24.0.7.bb
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#202347): https://lists.openembedded.org/g/openembedded-core/message/202347
> Mute This Topic: https://lists.openembedded.org/mt/107504024/3617728
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [zboszor@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


