Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78015C352A1
	for <webhook@archiver.kernel.org>; Wed,  7 Dec 2022 00:18:56 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
 by mx.groups.io with SMTP id smtpd.web11.2484.1670372326529329911
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 16:18:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=65qugY3F;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.50, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f50.google.com with SMTP id f7so22718134edc.6
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 16:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WJZKQIGsKlUnhXzTvFZeocnju1SBvvehOdfHxiq0vlA=;
        b=65qugY3F7Z6bRCmqRgXS6kK4hBUETGNgNERXFAZjgrvyPau1nie0fGVhw4hRqecKje
         31gdm1RLygV9T0XaCecZ7rEXUHc1w7yms0a7sVL9NAqnrgBcd8li2titmWoSr0scS5FL
         rrRXjtvFTM/UBNxXaGmaFTmdLL74mKN4VX+XGuES74snPZ7WXEMXXmFcZgzM8p1igobt
         QIKeyX2LWbtJh0tI4IDORcCsPQVI5OBAcr+j6F275MANeITdIaMVRmFXpMU4cBmssRWM
         j3B4N9BNJTV5V2cfDHD87MKqMK5UOweh2kXeqiyD0Z8XZfc/PBu98jgQBFy5GesYbUK6
         dtpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WJZKQIGsKlUnhXzTvFZeocnju1SBvvehOdfHxiq0vlA=;
        b=EUR0Ubqzxr9OnvykDLjYsDilHKhBzYA4SKJfLn+UsFTu1hmIyj1NWLr9fwjjC6a39H
         ZhYQ2CJxv0RvbiVkgPblHjUY5On98MGk4I0dKXSzFa5BddhX5f6oNXgw1XIsnKU3eeIY
         MtRkvDkAmpYnI9qcB6zalAhpTfirfrH59OSeE5LVQ2fCnNC9X2ZNgGbVc/6NU5MbjeF6
         nxb/5XS6lIZ3GGVBIgI6kltIJAlWuWJfg76X6eWYgeA4MxzWiVmx3j71/4Dg2v4VWRUZ
         8SATZItxP/LHk8dDjOqWSn4rrVWBFqANnzsR3AXo8sz21Food27BCjD3EHIT/dKYfJpk
         c7NA==
X-Gm-Message-State: ANoB5pl7LfqoxPmwTjArl0nTQ1qsK6KfF1vrP2S4DPcWYyg97OnAAG24
	lHz2QE1V39zgRBsZf0E3y8RqwLVSl8ffTUBEuniBK7bX+aK7ihEQk8ut7g==
X-Google-Smtp-Source: AA0mqf7FZWhjCJe4US5ZhAqZf6anUSb7X+s/vmfDlr1Zn0Wi2U68Pbj3rNFQ5FxzFIrreMO9NRmBWYpVpgQtje5sM/I=
X-Received: by 2002:aa7:dd15:0:b0:46b:c12:29e5 with SMTP id
 i21-20020aa7dd15000000b0046b0c1229e5mr39679386edv.236.1670372324734; Tue, 06
 Dec 2022 16:18:44 -0800 (PST)
MIME-Version: 1.0
References: <20221206221600.28214-1-joe.slater@windriver.com> <9a1ba933-8445-fb39-1c58-c8a690de2e03@windriver.com>
In-Reply-To: <9a1ba933-8445-fb39-1c58-c8a690de2e03@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 6 Dec 2022 14:18:33 -1000
Message-ID: <CAOSpxdZjN89r6OUYmD5Os13XFivKy1+7sQ3642OFfF6kQMgWZw@mail.gmail.com>
Subject: Re: [kirkstone][oe-core][PATCH 1/1] libarchive: fix CVE-2022-36227 --
 and langdale !
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Joe Slater <joe.slater@windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Dec 2022 00:18:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174337

On Tue, Dec 6, 2022 at 1:59 PM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2022-12-06 17:16, Joe Slater wrote:
> > Import a patch from libarchive applied after release 3.6.1.
>
> Thanks Joe.
>
> Steve,
>
> This should apply to langdale as well.

"Should" :-)

It doesn't apply cleanly due to:
https://git.openembedded.org/openembedded-core-contrib/commit/?h=stable/langdale-nut&id=339055f5abc30ea5dc26184c94a2da39ed46a22f

But I'll tweak the patch and see what happens on the autobuilder.

Steve

> >
> > Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > ---
> >   .../libarchive/cve-2022-36227.patch           | 48 +++++++++++++++++++
> >   .../libarchive/libarchive_3.6.1.bb            |  4 +-
> >   2 files changed, 51 insertions(+), 1 deletion(-)
> >   create mode 100644 meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
> >
> > diff --git a/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
> > new file mode 100644
> > index 0000000000..4d13bf6492
> > --- /dev/null
> > +++ b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
> > @@ -0,0 +1,48 @@
> > +From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
> > +From: obiwac <obiwac@gmail.com>
> > +Date: Fri, 22 Jul 2022 22:41:10 +0200
> > +Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
> > +
> > +---
> > + libarchive/archive_write.c | 8 ++++++++
> > + 1 file changed, 8 insertions(+)
> > +
> > +---
> > +CVE: CVE-2022-36227
> > +
> > +Source-Repo: https://github.com/libarchive/libarchive.git
> > +
> > +Upstream-Status: Backport [bff38efe8c... unmodified]
> > +
> > +Signed-off-by: Joe Slater <joe.slater@windriver.com>
> > +
> > +---
> > +diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
> > +index 66592e82..27626b54 100644
> > +--- a/libarchive/archive_write.c
> > ++++ b/libarchive/archive_write.c
> > +@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
> > +     struct archive_write_filter *f;
> > +
> > +     f = calloc(1, sizeof(*f));
> > ++
> > ++    if (f == NULL)
> > ++            return (NULL);
> > ++
> > +     f->archive = _a;
> > +     f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
> > +     if (a->filter_first == NULL)
> > +@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
> > +     a->client_data = client_data;
> > +
> > +     client_filter = __archive_write_allocate_filter(_a);
> > ++
> > ++    if (client_filter == NULL)
> > ++            return (ARCHIVE_FATAL);
> > ++
> > +     client_filter->open = archive_write_client_open;
> > +     client_filter->write = archive_write_client_write;
> > +     client_filter->close = archive_write_client_close;
> > +--
> > +2.38.1
> > +
> > diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> > index c795b41628..8213940ad3 100644
> > --- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> > +++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
> > @@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
> >
> >   EXTRA_OECONF += "--enable-largefile"
> >
> > -SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
> > +SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
> > +           file://cve-2022-36227.patch"
> > +
> >   UPSTREAM_CHECK_URI = "http://libarchive.org/"
> >
> >   SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>

