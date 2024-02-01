Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B12DDC47DDB
	for <webhook@archiver.kernel.org>; Thu,  1 Feb 2024 12:46:01 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web11.14344.1706791557376575561
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Feb 2024 04:45:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M/5KEZe+;
 spf=pass (domain: gmail.com, ip: 209.85.215.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-5d8b276979aso640910a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 04:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706791557; x=1707396357; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lWssQUHHfTgj1tjuivrqpxEyzpYzymQh2BIqs94hXHQ=;
        b=M/5KEZe+2rdmU+lwcoZqKefP8BPkoGyAWH5UI1qagmo3NpiXTLPtoKFDmQIJ2KXlv3
         SjM3K2zti/DzjdX1GPpI5kFGzXFdPmNO3vsudJE48bQYsRDF/C8XR82MxHeoUWJWDEcG
         SLlg8fU92PohKzJxb4jSJendDYCzwsIqeNxcNNC9XZUCdufUUFnP2+BA5HMScsRlUd+E
         ARAGeegLKDfnXv+yrEgAUzW40KRWRVxYieGsjAmC1EAEDVayWIlf4bNJLoShv+u6Drd3
         UEfB90EJv7QxuU/dONMrCC7Hm5K0WXwdOreFhRxqODzVUfnT36kFMIG1h76okx97Tevn
         3e7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706791557; x=1707396357;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lWssQUHHfTgj1tjuivrqpxEyzpYzymQh2BIqs94hXHQ=;
        b=e7KHkj3SzehpuGRkTTW63+r8B0/BN5k2EIHdS/yHw6vLBFSqr0V8S7LE8Gb/5/Ov04
         2R+jKpsMDz8ZOIFkv082GH3YmwXBthuwvKLP+4SLbqaMd3OyyQyjIEStnveyHUut/51N
         SaQckyhcn3t1NTWv+QCjwGqhhtmu2F2vxjO70ZwKe4WwsK0zTxWq2O5tSx8pwGSbwgdU
         orujuDEy04oyJyLhEDPPEQ3WnL5MV16HvgBYqXUQoR7aQRu1QmsM8x7VJWnQpcwCrtXn
         dIR+kDzOMBAE0Hwnld33yfYv9RkZpRFNKMgEE2eHe7KiZPJ6s7J/PrYwFGTtmWqEDy0o
         ozuA==
X-Gm-Message-State: AOJu0Yyn8N2G7m+JSvEeHv/csj7sj6ijRRELrQFo7VD5eZOfltcb2q80
	pzAy7+LVTIJpXFkJb1CrzCsODfyyviHlt6WS4OFwIda9ifh1EieXV6Q2mGZg4pJg6Be/CrW4DwL
	F8SeGkQtq7lRC2VqHtnWF5grytbE=
X-Google-Smtp-Source: AGHT+IHTaaaG8RDasTwj9Bh209//OptIoXxGz0YonKBYza6iP5yFSdaEP+SaiKJ8z9C+9TnLIhkYU9+6WDPYPSTR71s=
X-Received: by 2002:a17:90a:77cc:b0:296:2b4:df8c with SMTP id
 e12-20020a17090a77cc00b0029602b4df8cmr2883591pjs.18.1706791556464; Thu, 01
 Feb 2024 04:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20240201115326.506503-1-claus.stovgaard@gmail.com>
In-Reply-To: <20240201115326.506503-1-claus.stovgaard@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 1 Feb 2024 07:45:45 -0500
Message-ID: <CADkTA4NBTEH9js2E+KBGx3_LeLzd0RDCVY9gw2gHp-qP5ooO_Q@mail.gmail.com>
Subject: Re: [OE-core] [master][PATCH] kernel-devsrc: fix missing RDEPENDS
 gawk and make
To: Claus Stovgaard <claus.stovgaard@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Feb 2024 12:46:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194585

On Thu, Feb 1, 2024 at 6:54=E2=80=AFAM Claus Stovgaard
<claus.stovgaard@gmail.com> wrote:
>
> gawk is also needed for x86-64. See scripts/check-sysctl-docs
> Since version 6.6 the package rules has been split up into a rules file
> resulting in the need for make. See scripts/package/debian/rules

When I looked, the rules aren't actually used when we are building an out
of tree module (and via make scripts prepare) indirectly.

In a situation like this the approach I've taken to exclude the source from
devsrc to keep it minimal.

If you are seeing gawk required as part of building a module or make
scripts prepare, then we definitely do need to add the dependency.

>
> For reproducing the issue on a normal qemux86-64 machine, change to the
> linux-yocto-dev kernel, add the kernel-devsrc to the toolchain target
> task and disable ptest in distro features. (Notice ptest pulls gawk and
> make in as RDEPENDS for other packages hiding the issue)
>
> when populating sdk you will see dnf failing.
>
>  Problem: conflicting requests
>   - nothing provides /usr/bin/gawk needed by kernel-devsrc-1.0-r0.qemux86=
_64 from oe-repo
>   - nothing provides /usr/bin/make needed by kernel-devsrc-1.0-r0.qemux86=
_64 from oe-repo
>
> Signed-off-by: Claus Stovgaard <claus.stovgaard@gmail.com>
> ---
>  meta/recipes-kernel/linux/kernel-devsrc.bb | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-ke=
rnel/linux/kernel-devsrc.bb
> index ce5777fbe9..222f6cf8e1 100644
> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
> @@ -395,7 +395,9 @@ RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH', 'x8=
6', 'elfutils-dev', '', d)}"
>  RDEPENDS:${PN} +=3D "${@bb.utils.contains('ARCH', 'powerpc', 'elfutils-d=
ev', '', d)}"
>  # 5.8+ needs gcc-plugins libmpc-dev
>  RDEPENDS:${PN} +=3D "gcc-plugins libmpc-dev"
> -# 5.13+ needs awk for arm64
> -RDEPENDS:${PN}:append:aarch64 =3D " gawk"
> +# 5.13+ needs awk
> +RDEPENDS:${PN} +=3D "gawk"

The commit message should really say "all architectures require gawk", if t=
his
is the change we are making to the actual RDEPENDS itself.

>  # 5.13+ needs grep for powerpc
>  RDEPENDS:${PN}:append:powerpc =3D " grep"
> +# 6.6+ needs make for debian package rules
> +RDEPENDS:${PN} +=3D "make"

Similarly, we should just be removing the rules from devsrc if they
aren't required
and we can avoid this dependency.

Bruce

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194584): https://lists.openembedded.org/g/openembedde=
d-core/message/194584
> Mute This Topic: https://lists.openembedded.org/mt/104095126/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [br=
uce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

