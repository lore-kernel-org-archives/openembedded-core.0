Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52281C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 00:20:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.2221.1646180417037263823
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:20:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=einTmKMY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id i8so177444wrr.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Mar 2022 16:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=TWlCS4A93MfWPGFt1uRU89PNdGIBqndNPE8/3TFGM4I=;
        b=einTmKMY09ka62JId22+wCabNWmKhcgv+v01dNqrSoXFLWt1FaC59qoJRp8PfbKev7
         5Kd7iLrDmwkCAMKalOCQb3qQlqPCf5726Nw373hXXADePv0j9di62g3Z2JTynqJone5f
         1/TQHgTdQnFr/a/aO6aTNQ5ruAoe2P+L5070Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=TWlCS4A93MfWPGFt1uRU89PNdGIBqndNPE8/3TFGM4I=;
        b=lM1r8T7PatxiEWxiIwjUe5k64vDsCRJ/UVhw0IuvmSU+gG9d9Ps2wNh0NzjGaJ+7VL
         JGQpboQHmhr1pAHc3R7ts7WUIbsnNit2udM0/prSUuHTVFCCsXsefBzMsNuLuh/nuP6H
         onVSRH+P0I0S6xd623GCbAZCi8b5jsotB+ZX9yMG3pibVTmXhIhFnvkbcBPDoev/0Zvo
         rK5sl22DDaf0lJaWa1mo1tuS+ZmrNvLp+iMdb4bqZIceTJj2dfNNGO7T78dR5Eu9CU/6
         qJuEJjb3QThF/qzBD4hBcQn2vifQ/1d5wA/ftwjqzrE0GfLuIMSBrwRs28RH8OGeXtDh
         iNwg==
X-Gm-Message-State: AOAM532hMDp4c2Y7VQ5VuhZPA9sY+S9MK8TkoQff4s3Fs8rL8JwXJ+BH
	53FLJW+K6YwpKtA7G8xk0kuTeQ==
X-Google-Smtp-Source: 
 ABdhPJyim0NaBiKnySTslAaAwk1dILylkhhyJKcnbchkELWR1xzai209jGCIoeyo4oXSI49oQHZvmA==
X-Received: by 2002:a5d:5707:0:b0:1f0:1815:be86 with SMTP id
 a7-20020a5d5707000000b001f01815be86mr3621468wrv.383.1646180415359;
        Tue, 01 Mar 2022 16:20:15 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17?
 ([2001:8b0:aba:5f3c:8c1b:f0a1:b483:4e17])
        by smtp.gmail.com with ESMTPSA id
 az37-20020a05600c602500b0038144e509dfsm3950201wmb.20.2022.03.01.16.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 16:20:14 -0800 (PST)
Message-ID: 
 <9ee751152333845c93c411b467090f007d63c9b3.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH] multilib_global.bbclass: fix setting preferred
 version for canadian recipes
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Chen Qi <Qi.Chen@windriver.com>, openembedded-core@lists.openembedded.org
Cc: Lee Chee Yang <chee.yang.lee@intel.com>
Date: Wed, 02 Mar 2022 00:20:13 +0000
In-Reply-To: <20220301081218.25469-1-Qi.Chen@windriver.com>
References: <20220301081218.25469-1-Qi.Chen@windriver.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Mar 2022 00:20:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162584

On Tue, 2022-03-01 at 16:12 +0800, Chen Qi wrote:
> Currently the TRANSLATED_TARGET_ARCH is not changed when trying
> to set preferred version for canadian recipes.
> 
> e.g.
> ```
> bitbake core-image-minimal -c populate_sdk -e > env
> grep ^PREFERRED_VERSION_gcc-cross-canadian env
> ```
> The result is:
> """
> PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> """
> 
> We need to explictly change DEFAULTTUNE to ensure TRANSLATED_TARGET_ARCH is
> changed when trying to set the preferred version for multilib version of
> the canadian recipes.
> 
> e.g.
> ```
> bitbake core-image-minimal -c populate_sdk -e > env
> grep ^PREFERRED_VERSION_gcc-cross-canadian env
> ```
> The result is:
> """
> PREFERRED_VERSION_gcc-cross-canadian-i686="11.%"
> PREFERRED_VERSION_gcc-cross-canadian-x86-64="11.%"
> """
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  meta/classes/multilib_global.bbclass | 3 +++
>  1 file changed, 3 insertions(+)

This seems to break multilib builds:

https://autobuilder.yoctoproject.org/typhoon/#/builders/44/builds/4844

Cheers,

Richard


