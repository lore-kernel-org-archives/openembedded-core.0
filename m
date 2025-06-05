Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDCD6C5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 15:25:10 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web11.10647.1749137101809357517
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 08:25:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YICd1WIk;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e2b601a6bso11441457b3.0
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 08:25:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749137101; x=1749741901; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x9QldGxejU6kixN+oEi1HgXaEdEcDE7bHvDq6g7uiK8=;
        b=YICd1WIko6YV+VPTx+8ApQAoCNiR6mYr6JUaxG3xSXcFdZSikuSYvRmbxjII1mUVH+
         n8jMoYGEpb7Q4glfEAJ9hCw5PnRYknefTuj9hi6MoT+ZDlS7niT4mkWRoHPGIOWpza/a
         cdFNWsnUfKk7XKXHhIwGEAoGFEMZZ5+L8A3JB6/OlwuALkZn90+3cYBihRbaUCJUemxk
         bj6uKqjSlD5dtLiq50IuptOhAHs8WkvHD6pmMc8/6Zc2BLrm9DecN1WMT59BHy+0rQln
         9PTeHEgFucnyDj/UTu/ZrKOyEU9BMAnm2pDV/BMKAszgseOmuXM6+quCt5oVWGRNO9Pj
         TFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749137101; x=1749741901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x9QldGxejU6kixN+oEi1HgXaEdEcDE7bHvDq6g7uiK8=;
        b=Juim4ur9460FbJb1piqHuD0QTGXnUA5D0rGMUJhAbc4vDMdhJfyiJwaP6MKr3BAIEM
         +VRwN3OOd2A97cONamAOg1TDLezPA0zPMxcLBBfqEqerzYuOPUJdr+Cou5LifobYbGtp
         KyYOepKDh3bYAyBC99W2olfR8RUG+4CfD40xcLdoOAscwZ5NG3Dz3jJZlHBw/I+GwKkI
         /2L57mwKElgdv4vIAy2Y9n2utVy0atY2v/l5tEBDErRh64cZs219C+OOcQ9JXNxSyoMT
         GiSUa/OcTc5LvMXS0tSfYIqkz1XBG0/LQX308OZBRjGKC24Fxgv5i+3rUqKZ7rn0YUBE
         Kydw==
X-Forwarded-Encrypted: i=1; AJvYcCUskJmAGZdD/fbbooy2uegNo6h7Yf+RDjyAKVhODrfpPyX8IAp97rUyG+i333/7PfFZ9KObX9rsosKMMWfsICDvbw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yx6R+sAvZfl1nS9sajteVMs5duFWA53+CxQf7XjpeYxKKPtr2tl
	C8SEZgAb9nPoW03x0GFr0/2TO3+oHjzD5lO5WdPmno7h5ViLqxyP6gITj3U6k6Rx3HfZTM3T2ML
	PZc/+x56KCa12lXnEVIWu7OA/9XeZlKDNZpKLty8=
X-Gm-Gg: ASbGncsQXyUL8lVBPzKHnaqZ6aKSzYbu/6cxZdfhRDDaOuVgk3p38x03IiN1wYyr7IX
	FpPMKLh0mad7878p9/9jPQt8bNHbt39/7xmSPer8OKqsG29R8QeeS23MQo6H3uDxvdLPgnOYd98
	auUsx/T4Q+wwRi5FvvaYAcI3Y2YA/FIEg=
X-Google-Smtp-Source: AGHT+IHWRy5NerYPsPT7HeI4wzel4f5ivl9BrFZMvS0YB45OQ+qL5iHPD4rZoyVdGalgha7LMGbASQfWObLZSTLO5VI=
X-Received: by 2002:a05:690c:4d81:b0:70f:83ef:de26 with SMTP id
 00721157ae682-710d99f463dmr109520557b3.11.1749137100580; Thu, 05 Jun 2025
 08:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250530032047.1369164-1-sandeep.gundlupet-raju@amd.com> <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
In-Reply-To: <8607D12C-E6E5-41DF-9809-6E748E1D749D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 5 Jun 2025 08:24:34 -0700
X-Gm-Features: AX0GCFus9HlfDKFXGetzE6fr__Few_EAC4Pwn5xCu0Y0vT5lgUBZ8haNmT0SdYE
Message-ID: <CAMKF1sqFeBjSLZK5a8oubk6S5fe-HD1R9to+KZhNDa0BL816DA@mail.gmail.com>
Subject: Re: [OE-core][scarthgap,master][PATCH] tune-cortexr52: Add support
 for ARM Cortex-R52 32-bit
To: Ross Burton <Ross.Burton@arm.com>
Cc: "sandeep.gundlupet-raju@amd.com" <sandeep.gundlupet-raju@amd.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, Jon Mason <Jon.Mason@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 15:25:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218033

On Thu, Jun 5, 2025 at 7:12=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 30 May 2025, at 04:20, Sandeep Gundlupet Raju via lists.openembedded.o=
rg <sandeep.gundlupet-raju=3Damd.com@lists.openembedded.org> wrote:
> >
> > Add tune variant for ARM Cortex-R52 32-bit in GCC as there is no
> > support for Cortex-R52 32-bit toolchain.
>
> This is the wrong fix as the existing tune file is just wrong.
>
> The cortexr52 tune says:
>
> TUNE_FEATURES:tune-cortexr52 =3D "aarch64 crc simd cortexr52=E2=80=9D
>
> But the Cortex R52 Technical Reference Manual[1] says "The Cortex=C2=AE-R=
52 processor implements the Armv8-R AArch32 architecture=E2=80=9D, so there=
 is no 64-bit R52.
>
> The solution here is to stop it claiming to be 64-bit at all.

agreed, I see that Cortex-R82 is one which implements 64bit ISA and
not Cortex-R52
>
> Ross
>
> [1] https://developer.arm.com/documentation/100026/0104/The-Cortex-R52-pr=
ocessor/Supported-standards/Arm-architecture?lang=3Den

