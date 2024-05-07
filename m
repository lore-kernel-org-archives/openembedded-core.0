Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05BAC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 05:58:13 +0000 (UTC)
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
 by mx.groups.io with SMTP id smtpd.web11.5003.1715061487864177178
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 May 2024 22:58:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=b695pPKs;
 spf=pass (domain: gmail.com, ip: 209.85.217.41, mailfrom: raj.khem@gmail.com)
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-47ef7e85cf0so498850137.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 May 2024 22:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715061487; x=1715666287; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mPGmOgMQqJaQW9aikbhicTodE+GquM/wsazI+Qui9EM=;
        b=b695pPKs72r8PuemaVBY1LRiqRVJi4MjfhjKOt61Sv/bZaG3cpkpAmPiQUuStdlu+E
         q9QWaFG/JlIFs+dLqs36b+SkYqc2iiaKfKwvRegJEIbsJnSmk559qXZZ73cbLhI7i37B
         AlcJLhX41RXuduafiTevYk19xoORs1fhxtae9RUWftDeNj+fqBVF5XXKKgrRRwV+QVLf
         eipDgmA+rJd8w/dmDABjYYiRGLLsl7JgCOil4xQ4nwGr5ndHG7OZe5uo/PwLqJp3liN6
         DuvOQrE5EV5BDGmlljGkwqqYzuoZ44W95oXqaPY0+pzs9QBApAp/zmaaWIcYWtiueGze
         n1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715061487; x=1715666287;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mPGmOgMQqJaQW9aikbhicTodE+GquM/wsazI+Qui9EM=;
        b=fFdLYt2L35llMo2Sc5WsYMU5LiRVXHOhSgB00v3yuay0w52kJKmnqFifhDTvq52+Aa
         xD/eFN4i/OgqXD3wmNfo1kce67Ah8y5iUsiOR0+Mgfzr3JX6jOBQKOH80mcwTn+w+P8N
         GGb4hjpNKie9rTqcZ55gfQa+tv7p70DSDYRp182Uqx0uYxMByYq8Wsis54CuCssBFp/q
         sI2Fc9Xd2ZvQid+WiULK1G+A5fX8DaZq2Bieb0D4wunevoySo99hpnU3VL/ZGihqh5Nc
         dFPVROxakx53pk5efMmIA0AVEK2KnTLdya2OGzjkpJ/ydZgMf9S72P5vWduq/uNp7c9t
         wUEA==
X-Gm-Message-State: AOJu0YxsImaBSqTISxdWNO8fDwp8K1t2BuPnkxPonIEFRFuEtT4KecFr
	xTAGGec8PfqO33S1TzpSVBMlJv3oXXOYpL1xWXxcDwQZJJV3eAC9pNRORZ2/wIg8EKM/RAAHSwB
	oht+73oZj6p1Hmzm1dPIAWXE5Fh0=
X-Google-Smtp-Source: AGHT+IFc3TiWYxuI/tE2/NQPwNDcelTAs6kOl83V10dNJzdfeC36sV8CYAAI/bKzuRQKEh22ZAujUrVITnpA9dUUBNU=
X-Received: by 2002:a67:e248:0:b0:47c:f0d:3ba1 with SMTP id
 w8-20020a67e248000000b0047c0f0d3ba1mr14374100vse.27.1715061486824; Mon, 06
 May 2024 22:58:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-4-raj.khem@gmail.com>
 <CA+chaQem=rzFHQAOmEqiOzzYTjPqXN6k9MULVGQ5t_Du0bGp7g@mail.gmail.com>
In-Reply-To: <CA+chaQem=rzFHQAOmEqiOzzYTjPqXN6k9MULVGQ5t_Du0bGp7g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 6 May 2024 22:57:40 -0700
Message-ID: <CAMKF1sqA8ztfp8Ea+8jOO0pwR10gMc6f3WoXE6UT2LUSdYi8Bg@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] zip lrzsz connman-gnome libfm: ignore various
 issues fatal with gcc-14
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 05:58:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199080

On Mon, May 6, 2024 at 10:38=E2=80=AFPM Martin Jansa <martin.jansa@gmail.co=
m> wrote:
>
> On Tue, May 7, 2024 at 7:33=E2=80=AFAM Khem Raj <raj.khem@gmail.com> wrot=
e:
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > work arounds for:
> > oe-core/meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb:do_compile
> > oe-core/meta/recipes-connectivity/connman/connman-gnome_0.7.bb:do_compi=
le
> > oe-core/meta/recipes-support/libfm/libfm_1.3.2.bb:do_compile
> > oe-core/meta/recipes-extended/zip/zip_3.0.bb:do_compile
> >
> > http://errors.yoctoproject.org/Errors/Build/183127/
> >
> > More fixes on ML (especially for -native with gcc-14 on host)
> > zip: https://lists.openembedded.org/g/openembedded-core/message/198783
> > cdrtools: https://lists.openembedded.org/g/openembedded-core/message/19=
8899
> > syslinux: https://lists.openembedded.org/g/openembedded-core/message/19=
8901
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> ...
> > diff --git a/meta/recipes-extended/zip/zip_3.0.bb b/meta/recipes-extend=
ed/zip/zip_3.0.bb
> > index 70df5ab8728..e7705b8faf4 100644
> > --- a/meta/recipes-extended/zip/zip_3.0.bb
> > +++ b/meta/recipes-extended/zip/zip_3.0.bb
> > @@ -53,3 +53,8 @@ BBCLASSEXTEND =3D "native"
> >
> >  # exclude version 2.3.2 which triggers a false positive
> >  UPSTREAM_CHECK_REGEX =3D "^zip(?P<pver>(?!232).+)\.tgz"
> > +
> > +# http://errors.yoctoproject.org/Errors/Details/766953/
> > +# unix/unix.c:84:51: error: passing argument 4 of 'fread' from incompa=
tible pointer type [-Wincompatible-pointer-types]
> > +CFLAGS +=3D "-Wno-error=3Dincompatible-pointer-types"
> > +# proper fix on ML: https://lists.openembedded.org/g/openembedded-core=
/message/198783
>
> I think we should take the proper fix from ML instead of this work
> around (I just haven't tested it yet).

I have cherry-picked the fix from ML and dropped zip from workaround
in my branches

