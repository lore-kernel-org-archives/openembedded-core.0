Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27F6BC197A0
	for <webhook@archiver.kernel.org>; Fri, 17 Nov 2023 12:04:54 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
 by mx.groups.io with SMTP id smtpd.web11.10008.1700222689941999868
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Nov 2023 04:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Se2L1ktN;
 spf=pass (domain: gmail.com, ip: 209.85.166.41, mailfrom: alex.kiernan@gmail.com)
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7a683bd610dso61622439f.1
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 04:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700222689; x=1700827489; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ShTNFHbI5sYFBgYEEJh3i5OU08q13tIoFqxlp6+CYRw=;
        b=Se2L1ktNfkLbkJ0xtihiUdoqKp7rNYn9qQe5mSw6yTOSutK0YzUV0apuQ+aLKuoDek
         PHBWkk+tFJtgzDFc4wh6i4mpL0a7rnku3cj3go1gMvPhiVW8zxSScTLmZSKtWp4919ha
         +AYnmMd743y6RcYA8riy/VDkx7NeItTPphOagX19T6pclwUIKgRHvK4l5DyTESHKfz+D
         rhRARpyFDxkKrEEaymvskTkdVa6TL1oyzsxoZH2OtmwAmLLcAfwDjs5OAgInrEZiijs1
         3/4EIjt6KC9G6fy31fymd8xTDtdDTgtMP8+RzF64Vg+IOV1SJzllbfAAaVpi3IQ9fLwZ
         0M6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700222689; x=1700827489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ShTNFHbI5sYFBgYEEJh3i5OU08q13tIoFqxlp6+CYRw=;
        b=p2gaRzdgEAS9JFLxtfKsf8LmVvGanCjvkHpY8m4HqQiRCMZ5xlkvm6bbbrHHCP5uQj
         Ks9T5LCo641Cz+dV2x1p0tzLGogzXAAo66u7wMKtsSIPG04zJM703QYAWg9e3nRgNZhj
         lk8Vf7N3DSqIGMr8F8413WMNzCrshG2LMznU4B/DPbrufRXxu7XJGHUqkBBIvDlo3Ynb
         Dbo2VS5Hl3lqvMV6etR78BKQNZrLVq20xpIPqhYNreCRILQLfvKWiVBYWH66HCI2mRDF
         t93Dh9Y2VngVIjcEAIFvg1jafawdf6EFLQsR4rCTQJ6kbKNiRXGQK6hAlqEOvuo5eicX
         KU7Q==
X-Gm-Message-State: AOJu0YzSLFMVMAMeg8/VSZMoLMNqK6L8mWtw80tDuJhac/26jMjHxwjw
	CQEqoEW05LN2f2BkibQyWz6IYLTX9fOIF/TaESA=
X-Google-Smtp-Source: AGHT+IGRK/H0XQob4fgL1eJFGrUYfNrzu0TaRZFA3/BY/wrNPTcMj3XRQNC2rba0rcYFNvrtv6KHjK4zaOC04GnGVGc=
X-Received: by 2002:a05:6602:379b:b0:78b:b892:e334 with SMTP id
 be27-20020a056602379b00b0078bb892e334mr27728306iob.11.1700222689171; Fri, 17
 Nov 2023 04:04:49 -0800 (PST)
MIME-Version: 1.0
References: <1795D005C571B567.15940@lists.openembedded.org>
 <94196e06-f078-4df5-afee-e29c05f11b37@windriver.com> <CANNYZj9+N9ezYB9yiPsHUjgHCUdStYJWEq3_8mQDQXxswxfVOw@mail.gmail.com>
 <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com>
In-Reply-To: <685c9a01-2160-4f1d-afd0-cec3593b1be6@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Fri, 17 Nov 2023 12:04:37 +0000
Message-ID: <CAO5Uq5QMFAtVkYFFjwGpX2eCgZ=LZsp2iWBheTZt=5D0NvAmbA@mail.gmail.com>
Subject: Re: [OE-core] [RFC 1/5] valgrind: make ptest depend on all components
To: randy.macleod@windriver.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>, "Shinde, Yash" <yash.shinde@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Nov 2023 12:04:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190847

On Wed, Nov 15, 2023 at 4:30=E2=80=AFPM Randy MacLeod via
lists.openembedded.org
<randy.macleod=3Dwindriver.com@lists.openembedded.org> wrote:
>
> On 2023-11-15 9:48 a.m., Alexander Kanavin wrote:
>
...
> Rust would be nice to do too.
>
> Indeed.
>
> Yash and Sundeep have 1.72/1.73 updated and are working on
>
> getting the test suite to work but struggling with that.
> I asked him to track what's happening in:
>    https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D15275
>

I did start looking at this... mostly I've failed to find enough time
to even get to the point where I've got a useful environment for
running the tests outside of bitbake (and hence avoid a complete rust
build cycle).

Rust 1.74.0 landed yesterday, so I'm going to have another look... if
it's useful to anyone my (very much WIP) tree is here:

https://github.com/akiernan/poky


--
Alex Kiernan

