Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66159C83F11
	for <webhook@archiver.kernel.org>; Mon, 28 Aug 2023 13:06:29 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.13022.1693227986103626651
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Aug 2023 06:06:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=lVkx/HKK;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-500bb392ab7so1137171e87.1
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693227984; x=1693832784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IN29K0OBJEIXf8+PfTf0+68oxUV/+PCgK7+TkNQDI4=;
        b=lVkx/HKKycHGyaVFDCn+OjWN60NKR3rCnOjbs71DCaJgiAKfBbkDQYDmaXYYCC/O9E
         uZ8p/FcOhy8TReys5lJTND97IpdE8jaKF8MzGoQWT8A1ut3RwGDfv2Oq2uL44j+l6XAm
         dYKFC6XUHs1KI5obyfuPcazFou9ZiyEZQNNPzaSw9pbC+lfL/s1yahxms5CJQjNGwMcT
         zj+GGDq5hsWvrgYSmSbEwi6l+617yRRfVX90cWgnkzfLgcK0FxCTURLH/k7OM8whw28M
         VhfAhgr8Cf2PLcKioD+wq4THLUjg3XRj5oQykcCyDNRpWYgWFprOg6I+Ct9VY1uIftFi
         780g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693227984; x=1693832784;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0IN29K0OBJEIXf8+PfTf0+68oxUV/+PCgK7+TkNQDI4=;
        b=CuobJuR3nbn+oKO7D4vPxY471rnahlDY05rEesryU6M5db8ABZt0/6M1fro6htrX6x
         BLnZS+cjNg2QfCBK9Iek2Fi0ApJYMjKTn/BaubAz5d12XygqexDQIKmxQYMSkv1H+u7R
         G7qEElTf/WsuKyRssR1vYvUlEwYws5aUq9uFyebXJ167wdbrlJQ5rkhMiR4GTtWbxrlp
         UELGyRKhZMgfFgti2GjCJcCgBTHiGC6sYB8BhGEwqjl6ok13lAafDLVzyNISIyqw/BB0
         27i3Lx9d9BywUO07d0sRQTBo0l7HPf9uSS98YYahlqa4ZvxNE8zirqBWj7dhKH447NeC
         ygAw==
X-Gm-Message-State: AOJu0Yw95llN0Mw8umcRD3JRMHN3irvTshYlui+ayZElTOa1josWA8c1
	qAn5mJQd7HccfC2PxNGTbIQU1WjmHEkW/DMh+8o=
X-Google-Smtp-Source: AGHT+IEdy5u7c20h//7TWY90qyUiM9TanK3mNc3hgmSVYFltLvPXDpCFgpR63QoV36C4K27Konpof6snQXQ04EZ8344=
X-Received: by 2002:ac2:5605:0:b0:500:9214:b308 with SMTP id
 v5-20020ac25605000000b005009214b308mr11493880lfd.65.1693227984015; Mon, 28
 Aug 2023 06:06:24 -0700 (PDT)
MIME-Version: 1.0
References: <20230828124834.376779-1-martin@geanix.com> <20230828124834.376779-3-martin@geanix.com>
 <CANNYZj-iEBSOzp5_CbfhPuvhvaJ9KkdwZiLrLgPL=jaLzBJt8w@mail.gmail.com> <ea8e63109ee5a05de8e9397eca7165b1c44b9395.camel@geanix.com>
In-Reply-To: <ea8e63109ee5a05de8e9397eca7165b1c44b9395.camel@geanix.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 28 Aug 2023 15:06:12 +0200
Message-ID: <CANNYZj9v3HKqRQ7+AgCNqU24K9rBG8jeUendUrL_iwpZZFmdZw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 3/5] ninja: build modified version with GNU
 Make jobserver support
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <martin@geanix.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Aug 2023 13:06:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186830

If previous PRs have stalled, it may help to open a fresh one, which
you can drive yourself. You can reuse and rebase previous patches by
others as needed.

Alex

On Mon, 28 Aug 2023 at 14:59, Martin Hundeb=C3=B8ll <martin@geanix.com> wro=
te:
>
> On Mon, 2023-08-28 at 14:57 +0200, Alexander Kanavin wrote:
> > Thanks, make/ninja jobserver is something we've been talking about
> > since forever, and it's great to see actual code.
> >
> > I suppose the biggest obstacle is that ninja support hasn't yet
> > landed
> > upstream, and I'd like to ensure it does. Also, a link to the pull
> > request is missing? :)
>
> Indeed, upstream seems to ignore the pull request :(
>
> Link references are like attachments: easy to forget... Here it is:
> https://github.com/ninja-build/ninja/issues/1139
>
> // Martin
>
> > On Mon, 28 Aug 2023 at 14:48, Martin Hundeb?ll <martin@geanix.com>
> > wrote:
> > >
> > > Ninja doesn't (yet) support the GNU Make jobserver out of the box,
> > > but
> > > there is a pull request adding that support[1]. Switch the SRC_URI
> > > and
> > > SRCREV to point at the source of that pull request, to make ninja
> > > play
> > > nicely together with the recently added jobserver class.
> > >
> > > Signed-off-by: Martin Hundeb=C3=B8ll <martin@geanix.com>
> > > ---
> > >  .../ninja/{ninja_1.11.1.bb =3D> ninja_1.12.0.bb}                | 4
> > > ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >  rename meta/recipes-devtools/ninja/{ninja_1.11.1.bb =3D>
> > > ninja_1.12.0.bb} (84%)
> > >
> > > diff --git a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > > b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > > similarity index 84%
> > > rename from meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > > rename to meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > > index 8e297ec4d4..9abdd40a92 100644
> > > --- a/meta/recipes-devtools/ninja/ninja_1.11.1.bb
> > > +++ b/meta/recipes-devtools/ninja/ninja_1.12.0.bb
> > > @@ -6,9 +6,9 @@ LIC_FILES_CHKSUM =3D
> > > "file://COPYING;md5=3Da81586a64ad4e476c791cda7e2f2c52e"
> > >
> > >  DEPENDS =3D "re2c-native ninja-native"
> > >
> > > -SRCREV =3D "a524bf3f6bacd1b4ad85d719eed2737d8562f27a"
> > > +SRCREV =3D "c9e21dbbc4c746ba397c0f9bec5f65c99f783c08"
> > >
> > > -SRC_URI =3D "git://github.com/ninja-
> > > build/ninja.git;branch=3Drelease;protocol=3Dhttps"
> > > +SRC_URI =3D "git://github.com/stefanb2/ninja.git;branch=3Dtopic-issu=
e-
> > > 1139-part-3-jobserver-fifo;protocol=3Dhttps"
> > >  UPSTREAM_CHECK_GITTAGREGEX =3D "v(?P<pver>.*)"
> > >
> > >  S =3D "${WORKDIR}/git"
> > > --
> > > 2.41.0
> > >
> > >
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#186825):
> > > https://lists.openembedded.org/g/openembedded-core/message/186825
> > > Mute This Topic:
> > > https://lists.openembedded.org/mt/101009093/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe:
> > > https://lists.openembedded.org/g/openembedded-core/unsub [
> > > alex.kanavin@gmail.com]
> > > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > >
>

