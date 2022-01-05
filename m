Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 226DFC433F5
	for <webhook@archiver.kernel.org>; Wed,  5 Jan 2022 11:24:45 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.5718.1641381884392345505
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 03:24:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FrI77mkw;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id l10so923808wrh.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Jan 2022 03:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=5fWgYfMWhETILIibENacHXlnOs7/uWC3gHo1+++Hx3Y=;
        b=FrI77mkwUF2vLm+bmiJGOQQ+EBeNBoWIkfcGgzIkITrLynagy0kZwuS/4tuVI6xIAF
         KQ5AoiPDwI2IbbpxBzbX0afOsihXEm5gohJPgjAokoz2qtn6bHctagw5XLCmBtq1zqck
         etNn38ud3cAC9K4OaKE0/I2TH72EbvW7gFOPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=5fWgYfMWhETILIibENacHXlnOs7/uWC3gHo1+++Hx3Y=;
        b=Z15EjWV8rBMoZ/t6iwPJoBhzTZkw3w3lHXh22aoa5BPyy4evasyNlgHONMV3gcyhjB
         s7IdcQXYjx7kChn44Yedq5BOjt8ApgcKV+1FqoQ64I8ej0xoXzXjmU5rQnr2bgiqjeHz
         c4Lpc32lOgyLFMCCkQYRacLtJ6zLL9o63L2jyClho5AT/eOu2+vkuA0QCOgqNoL/bW1e
         Duxk2RlXfjgS8TMU7/EWdV46gq2bVPnd4z/TuX9jX5Vk/+C/yjZPPRl5BVF04/7XwHDl
         JXTwgEqssiMQLSbmZTmG2dD2IFOcRBv71JDsAGiufR1+PedKZcUQ9GflMi4XAxSHK961
         lIQw==
X-Gm-Message-State: AOAM532iFuQBLszlmdFTLe6eacMD5ylCnQf22/4mmyhfFhvzL7U9dZ0g
	gHyODkcCLuTkMiA3bKBeuYVt0g==
X-Google-Smtp-Source: 
 ABdhPJxwSERLbPwenmrhyx9psIJ7ZFTABukR5HxjvMPeU4UnsTz+xsUmkzt8RCupgRLMrWrriW16+Q==
X-Received: by 2002:adf:dcd2:: with SMTP id
 x18mr46201573wrm.173.1641381882846;
        Wed, 05 Jan 2022 03:24:42 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c?
 ([2001:8b0:aba:5f3c:4930:6fc6:9dcd:7b1c])
        by smtp.gmail.com with ESMTPSA id
 g18sm41093703wrv.42.2022.01.05.03.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 03:24:42 -0800 (PST)
Message-ID: 
 <d23c4c620f3a5d66109896ab5a4716aa8fc7dae8.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] populate_sdk_base: remove useless dirs such as
 /dev
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Date: Wed, 05 Jan 2022 11:24:40 +0000
In-Reply-To: <20220105060154.68560-1-Qi.Chen@windriver.com>
References: <20220105060154.68560-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Jan 2022 11:24:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160181

On Tue, 2022-01-04 at 22:01 -0800, Chen Qi wrote:
> We met a problem that core-image-tiny-initramfs's SDK cannot be
> installed. The error message is like below.
> 
>   tar: ./sysroots/core2-64-poky-linux/dev/console: Cannot mknod: Operation not permitted
> 
> In fact, the '/dev' direcotry is useless for SDK. So remove it.
> 
> This patches uses a variable, SDK_USELESS_DIRS, to hold useless dir entries
> so that it could be extended. For example, '/usr/bin' could be added if wanted.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/populate_sdk_base.bbclass | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
> index fafdd96749..d4065b9b13 100644
> --- a/meta/classes/populate_sdk_base.bbclass
> +++ b/meta/classes/populate_sdk_base.bbclass
> @@ -92,6 +92,8 @@ SDK_HOST_MANIFEST = "${SDKDEPLOYDIR}/${TOOLCHAIN_OUTPUTNAME}.host.manifest"
>  SDK_EXT_TARGET_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.target.manifest"
>  SDK_EXT_HOST_MANIFEST = "${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.host.manifest"
>  
> +SDK_USELESS_DIRS ?= "/dev"
> +

I think this is the better approach to solving the issue but I don't agree with
the name "USELESS". Something like SDK_PRUNE_SYSROOT_DIRS would probably better
describe what the code is doing.


>  python write_target_sdk_manifest () {
>      from oe.sdk import sdk_list_installed_packages
>      from oe.utils import format_pkg_list
> @@ -103,6 +105,12 @@ python write_target_sdk_manifest () {
>          output.write(format_pkg_list(pkgs, 'ver'))
>  }
>  
> +delete_useless () {

This needs some prefix so we know it is sdk related as well as the useless name
change.


Cheers,

Richard



