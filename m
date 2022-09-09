Return-Path: <jacob.kroon@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80A6AECAAA1
	for <webhook@archiver.kernel.org>; Fri,  9 Sep 2022 16:54:07 +0000 (UTC)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by mx.groups.io with SMTP id smtpd.web08.231.1662742438925349914
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:53:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VaMiIKSR;
 spf=pass (domain: gmail.com, ip: 209.85.167.43,
 mailfrom: jacob.kroon@gmail.com)
Received: by mail-lf1-f43.google.com with SMTP id w8so3684439lft.12
        for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Sep 2022 09:53:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=21gLaCDL/KEK4lYkOk084bMfjn7Upr7b8LlhiIZKHNo=;
        b=VaMiIKSRpCt4k7bZBNpx4pUqCGsCfl88qLP2qeHd3kn3NvPNtSDSAepSy7X9/+egEK
         rz1oMgCB42EfrwkpEaMlb+NlQyXcpVDsctOmJVXgtBqA+z8Z5NLb6JLUzPouwrp7uutT
         Co4/Fr/Izl1IB9bnXu0zPtYGE2FvWoBHcdLAbwdJimmy5+5esPeKKp1IphC0a/H1c3yU
         hbQXawg9bVN0GO83doeFWtSOjovU6AbYBQhwA7VIUgSELRCANNDbTAGS812Ikh2xuuEj
         LVWLlgbGdzDH6OM8wQtuDCJSolMtPDWFwng8JE2lB2eetZnR9u7uE8T46/6lA5fJirgn
         Su+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=21gLaCDL/KEK4lYkOk084bMfjn7Upr7b8LlhiIZKHNo=;
        b=QqFdwhTrfTvbL9k1EtLjsKmmBBR75l6KvdAH1Asu+KZZ7DeMgV0+Y9pQaPS6T538RH
         5yGeWvbgEM8pAmWrnfpAnULtUc6Npjzi2fzUriLOAWOKM0V7mAhod8EuD3hssan8A1aO
         OblcjnhVH1vYH9gSVWnicDIPLaEY41cXnfpmIddaatpjPOGdUfX6vPYGNDiIBde0dePc
         BtoLjJbtM1rqDSXrgCpgwP1dGtgz0qLGdFlV9qPMjNF30HWeImJjSGWF4ZDK7VqnbZwL
         fDPASkVIfXgwN3Ipm8eH6JkmXNVHLvl5AJjOXSRK4pO97RelvrAFR/gClZfbmNdRwW2Z
         UQdQ==
X-Gm-Message-State: ACgBeo22Wy+ru2lc7VdIXpITNem/Lg9zjHryU4d05lwrtHHRFspAQWY7
	xpt1R+MZArzIJpJZMGsw8yk=
X-Google-Smtp-Source: 
 AA6agR4PgdUrfRW1u5eAvwPRL0FqiF4dgjv36KqdN8LRWxPzeQ9ShUti01MtRpmoAYFpzruM7C5M3A==
X-Received: by 2002:a19:e00d:0:b0:492:e5a5:588b with SMTP id
 x13-20020a19e00d000000b00492e5a5588bmr4503158lfg.243.1662742436919;
        Fri, 09 Sep 2022 09:53:56 -0700 (PDT)
Received: from [192.168.10.102] (89-253-118-72.customers.ownit.se.
 [89.253.118.72])
        by smtp.gmail.com with ESMTPSA id
 g15-20020a2eb5cf000000b0026a9c8833d3sm138348ljn.129.2022.09.09.09.53.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Sep 2022 09:53:56 -0700 (PDT)
Message-ID: <aec9d2b3-bb3a-cae0-ebab-d5b4f5481f96@gmail.com>
Date: Fri, 9 Sep 2022 18:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [OE-core] [PATCH] libxml2: don't override XML_CATALOG_FILES in
 xmllint wrapper if already set
To: Ross Burton <ross.burton@arm.com>,
 openembedded-core@lists.openembedded.org
Cc: schnitzeltony@gmail.com
References: <20220909163640.1985612-1-ross.burton@arm.com>
Content-Language: en-US
From: Jacob Kroon <jacob.kroon@gmail.com>
In-Reply-To: <20220909163640.1985612-1-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Sep 2022 16:54:07 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170500

On 9/9/22 18:36, Ross Burton wrote:
> The KDE build uses custom catalogs by setting XML_CATALOG_FILES, so this
> wrapper should not override that value if it has already been set.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>   meta/recipes-core/libxml/libxml2_2.9.14.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-core/libxml/libxml2_2.9.14.bb b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> index 2b2289e38a6..165c92d4114 100644
> --- a/meta/recipes-core/libxml/libxml2_2.9.14.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.9.14.bb
> @@ -121,7 +121,7 @@ do_install:append:class-native () {
>   	# Docs are not needed in the native case
>   	rm ${D}${datadir}/gtk-doc -rf
>   
> -	create_wrapper ${D}${bindir}/xmllint XML_CATALOG_FILES=${sysconfdir}/xml/catalog
> +	create_wrapper ${D}${bindir}/xmllint 'XML_CATALOG_FILES=${XML_CATALOG_FILES:-${sysconfdir}/xml/catalog}'

That ...:-${sysconfdir}/... looks odd. Is that hyphen intentional ?

>   }
>   
>   BBCLASSEXTEND = "native nativesdk"
> 
> 
> 

Jacob

