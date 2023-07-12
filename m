Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B39AEB64DA
	for <webhook@archiver.kernel.org>; Wed, 12 Jul 2023 21:33:49 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web10.2063.1689197620748981797
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Jul 2023 14:33:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bqc4yIk5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3fbc5d5742bso79517015e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 14:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1689197619; x=1691789619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NoIVTAza05O5zs3uFLm1HZu8H1MR5mLzxb+zHUSyy/0=;
        b=bqc4yIk5hYy7o5I4KHGsxIaxHRfb6zF8ArdwyvYZVWZ9H8cgNVlVdgANYYednXCJoM
         S918bbrTChPwknYlVtgdKExVbe9SRlXxt/pBRX7onvZ81GjzQqhfpZXiPaaJIQsBR/0t
         46c5mw+gB7tzwm3gVp/TC2Q1C0xFTQGAM0pV8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689197619; x=1691789619;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NoIVTAza05O5zs3uFLm1HZu8H1MR5mLzxb+zHUSyy/0=;
        b=BmUYB/LtPSKmU/OKSSSQqbve8vw6P54u3haY2v9KrnatUjM88Ex/ffq5h7hPqMeA+L
         BHh3awZYcqtah9XHeb4UYCe8lADueZGfgc0CYg7C/BfpMafR751jEdtP5fPw0227JN9w
         bGSfQx1yYNoReno4xHe9SmHCZvnSV6LVenWRU/JonM3Olg67giUm9aXz319jj4UBbC7v
         CUoDbHvmz3+SjDZ1TqKzPsp9LpqYqR1Elqi8ikCN3QpZBgNnWHxgplOP9wAf90YweAFp
         Xjr4wMlpd0kq8W0OvmQBbfKvaAHaKm2TODkDsHd1xvBXZ/eEmaZHjNv/FgJ25TxUumwn
         cGtA==
X-Gm-Message-State: ABy/qLbGiJkD2vzwr/+IkebgFuf2X2i2ii267YkcriRhfYTZmPABhU1t
	A2TeYSZX4L4twnqOAJL8K7lgLw==
X-Google-Smtp-Source: APBJJlFgwmePQWO6dKIXljPTivkUXKGgDnttiTw45BSGMQavIgRGzKazYkPhRiGJDtJUEicIAR6bJQ==
X-Received: by 2002:a7b:c44b:0:b0:3fb:fef3:53f8 with SMTP id l11-20020a7bc44b000000b003fbfef353f8mr18743507wmi.25.1689197618790;
        Wed, 12 Jul 2023 14:33:38 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:63d8:38f2:4435:df11? ([2001:8b0:aba:5f3c:63d8:38f2:4435:df11])
        by smtp.gmail.com with ESMTPSA id z21-20020a7bc7d5000000b003fbd04ecdc6sm16835796wmk.5.2023.07.12.14.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 14:33:38 -0700 (PDT)
Message-ID: <5649fdf59ba0e5aaeb93552af7f3d8e0e86787a6.camel@linuxfoundation.org>
Subject: Re: [OE-Core][PATCH v4 1/5] bitbake.conf: add acl and xattr distro
 native features support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Piotr =?UTF-8?Q?=C5=81obacz?= <p.lobacz@welotec.com>, Alexander Kanavin
	 <alex.kanavin@gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2023 22:33:37 +0100
In-Reply-To: <VI1PR04MB5373BCEB0EC347625C9A15E09136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
References: <20230712122558.711029-1-p.lobacz@welotec.com>
	 <2f5daca6267d0a7dd9655527ce862fd4ca1b265c.camel@linuxfoundation.org>
	 <CANNYZj9LiFaL8syxNrv5Sc5OfP6xeZJfgRn_LH+ExjuK7XbLzQ@mail.gmail.com>
	 <VI1PR04MB53731CE4B03808CBFFB5B33B9136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
	 <d2d9f29c1d04105c76b6791387fab33662da3cd5.camel@linuxfoundation.org>
	 <177139B6ABA154C9.19802@lists.openembedded.org>
	 <VI1PR04MB5373BCEB0EC347625C9A15E09136A@VI1PR04MB5373.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jul 2023 21:33:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184225

On Wed, 2023-07-12 at 20:48 +0000, Piotr =C5=81obacz wrote:
> Richard, but that is exactly, what I have written=E2=80=A6 wirhout any
> checks.

No, I mean that the right patch should be:

-DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr"
+DISTRO_FEATURES_NATIVE ?=3D "x11 ipv6 xattr acl"

i.e. add acl to DISTRO_FEATURES_NATIVE and leave xattr there.

Cheers,

Richard


