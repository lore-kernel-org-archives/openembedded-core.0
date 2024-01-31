Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4AF9C47258
	for <webhook@archiver.kernel.org>; Wed, 31 Jan 2024 17:16:12 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web11.696.1706721368255814366
 for <openembedded-core@lists.openembedded.org>;
 Wed, 31 Jan 2024 09:16:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S0Vb+q0Y;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-204f50f305cso3746165fac.3
        for <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 09:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706721367; x=1707326167; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CUkQPXE9RB1fjrore0ORUEI6arDZQh1Ip1843TME6pw=;
        b=S0Vb+q0YqGaId5AF3xHwkLtDbTKFW9wT1aDPOdLljz3/CdUqkt8pd27pEZ1SFrNPvG
         +HMsx7ape6OtIQsGql6k+OitLtgaTbG3F36/src2wJ8Mg87iv+4+FuKRufXM+IPkGXzl
         eVMkrzy+PXTwLyM1aIO4PE4iXgLq9C6oponW4Z5xR4VGH3g/fF+OwRBm7kBlHCOhE6Sa
         nusw78JjFrqHM1Q2k+Ftz/1vi2lRs7dhl3pPhGMAs+fsoz34qel+7TmYVCoOJOhlsoiH
         ZYveJlgRAWntrbTzs7Zmr5oFdy0YLWgfL/QJ2INBr5mK5ytXBkqZxcpVxDr1p75kBm03
         vscw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706721367; x=1707326167;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CUkQPXE9RB1fjrore0ORUEI6arDZQh1Ip1843TME6pw=;
        b=An3YOOd58jefNLMUIMojKubwK+qvFjomLczx+37Aev41PTEIRDdMv/0WuOoW/yx4AG
         qsEiJnw6oX6LAba+B6f5N3ZL39e8QkJSVHvMYj5IS/wsu8I84bl1bTyLfNWj8brK0fLL
         05rulRZKL7PPWF5vM7rVRFdf7NYyUsRGiMw41olpsVx0NgZBS1SAtaYMOoNc23NXED1u
         nFNqDY3ce/9H7oU3IpwJmng7/40+ufb0RxspOIZY4VzrmBXEeYoRutAss8d+zSJXK/Pm
         9JD91Z2wLN2CT5vUsbZyxrJOWZOLbit5d+kbaSPQf/uuSi4o6ylAcV6ruER3ZhxvkM1L
         h4Uw==
X-Gm-Message-State: AOJu0YwAqnFKwaLRTsI6kkspjHe+F28y8JB4qzMHwkfIoeKsaucTq5fi
	UkL14JmkPDwUyWZOheiB4BDfFLJ2XMwEr3N1NWt1+oeIE3q7h6nVrf2F3cbfesyW8ziNL/DT2OI
	zbvEj1LxUjJS6IlnX/ZlBHIah/4zRRLnhbhY=
X-Google-Smtp-Source: AGHT+IHmChry8B/hjU/sCPvOmrZetJzbVb+hjN+UU20Om6ZTCGJKN9nXB5UEtwPJq2Vsx9jWYOJZi//4HbAjIENsLlw=
X-Received: by 2002:a05:6870:6394:b0:218:5023:793c with SMTP id
 t20-20020a056870639400b002185023793cmr2391253oap.25.1706721367167; Wed, 31
 Jan 2024 09:16:07 -0800 (PST)
MIME-Version: 1.0
References: <20240130203219.4155783-1-raj.khem@gmail.com> <2024013116450562b504c7@mail.local>
In-Reply-To: <2024013116450562b504c7@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 31 Jan 2024 09:15:40 -0800
Message-ID: <CAMKF1spOmPEcc1_z4FNMpCnmmNMfu71FkVYCfq0tTiivhY7dvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] core-image-ptest: Increase disk size to 1.5G
 for strace ptest image
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 31 Jan 2024 17:16:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194530

On Wed, Jan 31, 2024 at 8:45=E2=80=AFAM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> On 30/01/2024 12:32:19-0800, Khem Raj wrote:
> > Autobuilder sees and intermittent failure on strace tests and it occurs
> > quite often therefore bump the size of image as the space requirement i=
s
> > more now with parallel execution enabled.
> >
>
> Note that I've resisted doing this because I'm still not sure this is
> what is happening, I've added a patch to clean up a bit more after each
> test which should have been enough. From my testing, I can't reproduce
> locally and I don't see some much space being used in the image itself.

OK. I just posted it since, it happened once for me earlier last week and i=
t
seems to be happening quite frequently as seen in bug reports.

>
> > [YOCTO #15370]
>
> Isn't it 15220 ? :)

ah yes.

>
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/images/core-image-ptest.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipe=
s-core/images/core-image-ptest.bb
> > index b6f5c2fd604..f2d0ae94b89 100644
> > --- a/meta/recipes-core/images/core-image-ptest.bb
> > +++ b/meta/recipes-core/images/core-image-ptest.bb
> > @@ -21,7 +21,7 @@ BBCLASSEXTEND =3D "${@' '.join(['mcextend:'+x for x i=
n d.getVar('PTESTS').split()]
> >  IMAGE_OVERHEAD_FACTOR =3D "1.0"
> >  IMAGE_ROOTFS_EXTRA_SPACE =3D "324288"
> >  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-mdadm =3D "1524288"
> > -IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace =3D "1024288"
> > +IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-strace =3D "1524288"
> >  IMAGE_ROOTFS_EXTRA_SPACE:virtclass-mcextend-lttng-tools =3D "1524288"
> >
> >  # tar-ptest in particular needs more space
> > --
> > 2.43.0
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#194504): https://lists.openembedded.org/g/openembed=
ded-core/message/194504
> > Mute This Topic: https://lists.openembedded.org/mt/104062115/3617179
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
alexandre.belloni@bootlin.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

