Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFC0C4332F
	for <webhook@archiver.kernel.org>; Sat, 17 Dec 2022 11:22:50 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.5589.1671276165515826914
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Dec 2022 03:22:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dbqvTqLI;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id ay14-20020a05600c1e0e00b003cf6ab34b61so5726700wmb.2
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 03:22:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0dxkHBTYDTamGvgki4QuTMf6aleVpfbITcf25Kv0d6Q=;
        b=dbqvTqLIlsGs/YhGR/nH5uLiPCr0o8krjZSI2TFzGxToMtuWMMIsPvg8eX3Tqdbcym
         DUmGd8QHNocbUZdWadJ92lRQh96qGXkAOHztOKIrBd0iy5kwmkHchi11FTT2CYI5mQsa
         v/0waHJMdaPf5E+AE+1ZENL5/mULveBfVRhqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0dxkHBTYDTamGvgki4QuTMf6aleVpfbITcf25Kv0d6Q=;
        b=NR7pkTHEMoN9SPYuGV0ZLQ7hHFOf0GrXDF88hzOvw6UgUoFtacI0zycXdvjOAHVNsp
         0dtilrGmXvz/LvCQfOT3yiX4px//W83NpkMkyhPaU2VLQJJtxijz9TgDnvkgmwqH9Djf
         ontIR69V+VCwdbtvzWOOOumxqU/p86NukpatZuNs/IJKgde/KzdwJkcZ2LwKs1X8WoqR
         n50H/RExGDNMFLjYI5aayLI2YxouphC2qcfokB72h4e4P/S28TY60tZQ6qI1grEIiVS1
         CW+SO5Xx3u7q2GONBycPkiwCbC8xCl0y9/jbsLDCeoOfPxV6w7gfMMKBJ85scQfPuM9i
         essQ==
X-Gm-Message-State: ANoB5pkIHneSQQluOQZtxEFCKdANdJElxsHAOV8tzuNGY516l8L2UgZk
	HWXnh6w1mzIFderOx/kH8MqEi8FeMdouqW2V
X-Google-Smtp-Source: AA0mqf7OwuFba5ey8YWT8p84UIxU9s6jpXw0rDSErfqt/JBnCD0IMIwyhBAwOzBVU8OsTAfRsjCyJw==
X-Received: by 2002:a05:600c:3acc:b0:3cf:9ac8:c537 with SMTP id d12-20020a05600c3acc00b003cf9ac8c537mr27732542wms.14.1671276163857;
        Sat, 17 Dec 2022 03:22:43 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6? ([2001:8b0:aba:5f3c:17b:a3fe:f7a:35a6])
        by smtp.gmail.com with ESMTPSA id z22-20020a05600c0a1600b003cfd0bd8c0asm5498220wmp.30.2022.12.17.03.22.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Dec 2022 03:22:43 -0800 (PST)
Message-ID: <d77ebcf6952270c6830fe565e5ee81029b3862df.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] yocto-check-layer: add skip layer support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Date: Sat, 17 Dec 2022 11:22:42 +0000
In-Reply-To: <20221212085612.3204827-1-mingli.yu@eng.windriver.com>
References: <20221212085612.3204827-1-mingli.yu@eng.windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 17 Dec 2022 11:22:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174773

On Mon, 2022-12-12 at 16:56 +0800, Yu, Mingli wrote:
> From: Mingli Yu <mingli.yu@windriver.com>
>=20
> We can define the layers need to check in a file and skip the yocto
> compliance check if the layer is't defined in the file.
>=20
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  scripts/yocto-check-layer | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

I'm afraid I don't really like this idea. What use case are you
solving? Ideally we want people to be obtaining compatible status for
their layers so making it easier to hide or skip layers isn't one of
our objectives.

It also isn't clear from just looking at the patch if this could be
used to bypass some of the layer dependency checks and some of the
requirements of yocto compatible status too. We ideally want people to
be able to reproduce the test status for a given layer without any
special configuration file.

So unless someone can explain why this is absolutely necessary, I don't
really want to merge anything like it.

Cheers,

Richard

