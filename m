Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61819CDE014
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:13:07 +0000 (UTC)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web10.46137.1727363585911435535
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Sep 2024 08:13:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YnWITQKp;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2f761461150so17402991fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 08:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727363584; x=1727968384; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hq603KqnvbGnGWre+JIuQ4a1ubhPZmHiI2Y8XeFUNhg=;
        b=YnWITQKpVVD3HM5Bu2vV6RAvLQ5/WTffyiAY7esRrM9SWJqtyJdQqZlgoIScZF+G49
         fdwRt/+6jAwT6s3l5DThCbtrF3KOlklkuZEed1ZpymTzR5PQJz1BuNvaYzr/JI1/aBGy
         hKxJFmQcBZtxTTBtdxZLhTRDmy763FqTkOyg8bOVLYDcyEwtweoRJS/6bTrW5iUTH1IL
         IyUHKMxIUYxSnDhgQcag0yDIXV6bsHLITn2fadR9zTgnQ/F2dJ1K5ITftLzUcqAsmtF2
         UH2kSCWiwvFNkF+DtpfHM8wf+kEyn2Nr4V7UWm/yRwCZt5UisJai6zuD/hj5QoCUL8t2
         3IXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727363584; x=1727968384;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hq603KqnvbGnGWre+JIuQ4a1ubhPZmHiI2Y8XeFUNhg=;
        b=tnqTeN4CkfRBopeMYbpMKSzNAiMmdz8BlhC/zqxEJKdA2ZffzcyLagIwJ59R7GPnr+
         j9Vbga/pa8rKL5WgCXRzPTe0klQ/yd8uAyXfsXdMzJJALW4uZ3Yq3kkyZaZlkCZxtnOf
         ApqUxBZOW4EL8DSaZ8yAbmEL4soUHZfRVgXuNGTCKDRoKRBWBrPB0xzZfl4B0SzZ/yHs
         mnscrYXzWZen+4kolMLGlB+NT2vV7R2Cc+7fugMMQywpZrmIPlWisJeIXcEz3FQa+cg5
         5sBhAzNTWMC/FXLLKL9SquhAwemQ/pfa+1zunOpVehFiY0uEolKin3EDBB5RDVGwizs+
         fa/g==
X-Gm-Message-State: AOJu0Yz0jHBU6cu8S1MVcOmOAe6Jz+KVNlkbc1D+baGHYcFIvA2NtZ4X
	EgvWs1DBfBAZXoqLUfW/AxG7WsjyI349auwGwSRY5FbilXyNihLrMN4mOafcHAvjThRuxQo6D+i
	N5lmdTdcIoAHkH+daPE6uRG7mzk0=
X-Google-Smtp-Source: AGHT+IEPOmirDPl45GOMWkEq51i8Q5H9oMfQnBFk+82zW6DaOJXOu2PXxiZqxAh/q7kBoJeR2eLl6RoyaY3T72ebIZQ=
X-Received: by 2002:a05:6512:31d2:b0:535:6baa:8c5d with SMTP id
 2adb3069b0e04-53870497a75mr5459982e87.20.1727363583821; Thu, 26 Sep 2024
 08:13:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240926091731.2008047-1-claus.stovgaard@gmail.com>
 <CANNYZj-sjrT+a0aWfraw0OZDx-J5wTznYTnZwS9=hAPW_ZLoxQ@mail.gmail.com> <1499318433b026e195265907f2b39987bf0c0fcc.camel@gmail.com>
In-Reply-To: <1499318433b026e195265907f2b39987bf0c0fcc.camel@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Sep 2024 17:12:52 +0200
Message-ID: <CANNYZj_vu2A9WOObG9ZG2P7O-=h9tnZaJ19+d6F5qDW0g9UJtg@mail.gmail.com>
Subject: Re: [OE-core] [master][scarthgap][PATCH] lib/oe/package-manager:
 optimize install_complementary
To: claus.stovgaard@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Sep 2024 15:13:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204991

Hello,

the headline should be 'return early from install_complementary if
glob is either None or an empty string'.

I prefer a shorter condition.

Alex

On Thu, 26 Sept 2024 at 17:01, <claus.stovgaard@gmail.com> wrote:
>
> Hi Alex
>
> Would a better headline be "don't handle empty glob"
>
>
> Also a small question.
>
> Looking at the getVar code - It seems that it can return None in some
> specific situations.
>
> So it might be more clear to do
>
> if globs is None or globs == "":
>     return
>
> The optimizing part is that the install_complementary normally does.
>
>
> if globs is None:
>     globs = ""
>
> if globs is None:
>     return
>
>
> do work, where if glob is empty string, it does not matter.
> (Involve creating installed_pkgs file, and process it with oe-pkgdata-
> util but with empty glob, so it will never return anything, just spend
> time on each line in the file, and create a empty list of packages,
> where it will call install of those)
>
>
> So the change optimize by removing the work on an empty string.
>
> What is your take.
>
> Do you like "don't handle empty glob" as headline, and what do you
> prefer
>
> if globs is None or globs == "":
>     return
>
> vs
>
> if not globs:
>     return
>
>
> /Claus
>
>
> On Thu, 2024-09-26 at 11:51 +0200, Alexander Kanavin wrote:
> > 'optimize install_complementary' really doesn't match what the commit
> > contains, please be more specific.
> >
> > Alex
> >
> > On Thu, 26 Sept 2024 at 11:17, Claus Stovgaard via
> > lists.openembedded.org
> > <claus.stovgaard=gmail.com@lists.openembedded.org> wrote:
> > >
> > > We are rewriting the globs variable, so it can't be None, but
> > > rather a
> > > string. E.g. the lines above.
> > >
> > > if globs is None:
> > >     globs = self.d.getVar('IMAGE_INSTALL_COMPLEMENTARY')
> > >
> > > As globs is now a string, we need to test for empty string instead
> > > of
> > > compare with None.
> > >
> > > Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> > > ---
> > >  meta/lib/oe/package_manager/__init__.py | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/meta/lib/oe/package_manager/__init__.py
> > > b/meta/lib/oe/package_manager/__init__.py
> > > index d3b2317894..1d923c436e 100644
> > > --- a/meta/lib/oe/package_manager/__init__.py
> > > +++ b/meta/lib/oe/package_manager/__init__.py
> > > @@ -365,7 +365,7 @@ class PackageManager(object,
> > > metaclass=ABCMeta):
> > >                  for complementary_linguas in
> > > (self.d.getVar('IMAGE_LINGUAS_COMPLEMENTARY') or "").split():
> > >                      globs += (" " + complementary_linguas) % lang
> > >
> > > -        if globs is None:
> > > +        if not globs:
> > >              return
> > >
> > >          # we need to write the list of installed packages to a
> > > file because the
> > > --
> > > 2.45.2
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#204970):
> > > https://lists.openembedded.org/g/openembedded-core/message/204970
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/108664320/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > >
>

