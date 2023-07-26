Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D42AC0015E
	for <webhook@archiver.kernel.org>; Wed, 26 Jul 2023 12:38:20 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web11.9902.1690375090675413952
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jul 2023 05:38:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=BzE+4lEi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3110ab7110aso6225966f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 05:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1690375089; x=1690979889;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xBRr1IIqUn4Cn4cmt4h0VCqkNWDPYdAkpbQZQivwsLA=;
        b=BzE+4lEiL7y4wqp01KPh4FDS2daY4BrtCcAJnLTwiTSZZfNksTY+UfgaZEP0UIlBY3
         gtAwfkt+vzfUfpjU01ssnEluQPjL437Ic78BT6buczBZGWDAFZBs3fDfHoKw64mnGzIG
         o9N9vvx2ev6jdBVH6rT0oJV58KHY0B9wdwCKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690375089; x=1690979889;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xBRr1IIqUn4Cn4cmt4h0VCqkNWDPYdAkpbQZQivwsLA=;
        b=AMpOIzmIzfnBE2mwy0F3k87OH3Ul/GJ3PxYqGU4Cr1ir7DnPaixjys5R5GIFVypVCi
         LGX+mMxqh8W5muWUA11AjtTY0UQrKZb/jhESDU3yAxW1+WWDmQ3xkmlgb7o05IJv7fbb
         RjmeVlyAM1ll0LnRbzwJcMXQuhtnwYCuSZb5R58pBIizbChTWYAsronLw07PknFM7mjQ
         UE/i5Rls0tDHG7IsQgmgEZv4xHBSI0LG9IX3FNzQauluw239EbojHbdYVMmi+jTe6KkQ
         +DH4TwZkH8kfVmDUV/c6yRCxGcdvu/ZGgybesBrvt85fn7UkGpeo4bgXguYY3A/Cehg6
         GiGQ==
X-Gm-Message-State: ABy/qLZR4ldhFIcf7nIvwN+0nw//6nIh3aaFbAkcrOcJJ7bH+391wCxZ
	R9vkDI8ar2jBJPm60otIOhRKAA==
X-Google-Smtp-Source: APBJJlE0W/8jW3KqHMOFJQGzOFtMKLjsBpq3CI99RBIG3j5DbYP7C8AmxWw+cczklC0pRtEyEFKo7Q==
X-Received: by 2002:a5d:58d7:0:b0:314:3a3d:5d1f with SMTP id o23-20020a5d58d7000000b003143a3d5d1fmr1435960wrf.19.1690375089032;
        Wed, 26 Jul 2023 05:38:09 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:b15:acff:c09:f648? ([2001:8b0:aba:5f3c:b15:acff:c09:f648])
        by smtp.gmail.com with ESMTPSA id w16-20020adfec50000000b003143867d2ebsm19757331wrn.63.2023.07.26.05.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 05:38:08 -0700 (PDT)
Message-ID: <b060f2ad6fc528e10eb8bc127d5081c4b912e60b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] oe.data: allow to mask out secret variables
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: enrico.scholz@sigma-chemnitz.de, Alexander Kanavin
 <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 26 Jul 2023 13:38:07 +0100
In-Reply-To: <lywmymubhx.fsf@ensc-pc.intern.sigma-chemnitz.de>
References: <20230726110946.129932-1-enrico.scholz@sigma-chemnitz.de>
	 <CANNYZj_kQcXA6hfDJBCMrE9DjP5dkoHsFwozzM5oKpuMzecNyw@mail.gmail.com>
	 <ly1qguvr0c.fsf@ensc-pc.intern.sigma-chemnitz.de>
	 <CANNYZj_AoYEoVWgJ35mxMKj=xgcysP9HzVQT39DG=HFYcR6rNA@mail.gmail.com>
	 <lywmymubhx.fsf@ensc-pc.intern.sigma-chemnitz.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Jul 2023 12:38:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184882

On Wed, 2023-07-26 at 14:02 +0200, Enrico Scholz via
lists.openembedded.org wrote:
> Alexander Kanavin <alex.kanavin@gmail.com> writes:
>=20
> > > Else, there are sometimes not many ways to work without them.
> > > E.g. SSTATE_MIRRORS has contain the secret token because it is
> > > used directly by bitbake; perhaps I could use a wget wrapper and
> > > write a custom curl python class...
> >=20
> > Yes, the secret needs to be in a file (or other access-controlled
> > facility), and read from it by the process that needs it, and only
> > directly prior to using it. Having it in a bitbake variable which gets
> > passed through a million tasks and components
>=20
> Where is the problem?  I known only one component
> (rootfs-postcommands.bbclass) which dumps the whole environment and
> leaks it.
>=20
> Else, when there is a malicious component that wants to steal secrets
> from a bitbake variable, what would stop it from reading the secret from
> a file?
>=20
> Your suggestion (write secrets in files instead of bitbake variables)
> does not improve security but causes only extra work.

It does improve security since there is an extra step to get the data
and you can more easily audit when that data is accessed or present.

I'd also note that there are patches under review to change rootfs-
postcommands to only export a known list of variables for other reasons
so this problem should go away when we get that patch merged.

Cheers,

Richard

