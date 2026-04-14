Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2291EF531F1
	for <webhook@archiver.kernel.org>; Tue, 14 Apr 2026 06:23:31 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12716.1776147802606339571
 for <openembedded-core@lists.openembedded.org>;
 Mon, 13 Apr 2026 23:23:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Ci6OaagU;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48896199cbaso55181805e9.1
        for <openembedded-core@lists.openembedded.org>; Mon, 13 Apr 2026 23:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1776147801; x=1776752601; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OaqsgqK5La0tkmxms92xVcipXPNWhlLhfIYC4Irwz4Y=;
        b=Ci6OaagUvwTDW7E5oY9Q8YuuI7iTwjPK+OivD/xXgSJ5z6l8RfQcRsViXeI1Hwzcd5
         NAqUw5sw0RreEUsbvFZUb7CHiqH41kCKJxOewtbyidrJEkkFVPKz3ipcCqSkZKBZGQdN
         5os97v0tRpp54+iWkI130JBXKs1DnZ0FVLD5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776147801; x=1776752601;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OaqsgqK5La0tkmxms92xVcipXPNWhlLhfIYC4Irwz4Y=;
        b=MHm0HIaoZNePXraJLOTS1T6ejzB/Y/yZ1YK93lpXRr0yhaz4NnhBVVBltZs2AgX7mm
         pvhc7urXGbTBDH8l2QnEgYHJuZcqvqsl5HJOCYoTiF7XCJk1MiugwcB5PYohPcGj1jwT
         hp7w91YcwPc6SkKsgVeehZZM1roEBv7ZETZUiGaeeJs2Cz4KmjpKAcNk0xm7DOXg5F6t
         v/5nP2RsvQVoo4OIJt4dxwZDKMxjHDuIjHDhbz6E7eVxT7MuJZ7PDFbVlCKaLK3XrUQY
         O4mOvOnlyvIH1XTj9TjyrRAvwmyM9stbfnHmVoobu6t+PQNjNbgycf0/b3Gg+Yz6oFx0
         SmNA==
X-Forwarded-Encrypted: i=1; AFNElJ94PHQMl6z7aCC6alU4S0ZAU1R9/JnAUura7vRZhXxzjTIQ14APabjEPdWEgGnbJH9tzhfy1nFin9csNKw9e2Ku7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yznb/9Zr7sAGRwZ0+izZtUFatvXSeDMm5jc8xpdqurFGrEksA5K
	X492IZT+QH5lPi7VAHwFnWvfnBMkUeD0baksj0B7M8wfQQ1Z301xsksaWmD4WFdzz6A=
X-Gm-Gg: AeBDieuOItIHW3l37voh25DhF2kJwcmJR0AnmFTI19OZfUCYF72s3jQRyz7sCF5XauE
	9/5afnJigi71UfhjfMGor9x6xcfaOohFcJ+YwEihJNYl0yyQpt+A1hfJRml2Vw9MMEGWzV+EmDr
	cOeYPFK+kCDpiXOEndmwuODQNd/dAV4DKvSW33h/9yE/V7HjQoQ98XvcViwvIdsCPsSa7HvvVu+
	+hSlfxcYtoXIE1INuadKW7e+cFCGwqsaphP2kO58kY9GJVdPEAvIrn0MEseAIl4i9zRrC4gYzW/
	OpAnA9aSDyb4ZwN9GDaJvYk2ZQ04DCAIODnSULURN1cdhuJx9BcfEqFbr3/bbK22T6ln7PadIGP
	b5EqQ+gaF0CdjqTLvVpib5DK6y+e6akhSlxahzF/1kpr7LqirksFgjirWPb7Ai0b6XIIC4L4KbF
	/VOYiH7CD7Jkn7YuswUqS2R1dJMf7MGmv74qetd0FajBuJAiZJ2KZTZHDanVCgbDT/W5H2yKE1T
	K0kCnSuoGa1aS6P
X-Received: by 2002:a05:600c:5299:b0:487:1fb4:7e1 with SMTP id 5b1f17b1804b1-488d6875f3emr214344225e9.22.1776147800967;
        Mon, 13 Apr 2026 23:23:20 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:3d85:f6e4:d741:ede1? ([2001:8b0:aba:5f3c:3d85:f6e4:d741:ede1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488eddba112sm26317435e9.0.2026.04.13.23.23.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 23:23:20 -0700 (PDT)
Message-ID: <31246c7aabc2eccb237f4c5b2e36e91184fe5314.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH 3/4] strace: Fix build with std=gnu23
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: raj.khem@gmail.com, openembedded-core@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 07:23:19 +0100
In-Reply-To: <20260411002929.571805-3-khem.raj@oss.qualcomm.com>
References: <20260411002929.571805-1-khem.raj@oss.qualcomm.com>
	 <20260411002929.571805-3-khem.raj@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Apr 2026 06:23:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235135

On Fri, 2026-04-10 at 17:29 -0700, Khem Raj via lists.openembedded.org wrot=
e:
> This does not build on hosts with gcc <=3D 13 which does not have std=3Dg=
nu23
> dialect option e.g. ubuntu 24.04, especially with clang which does not
> default to gnu23 yet like gcc-15, so autoconf 2.73 decided to enforce the
> standard with clang which then spills into CC_FOR_BUILD as well without
> this patch
>=20
> Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
> ---
> =C2=A0...kport-ax_prog_cc_for_build.m4-macros.patch | 229 +++++++++++++++=
+++
> =C2=A0meta/recipes-devtools/strace/strace_6.19.bb=C2=A0=C2=A0 |=C2=A0=C2=
=A0 1 +
> =C2=A02 files changed, 230 insertions(+)
> =C2=A0create mode 100644 meta/recipes-devtools/strace/strace/0001-m4-Back=
port-ax_prog_cc_for_build.m4-macros.patch

We have the same issue in strace's ptest Makefile as we did with apr:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/37/builds/3822

which leads to:

https://valkyrie.yocto.io/pub/repro-fail/oe-reproducible-20260413-8huodsh5/=
packages/diff-html/

CC_FOR_BUILD =3D gcc  -std=3Dgnu23=20

vs

CC_FOR_BUILD =3D gcc

so we probably need a similar sed fix there?

Cheers,

Richard

