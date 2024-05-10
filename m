Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64E7AC25B10
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 08:43:52 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.8293.1715330623400137858
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 May 2024 01:43:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gte2kAbl;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-51fb14816f6so2271102e87.0
        for <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 01:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715330621; x=1715935421; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cm+RzV0k8Mb6ylksEoiwXGxx/gtU0YqL5ppA7frVRNM=;
        b=gte2kAbl80lDzUkejb4PGkTWeYl2rr8XXdVucfiFGFs0D21NF5zU0H4lMAvplFdqu9
         LvoVm9ydWUx6VzMcv4qSE8e9JSqM619U8X7dqcvFO8ld8cMkjFH/38Fv6jPJ/Uq7HNk/
         qzWiHzdKNHrYKBr837nApTcaH0deWr9CgLaKILwschepQlGLQrOQ1YrjZjxx/Mx2Axdk
         eSodBxbUyHh3UidgBc9Rv8JpP+EuNK0dtFEhIQhcebDoIQSf5iAs99WZRsxkbjB0EbFN
         ElOYccX57NiMv0BhGP/Nz4Ozsn1TLgLbJnqAJ6uSDyiZXLo3IB6npb7552lw2FA0F37S
         FEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715330621; x=1715935421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cm+RzV0k8Mb6ylksEoiwXGxx/gtU0YqL5ppA7frVRNM=;
        b=B9KFoIUOLlJwENg0nEcAPDu0yJmSMP4xSS85Lh2BWp7F+AGnyUs9QTwn9JZvQ/G1jx
         UA/hqCbX6iAXBSnlOOxUn1ANFdJ47Ph9EyiIcxqR3vYYRhljyIz8G5tbDQn9abeVP+LT
         BnAM/vLAfKt1Y4Xu4iHKacXUGRL9IsTpOUuw2A79h5OkT3tHeuL7iuCX+buHCEaJMkay
         rWhaQVQUWdIa9ODQcJNYcfkMnMfjHsEwsuVRwpvGtbMSPS5y6jpcMc10W2aFpTuZdRE+
         rh9i2FUSKSE63cLmv8TOTtsI25yLFLAr9PVlJv1rr6L/q6Hp4Agbg6FB+vei6KOiv1U0
         CXgg==
X-Gm-Message-State: AOJu0Yy27hF7DIcPSyiLkY+caY+fBpeTk6ITc+skglAwRVGudyo8p0eE
	3L45ErHDiBUa/LDnAzg6YFdnIwhKqp4rPAXesWND/RJ2wNtqF42AiidhylQ/ktJSn9bCiuPRdJ4
	0rHHT7jxnyWLdYT9UCgq9ttS7dNc=
X-Google-Smtp-Source: AGHT+IHEspZLQ7hjS3I3GDofRXb8acp6yWyUi3r93HQeVzh620F4QttQgyZMioaOQiIjPzMYSilsRBvNQMkStA8E6E4=
X-Received: by 2002:ac2:447a:0:b0:51b:79b7:8322 with SMTP id
 2adb3069b0e04-52210070264mr1189938e87.52.1715330621268; Fri, 10 May 2024
 01:43:41 -0700 (PDT)
MIME-Version: 1.0
References: <17CB016975A375B8.19032@lists.openembedded.org> <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
In-Reply-To: <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 10 May 2024 10:43:29 +0200
Message-ID: <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable multilib.
To: leimaohui@fujitsu.com
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 08:43:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199192

It's in abelloni/master-next on poky-contrib. Please read Richard's
status email and try to pay attention to them going forward:

https://lists.openembedded.org/g/openembedded-architecture/message/2003

Alex

On Fri, 10 May 2024 at 03:19, leimaohui via lists.openembedded.org
<leimaohui=fujitsu.com@lists.openembedded.org> wrote:
>
> Ping
>
>
>
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of leimaohui via
> > lists.openembedded.org
> > Sent: Tuesday, April 30, 2024 4:27 PM
> > To: openembedded-core@lists.openembedded.org
> > Cc: Lei, Maohui <leimaohui@fujitsu.com>
> > Subject: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable
> > multilib.
> >
> > From: Lei Maohui <leimaohui@fujitsu.com>
> >
> > - Fix the conflict error by oe_multilib_header. The conflict error is as the
> > following:
> > Error: Transaction test error:
> >   file /usr/include/bsd/sys/cdefs.h conflicts between attempted installs of
> > libbsd-dev-0.12.1-r0.core2_64 and lib32-libbsd-dev-0.12.1-r0.core2_32
> >
> > The difference of bsd/sys/cdefs.h between libbsd-dev and lib32-libbsd-dev is
> > as following:
> >
> >  /* Define the ABI for the current system. */  -#define
> > LIBBSD_SYS_TIME_BITS 64  +#define LIBBSD_SYS_TIME_BITS 32  #define
> > LIBBSD_SYS_HAS_TIME64 1
> >
> > - After oe_multilib_header on cdefs.h, the path of cdefs-64.h and cdefs-32.h
> > in cdefs.h need to be corrected for overlay-mode. Please reference to
> > https://man.archlinux.org/man/libbsd.7 for details.
> >   @@ -12,19 +12,19 @@
> >  #ifdef _MIPS_SIM
> >
> >  #if _MIPS_SIM == _ABIO32
> > -#include <bsd/sys/cdefs-32.h>
> > +#include <sys/cdefs-32.h>
> >  #elif _MIPS_SIM == _ABIN32
> > -#include <bsd/sys/cdefs-n32.h>
> > +#include <sys/cdefs-n32.h>
> >  #else
> >  #error "Unknown _MIPS_SIM"
> >  #endif
> >
> >  #else /* _MIPS_SIM is not defined */
> > -#include <bsd/sys/cdefs-32.h>
> > +#include <sys/cdefs-32.h>
> >  #endif
> >
> >  #elif __WORDSIZE == 64
> > -#include <bsd/sys/cdefs-64.h>
> > +#include <sys/cdefs-64.h>
> >  #else
> >  #error "Unknown __WORDSIZE detected"
> >  #endif /* matches #if __WORDSIZE == 32 */
> >
> > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > ---
> >  meta/recipes-support/libbsd/libbsd_0.12.2.bb | 10 +++++++++-
> >  1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > index 7d5e88f293..1791d97dfd 100644
> > --- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > +++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > @@ -40,8 +40,16 @@ SRC_URI =
> > "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> >
> >  SRC_URI[sha256sum] =
> > "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a147310
> > 14"
> >
> > -inherit autotools pkgconfig
> > +inherit autotools pkgconfig multilib_header
> >
> >  DEPENDS += "libmd"
> >
> > +do_install:append () {
> > +   oe_multilib_header bsd/sys/cdefs.h
> > +   # It hasn't been tested when libbsd is used in 'namespaced headers'
> > mode according to
> > +   # https://man.archlinux.org/man/libbsd.7.
> > +   sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g'
> > +${D}${includedir}/bsd/sys/cdefs.h }
> > +
> > +
> >  BBCLASSEXTEND = "native nativesdk"
> > --
> > 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#199186): https://lists.openembedded.org/g/openembedded-core/message/199186
> Mute This Topic: https://lists.openembedded.org/mt/105817273/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

