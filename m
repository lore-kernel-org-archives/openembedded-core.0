Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEAAEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 14:37:50 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web10.9428.1689691066948079954
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 07:37:47 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=kACs5Udl;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-991fe70f21bso778808666b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 07:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1689691065; x=1692283065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msCKv1VsmbSexbouidCVWOcgpl0aAzI1Z0Y5IzZdelU=;
        b=kACs5UdllDiLMyOhKfYAmeLvQGsb7srHhbTOyO3Y/Dehl8t1YTED19jUNELxXdF4VL
         DmhXGVss/TTlh35hzG+KB07FL4UvUPWkesxahAlzq0TMoOw0cmOsNnsp5YYWDOgtJ6c6
         PgIa51iUjzcJABAImALomixjiRNDdevht17xGSgoKfa/VrND083rfV7qfw94P2gC3SYH
         rfc7DnQ6dfaXrUKWs5nFWlLj2fKtFqKQHGiMdnYs1t3jYLBCUWOHBMGtZRRJSQxPzRNH
         dlClTB7P/uto/xTPO855/8hH21ojVigWEjf8Xac2SJCph7oy16geeto5a+4DRO5YdM3X
         Ln5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689691065; x=1692283065;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msCKv1VsmbSexbouidCVWOcgpl0aAzI1Z0Y5IzZdelU=;
        b=H8hZNmnD6SgOLhvzxRSjOSYPQWeXpdtZuSbWDjgOndcCwgwMLSm0vnpEFwXfLwsm9z
         xEXsFfIiYjRKJyVmb8/tvf8+3wDB1xE9kF4pjMPI1Kj/nahGEYZ9d5/USEn3UQ4HETwu
         c0KPg9uOVS3mF5lAX3wUkbzH3xCjj2ekOg6AuMdoWJZZMp7D7IwqQmcG0RH2zIwyksHr
         C2I5y3wqz7gHmi4nqSFvdvwVM8jBcW+blvMc2v6/W/P6qt2YEToh57218JAczTkirO3K
         4XyIRw7MWco5B9R42lAiDAUL7BQ52MAq08y/lwDnwIgxme4AzTnbJe1AWdb7H3zPF1TD
         jSFg==
X-Gm-Message-State: ABy/qLZIP3CXZc3eDhsCYF9X7NHoMu6cxpKRegxwg72mrdC1yzUEzyKm
	pKW0m+R6kisGaLyuIhsKHxnYUqFyH3MiEHrZIkvGpRns/N2luQS0
X-Google-Smtp-Source: APBJJlG8U+gxsxuinDcI9ot0nLKsIDGaXk0peELMTlsoPSlzyg6ixhist4MtZiNtXymkBcI+naVFo0fPlvoa53zm0s4=
X-Received: by 2002:a17:907:75e3:b0:973:d076:67ab with SMTP id
 jz3-20020a17090775e300b00973d07667abmr70063ejc.42.1689691065062; Tue, 18 Jul
 2023 07:37:45 -0700 (PDT)
MIME-Version: 1.0
References: <1771AA996BA380BB.28005@lists.openembedded.org>
 <6dc56bfa-5736-74b5-b13b-ef014a24ce9d@windriver.com> <CAOSpxdZ1Z3=o=TZDubjm00V69H9cibJKuipdSkf513vBbdENJw@mail.gmail.com>
 <b4037c59-84ce-b1c0-c2dc-bd93b43889c4@windriver.com>
In-Reply-To: <b4037c59-84ce-b1c0-c2dc-bd93b43889c4@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 18 Jul 2023 04:37:34 -1000
Message-ID: <CAOSpxdZsy2wD3tr7SKBOxzCVBNH7nXOB=hJVjrByANaA0mQP+Q@mail.gmail.com>
Subject: Re: [OE-core] [mickledore][PATCH 0/1] Cherry pick commit from master
 to update webkitgtk to 2.40.2
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: Kai <kai.kang@windriver.com>, Kai Kang <kai.kang@eng.windriver.com>, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 14:37:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184532

On Mon, Jul 17, 2023 at 1:20=E2=80=AFPM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2023-07-17 12:09, Steve Sakoman via lists.openembedded.org wrote:
>
> On Sun, Jul 16, 2023 at 3:34=E2=80=AFPM Kai <kai.kang@windriver.com> wrot=
e:
>
> On 7/14/23 15:15, Kai Kang wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> Hi,
>
> I've discussed with webkitgtk maintainers about api compatable issues on
>
> https://lists.webkit.org/pipermail/webkit-gtk/2023-March/003887.html
>
> WebKitGTK 2.38.x is backwards compatible with 2.36.x, you can safely upda=
te
>
> without needing to change applications. In general, we always keep the AP=
I and
> ABI backwards compatible.
>
> Note that the current stable releases (2.40.x) introduce a new API level
> when using GTK4, but I suppose this is not a problem because most likely =
you
> are still using GTK3
>
>
> I suggest we apply the update in mickledore too which solves lots of
> CVEs.
>
> Hi Steve,
>
> I have no idea why the cover-letter is not in the same thread with the
> patch.
>
> So according to the reply from webkitgtk maintainer, would you like to
> re-consider
> to cherry-pick the commit to mickledore, please?
>
> Sorry, still not possible, this is a major release bump that adds
> features and APIs.  Please see:
>
> https://wpewebkit.org/release/wpewebkit-2.40.0.html
>
> We do need to be careful but upstream is saying that:
>
>   "WebKitGTK 2.40.x is backwards-compatible as well and that will remain =
true indefinitely,
>    as long as you continue to build the same API version [2]. "
>
> I'd like a simple way to measure if that's true but I'm not sure one exis=
ts.
>
> Kai,
>
> Have you looked at the source diff to understand how upstream is able to =
introduce
> a new API yet enable building the old one?
>
>
> Kai, Steve,
>
> Should we investigate using the flags suggested:
>    "is still possible to build the old 1.0 API using -USE_SOUP2=3DON, or =
the 1.1 API using -DENABLE_WPE_1_1_API=3DON. "
>   -- https://wpewebkit.org/release/wpewebkit-2.40.0.html

I'm wrangling patches for the three stable branches with releases
every 1-2 weeks, so I really don't have the cycles to investigate
this.

> or do we really have to backport patches to 2.38.x ?

A version bump of this type (with the addition of features and APIs)
is outside the scope of allowed updates for stable branches.  As such,
it would require TSC approval.

So the two options are to either backport CVE fixes or take the issue
to the TSC.

Steve

> Alexander Kanavin (1):
>    webkitgtk: update 2.38.5 -> 2.40.2
>
>   meta/recipes-gnome/epiphany/epiphany_43.1.bb  |  3 ++
>   ...tCore-CMakeLists.txt-ensure-reproduc.patch | 28 +++++++++++++
>   ...44e17d258106617b0e6d783d073b188a2548.patch | 42 ++++++++++++-------
>   ...290ab4ab35258a6da9b13795c9b0f7894bf4.patch | 41 ++++++++++++++++++
>   ...bb461f040b90453bc4e100dcf967243ecd98.patch | 30 -------------
>   ...ebkitgtk_2.38.5.bb =3D> webkitgtk_2.40.2.bb} | 15 +++++--
>   6 files changed, 111 insertions(+), 48 deletions(-)
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Source-JavaS=
criptCore-CMakeLists.txt-ensure-reproduc.patch
>   create mode 100644 meta/recipes-sato/webkit/webkitgtk/4977290ab4ab35258=
a6da9b13795c9b0f7894bf4.patch
>   delete mode 100644 meta/recipes-sato/webkit/webkitgtk/d318bb461f040b904=
53bc4e100dcf967243ecd98.patch
>   rename meta/recipes-sato/webkit/{webkitgtk_2.38.5.bb =3D> webkitgtk_2.4=
0.2.bb} (90%)
>
>
>
>
> --
> Kai Kang
> Wind River Linux
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#184474): https://lists.openembedded.org/g/openembedde=
d-core/message/184474
> Mute This Topic: https://lists.openembedded.org/mt/100136728/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

