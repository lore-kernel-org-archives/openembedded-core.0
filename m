Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89F1ECCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 10:15:19 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17530.1762164910773062098
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 02:15:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OLtCHIWH;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-470ffbf2150so29033975e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 02:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762164909; x=1762769709; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fa/kWINMYnjTLL4eLSNKOapr8wGZd0A7I4GGz2tQau4=;
        b=OLtCHIWHOVmMrULHlOu/+62UREfQp4Y79Tp/t75ylLhE5hb1nJqBpE/fD0T31Y78EZ
         UQZzKEZtx27NtLzSY5kCcYyKFXztyfxCoL/mtapG5kc+B1MMRyr4bxwYGf8w3cSoSfxX
         qyOjBmVXJOSjQ6lbt+GqemMXEAlKUAsxbgz2aAeaTb6slhEs7f8iPyNAC+dK6ct/rV42
         6QaluQxSn98ycyruz8PIXCWMrTJq/Too1kRt2eafgMv5b0AKJLCzxJkSrPSbVXk/JV5b
         vvB3hy2Nnrt5eIu6c1IG1p4gwPT3G0CfjnxkApEcBqXIDF0uHvJZaY+Y6GZ2DqxR8U+s
         HMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762164909; x=1762769709;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fa/kWINMYnjTLL4eLSNKOapr8wGZd0A7I4GGz2tQau4=;
        b=DqAWUzcslFVKcrsHeeufSBq0LMbLuvqyY41hUoSXXxQN59YUMQFtuyJBENJ2MCVomo
         ekp05dVHCttGYYOKa2uxTZqFOaFLtWkgdZcg6L360GbZjRuoQPzsjH+vRHDvUBWQwNNT
         pqZEpBeYWxLJ0XG52f4hl7QZn6T1wcrZI+zWgaocPDHS3zOb4D1T8B6ubLQfh99103tX
         5T2RaL2OwzsiS8wWUMFmlkwt5yUucTrpsMndZwAYFR+kKyLZiMu6DSb4zfLQBkd1UrjO
         2pyRY8jx9yQH27lOJIaPoh9UTU7/i9hthy+tjc+a4a+t/qUPF1gDKzF2L8kYOcm2ub2Q
         6DTg==
X-Forwarded-Encrypted: i=1; AJvYcCVN8WSJ9698HzBFpijoR5NPvojdNZxmw+WV16NxUup/6rdTyp1GpNcUsjYBtvKaULXxKu2XHvI+7IcnJO77h6LqWQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzf0JKXVoeSwGO2KshLBZrwPQhyGPkDml6TNSl+7AhxsTkfD23+
	a0OaIxULCWXJZJJDP+f5Y/kdM62KJ3X2VIsjXXIlq31s4cRTJN4u2EYu
X-Gm-Gg: ASbGncsfRY6DezS97ze1rIIZZvk+JKlf9uhamNFX0O3/9BQ+UGVKd1ATA3nq4c7XZTo
	EBOxQrmprMqmtxFKGpuFum6x9RK+5wxc/5OcArq0A8TRM03ijaBj0uQJHh2hxxa913jh5cB4YbN
	bl51D6KakvrYpHsMPDAy0t6Y4YwQNm1g5B+uMSurqagTHMKOJFpFZG0DsTH+JxoHWIvZBQNOw7j
	tM8ZeMYEkb+vS/z5EA3yxsH0wJfMkzs47ZKVvXV39sYzUa66jT8q8xqVbWwnOZN0p0sdEJZNqGQ
	cd9OK7aC0zEeDiMIxXKel8D/EfJxEAW/OFbheQbi/l2XgQaIXk9H6qncw396cmI0eLWOaRsgAfv
	TjRRx5eSVdVQW1pabqoZJlUhKp1NndJEbxMlIlsgqr1vxrkPcBdRTtD2OLs5kF3/KtZqz/cYZWy
	BiAtIuHOLo9FNORW9amtg=
X-Google-Smtp-Source: AGHT+IFoiBdx4aqtKzjPXO2xzduTqADiYK26SqKzIkzzcqGhslme36N+bW3DptEOGHlJ7QUNBge20w==
X-Received: by 2002:a05:600d:8396:b0:46e:6339:79c5 with SMTP id 5b1f17b1804b1-477346cf90bmr68526315e9.5.1762164908688;
        Mon, 03 Nov 2025 02:15:08 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429ce80df16sm8863927f8f.2.2025.11.03.02.15.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:15:08 -0800 (PST)
Message-ID: <fa662162-32b7-4be3-b93d-ca879b9219b4@gmail.com>
Date: Mon, 3 Nov 2025 11:15:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH 15/19] gtk+3: rename tracker
 dependencies
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org,
 f_l_k@t-online.de, richard.purdie@linuxfoundation.org
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
 <c1641c15f747f70250ab3257edee3640d8cb916f.1762157680.git.joerg.sommer@navimatix.de>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <c1641c15f747f70250ab3257edee3640d8cb916f.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 10:15:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225639

I'm not sure if this patch can work. I believe tinysparql was added in
Walnascar in meta-oe, and I'm sure that it's not in Kirkstone.

On 11/3/25 09:22, Jörg Sommer via lists.openembedded.org wrote:
> From: Markus Volk <f_l_k@t-online.de>
>
> This is required for gnome 47 update in meta-openembedded
>
> (From OE-Core rev: 51864b3494bd8fe456fffb2e0ccf70fee13cc013)
>
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cherry-pick-of: 07d2dc4c98f2fe1e2c8c0aae5ce863e7bc190b5f
> Signed-off-by: Jörg Sommer <joerg.sommer@navimatix.de>
> ---
>  meta/recipes-gnome/gtk+/gtk+3.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gtk+3.inc
> index e1603b43fc..03913768b1 100644
> --- a/meta/recipes-gnome/gtk+/gtk+3.inc
> +++ b/meta/recipes-gnome/gtk+/gtk+3.inc
> @@ -47,7 +47,7 @@ PACKAGECONFIG[wayland] = "-Dwayland_backend=true,-Dwayland_backend=false,wayland
>  PACKAGECONFIG[cups] = ",,cups,cups gtk3-printbackend-cups"
>  PACKAGECONFIG[colord] = "-Dcolord=yes,-Dcolord=no,colord"
>  PACKAGECONFIG[cloudproviders] = "-Dcloudproviders=true,-Dcloudproviders=false,libcloudproviders"
> -PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tracker,tracker-miners"
> +PACKAGECONFIG[tracker3] = "-Dtracker3=true,-Dtracker3=false,tinysparql,localsearch"
>  
>  prepare_gtk_scripts() {
>      mv ${D}${bindir}/gtk-update-icon-cache ${D}${bindir}/gtk-update-icon-cache-3.0
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#225629): https://lists.openembedded.org/g/openembedded-core/message/225629
> Mute This Topic: https://lists.openembedded.org/mt/116094479/6084445
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


