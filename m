Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FAADC6FD1D
	for <webhook@archiver.kernel.org>; Mon, 27 Mar 2023 21:48:22 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.49216.1679953691228705027
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 14:48:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=veZ4NDfz;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id r29so10196760wra.13
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 14:48:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1679953689;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BqXtjnOsyiP58UceE95YEb9py7PE3ls27x+n4YT0jI8=;
        b=veZ4NDfzhHwhKiYcTXrUw2QUh4Jn/bEh11HiriEjVLbWkdf1kj92OKGs/ycduDpzIl
         gWeUikMy6iWzsZdhL2L6rVfIQurinErc6n01UOcEzG1izWT6+3/ys8F+ywadFXIbJ8AL
         pXk2Dko7NwNQQaFtWKBujouPk8ehI+uXJWz2IvQZEdeac9a7xurMhggQTpz48oYVmz9I
         ppV4wd3Hdy8dg3aJv+gnHvWv0Z8PBRd9Awd7pkwedRohuS8PcK98NwzNkRywB4OfddSt
         x3QDnvueL1tw8cxidAfztHIxB9qbQEiOz6PIctbATZ4c20d/vZzsFbxutpWLvk1noG1f
         nQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679953689;
        h=content-transfer-encoding:in-reply-to:organization:from:references
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BqXtjnOsyiP58UceE95YEb9py7PE3ls27x+n4YT0jI8=;
        b=J+Piz2OhmL1MBVWwJfw9auWgHvFXUmXzdE3Ywd0HzUSC+MCUK8ZiNc/6vrClAa/agm
         brVMCtui8939u66VPwuMz98BYM6UYklBlx/klTqsdcCRrInTveq+U8xTiLvqoCpQGhuY
         DIrpF2cIreZkzZmrBaUzcl+TxXLKErIxMLhHVxx/yC1Yu8/RJ49lhTI/VKh8LtaMFj61
         f8WoU6ePbB6gdrESTi7pCQ+bgmLmpvp9pBtCE6iNQuJUjACMvgvt35e384yY/iBLnQjr
         wYx7ohtdAmE5vYr7z27NKTyKZJS38mY9yEn54G0sGHg1i4ajHIMBYvSupRoDxqd95+8P
         oY4A==
X-Gm-Message-State: AAQBX9e9aKoQUzHHAJafAPKInOIPpQvAMZmhVKVMC5CkOdmH8cpDOdmk
	ezTTjMdnDjU5kKwbeEZgCKxI4Q==
X-Google-Smtp-Source: AKy350aGfh3CtrxKL7DlWKAvRVjUjTd4a+q/Ou/2CdBdeFdx1YD1k1H3L3Y6kLfUKZC4AjAQRvx4Cw==
X-Received: by 2002:a5d:66c9:0:b0:2ce:aa62:ff73 with SMTP id k9-20020a5d66c9000000b002ceaa62ff73mr10324389wrw.54.1679953689450;
        Mon, 27 Mar 2023 14:48:09 -0700 (PDT)
Received: from [192.168.0.33] (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id m8-20020a5d4a08000000b002c3f03d8851sm25865179wrq.16.2023.03.27.14.48.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 14:48:09 -0700 (PDT)
Message-ID: <7d812cf4-5723-3553-fb46-45cbb7409b3f@smile.fr>
Date: Mon, 27 Mar 2023 23:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] package.bbclass: check packages name conflict in
 do_package
Content-Language: en-US
To: Fawzi KHABER <fawzi.khaber@smile.fr>,
 openembedded-core@lists.openembedded.org
References: <20230323095655.6319-1-fawzi.khaber@smile.fr>
From: Yoann Congal <yoann.congal@smile.fr>
Organization: Smile ECS
In-Reply-To: <20230323095655.6319-1-fawzi.khaber@smile.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 21:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179183

Hi Fawzi,

On 3/23/23 10:56, Fawzi KHABER wrote:
> It is possible to rename packages with the macro PKG:${PN} and result in
> a package name conflict if the target name exists already.
> 
> Add a fatal check to prevent this issue to go unnoticed.
> 
> Fix [Yocto #12060]
> 
> Reviewed-by: Yoann CONGAL <yoann.congal@smile.fr>
> Signed-off-by: Fawzi KHABER <fawzi.khaber@smile.fr>
> ---
>  meta/classes-global/package.bbclass | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/meta/classes-global/package.bbclass b/meta/classes-global/package.bbclass
> index 7e96601cd9..30dfd63d4f 100644
> --- a/meta/classes-global/package.bbclass
> +++ b/meta/classes-global/package.bbclass
> @@ -496,6 +496,16 @@ python do_package () {
>  
>      bb.build.exec_func("package_convert_pr_autoinc", d)
>  
> +    # Check for conflict between renamed packages and existing ones
> +    # for each package in PACKAGES, check if it will be renamed to an existing one
> +
> +    for p in packages:
> +        localdata = bb.data.createCopy(d)
> +        localdata.setVar('OVERRIDES', p)
> +        rename = localdata.getVar('PKG')
> +        if (rename != None) and rename in packages:         
This line adds a bunch of whitespaces at the end of the line.

> +            bb.fatal('package %s is renamed %s using PKG:%s, but package name already exists'%(p,rename,p))
> +
>      ###########################################################################
>      # Optimisations
>      ###########################################################################

-- 
Yoann Congal
Smile ECS - Tech Expert

