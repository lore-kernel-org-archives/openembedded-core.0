Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94A5C47DDB
	for <webhook@archiver.kernel.org>; Mon, 29 Jan 2024 17:17:15 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web10.351.1706548629170047714
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jan 2024 09:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZAYyGn2N;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-214ca209184so1307874fac.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 09:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706548628; x=1707153428; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=viLwGxkOQrgApO+SFVyy878+3r6/DRUyKMLUB0WD9s0=;
        b=ZAYyGn2NMUbcgTcMt2dv9TtLQ0s86FOMtW5Xmb9Jl0Q8Xb7YKb1bGeSE5B79ZVr/3F
         UVv3aU0i4EWh10BKTKPZy1I6eJt6L7ZWlD9Mtu5BykR5ZU11YKdU5bCm+yE7DTSnciWZ
         t9w3J/Mi++7ABYQTkl7n1ngn1aW1HfeGPK4A9/w1htWsT4Tf8KpDr0F62WFZTq61zepz
         hQvn+eMR4FhMZ0g0Dp1b539gnkq5lgMwMqz2wlBkYBnQtzMDfIzSzazl9vXj2hiRbafb
         TgPWQ95p39QVm8SOzS7mWNbD7elpNFjJk8wp3aBhdnvPEa+tHNYQDnWz7s1/p+deHw1X
         EeyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706548628; x=1707153428;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viLwGxkOQrgApO+SFVyy878+3r6/DRUyKMLUB0WD9s0=;
        b=sKXacAHT1tUDro8c5j160nKaX3MX0up0eQH+N2/V/2Kb2NbO2Kq7HglP/37ipp7Uwq
         5UComycPma54YMd2Cba/1eaxVCEvV7QEK9KSjzqvz0+WfGKTU1A0AvuMJ5S+vKy1hljE
         BOjyL/84wsnm5BmfDk07XFqFG6sbLGNJhmE02R6yH2eZA+/X8RAPOdovxI8hi4Tg/vjS
         +3EUuAVheK9szNEdrVCM8mrhzBNqxPfS1PBF+q0qfCkP6CrkpF17pLsPz1hQpAVcB59h
         OcRZtyXgvXRHczKzR+sI0qNW3URY8PbfgaeTVBh+12cFAu0f1EJpBcE6CaKoOcP9o8ra
         cLhg==
X-Gm-Message-State: AOJu0Yy+1g8CL6Q0belsXLQyQUChKC5/KuFMKJf3ak+HV0QEQ4kZvidc
	kyIR7GNkAbOSC0mhnrcJv4ZCrFSNwe6v0O0Np2y2BDoYch/lpY4JW0DzfxlSD4dKw+2DskKwYuc
	oCGYYjrH3NHjkXdrgeT16PY3n/qI=
X-Google-Smtp-Source: AGHT+IGNpzz2WdvG2El5VXWxwqWRvWi6DuI8sQtmrnLlD76BwoB59htg5zr4HxvTbTSs1Xr/l3y4vEdCgJDp+X20efM=
X-Received: by 2002:a05:6871:1ce:b0:218:54e3:88f8 with SMTP id
 q14-20020a05687101ce00b0021854e388f8mr7303775oad.25.1706548628071; Mon, 29
 Jan 2024 09:17:08 -0800 (PST)
MIME-Version: 1.0
References: <20240129100659.107901-1-thomas.perrot@bootlin.com>
In-Reply-To: <20240129100659.107901-1-thomas.perrot@bootlin.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 29 Jan 2024 09:16:42 -0800
Message-ID: <CAMKF1sramDULktY1P_wtNSitiLHbaU=JVN6haPEfKRNe2kjtQw@mail.gmail.com>
Subject: Re: [OE-core][PATCH] opensbi: skip ldflags QA
To: thomas.perrot@bootlin.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jan 2024 17:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/194469

On Mon, Jan 29, 2024 at 2:07=E2=80=AFAM Thomas Perrot via
lists.openembedded.org
<thomas.perrot=3Dbootlin.com@lists.openembedded.org> wrote:
>
> From: Thomas Perrot <thomas.perrot@bootlin.com>
>
> Quiet the following GNU_HASH error:
> ERROR: opensbi-1.4-r0 do_package_qa: QA Issue: File /share/opensbi/lp64/g=
eneric/firmware/fw_dynamic.elf in package opensbi doesn't have GNU_HASH (di=
dn't pass LDFLAGS?)
> File /share/opensbi/lp64/generic/firmware/fw_payload.elf in package opens=
bi doesn't have GNU_HASH (didn't pass LDFLAGS?)
> File /share/opensbi/lp64/generic/firmware/fw_jump.elf in package opensbi =
doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
>
> [YOCTO #15370] -- https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D153=
70
>
> Signed-off-by: Thomas Perrot <thomas.perrot@bootlin.com>
> ---
>  meta/recipes-bsp/opensbi/opensbi_1.4.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-bsp/opensbi/opensbi_1.4.bb b/meta/recipes-bsp/o=
pensbi/opensbi_1.4.bb
> index fd18c03cfbc4..e36ada081428 100644
> --- a/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> +++ b/meta/recipes-bsp/opensbi/opensbi_1.4.bb
> @@ -43,3 +43,5 @@ FILES:${PN} +=3D "/share/opensbi/*/${RISCV_SBI_PLAT}/fi=
rmware/fw_dynamic.*"
>
>  COMPATIBLE_HOST =3D "(riscv64|riscv32).*"
>  INHIBIT_PACKAGE_STRIP =3D "1"
> +
> +INSANE_SKIP:${PN} =3D "ldflags"

hmmm I wonder if we should pass the OE ldflags, and test it out before
disabling this QA warning
try something like TARGET_CC_ARCH +=3D "${LDFLAGS}"

> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#194454): https://lists.openembedded.org/g/openembedde=
d-core/message/194454
> Mute This Topic: https://lists.openembedded.org/mt/104028517/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

