Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C48A7109C038
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:29:30 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44292.1774520968059154903
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:29:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=h2awnN5u;
 spf=pass (domain: gmail.com, ip: 209.85.222.174, mailfrom: alex.kanavin@gmail.com)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cd90401034so89340085a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 03:29:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774520967; cv=none;
        d=google.com; s=arc-20240605;
        b=lf1eLglkTaCXuTi3fs6bp3EFfcsi+BDTuvtBM2QvDLLLfZbTwFT+LTEMEZTuxYNGrd
         b1iOAJBlMbzSYZRoHPVw/z+zu5xisZWW2oqjU7mF2T3z/I0IDPMc0tzOj6EFpNdZ1O7L
         l47QUsEPIo6jdYwl/DdGnhGVrfiaGpRI0h6CW6u5fcep3j1MwxfyHRgGdtKY6HAz3xML
         GQZOq5bXGxMHHnluUC/OJPFMHe7YmY8xBG38YVGj1KMWBicFi79wGBkZy3wrb+AQxTCl
         REHj/o7NN8V1QfrdhYnXMqpaJDJgbYyXogTA5CdaWqngK4Xl76h3CwCoqjFiahBif8aP
         BNwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Qfw5axrLsdEctbYqsXNBQiwJdBNJh4AJ72pVrzIjSKc=;
        fh=zOep9SqjejgQxaETtgyUygOEBCp1Y/U8P8KeUTDWYZs=;
        b=SJfPAs75p5/DN9CJ1bv+QXUXtzn4SzUFhU0618z4YjpPK+FVmW7EA++boHzHnbIwDf
         rfWcQQIOse0vJWCXGBA3AoVdp8PKMKuFtgd7u1CyBXFfMSKMY5uFYi2szB+MG1h31Tj2
         NuES2zO2HjlFG68uNEEdwblIenlntWbcoJttBd2t9nRYKA9xhjSkKaihC4PajcS1+wWg
         rBF7ilIikrLngYfWVHqzbkC782P+0NfE5LqBdm4lJ9pw9O4cPubCiFKyHIjKNhiJixuA
         BATG/RA8QRUXW0uZ1UF2s/KsIPVRoHEMr4eyj30Z7fYgWA3z9g+q7T6KGGKsg030PdBO
         Gn5g==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774520967; x=1775125767; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Qfw5axrLsdEctbYqsXNBQiwJdBNJh4AJ72pVrzIjSKc=;
        b=h2awnN5ucC52zeEujhahtsHzx8bxMpCzNEvqyJmGJ3ZyBnbiMNpRhMY00u7UUUYRhA
         bXqecWEKdj4hFxrZxcF1Is+3asTFgARPeF4PBLizyKQCU28zda7mFPRVb9So9Gor+FSc
         HRMOapa4HWkd+cFgmBG1uVfWrALmsQ1UZX28UlZ0T/Ob9Axjauhl3rTihoJ3dR/XOZJ+
         +N7w1FCtqLzkG7N/v5luWNreMeffyrglaE+RRGPpb5/Yd6sOvdmkgOhhnHtYJ0nNG+GU
         k71D23tmPuZ9elO4IOavbFmuaBpnnjTBL/230ZZwMN/CB8z6Fbgq/EZj+k0R1rLYQogr
         NAew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774520967; x=1775125767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qfw5axrLsdEctbYqsXNBQiwJdBNJh4AJ72pVrzIjSKc=;
        b=AucLMzsMhLoSgySwHnYljS/bkEAZNcMEV/ZBUW00PtG6RCfK+z+OS+ukwneQ3pqQDp
         HYAANqqNp0JeI9QQ/EQEmm+rmvQZCbjxLjL+EgigT5J1e+EiQ/qpUD79uJ+7KD7L9uTJ
         r/+HAe+V1aiUmk6TBFHc/EUhMnR2EDLXOgKnjUDFpEe5yFxsknGidG04TLPtvAFm6iT3
         cQb+Q5BVoJPEIPnP4NjuuvmWc+CaJm0jr0Xdj7+N0CoZuz0z/S6ERmuhJpyYx3n94sbj
         ydN6Lr8Wvp8WlJJfQctLH8VsE11F+8I+UzNwSh7clsuyYTdwREJNwCFALreN9L2AlVEx
         yOiQ==
X-Gm-Message-State: AOJu0YykqS5uBx+wvEvN7kCvN4NesBY+hXbJbMY+dSrKvvaPZA+VzoEa
	KgsR379jclPmdDz0xy6V63U6ESs6vZUmh02GvhR4RSORij34EeGm+7ObN8IJL8KrhD/fDgRYpku
	AFhBTmqhwNy5PkVd/XRexQUD0lz9itDf4Ykgu
X-Gm-Gg: ATEYQzwdcStVarn5sJ7I6c5VsWZ/CYtJ/h9fkiblP8oPVh3ZGqzfFwUssUsMF9LJI3A
	yNIzfdxCkSE8c8CqWBqqIl96vnWdbZEor3aknCWtvGpIxe/JaBxzhLAYhUKPkcdoXVEFz4U2toK
	PLTTCkFsNb7mXYuv9WCxwNn8B/Zyw/KR4yerLn0kdjVlSb61TDGW2AaqjeFCax4gEDmYMJwm1ey
	lWMezDIw+5tfBaSZ7/QkLH6JaMTjNwm3mnbxIFEBIWaUT/rVI4SMmUTSULzFNzsm3Sb8fXAhVqY
	QWZKUV/GawWrE5s0DwdZPgFwVIR49NbqAaI5t8kcEQ==
X-Received: by 2002:a05:620a:4447:b0:8cf:c1c2:904 with SMTP id
 af79cd13be357-8d000ed6168mr978520685a.15.1774520966931; Thu, 26 Mar 2026
 03:29:26 -0700 (PDT)
MIME-Version: 1.0
References: <20260325022629.2245688-1-hongxu.jia@windriver.com>
 <CANNYZj9i9EFbo79nNPAtzXo03gLeJNC4qW-9Pp9u1UstvQp46g@mail.gmail.com> <065f08e8-e402-4379-8575-60621d4e6c63@windriver.com>
In-Reply-To: <065f08e8-e402-4379-8575-60621d4e6c63@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 26 Mar 2026 11:29:15 +0100
X-Gm-Features: AQROBzDCAaUotOsn_HWhFihl83Pybudt-oPv7DN6gUFqQxMOvEUpQBxoRn_U0Qo
Message-ID: <CANNYZj__ONSLGoJVDEXqes953gaFYH44SbXTNBHXHWDu3CKWQQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] python3-numpy: add cpu-optimization option
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:29:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233967

On Thu, 26 Mar 2026 at 11:19, Hongxu Jia <hongxu.jia@windriver.com> wrote:
> > Reading https://numpy.org/doc/stable/reference/simd/build-options.html,
> > I do not think setting disable_optimization to true by defailt is
> > correct. Currently, numpy will auto-detect the capabilities of target
> > machine, and configure itself accordingly. With this change, that auto
> > detection is compeltely turned off.
> >
> > Please explain the rationale for this change.
>
> In our case, we use `-cpu kvm64' other than `-cpu Skylake-Client
> -machine q35,i8042=off'
>
> QB_CPU_KVM:intel-x86-64 = "-cpu kvm64"

If that cpu doesn't support v3 (or even v2) features, then you should
not use the default x86-64 tune (that qemux86-64 is using and passing
to compilers) to enable them.

Alex

