Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CE73C10F1A
	for <webhook@archiver.kernel.org>; Thu,  9 May 2024 03:16:27 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web11.1612.1715224587239053198
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 May 2024 20:16:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bhP0Knvf;
 spf=pass (domain: gmail.com, ip: 209.85.215.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-613a6bb2947so351171a12.3
        for <openembedded-core@lists.openembedded.org>; Wed, 08 May 2024 20:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715224586; x=1715829386; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KA0aUutEEe+WrAYb1zDNhpFRe16ZvrNk5ItrGmyh1Y=;
        b=bhP0Knvf/jvCelOZdyALYMEq5/yLUg2xurVCG53ShJsf93zDciSRDc4/EiVcogOm2T
         4ATG8bYzMRqRmSc6vgyk/N8+TvSxL8ejlj4dEzJZ2ZQb5x48RBAzbF7nwwwByTRC/F7k
         0cuujuATGz8mDJXwDgnWlq+tSJq57440wgYMOTQ7imURM109ssKF7VpXKVQDWWrs7q23
         pNOJKSGjJdBmKysVyCMo3foa4Ze3EypusMQ74u+a7COBIrnxW4WqV8N342JRzlkbVl/e
         1BfWJ/Vb5LvdTwjutXjiMrpTvCFFTy/x7npbLfIx7iitnbs0p2tddGlCWRQC/bcECh9p
         ywHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715224586; x=1715829386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7KA0aUutEEe+WrAYb1zDNhpFRe16ZvrNk5ItrGmyh1Y=;
        b=ZokCFeU2c3YMkDnSo7dGBGwIdUyXOC2o9g7bdmbJtDkS2v9PvgwFgoy89HMoYf1PQb
         Hbl9pNdmo8GNCnis/f4IbvigP2Ok7A2s2YfiG443/4NBfCiEymcf0G4YFLKEc8L6cvPo
         0FJ2OCww04H12tHR39Jnzehqn14dtBmVsvhhCXSsycj8ts19Is0cu6TmCvGe7KuCV85F
         P/17f02RscHmh/1YRtZ5pyEVQy1rWdcWxkbjT9TZx7z5S1QickbWM6aT+W11Bi0BeAx7
         0vprgk1i5BFuRzZOAsKI5nrvWTJ+uOBCSfbHrLIQmIhusCefyBeo8SDwUpx6UtoXx99I
         XVsg==
X-Gm-Message-State: AOJu0YyVpvT/8QtzX+lgVBrF9ACd+rczX2er7RqrRrG/HdDvRQtEJ+Pv
	W4K1tjcr4nCwGsPkLCRmplz8XsteoM/juUhce2ZitkQMzkpkxmJvr1DKchvRItc7qv7zG9htymo
	u5tgoAJ1mwO0xNcf86zlFwZ2q304=
X-Google-Smtp-Source: AGHT+IEP0LcIYiJgviF5QMxFigWy9vwhZtK/C6eO7fN88LgIc97NBt9ScMmOHiP+7a+2d38ZvVaWW6E6Wduk+PHb//4=
X-Received: by 2002:a17:90a:d501:b0:2ae:b8df:89e7 with SMTP id
 98e67ed59e1d1-2b6169db565mr4639663a91.38.1715224586323; Wed, 08 May 2024
 20:16:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240509012206.517279-1-raj.khem@gmail.com>
In-Reply-To: <20240509012206.517279-1-raj.khem@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 May 2024 23:16:15 -0400
Message-ID: <CADkTA4PtK4TvaqpO=0wZMjG78QTygojrDO7S33sTbb4M_ZPiLw@mail.gmail.com>
Subject: Re: [PATCH] linux-yocto: Enable team net driver
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 May 2024 03:16:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199137

On Wed, May 8, 2024 at 9:22=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Cc: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_6.6.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-=
kernel/linux/linux-yocto_6.6.bb
> index 71bfbf9e032..4503ec94ae9 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
> @@ -66,6 +66,7 @@ KERNEL_FEATURES:append:qemux86-64=3D" cfg/sound.scc cfg=
/paravirt_kvm.scc"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("TUNE_FEATURES", "mx32=
", " cfg/x32.scc", "", d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/scsi/scsi-debug.scc features/nf_tables/nft_test.scc", "", =
d)}"
>  KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/gpio/mockup.scc features/gpio/sim.scc", "", d)}"

We are getting quite a few of these now and that isn't a problem. But
I think we should
probably start putting comments above the enable lines so casual users
will know why
the various fragments are being enabled.

For example, I don't really know what the team driver is, and why
ptest needs it!

Bruce

> +KERNEL_FEATURES:append =3D " ${@bb.utils.contains("DISTRO_FEATURES", "pt=
est", " features/net/team/team.scc", "", d)}"
>  KERNEL_FEATURES:append:powerpc =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64 =3D" arch/powerpc/powerpc-debug.scc"
>  KERNEL_FEATURES:append:powerpc64le =3D" arch/powerpc/powerpc-debug.scc"
> --
> 2.45.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

