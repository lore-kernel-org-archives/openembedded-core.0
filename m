Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web09.5227.1628259177675757240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 06 Aug 2021 07:12:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=uJHU0os3;
 spf=pass (domain: gmail.com, ip: 209.85.167.51, mailfrom: luca.boccassi@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id f42so18160143lfv.7
        for <openembedded-core@lists.openembedded.org>; Fri, 06 Aug 2021 07:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CxunyBUz5Qr2tkGO77eNf/SEo4V3KQEv+YZmUutUlAc=;
        b=uJHU0os3KOKW6k9xbnJ1KJ1zlO6GuG+7owWkUAAUJDsUumaWzsgzWxr7cQYIn3Gg42
         mfpA/oRYQQLcqvwRPvX0nXvAM8S1IFNx9JaXe4zzPpPH3Uv1dHmlMjAPKKQh/FCfQlDO
         yt9uW8Wof19zfqe1NyDEh5qV9qtofUzxaBtEhsEEPeouyjUBWLXs42alJfHru6VcZyWZ
         eVUvADcUo2VM4Xi4tRw7g2UUOzp7TzoO8alHHYw8i+WNaSLaaIPws7nAfpelqEYv65m7
         xpHmKfRE2YIV4KtndmCT2iAygYmXhsaTJ6v45oDOTWf4h4x8Xtv72HDkkcHdEl7Nbejn
         d0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CxunyBUz5Qr2tkGO77eNf/SEo4V3KQEv+YZmUutUlAc=;
        b=XDtFmVoumVFgSnytOZeh2rZ6bFKl7RCWi61OOhjrF16MJ37YZuQWraPpS2p7TzDg1J
         HgoVhJZKFgQLAcE3iU//CShQvXTs1UH5GvKghu8/0XlVy9cqWDGh6EPdWuB0PGWzAXQr
         USOI7/GLMadlAlCDdqaBRCWA4UnODefHe1mUKH0eorGTiNCB4FFEOv8/6cXlg5njo6q8
         rE1p5jMkuMjwFHSJPriR4/ofj3y9EahPBa09ag9huCBtCDZRLTCnjrDUAO/CEXjrwJQ2
         Wq8w4AMzCeECpE/QPAV2sRFJZf1t5dQEAmic67I/GVVOk/Fg8c8dMSN/CotQUVt8Ltwm
         VJjQ==
X-Gm-Message-State: AOAM5322fpN1cq+ewpZfz4F4qFO0PYflCMRbminknybmiGk1fd4SH0aL
	xFkeRhgg7vSxbliktMQP2ptf4o9E9zgDFLw0Ifw=
X-Google-Smtp-Source: ABdhPJzDofVK98gp+qB7NzAEpRq+X9NWe9yLvVi2+hFELXyZk2RQgkIiSLc87OJZ/0JyKhlZt1rsLi2CzysYvVS3sPc=
X-Received: by 2002:ac2:5d42:: with SMTP id w2mr7856630lfd.308.1628259175894;
 Fri, 06 Aug 2021 07:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210727201325.2215487-1-raj.khem@gmail.com> <AM7PR83MB0436960F9D4BFDD1F504F0DFF1EB9@AM7PR83MB0436.EURPRD83.prod.outlook.com>
 <423aed88f51b09d6342089f4b02dc9d62bbdb413.camel@gmail.com> <CAJ86T=WgmhDG1OpB3CVf9EtRtxA0hFimKmXod4tcTX3NX1j54w@mail.gmail.com>
In-Reply-To: <CAJ86T=WgmhDG1OpB3CVf9EtRtxA0hFimKmXod4tcTX3NX1j54w@mail.gmail.com>
From: "Luca Bocassi" <luca.boccassi@gmail.com>
Date: Fri, 6 Aug 2021 15:12:44 +0100
Message-ID: <CAMw=ZnQuXfz81KeW81E_K-1yfpTFZ9x-Ct1gTg8S6CiucBUQ+Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] systemd: Fix build on musl
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Jul 2021 at 20:11, Andre McCurdy <armccurdy@gmail.com> wrote:
>
> On Thu, Jul 29, 2021 at 6:49 AM Luca Bocassi <luca.boccassi@gmail.com> wrote:
> >
> > Having a look at the patches, a few comments:
> >
> > - 0012-don-t-pass-AT_SYMLINK_NOFOLLOW-flag-to-faccessat.patch I find
> > quite worrying, as it fundamentally changes access patterns, some of
> > which are done for security reasons. At best, this will cause
> > completely different runtime behaviours for the same filesystem
> > depending on the libc implementation, which doesn't sound great?
>
> I wrote a long and verbose comment when I created the patch which
> tries to document any differences in runtime behaviour.
>
>   ----
>   Avoid using AT_SYMLINK_NOFOLLOW flag. It doesn't seem like the right thing to
>   do and it's not portable (not supported by musl). See:
>
>     http://lists.landley.net/pipermail/toybox-landley.net/2014-September/003610.html
>     http://www.openwall.com/lists/musl/2015/02/05/2
>
>   Note that laccess() is never passing AT_EACCESS so a lot of the discussion in
>   the links above doesn't apply. Note also that (currently) all systemd callers
>   of laccess() pass mode as F_OK, so only check for existence of a file, not
>   access permissions. Therefore, in this case, the only distiction between
>   faccessat() with (flag == 0) and (flag == AT_SYMLINK_NOFOLLOW) is the
>   behaviour for broken symlinks; laccess() on a broken symlink will succeed
>   with (flag == AT_SYMLINK_NOFOLLOW) and fail (flag == 0).
>
>   The laccess() macros was added to systemd some time ago and it's not clear if
>   or why it needs to return success for broken symlinks. Maybe just historical
>   and not actually necessary or desired behaviour?
>   ----
>
> If that comment is now out of date or something is missing then please
> send a patch to update it.
>
> However looking at this patch again now, it appears to have got broken
> during a past rebase:
>
>   https://git.openembedded.org/openembedded-core/commit/?id=e8dd5a36bf2f1e645fb2ff15eb3b5e97c04776e6
>
> The upstream code changed from:
>
>   #define laccess(path, mode) faccessat(AT_FDCWD, (path), (mode),
> AT_SYMLINK_NOFOLLOW)
>
> to
>
>   #define laccess(path, mode)                                             \
>           (faccessat(AT_FDCWD, (path), (mode), AT_SYMLINK_NOFOLLOW) <
> 0 ? -errno : 0)
>
> but the replacement version in the patch still returns the raw result
> from faccessat(). That looks like an issue.

If you think the flag is unnecessary (I don't, we use these for a
reason, but that's not important right now), the correct action is to
send a PR upstream to discuss removing it. Patching it out for one
build case of many is just going to be a source of incompatibility and
surprises for users, as the behaviour on the same filesystem changes
depending on the build option. Having said that, I don't use musl so
all of this is really not a problem for me, just providing some
feedback as upstream maintainer, in case it can be useful.

Kind regards,
Luca Boccassi
