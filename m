Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BD4EC433FE
	for <webhook@archiver.kernel.org>; Tue,  8 Nov 2022 16:40:54 +0000 (UTC)
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
 by mx.groups.io with SMTP id smtpd.web10.175.1667925653136757221
 for <openembedded-core@lists.openembedded.org>;
 Tue, 08 Nov 2022 08:40:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eAXccVwJ;
 spf=pass (domain: gmail.com, ip: 209.85.160.51, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-13bd19c3b68so16824965fac.7
        for <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 08:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pk+M15BXC9R6QTmluQm4wEMch75d6ovcRXRzvXKIW4Y=;
        b=eAXccVwJaKTmC2silaPAQ/IYcZpvzy4XXXaV7RdcNAdRmSdajFhRpWAwoomn/wnVZG
         JAlHDv/p6iXP8aa9rULKuyZYwDwHGZRlaPONfNqYqwAQp8KqaRNfaobnRWhQbwx1ESfX
         QLO5gUPygJ3vQTsVUi1L6tVRuDUtvxTEvO38UhQTa8zaztAWjRipE+XnXG+zMcYNaA7l
         mdkn9ScF48fSd/V3Zrh42QvJ1wbgrnKc5gNLMLb6qdc8eyhHM+0xa1amQiAUHJ4oEnkG
         GyAyTPQammSB9B7wPjA3J8KwkDBRn8YeOXbwI7GqcbeWm5pNbF9kLipnQ34TpvJY5nTP
         5k0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pk+M15BXC9R6QTmluQm4wEMch75d6ovcRXRzvXKIW4Y=;
        b=tq14jh5Bl6mM4TyaCyPjHmcPmKhT8STrKWc8yYn1ts5IqBAnCDRyiiwv8qp+RDKY4Y
         ov2WCjT0kXuc5eViuuL2T/4UDc8Lsivlt0JXaBHnq2Urp4HPkvYu8CQbwapw4oFYmK39
         NUkhWvirQOG6hvkyJ3S5EH8oZsGpw5fhafqIhArj0WX0NGtYLiyqxZZlgkiJTSig1v8f
         Y51w1jDb/UHkQjnNNWcRQwyiVsFDxq5H2jbiKVuTACTCgQXyiKLDhpHuTDt8HOusGFAk
         221qlwgA7lLqU0UYMqIVxPe103cYYroR9Jz/tf6loauLS+ljlWl+6whes6ULIT0CNi/p
         58yQ==
X-Gm-Message-State: ACrzQf2vSQIAJHtmdcuguSTBgBINCzIIFj+NMhZ18zLDBAv3JBRFySVB
	YtkTuCWnjdadTOdDSejAx+Lyh7NwsQdfmitLZUyG4sqr
X-Google-Smtp-Source: AMsMyM7OkXxtHUfFv/JzMviZxjIWHZKuBovrMNOsdTj9Kd/gyWr9yxRUDB7CiP5SPqsW3c6TEoBNPr72zwFlGOvGWp0=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr42647153oae.262.1667925652437; Tue, 08
 Nov 2022 08:40:52 -0800 (PST)
MIME-Version: 1.0
References: <20221108000828.42824-1-niko.mauno@vaisala.com>
 <20221108000828.42824-2-niko.mauno@vaisala.com> <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
In-Reply-To: <CANNYZj9f2nfRbwU1MXn2a7ruKHhkw318F92Lqp9xYd8acvubwQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 8 Nov 2022 08:40:26 -0800
Message-ID: <CAMKF1spOGt6eJuRVn+3rs0wOrx-uSHvf-jgox39DP6NY_vQjGw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 2/3] kbd: Disable 64 bit time with 32 bit glibc
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: niko.mauno@vaisala.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 08 Nov 2022 16:40:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172979

On Tue, Nov 8, 2022 at 1:14 AM Alexander Kanavin <alex.kanavin@gmail.com> w=
rote:
>
> We do build for 32 bit arm targets, so is this seen only in specific
> circumstances? What are they?

Its when 64bit time_t is used with glibc on 32bit architectures. So
far we do not do that explicitly, with musl time_t is always 64bit

>
> Alex
>
> On Tue, 8 Nov 2022 at 01:09, Niko Mauno via lists.openembedded.org
> <niko.mauno=3Dvaisala.com@lists.openembedded.org> wrote:
> >
> > For now add exemption in order to avoid following failure during
> > do_compile()
> >
> >   | .../build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/kbd/2.5.1-=
r0/recipe-sysroot-native/usr/bin/arm-poky-linux-gnueabi/../../libexec/arm-p=
oky-linux-gnueabi/gcc/arm-poky-linux-gnueabi/12.2.0/ld:.libs/libtswrap.ver:=
2: syntax error in VERSION script
> >   | collect2: error: ld returned 1 exit status
> >
> > Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
> > ---
> >  meta/recipes-core/kbd/kbd_2.5.1.bb | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta/recipes-core/kbd/kbd_2.5.1.bb b/meta/recipes-core/kbd=
/kbd_2.5.1.bb
> > index aa3ab6e121..b623aecd36 100644
> > --- a/meta/recipes-core/kbd/kbd_2.5.1.bb
> > +++ b/meta/recipes-core/kbd/kbd_2.5.1.bb
> > @@ -18,6 +18,9 @@ SRC_URI =3D "${KERNELORG_MIRROR}/linux/utils/${BPN}/$=
{BP}.tar.xz \
> >
> >  SRC_URI[sha256sum] =3D "ccdf452387a6380973d2927363e9cbb939fa2068915a6f=
937ff9d24522024683"
> >
> > +# Compiling 64 bit time for 32 bit host is broken
> > +GLIBC_64BIT_TIME_CPPFLAGS =3D ""
> > +
> >  PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
> >                    "
> >
> > --
> > 2.36.1
> >
> >
> >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#172955): https://lists.openembedded.org/g/openembedde=
d-core/message/172955
> Mute This Topic: https://lists.openembedded.org/mt/94880633/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

