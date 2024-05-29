Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC0DC27C43
	for <webhook@archiver.kernel.org>; Wed, 29 May 2024 09:56:59 +0000 (UTC)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web10.10052.1716976608934303603
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 May 2024 02:56:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VWmQtdLm;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2e78fe9fc2bso24700701fa.3
        for <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 02:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716976607; x=1717581407; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=2kq/b3RuLy9JrXyOSTcZCsPhb024oHP3wa09FNzwcdE=;
        b=VWmQtdLmXckJP1k02EqQTGLQ4ap4T0fR1NIOQ3+pTWllckkKpmybXef/oIew8+isoa
         xRMvGhTgsSqMM/9dD62ypqXYxPnRap8pJgtyFkKVGydqBxJaBlkkwW8slVF2mLXc9/0p
         zt+wiQrWrHFeJtOmUWhvJAAuXX0TvqplyTFImefZq0dN9pnvrXTjB6f5qPSviQ7oekPd
         iAPx/n9vkZGO/0EpI4qsDskOZDsvbuh88lTUUwHJR8PVKCIy0C3naWwRy/lUag+CxpgK
         G0quSvs1bm5wOzVY2zbZKqv3UshiSx9L1xLCu/JpRMtOyFIGHgZ2PLcQit16Bfmsdvmk
         WqnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716976607; x=1717581407;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2kq/b3RuLy9JrXyOSTcZCsPhb024oHP3wa09FNzwcdE=;
        b=CmEWMp5d1axuwC9AjHC8sdVMVkdpXxl28EU93wgHyXpVPsAXPineV92PAVcCe69pdF
         3kXH/PjYFITc1obOkrzj61owU6/goGx3tgkcS999lRtLnJjqbQSgjJhwpjrgLa9I9K6O
         t83bojrK6UVjMLLhzHgHOEdZrlQZGhE9dSe4IqSOmJZG9Pf/p/52PFcxhn9rWfrEtG1K
         P9DVRLZv9zCjmdAw+Btcj+UpRFZlAr+PFAS0wQMmO1z12uCt81OCqM9VHOSMyrhgj7KO
         cdyAquMAtoc3hitHwFO2by9GDiLx28Qp9IpuVxQwcoqRz3vBMccAeEhgF+Sr3jEeZY4r
         K8mA==
X-Gm-Message-State: AOJu0YybH/eJo2kwLWhvn5OVhwe881EHtAb9nTpXo0V1CCccc04t2EmG
	gBK88n0CoPhkekmeNEdQI4aEwOPOrguvDD/AK6at7ApdCKRiXM1u6r+OkQOBQL1bJNhS31KoFRL
	xblMs1gpzc6SH8JcsU3RAIakTjFU=
X-Google-Smtp-Source: AGHT+IG09Rz7RPyvBmoAUMjvr/Pz0/mMGcl16CScNHwusMBT/FIH7gUz+kQOgoopkrQBSYorNlyJzFS0D8ALd9ywrm0=
X-Received: by 2002:a2e:9659:0:b0:2e1:c479:e226 with SMTP id
 38308e7fff4ca-2e95b0bcebbmr90527751fa.9.1716976606722; Wed, 29 May 2024
 02:56:46 -0700 (PDT)
MIME-Version: 1.0
References: <17CB016975A375B8.19032@lists.openembedded.org>
 <TYCPR01MB1105524607983912E618C3F2FA0E72@TYCPR01MB11055.jpnprd01.prod.outlook.com>
 <CANNYZj9wbPVs5=dVVRr=Hz5w7SVpPC-sZQyEa85ct5M3=z9Anw@mail.gmail.com>
 <17CEE5C1836CC254.26216@lists.openembedded.org> <TY3PR01MB11056FAE92F3B29F3EA1C55BBA0F22@TY3PR01MB11056.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11056FAE92F3B29F3EA1C55BBA0F22@TY3PR01MB11056.jpnprd01.prod.outlook.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 29 May 2024 11:56:35 +0200
Message-ID: <CANNYZj_rm0zNF9kFZa-TJ9j7W0sGLfB66LFH0fVMOo3Fo7ahiw@mail.gmail.com>
Subject: Re: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when enable multilib.
To: "Maohui Lei (Fujitsu)" <leimaohui@fujitsu.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 May 2024 09:56:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199997

It's still in abelloni/master-next, nothing has changed. Where did you
look for it?

Alex

On Wed, 29 May 2024 at 04:01, Maohui Lei (Fujitsu)
<leimaohui@fujitsu.com> wrote:
>
> Hi,
>
> This patch has not been merged yet and I didn't find it any more. Is there any issue with this patch?
>
> Best regards
> Lei
>
> > -----Original Message-----
> > From: openembedded-core@lists.openembedded.org
> > <openembedded-core@lists.openembedded.org> On Behalf Of leimaohui via
> > lists.openembedded.org
> > Sent: Monday, May 13, 2024 8:45 AM
> > To: Alexander Kanavin <alex.kanavin@gmail.com>
> > Cc: openembedded-core@lists.openembedded.org
> > Subject: Re: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error when
> > enable multilib.
> >
> > Hi, Alex
> >
> > > It's in abelloni/master-next on poky-contrib. Please read Richard's
> > > status email and try to pay attention to them going forward:
> > I got it. Thank you for your reply.
> >
> > Best regards
> > Lei
> >
> > > -----Original Message-----
> > > From: Alexander Kanavin <alex.kanavin@gmail.com>
> > > Sent: Friday, May 10, 2024 4:43 PM
> > > To: Lei, Maohui <leimaohui@fujitsu.com>
> > > Cc: openembedded-core@lists.openembedded.org
> > > Subject: Re: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error
> > > when enable multilib.
> > >
> > > It's in abelloni/master-next on poky-contrib. Please read Richard's
> > > status email and try to pay attention to them going forward:
> > >
> > >
> > https://lists.openembedded.org/g/openembedded-architecture/message/20
> > > 03
> > >
> > > Alex
> > >
> > > On Fri, 10 May 2024 at 03:19, leimaohui via lists.openembedded.org
> > > <leimaohui=fujitsu.com@lists.openembedded.org> wrote:
> > > >
> > > > Ping
> > > >
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: openembedded-core@lists.openembedded.org
> > > > > <openembedded-core@lists.openembedded.org> On Behalf Of
> > leimaohui
> > > > > via lists.openembedded.org
> > > > > Sent: Tuesday, April 30, 2024 4:27 PM
> > > > > To: openembedded-core@lists.openembedded.org
> > > > > Cc: Lei, Maohui <leimaohui@fujitsu.com>
> > > > > Subject: [OE-core][PATCH v4][PATCH] libbsd: Fix conflict error
> > > > > when enable multilib.
> > > > >
> > > > > From: Lei Maohui <leimaohui@fujitsu.com>
> > > > >
> > > > > - Fix the conflict error by oe_multilib_header. The conflict error
> > > > > is as the
> > > > > following:
> > > > > Error: Transaction test error:
> > > > >   file /usr/include/bsd/sys/cdefs.h conflicts between attempted
> > > > > installs of
> > > > > libbsd-dev-0.12.1-r0.core2_64 and
> > > > > lib32-libbsd-dev-0.12.1-r0.core2_32
> > > > >
> > > > > The difference of bsd/sys/cdefs.h between libbsd-dev and
> > > > > lib32-libbsd-dev is as following:
> > > > >
> > > > >  /* Define the ABI for the current system. */  -#define
> > > > > LIBBSD_SYS_TIME_BITS 64  +#define LIBBSD_SYS_TIME_BITS 32
> > #define
> > > > > LIBBSD_SYS_HAS_TIME64 1
> > > > >
> > > > > - After oe_multilib_header on cdefs.h, the path of cdefs-64.h and
> > > > > cdefs-32.h in cdefs.h need to be corrected for overlay-mode.
> > > > > Please reference to
> > > > > https://man.archlinux.org/man/libbsd.7 for details.
> > > > >   @@ -12,19 +12,19 @@
> > > > >  #ifdef _MIPS_SIM
> > > > >
> > > > >  #if _MIPS_SIM == _ABIO32
> > > > > -#include <bsd/sys/cdefs-32.h>
> > > > > +#include <sys/cdefs-32.h>
> > > > >  #elif _MIPS_SIM == _ABIN32
> > > > > -#include <bsd/sys/cdefs-n32.h>
> > > > > +#include <sys/cdefs-n32.h>
> > > > >  #else
> > > > >  #error "Unknown _MIPS_SIM"
> > > > >  #endif
> > > > >
> > > > >  #else /* _MIPS_SIM is not defined */ -#include
> > > > > <bsd/sys/cdefs-32.h>
> > > > > +#include <sys/cdefs-32.h>
> > > > >  #endif
> > > > >
> > > > >  #elif __WORDSIZE == 64
> > > > > -#include <bsd/sys/cdefs-64.h>
> > > > > +#include <sys/cdefs-64.h>
> > > > >  #else
> > > > >  #error "Unknown __WORDSIZE detected"
> > > > >  #endif /* matches #if __WORDSIZE == 32 */
> > > > >
> > > > > Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> > > > > ---
> > > > >  meta/recipes-support/libbsd/libbsd_0.12.2.bb | 10 +++++++++-
> > > > >  1 file changed, 9 insertions(+), 1 deletion(-)
> > > > >
> > > > > diff --git a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > > > > b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > > > > index 7d5e88f293..1791d97dfd 100644
> > > > > --- a/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > > > > +++ b/meta/recipes-support/libbsd/libbsd_0.12.2.bb
> > > > > @@ -40,8 +40,16 @@ SRC_URI =
> > > > > "https://libbsd.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
> > > > >
> > > > >  SRC_URI[sha256sum] =
> > > > >
> > >
> > "b88cc9163d0c652aaf39a99991d974ddba1c3a9711db8f1b5838af2a147310
> > > > > 14"
> > > > >
> > > > > -inherit autotools pkgconfig
> > > > > +inherit autotools pkgconfig multilib_header
> > > > >
> > > > >  DEPENDS += "libmd"
> > > > >
> > > > > +do_install:append () {
> > > > > +   oe_multilib_header bsd/sys/cdefs.h
> > > > > +   # It hasn't been tested when libbsd is used in 'namespaced headers'
> > > > > mode according to
> > > > > +   # https://man.archlinux.org/man/libbsd.7.
> > > > > +   sed -i 's:#include <bsd/sys/cdefs:#include <sys/cdefs:g'
> > > > > +${D}${includedir}/bsd/sys/cdefs.h }
> > > > > +
> > > > > +
> > > > >  BBCLASSEXTEND = "native nativesdk"
> > > > > --
> > > > > 2.34.1
> > > >
> > > >
> > > >
> > > >

