Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web11.23696.1590705190032320672
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 May 2020 15:33:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=U2a1odWa;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f67.google.com with SMTP id f5so924560wmh.2
        for <openembedded-core@lists.openembedded.org>; Thu, 28 May 2020 15:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=+agpB9FTgzwOG+avDS/gwtCQV/99EL2vf0lm599sq2k=;
        b=U2a1odWaPSbUH2gQ/jSWz0OquKpJF3dF17PxJAPIvdIH3c51KRsCkARqBw7OwqtJJP
         fGU+UQiUGOyEhMBrGrW2rl3gH2zoz8MnyToA1MCGPrzmKxTf5TGiT8k7cipuIOklFRp3
         9HVR70jYbG4jZ6MIpKErwXGlymkecnyG8jYmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=+agpB9FTgzwOG+avDS/gwtCQV/99EL2vf0lm599sq2k=;
        b=BrmfZWMS0paSAc40QVuXqy6WBnG7AXJKuWrlm4dRXGMZHmJPStYC2XdrxNYplJeMrU
         h1Q+Cm/kWZsOo/uneYiqTDlrPPscc3xEIGn2Ny+I/eIC/qqJI8t0oLuv7VcfsEQTmddG
         tujRTqrevJQPhnaVGxYqoDNNPS0kwjZxo/J+bFhotRaGj3VeaAXbIJkxRDgw4Bt2a6hj
         tMDMcl/gvr3Wz1j9c/lmZYJrGYEOA5KwiKc47LTfNI4cZMGyPK5kh7mJoHEW1zSkNDQ5
         5VV9ebd5NWYoap+WBjRM1j798nL+SrwABKCDkUi9ty3LNwsLvJ+nd/CCN9T7BplYVdPN
         vGAA==
X-Gm-Message-State: AOAM533Qr4AmqkwYZ96qFj5iwgExu/l7BbVKUzPq63WxCnkWfWj0HUQV
	BYGQrTgZo//vsde2PpVQbTPWwQ==
X-Google-Smtp-Source: ABdhPJw2oZ9X+HXbnGwwN9qV7afz3CfZQDV/5DUGaGVv8NJffs7oYLdgkAwdhRofakEdMey8gYWoBQ==
X-Received: by 2002:a1c:6606:: with SMTP id a6mr5134933wmc.37.1590705188398;
        Thu, 28 May 2020 15:33:08 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
        by smtp.gmail.com with ESMTPSA id h15sm7232217wrt.73.2020.05.28.15.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 15:33:07 -0700 (PDT)
Message-ID: <093d7ef6b140d6a3bae4364daef6992068747329.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] devtool: Add IPv6 deploy targets targets
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: Breno Leitao <breno.debian@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 28 May 2020 23:33:05 +0100
In-Reply-To: <766e8cd6-1d5d-f149-ddd0-025e5c6a086d@debian.org>
References: <600e41e7-645c-7806-9580-6db458004a25@debian.org>
	 <766e8cd6-1d5d-f149-ddd0-025e5c6a086d@debian.org>
User-Agent: Evolution 3.36.1-2 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2020-05-27 at 10:51 +0100, Breno Leitao wrote:
> From: Breno Leitao <leit@fb.com>
> 
> Unfortunately devtool is not able to deploy (and undeploy) into IPv6
> hosts.
> 
> This patch simply adds a way to use IPv6 target address similarly to
> ssh/scp, as foo@[xxxx:yyyy::zzzz]:/destdir.
> 
> In order to do it, I've created a function that parses the hostname,
> user and destdir, and then create a target_ssh (for ssh like
> parameter
>  -- foo@xxx:yyyy::zzz) and target_scp for scp paramers as
>  -- foo@[xxxx:yyyy::zzz]:/destdir. The urlparsing is done by urlparse
> module and ip version discovery is done by ipaddress module.
> 
> This is the tests I have been using to validate my patch
> 
> IPV4_FORMATS="
>       root@11.11.11.2:/tmp
>       root@11.11.11.2
>       11.11.11.2:/tmp
>       11.11.11.2
>       "
> 
> IPV6_FORMATS="
>       root@[2620:10d:c0bb:403:dac4:97ff:feda:3325]:/tmp
>       root@[2620:10d:c0bb:403:dac4:97ff:feda:3325]
>       [2620:10d:c0bb:403:dac4:97ff:feda:3325]:/tmp
>       [2620:10d:c0bb:403:dac4:97ff:feda:3325]
>       "
> 
> HOSTNAMES="
>       root@foo.bar:/tmp
>       root@foo.bar
>       foo.bar:/tmp
>       foo.bar
>       "
> 
> for I in $IPV6_FORMATS
> do
>   devtool deploy-target -6 -s mypkg ${I}
>   devtool undeploy-target -6 -s mypkg ${I}
> done
> 
> for I in $HOSTNAMES
> do
>   devtool deploy-target -s mypkg ${I}
>   devtool undeploy-target -s mypkg ${I}
> done
> 
> for I in $IPV4_FORMATS
> do
>   devtool deploy-target -s mypkg ${I}
>   devtool undeploy-target -s mypkg ${I}
> done
> 

I think this breaks our selftests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/976
(and others in that build)

to reproduce it should be a case of running:

oe-selftest -r devtool.DevtoolExtractTests.test_devtool_deploy_target 

Cheers,

Richard

