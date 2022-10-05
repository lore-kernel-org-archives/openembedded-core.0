Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2008DC433FE
	for <webhook@archiver.kernel.org>; Wed,  5 Oct 2022 17:09:37 +0000 (UTC)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com
 [209.85.166.180])
 by mx.groups.io with SMTP id smtpd.web09.583.1664989773471220217
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:09:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MajeApus;
 spf=pass (domain: gmail.com, ip: 209.85.166.180,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-il1-f180.google.com with SMTP id y17so4414157ilq.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Oct 2022 10:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=miJdsfaV1ROXw/mCAqOUiJYVLr5s6Z/L5/D1Ks74SC4=;
        b=MajeApusdXKZ8VEtMR2unTV8i61tgTS51HgvzBWfNr2654sdyLIbH7p9x+2N/jqCRH
         esnHmjv8eZEBE5CNPY8UiBRVEORp8tQW6T3oWpWKKUJjk0DWEtV7r7YcJ/zmSFXQp2+s
         59B2FZSkixbELf1jiNizvTBkrENcQPiwn+CHrlgBAEOf1KyvnzaxBJKbFcbjJeKCnBff
         FEXJqxmMmSl21GQg8P5yYd7F7IIz+vXbZycGQG9iyMeShuLotCD/f8zLU0zHxvj9Vfzp
         vNAkYLZkyNWKaVSXAPht4HTiE7/uCMzgqLljqS+5pmsA7cbgR9nvZJJzCH1RycwlyCBB
         /4Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=miJdsfaV1ROXw/mCAqOUiJYVLr5s6Z/L5/D1Ks74SC4=;
        b=uRUcgDSdjYwjVMKn0zPfC2KJWI/XKegKIPqps/Ci14cUWjZLLJbvrUnXHylgRujRJP
         jbJcco9N1QfAELExbVQ6uoRz3NJYl5e5dGrJmfY67U0ZaeuULChPWaH7IQkL7o94Bw2+
         +z1aRBfq8w6Zc4kZkPJxFZglmrpGefarXP2d9Rh4xNcBCpS/yOZbA2FEAYngBptmsFDR
         KRpaZwb4rtld5Tz1u5VnsqXbueLbhAJQkUH/80ZPSTQZeIKkz76Wd5cCv/MK+k1AgViJ
         pnhY1SAXLbP4HU5KectqQBNIIak2Csv3PC9Nr5/hq4RsVhFFgrNJkrRnxOpNCbuoZ0s/
         qx0g==
X-Gm-Message-State: ACrzQf31QMPbxKbdOVMmXsFoXyB7g7DBZV92J9c8OprEoAxudu2FLJaK
	tVIHKgrIpS5Gjl9LP9KgWTNNQFL5Y1cm6zCooso=
X-Google-Smtp-Source: 
 AMsMyM6VaYxKmo6yk3wVieX6mOY1jJJkPiwl0VEmMTqFybSKTl0c4/21tlx95wZry8qLBGb9uDlln+uTvcEl8ez9IU0=
X-Received: by 2002:a05:6e02:1c27:b0:2f9:1d1a:9619 with SMTP id
 m7-20020a056e021c2700b002f91d1a9619mr305774ilh.209.1664989772808; Wed, 05 Oct
 2022 10:09:32 -0700 (PDT)
MIME-Version: 1.0
References: <20221005150138.2538539-1-thomas.perrot@bootlin.com>
 <CAMKF1sps-=A9OpQK86jX=EkYDVxWVfabD84G27+75VdMiguJHg@mail.gmail.com>
 <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
In-Reply-To: <3a9e20001ec3677f73b451708c0932d7daf4f838.camel@bootlin.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 5 Oct 2022 19:09:21 +0200
Message-ID: 
 <CANNYZj9yoFsY3On8PqsqBw1VV3R4qB1Xd7R-1=Po5x4wGonmSA@mail.gmail.com>
Subject: Re: [OE-core][PATCH] core-image-sato: install virtio input for Qemu
 targets
To: thomas.perrot@bootlin.com
Cc: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Oct 2022 17:09:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171469

Does core-image-weston have the same problem? If it does, then this
certainly needs to go to qemu include in conf/machine/

Alex

On Wed, 5 Oct 2022 at 18:51, Thomas Perrot via lists.openembedded.org
<thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
>
> Hello Khem,
>
> On Wed, 2022-10-05 at 09:19 -0700, Khem Raj wrote:
> > On Wed, Oct 5, 2022 at 8:01 AM Thomas Perrot via
> > lists.openembedded.org
> > <thomas.perrot=bootlin.com@lists.openembedded.org> wrote:
> > >
> > > Otherwise, it isn't possible to interact with the UI.
> >
> > I wonder if it should be in the MACHINE_EXTRA_RRECOMMENDS in machine
> > configs, it will help a wide range of users who may be using
> > graphical images.
>
> I hesitated to put it in MACHINE_EXTRA_RDEPENDS for Qemu targets.
>
> Currently, kernel-modules are in MACHINE_EXTRA_RRECOMMENDS of Qemu
> RISC-V and PPC64, which are not installed when NO_RECOMMENDATIONS="1"
>
> Kind regards,
> Thomas
>
> >
> > >
> > > Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> > > ---
> > >  meta/recipes-sato/images/core-image-sato.bb | 2 ++
> > >  1 file changed, 2 insertions(+)
> > >
> > > diff --git a/meta/recipes-sato/images/core-image-sato.bb
> > > b/meta/recipes-sato/images/core-image-sato.bb
> > > index e63a229d1257..0e37c15097b3 100644
> > > --- a/meta/recipes-sato/images/core-image-sato.bb
> > > +++ b/meta/recipes-sato/images/core-image-sato.bb
> > > @@ -12,6 +12,8 @@ inherit core-image
> > >  TOOLCHAIN_HOST_TASK:append = " nativesdk-intltool nativesdk-glib-
> > > 2.0"
> > >  TOOLCHAIN_HOST_TASK:remove:task-populate-sdk-ext = " nativesdk-
> > > intltool nativesdk-glib-2.0"
> > >
> > > +IMAGE_INSTALL:append:qemuall = " kernel-module-virtio-input"
> > > +
> > >  QB_MEM = '${@bb.utils.contains("DISTRO_FEATURES", "opengl", "-m
> > > 512", "-m 256", d)}'
> > >  QB_MEM:qemuarmv5 = "-m 256"
> > >  QB_MEM:qemumips = "-m 256"
> > > --
> > > 2.37.3
> > >
> > >
> > >
> > >
>
> --
> Thomas Perrot, Bootlin
> Embedded Linux and kernel engineering
> https://bootlin.com
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171468): https://lists.openembedded.org/g/openembedded-core/message/171468
> Mute This Topic: https://lists.openembedded.org/mt/94137249/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

