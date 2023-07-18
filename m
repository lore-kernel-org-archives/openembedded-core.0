Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21441EB64DC
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 16:45:45 +0000 (UTC)
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
 by mx.groups.io with SMTP id smtpd.web11.881.1689698738693611789
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 09:45:39 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=KJa9K5ZQ;
 spf=pass (domain: gmail.com, ip: 209.85.167.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-4f954d7309fso7418935e87.1
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 09:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689698737; x=1692290737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXuWIsncRQ5LBbPKvooMpDOEHJKRVQ0U1NFObGSqhqA=;
        b=KJa9K5ZQrbULCdy+XXCHxvkrMp0PrNQ3pJkXQmwpHLjrTDdzK6WYS8CbQVK500hoBO
         WSKsQtntuELQROJXislD/puYlfPYYTf8LFak0am9oOFJDczmzkLPCoprUaxpY5a+oj0O
         r5RRez19TZ0rE/xrQOY+/6sYzJSX55CGGB+EM+mgUVbLkU57g9OvnqUSxlPfQRhMOqaP
         Iu3ZDBBGkDVRY+BjVkezVlxUuYf0UQEPaQmYrxYMWaFN3bQXrr6vJCJkCBfdwrEYyNmz
         hV7orJG40cYuNQj24co67ptK/6qrigwg9F+EtP9VY7oPY2tg6XKi/eSwIVWXdHtFmKuh
         gLuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689698737; x=1692290737;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXuWIsncRQ5LBbPKvooMpDOEHJKRVQ0U1NFObGSqhqA=;
        b=N8UAg8NcrPNM3V4m4T356YUCMpfuSjMeQodILr+E0aMXj5Sh7JIvIlygYFj5svnT1D
         +e2DQ9GDOgZQgZc/LZh0NQ1XwryRUJIjJhPSyBI3cxBxaV0U/6kGnVQHCLbtWg0IF+2k
         /kSXhwookaKYql7RmqGYzEj1wFT6NiIqnAoPw6uzeL5j7WKSrC0aWirEVldPeRYuT5x9
         x/Nm+egvr2ecPeTIav07WsVCcEzrF84NrOd0kZW/oUwQsc2hHnmDBAhpSvE+cYf3JfX7
         fklCtYVRDUzfkqeMWsecsPg3iTXQTxOcsNeMPFV9xSK6fj9oKBFoSpsMZM7CakICcLM0
         z8KA==
X-Gm-Message-State: ABy/qLZkAFo3OIeqYiEyBfNCiG6riL6DdMpJHLK3tJDOQSEqH+Q0Goo1
	SjEE2G4YsMoxohafK5wGAY+Nbz2Xk8Q1f7SBOaE=
X-Google-Smtp-Source: APBJJlE0Nv6Zl2J91PP8Vto8qc+gEibmhWTz/J7hh1TYo/S01BMgXE7xM323GDyr9p6yY2CgmhARQaXEVBIDY7EeljM=
X-Received: by 2002:a05:6512:3b13:b0:4fa:d522:a38f with SMTP id
 f19-20020a0565123b1300b004fad522a38fmr5885919lfv.26.1689698736446; Tue, 18
 Jul 2023 09:45:36 -0700 (PDT)
MIME-Version: 1.0
References: <1771AA996BA380BB.28005@lists.openembedded.org>
 <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com> <CAOSpxdZ1Z3=o=TZDubjm00V69H9cibJKuipdSkf513vBbdENJw@mail.gmail.com>
 <b4037c59-84ce-b1c0-c2dc-bd93b43889c4@windriver.com> <CAOSpxdZsy2wD3tr7SKBOxzCVBNH7nXOB=hJVjrByANaA0mQP+Q@mail.gmail.com>
In-Reply-To: <CAOSpxdZsy2wD3tr7SKBOxzCVBNH7nXOB=hJVjrByANaA0mQP+Q@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 18 Jul 2023 18:45:25 +0200
Message-ID: <CANNYZj_03UAcURGzqgVYwY7=Qx17L+TM7DNOp3ngDidJ3=MB8A@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 0/1] Cherry pick commit from master
 to update webkitgtk to 2.40.2
To: Steve Sakoman <steve@sakoman.com>
Cc: Randy MacLeod <randy.macleod@windriver.com>, Kai <kai.kang@windriver.com>, 
	Kai Kang <kai.kang@eng.windriver.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 16:45:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184551

This type of update is perhaps best suited for an lts mixin branch in
meta-lts-mixins, even if mickledore isn't LTS.

Alex

On Tue, 18 Jul 2023 at 16:37, Steve Sakoman <steve@sakoman.com> wrote:
>
> On Mon, Jul 17, 2023 at 1:20=E2=80=AFPM Randy MacLeod
> <randy.macleod@windriver.com> wrote:
> >
> > On 2023-07-17 12:09, Steve Sakoman via lists.openembedded.org wrote:
> >
> > On Sun, Jul 16, 2023 at 3:34=E2=80=AFPM Kai <kai.kang@windriver.com> wr=
ote:
> >
> > On 7/14/23 15:15, Kai Kang wrote:
> >
> > From: Kai Kang <kai.kang@windriver.com>
> >
> > Hi,
> >
> > I've discussed with webkitgtk maintainers about api compatable issues o=
n
> >
> > https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html
> >
> > WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely up=
date
> >
> > without needing to change applications. In general, we always keep the =
API and
> > ABI backwards compatible.
> >
> > Note that the current stable releases (2.40.x) introduce a new API leve=
l
> > when using GTK4, but I suppose this is not a problem because most likel=
y you
> > are still using GTK3
> >
> >
> > I suggest we apply the update in mickledore too which solves lots of
> > CVEs.
> >
> > Hi Steve,
> >
> > I have no idea why the cover-letter is not in the same thread with the
> > patch.
> >
> > So according to the reply from webkitgtk maintainer, would you like to
> > re-consider
> > to cherry-pick the commit to mickledore, please?
> >
> > Sorry, still not possible, this is a major release bump that adds
> > features and APIs.  Please see:
> >
> > https://wpewebkit.org/release/wpewebkit-2.40.0.html
> >
> > We do need to be careful but upstream is saying that:
> >
> >   "WebKitGTK 2.40.x is backwards-compatible as well and that will remai=
n true indefinitely,
> >    as long as you continue to build the same API version [2]. "
> >
> > I'd like a simple way to measure if that's true but I'm not sure one ex=
ists.
> >
> > Kai,
> >
> > Have you looked at the source diff to understand how upstream is able t=
o introduce
> > a new API yet enable building the old one?
> >
> >
> > Kai, Steve,
> >
> > Should we investigate using the flags suggested:
> >    "is still possible to build the old 1.0 API using -USE_SOUP2=3DON, o=
r the 1.1 API using -DENABLE_WPE_1_1_API=3DON. "
> >   -- https://wpewebkit.org/release/wpewebkit-2.40.0.html
>
> I'm wrangling patches for the three stable branches with releases
> every 1-2 weeks, so I really don't have the cycles to investigate
> this.
>
> > or do we really have to backport patches to 2.38.x ?
>
> A version bump of this type (with the addition of features and APIs)
> is outside the scope of allowed updates for stable branches.  As such,
> it would require TSC approval.
>
> So the two options are to either backport CVE fixes or take the issue
> to the TSC.
>
> Steve
>
> > Alexander Kanavin (1):
> >    webkitgtk: update 2.38.5 -> 2.40.2
> >
> >   meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
> >   ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
> >   ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++------=
-
> >   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
> >   ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
> >   ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.2.bb} | 15 +++++--
> >   6 files changed, 111 insertions(+), 48 deletions(-)
> >   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-Jav=
aScriptCore-CMakeLists.txt-ensure-reproduc.patch
> >   create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab352=
58a6da9b13795c9b0f7894bf4.patch
> >   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b9=
0453bc4e100dcf967243ecd98.patch
> >   rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2=
.40.2.bb} (90%)
> >
> >
> >
> >
> > --
> > Kai Kang
> > Wind River Linux
> >
> >
> >
> >
> >
> > --
> > # Randy MacLeod
> > # Wind River Linux
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184532): https://lists.openembedded.org/g/openembedde=
d-core/message/184532
> Mute This Topic: https://lists.openembedded.org/mt/100136728/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
ex.kanavin@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

