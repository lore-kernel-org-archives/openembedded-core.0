Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F793D68B1A
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 14:02:19 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web11.36923.1731591332596832538
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Nov 2024 05:35:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HDCtuulE;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: majortomtosourcecontrol@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a6ababaaa9so2454465ab.1
        for <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731591331; x=1732196131; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A4VRIbaD6XOLfttKJWwzX1/+ThPHv9/6+Slkyy+juX8=;
        b=HDCtuulElgXuRdbjvtytQRO6UMRhuz0d+jrTYcMQOw6iTT4ALB0jtTGG2uySHNBEAI
         /wqKM0+6d6uilcvi6LsQhvkQy/sTqF0PNBjTy0FqwY9RD2Jyxx+2PS9k6ZKAQAW5xTCG
         lKgu3XdbUQsGodcIaswoBPjfp42yEr0yHnuUvUVi263WTGlXQy0ZEHp+Kn+e4llJZjaF
         GXnCiAE6eSgM8+tR2A4vm4nE1XT/BAus7A/liKDWUPrafBTheWwuuJ4rq7pOlK0Sr6wT
         fbJvtq9jjAL8AAZTIoBPUmU8GZfH6ClJybidglSwcd/I0LyhhKW7a9K+OPIEH1Ftiomz
         U3Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731591331; x=1732196131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A4VRIbaD6XOLfttKJWwzX1/+ThPHv9/6+Slkyy+juX8=;
        b=XoPXOdbD7mOqFB4aTDnNwMjOqrVzxBPFhv9yGsoq+UL3ZrjSevXJkIpYSjqSgcpxMF
         i1ojHWoFq62QYs/Crgl8QcTeLPozADgbcPPba5uzNRemp+fLJmR9tfbLsIdLVknG5ns4
         oRmX/aOzDghbLkD+QNoWwktg6lywv8R34SBLw6Jr03p+b8GhPIsnJ9LnGYUXAlqwwK6Z
         mnsNoZwHKpm+Llqwmle8M+GVfFpQAPSnoOVK2CF0OnnRe9OmgBzl8KY/pQyIBJ/C1PL1
         hgYILSmRqOg7zCSONNT1CjDKkJ6N54RawejXQdmmz/BIF7DoPrQY1Uy+uS+EVUikCGnn
         odLQ==
X-Gm-Message-State: AOJu0YxjJTBLxBiaqMRgC4JdZ73NfJALDimt387KW0iFl5UpDI14Csuy
	tY+Hc0Lzx9vE0TvKiJgJfn4XDUlxivJekeM09VKSz0cTS4zULd4btUu3ew==
X-Google-Smtp-Source: AGHT+IHxZNpjNdB0AY8eeGSw16W8ekITXHuNwblKw/J2orrRrVwFIGX422EYit4/jGimjcbLP3nj7Q==
X-Received: by 2002:a05:6602:1350:b0:83a:a8c6:21ad with SMTP id ca18e2360f4ac-83e4fad27ecmr724310639f.7.1731591330557;
        Thu, 14 Nov 2024 05:35:30 -0800 (PST)
Received: from [172.26.252.3] (174-29-213-205.hlrn.qwest.net. [174.29.213.205])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e02fc98bcesm262926173.72.2024.11.14.05.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 05:35:30 -0800 (PST)
Message-ID: <72af1bc8-f20a-4fc8-926a-1418580f303d@gmail.com>
Date: Thu, 14 Nov 2024 06:35:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] uboot-sign: fix concat_dtb arguments
From: Clayton Casciato <majortomtosourcecontrol@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: randy.macleod@windriver.com, yoann.congal@smile.fr
References: <b676cb1d-53f0-403d-969f-e0bfdaedc4cc@gmail.com>
In-Reply-To: <b676cb1d-53f0-403d-969f-e0bfdaedc4cc@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Nov 2024 14:02:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207167

Hello!

I am looking for feedback and/or the status for this patch.

Thanks!

--
Clayton Casciato

On 11/7/24 10:10 AM, Clayton Casciato wrote:
> Fixes [YOCTO #15642]
> 
> Ensure empty argument passed from do_uboot_assemble_fitimage is passed to
> concat_dtb
> 
> Signed-off-by: Clayton Casciato <majortomtosourcecontrol@gmail.com>
> ---
> Sponsor: 21SoftWare LLC
> 
>  meta/classes-recipe/uboot-sign.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-recipe/uboot-sign.bbclass
> index 3e5f5dcf66..a17be745ce 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -338,7 +338,7 @@ uboot_assemble_fitimage_helper() {
>  	binary="$2"
>  
>  	if [ "${UBOOT_SIGN_ENABLE}" = "1" -a -n "${UBOOT_DTB_BINARY}" ] ; then
> -		concat_dtb $type $binary
> +		concat_dtb "$type" "$binary"
>  	fi
>  
>  	if [ "${UBOOT_FITIMAGE_ENABLE}" = "1" -a -n "${SPL_DTB_BINARY}" ]; then


