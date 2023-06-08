Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D419C7EE25
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 09:19:58 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web11.4800.1686215994659821546
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 02:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=hsdrvqjP;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-3f735259fa0so2948225e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 02:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1686215993; x=1688807993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oiKvNEcYbfRKO50Ekt1lOgdSyt2saa42/ATrTFkDYTI=;
        b=hsdrvqjPFAN0PqLdbmzlTnWca0RilxIIRmKS2RhIA+aW1REkO3Xv65/iHO94T+sitV
         c3SXQSqSGzOdxveByz+jGTzAEoIrDyaEI0dFV1OPEnyGJj8j4BcdlVQ0grDS1IWf0CkZ
         Foq+PcuOIBqGtlw+MxZ1ZutRIAvJhNB1Z9ZD0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686215993; x=1688807993;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oiKvNEcYbfRKO50Ekt1lOgdSyt2saa42/ATrTFkDYTI=;
        b=lamTgAClQ+nC2ceiKq4MzQ+SLLm4LGbr7Jkyfnz+PSigP87HDHyWBAEAC1jeYujo2J
         T6nhw3lOGlNmNxeGFXI70aExhtKeafsujzfTm0n0edfB/5lIygx02+BsGpiBOZTHsVyh
         46lIQKcKeoLvOVhjRUGbLWbNyJbjK4E+S+jEPOZ2mNTAfh50di2t+So0OpKwOM4AgS7K
         0z05ZMfv82gZj4nedLkOSQ8hCNf0vyB1SfDZOe4B//gBWASaqGToM7w49nH+9+g9GpFn
         AyaOg6tBn0EpDGqxj106zil+6prFbGstW79ly0+jm77w+GOI3J9LPXgAYjjNjIELRDag
         QOMg==
X-Gm-Message-State: AC+VfDwV63AFye9TaxbAKCJT4JN7yKJnWg+BHPSPVqj9tRL8sdzv0u83
	BMvIQ8iDX5ZFTae+FL8GM1KQEg==
X-Google-Smtp-Source: ACHHUZ7kutazVG6aR1zhi7NleR1hLGz/XwNsJaZkpnNPuFmuwZ8VvPa6oWefYEuCdn7ii84lYUXGOA==
X-Received: by 2002:a1c:6a11:0:b0:3f7:16ed:4ca3 with SMTP id f17-20020a1c6a11000000b003f716ed4ca3mr943831wmc.1.1686215993090;
        Thu, 08 Jun 2023 02:19:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:316b:ce77:4e88:2f02? ([2001:8b0:aba:5f3c:316b:ce77:4e88:2f02])
        by smtp.gmail.com with ESMTPSA id w11-20020a1cf60b000000b003f605566610sm4594438wmc.13.2023.06.08.02.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 02:19:52 -0700 (PDT)
Message-ID: <a5e311b0545dc84f64d985ffcbd595bff2f2a2ff.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC] incorrect parsing of sysusers.d in rootfs
 generation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Louis Rannou <lrannou@baylibre.com>, tgamblin@baylibre.com, 
	"openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Thu, 08 Jun 2023 10:19:52 +0100
In-Reply-To: <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
References: <b02fd7f2-b6f7-01f6-256a-d1bf9f7aa91a@baylibre.com>
	 <08e9842b-0288-92c9-6327-a82e37f4af99@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 09:19:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182499

On Wed, 2023-06-07 at 17:16 +0200, Louis Rannou wrote:
> Hello again,
>=20
> a python solution could be one below.
>=20
> Also, I found that most of users/groups defined there are redundant as=
=20
> they already exist (such as root). I guess they are defined from=20
> base-passwd. I am not sure which recipe (base-passwd or systemd) should=
=20
> have the precedence on this. If it's base-passwd, perhaps this=20
> postcommand should check first if the user does already exist.

I'd say base-passwd should likely be the winner but we should probably
error if there is a conflict between what sysusers.d and base-passwd
are defining.

Cheers,

Richard

