Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3A8C433EF
	for <webhook@archiver.kernel.org>; Fri,  5 Nov 2021 17:36:12 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web12.8957.1636133771666768580
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:36:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EQRq3C/c;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x15so4374653edv.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Nov 2021 10:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lwmAQHtveRtZEj0+1VEzc3Yk5V9xM27AsN9WUGD9Vp8=;
        b=EQRq3C/cgfpbpj3t1AZOPegPkFnRsNPlmkBWYsAaU+9YAUz913+E5pyxaAgSHAwIE1
         SXA8/xQsLAoNCU1pt98NyXdiKSkSUs8948ceBKHP6dU6+PtbUD8rm/4e5r4avpjvdWKQ
         zCGbVuckDp5cY00pfDjU8wedN/3QCBxL8C1kB9EyxhbPRmd/pogk+x0W7ixphOWQPbUP
         4OHc7x+kZwifHcaj3UtQiElEwJfHcYkociXcNc+goXj/4uld8gWw9VhYDxRtM6qXV04y
         EfjwICZ01EA6LBPOqFbHGp5f2yi8S3y9Kb7AymZJkIGfaL2kUZeVX8hH8G7ICq1wfoPF
         Hmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lwmAQHtveRtZEj0+1VEzc3Yk5V9xM27AsN9WUGD9Vp8=;
        b=XAzbaseG31txefYcSlctyOOz0KzIHChVHxfAraPX9LVccR4rdMvzRb5AsRS5Cug1os
         ACrZNGB4jiVToLfKbd5C+cRlqytFSdVrY7JRjNCENMSXdOnkIkpq6dv/iQJ26Cri97zh
         KCSTmAvfP3BcjilOHmr8Y4YvnJyzC/P6ZvFGuErTi3KUaVauEBTStsDCb7ovL7MvnBmO
         2SGmi1ivLp0RE6wviDB9Vi1UX2Xu+1jSGgahr8QuQuWih1TeMAUJT8Ib691fc/p0n0EV
         B/b8q7UxmtuU2K6kSq0p9RQ6ucap+4ViHUroDdYTEm+Tw9fVmPq63TUPRyXSK2jyOZ8T
         Zq2A==
X-Gm-Message-State: AOAM533tLdf+174kUSgQkHoKrpnqLta8BI5T7JEgZlY8VRvbIbwbwf5v
	2S6yZk145B39Nz7wP2yvhIyKNFCZwqKhB5xJdAc=
X-Google-Smtp-Source: 
 ABdhPJww9ZemxztAOnBFC/cHkroyF7zpkYqPBirrGDGNRV7JS+hcne35XGuQ1llr5cmY6BKRC/sttKeD/tSwtsaZKXE=
X-Received: by 2002:a17:906:48cd:: with SMTP id
 d13mr9245377ejt.35.1636133769907;
 Fri, 05 Nov 2021 10:36:09 -0700 (PDT)
MIME-Version: 1.0
References: <20211105171954.8848-1-bruce.ashfield@gmail.com>
 <4059496a-3720-1f5c-a22b-fbfeaca37a99@gmail.com>
In-Reply-To: <4059496a-3720-1f5c-a22b-fbfeaca37a99@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 5 Nov 2021 13:35:58 -0400
Message-ID: 
 <CADkTA4NJdKTGAxJ+YFxe2zqwDB4SjuimF10UCD17yXGVvWFKLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ppp: fix build against 5.15 headers
To: Khem Raj <raj.khem@gmail.com>
Cc: richard.purdie@linuxfoundation.org,
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Nov 2021 17:36:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157918

On Fri, Nov 5, 2021 at 1:32 PM Khem Raj <raj.khem@gmail.com> wrote:
>
>
>
> On 11/5/21 10:19 AM, Bruce Ashfield wrote:
> > From: Bruce Ashfield <bruce.ashfield@gmail.com>
> >
> > The 5.15 kernel has removed ipx support, along with the userspace
> > visible header.
> >
> > The build error was found for muslc, since it doesn't have a
> > fallback header, we disable it for both glibc/muslc.
> >
> > This support wasn't used previously (as it hasn't been very well
> > maintained in the kernel for several years), so we can simply
> > disable it in our build and wait for upstream to do a release that
> > drops the support.
> >
> > Although the tarball we use for our build (versus git), doesn't
> > use the autoconf disable flag to turn off the support, it is included
> > in this patch in case someone is building via git source base.
> >
> > Upstream-Status: Inappropriate [OE-specific configuration/headers]
> >
> > Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > ---
> >   ...1-ppp-fix-build-against-5.15-headers.patch | 36 +++++++++++++++++++
> >   meta/recipes-connectivity/ppp/ppp_2.4.9.bb    |  3 ++
> >   2 files changed, 39 insertions(+)
> >   create mode 100644 meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> >
> > diff --git a/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> > new file mode 100644
> > index 0000000000..c91246dbf5
> > --- /dev/null
> > +++ b/meta/recipes-connectivity/ppp/ppp/0001-ppp-fix-build-against-5.15-headers.patch
> > @@ -0,0 +1,36 @@
> > +From aba3273273e826c6dc90f197ca9a3e800e826891 Mon Sep 17 00:00:00 2001
> > +From: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +Date: Fri, 5 Nov 2021 12:41:35 -0400
> > +Subject: [PATCH] ppp: fix build against 5.15 headers
> > +
> > +The 5.15 kernel has removed ipx support, along with the userspace
> > +visible header.
> > +
> > +This support wasn't used previously (as it hasn't been very well
> > +maintained in the kernel for several years), so we can simply
> > +disable it in our build and wait for upstream to do a release that
> > +drops the support.
> > +
> > +Upstream-Status: Inappropriate [OE-specific configuration/headers]
> > +
> > +Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> > +---
> > + pppd/Makefile.linux | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/pppd/Makefile.linux b/pppd/Makefile.linux
> > +index 22837c5..23b9b22 100644
> > +--- a/pppd/Makefile.linux
> > ++++ b/pppd/Makefile.linux
> > +@@ -91,7 +91,7 @@ MAXOCTETS=y
> > +
> > + INCLUDE_DIRS= -I../include
> > +
> > +-COMPILE_FLAGS= -DHAVE_PATHS_H -DIPX_CHANGE -DHAVE_MMAP -pipe
> > ++COMPILE_FLAGS= -DHAVE_PATHS_H -DHAVE_MMAP -pipe
> > +
> > + CFLAGS= $(COPTS) $(COMPILE_FLAGS) $(INCLUDE_DIRS) '-DDESTDIR="@DESTDIR@"'
> > +
> > +--
> > +2.25.1
> > +
> > diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > index 235595ff76..bd6435e69c 100644
> > --- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > +++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
> > @@ -24,6 +24,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/${BP}.tar.gz \
> >              file://ppp_on_boot \
> >              file://provider \
> >              file://ppp@.service \
> > +           file://0001-ppp-fix-build-against-5.15-headers.patch \
> >              "
> >
> >   SRC_URI[sha256sum] = "f938b35eccde533ea800b15a7445b2f1137da7f88e32a16898d02dee8adc058d"
> > @@ -39,6 +40,8 @@ EXTRA_OECONF = "--disable-strip"
> >   #
> >   EXTRA_OEMAKE += ' COPTS="${CFLAGS} -I${STAGING_INCDIR}/openssl -I${S}/include"'
> >
> > +EXTRA_OECONF:append:libc-musl = " --disable-ipxcp"
>
> does this have to be musl specific ? given that kernel is dropping ipx
> support I think this should be disabled unconditionally isnt it ?

I covered that in my commit message :)

Bruce

>
> > +
> >   do_configure () {
> >       oe_runconf
> >   }
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157915): https://lists.openembedded.org/g/openembedded-core/message/157915
> > Mute This Topic: https://lists.openembedded.org/mt/86846153/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

