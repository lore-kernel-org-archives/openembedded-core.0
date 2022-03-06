Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D84A0C433F5
	for <webhook@archiver.kernel.org>; Sun,  6 Mar 2022 21:22:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web08.19770.1646601773366360137
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 13:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FUw3vXeb;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id
 m42-20020a05600c3b2a00b00382ab337e14so9064036wms.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Mar 2022 13:22:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=x2chBmNJnnxsl5chnRYHretG9vFEydsxcdOERmNyb/k=;
        b=FUw3vXebC0/BM1r3FAZ4YmkD0hBycdqj+10+konsQZRmjcU/lDnZU++fK2GY7kIAQK
         4XGpqGOmO7ddzT9wJTVfF/L7kbskddVVu0/4SH7a+19Mj5Cgfg9OC/jIhsnsKy4HfCfm
         vjHt3nRPCloLODndnQLov0UwC2SQBe6mo0OS4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=x2chBmNJnnxsl5chnRYHretG9vFEydsxcdOERmNyb/k=;
        b=tIY2UOFsUDX2UXLrRZO1PLxzjOsklcNQKxKCMTswr5ZsawZzv5Tq752warOu6wseQc
         pYftrqbGqDMD9eEqKcKy0YHb3EgPCBVhMNMdGCSGgYvljjz39eQWbY9W7mrh8EhphslE
         4IRQfMRQWldDh6w/R1jZ9QvVsUeSAKTOeN6J8/CtZlYXJ3WLv3aLC9ZA7fcRE3BAlJew
         Uz1qG9z/DeC/ehHIHtHjmcOdb9LrWqgM3QeTd4iHAAxJsmw4N1APcu/ZjoO/ifjwHMnY
         vz6vuPLn12dxV+fJy2GhM0NYfPb707XYJGKboDGV6MdazSYY/zSd007/l4GOcDNUOtY8
         RP+Q==
X-Gm-Message-State: AOAM533Qu2CquaqqBO2eAPJ+wj2ghkwo7b+ZqrG8w5+QlRy7ONdv1gg5
	xFs4RHT7CU1VcJVVnpUVOfnfcw==
X-Google-Smtp-Source: 
 ABdhPJykRbNLHv9mNNMNqlotfOEoGJgeqB3zzhWxhkI2Dz7iOdHJrwMZXcJzptPphhPrSyUDVCFc+A==
X-Received: by 2002:a05:600c:20a:b0:389:9d03:3439 with SMTP id
 10-20020a05600c020a00b003899d033439mr4707062wmi.48.1646601771892;
        Sun, 06 Mar 2022 13:22:51 -0800 (PST)
Received: from hex.config (5751ab90.skybroadband.com. [87.81.171.144])
        by smtp.gmail.com with ESMTPSA id
 v25-20020a05600c215900b0038117f41728sm17693219wml.43.2022.03.06.13.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 13:22:51 -0800 (PST)
Message-ID: 
 <dcdeda69bf242df78f2675ff9045654e97b1f0cb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] sstate: inside the threadedpool don't write
 to the shared localdata
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 06 Mar 2022 21:22:50 +0000
In-Reply-To: <20220306210823.53177-1-quaresma.jose@gmail.com>
References: <20220306210823.53177-1-quaresma.jose@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Mar 2022 21:22:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162791

On Sun, 2022-03-06 at 21:08 +0000, Jose Quaresma wrote:
> When inside the threadedpool we make a copy of the localdata
> to avoid some race condition, so we need to use this new
> localdata2 and stop write the shared localdata.
> 
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  meta/classes/sstate.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/sstate.bbclass b/meta/classes/sstate.bbclass
> index dc9a2c085b..7aca415159 100644
> --- a/meta/classes/sstate.bbclass
> +++ b/meta/classes/sstate.bbclass
> @@ -988,7 +988,7 @@ def sstate_checkhashes(sq_data, d, siginfo=False, currentcount=0, summary=True,
>  
>              localdata2 = bb.data.createCopy(localdata)
>              srcuri = "file://" + sstatefile
> -            localdata.setVar('SRC_URI', srcuri)
> +            localdata2.setVar('SRC_URI', srcuri)
>              bb.debug(2, "SState: Attempting to fetch %s" % srcuri)
>  
>              import traceback

That looks like a good find and may explain a few things!

Cheers,

Richard


