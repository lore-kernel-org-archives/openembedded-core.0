Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A094CC54F30
	for <webhook@archiver.kernel.org>; Mon, 26 May 2025 01:55:58 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.20890.1748224553779777240
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 May 2025 18:55:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HSXXPdF0;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2cc36b39545so886409fac.1
        for <openembedded-core@lists.openembedded.org>; Sun, 25 May 2025 18:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748224553; x=1748829353; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9Ph4jH4uvoFk5n4s1UkWEt2KKKsjPTVtLUt79ALn0s=;
        b=HSXXPdF0Kt1Drs4CXY1Y3swicuFn+O8awaUJJPLlB6kKI1oTXGEazEWJt3MhgPvWtT
         Yv7N44OShXzg02IMa1d+c0OAN4YZNIDt1VXCqAJHV79SqmKfrrbwmxkw6F32Yi0tXoaF
         IB+bB5+LecFQItNMzx7wvx7V3Xfkh7AJOE67h+BeUNDBIFT1QbsGAsCqQzvxJAn8gMDM
         itCuNNRuxG8VKosunSRCKrtlCCF+MKPKF2PGHAudVsekRUfjqmrUfcHrucDFEUKDvQNk
         0t1Fm+KCQSMb19ANL4TVF+fCf9eCwqh3yVDuB0cgHFBLlE90l1G2/Ov5C9xJGr1otvqv
         SbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748224553; x=1748829353;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9Ph4jH4uvoFk5n4s1UkWEt2KKKsjPTVtLUt79ALn0s=;
        b=MxPngWN5mqC1uBs1HDrSJM6l2jFM/HGc0y/+Pf7Me8Z86G9vlq6ZwVzFVF0E8c/Rye
         GO//FGgZFWi8wku1C5rPrvhqoFUbCTYbnhK2F5Gzfif3gIrnLfJ6UGGJ12rKKh8EDpoU
         aAM6ERk6AS38aBPGyy2NAniqrEcSt1h90TmxkKzM/R/0KdgTGAW0RZc5JbsX53mgEIYC
         4DmrymyJut+uHV/PnIyCZXm79XtCoMimaFtuppidFs23faoD6pHOc21yfZDikd4jCKMv
         pa+k6onoFGhXE/EJqYqRhMQrjMAobv4W0o5uuZ39vR+iYCmXCZHGNhFwYJmZpBZJtMA2
         qE1Q==
X-Forwarded-Encrypted: i=1; AJvYcCUWrmHdZ7FX633GWhxcE6gl+lp6zUT8oPl76A5RRTRePjsxBYaxXkgvIdbYZMj+LxoxIMMHFwHCH665UbBtvbUq1g==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yzsna4JejBxbkPC3RVjx1ixiKbKANgUcn9gLAinQHM4yinvozIi
	StO6mLYOcgym5yrO2tGxBTXxkk0iJ8o5nWOX5hzPq8W3xFlnY+F2l0UIX39NkdZlzvweP3qJN+g
	pXJ1z6k6zBdIvZRJuCzVU2RejqbpYYTM=
X-Gm-Gg: ASbGncuFyiLC9+/jtCISMZgKDMO4Q9E0ipj1RRKuliONRojggGlFLgPmhSzYuQlBfEr
	LELjKLv7O7UL3cdoZFhDdE3HXdQH8Q2CYmEz3Cf2Jzjq64+G3AwqjQSDjICbwOx9s+HyNaCfvDT
	E70c+a/xzXbUdywVN6LXv+yszIs6b2TyTLjPD+HaPWHiU=
X-Google-Smtp-Source: AGHT+IG8LXc9wT4XOWzbeGqyrvaTRIelhBLE1YgGK7Gu05J6BczUyXKK+qFYPvm5XNScbNPuZ0Mmhm4pnL1FfjQjUh8=
X-Received: by 2002:a05:6870:a508:b0:2d4:e8ce:7bcc with SMTP id
 586e51a60fabf-2e83e2a1e82mr6489630fac.8.1748224552941; Sun, 25 May 2025
 18:55:52 -0700 (PDT)
MIME-Version: 1.0
References: <20250521080925.815334-1-hongxu.jia@windriver.com>
 <DA2H7Z2IQH15.8AQHUB50F8SB@bootlin.com> <AS1PR10MB5697E603603C2156BCF1DE5CFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2KDA7L7YRZ.2I1CKTLPP29LZ@bootlin.com> <AS1PR10MB5697DC8D007471A68D8709ECFD99A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com>
In-Reply-To: <DA2ORDMJAWTX.2XH4RND735F7C@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 25 May 2025 18:55:26 -0700
X-Gm-Features: AX0GCFsyXTJmrIaoj4aDr6fEfi1jgDUYPdlxHJFmy4q1oEgAk5z_zD2v56z_QBg
Message-ID: <CAMKF1spdgbveyFvNWoouh9XEdU+RAOX9pNoUgFGe4N2=XcpUEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/5] libxml2: upgrade 2.13.8 -> 2.14.3
To: mathieu.dubois-briand@bootlin.com
Cc: "Marko, Peter" <Peter.Marko@siemens.com>, Hongxu Jia <hongxu.jia@windriver.com>, 
	"alex.kanavin@gmail.com" <alex.kanavin@gmail.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 26 May 2025 01:55:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217252

libxml2 upgrade will need some package adjustments in other recipes
depending on it. e.g. libiio from meta-oe see

https://autobuilder.yoctoproject.org/valkyrie/api/v2/logs/2490442/raw_inlin=
e

On Thu, May 22, 2025 at 5:25=E2=80=AFAM Mathieu Dubois-Briand via
lists.openembedded.org
<mathieu.dubois-briand=3Dbootlin.com@lists.openembedded.org> wrote:
>
> On Thu May 22, 2025 at 2:14 PM CEST, Peter Marko wrote:
> >
> > OK, I have updated my patch to .3 and sent to mailing list.
> > Don't forget to pick the lttng-tools patch again with it...
> >
> > Peter
> >
>
> Thanks, I will take both patches for my next build.
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#217094): https://lists.openembedded.org/g/openembedde=
d-core/message/217094
> Mute This Topic: https://lists.openembedded.org/mt/113225735/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

