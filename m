Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FF4C83F09
	for <webhook@archiver.kernel.org>; Wed,  9 Jul 2025 07:43:03 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web10.9956.1752046980434856884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 09 Jul 2025 00:43:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=UrP+bzCD;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so49479185e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 00:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1752046978; x=1752651778; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LvxuI2FwfgAweFLo/eQX4E/7TeGP+pAYx8+HzMbnjxY=;
        b=UrP+bzCDBb5Rnw0gEeQ+OUHafdraNbMI3NS6q94oxUrlPcii+l8IMpqMJBZMfXc63y
         Hk1VBTXHuPdKuOJTrHCbFfkpyuy4subMN62z+ewWwguZD6q1NfUbQejOqZ0nhReKdF34
         FFV/D3qQCudON1xqaKq9XvtkqXTqR+Hbw7Ob0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752046978; x=1752651778;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LvxuI2FwfgAweFLo/eQX4E/7TeGP+pAYx8+HzMbnjxY=;
        b=Yx0iJkiU2Py1I+chtLKzsmS4fqFIXRx4Opx310koxbYQ66kbBVFmgaAO920W9WEj3S
         N9gGRoM0a48N/HcE40H7qKynIF4D/Epy+mAr04IFxk657KVLOBXU3kAF6bRuCATkA/Gf
         z09OZjWuqARVvGIHS8xxkMKFdG9dqADr7Ej/AVTN4EElrJU2/DtKUNaVP+81pvOyN4NM
         iuHzpAHJm/8r8eYIT/n6xzozFuG0crBzhY99Y3t6BRVJVPT/sb1PcArAZ5QO165bPK6j
         GJjYIYNz1VX/CZ/1CkJaI9hjuuoX0ymogSCzInkUKce8aiWzic2w0EQRR6SUR7KbMhnn
         WChA==
X-Forwarded-Encrypted: i=1; AJvYcCWvz2017H451fW1+SsQqEq5kRI68U5ckxjzuNh4dAB61EHigMf7plKfkORStWKNsuJYx1+wv/exwQ3hBcMnGx70cA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzkZbMU4SM/XVjYddH1Uy0PcFRem7zG25E55HfQ4o2NawkjpBG8
	5jfvQynGLZXQX4EhM6375Ckl38UR04iYXrV63dgwi/o/l91LGyNq0hlrp7MW+c+/Avg=
X-Gm-Gg: ASbGncvmA1zLPa2xr9v2dQ28/QDJmQwprRC0UByXVGBisXeMjrHSqHx9jJBNu69b1zg
	+UfRz1YxUcq/NAnOImeo1yuzPrQR+ttke+wOi7xtQG3CziZC3qsG1VuZ3ELEz2pthJMj/QmdGxJ
	52c06GnyBjtVcvXSueAxtyyvjh9VRekcw1KXvydC62vlowIVNveQ3bJOBCLg6ZYsaVbThPXZlM8
	131Bh79Jf89RW8zW0rGJUhWjJ4QT3VdFnD8GJUZ25l6UEDLSTVsep37InCC3+AxLY5jXd1qq4Tw
	Mm3o8jaTEBR3JTOd7RJr6QqiJYqva38zt0+lpkfP7MHZZN68OW+xO3ni4tmfgjv/tQ3IwC11vfp
	1scBTcGeanCrKzSQkIcnMrff9i402/d1qWY2CC3jl4UHwUeli+csjFK666ew=
X-Google-Smtp-Source: AGHT+IHxgByXSXbp9CLhb7n5GaR6fteHinm2BKtt6JZXHhKaBrp8qjnzyZygmI6I0F2ysfROHQpkTg==
X-Received: by 2002:a05:600c:138e:b0:43d:878c:7c40 with SMTP id 5b1f17b1804b1-454d53118cfmr15022945e9.10.1752046978271;
        Wed, 09 Jul 2025 00:42:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:8726:2b2e:9de:f840? ([2001:8b0:aba:5f3c:8726:2b2e:9de:f840])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454d511bd6dsm13372825e9.38.2025.07.09.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 00:42:57 -0700 (PDT)
Message-ID: <34c254bbc44e6940138e9c49f9f58980dfe99aa2.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 0/6] ISA based RISC-V tune implementation
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mark.hatle@kernel.crashing.org, openembedded-core@lists.openembedded.org
Date: Wed, 09 Jul 2025 08:42:56 +0100
In-Reply-To: <1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
References: 
	<1751492664-12569-1-git-send-email-mark.hatle@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 09 Jul 2025 07:43:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220078

Hi Mark,

On Wed, 2025-07-02 at 16:44 -0500, Mark Hatle via lists.openembedded.org wr=
ote:
> From: Mark Hatle <mark.hatle@amd.com>
>=20
> The following implements the risc-v processor tune based on the ISA appro=
ach
> as documented in the oe-architecture post:
>=20
> https://lists.openembedded.org/g/openembedded-architecture/message/2155
>=20
> This set also attempts to make u-boot and kernel configurations dynamic
> based on the TUNE_FEATURES.
>=20
> For the linux-yocto, I suspect that the config fragments should be
> sent to the kmeta (kernel-cache), but I'd like a review from Bruce and
> others before I do this.
>=20
> Additionally, this enables a new (optional) features_check for TUNE_FEATU=
RES.
>=20
> I've found numerous items in the system have certain RISC-V ISA expectati=
ons
> that may need to be addressed over time, however the obvious one is the
> Linux kernel requires ima_zicsr_zifencei.=C2=A0 Since it has it's own -ma=
rch=3D
> setting this will ensure the processor defintion will be compatible.
>=20
> Also dynamically configure the QEMU cpu based on the tune_features.=C2=A0=
 This
> is nice to ensure that what we're actually building should be able to run
> on real hardware.=C2=A0 However, it does highlight some of the (extension=
)
> limitations in the current design.=C2=A0 (limitations as in extension not=
 yet
> enabled.)
>=20
> Note: OpenSBI _requires_ the 'c' extension or it will not execute.=C2=A0 =
I
> suspect this can be fixed, but it's beyond my capabilities at this time.

I've narrowed it down to something in these patches which causes these
ptest failures on qemuriscv64:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/56/builds/187

We need to track down and fix those regressions before this can merge.

Cheers,

Richard

