Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB36DC43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 08:39:46 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3971.1783499985886391879
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 01:39:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Z7Qzco/l;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-493c2b3dc8bso2355585e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 01:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783499984; x=1784104784; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=70CeRhm7q84c9JN5XB2Pw/PwpgbBhxB6xie8KW693a8=;
        b=Z7Qzco/ltYJOZDDsClC1nri6e37CViafuyQG89mY18EHfNH8jF5gp/leu+T+NThQQR
         aCMYGNn2EekwfqeXfUr3XE+Zwri34ln2tdgr6Vw+wnQtDmUB71P63TWPFQHnhzvtZOJG
         JYZK/33MNnS+Gq/S3Z0fFh/58aKKR0tKpUXEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783499984; x=1784104784;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=70CeRhm7q84c9JN5XB2Pw/PwpgbBhxB6xie8KW693a8=;
        b=F5h0Sc2RrlttZK1jL4qLzG4T1n9deIx2hAkYvZyX1mdJPLfNR1+DmueQiGT59swvN9
         y4mLNgJewGjJ8nJ6EhkIlzWTHp5WCUroHZ5kIJWp7LUgRtRdQ0GYP7XrQ3yFe/N/TEbp
         UC+jwcxho7jYUCzyCk3nWOU3+40Rm56cV1Kt/hcXtwtDo/AR94l4c38uKm4GtAx3+ju8
         LvxG1iE3ZXQi/5zBAny9FQbpwSy5QB7HU80oyXWSONpZ8GNFAok9h2i+kUlHKl6u9pr4
         xiKYu9+28v/LE47JVSFNnOCrwWimMBNj3QFTNU6ZMA5dDgaOlNbqtyyg5v5U3OGKbFMc
         x17Q==
X-Forwarded-Encrypted: i=1; AHgh+RpUHJvFFO0rWeuHpZfbca/t8+A4gHvP+P8ubmNVcZwxmWjgCqZ45g8Uxr3KSBXjIHW2iPlhBRwVhJa9c+YVJ+NzXg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx4snTznjEW+j8KhLdOApqkpy+MGHHhzTuJos+xXYZmIK2QEyQ4
	5yLetDLN95eKBmCYgFQllwNCt1rrpgndcDhFn1pNhewVhgbEzUH2tHJzDCDceOn4QHU=
X-Gm-Gg: AfdE7ckQcV8EXWU2WSMHoG6pFS9v8f/DfWc4uXtQ0u563orDwsQ5ERWfBj2COO8LUzq
	moC+5ruLbsjPGjkFXcO6yt8hDP89eXbtH0Olo5PU2lWPU74nPCPv8Bt95HVWcgcgQyXmGHu4z3i
	Jl+TQqPJDNyZYWmN1WRPVQjaATMydsaf2siN3H6dz0qA0db3zuLHW0q/mHqYwzKZlvA4JMtvjkT
	YdLsm5zT7bwGvEV2yi72Y+sWyM4O67VSQk4+W+arnfCCz+elkQmOPs3boQwXBKBrkUOXQNg6pi/
	D/t98lONXAB+TY60/1j8ygr18OgN9cE16jqDkwzPWHu81aXUerFWc2XxBEFJMYq0w7SLvlJUExK
	Cf8gEin5cbnZnlax6GSlVSM+0WFAp3mcVPL7ZxpPGcSvymkwxvqYWwou/SbT1GwQhpCQKt7i13n
	Qj2YHiYxwUyz9bGv3VHJ63Z5+ZiFXe6rpmVIRIfaNdY7qP27rJKPpbRqfwlbUVGBzUba7VfW7t
X-Received: by 2002:a05:600c:3e07:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-493e689864cmr14951665e9.5.1783499983887;
        Wed, 08 Jul 2026 01:39:43 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47ad69519c2sm43968100f8f.37.2026.07.08.01.39.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:39:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 10:39:43 +0200
Message-Id: <DJT1Z9BJXTK8.3PJA76NWHMOCL@smile.fr>
Subject: Re: [OE-core] [scarthgap][PATCH] binutils: fix CVE-2025-69649, and
 CVE-2025-69652
From: "Yoann Congal" <yoann.congal@smile.fr>
To: =?utf-8?q?Roland_Kov=C3=A1cs?= <roland.kovacs@est.tech>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20260630082509.34865-1-roland.kovacs@est.tech>
 <DJSDUQYWTQ41.S7H4ENLDNW1R@smile.fr>
 <04e933b9ca2b95105e6fbbae44d2649f9c174c7b.camel@est.tech>
 <DJT16X7N36CR.1BPIMCZ6JTYS6@smile.fr>
 <5eb956fac5f1951f0f5ddea5a3745f1409caef4d.camel@est.tech>
In-Reply-To: <5eb956fac5f1951f0f5ddea5a3745f1409caef4d.camel@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240445

On Wed Jul 8, 2026 at 10:15 AM CEST, Roland Kov=C3=A1cs wrote:
> On Wed, 2026-07-08 at 10:02 +0200, Yoann Congal wrote:
>> On Wed Jul 8, 2026 at 9:18 AM CEST, Roland Kov=C3=A1cs wrote:
>> > On Tue, 2026-07-07 at 15:45 +0200, Yoann Congal wrote:
>> > > Hello,
>> > >=20
>> > > On Tue Jun 30, 2026 at 10:25 AM CEST, Roland Kov=C3=A1cs via lists.o=
penembedded.org wrote:
>> > > > CVE-2025-69649:
>> > > > =C2=A0 Null pointer dereference in readelf before 2.46 results in =
segfault when
>> > > > =C2=A0 processing a crafted ELF binary with malformed header field=
s.
>> > > > =C2=A0 No evidence of memory corruption beyond the null pointer de=
reference, nor
>> > > > =C2=A0 any possibility of code execution, was observed.
>> > > >=20
>> > > > CVE-2025-69652:
>> > > > =C2=A0 Null pointer dereference in readelf when processing a craft=
ed ELF binary
>> > > > =C2=A0 with malformed DWARF abbrev or debug information which lead=
s to SIGABORT.
>> > > > =C2=A0 No evidence of memory corruption or code execution was obse=
rved; the impact
>> > > > =C2=A0 is limited to denial of service.
>> > > >=20
>> > > > Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>> > > > ---
>> > > > =C2=A0.../binutils/binutils-2.42.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> > > > =C2=A0.../binutils/binutils/CVE-2025-69649.patch=C2=A0=C2=A0=C2=A0=
 | 36 +++++++++++++++++
>> > > > =C2=A0.../binutils/binutils/CVE-2025-69652.patch=C2=A0=C2=A0=C2=A0=
 | 39 +++++++++++++++++++
>> > > > =C2=A03 files changed, 77 insertions(+)
>> > > > =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/C=
VE-2025-69649.patch
>> > > > =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/C=
VE-2025-69652.patch
>> > > >=20
>> > > > diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/me=
ta/recipes-
>> > > > devtools/binutils/binutils-2.42.inc
>> > > > index 1a865c45f4..da954fc138 100644
>> > > > --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
>> > > > +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
>> > > > @@ -74,5 +74,7 @@ SRC_URI =3D "\
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0030-CVE-2025-11840.patch=C2=
=A0\
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69647.patch=C2=A0\
>> > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69648.patch=C2=A0\
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69649.patch=C2=A0\
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69652.patch=C2=A0\
>> > > > =C2=A0"
>> > > > =C2=A0S=C2=A0 =3D "${WORKDIR}/git"
>> > > > diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-6964=
9.patch b/meta/recipes-
>> > > > devtools/binutils/binutils/CVE-2025-69649.patch
>> > > > new file mode 100644
>> > > > index 0000000000..4865ad6535
>> > > > --- /dev/null
>> > > > +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
>> > > > @@ -0,0 +1,36 @@
>> > > > +From 9d26af3871d5b8f8dd9c6b17987845e1f774eac4 Mon Sep 17 00:00:00=
 2001
>> > > > +From: Alan Modra <amodra@gmail.com>
>> > > > +Date: Mon, 8 Dec 2025 15:58:33 +1030
>> > > > +Subject: [PATCH] PR 33697, fuzzer segfault
>> > > > +
>> > > > +	PR 33697
>> > > > +	* readelf.c (process_relocs): Don't segfault on no sections.
>> > > > +
>> > > > +CVE: CVE-2025-69649
>> > > > +Upstream-Status: Backport
>> > > > [
>> > > > https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D66a=
3492ce68e1ae45b2489bd9a815c39ea
>> > > > 5d
>> > > > 7f66]
>> > > > +
>> > > > +Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>> > > > +---
>> > > > + binutils/readelf.c | 6 +++---
>> > > > + 1 file changed, 3 insertions(+), 3 deletions(-)
>> > > > +
>> > > > +diff --git a/binutils/readelf.c b/binutils/readelf.c
>> > > > +index 5e4ad6ea6ad..8c1987ffaec 100644
>> > > > +--- a/binutils/readelf.c
>> > > > ++++ b/binutils/readelf.c
>> > > > +@@ -8961,9 +8961,9 @@ process_relocs (Filedata * filedata)
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
>> > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool found =3D false;
>> > > > +=20
>> > > > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0, section =3D filedat=
a->section_headers;
>> > > > +-	=C2=A0=C2=A0 i < filedata->file_header.e_shnum;
>> > > > +-	=C2=A0=C2=A0 i++, section++)
>> > > > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section =3D filedata->section_hea=
ders;
>> > > > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (section !=3D NULL)
>> > > > ++	for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++=
)
>> > > > +=C2=A0	{
>> > > > +=C2=A0	=C2=A0 if (=C2=A0=C2=A0 section->sh_type !=3D SHT_RELA
>> > > > +=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && section->sh_type !=3D SH=
T_REL
>> > >=20
>> > > This backport is sensibly different from the upstream commit. Upstre=
am
>> > > has a short for loop but your patch is at the start of a really long
>> > > one!
>> > >=20
>> > > Can you justify why your backport is safe & correct?
>> > >=20
>> > > Thanks!
>> >=20
>> > Yes, on 2.42 the formatted printing of relocations is in-line, while o=
n 2.46 that code mostly
>> > has
>> > been moved into 'display_relocations()' as part of 8e8d0b63ff15896cc2c=
228c01f18dfcf2a4a9305.
>> > See:
>> > https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbinu=
tils/readelf.c;h=3Dfa0de3a7e0d9c2acc18fe047a7019e09f1ce3894;hp=3Dc1006480b7=
bc3e83dd87fb20d215342375614af9;hb=3D8e8d0b63ff15896cc2c228c01f18dfcf2a4a930=
5;hpb=3D31c21e2c13d85793b525f74aa911eb28700ed89c
>>=20
>> This is a good explanation, can you add it to the CVE-2025-69649 patch
>> with the line you added (ie the "CVE: ", "Upstream-status:", ... lines)?
>>=20
>> Thanks!
>>=20
>
> I see it already pulled in on -nut:
> https://git.openembedded.org/openembedded-core-contrib/commit/?h=3Dstable=
/scarthgap-nut&id=3D3c3635eed24731a99d0cc9a3570415cd4b096433
>
> Do you want a v2 and fixup on nut, or just a patch on top of the pushed c=
ommit to add the extra
> info?

A v2 with the fixup integrated into it (ie. 1 patch only) please.

Thanks!

>
>> >=20
>> > Cheers,
>> > 	Roland
>>=20


--=20
Yoann Congal
Smile ECS


