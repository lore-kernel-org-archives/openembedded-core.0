Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1997BC77B7C
	for <webhook@archiver.kernel.org>; Sat, 27 May 2023 05:27:09 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web11.5588.1685165223312378947
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 22:27:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=o+p8JxwD;
 spf=pass (domain: gmail.com, ip: 209.85.208.175, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2afb2875491so14416721fa.1
        for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 22:27:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685165221; x=1687757221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FMTXUt1S5UXrH7bCoR7AL8jxTOSyh10lS4XpsoCB09c=;
        b=o+p8JxwDl9hsu7mvx5GqIBAtZTIzdT8oqTzmgHzKc19oBNlXjeBiWuqKQK0k0wCdtO
         4SrYMMNCdX9+DCatCru4uG7kgQB286wTisPi60TgL/bN8Lb+aYWDVU3XyUgtO76SWFkE
         8/avh64mF2LHUD9cL0kGalK2QQWljLaSfFSQzDex01aOMQzr2XM+EsII7JFoVSezJCsb
         3priRya5EUFmAq1rugPvwR1w+x9Fbv601d+8XL0va9P233DafxA2b7zwnFcIkayot27v
         BxzaVd1NKj+5Q9OtutG0c7A5W+pQa5ymBK3rE0lrD65eppDHZShKcIj+GF6aPsE9Etef
         3fQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685165221; x=1687757221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMTXUt1S5UXrH7bCoR7AL8jxTOSyh10lS4XpsoCB09c=;
        b=Vt/BnZYTcGZqR7TOxED647K4uqVlGZzmuJiB0VaqkOPJactfpTe1klEyXjZSRV5UNc
         gTW+cwYh7/F525OqboYaIjHGkUsh9Gi6/2vYUbVtKWKinbjHJJllHv9iErUSeRadbE0I
         K/x88P2PtVUBZMUn6CiMEX9BVxTe9CStdTmDG6UAPUyf0HtNxTrQb02+5ksFzbCP/gZC
         QICtpart6hwvBGamJsJDCppvCnEj6RIBjUdkjKXh/KTavuyiz2f4Ym1otkI8cUgzOgIZ
         n2OIhl6XVT8r3qpn50cEFQ+qXDxhChshMBpOWzShxT8Csd7/FKutd6ViGUbdUZkr1N97
         +HsQ==
X-Gm-Message-State: AC+VfDwiYxA9CPsIh29Q/938FUK0KEUnH1wdXR0e78zLUcYOpVd73TzP
	Gop8aRZVNafJKwTDdqL3cao=
X-Google-Smtp-Source: ACHHUZ4Qba2LFNDiCyWGwus104i0kA22evvajz7e1BsUEhCc7GCVWyEkKBaLKS1fkUAjb+a8d01Hjg==
X-Received: by 2002:a2e:9cc1:0:b0:2af:1dba:d44 with SMTP id g1-20020a2e9cc1000000b002af1dba0d44mr1728648ljj.34.1685165221193;
        Fri, 26 May 2023 22:27:01 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se. [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id x19-20020ac24893000000b004edd32d0bdesm952422lfc.288.2023.05.26.22.27.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 22:27:00 -0700 (PDT)
Message-ID: <c60b519b-6b54-511c-1cae-65ffca65d35f@gmail.com>
Date: Sat, 27 May 2023 07:27:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [OE-core] [PATCH] bitbake.conf: Add -fcanon-prefix-map to
 DEBUG_PREFIX_MAP
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
References: <20230428032030.2047920-1-raj.khem@gmail.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20230428032030.2047920-1-raj.khem@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 May 2023 05:27:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181789

On 4/28/23 05:20, Khem Raj wrote:
> This should help canonicalize the relative paths and symlinks
> during cross compile, -fcanon-prefix-map is newly added in gcc-13+ [1]
> 
> [1] https://gcc.gnu.org/bugzilla/show_bug.cgi?id=108464#c8
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   meta/conf/bitbake.conf | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index d94ffe1df9..453bef37a9 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -644,7 +644,8 @@ EXTRA_OEMAKE:prepend:task-install = "${PARALLEL_MAKEINST} "
>   # Optimization flags.
>   ##################################################################
>   # Beware: applied last to first
> -DEBUG_PREFIX_MAP ?= "-fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> +DEBUG_PREFIX_MAP ?= "-fcanon-prefix-map \
> + -fmacro-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
>    -fdebug-prefix-map=${S}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
>    -fmacro-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
>    -fdebug-prefix-map=${B}=/usr/src/debug/${PN}/${EXTENDPE}${PV}-${PR} \
> 

Maybe we can take the opportunity to also cleanup DEBUG_PREFIX_MAP by 
replacing debug/macro/canon with a single -ffile-prefix-map ?

 From the gcc 13.1.1 manpage:

> -ffile-prefix-map=old=new
>            When compiling files residing in directory old, record any references to them in the result of the
>            compilation as if the files resided in directory new instead.  Specifying this option is equivalent to
>            specifying all the individual -f*-prefix-map options.  This can be used to make reproducible builds
>            that are location independent.  Directories referenced by directives are not affected by these options.
>            See also -fmacro-prefix-map, -fdebug-prefix-map, -fprofile-prefix-map and -fcanon-prefix-map.

Jacob

