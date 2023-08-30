Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21F8CC6FA8F
	for <webhook@archiver.kernel.org>; Wed, 30 Aug 2023 10:43:52 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
 by mx.groups.io with SMTP id smtpd.web11.10804.1693392227905193568
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Aug 2023 03:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ebf4+OWX;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.169, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2bb9a063f26so82873901fa.2
        for <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 03:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1693392226; x=1693997026; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3sazG+n1C/q7gZqxThX9T43Mq0PcEcckc333QI2qDAk=;
        b=ebf4+OWXbUuAEqcHffl10vH0yWoL2GW9CGfxm/5dLpbWFBSGzVQyCgeKR5kX4/7xZ/
         olGCJ31ZISd5VrwMpb70K10wVnlht3Xoz/pjLgcucsuTXCdAR49/TcOiE34uJfx8wXAt
         65hVC+uR7gTlh6sGeQFXgl4vlY7hlhYvRHa9I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693392226; x=1693997026;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3sazG+n1C/q7gZqxThX9T43Mq0PcEcckc333QI2qDAk=;
        b=JVxdsglJVIptZoWEF0uoglWl4y9hl/STV9Urg/guv+sj8SoQ7RZVQ4N9taKNLbHKo4
         Aa6rZr0e7lbu3Bl5m1GTdlnytifMSEfpEmoUOeJly6ziBTO5K0GfBpQRyWMgQrLFxjdv
         wPuKhFxUa5QtPejHNYf5TpEwhpbPvMdx0oTxiSxGom8JLdAtGYJ2BBmFpt9/SERD94oI
         VTD4YW2aPsDl9P6KJul2Tjw7njlOQt1ddKCnjx2YhYDR8wG5+5MeohuYZsmNUDiKIER4
         jo8D3WlnH9qm2XPwtBOhZEQqntV2doX0jW2VkviJnWCJNzW5y0Z2a00KfNZMLYKPoBYA
         nq/Q==
X-Gm-Message-State: AOJu0YzSsn46Ev8AQeXuKhZIRHrWfm3x9vFe1CMCOq2mYJ/9b6opLb2c
	2TwqlWRkfkzFvEAWJbf+UABLbQ==
X-Google-Smtp-Source: AGHT+IFafvc5qvVBMr/WflNKG4PHFMcpeKSKvWHaijmd5JPkN3pBOoTIghTs+JMrXSiMglMAHGiHvQ==
X-Received: by 2002:a2e:9953:0:b0:2bc:c830:4cbb with SMTP id r19-20020a2e9953000000b002bcc8304cbbmr1474117ljj.45.1693392226050;
        Wed, 30 Aug 2023 03:43:46 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:15ec:a052:9304:60a5? ([2001:8b0:aba:5f3c:15ec:a052:9304:60a5])
        by smtp.gmail.com with ESMTPSA id z23-20020a1c4c17000000b00401d8181f8bsm1863331wmf.25.2023.08.30.03.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 03:43:45 -0700 (PDT)
Message-ID: <79e85363c2faa263f9089c22d5b11809f9eaa919.camel@linuxfoundation.org>
Subject: Re: [OE-core] Dilemma on changes - merge or not to merge (e.g. 6.4)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: Paul Gortmaker <paul.gortmaker@windriver.com>, Rasmus Villemoes
	 <rasmus.villemoes@prevas.dk>, openembedded-core
	 <openembedded-core@lists.openembedded.org>, Bruce Ashfield
	 <bruce.ashfield@gmail.com>
Date: Wed, 30 Aug 2023 11:43:44 +0100
In-Reply-To: <177E8CC0D944344B.23833@lists.openembedded.org>
References: <177DAFEBFB5EB0D2.24073@lists.openembedded.org>
	 <d7982e9549e8e8042dfdfdaa4f3173684aa726bb.camel@linuxfoundation.org>
	 <ZOSoIXLG7vH/GC1l@nuoska> <177DB4530EBE3FA3.24073@lists.openembedded.org>
	 <177DBC07E94591CC.4797@lists.openembedded.org>
	 <177DD0B30D8FEDF8.27837@lists.openembedded.org>
	 <177DD39B5534099F.27837@lists.openembedded.org>
	 <177E1FB73F514F09.8058@lists.openembedded.org>
	 <177E56C1DFAB4DFC.13053@lists.openembedded.org>
	 <ae98c59b507b7e5342f832e7b3e8814ac793592c.camel@linuxfoundation.org>
	 <ZOhJuUWYSU8MmaCK@nuoska> <177E8CC0D944344B.23833@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Aug 2023 10:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186883

On Fri, 2023-08-25 at 07:34 +0100, Richard Purdie via
lists.openembedded.org wrote:
> > >=20
> > > qemu 8.1.0 brings with it a new set of problems but I've reproduced t=
he
> > > hang with 8.1.0 so it does not solve that.
> > >=20
> > > I'm really struggling to understand which change brought in these
> > > issues for qemuppc.
> >=20
> > Are these issues visible on mickledore branch? Maybe mickledore with ke=
rnel 6.1 stable update or
> > qemu 7.2 update to 8.y.x could be tested too. At least then kernel or q=
emu could be blamed
> > for the issues.
>=20
> Not that I know of.
>=20
> I have now also reproduced the failure with glibc 2.37 instead of 2.38
> including the fortify sources change and the 6.1.34 kernel so there is
> something else causing this.
>=20
> I've wondered if we need to try going back to qemu 7.2. It may also be
> worth ruling out binutils.
>=20
> It shouldn't be systemd as the sysvinit images show the issue too.

I've ruled out the binutils upgrade, the glibc upgrade, systemd, the
kernel changes and the tar, libarchive and qemu upgrades.

I've continued to try and narrow things down and we see the issue from
this commit onwards:

https://git.yoctoproject.org/poky/commit/?id=3D12d9280c3de24c1c2b835e80fa1b=
8be72e9bc63a

I did get three clean runs with:

https://git.yoctoproject.org/poky/commit/?id=3Dfb51e196a978d452e6a14a834383=
2659da97fdc7

but that still could be false negatives as it is intermittent.

I'm trying builds of the commits between those two to see if any
pattern emerges.

The qemu 8.1.0 upgrade breaks x86 with qemu kernel hangs seemingly with
nfs root relatively consistently:

https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/424/step=
s/13/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/430/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/typhoon/#/builders/145/builds/427/step=
s/12/logs/stdio

https://autobuilder.yoctoproject.org/typhoon/#/builders/148/builds/433/step=
s/12/logs/stdio

I think this was where I was previously worrying about x86 kernel hangs
from. Now we know the 8.1.0 upgrade is the cause of this, we can
hopefully get to the bottom of it more quickly.

Cheers,

Richard

