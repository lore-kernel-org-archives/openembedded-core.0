Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6B12C00140
	for <webhook@archiver.kernel.org>; Tue,  2 Aug 2022 14:31:52 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com
 [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web09.6838.1659450705788940775
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:31:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Vzu37A61;
 spf=pass (domain: gmail.com, ip: 209.85.167.49,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f49.google.com with SMTP id y11so22192997lfs.6
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Aug 2022 07:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=66wMOy9ryGoAwaO5ob+v/HeXb8Pz4I1CT/HXprMY1IY=;
        b=Vzu37A61g0secydTsxPVnWi6M40ctqvxgmH42l5wvyLTmD4BdKZXEE0mAXve0Ux0qt
         D+WFrbQjZl3UNq750HuhcHFPq81vjS4JoFU823h4B6ofWkPnlEy3cBvyG2J5hcLhj2uV
         u7BeJgptmdansCXPURH2pY6b/CLbdNLU/BXArRhqXbuWZL0Lcixas4nmrzsQBlMUSjFF
         o49XPLoNZSLaOJ1I8pzsaqS1PNmD78+Nw0ZRpG7MossDasPIozGp0z7jZPAVENh1vbVB
         1AbdcAHjl1+VRGCuMpwy/T5DukeZuqupbbWdDwYvdoSYX4e9zISEa5ldxB4W+i6ZYOA7
         Gn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=66wMOy9ryGoAwaO5ob+v/HeXb8Pz4I1CT/HXprMY1IY=;
        b=D6FPG5TRDm8jYewqwpMXuK5+XDuv1M+JphFJJo4Vfr8sZ8Ai6wsCRog4C/G2vwm6s5
         rAqS7mZD3+Bz8J9dMoXb69C+bMlvf6yNpIZs9jNtwZ0+OuX3WICZSH2220fNGyKexWIh
         da9Jldl94qXt2kYAEH7v7s8rldFeHD8wwVM4zecbD+Q7oGrOUYxLQOf/8dse43qDFETG
         YqTwXlkuW2SdlSCN5zNqPPbZNN7q/pnfHXt0wHUqDHc6vOy9sBbHCJnIF3+vdhh3PPcu
         L4zIT1IdkYRV3Jmmn+6gAtgBQcxGYR+UBzHNcMMM8aRmd9RLoBw0eRl0hwgzQwK03vhL
         IbeQ==
X-Gm-Message-State: ACgBeo0zyV/nuj2sWXFR1dcwSEv/TxUqFD/8PK7tHNUfqmlR0lyMiE5G
	Mu/Y3BwkVQFVRNMBYh9ELLsoQH45PAdjhGRUUqQ=
X-Google-Smtp-Source: 
 AGRyM1ukCMMrkG2TSs4LaxBhOVyo24VJeRSKfzwtUVWQJLiuELs07td6jbvUhMbXxZfpVs83vLgyWPSmj/Q2HgSrOFA=
X-Received: by 2002:a05:6512:3403:b0:481:60ae:7ebc with SMTP id
 i3-20020a056512340300b0048160ae7ebcmr7969384lfr.358.1659450703532; Tue, 02
 Aug 2022 07:31:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220729141049.835733-1-alex@linutronix.de>
 <20220729141049.835733-5-alex@linutronix.de>
 <20220802151248.3183f672@booty>
In-Reply-To: <20220802151248.3183f672@booty>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 2 Aug 2022 16:31:31 +0200
Message-ID: 
 <CANNYZj_S4LaRCSUHvbqSFkp__OL9Gsuijr6DVsA6HKYxUWtUWA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] scripts/oe-setup-layers: add a script that
 restores the layer configuration from a json file
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Aug 2022 14:31:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168788

That's python 3.6 giving an error about a 3.7 and later parameter. I
sent an adjusted patchset.

Alex

On Tue, 2 Aug 2022 at 15:12, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Alex,
>
> On Fri, 29 Jul 2022 16:10:48 +0200
> "Alexander Kanavin" <alex.kanavin@gmail.com> wrote:
>
> > This script can be used directly from poky, or can be copied directly into a
> > layer or any other repository - it is self-suffucient and requires only python3
> > and git on the host where it will run. It is also copied by the bitbake-layers
> > layers-setup plugin together with the json, unless requested otherwise.
> >
> > 1. How to restore the layers from the saved configuration:
> >
> > a) Clone the bootstrap layer or some other repository to obtain the json config and the setup script that can use it.
> > (use 'bitbake-layers create-layer-setup' from the previous commit to create them)
> >
> > b) Running with default options:
> > (note: this will work to update an existing checkout as well)
> >
> > alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers
> > Note: not checking out source meta-alex, use --force-bootstraplayer-checkout to override.
> >
> > Setting up source meta-intel, revision 15.0-hardknott-3.3-310-g0a96edae, branch master
> > Running 'git init -q /srv/work/alex/my-build/meta-intel'
> > Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/meta-intel' in /srv/work/alex/my-build/meta-intel
> > Running 'git fetch -q origin || true' in /srv/work/alex/my-build/meta-intel
> > Running 'git checkout -q 0a96edae609a3f48befac36af82cf1eed6786b4a' in /srv/work/alex/my-build/meta-intel
> >
> > Setting up source poky, revision 4.1_M1-372-g55483d28f2, branch akanavin/setup-layers
> > Running 'git init -q /srv/work/alex/my-build/poky'
> > Running 'git remote remove origin > /dev/null 2>&1; git remote add origin git://git.yoctoproject.org/poky' in /srv/work/alex/my-build/poky
> > Running 'git fetch -q origin || true' in /srv/work/alex/my-build/poky
> > Running 'git remote remove poky-contrib > /dev/null 2>&1; git remote add poky-contrib ssh://git@push.yoctoproject.org/poky-contrib' in /srv/work/alex/my-build/poky
> > Running 'git fetch -q poky-contrib || true' in /srv/work/alex/my-build/poky
> > Running 'git checkout -q 11db0390b02acac1324e0f827beb0e2e3d0d1d63' in /srv/work/alex/my-build/poky
> >
> > Available build configurations:
> > /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gadget
> > /srv/work/alex/my-build/meta-alex/conf/templates/configuration-gizmo
> > /srv/work/alex/my-build/poky/meta-poky/conf
> >
> > You can set up a build with:
> > TEMPLATECONF=one/of/the/above . /srv/work/alex/my-build/poky/oe-init-build-env
> >
> > 2. Command line options:
> >
> > alex@Zen2:/srv/work/alex/my-build$ meta-alex/setup-layers -h
> > usage: setup-layers [-h] [--force-bootstraplayer-checkout] [--destdir DESTDIR] [--jsondata JSONDATA]
> >
> > A self contained python script that fetches all the needed layers and sets them to correct revisions
> >
> > optional arguments:
> >   -h, --help            show this help message and exit
> >   --force-bootstraplayer-checkout
> >                         Force the checkout of the layer containing this file (by default it is presumed that as this script is in it, the layer is already in place).
> >   --destdir DESTDIR     Where to check out the layers (default is /srv/work/alex/my-build).
> >   --jsondata JSONDATA   File containing the layer data in json format (default is /srv/work/alex/my-build/meta-alex/setup-layers.json).
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
>
> This patch triggers an AB error:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/3916/steps/15/logs/stdio
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

