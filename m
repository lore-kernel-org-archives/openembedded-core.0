Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 249EBEE14D0
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 21:44:25 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.2575.1694036657818748914
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Sep 2023 14:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ALH1h3f4;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-31c6cd238e0so982683f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 14:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1694036656; x=1694641456; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=FdWNOWgZSxVwLleoakWhFdJkCZRQJLdWpZK4EnJIf9A=;
        b=ALH1h3f4S4WE2qn8zqnalSd0jJgKy+BgXZ0QoJfactHDnWdqFrKJDmSU/96n32SVHG
         GU/AGE4Pk4cJbQJetjjb45osm2vkUqm9INfmazarhU6yfRwDSsPEl7rE0ku2lc40xAI1
         S1yXQ1r7wWEaBF4NuDtqZpaeCBOuOixleAyOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694036656; x=1694641456;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FdWNOWgZSxVwLleoakWhFdJkCZRQJLdWpZK4EnJIf9A=;
        b=Z6JaLIavm540vd17M+GW/WecorGGgCkudDvXWHa3pEfyC0rgzJu5fSMkTuBGgVABM4
         WJSLfkXvVKdpJd7t5sytOlGoRcEdo582wwneO+vhhetg8HYeGV2z4bteQGYKCG5+EBYP
         Lg8jObnfxC1cQ9Hh/djlCJsdaVhM4M4kxWGVzIFHxKNynYaGT/PIzWJcmY3nBxleEVtR
         JQHxlJraK3O3UEOQObzDgBZOdksELh6Gdf7HEAN1/fb+pz0HRDzPezDaT77PEXPz9lNg
         iXRfD8OAoeM4GRKc77/EkU10ot+TieErDf3Bxl6Bh53kzUCNTC0TS2MebHZ9bTqm2sbF
         wXfA==
X-Gm-Message-State: AOJu0Ywh00oX5fk5zaQYfnQj20G+WDXZtpFvPx+1P3igc0hj0qUmmZoi
	p+AMcQIjBwT83z+kWbkmKlNWGQ==
X-Google-Smtp-Source: AGHT+IGDzq8rtDTMPE9NcM1kuoOPtiYCPOYcJd6584Uaem8jC7Am0ccDGeXr3zMF9z58srhXLjnAgg==
X-Received: by 2002:a05:6000:11c8:b0:31f:651f:f84d with SMTP id i8-20020a05600011c800b0031f651ff84dmr581681wrx.12.1694036656045;
        Wed, 06 Sep 2023 14:44:16 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5f38:2f43:a165:5f10? ([2001:8b0:aba:5f3c:5f38:2f43:a165:5f10])
        by smtp.gmail.com with ESMTPSA id l5-20020adfe585000000b0031c71693449sm21422632wrm.1.2023.09.06.14.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Sep 2023 14:44:15 -0700 (PDT)
Message-ID: <ffda1a9441f4d6e947bb6aa383f5a1e2e2e0d39b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 16/17] build-sysroots.bb: run tasks one after
 the other
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Alexander Kanavin
	 <alex@linutronix.de>
Date: Wed, 06 Sep 2023 22:44:14 +0100
In-Reply-To: <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
References: <20230906165633.2382629-1-alex@linutronix.de>
	 <20230906165633.2382629-16-alex@linutronix.de>
	 <18264a59f21e43aed1138bc58ffdf2471c5ccc05.camel@linuxfoundation.org>
	 <CANNYZj_ptnLNvwPGDcAciok0bsE7Ctzww4WkAJmamgkCyB19CQ@mail.gmail.com>
	 <781c93976fbd19e146ab2626a6202a0ccb23ab82.camel@linuxfoundation.org>
	 <CANNYZj_RfCwHmt_TnUgdHeoTNdqMcX+f7aAzZ7e=MYSx+E-rXg@mail.gmail.com>
	 <02407d75fc40487431a84d18b60476552083b1ce.camel@linuxfoundation.org>
	 <CANNYZj_HBxGaz9c8X875fZ8rgPGD4MNCjv6mkANAiVZKD4vswg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Sep 2023 21:44:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187358

On Wed, 2023-09-06 at 23:27 +0200, Alexander Kanavin wrote:
> On Wed, 6 Sept 2023 at 22:53, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > That test/calls were fairly recently added:
> >=20
> > https://git.yoctoproject.org/poky/commit/meta/lib/oeqa/selftest/cases/m=
eta_ide.py?id=3D9b3fcb0d91648ae3b53ec8ffcb31fb6eac9209dd
> >=20
> > That test should probably call:
> >=20
> > bitbake("build-sysroots -c build_native_sysroot")
> > bitbake("build-sysroots -c build_target_sysroot")
> >=20
> > om the setup case and then just call the target piece again in the
> > specific test.
> >=20
> > We could drop the "before do_build" in the build-sysroots recipe.
> >=20
> > Note that the tasks are nostamp so they will always rerun. It does make
> > sense to have a way to regenerate the target sysroot only but if you
> > change it as you suggest, that becomes impossible.
>=20
> Setting up the 'direct esdk' would become somewhat more awkward as it
> does currently rely on being able to run 'bitbake build-sysroots'
> directly as officially published:
> (yes the doc formatting needs to be fixed):
>=20
> https://docs.yoctoproject.org/sdk-manual/extensible.html#setting-up-the-e=
xtensible-sdk-environment-directly-in-a-yocto-build
> https://docs.yoctoproject.org/sdk-manual/extensible.html#when-using-the-e=
xtensible-sdk-directly-in-a-yocto-build
>=20
> I can fix both the test and the documentation to run first native,
> then target task explicitly, but I would really prefer to make
> 'bitbake build-sysroots' just work without chance of failures.

Taking a step back, is user information actually useful in the context
of these sysroots? Really, you shouldn't need the native sysroot for
the target one.

We only have postinsts for sysroots where they were absolutely
unavoidable:

* useradd
* xmlcatalog
* ldso/qemu issue
* pixbuf

Basically, they're on used for "index" creation issues. Ideally we'd
not have these things at all, they're horrible to have to hack in.

In the context of external SDKs, useradd doesn't make much sense. Even
for "in-tree" use, given the significant dependency creep, I'm starting
to think we should drop the useradd calls from the postinst script and
code something else to create the right passwd/group entries which is
all we care about (to keep pseudo working ok for packaging).

The reason the dependency creep worries me is I know what the code
internal to bitbake does when it hits these dependencies. It is really
suboptimal :(.

I know it is really tempting just to add dependencies and ignore the
deeper issues but some of this really doesn't make sense when you step
back and think about it.

Cheers,

Richard

