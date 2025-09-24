Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6A14CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 20:05:50 +0000 (UTC)
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com [209.85.166.175])
 by mx.groups.io with SMTP id smtpd.web11.24118.1758744334335107331
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 13:05:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LCuSVHIa;
 spf=pass (domain: gmail.com, ip: 209.85.166.175, mailfrom: raj.khem@gmail.com)
Received: by mail-il1-f175.google.com with SMTP id e9e14a558f8ab-4258bd8c19bso1655085ab.2
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 13:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758744333; x=1759349133; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=da/YynEsRLmEVliVEir33b4SCjrP+ALXSvZwN6c4pS8=;
        b=LCuSVHIaHy0aEGTUfQTfedCfubYLjYYMhXlFsRVuoazHKerlj16PGdPxH+FWQG4NiP
         davb+w0xPc6NOlTLvEu3V9rBbdSffBBXjp2Ol9cK2FkS7cy6Y7BAsTKVp3xTC2fgTkNN
         3II+EAQhiu50pkG22b53XIXq+Slz3yQjhr8AfJ16UJoxrlptuTpbw2oyys5nIlSimxBn
         xr+VchmywPtxCkhO8rK+R/ua9N+5vGRxwENVkeKrgTqzzab2PdL6RWCv+nEG+/UiILvK
         aCAAKN37NhnCie5o3iiTb9sXDhlTDCXeY+4YfziZ7wzaVn+D3K7IlrCawmc/6/fok3zs
         POqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758744333; x=1759349133;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=da/YynEsRLmEVliVEir33b4SCjrP+ALXSvZwN6c4pS8=;
        b=HTlrfLi+8CLoa2+4/6gW+uScaKOxpGa7V/KnPU+yGKReTZ6D6fjOyoqVbi+p+mdLu8
         LpxDzLW9zgxuHh9HA9VCqQYxAdTxxrGK0ZHAs9aw+tdjyToAtV8suphdb3pind7YQXl/
         pQOJMafjrcK8Ls+AIWRu6VPVZQPj65oC5eoohYapOuM/STwOdgDiInQ2+YsmSCg9GNqa
         cP/MgmWYp2TALSjHknFoEGtt1bljwPio/sht+sXA7lx3cov5yd7MzUhNqW7qp+AJfVFa
         z6rbMnZDg98yVVhYPYfIKCjNj6x2Vb7uXUAblnYCMjNcnRmwmoHOdp8OOa5RLOFWI9dR
         lU5A==
X-Forwarded-Encrypted: i=1; AJvYcCXAo4iziHYJ/5xsld2rmvpk2DrdxwZYFNmVaMQOI16Y4p2nGIAmci4jiOMfdm/jammX1lj2UcFYAU1Zkhv5gr9EkA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyDoth11mCeb7z27+FA1Yv+8NEASMoCa3VCEVbliPMHUmcP6Tvg
	JGlViRPrPC5PLss07jaQH0BcNAdP6s6c+WV2rxBfcgl60yEK2AlrWaf3OgQkvQpW
X-Gm-Gg: ASbGnctcttEMHm/qbAtuT2iBsVESB1DzDikQduxG7oI2c0o92MhpnE1qMe4n1hppctO
	UdBfWZRMZq2GNLcDNUoKNx/49PbijO3YAMjhXWT8pdw6tmamo3r1DpSsdgN5pyOR8zoa9Y+C3/h
	3wa1GYnENy/E2l8kx39HagZQVDTxNXUmjeO3d3CIA7YwRIaoz7vRFXPbDmPbMd+XUKJwepgX0FA
	RPl3N72VfOGXLEFfUZz0m7ou1ykDQMrTB83GvASYdwBQu0kE/cCfAT1Cjx6G5deAInI0qjl9Fhg
	i3WXZVCbX5ll6jejzBbTyRiyUWoC8IudDVeiHUIbfHONvq8yiWcsQm8t1nkg+Hpykpzaf/oRE3o
	6By8bs7IG+SmofbgrqKJpYLhIFg0FNg44J5z79nVO9fdX1snlz51Qa0KY27EO8gwhCzbI8lIoB1
	yhjum0AQ9xmwb0tJ0nA8EuICY9LhecyfS8q1YuxJbGOg8j2v+xUBAt1jkhoqxDEXcr4yNdnGPLs
	8988LawiqokPSQ6uxlwTSYxjEibIz4dnOWc2HgVcw==
X-Google-Smtp-Source: AGHT+IFce/03T9tQ8Q9lXJ4yGmYkep4tFdetcn2DcZq522onddlA2H8xKh+k0jrZQtRV9viJHJZZew==
X-Received: by 2002:a05:6e02:490d:b0:418:84eb:ea20 with SMTP id e9e14a558f8ab-4259562f43bmr13228945ab.15.1758744333332;
        Wed, 24 Sep 2025 13:05:33 -0700 (PDT)
Received: from ?IPV6:2601:646:8201:fd20:289b:c5dd:de6c:a09f? ([2601:646:8201:fd20:289b:c5dd:de6c:a09f])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-56a69a1c5c2sm44628173.50.2025.09.24.13.05.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:05:32 -0700 (PDT)
Message-ID: <9cceabec-e2c3-4821-a559-f3445d422548@gmail.com>
Date: Wed, 24 Sep 2025 13:05:31 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH v4 7/7] clang: no need to install tblgen
 binaries in nativesdk-clang
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
References: <20250924120834.2886320-1-ross.burton@arm.com>
 <20250924120834.2886320-7-ross.burton@arm.com>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20250924120834.2886320-7-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 20:05:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223986



On 9/24/25 5:08 AM, Ross Burton via lists.openembedded.org wrote:
> These are only needed if cross-compiling clang, and if someone is
> cross-compiling clang in a SDK they should build their own binaries as
> these ones might not match the version of clang they're building.
> 

yeah it perhaps makes sense, I had a test where I will build clang 
itself using SDK for target, this is only useful for compiler developers
and thats a small subset of users, moreover they do not use OE SDKs for
development.

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-devtools/clang/clang_git.bb | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/meta/recipes-devtools/clang/clang_git.bb b/meta/recipes-devtools/clang/clang_git.bb
> index 9ccb81a5308..53bca1c24f8 100644
> --- a/meta/recipes-devtools/clang/clang_git.bb
> +++ b/meta/recipes-devtools/clang/clang_git.bb
> @@ -222,13 +222,11 @@ do_install:append:class-nativesdk () {
>       if ${@bb.utils.contains('PACKAGECONFIG', 'clangd', 'true', 'false', d)}; then
>           install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clangd-indexer ${D}${bindir}/clangd-indexer
>       fi
> -    install -Dm 0755 ${B}${BINPATHPREFIX}/bin/clang-tblgen ${D}${bindir}/clang-tblgen
> +
>       for f in `find ${D}${bindir} -executable -type f -not -type l`; do
>           test -n "`file -b $f|grep -i ELF`" && ${STRIP} $f
>       done
> -    ln -sf clang-tblgen ${D}${bindir}/clang-tblgen${PV}
> -    ln -sf llvm-tblgen ${D}${bindir}/llvm-tblgen${PV}
> -    ln -sf llvm-config ${D}${bindir}/llvm-config${PV}
> +
>       rm -rf ${D}${datadir}/llvm/cmake
>       rm -rf ${D}${datadir}/llvm
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#223973): https://lists.openembedded.org/g/openembedded-core/message/223973
> Mute This Topic: https://lists.openembedded.org/mt/115410451/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


