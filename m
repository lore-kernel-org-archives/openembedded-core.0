Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 290AAC10F1A
	for <webhook@archiver.kernel.org>; Tue,  7 May 2024 16:13:47 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web11.16049.1715098417127824382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 May 2024 09:13:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aFmNod4o;
 spf=pass (domain: gmail.com, ip: 209.85.160.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-23f29434da2so1872760fac.3
        for <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 09:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715098416; x=1715703216; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k0nZsJ4+TDqSj7nPXBj2SmsO6W2S+aMKaFO4Vrgz4Z0=;
        b=aFmNod4oFqqqV/CK0J9vCV839OCrKf7YLEuoweyA+TT4LpsDq3FIfL0lKqp4sN0Jio
         yMlP85ZisEem8c3A3srSiQLxtHd1wOr1gpH59Nyp5VW4QFzxrxWGlbn53sv3/ayK43AZ
         sCeQDtcMG0JujhFAZ6XsKx4asJpmETa87Z6w6HBBuR9hifREzufGPhiSTdDcHk4ZPaXN
         0jr3o6aTnyimZsrXompo4iA55+aYasLIHRKNJuB3VJ6HUBV0+M1klAhNp+vDwS9qFO3m
         l9lRf+8za65Vb2qfljoY6ju/A6/FF3T8ATVvGLmagsScsl9gWf/8ayJxVKSNui0Dxr6D
         0S8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715098416; x=1715703216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k0nZsJ4+TDqSj7nPXBj2SmsO6W2S+aMKaFO4Vrgz4Z0=;
        b=DcY9dLOi3Mec0XYzlNTG69g1bif4n5j+O/VK8ouFsqqfny6A6L1JTzSRqeV4id0XPO
         N2CyeABKhixxr7wOWh0BvkT8NAEWjGriAPkAbDkgdHh0ZktPUsuoTNdc9xgRvin7YLzc
         kzJL6e+JsAy639jdvXGOxXFIzGdFL8PLfGFJeSWldILWMHLUPqL5chepn++sR8vEm0/H
         kURTl5tdk4s6Zp8G8S+mb1gBmk2L2L/5xgsVQpTIT/8UqRJrixZEjHsY8Px/gccL9w5m
         M+qo1Nx47McK4UfDBkl6ebSbFrl4DmOA7g3PBBEzEEKymBuM4Tpn6w4BFAxuTxx5dnCF
         NyQg==
X-Gm-Message-State: AOJu0YzsR8tXLbjz/JHdD4gX8Id/A6kIQcDRPZUsQVWJ7zRhQtO9rFGd
	Rgm5kQC7Uu6HGQ4ZAuIz5YneefOwFmx7k5xAPS3teAlUH6WfOWF9DEyF2MNxNI8LwAAl1N0Q3S/
	oSMXHhUwrclEA9AV3gsRk6cF6l/U=
X-Google-Smtp-Source: AGHT+IHrrDZbkEo6UJMoA1oZUaHDb/lXN/0GWGyh6WdAMclg8EBNp3Q+8ObyTFVGCBflALDVDeek0JzERN/FcoUZ9So=
X-Received: by 2002:a05:6871:3391:b0:22e:7460:d2a8 with SMTP id
 586e51a60fabf-240985a4762mr44610fac.42.1715098416200; Tue, 07 May 2024
 09:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20240507053320.1566814-1-raj.khem@gmail.com> <20240507053320.1566814-7-raj.khem@gmail.com>
 <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
In-Reply-To: <CANNYZj_w95u_j3XTgAMzHJ3_dYKyBzqL4tj6V3pS=sAXFjyP_g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 May 2024 09:13:10 -0700
Message-ID: <CAMKF1soraS1+kfj9jkSqOo6LiaZnOOqzj9PimZXssfDu0kuHqw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 07/11] kea: Remove -fvisibility-inlines-hidden
 from C++ flags
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Martin Jansa <martin.jansa@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 May 2024 16:13:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199101

On Tue, May 7, 2024 at 3:15=E2=80=AFAM Alexander Kanavin <alex.kanavin@gmai=
l.com> wrote:
>
> On Tue, 7 May 2024 at 07:33, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
>
> > +CXXFLAGS:remove =3D "-fvisibility-inlines-hidden"
>
> Same comment as v1: this seems like the wrong way around. Why do we
> have it as a global glibc/musl setting in the first place? Shouldn't
> we just remove it from there? I did some digging and this line was
> imported from oe-classic in 2010 with eglibc definition,  so most
> likely whatever reasons there used to be are long obsolete.

Firstly I am inclined towards removing it if we can, since I think it shoul=
d be
packages to decide to use it, then they can maintain it better from testing=
 POV,
However, there is something
to consider w.r.t. to this option. This does help in optimizing loading DSO=
s
by reducing the number of PLTs and improves loading time for DSOs which mig=
ht
be quite meaningful for embedded devices that we target. However, we only
enable hidden visibility only for inlines so it won't be full benefits but =
we do
have better default compatibility.

Since we have had this option for a long time and it still seems
relevant, I would
think it would make sense to do some benchmarking on a sizeable C++ program
perhaps chromium or webkit, and see the difference in DSOs sizes with
and without
this option and also benchmark the loading time of the resulting
chromium package.

maybe we will find that the gains are not as significant, in that case
we might drop
it from defaults.

>
> Alex

