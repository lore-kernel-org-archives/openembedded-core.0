Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 928F5CCD1A0
	for <webhook@archiver.kernel.org>; Wed, 18 Sep 2024 11:22:07 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.12653.1726658522478888100
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Sep 2024 04:22:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ht05H3/d;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so65755975e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 04:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726658520; x=1727263320; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pBztrbhHQLbLA29sbzKC2IccumpBt1nmJsxYJPH81TY=;
        b=Ht05H3/dvqSNpReDBGglNBct7afQQy+jokm8YYqXFysN/20ICZZXoPBoy3FdpgorV4
         gZv+nzUHPxP91Llv+LHVRJW/h925Ky+LuYAQ4+KDkkOyRuhhMB22s2wkG/ugFTQwsD6P
         idoG2+K2+1Mx6IhErmz5Vy7I+jEDpMdA4N7ds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726658520; x=1727263320;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pBztrbhHQLbLA29sbzKC2IccumpBt1nmJsxYJPH81TY=;
        b=pqdA/Cn8CphsRn6BDirEHVpv933iR3FrwXRNPubC6Qle2s65vG2lfXcUtxGoy8HPOx
         BQ6jfwm5mV5I+U3HA+YuBlbOQMRN48QJPkiirXQLaUPMY4TZYs69TyLX6QAlzfAmKCex
         j5dw8QKHtrvY8p7B3/nhaYLdZzA8T3WRghT1FFthXubshopv3xLX0qNqpI5nDahMWXa8
         EBOCtKJ9JnruqzaLWCcuqk2cyWOjTm8bqtdKwL4OmuNQK4dSyP8BObFR2dWI+Hj8K94E
         S1OOZJESEsXH1UPoT+gTWBLBCG85FZdfEixz7nToiAA7rXXBNl1LRUmuCX7Kgdyx+nbs
         fMSA==
X-Forwarded-Encrypted: i=1; AJvYcCU0NL1F1IOkd60SvXTL79gdbwDJF/wxnwwX4AKkC3uI1RFpJl0RszPY0t8dEfUBkOlIMFvl6LRgl3NH4/0gUj1J1Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx8oUMdL4mTMff1QPzggaiharTWMR6bMx2SbneDTc/+78H9xD1h
	WweGRdNY/oPzrnALoIvaLyrBg88klVb2aIACthAlj0d+eDwSWl173MFfzRqMrSU=
X-Google-Smtp-Source: AGHT+IEec6OyQCvlOgbxZKOIUBXssKrYIb72vanKtaw+x+gF9abqu88/cESTAov5JvYlOUCV+5PP7Q==
X-Received: by 2002:a7b:c386:0:b0:42c:baf9:bee7 with SMTP id 5b1f17b1804b1-42cdb67b16bmr140591475e9.12.1726658520370;
        Wed, 18 Sep 2024 04:22:00 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:84e0:f160:18f9:5089? ([2001:8b0:aba:5f3c:84e0:f160:18f9:5089])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73e862esm12216433f8f.45.2024.09.18.04.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 04:22:00 -0700 (PDT)
Message-ID: <1729b516f6afc04a83158f59f473a668860137b4.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/7] Add barebox bootloader support (and
 testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 18 Sep 2024 12:21:59 +0100
In-Reply-To: <b7e336daaa8aeeec62bf43da2ce4abccea3e15cd.camel@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <fe63f607a4f3f521e51c6ff2724bbd537977a5b1.camel@linuxfoundation.org>
	 <b7e336daaa8aeeec62bf43da2ce4abccea3e15cd.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Sep 2024 11:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204642

On Wed, 2024-09-18 at 12:39 +0200, Enrico J=C3=B6rns wrote:
> Hi Richard,
>=20
> Am Mittwoch, dem 18.09.2024 um 11:11 +0100 schrieb Richard Purdie:
> > On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via
> > lists.openembedded.org wrote:
> > > This adds support for the barebox bootloader (and tools) to oe-
> > > core.
> > >=20
> > > In order to have proper testing, this extends oe-selftest to
> > > allow
> > > basic testing of bootloaders. While at it, cover both u-boot and
> > > barebox.
> > >=20
> > > v6:
> > > * replace barebox.inc by barebox.bbclass (move content of
> > > =C2=A0 barebox-common.inc into .bbclass and .bb files)
> > > * support for UNPACKDIR
> > >=20
> > > Enrico Jorns (5):
> > > =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> > > =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape sequences
> > > =C2=A0 oeqa: support passing custom boot patterns to runqemu
> > > =C2=A0 oeqa/selftest/cases: add basic u-boot test
> > > =C2=A0 oeqa/selftest/cases: add basic barebox tests
> > >=20
> > > Marco Felsch (2):
> > > =C2=A0 barebox: add initial support
> > > =C2=A0 barebox-tools: add initial barebox tools support
> >=20
> > We had some testing capacity so I ran this through automated
> > testing.
> > The one issue that showed up so far was:
> >=20
> > https://valkyrie.yoctoproject.org/#/builders/29/builds/174/steps/13/log=
s/warnings
> >=20
> > which is at least easily fixed! The rest of the build is still
> > going.
>=20
> thanks for the test run and the first result.
>=20
> Indeed, looks easily fixable =F0=9F=98=89
> Is it worth a v7 or should I wait for other results to show up?

Most of the tests have run and there were other issues in the build but
there was one other issue I noticed:

https://valkyrie.yoctoproject.org/#/builders/54/builds/149/steps/14/logs/st=
dio

which is a missing maintainers entry. Probably worth a v7 with those
two things fixed.

Cheers,

Richard

