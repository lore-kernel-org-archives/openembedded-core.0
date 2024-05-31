Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2E1C25B75
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 22:38:22 +0000 (UTC)
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
 by mx.groups.io with SMTP id smtpd.web10.26197.1717195098823662875
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 15:38:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=kHi2rvTd;
 spf=pass (domain: gmail.com, ip: 209.85.167.50, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-52b89fcdcc7so1503464e87.3
        for <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 15:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717195097; x=1717799897; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7U2GEJDooGtBOMNea0Sx/LkUioH+JkhObaaOLlcAmdc=;
        b=kHi2rvTdMac7ie9vgL6L9D+ok6Ya/YWIt9UTmxdf02IHqy2UkearqvAkHS3SJDJ5Dm
         9AEoMGhw4qoQuBX8tBMj0H/Hbr4KIJ/qhc7UqjCRHD0BQM7jiZK5hYmWzM5XYNO//h35
         JWLae6oOHYpnk0dm7Whg377/jhOXcUzB1ex/O9AmnDgvJrgogIvx+iw347sOeB9bGoBn
         t6ftbJDfdM0iX6K2fYfYbZ/0rbif8ObPa8bKjt71wq6SmW6fy0mi4kJ/oBHHZuDkiNvx
         Cgo69664YTklyv6q4MnPUXpikNt1ut5sXX1vjWjMdmOUyEghWCd8U8QjdtYupyGaBIhu
         noIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717195097; x=1717799897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7U2GEJDooGtBOMNea0Sx/LkUioH+JkhObaaOLlcAmdc=;
        b=Wllt3Teid+jCzqMdplO5N014bSv9TArjQTsIkPImPTFvtbl3AF3hdY6hLP/kKQnjBa
         ay5S4oiOY8mZmWo/HGl2Iu4fojbG4aKzlpDqa/VDKl/55kPMCRp1gngyHqgRjcFDsbxX
         UyMq9MeEtlA3NZKtsNGvRPQb/kurBBWIxe+u4rOLns5hhea7cspLZBgiB6KfQWT5dTSr
         ITRbqwYSNvROiV77CBUc2R/lBRs14lYpG/JEvqw798cM9Aw/o/pq4miGO1l3JkEigV35
         lpQdfAhGblL38anOJ0HLzbVAOOqxe61+eGNs4S6cOp3TMeOW7wcb8n4YUiKYf7+FDvF8
         eIbg==
X-Gm-Message-State: AOJu0YyhYcK6oeezwY5SiWoqB2PcXDCDxt1Pvyc4hXrW5fRo72KID6pR
	fAM4v0JK7udJZdjRl6eGkUotaBKFnlcQSs/ECbKibSs5LOkroFi28xgqFD0+9fw15I4pyNsVAMU
	80UkNwUV3jdhZ+9ikUYHPsK33EbdGi2Z4
X-Google-Smtp-Source: AGHT+IGJU+hvr4RA97fI7I+kytrm9AQJKaoDTL2kiZei8fIK0cV133acHxpJI/I1fqui6M7jJFqVvSUnCLd2yByZvD4=
X-Received: by 2002:a05:6512:480c:b0:523:90df:a9ce with SMTP id
 2adb3069b0e04-52b896c4ad3mr1954360e87.49.1717195096396; Fri, 31 May 2024
 15:38:16 -0700 (PDT)
MIME-Version: 1.0
References: <20240524160025.275450-1-martin.jansa@gmail.com> <2024053121292511bb731d@mail.local>
In-Reply-To: <2024053121292511bb731d@mail.local>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 1 Jun 2024 00:37:50 +0200
Message-ID: <CA+chaQfSvcVRQQLNQ08jZBkQWXKr-MS-4Z-NQnbMJc-tvmu2BQ@mail.gmail.com>
Subject: Re: [OE-core] [RESEND][PATCH] insane: add patch-status to default ERROR_QA
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 22:38:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200087

On Fri, May 31, 2024 at 11:29=E2=80=AFPM Alexandre Belloni
<alexandre.belloni@bootlin.com> wrote:
>
> ERROR: gitrepotest-1.0-r0 do_patch: QA Issue: Missing Upstream-Status in =
patch
> /home/pokybuild/yocto-worker/reproducible/build/build-st/meta-selftest/re=
cipes-test/gitrepotest/gitrepotest/0001-testpatch.patch
> Please add according to https://docs.yoctoproject.org/contributor-guide/r=
ecipe-style-guide.html#patch-upstream-status . [patch-status]
> ERROR: gitrepotest-1.0-r0 do_patch: Fatal QA errors were found, failing t=
ask.

https://lists.openembedded.org/g/openembedded-core/message/200086
should fix that.

Thanks,

>
> On 24/05/2024 18:00:25+0200, Martin Jansa wrote:
> > * it's enabled for patches in oe-core for very long time and I was usin=
g
> >   it for many other layers as well, so most layers should be in good
> >   shape
> >
> > * it's also possible to disable it for individual layer as shown
> >   by oe-core in:
> >   https://git.openembedded.org/openembedded-core/commit/meta/classes-gl=
obal/insane.bbclass?h=3Dscarthgap&id=3D61a881fdbe8b5a21c6276b8a5d06cc30486b=
1eb3
> >
> > Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > ---
> > Resend https://patchwork.yoctoproject.org/project/oe-core/patch/2024031=
4070903.83765-1-martin.jansa@gmail.com/
> > now when scarthgap is released and master is open for development
> >
> >  meta/classes-global/insane.bbclass | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/meta/classes-global/insane.bbclass b/meta/classes-global/i=
nsane.bbclass
> > index 99736830b9..6d2f83c6f7 100644
> > --- a/meta/classes-global/insane.bbclass
> > +++ b/meta/classes-global/insane.bbclass
> > @@ -45,11 +45,10 @@ ERROR_QA ?=3D "dev-so debug-deps dev-deps debug-fil=
es arch pkgconfig la \
> >              already-stripped installed-vs-shipped ldflags compile-host=
-path \
> >              install-host-path pn-overrides unknown-configure-option \
> >              useless-rpaths rpaths staticdev empty-dirs \
> > -            patch-fuzz \
> > +            patch-fuzz patch-status \
> >              "
> >  # Add usrmerge QA check based on distro feature
> >  ERROR_QA:append =3D "${@bb.utils.contains('DISTRO_FEATURES', 'usrmerge=
', ' usrmerge', '', d)}"
> > -ERROR_QA:append:layer-core =3D " patch-status"
> >  WARN_QA:append:layer-core =3D " missing-metadata missing-maintainer"
> >
> >  FAKEROOT_QA =3D "host-user-contaminated"
> > --
> > 2.45.1
> >
>
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#199853): https://lists.openembedded.org/g/openembed=
ded-core/message/199853
> > Mute This Topic: https://lists.openembedded.org/mt/106284256/3617179
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

