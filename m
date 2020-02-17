Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 57B446152B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 19:41:00 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id p14so13790132edy.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Feb 2020 11:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=D75BAdtTQNQZNQBytz5N/PUSqviGdTS2ZfryAt/2ftQ=;
	b=qb+DHM4iVOae7W9ayi40oXfzkStO9wDp8OPS/HBgYyjONw4raSsA3tsunqc/HAOqS1
	WPRkzWzHsK+WihhpaUHW66IVHQov5zj0blCrd4H3yTXI/t6qA30J9Ka60bFBIvMeJMQX
	AAdmDdRlDsTXa6XtmwzBvarxmpsk+2J9CoEKSJ+Rv/XdqnpVOq3bABjPhGQnJA2GQDLU
	K6kSqnNCXRXAv5wVg7SpwgvtFOuKe3P28ZmMhEiIhF6MfggtaH5jg0PnKnvKRGedfoI/
	2A1vUaie4AXPdunOkc+RcGPe6usdaMKcbGZ639NCgmeuyzYoc2GuTaz4t/UvFN5RRnri
	KN9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=D75BAdtTQNQZNQBytz5N/PUSqviGdTS2ZfryAt/2ftQ=;
	b=epnfIPzWa1EliOcJNavbhsH67cv8GPr3S4dQTxYyQP38TndsvonPpmkynusOkcHNax
	1KQM8yu80LXwvNPJmnjU1+F3b+vRSDybjgzbrIqEmpldZcAfA8kFH70MeQUik8nDOiHI
	XFy53uam85du5ayL5h0ffCoU30wAoUAcUMYSqrxXGdS2S32OpddBJcPe5b2pzZxW+x1f
	T5YPMVIe1iuLTsrvDh5JRHoWpBfL5M/Massef7EW9pOhxmP5KUR5oQPBbRSx944kaIbU
	2mTJMcE8B2P/zf0t7NPV1S/4pVKw8HidYXhIZN6L3Fz2N5h/8xRwpsVMVtiDCKPLaXrR
	d9Yw==
X-Gm-Message-State: APjAAAXDePqyRwtY4IyCDZB3PG4tQhoTIFFTNZqliKXh4VRYc3mEZlqK
	t6BAVxPPceLS5SycEP+xI6mkIktcrtOXNrPzgD8=
X-Google-Smtp-Source: APXvYqy0YrIudY5ky4/Tn8qJHBg2tM1qcodWQDOKRsd1urvpiyHJADWL8uaPNn38hhAjRizI7oLbuaWMCHRmyKqhq1I=
X-Received: by 2002:a17:906:4bd1:: with SMTP id
	x17mr16380425ejv.181.1581968460992; 
	Mon, 17 Feb 2020 11:41:00 -0800 (PST)
MIME-Version: 1.0
References: <20200214223334.2473195-1-raj.khem@gmail.com>
	<CADkTA4N6vXw-LANzqZiXtngeO-X9dPqb0kGvhBxnJe4FFHgxkw@mail.gmail.com>
In-Reply-To: <CADkTA4N6vXw-LANzqZiXtngeO-X9dPqb0kGvhBxnJe4FFHgxkw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 17 Feb 2020 14:40:49 -0500
Message-ID: <CADkTA4PrX1V9or9Y2in6Cx4sdAy+dX3iWaZP3rrLn+XWcxhk+g@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] db: Fix timespec length assumptions
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 17 Feb 2020 19:41:01 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 14, 2020 at 11:10 PM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Fri, Feb 14, 2020 at 5:33 PM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > This should fix the vdso crashes seen with kernel 5.0+
>
> cool. I'll test this locally and follow up over the weekend.

I can confirm that 32bit x86 + musl no longer traps for me with this
patch in place.

I'll bump the 5.4 recipes again, retest and then send the patches to
make them the default.

Bruce

>
> Bruce
>
> >
> > python3[11312] general protection fault ip:b7e966b0 sp:bf8175cc error:0 in libc.so[b7e8b000+6b000]
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >  ...001-clock-Do-not-define-own-timespec.patch | 45 +++++++++++++++++++
> >  meta/recipes-support/db/db_5.3.28.bb          |  1 +
> >  2 files changed, 46 insertions(+)
> >  create mode 100644 meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
> >
> > diff --git a/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
> > new file mode 100644
> > index 0000000000..9d51a44a26
> > --- /dev/null
> > +++ b/meta/recipes-support/db/db/0001-clock-Do-not-define-own-timespec.patch
> > @@ -0,0 +1,45 @@
> > +From 96b303caf70a7635953c36e5bfb9ad6e75cb7637 Mon Sep 17 00:00:00 2001
> > +From: Khem Raj <raj.khem@gmail.com>
> > +Date: Fri, 14 Feb 2020 14:12:59 -0800
> > +Subject: [PATCH] clock: Do not define own timespec
> > +
> > +timespec is provided by libc and its best left to libc
> > +os_gettime takes a db_timespec and passed its address to clock_gettime
> > +which assumes that db_timespec and timespec are same but actually
> > +its 12-bytes here and libc has 16-bytes
> > +
> > +This can cause problems especially with 64bit time_t
> > +
> > +Upstream-Status: Pending
> > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > +---
> > + src/dbinc/clock.h | 17 +----------------
> > + 1 file changed, 1 insertion(+), 16 deletions(-)
> > +
> > +--- a/src/dbinc/clock.h
> > ++++ b/src/dbinc/clock.h
> > +@@ -44,22 +44,8 @@
> > + extern "C" {
> > + #endif
> > +
> > +-/*
> > +- * This declaration is POSIX-compatible.  Because there are lots of different
> > +- * time.h include file patterns out there, it's easier to declare our own name
> > +- * in all cases than to try and discover if a system has a struct timespec.
> > +- * For the same reason, and because we'd have to #include <sys/time.h> in db.h,
> > +- * we don't export any timespec structures in the DB API, even in places where
> > +- * it would make sense, like the replication statistics information.
> > +- */
> > +-typedef struct {
> > +-      time_t  tv_sec;                         /* seconds */
> > +-#ifdef HAVE_MIXED_SIZE_ADDRESSING
> > +-      int32_t tv_nsec;
> > +-#else
> > +-      long    tv_nsec;                        /* nanoseconds */
> > +-#endif
> > +-} db_timespec;
> > ++#include <time.h>
> > ++#define db_timespec struct timespec
> > +
> > + /* Operations on timespecs */
> > + #undef        timespecclear
> > diff --git a/meta/recipes-support/db/db_5.3.28.bb b/meta/recipes-support/db/db_5.3.28.bb
> > index a2969055a6..badb79f9ea 100644
> > --- a/meta/recipes-support/db/db_5.3.28.bb
> > +++ b/meta/recipes-support/db/db_5.3.28.bb
> > @@ -26,6 +26,7 @@ SRC_URI += "file://fix-parallel-build.patch \
> >              file://0001-configure-Add-explicit-tag-options-to-libtool-invoca.patch \
> >              file://sequence-type.patch \
> >              file://0001-Fix-libc-compatibility-by-renaming-atomic_init-API.patch \
> > +            file://0001-clock-Do-not-define-own-timespec.patch \
> >             "
> >  # We are not interested in official latest 6.x versions;
> >  # let's track what debian is using.
> > --
> > 2.25.0
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

