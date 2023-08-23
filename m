Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8F00EE49AE
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 09:06:45 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7472.1692781604801364281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Aug 2023 02:06:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ejC/LKod;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso2634935e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1692781603; x=1693386403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8l0dmBdW98Ysaj3ZdM6oyj34DoKeEtCdDqVDX96+NGE=;
        b=ejC/LKodXRlEumomkWEz8DY0oastXq31RAvOBSQdi7CzHWNfsCrcKnZDzahVc9yZRp
         HnYGoAv97RkBcP3yEPolILFaoWivABRzAREgvMabkvXLS1bNk05Bpepe4/O1v7JTEVaI
         eoHBvPlP8K0ybexiLNeATOq8I/5YWTfkcXlyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692781603; x=1693386403;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8l0dmBdW98Ysaj3ZdM6oyj34DoKeEtCdDqVDX96+NGE=;
        b=f//Zc6dcaKHGlgNjMf7lOy5JoTZWx4+jTG263xkOLbzRxc4igyYNyHsFQKRh4tktLD
         xUDaFquyFgMLQVpwht9D12zn2joVr3N8TMkHAT8WSkshG9Si0n1vteOYRFmFmU243KOz
         EakturcW+Cfcoaz6fokmcJCW+BqMDjR6HS+p5F1vhKWhmca24JWjs3+aNOHxzIu9h4jW
         lv7lo/tMS5RBLBPB6IxDP27b9AQKiaDC/T5+mMaLCdQEkVOa9xD1mbR8sHiKEKALH37l
         GffBHwOXuEh+sPjlCbVI1udTDNUl9UkrQzpOv2dvpf11yb4VF5yrvCk68YCXo4x8M5Pa
         qxHg==
X-Gm-Message-State: AOJu0Yw8Iu4lTi+4LKAOejO54Gyv/q/ou8h1J0x1dKMUDDsb3tqJnkvd
	9WAz9zDypXiJF8hBNFQN6YuhqA==
X-Google-Smtp-Source: AGHT+IEiqjfTQQd2HFZo1zrAwpoWjKLlRN3Vtbr0RBf8JiDndrICPUsh6AP5KqFJImPuY+Qt9uoV5Q==
X-Received: by 2002:adf:f112:0:b0:313:e98b:7de2 with SMTP id r18-20020adff112000000b00313e98b7de2mr9063840wro.0.1692781603237;
        Wed, 23 Aug 2023 02:06:43 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af? ([2001:8b0:aba:5f3c:ccd5:afa9:3ef0:b0af])
        by smtp.gmail.com with ESMTPSA id i14-20020adfe48e000000b0031c3ee933b5sm10324135wrm.108.2023.08.23.02.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 02:06:42 -0700 (PDT)
Message-ID: <44b46fe9ef454e80895ce2b0ecbdac1bea9784bb.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/9] testimage.bbclass: detect slirp from
 TEST_RUNQEMUPARAMS
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@linaro.org>, Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2023 10:06:41 +0100
In-Reply-To: <ZOW1tEl+PiOK09l/@nuoska>
References: <20230823061025.3952909-1-mikko.rapeli@linaro.org>
	 <20230823061025.3952909-2-mikko.rapeli@linaro.org>
	 <CAMKF1spz74E1N6tf=FzwrWwnHr0Gddo2J4pY8NdxW6h127=oSA@mail.gmail.com>
	 <ZOW1tEl+PiOK09l/@nuoska>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Aug 2023 09:06:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186563

On Wed, 2023-08-23 at 10:31 +0300, Mikko Rapeli wrote:
> Hi,
>=20
> On Tue, Aug 22, 2023 at 11:25:58PM -0700, Khem Raj wrote:
> > will this work when running multiple instances of qemu ?
> > e.g.  try bitbake core-image-ptest-all
>=20
> I was not aware of core-image-ptest-all. Tried to build it but it doesn't
> seem to be compatible with IMAGE_FEATURES +=3D "ssh-server-dropbear" whic=
h is
> needed to test core-image-minimal:
>=20
> Error:=20
>  Problem: package packagegroup-core-ssh-dropbear-1.0-r1.noarch from oe-re=
po requires dropbear, but none of the providers can be installed
>   - package dropbear-2022.83-r0.core2_64 from oe-repo conflicts with open=
ssh provided by openssh-9.3p2-r0.core2_64 from oe-repo
>   - package openssh-9.3p2-r0.core2_64 from oe-repo conflicts with dropbea=
r provided by dropbear-2022.83-r0.core2_64 from oe-repo
>   - conflicting requests
> (try to add '--allowerasing' to command line to replace conflicting packa=
ges or '--skip-broken' to skip uninstallable packages)
>=20
> oeqa runtime testing core-image-minimal without ssh server doesn't make s=
ense as all tests will
> just be skipped.

The autobuilder actually does that, the minimal image is just tested
with the small number of non-network tests. The main thing was to test
it does actually boot to a login prompt. We have other tests which test
the other areas with other images.

The reason for the above is that there will be ptest openssh images
which conflict with the dropbear ones. You can likely avoid that by
using:

IMAGE_FEATURES:append:pn-core-image-minimal =3D  " ssh-server-dropbear"

The ptest images are designed to only include the ptest in question so
in theory are otherwise as minimal as the dependencies allow.

Cheers,

Richard



