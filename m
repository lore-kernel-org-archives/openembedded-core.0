Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web09.17066.1624069557981573710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 19:25:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BhzrUOne;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id g8so18833609ejx.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 19:25:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TF6Vg0DIOBaE9eHHEvV11+K/UYWyCf4guTHcoSHdIdM=;
        b=BhzrUOneMtf2wkRjEABdDnE1ADz4F1bygTYzHsORhCJgEIpqtuj45AonpAD/SevxM4
         9zOEYPzfdw8VkXmgZgXkJqcZ6yi4P8eAwAxNt6OV2qq/7wqV00ZAlC/wcHI4wx8WI0RT
         m7pfLBrWgYccxuzO1ve3HHEeO3iQs0sXPCqe5bKao1HvayqaLc6y4EUqRlSUlYjgkb7z
         kVMVnYIFx+dYKLxIHpO1lDQmkJ/yBxsLT0IRy53xVXBgLX3/RfL5YzPRXHM05qh9o/i9
         CcRAGe2C3bJtU3H1nvWrt8/q1cRiRfKgHlFJUlM09P9tfYfHWotkh+fABV700gUqNsVy
         2a2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TF6Vg0DIOBaE9eHHEvV11+K/UYWyCf4guTHcoSHdIdM=;
        b=gWR1+1L6UiCcxzAhceW56biaLmBTikl/Mwy3zGUP8JS9bP3H7Cdid/b6dK/3s/psG5
         VQUNc0742xhb493eSZWzq2fN/7DiF9T+FK+NKDg64velEQ8JAK3p8I1v678Gu/iM0GyR
         Bnw6NeCQW7SuhALyxWDfbwbC/SNCMe2boTqoqLKglicuqgG6UuZPMHJ4ZmEGtd/7GJsB
         qGxF7M/1k6V97kf7BhR0roRvA4PZvAFAQ5tUpt7efFbn8zHvqFwgu2dPKUPh06aidecr
         hcBWm7vgBg5us0NxQlNvPao+jhgeoPQNIJCCRVXFoH/qkOPuRZMVD5TkgO3j42iWdU42
         f5iw==
X-Gm-Message-State: AOAM5325TTWTrR6kaW24IkhSK7YPyU31G8fAwWbRPldXT06wxExrCnew
	+Cm1A/0iSkOldFwbO6aMs9W4QEpRF+suUY7T7yk=
X-Google-Smtp-Source: ABdhPJwWZ9SctR2Xj2yegFiIbEuZCFPxSDqbaapY2UK/ZD+PvzUXfSw3C2zFK5oA0VoWwIFG+Q9Uj7P6PTAs0l0te58=
X-Received: by 2002:a17:906:180a:: with SMTP id v10mr13703092eje.22.1624069556575;
 Fri, 18 Jun 2021 19:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210618194345.38131-1-bruce.ashfield@gmail.com> <CAMKF1spzxhUkBS=0bcS6E41Q540OJ5_MdLU10HL6Cf4uPBtTsw@mail.gmail.com>
In-Reply-To: <CAMKF1spzxhUkBS=0bcS6E41Q540OJ5_MdLU10HL6Cf4uPBtTsw@mail.gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 18 Jun 2021 22:25:45 -0400
Message-ID: <CADkTA4MKJHc0ZLHEpeJrNUQgevOuSWx=H2ARqtdKgzYW3c7N-Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] btrfs-tools: include linux/const.h to fix build with 5.12+ headers
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 18, 2021 at 6:24 PM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Jun 18, 2021 at 12:44 PM Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
> >
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > btrfs-tools compile fails with mips, musl and 5.12+ headers.
> >
> > The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
> > add an explicit include of const.h to pickup the macro:
> >
> >   | make: *** [Makefile:595: mkfs.btrfs] Error 1
> >   | make: *** Waiting for unfinished jobs....
> >   | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
> >   | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
> >   | collect2: error: ld returned 1 exit status
> >
> > This is safe for older kernels as well, since the header still
> > exists, and is valid to include.
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >
> > I've started a discussion if this is required upstream, but didn't
> > want to wait on sending this.
> >
> > I'm working on the update to libc-headers 5.13+ and ran into this
> > build error .. only on musl and mips64. Which is why there is
> > hesitation on if this is needed upstream.
> >
> > Cheers,
> >
> > Bruce
> >
> >
> >  ...ude-linux-const.h-to-fix-build-with-.patch | 42 +++++++++++++++++++
> >  .../btrfs-tools/btrfs-tools_5.12.1.bb         |  1 +
> >  2 files changed, 43 insertions(+)
> >  create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> >
> > diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> > new file mode 100644
> > index 0000000000..d7188881da
> > --- /dev/null
> > +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch
> > @@ -0,0 +1,42 @@
> > +From 3d19b0fb882c5e195362a9f0909c474e60070ca0 Mon Sep 17 00:00:00 2001
> > +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +Date: Fri, 18 Jun 2021 11:10:36 -0400
> > +Subject: [PATCH] btrfs-progs: include linux/const.h to fix build with 5.12+
> > + headers
> > +
> > +btrfs-tools compile fails with mips, musl and 5.12+ headers.
> > +
> > +The definition of __ALIGN_KERNEL has moved in 5.12+ kernels, so we
> > +add an explicit include of const.h to pickup the macro:
> > +
> > +  | make: *** [Makefile:595: mkfs.btrfs] Error 1
> > +  | make: *** Waiting for unfinished jobs....
> > +  | libbtrfs.a(volumes.o): in function `dev_extent_search_start':
> > +  | /usr/src/debug/btrfs-tools/5.12.1-r0/git/kernel-shared/volumes.c:464: undefined reference to `__ALIGN_KERNEL'
> > +  | collect2: error: ld returned 1 exit status
> > +
> > +This is safe for older kernel's as well, since the header still
> > +exists, and is valid to include.
> > +
> > +Upstream-status: OE Specific [mips64 + musl + libc-headers]
>
> I think it's not specific to musl or mips64 or OE, it should be worth
> upstreaming to btrfs-tools.

The build error says otherwise.  It quite literally only breaks on
musl and mips64 with the updated libc-headers, but I didn't dig into
how or why the other arches and glibc aren't hitting the error, so who
knows :D

But yes, as I mentioned, I will send it upstream after a bit more soaking.

Bruce

>
> > +
> > +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +---
> > + kerncompat.h | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/kerncompat.h b/kerncompat.h
> > +index df167fe6..254235bd 100644
> > +--- a/kerncompat.h
> > ++++ b/kerncompat.h
> > +@@ -30,6 +30,7 @@
> > + #include <linux/types.h>
> > + #include <linux/kernel.h>
> > + #include <stdint.h>
> > ++#include <linux/const.h>
> > +
> > + #include <features.h>
> > +
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> > index 3fc959bf8e..d0c9cf2a99 100644
> > --- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> > +++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.12.1.bb
> > @@ -18,6 +18,7 @@ DEPENDS_append_class-target = " udev"
> >
> >  SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git \
> >             file://0001-Add-a-possibility-to-specify-where-python-modules-ar.patch \
> > +           file://0001-btrfs-tools-include-linux-const.h-to-fix-build-with-.patch \
> >             "
> >  SRCREV = "96d77fcefdd3b9fd297b5aabbce6dc43e2315ee2"
> >  S = "${WORKDIR}/git"
> > --
> > 2.19.1
> >
> >
> > 
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
