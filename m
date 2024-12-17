Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D72E7717F
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 21:20:00 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.web11.92319.1734470392534032335
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Dec 2024 13:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FXUX6H2p;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-29fae583cc8so71752fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 13:19:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734470392; x=1735075192; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLYm2PqSh2qh54+Ggm1mRuGPQ2qB0s3Vn14cP4yjwFc=;
        b=FXUX6H2pFxyAM4Lpn/qYSGs4mruTQ2p/1+yK1azQ1g/8G547IMlCVTiHwwLlKYHc3T
         0Bz9oSZDmj0hkEBDX4NAeor0tQfvp1Cknas2ILmXmhJk12XNyYvjU6FuOnf8j76bf89R
         oiJA7db+rL/ZF+Plzs3tsZy8JHoYx+PoaVJyLU9RSm+Z+q1TzlazX9UK4fRrABdBbvZ5
         MjfkuAIZdcm5z+p7Y7Y1pSYKR8m8yfZHUcgUA1dNVwB2EPXsiwiZsjKMuz9del1e/+7K
         Bq1wX6RqXHeJYSrjRIr+ticyLMGm7n2phmUGIXz+esaRgEmhpXKpxCIR+cG2plTXfaFr
         KQRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734470392; x=1735075192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MLYm2PqSh2qh54+Ggm1mRuGPQ2qB0s3Vn14cP4yjwFc=;
        b=posnyySVENohgdvqeX5QcfApt6daQcZ7oyUrZjalnu7LeAwP/sO4X8ae0eJ4qoa/+5
         BORsiC4R8/drT7PCgZgjDJThj99HngKYgQvmohZpPY1RLA1OtVJDQgiOQeeoDHFQTIWz
         2FwpKynbHRbqFLNDn5QfYrs0UKpSFMTUIN1abhA6aKBG5XZRTZ0Z4apdksdR7x3maP5D
         lWqXzhRdqNHmyVRMJLpz14VVUzji/CJy0f0kGk0WG2cz/LmnTbK9SUOaF8LQRZU1N5Ru
         ClsEPVp/5SG/pVYVVbv44rKTAJJgdCntL/dvxtaIoK6EQ0LKCbVDKruVyo6rOMtrDYmV
         6tXA==
X-Forwarded-Encrypted: i=1; AJvYcCW0xfoCdmviNzjhu0T4wRzAhl3/FDXBxmtZ7bPZS7GjMghcM8smDivXctOX0wr7C9XV7MObNT4LtBOTdPkmdLWcRA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw1ccQxATW40k/CphcD1bjjRg1QuZgf/5JyZ1NBU8sVSatXV3A0
	eC+nCE2HoWTF97e7zx06WM4XoVmwXukDUAC1mesiCzz1FgcD+NAxwpzSCz6v43vmal1yZjXnsjr
	CW9i0q6u8ub3mw7OSwxOJe2DFKIg=
X-Gm-Gg: ASbGncuMVcizSmRf19QP6P+TWVOSNJjZC8iXdfkSa+MkHc4a/iP30f+O3QpIlylg2p2
	egbUi7d2D3mAy4zMXNP2EZgIWvxvfVL3yd9lNUD3ZfPQ8OEIOhXmhKuFCS6Emm+CoXg==
X-Google-Smtp-Source: AGHT+IGHP4zZXJp0ut1vOW5+QDuEZAwvVR90sUTkaubpHFoipCGK8l1Xfb48Qdfqmp02NYACzJe7AIJ94iCJYGXC/q8=
X-Received: by 2002:a05:6870:3924:b0:297:2955:b009 with SMTP id
 586e51a60fabf-2a7b34a4956mr193030fac.1.1734470391669; Tue, 17 Dec 2024
 13:19:51 -0800 (PST)
MIME-Version: 1.0
References: <20241217104729.4115134-1-bin.lan.cn@windriver.com>
 <CAMKF1so72XWNdOaF0MFYJrAC7SLrx7TWDHiCO2iSybj6ksc_Yw@mail.gmail.com> <d88044d0365ce088f4d983c83e870803b30697d7.camel@linuxfoundation.org>
In-Reply-To: <d88044d0365ce088f4d983c83e870803b30697d7.camel@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Dec 2024 13:19:25 -0800
Message-ID: <CAMKF1spv5mbu74pM_5jxTCyHLrZb5SefLEJ45ZXiLjhFrSTH6g@mail.gmail.com>
Subject: Re: [OE-core][PATCH] gcc: backport patch to fix data relocation to
 !ENDBR: stpcpy
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: bin.lan.cn@windriver.com, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 21:20:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208857

On Tue, Dec 17, 2024 at 1:14=E2=80=AFPM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> On Tue, 2024-12-17 at 09:20 -0800, Khem Raj via lists.openembedded.org wr=
ote:
> > On Tue, Dec 17, 2024 at 2:47=E2=80=AFAM Bin Lan via lists.openembedded.=
org
> > <bin.lan.cn=3Dwindriver.com@lists.openembedded.org> wrote:
> > >
> > > There is the following warning when building linux-yocto with
> > > default configuration on x86-64 with gcc-14.2:
> > >   AR      built-in.a
> > >   AR      vmlinux.a
> > >   LD      vmlinux.o
> > >   vmlinux.o: warning: objtool: .export_symbol+0x332a0: data relocatio=
n to !ENDBR: stpcpy+0x0
> > >
> > > This change set removes the warning.
> > >
> > > PR target/116174 [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=3D1161=
74]
> > >
> > > Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> > > ---
> > >  meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
> > >  ...ch-to-fix-data-relocation-to-ENDBR-s.patch | 447 ++++++++++++++++=
++
> > >  2 files changed, 448 insertions(+)
> > >  create mode 100644 meta/recipes-devtools/gcc/gcc/0027-gcc-backport-p=
atch-to-fix-data-relocation-to-ENDBR-s.patch
> > >
> > > diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-de=
vtools/gcc/gcc-14.2.inc
> > > index 4f505bef68..a25bc019e5 100644
> > > --- a/meta/recipes-devtools/gcc/gcc-14.2.inc
> > > +++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
> > > @@ -69,6 +69,7 @@ SRC_URI =3D "${BASEURI} \
> > >             file://0024-Avoid-hardcoded-build-paths-into-ppc-libgcc.p=
atch \
> > >             file://0025-gcc-testsuite-tweaks-for-mips-OE.patch \
> > >            file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patc=
h \
> > > +           file://0027-gcc-backport-patch-to-fix-data-relocation-to-=
ENDBR-s.patch \
> >
> > tiny nit.
> > is this tab vs spaces ? can you fix this.
>
> Looks to be in the original file rather than an addition by this patch :/=
.

sadly yes.

>
> Cheers,
>
> Richard

