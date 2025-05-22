Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB8FC54E65
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 15:05:30 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.web10.26007.1747926321952459707
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 08:05:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aY08NHqv;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2d522f699bcso3047966fac.2
        for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:05:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747926321; x=1748531121; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zS6fHfLBpMfy2UFvIcagDohtCwz2FNmO8eAQqDHWpCI=;
        b=aY08NHqveuHiD/h6SAeJKRPzXuqeQkdO/EW9yEF45FP/lX05erwQUx4YeeAqndvd11
         dvsW4gf7H1c1IXxEMvIh/WDSAOhXGCgwNG5gPGss5yIdRJjjQe9+AlZWBnvsY7BekNSU
         Fpm67Ckw+jSqBGEd4Mcnhu/f81jeQ89hc1HPxH6f1mYmsKudzoHj9oJq63DLbtxBScqd
         UKnZ6Im5vnaDG9Ti13ORSw/6e/Z6rCW0l45rGPjeBc7BgBtA8/EPHbJIpxUamJ4TGeKT
         B5YhKr6eqi5P/ZlOqp96OwuHpnxygC43F92cj5PRQYsAMzio0CimVhDmQK4uq6TA6VHK
         AuQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926321; x=1748531121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zS6fHfLBpMfy2UFvIcagDohtCwz2FNmO8eAQqDHWpCI=;
        b=K6IeSWUR7M70EB4ooTFmCZhkp0KSXgwLQr/qGghR0ONUfWGKAAw2mWZYEPu+6Yll4C
         nrXv0SfSGyyUGqMdtHr6p4Zp9XmF84sd9l8QYSJbNkhfxOqfyQMH+1mBJLCk/du9PNMN
         Ih8Qp9OEe1GWEIfxQnk9zyA6J5kg20JYKHXdrJJymLCwWFpvSVIrKYDbLzgkaR7k2Rmi
         +7hW2VPner+RBwlUTet5lHshuptcLTvGNW0DVwNDH69vLL7xOdf/0NxoFTt5vaT4luq0
         bwqqU8SFkuzAk5q6dwaSNXP9IdF3tNmLi0HgqCZdPKuUk8ErLlrx8cusppJu4KAulVWL
         Ou8Q==
X-Gm-Message-State: AOJu0YxwztPhDD1B/7j/PEuO07U7QMMy0JFb/zORZwKvhDqnhCCct/N3
	jX6MWyreMdzmRRSbsn52mCpWtFueHVppOraEAS0NoV3/pNI4Lbui0Y7vhnZ+0cyEJd267kOE35F
	hOnRNtn/rbz9k07Ab04vW+wDNLzA3SUQ=
X-Gm-Gg: ASbGncvU3JJ88/1Xud7Nhfc16w99PgNpl+IQ7AvsJBfXoumZgZ3VORdjGigGdP0daW4
	V6Mkdtu+dXK4RvYbrX3lueu2KMGoYLlNYc3bZ7YOsGahLC5H3RmzJw/6uzq9x5QO+UmSRzosLzU
	SpwznlOWHKl5yJTwaCGOi8OyukNC7D2bKj
X-Google-Smtp-Source: AGHT+IFdse3SWTBdk5RpnbHt++dlexCiTMv5M5b9u77aSJKOPNXD7yGEZ4VUigXXv859XHAaZZ/7d7jekuUtSv7oq9Q=
X-Received: by 2002:a05:6870:ff96:b0:2d4:e420:926d with SMTP id
 586e51a60fabf-2e3c854fdf8mr16819956fac.29.1747926321093; Thu, 22 May 2025
 08:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250520-clang-toolchain-v2-0-db97c2eb3756@gmail.com>
 <20250520-clang-toolchain-v2-25-db97c2eb3756@gmail.com> <CANNYZj8zmVkDj=2H-iPvGiYUy=RUnafr4HEb0eXRH+NpaM6JRA@mail.gmail.com>
In-Reply-To: <CANNYZj8zmVkDj=2H-iPvGiYUy=RUnafr4HEb0eXRH+NpaM6JRA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 22 May 2025 08:04:54 -0700
X-Gm-Features: AX0GCFu2bvBGKrx9DrjNU8g1Q2Fv4gb2EkAKQO3i3m1nFqKFVwDfW7jDha5C4Dc
Message-ID: <CAMKF1sqDDvG0H+qYrELDDyMc++PjH84jftddUVcuhucYSvqxgg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 25/28] seatd: Disable sign-compare warning as
 error on clang
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 15:05:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217125

On Thu, May 22, 2025 at 3:17=E2=80=AFAM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> On Wed, 21 May 2025 at 08:20, Khem Raj via lists.openembedded.org
> <raj.khem=3Dgmail.com@lists.openembedded.org> wrote:
> > +#../git/common/connection.c:154:55: error: comparison of integers of d=
ifferent signs: 'unsigned long' and 'long' [-Werror,-Wsign-compare]
> > +#  154 |         for (cmsg =3D CMSG_FIRSTHDR(msg); cmsg !=3D NULL; cms=
g =3D CMSG_NXTHDR(msg, cmsg)) {
> > +#      |                                                              =
^~~~~~~~~~~~~~~~~~~~~~
> > +#/mnt/b/yoe/master/sources/poky/build/tmp/work/riscv64-poky-linux-musl=
/seatd/0.9.1/recipe-sysroot/usr/include/sys/socket.h:358:44: note: expanded=
 from macro 'CMSG_NXTHDR'
> > +#  358 |         __CMSG_LEN(cmsg) + sizeof(struct cmsghdr) >=3D __MHDR=
_END(mhdr) - (unsigned char *)(cmsg) \
> > +#      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +#1 error generated.
> > +CFLAGS:append:libc-musl:toolchain-clang =3D " -Wno-error=3Dsign-compar=
e"
>
> This is silencing an error, and it would be better to fix the issue
> instead. Also, why is it musl-specific?

It does not look like a problem in the package but rather something in
system headers from musl since CMSG_NXTHDR is from sys/socket.h thats
why its done
the way it is. I am working with musl to see if this is the right
behavior for musl

>
> Alex

