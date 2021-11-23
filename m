Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6743EC433EF
	for <webhook@archiver.kernel.org>; Tue, 23 Nov 2021 17:13:37 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web12.14378.1637687614467183553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:13:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T6DOT1yp;
 spf=pass (domain: gmail.com, ip: 209.85.214.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id p18so17608032plf.13
        for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Nov 2021 09:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=6Z+YsVCZUMGDFQm2Rxs5iOPESEwzNiAoGeld0zYqEWE=;
        b=T6DOT1yp4TfnzjIx5gDJhJwXZvyr9EDXVXe8eqJbd2FffAgbvgC7SUu+iXEgSQNi9R
         1BMkCAjo7vFupZh5ek3wgDPYbk84mZ/uBHkTuk59lCSUkQdeUM8DgdH8C1LiTRmkU34L
         g4pqV7KlHz2FBOYNUC3WywdqMNZUZaMch4NQgLqaui0aK4y9YpjBpoNQFHdDJyesf/pY
         Prb961Gj+6WrrjqAYe4fonFgVN3k0puHEWyIcuC5exBb8goCrHp5m0j1NhZWCFHJBDsu
         JtI3L4tlEPS5XyzagOVL9Ad/RljNj+DaUV3RtSrMrHf4Fipq7PsG3YPIEu+SHd7kKC1Q
         QZ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=6Z+YsVCZUMGDFQm2Rxs5iOPESEwzNiAoGeld0zYqEWE=;
        b=FwcZpbb13ErROkb/6a0JWt2r5LJu4Sfmao+xVODJl0hRGISpD9xjyYFhSFjOvfLk/p
         TruB0agTRmCQt4L0+UQOYZWFVSVSAKIfelwEX4nSlWWc9y4TejYDkW9fXT7YHKM4i+NV
         yLgsH1+voOvWtrHjxbS1aWmQCm2GwNRGFS2BrP9Arqmeb0+9BPl/KJxEDMfOxsIqyWol
         qHWjaM2aR8PmeMtvy5GtVIVKvCfIhC/t3wbc0zTfL9i6E7alJZrPjy8HIZ/IbuGuTWgN
         c5WDUtYDyHHmsI8BQ2Rlsm/OpgF9IoyNGr/59qaTUVOWD2odUNb23qqqdRuydy4bmbpH
         tzqA==
X-Gm-Message-State: AOAM532EmDZ5vwIDy6gyPMS11mlh2CXXz4gh+gMZ/qZs/goHZf8S5Hlo
	6z3cPddDsAJ+F+T3S+l9aav7H4bsZuQrOA==
X-Google-Smtp-Source: 
 ABdhPJzt8OzpFJ/07m5Zmc94j5E91K9waobf415ir0uKdkW9bX/h+JQ7MYr4SfiqX9i2cYwYvofVUQ==
X-Received: by 2002:a17:902:c7c2:b0:143:bdf7:1670 with SMTP id
 r2-20020a170902c7c200b00143bdf71670mr8680544pla.61.1637687613350;
        Tue, 23 Nov 2021 09:13:33 -0800 (PST)
Received: from ?IPV6:2601:646:9200:a0f0:80d4:8faa:642e:6536?
 ([2601:646:9200:a0f0:80d4:8faa:642e:6536])
        by smtp.gmail.com with ESMTPSA id
 kx3sm1702869pjb.5.2021.11.23.09.13.32
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Nov 2021 09:13:32 -0800 (PST)
Message-ID: <ede0b539-455e-1774-21bd-b2c3d5e42a50@gmail.com>
Date: Tue, 23 Nov 2021 09:13:31 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [OE-core] [PATCH] glibc: Fix i586/c3 support
Content-Language: en-US
To: openembedded-core@lists.openembedded.org
References: <20211123165519.36922-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20211123165519.36922-1-richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Nov 2021 17:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158612



On 11/23/21 8:55 AM, Richard Purdie wrote:
> CET can't be enabled on i586 or c3 for x86, adjust the configuration accordingly
> to fix those builds.
> 
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>   meta/recipes-core/glibc/glibc_2.34.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/glibc/glibc_2.34.bb b/meta/recipes-core/glibc/glibc_2.34.bb
> index 72064772789..7efc1ec1ef7 100644
> --- a/meta/recipes-core/glibc/glibc_2.34.bb
> +++ b/meta/recipes-core/glibc/glibc_2.34.bb
> @@ -90,7 +90,7 @@ EXTRA_OECONF = "--enable-kernel=${OLDEST_KERNEL} \
>   
>   EXTRA_OECONF += "${@get_libc_fpu_setting(bb, d)}"
>   
> -EXTRA_OECONF:append:x86 = " --enable-cet"
> +EXTRA_OECONF:append:x86 = " ${@bb.utils.contains_any('TUNE_FEATURES', 'i586 c3', '--disable-cet', '--enable-cet', d)}"

does this make glibc tune specific now ?

>   EXTRA_OECONF:append:x86-64 = " --enable-cet"
>   
>   PACKAGECONFIG ??= "nscd memory-tagging"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#158611): https://lists.openembedded.org/g/openembedded-core/message/158611
> Mute This Topic: https://lists.openembedded.org/mt/87262863/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

