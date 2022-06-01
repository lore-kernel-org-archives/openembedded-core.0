Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7367C433EF
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 08:23:14 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web08.5010.1654071787347513019
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:23:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=phE6qvqZ;
 spf=pass (domain: gmail.com, ip: 209.85.167.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id l30so1503496lfj.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 01:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F9JwxUTmzmjUGU5OpHxqZHWZX/SxexWmZp1nMOO0uiQ=;
        b=phE6qvqZzUYNu4PKS6htAQYAGe97/J7xr+8whpodynvfLc6U5DUlH/IEUePAYlGUie
         iulTaV3j3eA/QgWRycV1GIFnbIGsPwdDHNNz31PJUbUcQvcWt/QxW+yRwS9NXYEtjFhj
         9cINkgndhiMl6ygInEaPuCxaraQ94SRMBDt5s/KIEJPOenQRowX/ez5a7JVXTgbhzNDY
         Oq890ULJ3edqSXt6917/1xUbNROLNx3hH4uGeP+DN8WJOxIzPpntP3XA+XUBHN4H3wbE
         8V78P1/DrWwXOWlm6ObzOjfepLOjM8CL2xGEzTgL/r4s6z8qZJwu0oTzeu0TRzm7husQ
         pvTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F9JwxUTmzmjUGU5OpHxqZHWZX/SxexWmZp1nMOO0uiQ=;
        b=51eTcSVi0cbeUK3fWxMJVfMIBA+ubzzlKO+xy0T0/1Be8jaSLph14rfAV2FB7Wtc+b
         +M7UguqsFPgoeJ7yKl1OCU2rr1adwF+MSei3Xd3qHsEjxCTyRmIAL+Z9Ar0xLyhUy2dR
         MEXK9qLacazBGZNOv1Ppo9j5Ul9ovdBFR5Soi+ASmyGWvTFZDltRSjyvZwZ96qsBhb/M
         dXaxZalVhoHqbTmR1FsXE+sWJJXiPuSFpQmz98IcQ+l+1NUrqHNO6Oluf6nBog+YINoB
         o7fybkBOLGCUTjeUTdGQSpfieRaYFSXHKLYFg2NGCsEgEMlkCEj4C5+M9VrsiZ+GEmsQ
         tTKw==
X-Gm-Message-State: AOAM5312Tgg9bkLJwTlq9p8MIGMk3h847LWDS+8yO9CVCCFpMK+lsOKc
	GV6zcJZwnCr7Rx4z4tZgVjIY1eJOX3Ukq4FYFOQ=
X-Google-Smtp-Source: 
 ABdhPJw6nNelzhKk6R9IDoqkcC5Sp/JUj+iQb10bodsPWhYKnKAYoXU+0wkZF8hNVyZCHNjCoryGJWaTWSQph3vRS1I=
X-Received: by 2002:a05:6512:304c:b0:478:67d5:6982 with SMTP id
 b12-20020a056512304c00b0047867d56982mr38435872lfb.380.1654071785580; Wed, 01
 Jun 2022 01:23:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
 <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
In-Reply-To: <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Jun 2022 10:22:54 +0200
Message-ID: 
 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Bergin <peter@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 08:23:14 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166364

As long as the dependency is optional and controlled via PACKAGECONFIG
and off by default, the recipe does not have to be in core, and we
have plenty of examples of similar arrangements.

Alex

On Wed, 1 Jun 2022 at 10:05, Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> On Wed, 2022-06-01 at 09:30 +0200, Alexander Kanavin wrote:
> > This should go to meta-oe I think. Does it have to be in core, and if so why?
>
> Good question. However, alsa-plugins (and gstreamer1.0-plugins-bad for that matter) also live there and may
> depend on it.
>
> > Alex
>
> Cheers
>
> Marcel
>
> > On Tue, 31 May 2022 at 23:32, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> > >
> > > From: Peter Bergin <peter@berginkonsult.se>
> > >
> > > In order to enable configuration option aaf (AVTP Audio Format)
> > > used for AVB the library libavtp is a dependency but no recipe for
> > > this library was present. aaf support for alsa-plugins was
> > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > >
> > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > >
> > > ---
> > > Resurrect from mailing list [1] as this is still not upstream.
> > > End-to-end tested on Verdin iMX8M Plus.
> > > Will talk about it at the Embedded World Conference in the TSN & Linux
> > > track next month [2].
> > >
> > > [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
> > > [2] https://events.weka-fachmedien.de/embedded-world-conference/program/
> > >
> > > Changes in v3:
> > > - Rename recipe to officially released PV of 0.2.0.
> > > - Drop PROVIDES of avtp which just works around alsa-plugins refering to
> > >   it as such instead of libavtp. Will update PACKAGECONFIG in
> > >   alsa-plugins instead.
> > >
> > > Changes in v2:
> > > - Updated SRC_URI specifying mandatory protocol as https.
> > > - Updated SRCREV to latest.
> > >
> > >  meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 ++++++++++++++
> > >  1 file changed, 14 insertions(+)
> > >  create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > >
> > > diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/recipes-
> > > multimedia/libavtp/libavtp_0.2.0.bb
> > > new file mode 100644
> > > index 0000000000..563debde3c
> > > --- /dev/null
> > > +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > > @@ -0,0 +1,14 @@
> > > +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
> > > +               specified in IEEE 1722-2016 spec."
> > > +HOMEPAGE = "https://github.com/Avnu/libavtp"
> > > +LICENSE = "BSD-3-Clause"
> > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> > > +
> > > +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=v${PV};protocol=https;nobranch=1"
> > > +SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> > > +
> > > +S = "${WORKDIR}/git"
> > > +
> > > +inherit meson pkgconfig
> > > +
> > > +EXTRA_OEMESON = "-Dtests=disabled"
> > > --
> > > 2.36.1
> > >
> > >
> > > -=-=-=-=-=-=-=-=-=-=-=-
> > > Links: You receive all messages sent to this group.
> > > View/Reply Online (#166338): https://lists.openembedded.org/g/openembedded-core/message/166338
> > > Mute This Topic: https://lists.openembedded.org/mt/91462033/1686489
> > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > -=-=-=-=-=-=-=-=-=-=-=-

