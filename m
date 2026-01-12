Return-Path: <alistair23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 593F8D25031
	for <webhook@archiver.kernel.org>; Mon, 12 Jan 2026 00:13:19 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22042.1768176793981577767
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jan 2026 16:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=MPI18xEK;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: alistair23@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b8718187eb6so64515466b.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jan 2026 16:13:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768176792; x=1768781592; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/TzDEqD3ZSSdHv0/gGzlvGl0uzfIEEO3VjPkULZ/MJ0=;
        b=MPI18xEKUrSYJ+B8R8aGM7QaWQEI4XqRhdZJ+TQ8UilI1dJFWcmHmMVCPYQ2FokJtm
         /VosKS0+XzPvu90u6/yjVyLUh0nB8e+25nuqVbfFtwC4YJ+ObevM+PoGjkfBnRo7LJbt
         imUa+Q5g4x2wd9yt/T3+FNwwQBqRzJo8ybMkV2avm9X0cCC6PgUPrrLyEqy902W4keB+
         7Vs4B+ncL9mv60J70TKHNNWhJ+BgF+JTeEOU/3sAAbGqyY5rLX+E/nrLQgacLb5j87T3
         LBm3cDrCyT8v5QJNZX0fbshLlZelsLPLeIG/G4qB60xBfwWKZK9eA3l+OWnzxsNpALGi
         YMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768176792; x=1768781592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/TzDEqD3ZSSdHv0/gGzlvGl0uzfIEEO3VjPkULZ/MJ0=;
        b=D539+I3bBXFvIC35tNoycsK50Dx1WObTZOtOgo9eFmhmnZK7CnXsjPtnFxfAqSBrkn
         KxGg5N8dpOgtNZ/2l8inNRE2OMM2BbdrxoTPTGPGZ7sbt26A5V9RdZiE/0sjCUCuugjI
         FRmHjM6tEkB+cG+5bYYP5/NqReOhKDJtzaUxWXrFNUkI1mAkZwCX1NhrAbNNfhp8rJyc
         gqzsY5gEYn0sFJzflBvc+6Kb6ReoqtynNqzsAQgHLvs9z/V5DNVEpWdWJ33iaOv6OUGO
         nbTExpIPs2fTxTJovzi36OGWI+aR/HPxDv2cK4wJShLDGVbu7CAdUm+HjO9vB9FeeNQI
         3+3A==
X-Gm-Message-State: AOJu0YzF/DcKJR5NIC7n1xbCLuKPSia+oqcjIKWx2wEDVsn91dU7qfLM
	Z7rrmMYfyX9jefO7SjYOpyEDyip+VypJepGkX4pkVyt65uFNs+9ChZkk7JsNtNYpvbY8LkfO0lk
	6yEFyXhiKNhZUXqPJeS6kHEgLSRpAbw8=
X-Gm-Gg: AY/fxX5alWNNSDHgn0v2qEKTHE34gjzy1mmbHCfvzDAtRux5JJMezyj5qGx8FJEM/Tv
	FhSYzellc7lDF3pqiG2PvukmPQt7Z9LjxRtVcqr3uhenfXXDl0BZfvO8LZ5r30wlpoJHWv8LAKX
	EbcfCXzi7rGSZAuOvlF6awr1hc0OdVthdpeBkxelKVAxbe+NAktJsEr8qKNpd6SMHeGXOzZKaqq
	dWFhPxYyQonYvbZiAdLKWX+snwVO4X1x0FTrso12pYH51Nc4tjhuAfCqaYGsV39LrGSmQAwOez3
	BMPftzamFsXjSZ9I6qVvnc1F2g==
X-Google-Smtp-Source: AGHT+IGc/n5MdyVEHSURN1PEgLEijGs3NBf7OsyN7O05V8KqbSd+dA2lSn4pZSbo/rVRFjhZcrtSZB1wl3kMu2lZiSA=
X-Received: by 2002:a17:907:68a4:b0:b87:115:a724 with SMTP id
 a640c23a62f3a-b870115ab6cmr265606366b.34.1768176792136; Sun, 11 Jan 2026
 16:13:12 -0800 (PST)
MIME-Version: 1.0
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com> <20251230141540.1974380-3-Harish.Sadineni@windriver.com>
In-Reply-To: <20251230141540.1974380-3-Harish.Sadineni@windriver.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jan 2026 10:12:45 +1000
X-Gm-Features: AZwV_QivF_xxpXBUkOUXdq8HQEhVVFBYN4kTdL5d4Xb2ViROnkjXpn7DKdYVw38
Message-ID: <CAKmqyKPPRQ9DV_gBHZo21OJwLr2oKCVD2mdDRfubpnGStebjTw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 02/15] linux-yocto: conditionally add
 clang/rust/bindgen-cli-native to DEPENDS
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com, 
	yoann.congal@smile.fr, elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jan 2026 00:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229180

On Wed, Dec 31, 2025 at 12:16=E2=80=AFAM Sadineni, Harish via
lists.openembedded.org
<Harish.Sadineni=3Dwindriver.com@lists.openembedded.org> wrote:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> Conditionally add 'clang-native', 'rust-native' and 'bindgen-cli-native' =
to 'DEPENDS'
> when rust-kernel distro feature is enabled to support Rust-based kernel m=
odules or
> features that require generating Rust FFI bindings using bindgen during t=
he kernel
> build process.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-ker=
nel/linux/linux-yocto.inc
> index 4d0a726bb6..41b12b6f14 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -81,6 +81,8 @@ KERNEL_DEBUG ?=3D ""
>  DEPENDS +=3D '${@bb.utils.contains_any("ARCH", [ "x86", "arm64", "powerp=
c" ], "elfutils-native", "", d)}'
>  DEPENDS +=3D "openssl-native util-linux-native"
>  DEPENDS +=3D "gmp-native libmpc-native"
> +RUST_KERNEL_DEPENDS ?=3D "${@bb.utils.contains('DISTRO_FEATURES', 'rust-=
kernel', 'clang-native rust-native bindgen-cli-native', '', d)}"
> +DEPENDS +=3D "${RUST_KERNEL_DEPENDS}"
>
>  # Some options depend on CONFIG_PAHOLE_VERSION, so need to make pahole-n=
ative available before do_kernel_configme
>  do_kernel_configme[depends] +=3D '${@bb.utils.contains("KERNEL_DEBUG", "=
True", "pahole-native:do_populate_sysroot", "", d)}'
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#228668): https://lists.openembedded.org/g/openembedde=
d-core/message/228668
> Mute This Topic: https://lists.openembedded.org/mt/116997863/3619028
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [al=
istair23@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

