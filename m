Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C05F0C43334
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 11:19:57 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web10.36822.1656674395543968980
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:19:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Kbw8JLgO;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.52,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f52.google.com with SMTP id cl1so2751812wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Jul 2022 04:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=TYGb4gzjtQfM3YGq2YR5MPRTpF0IhYcc44uNKQpMcNE=;
        b=Kbw8JLgOhmBIWBhkoNoHNfKz9OL3FWkRFGpr/TF5Wr+aY2q0CvzxkwjGHNuKQV8yd5
         X6kjY27/t96d0PhPD2ExA4cp8q7PXgIaOuUulSIfQRydsNN0pxwAep5ueUM3RsoRaSRE
         B6GdjcItBWsFkgmzqBsQDRiuzZb7APPGsPQuE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=TYGb4gzjtQfM3YGq2YR5MPRTpF0IhYcc44uNKQpMcNE=;
        b=x8yNjaBEO21iBdTakbgdq0xzizTKbdLdFyEQKcGVCu4ufr84WTJ+YLP+9KzESjC/mg
         XuE4acZDu12P/g3jB4pxycm3a0Po5rV7mfobsK69yASIrYFmoKl/T2cF+CtrZJ+IBZGE
         LwVwxrdtzgfh85kUw9VxGMFPy8vCFTMo3xvwbko4C2utLLc3BSS/MTsuiXybsJb7oqdy
         Hz0+W+vudDrwvCOFMCByEQHqv5hQWlxiA/oyp8X++2t79U/jbTX814RNoUikgSff8d1g
         yELJcqaufhFYeG7/oEc1/QoVOfg5Mpe7gb2UaSNu66mo2QSY+sGx/EAFeYB2kI8cp8gf
         OYiQ==
X-Gm-Message-State: AJIora/xsvBew/dtOWuqKtQh70jLEZ5ECfdKNt2OEW2TnWI5pFeC5/Rf
	Q85uaNSNwnqOJTETkp39UjESfg==
X-Google-Smtp-Source: 
 AGRyM1tk1pwhQmOEcL0ysVfZGxFter5OpxhR2/Oy3gYWYRLZKGyvJzmBm3vEIoWj58GwT2WJpUlfig==
X-Received: by 2002:a05:6000:607:b0:21b:855f:c6d4 with SMTP id
 bn7-20020a056000060700b0021b855fc6d4mr13194791wrb.158.1656674393816;
        Fri, 01 Jul 2022 04:19:53 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a49f:615b:a613:6a47?
 ([2001:8b0:aba:5f3c:a49f:615b:a613:6a47])
        by smtp.gmail.com with ESMTPSA id
 v192-20020a1cacc9000000b003975c7058bfsm10114078wme.12.2022.07.01.04.19.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 04:19:53 -0700 (PDT)
Message-ID: 
 <a50e0d9b15a796c39b77b9b765084a093da489bd.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] package.bbclass: Fix base directory for
 debugsource files when using externalsrc
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jose Quaresma <quaresma.jose@gmail.com>, Alejandro Hernandez Samaniego
	 <alhe@linux.microsoft.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 01 Jul 2022 12:19:52 +0100
In-Reply-To: 
 <CANPvuR=RZJALd-1jx-yULntdcjUSyDBpaMdakXWmqetXOa6Zyg@mail.gmail.com>
References: <20220701020939.62295-1-alhe@linux.microsoft.com>
	 <CANPvuR=RZJALd-1jx-yULntdcjUSyDBpaMdakXWmqetXOa6Zyg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Jul 2022 11:19:57 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/167454

On Fri, 2022-07-01 at 12:05 +0100, Jose Quaresma wrote:
> Hi Alejandro,
>=20
> Alejandro Hernandez Samaniego <alhe@linux.microsoft.com> escreveu no dia =
sexta, 1/07/2022 =C3=A0(s) 03:09:
> > While executing do_package, bitbake checks for a list of
> > debug source files and uses a pattern to match the ones
> > to be included in copydebugsources.
> >=20
> > Previously when externalsrc was in use either directly or by
> > using devtool, the source location changed and this pattern
> > no longer matched, hence debug source files failed to be
> > included in the corresponding package.
> >=20
> > Check when the source directory isnt the default (based on
> > WORKDIR), and change the pattern used to match debug source
> > files if that is the case, allowing us to perform do_package
> > properly.
> >=20
> > Workaround debugsource.list containing paths from the host by
> > moving debug source files away from the host directory
> > structure=C2=A0 to avoid host contamination (this seems to happen
> > when packages use $TMPDIR/work-shared and externalsrc is
> > in use).
> >=20
> > Test matrix included using:
> > - devtool to use externalsrc automatically
> > - externalsrc with a non-devtool based source directory
> > - No externalsrc at all
> > Tested the following packages to be working:
> > - glibc ($TMPDIR/work-shared based)
> > - libxcrypt ($TMPDIR/work based)
> >=20
> > [YOCTO 8015]
> >=20
> > Signed-off-by: Alejandro Enedino Hernandez Samaniego <alhe@linux.micros=
oft.com>
> > ---
> > =C2=A0meta/classes/package.bbclass | 31 ++++++++++++++++++++++++++++---
> > =C2=A01 file changed, 28 insertions(+), 3 deletions(-)
> >=20
> > diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclas=
s
> > index 62050a18b8..4850134022 100644
> > --- a/meta/classes/package.bbclass
> > +++ b/meta/classes/package.bbclass
> > @@ -553,13 +553,25 @@ def copydebugsources(debugsrcdir, sources, d):
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0strip =3D d.getVar("STRIP")
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0objcopy =3D d.getVar("OBJCOPY")
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workdir =3D d.getVar("WORKDIR")
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sdir =3D d.getVar("S")
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sparentdir =3D os.path.dirname(os.path.dir=
name(sdir))
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 sbasedir =3D os.path.basename(os.path.dirn=
ame(sdir)) + "/" + os.path.basename(sdir)
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workparentdir =3D os.path.dirname(os.=
path.dirname(workdir))
> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0workbasedir =3D os.path.basename(os.p=
ath.dirname(workdir)) + "/" + os.path.basename(workdir)
> >=20
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # If S isnt based on WORKDIR we can infer =
our sources are located elsewhere,
> > +=C2=A0 =C2=A0 =C2=A0 =C2=A0 # e.g. using externalsrc; use S as base fo=
r our dirs
> >=20
>=20
>=20
> This doesn't=C2=A0seem very safe imo, if the idea is to check if the exte=
rnalsrc in use it is better using:
>=20
> if bb.data.inherits_class('externalsrc', d):

The code is generic enough that if the source is outside WORKDIR, it
should work so I'm not sure it makes sense to gate this on externalsrc
only though...

Cheers,

Richard



