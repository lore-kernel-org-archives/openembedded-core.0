Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F04BDC54791
	for <webhook@archiver.kernel.org>; Sun, 10 Mar 2024 14:27:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.37827.1710080831334762158
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Mar 2024 07:27:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LxKCORVu;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-33e6aca1ca9so3199874f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 07:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710080829; x=1710685629; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o47Gpwuvu5vaP/mDEL66Z4gBGtl/paQ6YWXWxS1a+14=;
        b=LxKCORVu2NS7a/QC3EBFO7l67FjzjDDZVYW6EzY+efauWfwy7Dl0hI4Dj4wDLLVF2b
         N7IHU/yuAuWXlDgfzADggpUSJCE22gs+RMd4fHfSgwfuUmMUqG7UUHQ58+LDyJ+43BhV
         tiDbYP844lMBf8Mrq5t0QjB//gPKIvde4SIERBQQf5eovLLYQ0D7z2PoZPnHnJyo3qLY
         LT4AYxV6KaeTiRvhS0UWn/z/0lbO3V1iRBJMfe0cb7RIz8o7UboaBxBP0t/jLcS5LZuy
         j65kzc0z5N8Clu/cFvbynO2INqX4YqOSEUTQp6rhVNgJaFpO8DDD6IazAaJI5736S53N
         5k+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710080829; x=1710685629;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o47Gpwuvu5vaP/mDEL66Z4gBGtl/paQ6YWXWxS1a+14=;
        b=gHzwsIDGDDVWXTBJEOM54f1HkC64Iz3Kcl6Q5OL1+hViiODVkngsbmyaxn1GRIq101
         J55adASHmbnM3KfQ3lyr36zO6b0CcuZVtdR1l4V/xc9uGDM+Iusu17sK3IM+HFFrq8J8
         qKI+EkHHm2qhsv/B5beYg+8tUxKOonlLpuxnfuWEbTT3HzbM2Vwn6utMaxNqXtkEwPap
         OgvgEGiBG2haV5h4xoBU6Qg5AJ975r0vXKe4dipHjB4cXoMVyEnBbif3dG+QvtckVPNY
         bI0k0WTBs9aBpiMWl4k2ko1U8eSobC/FJdqZTeovv7CQI7NK8/KJ6pEusFHJW1jLzA5O
         9v/w==
X-Forwarded-Encrypted: i=1; AJvYcCWXFLDmHEmPP+noxEXyZzz+2Uwk8ddz4UwhY3gQ2kUkGlUYa7Wg/3VwBvcuVEOyVYTWzFGqBbdtGn3TgQm6aaJ2HL7eov2oC18HcaUTRom9Zi3BwpdzJiLV
X-Gm-Message-State: AOJu0Yx4azPhv9dyo0UtFKlwPQ6iDUVxfhiVZFEI2PPyQzCxi9aWH1Pi
	QqSq6HYcJxHysyP+F4oECTJrCfqyjyVk47QsOL0b9MtRCOB+SUqV9BQCd0m3/4GIe99qLQKLQvv
	e1AC5BO650zLy4/ym96UStVAsfFU=
X-Google-Smtp-Source: AGHT+IFblCCO2zvtJlswJWOnq2ZSECHgMGKo4SbP3ielzfDrftNN2Msaj/4C/sTD70Xh3CRJipfvLOXJgazlxTYa2rQ=
X-Received: by 2002:a5d:5221:0:b0:33d:61fe:6ca3 with SMTP id
 i1-20020a5d5221000000b0033d61fe6ca3mr2853279wra.26.1710080829073; Sun, 10 Mar
 2024 07:27:09 -0700 (PDT)
MIME-Version: 1.0
References: <f43b9b3-8c6e-d352-ca9d-7b7228c0b09e@crashcourse.ca>
 <CANNYZj_GWJDA6i6c+83RZw4nQbtYocypQ6x96y_v9-1eehPaBg@mail.gmail.com> <c47f97ce-949d-45b4-7e40-e5175a3ce64@crashcourse.ca>
In-Reply-To: <c47f97ce-949d-45b4-7e40-e5175a3ce64@crashcourse.ca>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 10 Mar 2024 15:26:52 +0100
Message-ID: <CA+chaQeCvgioAi+j1FAqSCJaF9DEf7ibAYpGCSBqo-vsxDJo4w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ptest: test for PTEST_ENABLED instead of DISTRO_FEATURES
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Mar 2024 14:27:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196887

On Sun, Mar 10, 2024 at 3:11=E2=80=AFPM Robert P. J. Day <rpjday@crashcours=
e.ca> wrote:
>
> On Sun, 10 Mar 2024, Alexander Kanavin wrote:
>
> > On Sat, 9 Mar 2024 at 11:29, Robert P. J. Day <rpjday@crashcourse.ca> w=
rote:
> > > As ptest.bbclass defines the more intuitive ptest-related variable:
> > >
> > >   PTEST_ENABLED =3D
> > >     "${@bb.utils.contains('DISTRO_FEATURES', 'ptest', '1', '0', d)}"
> > >
> > > modify a number of obvious recipe ptest checks to use that simpler
> > > form.
> >
> > I disagree. When someone reads a recipe, and sees a variable, the
> > questions that typically come up are:
> >
> > - where is it set
> > - how is it set
> > - what needs to be done to change it.
> >
> > DISTRO_FEATURES wins all three, as it's commonly known and understood f=
acility.
>
>   then what is the point of defining PTEST_ENABLED in the first place?
> and using a mixture of both throughout the code base?

I've used PTEST_ENABLED few times to disable ptest support in specific
recipe while it's "by default" enabled through DISTRO_FEATURES.

