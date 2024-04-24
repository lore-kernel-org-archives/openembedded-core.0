Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5F6BC4345F
	for <webhook@archiver.kernel.org>; Wed, 24 Apr 2024 08:38:33 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.11733.1713947909604818998
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Apr 2024 01:38:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=IWNYJ0z9;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d872102372so5321631fa.0
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713947908; x=1714552708; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ugD9VuFNNccghO8Z1Bofihh4B40Pkq+1X3NR7Z8oVGA=;
        b=IWNYJ0z9BgaNiFM14VNVKvjWbGKDCd0zhpBLpoQZP/8C1BdSuJdvNzZUnI2H7Fe43r
         mh/DS/FLSvZzSAHClM6j00abGkBCL6bj4XVz2ldwZkhtmbMakRhTqjTXzfFB3plo3AHH
         0O6dN2mjXbGeV9mUUsdGbKB/zRbu3qNCbLZ/6bsqPMmWXCQtXtdNuFBjHPJXSI1STNbe
         Dv3eK2tK48KUX+rh+6hiGpt1J3t2XnhpeKmRlpP+xzZ+SN4kq8c0E6MtlTenWHdjQmlg
         yzPv++yJPZ4fWuA3XV80zE3+T+DB0gkH+fDLTAcTvVEOHrPrnZ5ooxfpFk2nTTlNR139
         uFaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713947908; x=1714552708;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ugD9VuFNNccghO8Z1Bofihh4B40Pkq+1X3NR7Z8oVGA=;
        b=Rbk/08QQShWlH8kj4RCkY5hCZEH6BLb5EFGVJ2cWpGvx+uhyg9IfG7YBu+YIq9AEXy
         RhcmP/f8a1FbBe4f82J6yVVwX7X7Qjc/72VycgfeYDuLxBoWwKyQWtqhe7i+ttdHjJV0
         2og68C2cwn+Idh0bU3aVe+baDQZ3Ig/rFpk5Ykpc5txtGISKLHKV26gIgjZeFvukFySn
         XeU99+iXfw8HuCG499ohExbSEHMlOLpqu7mqviyOGMMEFuMBMTLoNpNV70QVAyAYykiZ
         Y9tg9W5ZE/VBak13dxakP7QmtbIswBR2qM34lHa5yHytOFMTAMdKHPSlI9y5RsppGqQd
         FrHQ==
X-Gm-Message-State: AOJu0Yx43SGsSaQZCLq+InImJK5aTOZMKeolI0FRRqscXkEix+Blwibt
	OJnXN0JpPDjOWBJHZTvv4mYTETdSFI3Kt+D+AV6mcADIzFSFhqMa3lnmZGAyTq1TGShocCN+HBu
	RR8ZQiQTnh5RukSf/lFXpuaR16yY=
X-Google-Smtp-Source: AGHT+IHjxR6B9o/Dim2tTYXDzbh3z7HZkacd96EWU7H/unEJWo3Y2fkuh++lrASQeKiSmiSKEtYJv5Co+HeSBsizhX8=
X-Received: by 2002:a2e:2a85:0:b0:2de:2bed:dcf1 with SMTP id
 q127-20020a2e2a85000000b002de2beddcf1mr569733ljq.7.1713947907699; Wed, 24 Apr
 2024 01:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240418012247.490545-1-leimaohui@fujitsu.com>
 <CANNYZj9cNeBkM11JteV_Cg51Ogti9Y0rr0kuMum3kOZuCKHw0g@mail.gmail.com>
 <17C7897B23C043A5.4146@lists.openembedded.org> <TY3PR01MB11056C32DF3D90E8C09FB5234A0102@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056C32DF3D90E8C09FB5234A0102@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 24 Apr 2024 10:38:15 +0200
Message-ID: <CANNYZj9AA4OEuZ02Ndi0WNaFyW9kiZG91HSEjM4QToQqRZS1Fw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v2] libbsd: Fix conflict error when enable multilib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Apr 2024 08:38:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198645

It would help if you show the actual content that is being fixed. E.g.
the problematic line in the header:
- before the fixing
- after being processed with oe_multilib_header
- after being fixed with sed.

Otherwise I still don't quite understand what is happening.

Alex

On Wed, 24 Apr 2024 at 04:08, Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
>
> Ping
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of leimaohui via
> > lists.openembedded.org
> > Sent: Friday, April 19, 2024 9:16 AM
> > To: Alexander Kanavin <alex.kanavin@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH v2] libbsd: Fix conflict error when enable multilib.
> >
> > Hi, Alex
> >
> > > Can you explain a bit more? Why and how is it not correct? Why isn't a
> > > similar fix needed in other uses of oe_multilib_header?
> >
> > Reference to https://man.archlinux.org/man/libbsd.7, by default, libbsd is built
> > in an overlay mode, the includes in this case should be the usual system ones,
> > such as <unistd.h> without namespaced with bsd/.
> > It seems that libbsd is special.
> >
> > Best regards
> > Lei
> >
> >
> > > -----Original Message-----
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Sent: Thursday, April 18, 2024 1:33 PM
> > > To: Lei, Maohui <leimaohui@fujitsu.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core][PATCH v2] libbsd: Fix conflict error when enable multilib.
> > >
> > > On Thu, 18 Apr 2024 at 03:23, leimaohui via lists.openembedded.org
> > > <leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> > > > - The path of cdefs-64.h and cdefs-32.h in cdefs.h is not correct
> > > > for libbsd after
> > > enable oe_multilib_header on cdefs.h. It is necessary to fix the path.
> > > > +do_install:append () {
> > > > +       oe_multilib_header bsd/sys/cdefs.h
> > > > +       sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g'
> > > > +${D}${includedir}/bsd/sys/cdefs.h
> > >
> > > Can you explain a bit more? Why and how is it not correct? Why isn't a
> > > similar fix needed in other uses of oe_multilib_header?
> > >
> > > Alex

