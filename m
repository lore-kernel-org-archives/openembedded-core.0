Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A6E0C433F5
	for <webhook@archiver.kernel.org>; Thu, 10 Mar 2022 21:19:54 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web10.2379.1646947192734293662
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 13:19:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UM7zzPbF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id q14so9961802wrc.4
        for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Mar 2022 13:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=h3a/juK4g2l5fTneqUKwi/Am271Z7spI/sAIJ4Csfog=;
        b=UM7zzPbF4tXSG1nGc+vy/kbN+K9bct9JxxAUeyDZ5sej9lhNFiZaw6j1oame+ER33W
         6VPKdW2qx5FDlfR/VzE1x9QJkKoW6UDdoP6tqjNLEM9dCxhn3adxJk+bCmsx/y74vNTV
         VV8dagFQtPFmC0uplg2vQacnFqd+6Q1fssjqQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=h3a/juK4g2l5fTneqUKwi/Am271Z7spI/sAIJ4Csfog=;
        b=fK4kAIbBT8/BAI0y5KzYwriIiOQNrHnJTHGjgNFjX3NZ7XJlp21H+EjhRYsAGazJYC
         PhC2SORTcq1+rQ8vXQtKSb39ne/HpnSQykFsLlAb3XiQZBEOHBmurX3Pkf8xfin0Jchh
         XyIIQ5nZxnuDhRee/0nGU7ilvlLC3v5iJkuqOtAiIaPjo4Jb8OevgLpltvr1Y6euDJN3
         SKgjj5KX4rhgJG0NosLcO9wSVbM5TmCby4P+3rqeOupBOkLvr9IMaLQx4PkfYN0ikWk7
         fE9jddtcllhxYcxLVYcsy9cTRLpRTAj9AWwEV3hdhrraQZmS1axlabebEiUs8dHRdJDF
         Kuwg==
X-Gm-Message-State: AOAM531ML8Skd++coQ+BAuFmv8PvATCnKl7G45Tdbd6+7dmD+EydDQ5H
	i0O2jt9Zl3VWKNxDXtpwBLKUkA==
X-Google-Smtp-Source: 
 ABdhPJyIaLExNIKnpZBnfEm2nA70plD9uzlH3UCsqnJpZ/5/f5CP0QoSHcmzUuINv0eU31Xcy0r2TA==
X-Received: by 2002:a5d:624d:0:b0:1ef:771d:ca41 with SMTP id
 m13-20020a5d624d000000b001ef771dca41mr5171563wrv.603.1646947191254;
        Thu, 10 Mar 2022 13:19:51 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:2661:a90e:1786:ea48?
 ([2001:8b0:aba:5f3c:2661:a90e:1786:ea48])
        by smtp.gmail.com with ESMTPSA id
 s2-20020a1cf202000000b0038977146b28sm5737033wmc.18.2022.03.10.13.19.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Mar 2022 13:19:50 -0800 (PST)
Message-ID: 
 <2db5d7132c8851ddcab6f8c0abba1312b1e4d970.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 2/2] pip_install_wheel: use installer instead
 of pip
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross@burtonini.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 10 Mar 2022 21:19:49 +0000
In-Reply-To: <20220310171656.3106028-2-ross.burton@arm.com>
References: <20220310171656.3106028-1-ross.burton@arm.com>
	 <20220310171656.3106028-2-ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4-1ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Mar 2022 21:19:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163042

On Thu, 2022-03-10 at 17:16 +0000, Ross Burton wrote:
> Instead of battling pip to install a wheel, use installer. Installer
> does one thing, so it's faster and easier to work with.
> 
> This means setuptools, pip, and wheel are no longer part of the
> bootstrap phase, so they can be built normally.  To avoid sysroot file
> conflicts these three recipes can't install .pyc files to the native
> sysroot.
> 
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/pip_install_wheel.bbclass        | 16 +++------
>  .../python/python3-flit-core_3.7.1.bb         |  2 +-
>  .../python/python3-pip_22.0.3.bb              | 35 +++----------------
>  .../python/python3-setuptools_59.5.0.bb       | 12 +++----
>  .../python/python3-wheel_0.37.1.bb            | 26 +++-----------
>  5 files changed, 18 insertions(+), 73 deletions(-)

I suspect pip is doing some interpreter patch manipulation we're now missing out
on:

https://autobuilder.yoctoproject.org/typhoon/#/builders/62/builds/4865/steps/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/48/builds/4871/steps/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/4868/steps/12/logs/stdio

and many more :/

including meta-arm:

https://autobuilder.yoctoproject.org/typhoon/#/builders/37/builds/4868/steps/12/logs/stdio

Cheers,

Richard


