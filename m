Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48810D44D71
	for <webhook@archiver.kernel.org>; Wed,  6 Nov 2024 14:02:27 +0000 (UTC)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
 by mx.groups.io with SMTP id smtpd.web10.46356.1730901738158768637
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Nov 2024 06:02:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=D0p7zU7H;
 spf=softfail (domain: sakoman.com, ip: 209.85.219.179, mailfrom: steve@sakoman.com)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-e29327636f3so5877620276.2
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 06:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1730901737; x=1731506537; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGkEqxzF9pNTcQ/MlGdHddVTlvrJiKZYXdiK/ePPR5w=;
        b=D0p7zU7HynSlGbtmymtTkGHeMA2GXP9lukoSGTNgzeALTKHJ7/3tZ035+gvWDqg3KK
         QZDyesyUrTOD2Yr0JZkmNwMicpWmeorTU3+R5fxlWIgk8bDpU2NB+EFbKNoaj5N7fo3V
         qbyWw7jzBPJj03A6KqlDsMJJpKQ49qDgs0EjRt3E8+B65rR81BIytyGf4vfCSIlPZR+9
         S0Ex3G5Mlx1gGnMzEC8DicCQI8YuNr9CAh1/a496JSB3aYuKgxsVrgz5Ud+E9FFXsW8f
         RZFP1Z/Ie+Ncd5iJd/KlhtpTWjvYdrd1HBCpqgdqdlYqJxbkuR9l+gjidA2F06eJ4aVa
         KR3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730901737; x=1731506537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cGkEqxzF9pNTcQ/MlGdHddVTlvrJiKZYXdiK/ePPR5w=;
        b=ISrXU2KL3QCEibe8uI/UITP/Ng7qZguN9KPMT/Hmyw0BbmZiMs0fRd2wdq2xpIZPIK
         JXQsYQuq93RK690ikeMZso9j8gwcwigxOgE5OZzl+fKMGdOLHlVWVlFhl2M1qSeyVwkQ
         gKhSOZhAyjI3NXXA9r9WhUleZQOO/SBrq0F1IlWHzQfwm93joIqJT2me+CLsKqve18ud
         Kdy6I46DywNSk6gFkZx7LMPvIipRAqv1Y9hxM6m1PScSOI3f4ukU8p6WvVWCxsTMgCJq
         blJn5yLKkKVGseX8Z7zlj89MmnHo3UjoCGHXNXGZhNg04OMgLc3r41LrB0UPg3Ioq3Ih
         gmzQ==
X-Gm-Message-State: AOJu0YxTJtneIz4R6cRanp4dlN4QZY3KNVq/vt0VqLR1P6o42IBqGATE
	ZPBrDwNzQqDdiBDP9scfTa4kNotyFZjKngjYPm2sHaVB+Q+ukwBUwHjKqYhaqVnc7o6li6PIdmq
	8R7gdiVfG9WrxHDaQDnejYBjGuitCGuR/aftgOQqyVwqphVzN
X-Google-Smtp-Source: AGHT+IGE9ypp38zXjq4Bb5pQz5nhPgenAQT48yaposm9NLF+/yEJ+nSOAMexJWFl9J6glNb6g1zVGsCvjc1CQTw57jU=
X-Received: by 2002:a05:690c:6108:b0:6ea:4e1f:2b39 with SMTP id
 00721157ae682-6ea64aafc16mr206501567b3.4.1730901735701; Wed, 06 Nov 2024
 06:02:15 -0800 (PST)
MIME-Version: 1.0
References: <180446A0F11CA2F7.30502@lists.openembedded.org> <2d3ff647-1f43-4a66-9f96-a4c56b1b5702@windriver.com>
In-Reply-To: <2d3ff647-1f43-4a66-9f96-a4c56b1b5702@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 6 Nov 2024 06:02:05 -0800
Message-ID: <CAOSpxdZGL=Bf9V+NpmzuWi5GY94VJSyhCVBBBCVccPxcVRr9ZA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH scarthgap] systemd: stable update 255.4 -> 255.13
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Nov 2024 14:02:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206782

On Tue, Nov 5, 2024 at 11:55=E2=80=AFAM Randy MacLeod
<randy.macleod@windriver.com> wrote:
>
> On 2024-11-02 6:16 p.m., Randy MacLeod via lists.openembedded.org wrote:
>
> From: Randy MacLeod <Randy.MacLeod@windriver.com>
>
> Full change log:
>    https://github.com/systemd/systemd-stable/compare/v255.4...v255.13
>
> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
> ---
>  ...stemd-boot-native_255.4.bb =3D> systemd-boot-native_255.13.bb} | 0
>  .../systemd/{systemd-boot_255.4.bb =3D> systemd-boot_255.13.bb}   | 0
>  meta/recipes-core/systemd/systemd.inc                           | 2 +-
>  .../systemd/{systemd_255.4.bb =3D> systemd_255.13.bb}             | 0
>  4 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-core/systemd/{systemd-boot-native_255.4.bb =3D> syst=
emd-boot-native_255.13.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd-boot_255.4.bb =3D> systemd-boo=
t_255.13.bb} (100%)
>  rename meta/recipes-core/systemd/{systemd_255.4.bb =3D> systemd_255.13.b=
b} (100%)
>
> diff --git a/meta/recipes-core/systemd/systemd-boot-native_255.4.bb b/met=
a/recipes-core/systemd/systemd-boot-native_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot-native_255.4.bb
> rename to meta/recipes-core/systemd/systemd-boot-native_255.13.bb
> diff --git a/meta/recipes-core/systemd/systemd-boot_255.4.bb b/meta/recip=
es-core/systemd/systemd-boot_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd-boot_255.4.bb
> rename to meta/recipes-core/systemd/systemd-boot_255.13.bb
> diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/sy=
stemd/systemd.inc
> index a35db5091e..88f24f99c2 100644
> --- a/meta/recipes-core/systemd/systemd.inc
> +++ b/meta/recipes-core/systemd/systemd.inc
> @@ -15,7 +15,7 @@ LICENSE:libsystemd =3D "LGPL-2.1-or-later"
>  LIC_FILES_CHKSUM =3D "file://LICENSE.GPL2;md5=3D751419260aa954499f7abaab=
aa882bbe \
>                      file://LICENSE.LGPL2.1;md5=3D4fbd65380cdd25595107900=
8b364516c"
>
> -SRCREV =3D "387a14a7b67b8b76adaed4175e14bb7e39b2f738"
> +SRCREV =3D "565916c245b53b49f5917f5326d21246f46ae3db"
>  SRCBRANCH =3D "v255-stable"
>  SRC_URI =3D "git://github.com/systemd/systemd-stable.git;protocol=3Dhttp=
s;branch=3D${SRCBRANCH}"
>
> diff --git a/meta/recipes-core/systemd/systemd_255.4.bb b/meta/recipes-co=
re/systemd/systemd_255.13.bb
> similarity index 100%
> rename from meta/recipes-core/systemd/systemd_255.4.bb
> rename to meta/recipes-core/systemd/systemd_255.13.bb
>
>
> I just remembered to test the TCLIBC=3Dmusl build and
> of course there are some problems.
>
> I'll fix them and send a follow-up patch on top of this one
> so best to not merge unless you really want to Steve.
> Please let me know.

I'll wait for a v2

Steve
>
>
> ../Randy
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#206658): https://lists.openembedded.org/g/openembedde=
d-core/message/206658
> Mute This Topic: https://lists.openembedded.org/mt/109359316/3616765
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
ndy.macleod@windriver.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
> --
> # Randy MacLeod
> # Wind River Linux

