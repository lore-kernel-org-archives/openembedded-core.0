Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34F56C27C79
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 15:54:07 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web11.60078.1718639644583885057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Jun 2024 08:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=l78OWgNH;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-250c0555a63so2238952fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718639644; x=1719244444; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQXC4+BoQ87bU1z28+pdAevAbxswigePyxaqpxLTcsk=;
        b=l78OWgNHr7NYzwJZz7+c4IWXq4WbvPk4Vif0e7NnxO7G6RZdAuG6RRuy3AEKAzhPk0
         BYrYfwv0b/DAJoHSuqE8w63uDgz7swLvmLGlcCdQ9lfsUC8nCSTQjNuvitrvBKVZIc7a
         Pw4YNklAongDSQ5/TMJ244DmK2VspeKYhXcAAp8Au10HCORTt/EPGBVqCnDFo0eJJxBu
         tChaevA4oEbRvb+by6dZGuifVH0eU7RNKKdif2FcDdqdtmB2CQGHyEMzBP1iQNyrl4ZO
         4GM5/XjcNpfnZnhb3H1mcX348kn3320I4pPwABMb7Cn+keHfB81z+C6uQRnFKzrEriZI
         7xgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718639644; x=1719244444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQXC4+BoQ87bU1z28+pdAevAbxswigePyxaqpxLTcsk=;
        b=qEp7qAOUzIWLKmqjUE0uUH9XRfPG+IT/O+pYnAJl5kVHY7DVSO7WXpfz7l89F2+kPe
         F7UTcnFn4kWIiusLvVRdwVK+tnONGqaouGZgQb1PWRBYWZMTBJINs89jyw7IoU1mcvtQ
         0ZWEdUCet5Nol56FQjtH0etshtxVp23Ubu40MNM2z2uJxQmQTaeJQU+PKf1NEzFYgr38
         aRKEaN6NdmGpKP+sndT5Cz7vddxuj3ULicfrgHeE0/y04iuKp20lVWiohqEbUq/Buxli
         Cb+VWlXCLqkjMxzRwwAzhg0lutviCXQ7fy3KUXPKpNEz0dcHCq7K9Ar85vj6Vj3jZZDh
         IArA==
X-Gm-Message-State: AOJu0YwkNPTTnx/p0pJ01RPeBnaGNikJre3atNIHgZfWHNieGzhWXiMS
	ScyVbh+YdeVyMKACmA8XVYEIDh5Mk6fOX1zfhBNqT49c2vs5EGoQdmcGd7ZW7Vq8qGMRMhfxZit
	7l5ETxdL+J1658wFcf1e1y2hPD7A=
X-Google-Smtp-Source: AGHT+IHGkdFzbeKamP2HaFxvzqkCuU2TczUBzYcZuyso1Io43Pbuqzk43THTTIrhXxnCZzosx+zYbf4cMf6i3IFsStM=
X-Received: by 2002:a05:6870:a406:b0:24c:b4da:725d with SMTP id
 586e51a60fabf-25842a1d172mr11567844fac.33.1718639643700; Mon, 17 Jun 2024
 08:54:03 -0700 (PDT)
MIME-Version: 1.0
References: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
In-Reply-To: <CALT56yPWE=nTn7jAPps+A7YCZ17Aw-U_OpfonSTYD90j5rwOAg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 17 Jun 2024 08:53:38 -0700
Message-ID: <CAMKF1sq-LnWx2fWMH5gQgpkofWqAwdQhDQCdEdKtNg0XEW4FLQ@mail.gmail.com>
Subject: Re: [OE-core] QemuPPC64 machine status
To: dbaryshkov@gmail.com
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Jun 2024 15:54:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200847

On Mon, Jun 17, 2024 at 2:51=E2=80=AFAM Dmitry Baryshkov via
lists.openembedded.org <dbaryshkov=3Dgmail.com@lists.openembedded.org>
wrote:
>
> Hello,
>
> Is qemuppc64 considered to be supported? We have been running CI over
> a set of machines, it seems that PPC64 kernel build is broken for
> quite some time:
>
> https://storage.tuxsuite.com/public/linaro/dmitry.baryshkov/oebuilds/2hzr=
cO3QvnkeNPVouoptwe4sFZf/build.log
>
> | /tmp/ccJSLBgE.s: Assembler messages:
> | /tmp/ccJSLBgE.s:765: Error: operand out of domain (18 is not a multiple=
 of 4)
> | /tmp/ccJSLBgE.s:790: Error: operand out of domain (18 is not a multiple=
 of 4)
> | /tmp/ccJSLBgE.s:815: Error: operand out of domain (18 is not a multiple=
 of 4)
> | /tmp/ccJSLBgE.s:2435: Error: operand out of domain (19 is not a multipl=
e of 4)
> | /tmp/ccJSLBgE.s:2461: Error: operand out of domain (19 is not a multipl=
e of 4)
> | /tmp/ccJSLBgE.s:2486: Error: operand out of domain (19 is not a multipl=
e of 4)
> | /tmp/ccJSLBgE.s:3590: Error: operand out of domain (18 is not a multipl=
e of 4)
> | /tmp/ccJSLBgE.s:3616: Error: operand out of domain (18 is not a multipl=
e of 4)
> | /tmp/ccJSLBgE.s:3641: Error: operand out of domain (18 is not a multipl=
e of 4)
> | make[3]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts=
/Makefile.build:243:
> fs/readdir.o] Error 1
> | make[2]: *** [/oe/build/tmp/work-shared/qemuppc64/kernel-source/scripts=
/Makefile.build:480:
> fs] Error 2
> | make[2]: *** Waiting for unfinished jobs....
>

This is fixed in master -
https://github.com/torvalds/linux/commit/2d43cc701b96f910f50915ac4c2a0cae5d=
eb734c
you might request a backport into 6.6 if its not already done and also
into linux-yocto, Bruce generally accepts
backport requests which are accepted in master.

>
> --
> With best wishes
> Dmitry
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#200800): https://lists.openembedded.org/g/openembedde=
d-core/message/200800
> Mute This Topic: https://lists.openembedded.org/mt/106717814/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

