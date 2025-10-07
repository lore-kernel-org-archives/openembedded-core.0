Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE4D1CCA472
	for <webhook@archiver.kernel.org>; Tue,  7 Oct 2025 12:41:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web10.17688.1759840901475186159
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Oct 2025 05:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Bdv52u+P;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-42420c7de22so3423750f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 05:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759840900; x=1760445700; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mw22SSrD5MkxC0kZ4dtBaGqAuz0HlDcYesU+W8MhxCw=;
        b=Bdv52u+Pn4nZiVIrGNQtTfD7gYpbmRiwAVXO027a03exYmIw6MKDGIEoTIsOJnuuvM
         Kcv5lhnWZaYTgVVpSmN4qr/6/Je9VSJBGscLvgM4qgDHm1zkHWfKQZ3XroHpqUw6712M
         LhysBuZGGFHbE0OpGof8bJHN4soGKZLJAZBmk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759840900; x=1760445700;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mw22SSrD5MkxC0kZ4dtBaGqAuz0HlDcYesU+W8MhxCw=;
        b=jWcTl11qG+iJY2yxswOc0h4aPrLNLbgDTA0O+93CXXzafztKNLuOijnTCpA+i9pTQO
         WN3BmhMxQRUhe6InqMYpaDMzmB+XsBmsQPjTuOrf2uPqPhlK0CC4SWZyH5AqAzhfr0NB
         A6XEmrXGOdRQOtdyjyvzwhz3gGUClUaUjm4knShVMjyCzDGxKlSMDyfepm3EGOpRyHaH
         +ZkhubnvWVqIo8UxFv10FEzRc+8mCExouOWJ25bkh7lckJAEDtm62xsqUGhS83M9lRr3
         gXrT2rAFyZvPpRds4r3g7xCHwVNh79tWFk1HuTaB8wRx9BsxAB2aAwWW3zgqs+InyzSV
         AfZg==
X-Forwarded-Encrypted: i=1; AJvYcCUGjs+ahtN8o9Hy6zUuPsNuNZ/IY7iid2dw5yHESCC0J/Z19HiN2xZTqh03DKIENfnD2ODEJm31a69uAXR63kKe2A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxqdgD6N6S5RBxf+slx/6Rxkc0ayythtyPv2RSDZJ6tLxjfU//Q
	ntsjExbBxhAAaBhuCBbZeLdycLR8PShgtLBrvJYo6JZcXk8l0xjoy3VkFGlrl90Qisk=
X-Gm-Gg: ASbGncvGXYZYBUgklm9AHn28bL6iMHZQREYUOIaF6WetStUeDmhqcBswe9oZRGBkrvX
	eMwSGw5Gj6kWkzx/FJPneyvc3D3Mj507ILJfZZ1O7f0tc3BFtuGtlaLw8w/1AaD83A7wyqGhy3J
	1XUst4QQEeovO+JBdsGqDm0qcASlAJ/PUuvI7LL+aTq6kZ3QP5OvUT/hpp2sL8tWl2jgUNw8VIp
	gefSiVGWjHRE9Z3n3P+Q8klhtQFsBnXKXiTAah2xLO/8DkjuZYL41Xx9rmTH/0YXf4R+Lq9dyS6
	u9YFB+mXBDT9HWsaP0+TtITP3CqUTiWfjicn+8uPA2W62No6i/OwsV5zcgieGfDiiYs8pMH/z7F
	2fn8GCVlUHXPJ7pukLlJkySPbbFwLQ7r0DRSjBWLciaueWnco4o1a5ydv9hmxeQTcV9PsDu9c+E
	vuKlRkSG5k2Dun8h0mlG05cbVKe3hBtb+maR0=
X-Google-Smtp-Source: AGHT+IHRZwD/aL4Wf43IBKZzYC+p1JIAxiXKEZQiwDVNLjVjtJPXKz/VandTylpgwd/Oo7D+XSVidA==
X-Received: by 2002:a5d:64e5:0:b0:3e9:3b91:e846 with SMTP id ffacd0b85a97d-4256712a4fbmr11250086f8f.10.1759840899758;
        Tue, 07 Oct 2025 05:41:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:c03c:5a55:45ef:33fb? ([2001:8b0:aba:5f3c:c03c:5a55:45ef:33fb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8e9890sm25625020f8f.32.2025.10.07.05.41.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 05:41:38 -0700 (PDT)
Message-ID: <77b7d645b235d4d145afdbea92667357749a7f36.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add
 zsh-completion-pkgs image feature
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: peter.kjellerstedt@axis.com, Ross Burton <Ross.Burton@arm.com>, Khem Raj
	 <raj.khem@gmail.com>
Cc: Adam X Nilsson <Adam.X.Nilsson@axis.com>, 
 "openembedded-core@lists.openembedded.org"
	 <openembedded-core@lists.openembedded.org>
Date: Tue, 07 Oct 2025 13:41:38 +0100
In-Reply-To: <DB5PR02MB102131C9AEB85566B1683DBCBEFE0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
References: <20251001160212.2588471-1-Adam.X.Nilsson@axis.com>
	 <FF7BA9D0-A09D-4D43-9CBB-5CA991E825BF@arm.com>
	 <CAMKF1sp1hb6ZSr=B6iAThoXcRQFD+h7vKxVcmPq2RoqeF2in0A@mail.gmail.com>
	 <BF7A5C48-4C48-40E4-B846-486473FE2D01@arm.com>
	 <DB5PR02MB102131C9AEB85566B1683DBCBEFE0A@DB5PR02MB10213.eurprd02.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Oct 2025 12:41:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224529

On Tue, 2025-10-07 at 11:48 +0000, Peter Kjellerstedt via lists.openembedde=
d.org wrote:
> > -----Original Message-----
> > From: Ross Burton <Ross.Burton@arm.com>
> > Sent: den 7 oktober 2025 12:34
> > To: Khem Raj <raj.khem@gmail.com>
> > Cc: Adam X Nilsson <Adam.X.Nilsson@axis.com>; openembedded-core@lists.o=
penembedded.org; Adam X Nilsson <Adam.X.Nilsson@axis.com>; Peter Kjellerste=
dt <peter.kjellerstedt@axis.com>
> > Subject: Re: [OE-core] [PATCH v1] core-image, populate_sdk_base: Add zs=
h-completion-pkgs image feature
> >=20
> > On 6 Oct 2025, at 22:28, Khem Raj <raj.khem@gmail.com> wrote:
> > >=20
> > > On Mon, Oct 6, 2025 at 1:10=E2=80=AFPM Ross Burton via lists.openembe=
dded.org <ross.burton=3Darm.com@lists.openembedded.org> wrote:
> > > >=20
> > > > On 1 Oct 2025, at 17:02, Adam Nilsson via lists.openembedded.org <A=
dam.X.Nilsson=3Daxis.com@lists.openembedded.org> wrote:
> > > > >=20
> > > > > From: Adam Nilsson <adamni@axis.com>
> > > > >=20
> > > > > Add a zsh-completion-pkgs image feature to install *-zsh-completi=
on
> > > > > packages into an image. This is similar to the existing
> > > > > bash-completion-pkgs feature.
> > > >=20
> > > > By my count there=E2=80=99s just three recipes in core that have -z=
sh-
> > > > completion packages.=C2=A0 Until it=E2=80=99s more common, I=E2=80=
=99d suggest putting the
> > > > COMPLEMENTARY_GLOBS assignment in your own image recipe if you want=
 to use
> > > > it.
> > >=20
> > > It does help people using zsh as default shell and working with yocto=
 SDKs.
> >=20
> > Does it though?
> >=20
> > $ git grep FILES.*zsh-completion
> > meta/recipes-core/systemd/systemd_257.8.bb:FILES:${PN}-zsh-completion =
=3D "${datadir}/zsh/site-functions"
> > meta/recipes-devtools/patchelf/patchelf_0.18.0.bb:FILES:${PN}-zsh-compl=
etion =3D "${datadir}/zsh"
> > meta/recipes-kernel/kmod/kmod_34.2.bb:FILES:${PN}-zsh-completion =3D "$=
{datadir}/zsh=E2=80=9D
> >=20
> > How many SDKs ship with nativesdk builds of systemd, patchelf, or kmod?
> >=20
> > Ross
>=20
> Please think outside OE-Core. Just because there are only three recipes=
=20
> in OE-Core that currently create zsh-completion packages, does not mean=
=20
> that it is not more common outside of OE-Core. Also, one recipe that=20
> could benefit from creating a zsh-completion package is bluez5, which
> currently has it disabled.
>=20
> One of the main reasons I suggested Adam to send this patch upstream=20
> is for consistency. Since bash-completions-pkgs is a well established
> feature, I would expect the same possibility for others shells (which
> in our case happens to be zsh).

I'm not sure we should have let the bash-completions one in. Now that
we have, we have the inevitable followups and this is why I worry a lot
about precedent when merging patches as people do use it against me
later.

One the one hand, it is a trivial patch. On the other, we have key
features like dev packages and dbg packages being mixed with much lower
priority things like shell completion. This makes it harder for new
users to find the important takeaways from the less important ones.

I really don't know what to do with the patch. I'm not particularly
keen on it and my first impression was no, equally, I'm burnt out and
really don't have the time/energy to write long emails arguing points
about it.

Cheers,

Richard



