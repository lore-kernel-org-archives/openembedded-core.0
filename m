Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C38C87FCB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:45:15 +0000 (UTC)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.web11.89525.1754059509978287233
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mHaUYW/f;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-71b737ec362so6641837b3.0
        for <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 07:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754059509; x=1754664309; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MA+eID0G1slr1AYPppvpBQ71kSvFFcWUtw5fk6TVwdI=;
        b=mHaUYW/f5RDIkHwunN6V8Um6WzX4/ARjPDp8k2J6jV2BwIFdpLDwpNMo19+dmv2voA
         aVVFdV8F1npK8C/5Yd9rFvI+pf3KN6Fg1G8K39iDOKi7ezLxHY1/3AJTbgA4xv3vh3Ro
         AzSoeJ+a4KkRqTm/UYTUZskJTEJtaVtelcnpYLPPcAuzGjDBD9MzTtr2/LmbmMACIepF
         yCDKiLJKU7cDPiv8Fn+eahTc6QESe4i3lkjauhq20nZhP1rE907Jnk9k5NYf3F/ob9T9
         nBAnPEHL7YiMaLdFw3O7CJ9Zc5ssWkEa/CuxQRyeMGqLR/nGu3BrSGyJsOorXKLxoXfc
         hRzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754059509; x=1754664309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MA+eID0G1slr1AYPppvpBQ71kSvFFcWUtw5fk6TVwdI=;
        b=mg7pFZymgCILOUCzSqZdT3EkFehZwfsDLuVGU3gHNV+X3vDyvp2IULM1Vs0XKw/1l6
         WydxbkaDe2xVnVPa/yMxRr7TZxhZZ1m51Ws9QxzwZWBeHuxpjh4I6lXO+OvGFUqlVhms
         7lUld9DAzJN/M2iXe2etaeo+YQxKKEvY6gVdVbCv3FJQc9Ci0NwLscNv0Poiu59q3btf
         59FXxofHUH3rz9knIP0I/leD2ZLjHTMpCikOSPXSiNpeVkK7RUbN6MnWL8cwzti7CXrG
         /C1AX6YVtkX0c9CQ8Se+AWqt2UqxoNt4iYXjFm2fe5DVJuPcFEP3d5T888Eg0CCLR8vR
         eWuA==
X-Gm-Message-State: AOJu0YzYscBMm+96W/UgXqosthOUi8UMktRBoG0k0LUNFQXv2rAR3Xdk
	EJTvDH6ku99mmio76x+qlC8Sm4aYk82nqhHQ/LYSbtaPQvKiAIJXZ/55DhHzooR61wLMs8Jh6IW
	0NSoHyk/2VSV8ktvEpIO5mb9UJ6g15dLYmlPQAS0=
X-Gm-Gg: ASbGncvFO17GGHIuXuMfVayYOBgLYnm0SeZmiNqA0XCRZ1Wfh3WXU6TmIB24Wtd5rJ7
	OJ1AnqM5Gei7O5o1t93yrfd5N+qjO21rsfn9GEt0R7L0WijpvrfbXfrw2CyTi1rO6z/QcZlG/wX
	SehsDtr/6Zdh56XQ5a9oo4axRZeoLzVyvHVK+jWWyzFTMjv1XqvQN/F3duv33PcrgJ3DEaf7KxN
	dXm/ZCCrOMmewI+8zHcRQ==
X-Google-Smtp-Source: AGHT+IHhryot0rq/QftQHBw8h+VT1/e6FFNNIOCEnFvveIZeKo19u+Phf8S7zFVVAznNKWKg7NUO3j9ZR76Y4MvKaH4=
X-Received: by 2002:a05:690c:f10:b0:71a:20b7:44f6 with SMTP id
 00721157ae682-71a465edab2mr169050507b3.6.1754059508943; Fri, 01 Aug 2025
 07:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250730043809.1486481-1-raj.khem@gmail.com> <0B0BA0A1-CC33-43C9-ADE5-41CA6878621C@arm.com>
 <B7693480-3AFD-484C-9AA1-D1866646736D@arm.com>
In-Reply-To: <B7693480-3AFD-484C-9AA1-D1866646736D@arm.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 1 Aug 2025 07:44:42 -0700
X-Gm-Features: Ac12FXyCtdBKsWImJ4K6QpFlnk0svy2ZhHBhhNhajlY6W213pd946RGvzc_YUtc
Message-ID: <CAMKF1srG4sn43KTzc7QvAZp=FEZtq5sD_S=E5Q+Jhk61KKMGOg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/2] libclc: Fix absolute symlinks in sysroot
To: Ross Burton <Ross.Burton@arm.com>
Cc: "openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:45:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221363

On Fri, Aug 1, 2025 at 7:41=E2=80=AFAM Ross Burton <Ross.Burton@arm.com> wr=
ote:
>
> On 1 Aug 2025, at 15:37, Ross Burton via lists.openembedded.org <ross.bur=
ton=3Darm.com@lists.openembedded.org> wrote:
> >
> > On 30 Jul 2025, at 05:38, Khem Raj via lists.openembedded.org <raj.khem=
=3Dgmail.com@lists.openembedded.org> wrote:
> >>
> >> This helps in creating relative symlinks
> >>
> >> Fixes sstate errors e.g.
> >> ERROR: sstate found an absolute path symlink /home/khem/yoe/build/tmp/=
work/aarch64-linux/libclc-native/21.1.0/sysroot-destdir/home/khem/yoe/build=
/tmp/work/aarch64-linux/libclc-native/21.1.0/recipe-sysroot-native/usr/shar=
e/clc/gfx90c-amdgcn-mesa-mesa3d.bc pointing at /home/khem/yoe/build/tmp/wor=
k/aarch64-linux/libclc-native/21.1.0/build/tahiti-amdgcn-mesa-mesa3d.bc. Pl=
ease replace this with a relative link.
> >
> > This seems unexpected.
>
> Oh, it=E2=80=99s because you=E2=80=99re testing a new llvm.

This is seen with upcoming clang-21, I do not remember seeing with clang-20

>
> Backport abe93d9d7e891a2a6596ddb0c6324280137c89dc.
>
> Ross

