Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C69BC02192
	for <webhook@archiver.kernel.org>; Fri, 31 Jan 2025 22:38:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.31866.1738363073785102354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 Jan 2025 14:37:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FmAIn6Zi;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-385dece873cso1253606f8f.0
        for <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 14:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1738363072; x=1738967872; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3l+84iHeAK76U0qvGecGz6c+pMR2zvOcBjFVNcBlmgY=;
        b=FmAIn6ZiFbgiSvJOFCpxMmfYK5yY/NKos4kDsG/YaIQ0JznyNnoj2qWn2W0JgUPh/3
         Dqh/hsPiibnfYbMLs2rgr5XFq+pBHOXQ/etfdl8EXVBbjXastMWT1Ad8mNFlnc1jHzMb
         PV7/RqjLrAjBBPcReonKDDX3d0iVS5+hXlV0o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738363072; x=1738967872;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3l+84iHeAK76U0qvGecGz6c+pMR2zvOcBjFVNcBlmgY=;
        b=MkoPa/1746S5xmS39DA6b9NdW88U4hooPn7kjZRpzIE7xwRSgaOqJmFlBEHHcvX06W
         49EZeCTN/S99sN1dsU85PdDZx9vTeooMhCwKty2CdciwC/QxaMh4umOXwMFJ6FS2gmPi
         5BbUrSjj1oH7wBmLFjE4k8xhtPAj+2NMQgjNwCwyR82ZjC4ZhnRCXPmdd3DJQosiTKgH
         gTZ34DmzqMnQRZwkMXJ7mCV1OMiUtJ34jx+ZxSEWpfekzJzDs1PfWWxr4ULSfe5UraS6
         3ww5KJ/+UJYdhAtyuYI8sDQy69fIU55w8TGzY+xatVEWOAAORysXBe81JMi+8pxYph8A
         hV+g==
X-Forwarded-Encrypted: i=1; AJvYcCVOxDOsi+IFEjlwmmV9/DTOtQhe4Q8Oc18Ktyjb96W34uHLz8tMI6OE6bunHaDRK3rIU0ivial4oS0aUUUoAvg14g==@lists.openembedded.org
X-Gm-Message-State: AOJu0YwVXZddruWMDKdVMPZlgzqEGBZ8aLZFl9+4Ycp2e2/LseXzzOK+
	O4bpVmEWbx17NzvD4hytVuYDYCGUdz9T/ZA+iSHNrh8tyeUB2HoEx2gWL5DbS3I=
X-Gm-Gg: ASbGncvafsWyFsmWZuhUWmnVIrFtb3UmdFlOG9YuAc75Bx+TVgyK+98I5Uv8ksYvwhg
	v8L+hGiZlSTWuWW6DF4KW0j/0OyU+F0rfc99ZuXX5jHGt6ew8FWASAwrnqNVYHDDh4ud5l18J2m
	4T+uwTY2pt0+cCYUlh5KTofMcGNBHR2QMQFcghgBnGqWTlYedhVzbfBbjE6qyL+ZJmnUDzG0tHG
	cY/SnYy3mzOqTj0+aV1bk+GDrmf1i0ewmAu9Zu7O1h7pLhocnLxofMaNWJ0R/ukjbAFlCHaY1m1
	Cs/b701CC1tC2+a5jSi5vM3n+9jwLL6w5zYLDyi4YbLhzXDEE8cJDVx6pdN1pJNEtJCXeBNRWhR
	mV18C
X-Google-Smtp-Source: AGHT+IGfBPGs0Lwon+ifRK5oG63F7Q3/405mZxyFc+ZR6n02XWukm9Z8DsNqAxjK0Ont8fVztkeYIA==
X-Received: by 2002:a5d:4aca:0:b0:38c:3fd1:6162 with SMTP id ffacd0b85a97d-38c520af863mr8566931f8f.50.1738363070413;
        Fri, 31 Jan 2025 14:37:50 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:8967:95b6:31bc:e74f? ([2001:8b0:aba:5f3c:8967:95b6:31bc:e74f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc13146sm102829705e9.4.2025.01.31.14.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jan 2025 14:37:49 -0800 (PST)
Message-ID: <fda5a12dbb22da458d6b0dbea2903f08442c70fa.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH] glibc: Upgrade to 2.41 release
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Randy MacLeod <randy.macleod@windriver.com>
Date: Fri, 31 Jan 2025 22:37:47 +0000
In-Reply-To: <20250130165359.137315-1-raj.khem@gmail.com>
References: <20250130165359.137315-1-raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Jan 2025 22:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210495

On Thu, 2025-01-30 at 08:53 -0800, Khem Raj via lists.openembedded.org
wrote:
> License-Update: Added license for e_gammaf_r.c [1]
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 added url of CORE-MATH project [2]
>=20
> * Testing support with different compilers (series)
> * Remove XXX math functions from installed math.h (patch)
> * Remove "%n" from assert (commit)
> * Improve executable stack handling
> * Compile glibc tests with Clang (series 1, series 2)
> * asprintf should write NULL on failure
> * Revert TCB layout changes
> * Fix ld.so crashes with golang test suite
> * Fixes after GET_ADDR_ARGS removal
> * Extend Rseq Support, plus x32 fixup
> * sh4: ensure FPSCR.PR=3D=3D0 when executing FRCHG [BZ #27543]
> * affinity-inheritance test: overallocate CPU sets
> * rseq-related aarch64 test failures
> * arc4random test failure under load
> * benchtests: Add dummy in put files cospi, cospif, sinpi, sinpif,
> tanpi, tanpif
> * pthread condvar missing signal, bug 25847
> * aarch64: Add support for Guarded Control Stack extension
> * testsuite: Make stdio-common/tst-printf-format-*-mem UNSUPPORTED if
> the mtrace output does not exist
>=20
> Further Release Notes [3] [4]

Thanks Khem, this passed in testing, the only issue was valgrind ptests
failing:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/61/builds/851/step=
s/12/logs/stdio
https://autobuilder.yoctoproject.org/valkyrie/#/builders/73/builds/853/step=
s/12/logs/stdio

Copying Randy...

Cheers,

Richard

