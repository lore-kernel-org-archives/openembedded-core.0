Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web12.12888.1627580902850405475
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jul 2021 10:48:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=rMI3LYO1;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id dk2so1003048qvb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jul 2021 10:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnMFqnayGRcGFQ5JUdfD2zb4a9hmhVRuampvURoIXj8=;
        b=rMI3LYO1AoXYB1ZN+cKLlw1OVwSXgOhWsJqVwJVWcWL+MP0QjXwxMLpImmDA9/NXq+
         IZVQ4341k0aVOp6WEjsMLFqebuscBQJocmARwnqyefwwNyK4Am3rMDPJG9nSdL5Vqn7v
         GU4xxwKtLNCffMU6QQiL7RNOkx92HUcLZXKlo5QU+6hKsmtC8Ggs9WiNaTna3VGsEgnh
         lFT4DbQ+Pj6OhNqOrC8JcAeieemQ+7Yq4qU8wzYyTdPOzLuER7UkXnNHswWhP090qhk0
         iObU5GbWrAK9hhmEL3BlS44rPqxlhQDWpGvskLx3Dxs2eoBCML1mbSuQUOG95mctPKAR
         Y0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnMFqnayGRcGFQ5JUdfD2zb4a9hmhVRuampvURoIXj8=;
        b=mQmwFzWWPyd7p8x1399tVZD15U+WeHFrIjwWEaqKLl6Fgax+T1SlKsQwlOyKxvJJxs
         p910awXOGksgnsxihbYn0VSAZjVLpvKIvPr8wn8fC5cG8K0sWhYxrJ/tCqnuV9Brj6hM
         mPVPJdwWbFXxWkNWGxpLWgizv6ntaq1Ql+uzC8XKSOVeNkLBsMuqTUJWMFqpdiRGVDF+
         FGBDnjWsU3tUpFGM3GdKN9xzpFFLyo1dOiOxNHaScefieX2ogoM2TL82d94YqO9893+q
         bkiyM4a+9nyynq5XjODRUKaFWBJFQ+Xr1CzdMGWaCKsCxDM3TgJ3ftudhncyf0WdHsDO
         wjPw==
X-Gm-Message-State: AOAM530Zgf+IU/VXOmxIzG6FFEmjVmCCXdsHw34jv10Gw2mu3e3NjVVk
	oVMmtumV/ty3GZmEvzsgO5CLz2mqR4L9DmkLMaI=
X-Google-Smtp-Source: ABdhPJwKNrcjJGh9+ZN0/0gTfmtPH3hWNjrZZOS1uII/f7WDv9snbgSZ/Xozl78NM7mVWqoLhK7gstOm8PAeJBIF8F8=
X-Received: by 2002:a05:6214:2a3:: with SMTP id m3mr6391194qvv.55.1627580902076;
 Thu, 29 Jul 2021 10:48:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com> <19d2ad76f9ea70218116aa82205cc56a3331520a.camel@gmail.com>
In-Reply-To: <19d2ad76f9ea70218116aa82205cc56a3331520a.camel@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Thu, 29 Jul 2021 10:47:56 -0700
Message-ID: <CAMKF1spN66RmeHQ1vTk2jkOOACNFmvNj-g3JAO5TSR+PpGZ0JA@mail.gmail.com>
Subject: Re: [PATCH] systemd: Fix build on musl
To: Luca Boccassi <luca.boccassi@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 29, 2021 at 6:54 AM Luca Boccassi <luca.boccassi@gmail.com> wrote:
>
> On Thu, 2021-07-29 at 14:49 +0100, Luca Boccassi wrote:
> > On Thu, 2021-07-29 at 12:59 +0000, Khem Raj wrote:
> > > Latest upgrade to 249 broke a working build on musl, this is incremental
> > > fix to exisiting patches adapted to 249 release
> > >
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Luca Boccassi <luca.boccassi@microsoft.com>
> > > ---
> > >  ...002-don-t-use-glibc-specific-qsort_r.patch |  24 +--
> > >  ...missing.h-check-for-missing-strndupa.patch | 173 +++++++++---------
> > >  .../0006-Include-netinet-if_ether.h.patch     | 147 ++++++++-------
> > >  ...OB_BRACE-and-GLOB_ALTDIRFUNC-is-not-.patch |  20 +-
> > >  ...T_SYMLINK_NOFOLLOW-flag-to-faccessat.patch |  14 +-
> > >  ...-not-disable-buffer-in-writing-files.patch | 143 ++++++---------
> > >  .../systemd/0026-Handle-missing-gshadow.patch |  18 +-
> > >  7 files changed, 247 insertions(+), 292 deletions(-)
> > >
> >
> > Having a look at the patches, a few comments:
> >
> > - 0001-test-parse-argument-Include-signal.h.patch was merged upstream,
> > but never removed, I think because it was refactored so it applies
> > cleanly and doesn't raise errors?

seems so.


> >
> > - 0005-src-basic-missing.h-check-for-missing-strndupa.patch this is
> > massive and will keep growing and breaking the build, wouldn't it be
> > better to just implement strndupa in musl? Even out-of-tree it sounds
> > like it would be easier to maintain than this



> >
> > - 0006-Include-netinet-if_ether.h.patch sounds like it should be doable
> > in a way that is compatible with both glibc and musl, and thus could be
> > upstreamed?

I think it could be, although systemd has started caching some of
these system headers in its own sources
which is also troublesome. So overall it has to be addressed with a
bit wider scope.

> >
> > - 0010-Use-uintmax_t-for-handling-rlim_t.patch can be upstreamed but
> > needs to be reworked slightly as explained in
> > https://github.com/systemd/systemd/pull/7199#issuecomment-358268647
> > which seems worth doing to me
> >

perhaps yes, although I was not sure what it would be for a patch.

> > - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> > quite worrying, as it fundamentally changes access patterns, some of
> > which are done for security reasons. At best, this will cause
> > completely different runtime behaviours for the same filesystem
> > depending on the libc implementation, which doesn't sound great?
> >
> > - 0016-Hide-__start_BUS_ERROR_MAP-and-__stop_BUS_ERROR_MAP.patch sounds
> > like a genuine bug, have you tried upstreaming it?
> >

It was part of a cumulative patchset to support musl which was not
accepted but I can try this patch alone.

> > - 0019-Handle-missing-LOCK_EX.patch I see no problem upstreaming this

OK

> >
> > - 0028-missing_syscall.h-Define-MIPS-ABI-defines-for-musl.patch should
> > also be fine to upstream I think, in src/basic/missing_syscall_def.h

OK

>
> Also isn't 0001-binfmt-Don-t-install-dependency-links-at-install-
> tim.patch doable with two drop-ins and a post-install adjustment in the
> recipe, rather than with a patch?
>
> This also sounds like a good candidate for a drop-in, doesn't seem
> generally applicable to me:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=f65757ad1791a46cc210141c84ccc51552171e98
>

surely although its generic and not musl specific perhaps deal with it
separately.

> --
> Kind regards,
> Luca Boccassi
