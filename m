Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F9F0C433EF
	for <webhook@archiver.kernel.org>; Thu, 16 Jun 2022 06:00:11 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.14863.1655359202463398958
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 23:00:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qg6Aw3Kb;
 spf=pass (domain: gmail.com, ip: 209.85.208.173,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id e4so379534ljl.1
        for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jun 2022 23:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GR441WpfTgAwANIn+sQiL1XpaUV2sPu79gH6qj13Bfo=;
        b=qg6Aw3KbQZXxNFFtyCIg80dNthQB4YtDSD/ZNrieH3pX0kHpQNsmxOCMVOIcaHGLUR
         g+usOO2Im+16wTGC1wdgOyMn0l+iuGBRBbXJAK5Iw11k1blZ2Q2UWjdqMW4KnCg58b9v
         2vF5uA7ncAq9EWYoannrJzTvOd4LkjYkJlZDnLkOKVPvYzUmlMJhmlzqqvmOb9gzuc5y
         LQ8OK7vQEpZ8gSQXhpMJ/bB3IPRZEW7c3vMqvwu+VfBZvh/DWnlhYOAFkgh2311rYiOf
         ERFfnUoqNsVOb9/QNwwN5T+jHTivP9znj1W+o/AQn8EmsmdHM/i2HP4i8qCljdWEyQhW
         bWTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GR441WpfTgAwANIn+sQiL1XpaUV2sPu79gH6qj13Bfo=;
        b=8JM5sSiAq0ysMKkrjqvVOGw8csvp7H8/I04bIeSG/IMrilBbCq+NggbiO3EQ0YMde8
         S3KxcsLC1sA1yMCmrxY6hpaE7N6TLp+TfqPkHJKA3UJ4fI8MJQq/60In5acy31nAC9bH
         B+88nW2dWU9Xt2qTu0vwkdlUi4zpA4W8Z+dkuzPpGHztw/ks0o+FTKadtlhI6G/8r9+m
         ol7URVGg39KK4UpGUaWXsCcDmeBId1QQvp/dWD6opkh75DMt9Dc4tIjIF9qF884ncTxf
         qAq55HSfuUP8OTP+r0QYdKJ/76IQLWCrGgVklnjRmfHQr/lNzqzCuKrhjAH3tyDHoe8f
         x3EA==
X-Gm-Message-State: AJIora/qRBrUKCk8BNr2xZw2/1nxM19KKnA+cJavFb8dKP1yOPXEafFk
	0/Nv5OCtCLBsQ5syZNRud6Y=
X-Google-Smtp-Source: 
 AGRyM1smDOsYB1AwLUJX0Thfz53vu2VzdY6UK29tlEfkNRYjLEIDrosrpUko3Q/WN1iZoPH4SBzYvw==
X-Received: by 2002:a2e:7815:0:b0:255:67ff:9906 with SMTP id
 t21-20020a2e7815000000b0025567ff9906mr1712388ljc.359.1655359200313;
        Wed, 15 Jun 2022 23:00:00 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 d14-20020a2eb04e000000b0024f3d1dae7csm122999ljl.4.2022.06.15.22.59.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 22:59:59 -0700 (PDT)
Message-ID: <8d627239-7b9b-3eef-0dab-573fd2b8c072@gmail.com>
Date: Thu, 16 Jun 2022 07:59:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [OE-core] [PATCH v1] glibc-locale: work around
 host-user-contaminated QA failure
Content-Language: en-US
To: Muhammad Hamza <Muhammad_Hamza@mentor.com>,
 openembedded-core@lists.openembedded.org
Cc: Christopher Larson <chris_larson@mentor.com>
References: <20220616055414.42319-1-muhammad_hamza@mentor.com>
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220616055414.42319-1-muhammad_hamza@mentor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jun 2022 06:00:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167001

On 6/16/22 07:54, Muhammad Hamza wrote:
> Work around long standing periodic host-user-contaminated QA failure by
> explicitly correcting the ownership.
> 
> See `glibc-locale: Rewrite do_install using install utility instead of cp`
> on the oe-core mailing list for discussion. This should be dropped when
> a real fix is implemented.
> 
> Explicitly disable host-user-contaminated to further work around the
> pseudo bug. With pseudo acting up, even if the ownership is correct, it
> may well think it is not, so just sidestep the issue until upstream
> fixes the root cause.
> 
> Signed-off-by: Christopher Larson <chris_larson@mentor.com>
> 
> Signed-off-by: Muhammad Hamza <muhammad_hamza@mentor.com>
> ---
>   meta/recipes-core/glibc/glibc-locale.inc | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/meta/recipes-core/glibc/glibc-locale.inc b/meta/recipes-core/glibc/glibc-locale.inc
> index b8de7d3192..34c178268b 100644
> --- a/meta/recipes-core/glibc/glibc-locale.inc
> +++ b/meta/recipes-core/glibc/glibc-locale.inc
> @@ -69,6 +69,23 @@ FILES:localedef = "${bindir}/localedef"
>   
>   LOCALETREESRC = "${COMPONENTS_DIR}/${PACKAGE_ARCH}/glibc-stash-locale"
>   
> +# Work around long standing periodic host-user-contaminated QA failure by
> +# explicitly correcting the ownership.
> +#
> +# See `glibc-locale: Rewrite do_install using install utility instead of cp`
> +# on the oe-core mailing list for discussion. This should be dropped when
> +# a real fix is implemented.
> +
> +do_prep_locale_tree_append () {
> +	chown -R root:root $treedir
> +}
> +
> +# Explicitly disable host-user-contaminated to further work around the
> +# pseudo bug. With pseudo acting up, even if the ownership is correct,
> +# it may well think it is not, so just sidestep the issue until upstream
> +# fixes the root cause.
> +ERROR_QA_remove = "host-user-contaminated"
> +
>   copy_locale_files() {
>   	local dir=$1 mode=$2
>   
> 

Given the append/remove override syntax used here, I guess this patch is 
aimed at an older Yocto release, and shouldn't be necessary for master ?

Jacob

