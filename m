Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B523AD3E762
	for <webhook@archiver.kernel.org>; Tue,  5 Nov 2024 20:59:58 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web11.30936.1730840389724164085
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 Nov 2024 12:59:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VDXjhryF;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3e6105886dfso122284b6e.0
        for <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 12:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730840389; x=1731445189; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ZGY+koO7jBplH6zkaY04kzVv3ITEnUonV0+Tg41rwM=;
        b=VDXjhryFVprAwRNMg3pSkm95H1szxnGYS/MCv1Bj94WoGB4XxYODpnL1/EQsusFU2d
         5DroVqtTACDcX52IgeS4R1v3EK+W0lO+ijXPCQYJqqfcgH3/foxKGrzQJamf7kc4zyAK
         yYQygj471/bfchmeG3mfInsFIY0kHJJMGKGeIy5siPq/JopI2upbLBc0GgeGb5Z06Uvd
         utgUY9e1oBh+nk7Jez9ppr5eXJhdaoaXDRuHXomX2IA+ke2uO5posOvEJeCPxSTxW3mh
         d5rNo3fF2YN49okj0jYt8n6gOnEC9syUoFebQ7vUdjVpmV0VQj/qZNGJ6F1TJv8hn1sv
         HwPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730840389; x=1731445189;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7ZGY+koO7jBplH6zkaY04kzVv3ITEnUonV0+Tg41rwM=;
        b=nWWJlokEVp3ieNIaG3KQmDDiQIOe+HfI0O5yyQ7Ez21uNmmgikk4BK8LeJImI0d7uv
         70whl8F5iMXg/7yAJlYzdZdumydsPcBsu7qmQbAsrJlXDj99M1EWdyKSgJmGi2w3HyJM
         OOlo0fzLQlPdOK0oTcUnWMzkODSRXL/UWA16bHkcEqKUBEEq7GDCNRR3cGvYfIh96v7x
         2J3NpTwSzc0bnw12saA25i26lSKU0k4bSBs0LF39HJObok4T+Yb/RyN8L00kLkkpV9mP
         8bpU2X3k0X+VyDznIEzivzThrMunp1u5mSNJ42G8LLcthzDz+kVUo0LUHFBiqnZHGtow
         fZCg==
X-Gm-Message-State: AOJu0YyykEtvDg4w6/6jazKvPEkbBltP/GAiyl71Q0vg8eGQ/VNCvwPs
	P+DNuSfGRUQUHaqHinL5fpDDBD/IlHBKTBzN4f/p/zw/UvWdEAv07CCE5Ibnq0UgRXrSUC1dHr5
	zggb60QbxcVFvodE3ss8Slk3ZYhvN3w==
X-Google-Smtp-Source: AGHT+IH3/sRy7r4I1kHPMDoDxfGBIjClPw1WYftUJO3cmMvI3iLVtd73WOvqIJvIfO0Lzv0mPNhcZoN8IEbxfTYQdLU=
X-Received: by 2002:a05:6808:1804:b0:3e7:5f8a:e45 with SMTP id
 5614622812f47-3e782831585mr14254b6e.8.1730840388956; Tue, 05 Nov 2024
 12:59:48 -0800 (PST)
MIME-Version: 1.0
References: <180446A0F11CA2F7.30502@lists.openembedded.org> <2d3ff647-1f43-4a66-9f96-a4c56b1b5702@windriver.com>
In-Reply-To: <2d3ff647-1f43-4a66-9f96-a4c56b1b5702@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Nov 2024 12:59:22 -0800
Message-ID: <CAMKF1soADzAXAX65e88H3s4NhksLc3UW+42UhLuhp43nR1s5DA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH scarthgap] systemd: stable update 255.4 -> 255.13
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	"steve@sakoman.com" <steve@sakoman.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 Nov 2024 20:59:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206754

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

Thanks Randy, I hope these are minor adjustments to patches being
forward ported. If more let me know
if you need anything

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

