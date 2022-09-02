Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EE9ECAAD5
	for <webhook@archiver.kernel.org>; Fri,  2 Sep 2022 15:02:10 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web12.7608.1662130928571602906
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:02:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=EWmJFpHi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id bp20so2186348wrb.9
        for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Sep 2022 08:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date;
        bh=bDomHO5c5JbQjbPS5Ncp8ROMhoLIwbXhFQ4/TLc6qiw=;
        b=EWmJFpHiznKisUWHG7tV6qUfKC0he4N/nLBZiy8qxuGi8QaScuUf+2Oujow+iB+JLG
         QZl1m7vQdGvmyYRREZQuRlVefjE9FpMjxa9xbd3CfAX6mQK9LXov8TeX72G0SUfHW072
         +YKnW1v0X96nt5uO15cKE20ENxCvz0FvgsxAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date;
        bh=bDomHO5c5JbQjbPS5Ncp8ROMhoLIwbXhFQ4/TLc6qiw=;
        b=nGWiHS+BS1/8En+FV1f/wsXon404MR9cCWiAeFCKqjWsfGnGctfNLvl8zSICKZw4DS
         lJkOwy8ju7ySLCAProbjG6E8KxjJEzJYGFqHzSW2GtiF1O8nFXX8O/ZCLzF/I1eHrzRe
         Jzg3x8vfgkm9F2SGvbmn418JcT+DoL8PC5hmJHrgSgG6piHMtBaCDSohE32/cXID4mw+
         ZFEeQr2LIOJNLTsTU0xngUE1krJkeDBfFREatqTrz3BL8iP//aTDOlJv83c+z07fX+Wh
         KtXyJz4Bok69uPTXawWqhAgzV9h57XEGBX3jNbtkGIliuxajLS/YaNXzxIMW5nHKF955
         yO+g==
X-Gm-Message-State: ACgBeo2dfXxvKUlv2UhPPMwDjzOzFzSK1DaII24hG1WX5X0dIbf/8Vyj
	V5NBb1puqleR8ma1+2suzNEQgQ==
X-Google-Smtp-Source: 
 AA6agR5boCPNuE+Sp0AP2duialyGWJC0HuhNYss3XT4fLuhzAZXMHGlRo2yLr6AWvwle5oWy/3fK/w==
X-Received: by 2002:a5d:6d0b:0:b0:222:764d:9e98 with SMTP id
 e11-20020a5d6d0b000000b00222764d9e98mr17052944wrq.189.1662130926861;
        Fri, 02 Sep 2022 08:02:06 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cbec:572b:ff3a:e320?
 ([2001:8b0:aba:5f3c:cbec:572b:ff3a:e320])
        by smtp.gmail.com with ESMTPSA id
 f15-20020adfb60f000000b00226d1b81b45sm1990455wre.27.2022.09.02.08.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 08:02:06 -0700 (PDT)
Message-ID: 
 <3da5db97fad9def2316542749953f960f2fcdb23.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] baremetal-image.bbclass: avoid inheriting
 incompatible IMAGE_CLASSES
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 02 Sep 2022 16:02:05 +0100
In-Reply-To: 
 <CAHMutrbiWa0ezWeuH8mV9ZhGLqvAPVxpuEh1-JhCWEkks5OFxw@mail.gmail.com>
References: <20220901234206.419429-1-alejandro@enedino.org>
	 <ce837e16269eae046f24845d5b353b8a98210294.camel@linuxfoundation.org>
	 <CAHMutrbiWa0ezWeuH8mV9ZhGLqvAPVxpuEh1-JhCWEkks5OFxw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Sep 2022 15:02:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170253

On Fri, 2022-09-02 at 09:53 -0500, Alejandro Enedino Hernandez
Samaniego wrote:
>=20
>=20
> On Fri, Sep 2, 2022, 9:47 AM Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> > On Thu, 2022-09-01 at 17:42 -0600, Alejandro Hernandez Samaniego
> > wrote:
> > > There could be IMAGE_CLASSES designed to work on images which
> > > arent
> > > necessarily compatible with baremetal-images, one example is the
> > > license_image class which relies on the package managers
> > > functionality
> > > during do_rootfs, for baremetal images no rootfs is created hence
> > > the
> > > package manager shouldnt be invoked, we need to avoid inheriting
> > > such
> > > class to fix this behavior.
> > >=20
> > > inherit BAREMETAL_IMAGE_CLASSES for baremetal images but set the
> > > default
> > > to IMAGE_CLASSES, whilst removing undesired classes in an
> > > intermediate
> > > step to avoid incompatibilities.
> > >=20
> > > Signed-off-by: Alejandro Enedino Hernandez Samaniego
> > > <alejandro@enedino.org>
> > > ---
> > > =C2=A0 meta/classes-recipe/baremetal-image.bbclass | 9 ++++++++-
> > > =C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/meta/classes-recipe/baremetal-image.bbclass
> > > b/meta/classes-recipe/baremetal-image.bbclass
> > > index d3377a92fa..2f07dec4ac 100644
> > > --- a/meta/classes-recipe/baremetal-image.bbclass
> > > +++ b/meta/classes-recipe/baremetal-image.bbclass
> > > @@ -18,8 +18,15 @@
> > > =C2=A0 ## Emulate image.bbclass
> > > =C2=A0 # Handle inherits of any of the image classes we need
> > > =C2=A0 IMAGE_CLASSES ??=3D ""
> > > -IMGCLASSES =3D " ${IMAGE_CLASSES}"
> > > +BAREMETAL_IMAGE_CLASSES ?=3D " ${IMAGE_CLASSES}"
> > > +
> > > +# The license_image class relies on package managers used on
> > > do_rootfs
> > > +# these dont exist for baremetal images since no rootfs is
> > > created.
> > > +BAREMETAL_IMAGE_CLASSES:remove =3D "license_image"
> > > +
> > > +IMGCLASSES =3D " ${BAREMETAL_IMAGE_CLASSES}"
> > > =C2=A0 inherit ${IMGCLASSES}
> > > +
> > > =C2=A0 # Set defaults to satisfy IMAGE_FEATURES check
> > > =C2=A0 IMAGE_FEATURES ?=3D ""
> > > =C2=A0 IMAGE_FEATURES[type] =3D "list"
> >=20
> > This is going to become a usability nightmare. Can we patch
> > license_image to just silently do nothing for baremetal?
>=20
> I think we can, but we'd have to do that on every class that is
> incompatible (I don't expect many to be, but I tried to generate a
> more generic solution and use BAREMETAL_, IMAGE_CLASSES as a gate),
> with that in mind, Is that still better than this?

I think we do need to fixes the classes which don't work. The
alternative is users having two lists of image classes which defeats
much of what the variable was trying to do. We may as well just give up
on IMAGE_CLASSES for baremetal and require it's own list which will be
a pain for users.

Cheers,

Richard



