Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B670AC02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 17:52:18 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.22637.1739382731083068336
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 09:52:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=dq4cPVbk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38dd14c9a66so2275640f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 09:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1739382729; x=1739987529; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fKGgFpVPyuOvTaREcV5zLGeJfI64zKweS6uHqgNcAAY=;
        b=dq4cPVbkZz6pYUpbyp9JMUeog0MpwcQG8ihXK6peZFFvgVSLOwGveHfE+o/lun5UR6
         zN58WuFROHBRJlPuoBhaN7KF2ss5vJxuI2O4BgHb5NfAM1XzgLOQvE2Dmc17nLI/6c1+
         cf6nb8FYqI/JljPbRpYsvdxsG+u2hq1uOh1Xg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739382729; x=1739987529;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fKGgFpVPyuOvTaREcV5zLGeJfI64zKweS6uHqgNcAAY=;
        b=MWH1URvbtgqdRe9j4r//OZPSiaylNiQmxWSONJZsZaELv9uv6HtEBHmPWfEJHhjQcB
         ShhGUKoZUzRDfK35wWaYfXniLitTkyZAypr+yuq42MiXycKnIf5Ok2XwSA39aKm6Y+pb
         +KJxNsCGcbntWQf5lspb5qtVjUOqDMO/PDkK5LuZc0dAvbJfkmW79v79QqzIaD/GGZq5
         Zawo3V9lNKTn2fldNbsWzILfJfCGzMxJh1r+9KBZ0E1vIcUtCtBvpXslpeC+6v0Qza35
         PSS9+XX4GymWeTHW34HXDtvELFPlK8TcFOqfxLcbCBLGDhP0cHtJ2j8LGbtkxTg4byLm
         E1QA==
X-Gm-Message-State: AOJu0YybS1uy88d7V1IVOahF+aVXKfOB0Q2gTbGCWpNu+77RMSl1+s3U
	JTpJ3rWAvweywbOx6Z3truxlDTuGULPlZ2OwCmVIpgGMT5vdXD9h/0cujkg4Oys=
X-Gm-Gg: ASbGncvejAqud/j0xomsMJpQDDxFPLRrxRJwx4EI9Q87PVRL5JWzM3KJl3FpeI71MyH
	13kdMpdrXwst9cXa6W/OjdsAAbUwVgmYSLvPip3pAUd8oXkG0x8KF8XbauOR+yYvc61aZZN5qqD
	4DMGvcNAH3iPjFzrNWlAOUtZPufoxOGPxWoXtt9BUa+p9nj8/z/9TOppaoppfHBRWKeAQaso/Cv
	uxcgFlMID54RqVNIWUbae2GeBkLgNrV7lP9VkkgcVyrmKbEwvzLQnTMtLPKQCMSY3gv71I8+6pF
	EgQjlhyutNnTZliAtIuzpgbfVlJKG+uuFzDAWyDiP4QgHOwt6s90aeoOsZxNI/LPihPbeiQNe9D
	1tw==
X-Google-Smtp-Source: AGHT+IHKzCNp/SlTrWhAatssSg0uFP12yWZyhcFoNrDSh3xOifTr91Xo5a7+u5imiHRPyt3uVH/jng==
X-Received: by 2002:a05:6000:1fac:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-38dea2f9ab6mr3115029f8f.45.1739382729279;
        Wed, 12 Feb 2025 09:52:09 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:af16:73ba:601:d9ae? ([2001:8b0:aba:5f3c:af16:73ba:601:d9ae])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc6c80df2sm16479189f8f.18.2025.02.12.09.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:52:08 -0800 (PST)
Message-ID: <1b97f3574bc89e5d941f01156b3ff529abaaf59b.camel@linuxfoundation.org>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>, Stefan Herbrechtsmeier
	 <stefan.herbrechtsmeier-oss@weidmueller.com>
Cc: openembedded-core@lists.openembedded.org, Stefan Herbrechtsmeier
	 <stefan.herbrechtsmeier@weidmueller.com>
Date: Wed, 12 Feb 2025 17:52:07 +0000
In-Reply-To: <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
References: 
	<20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
	 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org>
	 <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
	 <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
	 <7848a428-7193-4597-9b85-84e7dd4d3b32@weidmueller.com>
	 <CADkTA4MtM9ZbakC-u0Qk8bQjcOk6uYuYYhFagWR3fmNqC7gWrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 17:52:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211269

On Wed, 2025-02-12 at 12:45 -0500, Bruce Ashfield wrote:
> On Wed, Feb 12, 2025 at 12:24=E2=80=AFPM Stefan Herbrechtsmeier
> <stefan.herbrechtsmeier-oss@weidmueller.com> wrote:
>=20
> >=20
> > >=20
> > > >=20
> > > > As a compromise we could add a new feature to generate .inc
> > > > cache files before the main bitbake run. This would eliminate
> > > > the manual update run and the commit noise as well as special
> > > > fetch, unpack and patch task.
> > > > =C2=A0=C2=A0
> > > Can you elaborate on what you mean by before the main bitbake run
> > > ? Would it be still under a single bitbake invokation or would it
> > > be multiple runs (I support multiple runs, so don't take that as
> > > a leading question).
> > > =C2=A0
> > I can't answer this questions and need Richard guidance to
> > implement such a feature. I would assume that bitbake already track
> > file changes and can update its state. The behavior should be
> > similar to a change in the .inc file. Bitbake will detect that a
> > "include_cache" file is missing and run an update_cache task on the
> > recipe. Afterwards bitbake detect a file change on the
> > "include_cache" file and parse it. We need a possibility to mark
> > patches which shouldn't be applied if the "include_cache" file is
> > missing because the dependencies are missing. We need to run the
> > fetch, unpack and patch task before the update_cache task to
> > generate the .inc file.
> > =C2=A0
> Aha. Maybe Richard will comment later. I was thinking more about
> something that was in two distinct phases, but with some more
> thinking and explanation, maybe this is workable as well.

We don't have anything in bitbake which could support this currently.
We parse once, store a subset of the data and then have all the
information bitbake needs. There is no second parse something else
later in the task graph concept or support, or support for "generate
this file if missing", particularly if generating that file would
require other tasks to run.

That said, I am wondering if we need to do something differently here,
it is obviously just going to complicate things a lot if we need new
concepts and API at that level in bitbake.

Cheers,

Richard









