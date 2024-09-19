Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F8FCE8D6E
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 10:02:12 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.16057.1726740124693759099
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Sep 2024 03:02:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QIA9iiau;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42cb8dac900so5855765e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 03:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1726740123; x=1727344923; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dkNMqT6hl7cccv4Z/MQKoS7VLX0pmr6Yg1Qar1hUkLs=;
        b=QIA9iiau9ZwbNiT8RYEefJDXvm+HV01r5t5qx0jlpllU9Ltkqv47n5X7uTGsCYEPYx
         1R0EnxyL8Yd77DTGVb14PyvFrE5UVwQMGLcWrMj4E+yktRwRhYRHzYFWy1fbOBC0ycte
         jfPZZk3Ygcy+YvCTvcp0HtgU+LLqTbFm2Ptck=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726740123; x=1727344923;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dkNMqT6hl7cccv4Z/MQKoS7VLX0pmr6Yg1Qar1hUkLs=;
        b=vMZcaPAw0cE4vHSunYRlJJ/hlttfFbDwYr6D6dUKjUadAl8YkQL90lqQFl1Rmm6NPJ
         JHiDUozBqL5Wvo6vwwlp0+PKyNo4lQ3gw+yDJecP0ADbs21qGE10qnpx8o0CMkwJNM4p
         qAqqbd/Q7Iut2hTtFPLqNp/uLoTK5jtE5prU5W8Q4KAgrMwN4HpiHDIor5fwYT6Wi5aO
         f2VXvi6o60iaX8BW7tDeIRCMh2/JqYQ/MShYUnlLN2ZJgQ6jhc8/U7wsEyP9WG8yRh+/
         IWK0QQFtQ1FH+iTMk+n8q83TkqDjehXa/VS5MWfCK6kouQX937k2VWf5X+XYV88BGYXc
         pTUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmYt8ny4vC9UcB/BL2dS7dWevogAa/EC8RzIWSrlF+k20cruia6lUTSeOCJHxhmCV8M2ByJbc11+8QoPhb/z4PFQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzLJq+qJP8un/MS8yCaS/NUWcvFwLHMbJ+WZhKB3UuCwZ4fgPDq
	SPsZeHUwo3uJAa5Yy2CSMVTojbXm0OhakUkpvvFIFU5mMcNA/FhP2dzd1nG30nk=
X-Google-Smtp-Source: AGHT+IF3hPlHO4xlj45Trcm+tEr1euD5WMtQp+Vp1GE3ihcGN2swnfwS9L4ZvieKpxE6jVfdwPVsBg==
X-Received: by 2002:a05:600c:3504:b0:42c:b1ee:4afb with SMTP id 5b1f17b1804b1-42cdfac946fmr187493535e9.26.1726740122987;
        Thu, 19 Sep 2024 03:02:02 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:f722:770d:8a57:e159? ([2001:8b0:aba:5f3c:f722:770d:8a57:e159])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7541d4ddsm17694885e9.11.2024.09.19.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 03:02:01 -0700 (PDT)
Message-ID: <9afc96b44726cbf62f46347d176c844c68469d60.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v6 0/7] Add barebox bootloader support (and
 testing)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico =?ISO-8859-1?Q?J=F6rns?= <ejo@pengutronix.de>, 
	openembedded-core@lists.openembedded.org
Cc: yocto@pengutronix.de, Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 19 Sep 2024 11:01:59 +0100
In-Reply-To: <18772a64adbbe183912d25388f8979ab0f26965d.camel@pengutronix.de>
References: <20240912091857.2631678-1-ejo@pengutronix.de>
	 <fe63f607a4f3f521e51c6ff2724bbd537977a5b1.camel@linuxfoundation.org>
	 <b7e336daaa8aeeec62bf43da2ce4abccea3e15cd.camel@pengutronix.de>
	 <1729b516f6afc04a83158f59f473a668860137b4.camel@linuxfoundation.org>
	 <fd3fff67a52a117485497a3e4ca6f098c298dfc3.camel@pengutronix.de>
	 <d86507587d62b184c1b111cd64519bae6dd375bb.camel@linuxfoundation.org>
	 <18772a64adbbe183912d25388f8979ab0f26965d.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Sep 2024 10:02:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204665

On Thu, 2024-09-19 at 11:47 +0200, Enrico J=C3=B6rns wrote:
> Am Mittwoch, dem 18.09.2024 um 22:37 +0100 schrieb Richard Purdie:
> > On Wed, 2024-09-18 at 13:45 +0200, Enrico J=C3=B6rns wrote:
> > > Am Mittwoch, dem 18.09.2024 um 12:21 +0100 schrieb Richard Purdie:
> > > > On Wed, 2024-09-18 at 12:39 +0200, Enrico J=C3=B6rns wrote:
> > > > > Hi Richard,
> > > > >=20
> > > > > Am Mittwoch, dem 18.09.2024 um 11:11 +0100 schrieb Richard
> > > > > Purdie:
> > > > > > On Thu, 2024-09-12 at 11:18 +0200, Enrico J=C3=B6rns via
> > > > > > lists.openembedded.org wrote:
> > > > > > > This adds support for the barebox bootloader (and tools) to
> > > > > > > oe-
> > > > > > > core.
> > > > > > >=20
> > > > > > > In order to have proper testing, this extends oe-selftest to
> > > > > > > allow
> > > > > > > basic testing of bootloaders. While at it, cover both u-boot
> > > > > > > and
> > > > > > > barebox.
> > > > > > >=20
> > > > > > > v6:
> > > > > > > * replace barebox.inc by barebox.bbclass (move content of
> > > > > > > =C2=A0 barebox-common.inc into .bbclass and .bb files)
> > > > > > > * support for UNPACKDIR
> > > > > > >=20
> > > > > > > Enrico Jorns (5):
> > > > > > > =C2=A0 barebox: set default BAREBOX_CONFIG for qemu machines
> > > > > > > =C2=A0 oeqa/utils/qemurunner: support ignoring vt100 escape
> > > > > > > sequences
> > > > > > > =C2=A0 oeqa: support passing custom boot patterns to runqemu
> > > > > > > =C2=A0 oeqa/selftest/cases: add basic u-boot test
> > > > > > > =C2=A0 oeqa/selftest/cases: add basic barebox tests
> > > > > > >=20
> > > > > > > Marco Felsch (2):
> > > > > > > =C2=A0 barebox: add initial support
> > > > > > > =C2=A0 barebox-tools: add initial barebox tools support
> > > > > >=20
> > > > > > We had some testing capacity so I ran this through automated
> > > > > > testing.
> > > > > > The one issue that showed up so far was:
> > > > > >=20
> > > > > > https://valkyrie.yoctoproject.org/#/builders/29/builds/174/step=
s/13/logs/warnings
> > > > > >=20
> > > > > > which is at least easily fixed! The rest of the build is still
> > > > > > going.
> > > > >=20
> > > > > thanks for the test run and the first result.
> > > > >=20
> > > > > Indeed, looks easily fixable =F0=9F=98=89
> > > > > Is it worth a v7 or should I wait for other results to show up?
> > > >=20
> > > > Most of the tests have run and there were other issues in the build
> > > > but
> > > > there was one other issue I noticed:
> > > >=20
> > > > https://valkyrie.yoctoproject.org/#/builders/54/builds/149/steps/14=
/logs/stdio
> > > >=20
> > > > which is a missing maintainers entry. Probably worth a v7 with
> > > > those
> > > > two things fixed.
> > >=20
> > > The test output says
> > >=20
> > > > Unable to find recipes for the following entries in
> > > > maintainers.inc:
> > > > barebox
> > >=20
> > > Could you give me a hint what that means? The barebox_2024.08.0.bb
> > > and the change in maintainers.inc
> > > are in the same commit. So I am unsure why it does not find the
> > > recipe.
> >=20
> > It means the recipe is being skipped in the context of the QA test.
> > This means there is a maintainers entry but the test can't see any
> > recipe to match against it due to the skip.
>=20
> Thanks. I was not sure if the recipes are just evaluated and skipped base=
d on normal bitbake parsing
> or if there is a special mechanism that just looks for .bb files.
>=20
> > The test is there to ensure when we delete recipes, we don't have stale
> > entries in the file.
> >=20
> > Can we provide a config that makes sense for qemux86-64?
>=20
> The reason it is skipped from default parsing is
>=20
> =C2=A0 PREFERRED_PROVIDER_virtual/bootloader =3D "u-boot"
>=20
> I put in meta/conf/machine/qemux86-64.conf since we have two competing pr=
oviders of
> virtaul/bootloader now (and that's what the mechanism is actually made fo=
r I guess =F0=9F=98=89).
>=20
> Not sure if there is a way to remove the provider for just that check?
>=20
> Or should I add it to the exception list in distrodata.py like its done f=
or similar other recipes
> that have competing providers (e.g. musl, newlib for virtual/libc; linux-=
yocto, linux-dummy for
> virtual/kernel)?.

I think it will just have to go into the exception list. We really need
to find a better way to do this but you're right, that is how we're
doing it for the other cases.

Cheers,

Richard

