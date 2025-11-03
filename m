Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 889E3CCFA03
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 19:20:35 +0000 (UTC)
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.176.1762197632599425317
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 11:20:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MogOjfEx;
 spf=pass (domain: gmail.com, ip: 209.85.160.42, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-3c9a42d6349so6034977fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 11:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762197631; x=1762802431; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4jkmLxT5EMbrg2Hqzi83i3u6DcTCScy112EJ095vTRg=;
        b=MogOjfExhsy+uLbsO7JdyHQhPweT8smErBdx0sSBU+8Q/Cp42r74N9PpoJX3E/5ezS
         nfaJOzatH8jvvGL/VQd4eA3jyll+SX9Ap5ks+XHUHpXTGraexWhpmWmFklojb54oyRnl
         2/4elz8grwSephluJGbuXNSZsb63SZIAj60TND/5nHhLPxnaCsKLk+4oYi2CdP1k3djO
         LXcHiObVUIqFqhb2mbB+ThvjuGd4xCIrMDOihdOG8RLUFgZOHUPUAzkho+iB5vSoseCz
         /8jqAfT/+vcZT0kib2y2i69jPCinW2tndhCB7PMs3IOTmnkbi7FFtxSpZXgJPqVS5+9y
         mZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762197631; x=1762802431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4jkmLxT5EMbrg2Hqzi83i3u6DcTCScy112EJ095vTRg=;
        b=lAPZUePa020a7nfAIFLr0KA7uGA29+BuJDgA0KHreZJhnz3GdYz8eoNZfH8/oI6yXV
         aqtagw3aIZwC1ZHHtWJJAnXZRU1zBDTztDgefksM5Ml3Nh+6EhWy1jTFAKj6xlkcaEvi
         iSiX8M4tTbYMmY1RGgLF14UahNMRk8KcEVZDR+0R9pq6N+nG8Oe5edh8BITidOHOI4VP
         Tep9n4PvWBX3Ao7mlAixfKt6eDqHkA1zn91vNKwrqhvvJHoPSDchCj7IoIj7mhTu3C4O
         /ydiRVX0g+pld64iDfbKEt198diJwFH6yEAIWGRn8/d6cS/exuJMpXl5R3B3CmxdE32R
         8vXw==
X-Gm-Message-State: AOJu0Yx9xmQ2aui01BmkqBXg4LtYRh5Q4BO7p1/Yog2owU/ypqojJdgp
	m0vldfpSgWiGiQyx/VixeLcDNQEsSAuPw26TvqyHniJSzzMsZwF6Vqjzl2FZSNXpZVidbsjTMh5
	7fcXT/8nh73YjfZtJvCNImUUVip9V7Pw=
X-Gm-Gg: ASbGncua2NxxmC7YBisAOtD/JzRseyNVWd7XKsHWtJ6Q968XqRqDmhqQ/JoO498UcPr
	6+W/CvysNRxMOWTbQC2FwihsKCGHkWQRLNkgBfJZ0gq38op2ZzSWgWrn9wRLa6QfijTGdRAh1jz
	9LbXSJnDJHI4CSTmR/OUC8DxPbl+eHHq64Yt/vk8iIhoMdBpZww9Vl83QWOK/d/4DukmhmPG3Cc
	DDmzHeZxtNiU6XnEOZIwsILwD9lXO2QtHl8Oh8B2D6sSUtjjYUK9fN4JbR0puci9qIbGcl/cQ==
X-Google-Smtp-Source: AGHT+IHsTmklKKwzJWCiCYA6taHAkxfeTNNrByOiu0G8gDj4b1pRkDqtJo+Mjj7vGe5DR++WyQ/AaZHiEM9r3GCUwZA=
X-Received: by 2002:a05:6808:6a96:b0:43f:1ae3:78f1 with SMTP id
 5614622812f47-44f95e82a4fmr6462296b6e.20.1762197631473; Mon, 03 Nov 2025
 11:20:31 -0800 (PST)
MIME-Version: 1.0
References: <20251102084855.1555197-1-ankur.tyagi85@gmail.com>
 <20251102084855.1555197-3-ankur.tyagi85@gmail.com> <DDZ9QEGSEJ8V.1DSQEABXR0UC5@bootlin.com>
In-Reply-To: <DDZ9QEGSEJ8V.1DSQEABXR0UC5@bootlin.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Tue, 4 Nov 2025 08:20:20 +1300
X-Gm-Features: AWmQ_bkqi_m7bja0OB9lt-HdkMTUXwijGtlKcQ_U87B2sbSHyewX1Rs7HqC1zbg
Message-ID: <CADySD0FXx15PEdM2HWiG4NOSO9Zi8gPYPDKNUu_FmVz+z_KhOw@mail.gmail.com>
Subject: Re: [OE-core][PATCH 3/5] iproute2: upgrade 6.16.0 -> 6.17.0
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 19:20:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225691

On Tue, Nov 4, 2025 at 7:24=E2=80=AFAM Mathieu Dubois-Briand
<mathieu.dubois-briand@bootlin.com> wrote:
>
> On Sun Nov 2, 2025 at 9:48 AM CET, Ankur Tyagi via lists.openembedded.org=
 wrote:
> > From: Ankur Tyagi <ankur.tyagi85@gmail.com>
> >
> > Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
> > ---
>
> Hi Ankur,
>
> Thanks for your patch.
>
> It looks like this is breaking with musl:
>
> ERROR: iproute2-6.17.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-=
worker/musl-qemux86-64/build/build/tmp/work/x86-64-v3-poky-linux-musl/iprou=
te2/6.17.0/temp/run.do_compile.3517119' failed with exit code 1
> ...
> | /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64=
-v3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h=
:29:1: error: redefinition of struct or union 'struct in6_addr'
> ...
> | /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64=
-v3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h=
:40:1: error: redefinition of struct or union 'struct sockaddr_in6'
> ...
> | /srv/pokybuild/yocto-worker/musl-qemux86-64/build/build/tmp/work/x86-64=
-v3-poky-linux-musl/iproute2/6.17.0/recipe-sysroot/usr/include/netinet/in.h=
:45:1: error: redefinition of struct or union 'struct ipv6_mreq'
> ...
>
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/3/builds/2729
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/6/builds/2694
> https://autobuilder.yoctoproject.org/valkyrie/#/builders/111/builds/1414
>
> Can you have a look at this?

Sure, I will try to fix this error in v2
>
> Thanks,
> Mathieu
>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>

