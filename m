Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 318E6C43458
	for <webhook@archiver.kernel.org>; Wed,  8 Jul 2026 08:02:52 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3615.1783497765317909429
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jul 2026 01:02:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dIG+Ch3i;
 spf=pass (domain: smile.fr, ip: 209.85.128.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so2191935e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 01:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783497763; x=1784102563; darn=lists.openembedded.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mmdKLPtEqB+LrpzUJpmc2fsG8VkJtMUzPBW1qBxZLUg=;
        b=dIG+Ch3iFA8NJ5O5OdvKBSimB55DoBfCrZzQntsQhIZli+I8XbvN9tp9SqoLb1bVv8
         LG4KNtyuzMRyYvvTqUZNzXsQinbIxzH1Vk0Q5F1PgL60dvheeemMgQftipVXDjSzFqUx
         c2SYKZbk0THb5TQAXmANAKtJsQMCRWDKiOsiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783497763; x=1784102563;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmdKLPtEqB+LrpzUJpmc2fsG8VkJtMUzPBW1qBxZLUg=;
        b=q3h6d+A40Bsny4bcMyP6DUvdS392ZSzCv/pK+3bGfrIf0B4oSVzAC61muyr/Dm9+cj
         JJt47jtmlpXnpUigfBMrvSUK1cRPBESPcjRT7L8+vDeAIR5zig44YsXg1NZ4e9QOumxu
         L7eEXdZrXb5MA8LQK15PikCXDaEo0yWBRwy+pDF+V5Vd0CPHJ2wn0/m44L22XEomBsV4
         lyGaeshs31nOp8DEyQt9KkgcdIU8baY2BXIVNWtY9hX4MdcWQjNwYKChF4zzTwN/RC89
         FB2jWeYCXKczW43DDvCFuKhAA2lZC4AP/J8ygsgkxgAYW1NoRcETjvtFcLgdsnLYMflA
         F4NQ==
X-Forwarded-Encrypted: i=1; AHgh+RpRF78BKq9uUXZsT2jg7Ml2i0sG+94drQTA58YaOn9DV31vF8jNSwCUJNaRBo6VBTnhgF4N/j6fQM3GqQok7QSQZQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzF1vzLYiPbx3ZP2K84C0z2h4O4B3WWBoOj2LQfJHWm/dCXsLzS
	sDJLTJyv91iisLQrUTJPVye/DcDiqqCvHNXHu43T5wqXPZWYBVM7fcY0UpgFU630mUfgKZByRrn
	mQe10Akg=
X-Gm-Gg: AfdE7cmMsGGDlQtiB3Si1VNp210ktuhVaGojsbvFrwMdZLjkq35OWLsli8s2B69efvI
	XzD7o0DGfgkzL5lXE2a/hIrWF30v07TJiQ74cLRYxPOHyEHQ5EP7haEdGarkkyHkjQNwTLGulLa
	5lTFObXZ9TdjToJ/PRaKiPcC9hgFotC/UWIrSquZvKeTNlDcg2ZHnosNsR7OQPne4lgOmMjmcwg
	7q+KZeQs13OfRMituvOeVKNJJ90DIEOwSpUObIK5Cnf18PNvyYfCpgEp8ey54yHXB1NfPSUZd1/
	unGiOc+glrg2YyzSAEGgMvSwBPCGf67muTuZhpynkVV2gTRqMq8Cz1ALXCXqIyWkGyeZNztl3k8
	87GuoCEpg7pSxiJbtFHqMFs32KUjPzS3n/KG7ZKjoIowD87jorY4Err+rbplZ15Zhab+/07/sKn
	doD4fNZLDzXes2CD7ouLEjNUmKdto2izEopDLNPqdjOjV+rHCXEyrXEmxfS09jtgycU5E4An0f
X-Received: by 2002:a05:600c:6095:b0:493:c453:600f with SMTP id 5b1f17b1804b1-493e68aed40mr12265625e9.6.1783497763418;
        Wed, 08 Jul 2026 01:02:43 -0700 (PDT)
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0fbd355sm109944555e9.13.2026.07.08.01.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jul 2026 01:02:43 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 08 Jul 2026 10:02:42 +0200
Message-Id: <DJT16X7N36CR.1BPIMCZ6JTYS6@smile.fr>
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
In-Reply-To: <04e933b9ca2b95105e6fbbae44d2649f9c174c7b.camel@est.tech>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jul 2026 08:02:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240443

On Wed Jul 8, 2026 at 9:18 AM CEST, Roland Kov=C3=A1cs wrote:
> On Tue, 2026-07-07 at 15:45 +0200, Yoann Congal wrote:
>> Hello,
>>=20
>> On Tue Jun 30, 2026 at 10:25 AM CEST, Roland Kov=C3=A1cs via lists.opene=
mbedded.org wrote:
>> > CVE-2025-69649:
>> > =C2=A0 Null pointer dereference in readelf before 2.46 results in segf=
ault when
>> > =C2=A0 processing a crafted ELF binary with malformed header fields.
>> > =C2=A0 No evidence of memory corruption beyond the null pointer derefe=
rence, nor
>> > =C2=A0 any possibility of code execution, was observed.
>> >=20
>> > CVE-2025-69652:
>> > =C2=A0 Null pointer dereference in readelf when processing a crafted E=
LF binary
>> > =C2=A0 with malformed DWARF abbrev or debug information which leads to=
 SIGABORT.
>> > =C2=A0 No evidence of memory corruption or code execution was observed=
; the impact
>> > =C2=A0 is limited to denial of service.
>> >=20
>> > Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>> > ---
>> > =C2=A0.../binutils/binutils-2.42.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
>> > =C2=A0.../binutils/binutils/CVE-2025-69649.patch=C2=A0=C2=A0=C2=A0 | 3=
6 +++++++++++++++++
>> > =C2=A0.../binutils/binutils/CVE-2025-69652.patch=C2=A0=C2=A0=C2=A0 | 3=
9 +++++++++++++++++++
>> > =C2=A03 files changed, 77 insertions(+)
>> > =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2=
025-69649.patch
>> > =C2=A0create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2=
025-69652.patch
>> >=20
>> > diff --git a/meta/recipes-devtools/binutils/binutils-2.42.inc b/meta/r=
ecipes-
>> > devtools/binutils/binutils-2.42.inc
>> > index 1a865c45f4..da954fc138 100644
>> > --- a/meta/recipes-devtools/binutils/binutils-2.42.inc
>> > +++ b/meta/recipes-devtools/binutils/binutils-2.42.inc
>> > @@ -74,5 +74,7 @@ SRC_URI =3D "\
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://0030-CVE-2025-11840.patch=C2=A0\
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69647.patch=C2=A0\
>> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69648.patch=C2=A0\
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69649.patch=C2=A0\
>> > +=C2=A0=C2=A0=C2=A0=C2=A0 file://CVE-2025-69652.patch=C2=A0\
>> > =C2=A0"
>> > =C2=A0S=C2=A0 =3D "${WORKDIR}/git"
>> > diff --git a/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.pa=
tch b/meta/recipes-
>> > devtools/binutils/binutils/CVE-2025-69649.patch
>> > new file mode 100644
>> > index 0000000000..4865ad6535
>> > --- /dev/null
>> > +++ b/meta/recipes-devtools/binutils/binutils/CVE-2025-69649.patch
>> > @@ -0,0 +1,36 @@
>> > +From 9d26af3871d5b8f8dd9c6b17987845e1f774eac4 Mon Sep 17 00:00:00 200=
1
>> > +From: Alan Modra <amodra@gmail.com>
>> > +Date: Mon, 8 Dec 2025 15:58:33 +1030
>> > +Subject: [PATCH] PR 33697, fuzzer segfault
>> > +
>> > +	PR 33697
>> > +	* readelf.c (process_relocs): Don't segfault on no sections.
>> > +
>> > +CVE: CVE-2025-69649
>> > +Upstream-Status: Backport
>> > [https://sourceware.org/git/gitweb.cgi?p=3Dbinutils-gdb.git;h=3D66a349=
2ce68e1ae45b2489bd9a815c39ea5d
>> > 7f66]
>> > +
>> > +Signed-off-by: Roland Kovacs <roland.kovacs@est.tech>
>> > +---
>> > + binutils/readelf.c | 6 +++---
>> > + 1 file changed, 3 insertions(+), 3 deletions(-)
>> > +
>> > +diff --git a/binutils/readelf.c b/binutils/readelf.c
>> > +index 5e4ad6ea6ad..8c1987ffaec 100644
>> > +--- a/binutils/readelf.c
>> > ++++ b/binutils/readelf.c
>> > +@@ -8961,9 +8961,9 @@ process_relocs (Filedata * filedata)
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 size_t i;
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool found =3D false;
>> > +=20
>> > +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (i =3D 0, section =3D filedata->s=
ection_headers;
>> > +-	=C2=A0=C2=A0 i < filedata->file_header.e_shnum;
>> > +-	=C2=A0=C2=A0 i++, section++)
>> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 section =3D filedata->section_headers=
;
>> > ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (section !=3D NULL)
>> > ++	for (i =3D 0; i < filedata->file_header.e_shnum; i++, section++)
>> > +=C2=A0	{
>> > +=C2=A0	=C2=A0 if (=C2=A0=C2=A0 section->sh_type !=3D SHT_RELA
>> > +=C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 && section->sh_type !=3D SHT_RE=
L
>>=20
>> This backport is sensibly different from the upstream commit. Upstream
>> has a short for loop but your patch is at the start of a really long
>> one!
>>=20
>> Can you justify why your backport is safe & correct?
>>=20
>> Thanks!
>
> Yes, on 2.42 the formatted printing of relocations is in-line, while on 2=
.46 that code mostly has
> been moved into 'display_relocations()' as part of 8e8d0b63ff15896cc2c228=
c01f18dfcf2a4a9305.
> See:
> https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dblobdiff;f=3Dbinutil=
s/readelf.c;h=3Dfa0de3a7e0d9c2acc18fe047a7019e09f1ce3894;hp=3Dc1006480b7bc3=
e83dd87fb20d215342375614af9;hb=3D8e8d0b63ff15896cc2c228c01f18dfcf2a4a9305;h=
pb=3D31c21e2c13d85793b525f74aa911eb28700ed89c

This is a good explanation, can you add it to the CVE-2025-69649 patch
with the line you added (ie the "CVE: ", "Upstream-status:", ... lines)?

Thanks!

>
> Cheers,
> 	Roland


--=20
Yoann Congal
Smile ECS


