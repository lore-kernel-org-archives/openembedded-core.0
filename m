Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D02F9C87FCF
	for <webhook@archiver.kernel.org>; Sun, 10 Aug 2025 22:41:31 +0000 (UTC)
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
 by mx.groups.io with SMTP id smtpd.web11.35581.1754865690347525876
 for <openembedded-core@lists.openembedded.org>;
 Sun, 10 Aug 2025 15:41:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WPS1rvz/;
 spf=pass (domain: gmail.com, ip: 209.85.219.171, mailfrom: raj.khem@gmail.com)
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e8fe618dc71so2815020276.0
        for <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 15:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754865689; x=1755470489; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5WpaP2qQqkCNa6uTbLWSNNBmKXkk74zdJYBCZqvE79o=;
        b=WPS1rvz/r6MoUIIIYcI/OZyX+OQPdR2WcJV2XAz7GR97J9a0bLnwmxMEhocmZbDqK3
         KKGIKro7paEj6QTntb+ZclQN7F2jK/FhRfi8UNnh/oBRuK3RXwHlpTzZlDdLFDkSDTyx
         5SeM/MFv8qR7pswwpoGDHPR4JCWnhUh8I/Ns9NhWZM27OddAJsjH5a/B+cRDWyXIbBz2
         iEAkp0gguNhxkvnnUSrP/BVogdfnw9I4jb5t+Sc+6iSwPpAADtUekoFviUZ7r0LjlkYb
         jphDrvaHi+FT2T18tFnjkCDP3fFuyMebOt4DD2zKdYR0py2mN3vUY2+60jxWSrDJ6s9u
         hvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754865689; x=1755470489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5WpaP2qQqkCNa6uTbLWSNNBmKXkk74zdJYBCZqvE79o=;
        b=B2FM7mL5uhKg0XNgQJGz+Pe41QzTjDZCbe+RNE9dsI/QoaBX2PzzbnhMGBMcCNthee
         ZecHgR6ZljqU20n2zcsajAogyVcDpSoICBWW3pkAOtu72eNj3j/qeRvwyZ7Omv83zrnM
         REs/5VhcGYVT+uvZEpU/uNKZ/NEIYNiDITeTPL+qRVagPpoW35WkBAUR1N1q+JWboAAg
         zlOZnf+SsHMLA1PD/T/eFkm4vNnNJTHjGzmfs1sXO6tjvEJ+RXvlVwf+3BtTpKBQXddv
         N6aPr2QRTDa/+PLfXANNAQRHGo465yb0b7u/UENtA8msvkpK633EZirOxPI0ISpO1tjR
         3UzA==
X-Gm-Message-State: AOJu0YzSQXCVaiA3B/ndZfr+tHDB14MBIYldXhqXF6XZkBqbWRJW9TaB
	0DKMt/jg0lKX7uUUeZ+n2CZRVKFPlQAke0AF+aQppUH2SzY6gpFc03q6/hOtRVIrJ4tFEYhWYZE
	/XL81bspLHYsjp8mfOyj6WrIG4WTcnjEoRankT+8=
X-Gm-Gg: ASbGncusCzbs+8x+V4Q00U+JcqiQUrMl3eAEvZI9wJl7EJkdSnGyQkDmcW/XoQkvIC/
	MssEfs5kSPjNebMGE+NVFBe9c/EguIybIJChMcTXN2wfi6Y2H4PfR+RxUSJFr8N9ALVkdk0qe+e
	SVtJ7E9lkalTPIPIVuyoanzmcLCmRvaRA+WMRapeyMk0i+5OjWmJtXXLz3gzY6KLuVjoaSMPlpb
	S/SLQbDzbRwk4R1WXlgNbhrs8EQczDl8SNfavEU
X-Google-Smtp-Source: AGHT+IEvItxuDdRGIrH+kYOrvAhFf036HHWXaxZ4ydSizaRcJPOnXn9yGA/gKKQOuKPfpc8J2yzqv2TR/MzCqF82Qd8=
X-Received: by 2002:a05:690c:6088:b0:71c:1de5:5da3 with SMTP id
 00721157ae682-71c1de5facemr38958517b3.31.1754865689290; Sun, 10 Aug 2025
 15:41:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
In-Reply-To: <20250810222523.2487072-1-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 10 Aug 2025 15:41:03 -0700
X-Gm-Features: Ac12FXyJ3xN3P3znkfnIadbgm8QI6RAgl8fQ0QvoMvrdaEE2zY1iyzriIgIzk0k
Message-ID: <CAMKF1spAtSH9gE1+BrZTUuPaM0a=JBtpkmjNLS+w59BLo8GBRA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] Revert "qemux86-64: Reduce tuning to core2-64"
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 10 Aug 2025 22:41:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221706

On Sun, Aug 10, 2025 at 3:25=E2=80=AFPM Richard Purdie via
lists.openembedded.org
<richard.purdie=3Dlinuxfoundation.org@lists.openembedded.org> wrote:
>
> This was originally applied as our autobuilder had older hardware and cou=
ldn't
> cope with the newer settings. This has been resolved in the new cluster s=
o we
> can go back to the newer tuning, which software is now more likely to nee=
d.
>
> This reverts commit 369b1dfa28b1791d45f068acc765190defecd460.

LGTM
solves - https://github.com/openembedded/meta-openembedded/pull/984

> ---
>  meta/conf/machine/include/x86/qemuboot-x86.inc | 4 ++--
>  meta/conf/machine/qemux86-64.conf              | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta/conf/machine/include/x86/qemuboot-x86.inc b/meta/conf/m=
achine/include/x86/qemuboot-x86.inc
> index 6ae03633aea..82ef4a0b732 100644
> --- a/meta/conf/machine/include/x86/qemuboot-x86.inc
> +++ b/meta/conf/machine/include/x86/qemuboot-x86.inc
> @@ -4,8 +4,8 @@ QB_SMP ?=3D "-smp 4"
>  QB_CPU:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>  QB_CPU_KVM:x86 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
>
> -QB_CPU:x86-64 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> -QB_CPU_KVM:x86-64 ?=3D "-cpu IvyBridge -machine q35,i8042=3Doff"
> +QB_CPU:x86-64 ?=3D "-cpu Skylake-Client -machine q35,i8042=3Doff"
> +QB_CPU_KVM:x86-64 ?=3D "-cpu Skylake-Client -machine q35,i8042=3Doff"
>
>  QB_AUDIO_DRV =3D "alsa"
>  QB_AUDIO_OPT =3D "-device AC97"
> diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux8=
6-64.conf
> index 62108b703b6..8aac7634b75 100644
> --- a/meta/conf/machine/qemux86-64.conf
> +++ b/meta/conf/machine/qemux86-64.conf
> @@ -3,7 +3,7 @@
>  #@DESCRIPTION: Machine configuration for running an x86-64 system on QEM=
U
>
>  require conf/machine/include/qemu.inc
> -DEFAULTTUNE ?=3D "core2-64"
> +DEFAULTTUNE ?=3D "x86-64-v3"
>  require conf/machine/include/x86/tune-x86-64-v3.inc
>  require conf/machine/include/x86/qemuboot-x86.inc
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#221705): https://lists.openembedded.org/g/openembedde=
d-core/message/221705
> Mute This Topic: https://lists.openembedded.org/mt/114638379/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

