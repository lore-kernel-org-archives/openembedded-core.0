Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D690C83F38
	for <webhook@archiver.kernel.org>; Thu, 17 Jul 2025 16:50:25 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web11.331.1752771019103049244
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 09:50:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UZ3tk8+d;
 spf=pass (domain: gmail.com, ip: 209.85.219.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e8c475ecd5bso996810276.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 09:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752771018; x=1753375818; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9A6iSirsT45aZ+tBldAu9/4AvCtNRa/5b2PcEjPi9I=;
        b=UZ3tk8+d6VZ8La0H5aPVPnL7cJjBYar26lN98xQP1vjwbpTQQe02LV1djayBV9/B89
         lXhSBM9+C2zPS4pS659URs8+DhSqnbhr1Am2BlDse5pg/irj7P+OFDAgHVrJiWaeURx/
         goulli+zh4Nyx+ER8gVQ1h3OvfB15m/Z+PXQILFy2kfN50Bv/H1eQm5Vo1KssjmEtBy5
         9/VblKxZfkkTQDobs6rRsYUTYVpqU5P9lB35CTQU0zqmq4WzTorZDanYJcptharoES9O
         Fuo64haCtmGIT7R5bGs+kAEiHEKmz89xCP8VplHUb8VbFt1qAotJx1rCT5OsCYNjsUu2
         CBVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752771018; x=1753375818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9A6iSirsT45aZ+tBldAu9/4AvCtNRa/5b2PcEjPi9I=;
        b=Kmg/T93S1K2Y1fcwj1NIsbtKD2DGWwdhj0r9ESw1n8HyI5Dm1ndzPVVxKe87MMGjFQ
         2T3pl/7G4tPOr1Y5KfnnMIPiE+jb9cJnc6eN3hTnLs1SNOAtNI2q3tS7aU6XsetWP9Du
         r+oDG2D3UOz8QQxP9ArJf+FtZPyxl24dQEpdKUdz1XZbk4Uv5bLqUYq9ZXUboAWD+kEs
         E0kXKal8Ayj6Dt9HBcNWArOH+lek57ZqQhhOdxkrSs1r9ofxKZaQRzaPxE+nZQfhEDgr
         tduAFXuiqAgthp/872DG/e52XmXuIkFbMd8uYx48F03a882iPPOtvHSUHvL3ZmGiuaE0
         dCCQ==
X-Gm-Message-State: AOJu0YyrB0jjqylzByMca/Ai/SR+bOfBg8m7dYMs6V2G0QuvjGflxJzN
	WmZSqvTlfoxvHylXW4KPdkVaQjlP+ZS9F9UE7Ps2/PYFVwT4sO0Wa1N4wKpRb6TtAJ0cuFOqM2f
	zfI2DBpif85OXWxiTWtOhU9xh597mNkw=
X-Gm-Gg: ASbGncvBMK9ZqinuyPAgVSXFaVxAwyJhJZY7gAZ07nnWRVIcavM6O2hZ9LJBOjSk9mc
	IwVIz4OGOt9/H5gPcFaMQRwxsRT1Rm5I9N1IHsyw2c3Z2BWqBi1XO8OwJnBRcGjbhoUiB/JVg0l
	MNdrqURzcecw3xyDd0BR80cjH9pjC42kjDbl/FL4J2tFKaV6BfSjKHoKMgP3zktxd3XTVooXnst
	9ICXWolTpWwcbV9
X-Google-Smtp-Source: AGHT+IEOgneXQ7ssw3sWkKMsarlsScWbojKdnxpGNp1Zkb5e+7oALtHujuuGP0CmHCJHUqlIPYnRBVY47uMLwYpTTTA=
X-Received: by 2002:a05:690c:3747:b0:717:af29:865f with SMTP id
 00721157ae682-7183747155cmr117165887b3.28.1752771018001; Thu, 17 Jul 2025
 09:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20250716094954.866783-1-ross.burton@arm.com> <CAMKF1srh8VDLOo_029px5CMMsWdoxo73t5-4PuVbNRVk6dFm0Q@mail.gmail.com>
 <7DAC38FF-5F62-4926-8B62-A852E62FDB02@arm.com>
In-Reply-To: <7DAC38FF-5F62-4926-8B62-A852E62FDB02@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 Jul 2025 09:49:50 -0700
X-Gm-Features: Ac12FXy3ut5qPh6nwRjPAzbCuriC0yEt9MDWUrJfj2CsR2a3l8EFVzl6b31s2s8
Message-ID: <CAMKF1sqSPY9dS8ZoE4YTtOWg1Csz+OsPH4oAYFsNLJqtDvoUQg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] ccache: move environment variables to the
 configuration file
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 16:50:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220553

On Thu, Jul 17, 2025 at 5:14=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> w=
rote:
>
> On 17 Jul 2025, at 02:23, Khem Raj <raj.khem@gmail.com> wrote:
> >> +# Only rebuild if the compiler version or specs have changed, as we r=
ebuild
> >> +# compilers more than is usual.
> >> +compiler_check =3D %compiler% -dumpversion; %compiler% -dumpspecs
> >
> > -dumpspecs is very gcc centric option and clang does not support it,
> > previously we overwrote CCACHE_COMPILERCHECK
> > in clang bbclass to something like %compiler% -v, how do we get
> > that parity with this approach ?
>
> Ah.  I=E2=80=99ll drop that change for now.
>
> Maybe we should just check the version and leave it at that?

My hunch is that using
CCACHE_COMPILERCHECK=3Dcontent
should be good and it will be faster than trying to find the version of com=
piler
because it will do gcc -v or clang -v for every compiler invocation which c=
ould
more expensive than doing a checksum on compiler binary content.

>
> Ross

