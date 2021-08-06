Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.533.1628273549247834654
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 11:12:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dF1fDhtx;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: armccurdy@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id p5so12156641wro.7
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 11:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6shQI+vFF02nhbGTDbHYEqVxoqh57JakgPxsGj6DDoc=;
        b=dF1fDhtxLggWNqUBVe9riMZU8P/tZEgd7JxZjb1AwXi09MvO7qmqEZpy3LmlX0XUF5
         VM1F+WlqmAgSIA9kO2t+IjzVGHB3W3AbncyT3y07egmMmMEZX37wGon6+0SsjY4YKYDT
         EWsiZZvsBRxc6cIw0svxWrthHOqfy99sJ64A3M3sI4XGrdfp7xTJnBhff0jwClOb29WJ
         gbiKLmg1WhLCyaZ12xJ7IcWQs7i2QOtA1cDfP4+V0o4Pn3FeUSYTjsc5G7XUQyZOSlzd
         JDJzBPIkmV7cI+fFo2oTrvn/GcA/RydSoVkLfNsJuDzVV6zIJBb0D2Mo4r2/AwgIrJKB
         M1Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6shQI+vFF02nhbGTDbHYEqVxoqh57JakgPxsGj6DDoc=;
        b=ZwyQlGx366G3o5mtuQERjXQS+mzBClIjfYpVdT3Mnazt+wC1CBG1fctR2BarTx1Qke
         zRqbtQX1GPeInPkEft0E9j4oL4BjoWEjPTVs5l9yOrA6jsfUqtGeC2eb1d34CKs4KDw7
         au1kxGJUoAeTVAxLupUYS46SarRdzmGTFfqzHrBMYEuqYC4BdERDDy02KnmKI+fSL+6V
         N8Qw1qihUPVjjj9ASvUE0jji/gwxpOysUqbd6SRTiG6cF4F5HWSt5rnYfeNX94n+Ht3o
         lGKgenGb8P90QkCdKq+cRmu70j8IE1TVl6xmXHlVVDqziHEu9cNIKwfjGjUvG+SsPfll
         33Yw==
X-Gm-Message-State: AOAM531EAr+jJOknZDJMAAezI06hg3V5q7UxG3unbfRoOXgROOVWcpMz
	Oz10H2PwSOTW+ggN6KrTM0zuSABTMpSGVq/yyHQ=
X-Google-Smtp-Source: ABdhPJwsEjcV814m1m2v8jQ/q+2V3Uu7k7UTSfITGmPDN6kmumVU2sp0n4y1Vo19C5yFE3pShwYeZPyxx54eqhO91WQ=
X-Received: by 2002:a5d:5412:: with SMTP id g18mr12333470wrv.301.1628273547737;
 Fri, 06 Aug 2021 11:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com>
 <CAJ86T=WgmhDG1OpB3CVf9EtRtxA0hFimKmXod4tcTX3NX1j54w@mail.gmail.com> <CAMw=ZnQuXfz81KeW81E_K-1yfpTFZ9x-Ct1gTg8S6CiucBUQ+Q@mail.gmail.com>
In-Reply-To: <CAMw=ZnQuXfz81KeW81E_K-1yfpTFZ9x-Ct1gTg8S6CiucBUQ+Q@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Fri, 6 Aug 2021 11:12:15 -0700
Message-ID: <CAJ86T=VQgcOBvFLVL97Oy=m4_jn3-p=Jnir-WLhJSq6y+_wHTQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, Aug 6, 2021 at 7:12 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Thu, 29 Jul 2021 at 20:11, Andre McCurdy <armccurdy@gmail.com> wrote:
> >
> > On Thu, Jul 29, 2021 at 6:49 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
> > >
> > > Having a look at the patches, a few comments:
> > >
> > > - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> > > quite worrying, as it fundamentally changes access patterns, some of
> > > which are done for security reasons. At best, this will cause
> > > completely different runtime behaviours for the same filesystem
> > > depending on the libc implementation, which doesn't sound great?
> >
> > I wrote a long and verbose comment when I created the patch which
> > tries to document any differences in runtime behaviour.
> >
> >   ----
> >   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
> >   do and it's not portable (not supported by musl). See:
> >
> >     http://lists.landley.net/pipermail/toybox-landley.net/2014-September/003610.html
> >     http://www.openwall.com/lists/musl/2015/02/05/2
> >
> >   Note that laccess() is never passing AT_EACCESS so a lot of the discussion in
> >   the links above doesn't apply. Note also that (currently) all systemd callers
> >   of laccess() pass mode as F_OK, so only check for existence of a file, not
> >   access permissions. Therefore, in this case, the only distiction between
> >   faccessat() with (flag == 0) and (flag == AT_SYMLINK_NOFOLLOW) is the
> >   behaviour for broken symlinks; laccess() on a broken symlink will succeed
> >   with (flag == AT_SYMLINK_NOFOLLOW) and fail (flag == 0).
> >
> >   The laccess() macros was added to systemd some time ago and it's not clear if
> >   or why it needs to return success for broken symlinks. Maybe just historical
> >   and not actually necessary or desired behaviour?
> >   ----
> >
> > If that comment is now out of date or something is missing then please
> > send a patch to update it.
> >
> > However looking at this patch again now, it appears to have got broken
> > during a past rebase:
> >
> >   https://git.openembedded.org/openembedded-core/commit/?id=e8dd5a36bf2f1e645fb2ff15eb3b5e97c04776e6
> >
> > The upstream code changed from:
> >
> >   #define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode),
> > AT_SYMLINK_NOFOLLOW)
> >
> > to
> >
> >   #define laccess(path, mode)                                             \
> >           (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) <
> > 0 ? -errno : 0)
> >
> > but the replacement version in the patch still returns the raw result
> > from faccessat(). That looks like an issue.
>
> If you think the flag is unnecessary (I don't, we use these for a
> reason, but that's not important right now), the correct action is to
> send a PR upstream to discuss removing it. Patching it out for one
> build case of many is just going to be a source of incompatibility and
> surprises for users, as the behaviour on the same filesystem changes
> depending on the build option. Having said that, I don't use musl so
> all of this is really not a problem for me, just providing some
> feedback as upstream maintainer, in case it can be useful.

I don't have any interest in systemd + musl anymore either. I did an
initial port as a proof of concept and sent patches to Khem off
list... and was somewhat surprised when they showed up some time later
in oe-core.

Note that there have been long discussions here previously about
whether OE should claim to support systemd + musl. The effort to
support it properly (including clarifying questions like this with
upstream as you suggest) doesn't seem huge but so far no one seems to
care enough about systemd + musl to do it. We rebase and tweak the
patches but guidance to potential users should still be "use at your
own risk".
