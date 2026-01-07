Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F640D0D16B
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 19:04:08 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14103.1767812639564640021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Jan 2026 11:04:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aOKVH5GC;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-64b9d01e473so3706505a12.2
        for <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 11:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1767812638; x=1768417438; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ytyYAC9JA7BpVM05dk/gnEMAXVfbbVmIyNehxZmktpo=;
        b=aOKVH5GCuDlQ4LzBgX9Zqgx90cX6fciLrxZU4JW6XmImDAs4X2zx6Xm7hFAUtkFJ/f
         eGXkf5y7XywivGwwVUQVoELB6lxzupuQMvOckDJq69IxNcmgzz10Ze1Lk+zXkp+TD/q7
         HUic/WDdwbSHVCOULj11EQFo4MqhdW/WiQs58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767812638; x=1768417438;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ytyYAC9JA7BpVM05dk/gnEMAXVfbbVmIyNehxZmktpo=;
        b=aghbWR3Js0sbnClVL11HJ/JD37jeu/gtffd6650tWg2FmSRZdLdFALs4li+t6ndgv2
         xaLhDRIXHnmY6+/wTlWX0+/PMH7O+OQ/EctnkKSsglPLcB6d6G0Oo5mrRwCAwoLHnGPt
         35RaXstf01mF9J0KnxrzUk5pmQLquFEyHJqnhTVzlalpOglu9yY8GZZt99xAzKev0SuE
         uakmkOJiP+Oik6IEJEhXe2jplX8GPUDnHYte8lNgvU3O3A7zbu+QhQU7f7B1io4nO+a/
         EjKk4sSRCCQE2GdkD7UEBn8ByQ+SfGJ0pJSID6uQsNSwoxCjvdpA7xCUZih13wU7LccV
         oAGg==
X-Forwarded-Encrypted: i=1; AJvYcCWuA5OJ/kcs32NetPiWW1IYYBhXi5vQ3PFHV7glp4jKJlXRjv6cHReiv7Wkx/4yA+oIbs1RBE6KKJ1eGWgxWsa+YA==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyIo9/dGrFiAlca+wwr9yM0sBYllwGcIo7ZcRFB2eKzmaIvjYea
	idwoSrLXYfIynabG6rGF47b3poYJrHGM5MZZZrMLUAx1If65gP9x+3JmStu5fvVVAnc=
X-Gm-Gg: AY/fxX6akw8T3MkCkPtxYqFO1oOj8FfyWORRURQwB+0DeNJDHJpDZshfhZppKI58w+X
	XrxmPaUOAGTc+G9lDyYni7btPlYhscpCsx4QanRm2R2BAjO4o+ABw01xJ75ZbFpVaEZfHiIZRM4
	+PRYBl+xCPI6XNfroC9UuS+5z/ZpOalNY/5Fen5u4hCrKiwpbfFcAMZ8wr/AJkhP7Oa/bp/VrAX
	u7c0kWXWMUwOibqK18Crji+tujqrS+rkKuOXyKjBrZmq7MxT2ILoW/z1h24sjvBhJHcPjz1zJ8b
	xhfkeWXWgKCj0l+FXQf/DAe3tbPrObop3tmADAUQULddr6FXoyBJgLgmw4OohHY/YdJI1JOYzNE
	gBcDQApKfgWb23uZji3p2wroIDlOCXvxFPkPIZkiO5EqK8nubl9Pu+7GkVmqcqMFLVZc6+RZOto
	zlFL1VRYd0z9GhB7NoFGhDc7onPa+SDfk2jdNLdO6yAJwA5NhrnRJXmKXEocDIQcahM96lHlf6
X-Google-Smtp-Source: AGHT+IH6lI7OLjA4UKyldXv/X5e3PWGJd0NulqEOS0rUBSohEUMAAOo2/8CwzloBIY7g58Sp1fRPzw==
X-Received: by 2002:a05:6402:34c2:b0:63c:eb6:65e8 with SMTP id 4fb4d7f45d1cf-65097e6a85dmr3318599a12.30.1767812637882;
        Wed, 07 Jan 2026 11:03:57 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:97d2:bd66:800:7506? ([2001:8b0:aba:5f3c:97d2:bd66:800:7506])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507bf661fesm6006892a12.25.2026.01.07.11.03.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 11:03:57 -0800 (PST)
Message-ID: <1441d3bab7f90779a57c82e940369a8a6dd53786.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 03/15] rust: install Rust library sources
 for 'make rustavailable' support
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Randy MacLeod <randy.macleod@windriver.com>, Harish Sadineni
	 <Harish.Sadineni@windriver.com>, bruce.ashfield@gmail.com
Cc: Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr, openembedded-core@lists.openembedded.org
Date: Wed, 07 Jan 2026 19:03:56 +0000
In-Reply-To: <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
	 <20251230141540.1974380-4-Harish.Sadineni@windriver.com>
	 <eb3a975606e2cf27a04c999158a9d39f2cb7a007.camel@linuxfoundation.org>
	 <ad562934-8523-4071-801a-8dd5709c0868@windriver.com>
	 <6baec353-7ac4-4801-8e13-225e4d9432f2@windriver.com>
	 <663fe060-072a-43a4-b0f9-20e172007c47@windriver.com>
	 <980e869b-15e4-4b6a-a2ac-3e13ecb43b00@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 19:04:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229028

On Wed, 2026-01-07 at 13:21 -0500, Randy MacLeod wrote:
> =C2=A0
> On 2026-01-07 11:34 a.m., Harish Sadineni wrote:
> =C2=A0
> > On 1/7/2026 12:29 AM, Randy MacLeod wrote:On 2026-01-05 11:24 a.m.,
> > Harish Sadineni wrote:
> > > =C2=A0We don't want the rust recipe to change based on a kernel confi=
g
> > > unless we *really* have to=20
> > > =C2=A0since that essentially doubles the testing that should be done
> > > or leaves a gap in testing of the=20
> > > =C2=A0rust builds. If you do that for the kernel first, then another
> > > recipe later, soon you have a maintenance mess.=20
> > > =C2=A0
> > > =C2=A0Also if the kernel needs these files, then it's likely that
> > > other software will need it as well.=20
> > > =C2=A0You should analyze why the kernel needs these files and why
> > > other recipes do not. Perhaps any=20
> > > =C2=A0kernel-like image will have the same requirement. Is there a
> > > baremetal image=C2=A0 using rust anywhere=20
> > > =C2=A0that you can use to check on that? I looked but all I found was=
:
> > > =C2=A0https://github.com/ahcbb6/baremetal-helloqemu-rust=20
> > > =C2=A0Anyway, let's focus on the linux kernel's requirements for now.=
=20
> > > =C2=A0
> > > =C2=A0
> > > =C2=A0So, how many files are needed and how much FS space do they use=
?
> > =C2=A0The file size of the library directory is around 50MB.=20
> > I've been around since the 1990s, 50 MB doesn't seem small to me
> > but
> =C2=A0let's see what other people think.
> =C2=A0
> =C2=A0
> Also, how may files is that?
> =C2=A0
> =C2=A0What's the content?=C2=A0 ls -lR if the list isn't too long.
> =C2=A0
> =C2=A0Does the kernel build need each and every file ? How did you check?=
=20
> =C2=A0Can we automate the generation of the list of required files by
> scraping the data from the kernel perhaps?
> =C2=A0
In the scheme of things, 50MB is not great but probably ok. It will be
compressed down for sstate and so on.

It does however need to be in a separate target package, that is
important.

The win here is that if you change DISTRO_FEATURES, rust/rust-native
shouldn't be rebuilding, which is worth a bit of disk usage, IMO at
least.

Cheers,

Richard


> =C2=A0

