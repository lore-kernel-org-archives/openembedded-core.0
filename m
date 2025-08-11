Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3482ACA0ED3
	for <webhook@archiver.kernel.org>; Mon, 11 Aug 2025 18:09:38 +0000 (UTC)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
 by mx.groups.io with SMTP id smtpd.web10.55097.1754935772531471198
 for <openembedded-core@lists.openembedded.org>;
 Mon, 11 Aug 2025 11:09:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QAFkzZB/;
 spf=pass (domain: gmail.com, ip: 209.85.128.181, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-71bce78e14fso48559567b3.1
        for <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 11:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754935772; x=1755540572; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P3wIIz3YtsRNGPEZXXbKWgsmaLUMVy/J9F6Os+C/B1k=;
        b=QAFkzZB/dI01F1GFhGek6LuAc2SoYsr6gYofd9rjEfYqQkTA24uPu4+FBfowWUG8RB
         m+UTEK7a6riXuTs9/k+OtElk3LaPs32ioVFplSjvHuCFWezDXHH2encWiGpvmSaU8dX5
         2GI5ewF7Eunq4B29osH6obHaodea5qeAR51Hw/Pr3cKeT7HHBCN/M/PT7tE7tA7HaX46
         7Y96L3N9M4fZkiQ9amSKyZjolVVrd/5Mo/H5TlbLLyolqhWuNW+sANbcpAFPpHAVPfQp
         XUb13MxGNJOfiglP4H1N2DIC4NR29q4mUTizFOhU7/8DFn7ClPNOzm9u/FumHUWLB0Tx
         HCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754935772; x=1755540572;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3wIIz3YtsRNGPEZXXbKWgsmaLUMVy/J9F6Os+C/B1k=;
        b=lFDEDzw//JNBMFdlI4FNVLvjOOoblVczmHobWXUGHqbpuKzm4JgXavodhw1cmILahM
         tATtVeqebTh0WHPEONI7ujgl0CY8Sucni0Oofo3iL/vxEwBJGhxAXcddoI+AFfLmBab4
         fko5tI9xkKCn9pNK/Lbn23gqZJ+/1yRu0ig6SHXJe627c7nODKaI9BrByphHsfBzzdew
         2FPPoHzia7zS3HyUbypg4HaFf7M1VhEQOJfTMR1LJ7MeK9Zn9ZJk/lQqbeIWzCRJs/MF
         xAIYob/5vfBho6yW/3COVr29EgFb/sPT9g+yhHhSWEUK5qNk5ethKNhQHyPiXaCZmQvC
         MY5w==
X-Forwarded-Encrypted: i=1; AJvYcCWL0q3VQbDVE04EoVosRWkEo/1IKGWM9/zabzK7lS3a4ZOqM0L4mJP6ixPbYszuk/lHwtvUUzEsw43XcCZRWc8Qrw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyK5Ent4WIs0HrJ4/OYQ/swcr6rWj0Sl/IjDUTd5XQEFWarISiu
	49/jiubyp4SV14m3uPkulf/achFIwi3cx8uXnO0YIYqGA8He5trVIx4iSR5r7mup1yWwl5d2TuQ
	nzuHbV+cHS0KRN+urF3avMZkl5PqcqgM=
X-Gm-Gg: ASbGncv7txqejeiVqWt6x7/y7SJupJaCWXIKRjKG2QayraSAGHJXTjEqG4XXIoDNaRO
	BGxYrNBGF5Cl9HPf4/mYw4Mk07j5O+0gi3Bn0gch3wdam7DafodANIYA2HGhkL6HTyniGyg5aGI
	ijLEAU/TfGCiONLDD9UyOPSgORXs7PUwYwsNBkeSlyg5aredxNoj1UxVeZEGGt1hbjRTzuhmwRj
	QppD7SE0CGmc1+KKalwUd1m2oYJgK0Av1Ki
X-Google-Smtp-Source: AGHT+IHlwHNw6bgng50www271k87NLgwUqDZIXJeCabjcaDHb/6DB/f0Rj/mpu/edHsAoVdUG582YVZvw8CqBu4QIxY=
X-Received: by 2002:a05:690c:9691:b0:71a:41be:133 with SMTP id
 00721157ae682-71bf0d3d579mr173552647b3.14.1754935771436; Mon, 11 Aug 2025
 11:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org> <DBZLWMNEMBSO.1REVKMRL4CMZO@bootlin.com>
In-Reply-To: <DBZLWMNEMBSO.1REVKMRL4CMZO@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 11 Aug 2025 11:09:04 -0700
X-Gm-Features: Ac12FXwi1KY2AyWLI8B5gIZf2RVmavlohb7UV4ITwYxaaSlUVnTRwmIfPmtSlC8
Message-ID: <CAMKF1sphaxR5Ywvtx5NcqnW6Xs4cEZJNQjSz3bLt-GNh8A4r=Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: mathieu.dubois-briand@bootlin.com
Cc: richard.purdie@linuxfoundation.org, 
	openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 11 Aug 2025 18:09:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221748

On Mon, Aug 11, 2025 at 5:44=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Mon Aug 11, 2025 at 12:25 AM CEST, Richard Purdie via lists.openembedd=
ed.org wrote:
> > This was originally applied as our autobuilder had older hardware and c=
ouldn't
> > cope with the newer settings. This has been resolved in the new cluster=
 so we
> > can go back to the newer tuning, which software is now more likely to n=
eed.
> >
> > This reverts commit 369b1dfa28b1791d45f068acc765190defecd460.
> > ---
>
> Hi Richard,
>
> I believe this is breaking numpy ptests. I'm not sure to understand why,
> but git bisect points on this change and it is confirmed by only failing
> on x86-64.
>
> Failed ptests:
> {'python3-numpy': ['python3.13/site-packages/numpy/_core/tests/test_umath=
_accuracy.py:TestAccuracy.test_validate_transcendentals']}
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/2067
> https://valkyrie.yocto.io/pub/non-release/20250811-33/testresults/qemux86=
-64-ptest/core-image-ptest-python3-numpy/
>

The failure is certainly due to this change, There is a known defect
upstream [1], It has not yet been resolved. We can skip this test
until
then. I am testing a patch to do so and will send out shortly

[1] https://github.com/numpy/numpy/issues/27460

> Best regards,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221736): https://lists.openembedded.org/g/openembedde=
d-core/message/221736
> Mute This Topic: https://lists.openembedded.org/mt/114638379/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

