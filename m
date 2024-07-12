Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A2FC2BD09
	for <webhook@archiver.kernel.org>; Fri, 12 Jul 2024 14:52:02 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.web10.9661.1720795913109436668
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Jul 2024 07:51:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ACn1E2NX;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-25cba5eea69so990398fac.2
        for <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 07:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720795912; x=1721400712; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7RT/MpQdhGghmEGNLQqgi90YdIfFegLcnK8GE8zVzs=;
        b=ACn1E2NXF5f3U6KUCejmLtZqp5cTKPHqrwmLwhOFYdAtxHYL+NHa7CZ2JmQyd9OvZH
         JV0mUvL4IPslBU4d52jgr4tY7uaAwPQVeaKRY/CYD84ZJP40DwwNcT5mmQvS79Yu5QVv
         19cjt+yE7V9rKvKFoMKzvccK9k2OhjGLPfOvYuUrumwdBKOZEYAMGUzPBZkYujeZD1Qx
         2iLXTQ/XpLjxl2CdxCPy7s5jII33n2uXH80UMHC2uLAeUmheowkVARJP9qU6qhEPZ39K
         34+bSQYLRV21wCiT49fz3Mpfr2XSFD/H8QUCZkxo3CYXMxlGH95WoqFDuzqI79cMaW6x
         jPHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720795912; x=1721400712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=w7RT/MpQdhGghmEGNLQqgi90YdIfFegLcnK8GE8zVzs=;
        b=JCzhD+BqifInBUJ4l3OIe+1p4TW6bIRlX2jGOeLB9iiAkUOGswEiyExtCul/vHU513
         xxXqk33p9e8/ZUXMfU0rccb86Kud8VWiwhICPfwjaO3aVcrC4SqlBJM4FZMneNUIb9hU
         88xvuqcRvnkLfmHCo9hPVWw8YZi5KwX4xqtH5kwesgT7kCU78KxwMmB2dV+cmYlIlN2b
         MqnP8/p/PRgzyos37HeuEhgdGtVZwHWZ2W7jMCGJtkrI3gPu0lTo9zFn3RKSQYL4YvSR
         y6LmXkVBkhUtMb9qViCK4Zy00DRut3TCYAgPn8r9f4uUuzsIaNg7tg1OKUpwbTVFlSrF
         DlKA==
X-Gm-Message-State: AOJu0Yz0Faa8JnLJ99CFQj0YWS2ThoABvQftMxhmV+z55tnEu1/ZivIa
	Dn3EcXp1do8CeKt5HTuU0aXnaLfjnOS9R6lrqYwANF3QLGDig4Yt48S8dJXwEzYNMgRbRkuNb0u
	bwMPm13Q9BG6N+HIpK2EBwsNyC1Q=
X-Google-Smtp-Source: AGHT+IEILWqP0l52dP5wgy9Zq3lwejn9D/l9NkNs7ElWiU5/sT0vCzm3LsYAxD+CFvCZtFzk3mAaPivv/C4U7BQAEhQ=
X-Received: by 2002:a05:6870:5686:b0:254:a588:ba9b with SMTP id
 586e51a60fabf-25eaebdb1d1mr9692248fac.36.1720795912248; Fri, 12 Jul 2024
 07:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <20240711234203.3841594-1-raj.khem@gmail.com> <20240711234203.3841594-2-raj.khem@gmail.com>
 <A5091FD3-1B02-4D5B-BAD7-7389678E211A@arm.com>
In-Reply-To: <A5091FD3-1B02-4D5B-BAD7-7389678E211A@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 12 Jul 2024 07:51:26 -0700
Message-ID: <CAMKF1sr3UO4FLDt6+t43bLLa4fVrnyZyQn69MvMLELDx9b=OSQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/2] arch-arm64: Use neoverse-v1 ISA for Qemu usermode
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Jul 2024 14:52:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201831

On Fri, Jul 12, 2024 at 6:26=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 12 Jul 2024, at 00:42, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >
> > With latest qemu several places where qemu-usermode is used e.g.
> > nodejs, qtwebengine, chromium, the builds are failing form armv8a
> > tuned machines (e.g. tegra) which is due to qemu crash ( SIGILL )
> > encoutered when 'max' ISA is used ( which is default ), max seems
> > to use neoverse-n2 equivalent features, which is evident that SIGILL
> > also happens when using -cpu neoverse-v2, therefore explicitly select
> > neoverse-v1 for ISA, which works and covers almost all (if not all)
> > cpu tunes for armv8 we have.
> >
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > meta/conf/machine/include/arm/arch-arm64.inc | 5 +++++
> > 1 file changed, 5 insertions(+)
> >
> > diff --git a/meta/conf/machine/include/arm/arch-arm64.inc b/meta/conf/m=
achine/include/arm/arch-arm64.inc
> > index 832d0000acb..9639911d33b 100644
> > --- a/meta/conf/machine/include/arm/arch-arm64.inc
> > +++ b/meta/conf/machine/include/arm/arch-arm64.inc
> > @@ -42,3 +42,8 @@ TARGET_FPU =3D "${@bb.utils.contains('TUNE_FEATURES',=
 'aarch64', '${TARGET_FPU_64}
> > # support these they're meaningless NOP instructions, so there's very l=
ittle
> > # reason not to.
> > TUNE_CCARGS .=3D "${@bb.utils.contains('TUNE_FEATURES', 'aarch64', ' -m=
branch-protection=3Dstandard', '', d)}"
> > +
> > +# Fix qemu-user crashes while building nodejs/chromium/qtwebengine, de=
faults ISA is max and it generate SIGILLs
> > +# qemu: uncaught target signal 4 (Illegal instruction) - core dumped
> > +# Select the superset ISA
> > +QEMU_EXTRAOPTIONS_armv8a =3D "-cpu neoverse-v1=E2=80=9D
>
> This is definitely the wrong place for this.  What machine are you using =
here? Can you get a gdb to identify what the instruction failing is?
>

Looked more into it last night. it happens only with clang/trunk seems
to work with binaries built with gcc and clang18 , I guess hold on to
it, until further triage.

> Ross
>

