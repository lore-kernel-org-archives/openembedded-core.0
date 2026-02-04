Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFEDAE8B388
	for <webhook@archiver.kernel.org>; Wed,  4 Feb 2026 14:05:57 +0000 (UTC)
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.21076.1770213955319388534
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Feb 2026 06:05:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=A9fFMIpr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.218.67, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-b7cf4a975d2so989263766b.2
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 06:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1770213954; x=1770818754; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OLLRWOg9purf0/fpNJu1eddP2P/s+AMk5xgKV3ZByZw=;
        b=A9fFMIprl9p6RxwGnZw7OjZbzre5IoOxM5r1hUioQtsrdVTd/u//Mrco5CK0HhuO5A
         WwrbLse8zT7WuyTSY03XlfOragMWXrQIUM/Cdm1Nvu+PDGLJbwZ0zm2w2PMuQ/Vjcl2F
         dhKc91aHH7yqJdOZfF/q+B3BL3itWOELMaB/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770213954; x=1770818754;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OLLRWOg9purf0/fpNJu1eddP2P/s+AMk5xgKV3ZByZw=;
        b=nT3bSkL+rSqVcoVH1wixbVOPn+E9I5zRRTmqYwY4PVe3G2HixPi/hk/uMreRE1nJAI
         hcpZ1LU3ZKfr+P8F/ksIvjcn16hi7C4hfgla8R3OM/22QWbXx29NUyBKO1rE3fXf8zPA
         DVjdSGtED3W9V7oHkNmVItQy3GRm/uWjSKeJ4+nGErWe+j0yv9yIj3tHEG85ZbS1fs+A
         Kf/wQgL+IUeOuc1QzLJDeBEqYcW75FCiP61Zs4NM8Kz/s3xqJC82hFihzXlfB28kNE/q
         C653vB5HtWMssflYDFiXk5IwS5sNBfemo7BHXeAZh2y8OMdVO1iNIop4lBGZzwj3xVK+
         jZuA==
X-Forwarded-Encrypted: i=1; AJvYcCWYPEjxeayIacVE/tt6mO7GLmmZpFwZ3MLP5amwKfZbAtc8/SNMpGDCCSVTirwd5eq7y7gqSK3zosAtmvUYeRqbZw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw0xsygQO+yjsSewPHtOsf6lbmqvLcmqR/5W7Nf1s1LNhQy+emU
	hIvzNXrw7iOLLoMeRmcZIZ80Iw5crIR0upv5eb/FfCAEIFvGtXBUa/UeyGA4dtZptag=
X-Gm-Gg: AZuq6aK9VOUJeUMr+KMXzpqVDr0M4VQN60u0WKhIPhKxcdBhWeWkGN9jPZIC2W+kVel
	Smw9QHaSgXPRdwr5zUmMAla//d8vw1RFlDKnISWlG/GxmxXSvKfGNNCVdg649xFqrgcw4c53PqH
	SUahCIcStAtPa989ZPux+EYL4G34tm9nz/mkXHu68Lf+DLvvXS/+MEZMcdh89UlKOrrx4Vn9Jz1
	mOT2jMqrA468qtwkjCDldXxtW50kgiF5CXwohBMB4/zgY3G9GyUP/ZZmNjvK91c0rEBPqLoUbh6
	uO8R15n6ORNALrv2gU50T0mOxFt1U956CMui68qjZxSO0PdSQ/j0wmdL8HqzWBeVucRmHCFv6BH
	1v1Rlg+dd2MC0pY+EAs/xTyMGF7GqJ4im4VceKVDvPgx/36wekDI5jcLNssqoGfQ6eH0OGShd6a
	hZylA9lz3rEVSsKfnMJ2RAKN0gAc0vgRTlaLPUAhS9XZWLAYYDxWd5ONK+mFmqgjk1mPXTua5+m
	NY=
X-Received: by 2002:a17:907:e11c:b0:b8e:a1ae:f96a with SMTP id a640c23a62f3a-b8ea1aefb25mr152697666b.46.1770213953496;
        Wed, 04 Feb 2026 06:05:53 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d? ([2001:8b0:aba:5f3c:ac04:f180:6f5c:7b1d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fef0006sm128267566b.41.2026.02.04.06.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 06:05:52 -0800 (PST)
Message-ID: <4c2fe6d55fc04781560d73fd038ee6b8d205c08e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] module.bbclass: check whether CONFIG_MODULES
 set
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: kai.kang@windriver.com, openembedded-core@lists.openembedded.org
Date: Wed, 04 Feb 2026 14:05:52 +0000
In-Reply-To: <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
References: <20260204020908.864912-1-kai.kang@windriver.com>
	 <CADkTA4PZ9df8xCge6F+m4M02OTXbiOhYJ7S7hPvze95ah5BWDQ@mail.gmail.com>
	 <71fa18fd1ae7612c9d3f8161c6aeb2575d22e280.camel@linuxfoundation.org>
	 <CADkTA4N=XXArnsygSnAUptBby_BBX1qxsL2bjT+r1gDePWVmZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Feb 2026 14:05:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230532

On Wed, 2026-02-04 at 09:02 -0500, Bruce Ashfield wrote:
> On Wed, Feb 4, 2026 at 8:58=E2=80=AFAM Richard Purdie <richard.purdie@lin=
uxfoundation.org> wrote:
> > On Wed, 2026-02-04 at 08:46 -0500, Bruce Ashfield via lists.openembedde=
d.org wrote:
> > > On Tue, Feb 3, 2026 at 9:09=E2=80=AFPM Kai Kang via lists.openembedde=
d.org <kai.kang=3Dwindriver.com@lists.openembedded.org> wrote:
> > > > From: Kai Kang <kai.kang@windriver.com>
> > > >=20
> > > > Check whether kernel config CONFIG_MODULES set or not before do_com=
pile
> > > > and do_install in module.bbclass. If not set, it cannot build and
> > > > install external modules.
> > > >=20
> > >=20
> > >=20
> > > This isn't the place to do that check.
> > >=20
> > > If modules are disabled get modules_do_compile out of the tasks.
> >=20
> > Does it make sense to have something including module.bbclass which
> > doesn't have CONFIG_MODULES set?
>=20
> Yes, that's what I'm trying to say.
>=20
> Don't even include it if you can't build modules. That puts
> the conditional in a single place, and keeps the code cleaner
> in the class.

I think we're talking cross purposes a bit.

The issue is that if you ever reach do_compile in something using
module.bbclass which does not have CONFIG_MODULES set, that is a
problem and a hard error.

So I'd argue that:

* we only need the check in do_compile
* it should be a fatal exit hard error, not a warning

which means the patch needs tweaking but not as you're suggesting.

I'm not sure skipping the tasks makes sense, I think what we're needing
is a sanity check for a configuration which stops the build if it ever
happens.

The rust check would then be similar. Stop and error if the
configuration would never work/doesn't make sense.

Cheers,

Richard




