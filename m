Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9287CC433FE
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 17:47:25 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 by mx.groups.io with SMTP id smtpd.web09.208.1664560045039669257
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:47:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=FI4JZuZB;
 spf=pass (domain: gmail.com, ip: 209.85.167.170,
 mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f170.google.com with SMTP id w13so5451097oiw.8
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 10:47:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=PXdXm0c48TStb/u6G/n/hEgFOIP2EhfbQ1fc0YZwd6A=;
        b=FI4JZuZB94XENTVAMLJFIDJP28twTPGsl9VvQQIxT5W9HYvwyJvOs5pDujmLRrmYTR
         u0gz98QALFNicfMtNhdcDZ3XyYSZufbT1Z5kqjcr/rGJojuGQGSjxMyx49DphNh0y1cZ
         PEkAonxEfLnUeeJIZi36Gc029ZsweBbduQtFIQsP+HGRA2jj98BUAiVzkeZPkoyN90Mh
         ldUoXNzWF4sUK2StkAnk7ZjnhiXHjcM2OZs48/EO1p44qphADFBM3WH2CJBJ8cc+0jzB
         RB5cs4LOFyeQP84+Vef53ffFE1M/rfIlXS/qvoa9ZajivcPxN04uErWOjSr+xxMvJ35n
         3Y1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=PXdXm0c48TStb/u6G/n/hEgFOIP2EhfbQ1fc0YZwd6A=;
        b=TmuBUqwq3D8qkqCyU/tzwdi3vaIjVByztWDYZmN/6HQ70iiX6jIJQO8FvVRQaW8JtR
         h9PYELJMuvsa5w89E02NpaxAeMSzGOwj1JEfkMyw6YaC03Ci/baozjIt8IG/VfSsng+Z
         5AS00+KZ0xKRHD0Y04PQAsYAJpLOHAIlxnEeVmvWgWuNnwJXWOtcg20sFHlgTvQvk/9b
         Kp0/xQGWhzf+zxg2q5gs9H+tTrDmkyf3x4+HrNoipp1z/5RBbNP8doPrMsCLibmGRCG5
         Gdx0REyMMg7+SOmkd3cHaPgDk1lwacu2PuZuFuwijwdCiS2OYXGFeo7nv5RbNo7INVil
         /YTw==
X-Gm-Message-State: ACrzQf0MbIbxAgygUr6BmHCYkP512r1ZSrO2iEVCODkEq3wzrHHVV1gl
	OUHmpgDA3kZufTJZW4WLKIGS8u/S3TiN6w5J154=
X-Google-Smtp-Source: 
 AMsMyM6YDcFgqUTtnA4tgocWxle+W2vlbthtj2glyBweTEmK8caEhKWdx3xL6WdyU92oZAgetF7WeSB6aLsk8Af0y3Y=
X-Received: by 2002:aca:ad8f:0:b0:350:8c87:c5be with SMTP id
 w137-20020acaad8f000000b003508c87c5bemr9539532oie.55.1664560044307; Fri, 30
 Sep 2022 10:47:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220930041614.2704304-1-raj.khem@gmail.com>
 <C9A0CBAD-5373-4F4C-BB73-0AD10A2DF000@arm.com>
 <042F0314-BF16-49A5-AD68-81DFD17739E6@arm.com>
 <CAMKF1srZEorOx-hPiD1zZx1DMiJdZbHgknub04hfyfRFzEhNcg@mail.gmail.com>
 <EA0EFA99-9A83-4699-9D0D-AD5279C58B81@arm.com>
 <CAMKF1sqwQcT-vpk5Ycydd8BCk3OCmPP-zCKZ-MwRr0G+XPHHNA@mail.gmail.com>
 <01558808-3100-4CFA-98DB-244F487435D4@arm.com>
 <CAMKF1sp=ujH14XbTybycQkJWaL93OMfm0dS6FvM_XR+K71EQaw@mail.gmail.com>
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sp1oqMEXLvXPJhquoFjuDrhc-rtEN5-b05b_FVtYo9w=Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 30 Sep 2022 10:46:58 -0700
Message-ID: 
 <CAMKF1spSdO680G-gsNe5501L+f5CxcUYt-8eayt8-SwPkKcC1w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] openssl: Add missing perl module runtime
 dependencies for ptests
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 17:47:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171232

On Fri, Sep 30, 2022 at 10:10 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Fri, Sep 30, 2022 at 10:08 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Fri, Sep 30, 2022 at 10:01 AM Ross Burton <Ross.Burton@arm.com> wrot=
e:
> > >
> > >
> > > > On 30 Sep 2022, at 17:42, Khem Raj <raj.khem@gmail.com> wrote:
> > > > > Good point I will check in think it worked fine with glibc but no=
t with musl based images I see that Perl-modules is fully empty in packages=
-split area so soMething does not add up
> > > >
> > > > It will be empty as it=E2=80=99s a metapackage, but it should have =
lots of rrecommends.
> > > >
> > > > Right that was the point the folder should not have been empty it s=
hould have had those rdepends control files
> > >
> > >
> > > My perl-modules pkgdata built with musl:
> > >
> > > RRECOMMENDS:perl-modules: perl-module-cpan perl-module-unicore perl-m=
odule-b perl-module-compress-raw-bzip2 perl-module-compress-raw-zlib perl-m=
odule-cwd perl-module-data-dumper perl-module-devel-peek perl-module-digest=
-md5 perl-module-digest-sha perl-module-encode-byte perl-module-encode-cn [=
=E2=80=A6]
> > >
> > > Can you retest?  Unless you=E2=80=99re running in a no-recommends bui=
ld I can=E2=80=99t see how this can be.
> > >
> > > Arguably, perl-modules should depends on the packages, otherwise it t=
otally breaks in no-recommends environments.  If you install perl-modules y=
ou want the entire library, not just a fraction of it.
> >
> > are you building with opkg ?
>
> and here is my list of bad recommendations
>
> BAD_RECOMMENDATIONS +=3D "eudev-hwdb udev-hwdb libmodule-build-perl"
>

OK my RRECOMMENDS:perl-modules are fine similar to Ross, however they
does not get pulled into final image when openssl-ptest is added to
IMAGE_INSTALL

> >
> > >
> > > Ross

