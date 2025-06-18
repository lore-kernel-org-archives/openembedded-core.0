Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5581C7115A
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 13:06:26 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web11.6915.1750251983538941243
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Jun 2025 06:06:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=rXuQcsHY;
 spf=pass (domain: baylibre.com, ip: 209.85.160.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a56cc0def0so116818091cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750251981; x=1750856781; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jApyGhJiwhOT2lloUN4Udp5/SUtOGSQiT3wqkyKC4gQ=;
        b=rXuQcsHY4s3CDPcWPMngL5o91W52S3/HaZkyrBZAiUkXduiufmSVSrpk+1AXVWK6j/
         +UN5PFEOF40S/sqgPp++4mBrLfp8wTBSPfOEj//YgAAyCYntPV7M5TSISopKpL+r3H7A
         uI4XBRfgSl/xhDI3DRoJbtNtdYxUtAHSUNmHBdCGcELCb1LNE9ivD26XSbPtI8NWnb3X
         AelnjtszQZWSIyo+R/axBZ8hif16lGj2JsFJpeMVfahaUPSWocj1s3liMhrnAIS/rDdU
         uhSE3L2YDs8nqLUpRxqbrTOzR+e9UeCRt3O/u7gr31RIBczy36+3f9Q908uLxsNLWer0
         62hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750251981; x=1750856781;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jApyGhJiwhOT2lloUN4Udp5/SUtOGSQiT3wqkyKC4gQ=;
        b=G8DV4Ns8RGuP6o3PkrWwgg2NegOreNnd0rA9uZK4HjeZF3vf6W9Rff6IA4dmGNLbQc
         VF0V6/lAmOys2PHeZp8cJw0YMA1wWDUMHzGcUvlYABsardY5DJNOR/dx8djzG8D+cUWo
         LYHRPuQBfp1bgKbli8EW//Tk+qJKZtTFIbA+U79wNhN3D3Syd7FTv0oG61XtWy/taJvp
         PTNBnMJztfHXK/Z06Fh04fI/d1DqHnrzOlhdrb3RUgveKjHFydh0cedCaIv6QDPaAExm
         f0Ymx9P+O2oxgo21nAIwg+KyWDM1zY/qCvM100THvTjg0tSfjfNnqG1rn4fWMwPLm61p
         Zrog==
X-Gm-Message-State: AOJu0YzUkKlmA7+L89w1dwgl5DfcHDAAcR8ZRT0wQAo5s58z+qBk9EZM
	MGn7cMHZBggCYCPDMg6RZPZ8QviQ55pcJtylhbPq4gFz8Tx2OBKlG/jTJP5pNEeqVcoKjbcgNL3
	6nKPOpVY=
X-Gm-Gg: ASbGnctCrMaSh3Kc47Eu2+30fTHFH+fcLJga/trWKz4nH0ifIqYvroU5o9ozXY4V5zX
	h96kL5wAI4T+3oKN30pc7ermhRGZPa2lLkoP++knndquan6X+clsyfwfRfYQo1alkkqb4bT5PBd
	LsA2J3xe/NZsD0Ueeaouoj5yK8k8bn2ejS7Ye4FZLmlzFIJyh6CsfGDfJYmGR3N5LiuW4FBbzr9
	s232kGRwIOZ4eyLHcbNf+zRYM9++4jssbAUI1xtCs1fwzNWaHXMGmL9gR5nvWz0TpbyO4dXAdTR
	CXZn2WspQ5qTUK2b0HUmRyctL2ZKy9q2er1aiC6c9zRC0W06eLo5qLqXCIuEkzjMORycud8rgmi
	8hK07LkL4srDF0gZd+i7zHYABIEp1Rw==
X-Google-Smtp-Source: AGHT+IE4eNV3tbFLZ9q5V3As44PrrWAzqhdoBFwru2NRTjP8E7iMl8vIQVCUA7Ok30YRR0kkgZoOZQ==
X-Received: by 2002:a05:620a:1aa1:b0:7d2:3db:a4c0 with SMTP id af79cd13be357-7d3c6ced80dmr2636592285a.41.1750251981483;
        Wed, 18 Jun 2025 06:06:21 -0700 (PDT)
Received: from [192.168.40.12] (d24-150-219-207.home.cgocable.net. [24.150.219.207])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d3b8ed6630sm757852885a.89.2025.06.18.06.06.20
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jun 2025 06:06:20 -0700 (PDT)
Message-ID: <59919691-d210-4680-a458-e28b96da0963@baylibre.com>
Date: Wed, 18 Jun 2025 09:06:19 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] unzip: Fix build with GCC-15
To: openembedded-core@lists.openembedded.org
References: <184A24A1EC25AE27.21548@lists.openembedded.org>
Content-Language: en-US
From: Trevor Gamblin <tgamblin@baylibre.com>
In-Reply-To: <184A24A1EC25AE27.21548@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 13:06:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219010

Please disregard this one for now, looks like there may be other issues...

On 2025-06-18 09:01, Trevor Gamblin via lists.openembedded.org wrote:
> From: Khem Raj <raj.khem@gmail.com>
>
> Add a patch to remove redundant declarations
>
> (From OE-Core rev: 20ae2ce01f5114f6df67c0cfb6d820fc1513cdcc)
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>
> Backport this to scarthgap so that it can build on systems with gcc 15
> (e.g. Fedora 42).
>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
> ---
>   meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
>   meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
>   2 files changed, 18 insertions(+)
>   create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch
>
> diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
> new file mode 100644
> index 0000000000..42a2f81681
> --- /dev/null
> +++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
> @@ -0,0 +1,17 @@
> +Do not redefine gmtime(), localtime()
> +
> +They are already provided by system time.h header
> +
> +Upstream-Status: Inactive-Upstream [need a new release]
> +
> +Sign-off-by: Khem Raj <raj.khem@gmail.com>
> +--- a/unix/unxcfg.h
> ++++ b/unix/unxcfg.h
> +@@ -117,7 +117,6 @@ typedef struct stat z_stat;
> + #  endif
> + #else
> + #  include <time.h>
> +-   struct tm *gmtime(), *localtime();
> + #endif
> +
> + #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
> diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
> index c13e7a008e..0a88b4c092 100644
> --- a/meta/recipes-extended/unzip/unzip_6.0.bb
> +++ b/meta/recipes-extended/unzip/unzip_6.0.bb
> @@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
>           file://CVE-2022-0530.patch \
>           file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
>           file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
> +        file://gcc15.patch \
>   "
>   UPSTREAM_VERSION_UNKNOWN = "1"
>   
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#219008): https://lists.openembedded.org/g/openembedded-core/message/219008
> Mute This Topic: https://lists.openembedded.org/mt/113707386/7611679
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [tgamblin@baylibre.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

