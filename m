Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 246D6C77B6E
	for <webhook@archiver.kernel.org>; Thu, 13 Apr 2023 13:26:53 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.13042.1681392404566056221
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Apr 2023 06:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=TJAYFkTF;
 spf=pass (domain: gmail.com, ip: 209.85.208.172, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id r9so1627483ljp.9
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 06:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681392403; x=1683984403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjAZ9ycGDJhfNK46h+WbkBXnkmOx+QW1HT7GlXz+jww=;
        b=TJAYFkTFzRP3e3Z6EAtMEc8MIx0cDrd4Ah7FlrWn1CH5S2PkNiGsH+Pdo8YDyNVKXE
         pdAVATqfb4OZzLz8SJ68bzrl+LSn2CopXfO17J5xlRuU1tpBDpGw4opE06mQ3n8K0L0g
         0ZiU+SCItHP5837bQuR6tytcLd2PmzSa7D6XzrLyKean/xiyTbbh31KM/PmgoMSsbQPa
         xqpq3ROBbcQhKzRV6xB1RlBCUV94pQWYpeYMLAAyCFtwQSGkTcGPOFySMJW3ELf3SG8a
         3EM/l4zyDSQUjmtL8zSkS74sK0Rp2HxLCjdr1raq2MYrZ+N1v2gwI7TfDY0SakALU+Gj
         Z4kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681392403; x=1683984403;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mjAZ9ycGDJhfNK46h+WbkBXnkmOx+QW1HT7GlXz+jww=;
        b=MhYHe7c9va0ccBVMZOXA7UU1e2eeojFgIpRtIMHhgcDkA8EE/lhKk6c8/Htt6ZzIqm
         70wHFmQTU7TyggL4W24XQe1Q77+hAj/YFXmI6E7iL4v3sdH8DE887s9Q/zuC+dmy0Df3
         ZuUE4yqIl+ewOScxQ4ubys9lNc/EolYp/JFXLGQyxB9JEdMxUoeeHusTHMdvb3UGcU3R
         5SyiHseNjpCXun5LbsGftoF+jdU+Co6IB/RPZRxGLenJY7TpcxVrW1nreN8xGtSKPQYg
         WoccTmufovTQyI6LYRqVAJBHQrTLHKjtBR03CXzXlRmrUB4/MZ0JcwYWhi0ZGbz+r080
         Agcw==
X-Gm-Message-State: AAQBX9d/F7UtJbWoEsBd+pQeZpNSD2+4e7sPPOupgB9VXeM1pxDmhiKL
	n5PHT8b+pt9aOShs2bx8FfnFfLe/FLnFiS2HjTo=
X-Google-Smtp-Source: AKy350bl3n98PvfpemOwvAADCWtAg5Pe4mTWJlOkoCEhbkNWzoI7GAp0r7bvopFE3sAj3vVW1yNp4HNB0NVACfKM79g=
X-Received: by 2002:a2e:8e86:0:b0:2a7:6e18:d607 with SMTP id
 z6-20020a2e8e86000000b002a76e18d607mr750376ljk.7.1681392402709; Thu, 13 Apr
 2023 06:26:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230413055432.1977413-1-raj.khem@gmail.com> <20230413055432.1977413-2-raj.khem@gmail.com>
 <033c81e5bd6048afcd3bf8fbee335dc52a60d429.camel@linuxfoundation.org> <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
In-Reply-To: <CAMKF1soWt0bC6S+yAwHnWeTWUQwA7P+Pp42RzE-_LVc-_nY_rg@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 13 Apr 2023 15:26:31 +0200
Message-ID: <CANNYZj9SzS5Xqs5SUFJ9asquiRGSmWYZNg_Wfr8jUX08T9Ndmg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] gawk: Fix ptests on musl
To: Khem Raj <raj.khem@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Apr 2023 13:26:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179977

I tend to agree with RP, this needs to be discussed with upstream
first. We should avoid patches which are both conditional and
non-upstreamable. If gawk upstream doesn't want their tests to be
compatible with musl, then maybe neither should we.

Alex

On Thu, 13 Apr 2023 at 15:17, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 13, 2023 at 3:14=E2=80=AFAM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > On Wed, 2023-04-12 at 22:54 -0700, Khem Raj wrote:
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > ---
> > >  ...0001-Provide-fixes-for-tests-on-musl.patch | 73 +++++++++++++++++=
++
> > >  meta/recipes-extended/gawk/gawk_5.2.1.bb      |  7 +-
> > >  2 files changed, 77 insertions(+), 3 deletions(-)
> > >  create mode 100644 meta/recipes-extended/gawk/gawk/0001-Provide-fixe=
s-for-tests-on-musl.patch
> > >
> > > diff --git a/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-t=
ests-on-musl.patch b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for=
-tests-on-musl.patch
> > > new file mode 100644
> > > index 0000000000..4ff2466c0e
> > > --- /dev/null
> > > +++ b/meta/recipes-extended/gawk/gawk/0001-Provide-fixes-for-tests-on=
-musl.patch
> > > @@ -0,0 +1,73 @@
> > > +From 95bcf4397b6f727208f3c627b7d00dacec406d02 Mon Sep 17 00:00:00 20=
01
> > > +From: Khem Raj <raj.khem@gmail.com>
> > > +Date: Wed, 12 Apr 2023 21:57:18 -0700
> > > +Subject: [PATCH] Provide fixes for tests on musl
> > > +
> > > +Fixes rebt8b1 and regx8bit
> > > +Disable clos1way6 [1]
> > > +
> > > +Disable commas and backsmalls1, they do not work
> > > +with musl-locales somehow even though we do isntall
> > > +en_US.UTF-8 on target
> > > +
> > > +[1] https://lists.gnu.org/archive/html/bug-gawk/2021-02/msg00005.htm=
l
> > > +
> > > +Upstream-Status: Inappropriate [musl-specific]
> > > +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > +---
> > > + test/Maketests | 11 ++++-------
> > > +
> >
> > Carrying a patch like this makes me a bit nervous as:
> >
> > a) it is only applied for musl so it makes recipe upgrade testing a
> > nightmare
> >
> > b) there doesn't appear to be any path to upstream it, we'd just have
> > to carry it indefinitely.
> >
> > c) the reasons for the failure don't seem to be understood.
>
> reasons are clear,  these tests need full locale support which we do
> not have with musl.
>
> >
> > Is there something we can do to avoid having to carry this
> > indefinitely?
> >
> > Out of interest did alpine do anything for this?
>
> they have patches.
>
> >
> > Cheers,
> >
> > Richard
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#179976): https://lists.openembedded.org/g/openembedde=
d-core/message/179976
> Mute This Topic: https://lists.openembedded.org/mt/98235523/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

