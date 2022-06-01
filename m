Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C8CC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Jun 2022 09:43:25 +0000 (UTC)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by mx.groups.io with SMTP id smtpd.web12.5489.1654076603584425516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 02:43:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=JTvdLnkH;
 spf=pass (domain: gmail.com, ip: 209.85.167.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f42.google.com with SMTP id s6so1763692lfo.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Jun 2022 02:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=17U4mMSXNmMvfKJmvLlupV3owgocHODfbIYZeMEOJvg=;
        b=JTvdLnkHc3js9o1GjL1iZyLB3fOzCDPgCVWd8bbDREKkP/VLdPlNalHlVm1kYftwU2
         0Vwk12/QfTUhrnEmRuiR7mhz8YgcVznSuvAK4B0zrkFkp/f9TbYBncXD6Ed/kF8bdbrO
         eWx0W4xsLphXFdTuu4SnTLc85bEi79Q4wEvLAqKm/ufE8Sz4y7MyCQ00dEZx11z5OsVK
         j6JuwWGMcPIS2VcuRFpfJNnABlbPRVG6YrF6OSG8K/ZshI2oplGYVFBqoxj1qpqtsFDl
         26nQuuelPueke1LZ5OyVJy8+g1aaIJETQYgoNT6Ko7JopXAup3ec6HsCceQj2AchwXuy
         6OGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=17U4mMSXNmMvfKJmvLlupV3owgocHODfbIYZeMEOJvg=;
        b=dXSdgLwwxGkIHy3EUHYPR3DS5Lb7eCGQXQf4uMeqAfG8OCfXtvTYv4tFmZB/z5Sei1
         KWTVYPjNf6cn2KrytxiIcJNigm64SnF1kWoXUYNL/1PU89MmfDQsGgJSHGSa/ShFMsDi
         EUe7nD+bSLuRrXJrgLiR6aBrs0NzPiQ8AK4D5MSYkWN5nmSL0Y+UM05AyyU0jfCqTUZV
         uca6Ib4pg8JKWrdhrJ7JQJdYuTKdMx010qTCTKpRG4G1Kgclf1GqCidy7tGXVYT2ZadZ
         3phoFNqViwpuCGO3YjFEh3AdglJQ8SeCDBZqXxt4bTshKJNyr96FXU+xntZJXfFln8R6
         g8AQ==
X-Gm-Message-State: AOAM530Sq0BPj45YXwRVxcTQrH1FrBvY7khUxEzxqxBtug/6MmMTlNm4
	D8v2A10yxA+iPgKDo99d5oWipM/zpD3bcPUFvWM=
X-Google-Smtp-Source: 
 ABdhPJy+EX8qlpfS/cO4bmR0F6vnarlFAEiK5pDUmIjuEwhurP4TaAiItT5/CgokEHWCoCLytcrms6nI/lUMab3Gh/g=
X-Received: by 2002:a05:6512:e93:b0:478:70ed:6dfb with SMTP id
 bi19-20020a0565120e9300b0047870ed6dfbmr32514307lfb.358.1654076601379; Wed, 01
 Jun 2022 02:43:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220531213206.7119-1-marcel@ziswiler.com>
 <20220531213206.7119-2-marcel@ziswiler.com>
 <CANNYZj8xMEOqAPXBuP4oPonqDsJWUK8G6ExRwmT=7zkTQJp1rg@mail.gmail.com>
 <ab46486dd45aaedcfd1d00817e403572ef0b64d9.camel@ziswiler.com>
 <CANNYZj8QZH-PyopuyQ8oo8mL7K96Jh=3-659zL=B+LvT8HWAug@mail.gmail.com>
 <b448e78d04ef6dda6cfb2b974b5b5b7f8b7c3981.camel@ziswiler.com>
In-Reply-To: <b448e78d04ef6dda6cfb2b974b5b5b7f8b7c3981.camel@ziswiler.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 1 Jun 2022 11:43:09 +0200
Message-ID: 
 <CANNYZj_+wqbxXbyQ17a=eZJKhq9hjzpXMCO019iAwNXgvs5RBw@mail.gmail.com>
Subject: Re: [oe-core][PATCH v3 2/2] libavtp: add recipe to be able to use aaf
 config for alsa-plugins
To: Marcel Ziswiler <marcel@ziswiler.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Peter Bergin <peter@berginkonsult.se>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Jun 2022 09:43:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166369

I'm not sure what the dilemma is, inspecting the repo shows that
there's a standard 0.2.0 tag pointing to a commit in the master
branch. You can look at pretty much any other recipe fetching from
git.
https://github.com/Avnu/libavtp/tags

Alex

On Wed, 1 Jun 2022 at 10:34, Marcel Ziswiler <marcel@ziswiler.com> wrote:
>
> On Wed, 2022-06-01 at 10:22 +0200, Alexander Kanavin wrote:
> > As long as the dependency is optional and controlled via PACKAGECONFIG
> > and off by default, the recipe does not have to be in core, and we
> > have plenty of examples of similar arrangements.
>
> Understood and agreed. Let me move it.
>
> Still waiting on the resolution of the git hash tag vs. PV download dilemma though...
>
> Thanks!
>
> > Alex
>
> Cheers
>
> Marcel
>
> > On Wed, 1 Jun 2022 at 10:05, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> > >
> > > On Wed, 2022-06-01 at 09:30 +0200, Alexander Kanavin wrote:
> > > > This should go to meta-oe I think. Does it have to be in core, and if so why?
> > >
> > > Good question. However, alsa-plugins (and gstreamer1.0-plugins-bad for that matter) also live there and may
> > > depend on it.
> > >
> > > > Alex
> > >
> > > Cheers
> > >
> > > Marcel
> > >
> > > > On Tue, 31 May 2022 at 23:32, Marcel Ziswiler <marcel@ziswiler.com> wrote:
> > > > >
> > > > > From: Peter Bergin <peter@berginkonsult.se>
> > > > >
> > > > > In order to enable configuration option aaf (AVTP Audio Format)
> > > > > used for AVB the library libavtp is a dependency but no recipe for
> > > > > this library was present. aaf support for alsa-plugins was
> > > > > introduced in ddf5421331180bc45697511b44cdd4a4e6dda6ff.
> > > > >
> > > > > Signed-off-by: Peter Bergin <peter@berginkonsult.se>
> > > > > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > > > >
> > > > > ---
> > > > > Resurrect from mailing list [1] as this is still not upstream.
> > > > > End-to-end tested on Verdin iMX8M Plus.
> > > > > Will talk about it at the Embedded World Conference in the TSN & Linux
> > > > > track next month [2].
> > > > >
> > > > > [1] https://lore.kernel.org/all/20210604090216.553285-1-peter@berginkonsult.se/
> > > > > [2] https://events.weka-fachmedien.de/embedded-world-conference/program/
> > > > >
> > > > > Changes in v3:
> > > > > - Rename recipe to officially released PV of 0.2.0.
> > > > > - Drop PROVIDES of avtp which just works around alsa-plugins refering to
> > > > >   it as such instead of libavtp. Will update PACKAGECONFIG in
> > > > >   alsa-plugins instead.
> > > > >
> > > > > Changes in v2:
> > > > > - Updated SRC_URI specifying mandatory protocol as https.
> > > > > - Updated SRCREV to latest.
> > > > >
> > > > >  meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb | 14 ++++++++++++++
> > > > >  1 file changed, 14 insertions(+)
> > > > >  create mode 100644 meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > > > >
> > > > > diff --git a/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb b/meta/recipes-
> > > > > multimedia/libavtp/libavtp_0.2.0.bb
> > > > > new file mode 100644
> > > > > index 0000000000..563debde3c
> > > > > --- /dev/null
> > > > > +++ b/meta/recipes-multimedia/libavtp/libavtp_0.2.0.bb
> > > > > @@ -0,0 +1,14 @@
> > > > > +DESCRIPTION = "Open source implementation of Audio Video Transport Protocol (AVTP) \
> > > > > +               specified in IEEE 1722-2016 spec."
> > > > > +HOMEPAGE = "https://github.com/Avnu/libavtp"
> > > > > +LICENSE = "BSD-3-Clause"
> > > > > +LIC_FILES_CHKSUM = "file://LICENSE;md5=7fcb4331e23e45e171cd5693c1ff7d3e"
> > > > > +
> > > > > +SRC_URI = "git://github.com/Avnu/libavtp.git;branch=v${PV};protocol=https;nobranch=1"
> > > > > +SRCREV = "3599a5bf2d18fc3ae89b64f208d8380e6ee3a866"
> > > > > +
> > > > > +S = "${WORKDIR}/git"
> > > > > +
> > > > > +inherit meson pkgconfig
> > > > > +
> > > > > +EXTRA_OEMESON = "-Dtests=disabled"
> > > > > --
> > > > > 2.36.1
> > > > >
> > > > >
> > > > > -=-=-=-=-=-=-=-=-=-=-=-
> > > > > Links: You receive all messages sent to this group.
> > > > > View/Reply Online (#166338): https://lists.openembedded.org/g/openembedded-core/message/166338
> > > > > Mute This Topic: https://lists.openembedded.org/mt/91462033/1686489
> > > > > Group Owner: openembedded-core+owner@lists.openembedded.org
> > > > > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> > > > > -=-=-=-=-=-=-=-=-=-=-=-

