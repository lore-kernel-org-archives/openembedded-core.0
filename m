Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18775E92713
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 15:05:59 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8740.1766847950612099600
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 07:05:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X4R7YrRs;
 spf=pass (domain: gmail.com, ip: 209.85.210.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7aa9be9f03aso6494477b3a.2
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 07:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766847950; x=1767452750; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/L4u0y5aFMpu0BEU6s7u4xoY2m7UB/6Jy+dgZrMQHoM=;
        b=X4R7YrRs5vHPoO4/WAEc+912mnO30zyriQ4eqieZDtduWhKL58fNJ4K0JyoNT2+HF0
         k6ZM4UICXWJRnXjuXX8ZwSbUsd25RottX1blT8xkxC9o0kerLGLkcxWnBFTlaQWfoea/
         Wr6WZQaqOJPueY/tk9VfdHqqvIUrtwA5JyjtPOc+BRDH6sKBLunba6ltJ74x+6HYYWya
         kWLbK0wEdOzX8UnYu3/3ZsDmGaFjm/Y+DYNC1jcnLNfi+F9p0/L+ZJxHYZbug6PwyQhA
         gzjB12dllK083ygxADIDfjuHcCUY8cu34dH1lb7CMcMtDdXfwJ49kC96D77RXJ7/U+AU
         PsrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847950; x=1767452750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/L4u0y5aFMpu0BEU6s7u4xoY2m7UB/6Jy+dgZrMQHoM=;
        b=qDq9XWzNNSs0kfqrVh9zF2DWCe22exmmDI2n1Oh9iyqsYjJKsuIHEmTn1UQGLOj7Uk
         cvEs3XcqrtPIt6fxnaXrzhurjl4WlvKqvtB68qv31bDolKn0jpZQg5g4Et0qrSIb3Xdr
         9Ht5zTJ6C7dSSKz8HeZlhTesXCq+v6yXB0BeoXbrh2NdE6twDBbB+eLkYDsctQtL+ZgL
         dz4Jc6h0H+3pXEPoZVYULTxHqBVybFhSzWwsP0BtOs3ARvsotmoHR28OfbVoSju08/u6
         9NUcdK6iL3mUkv/5OB/JqQKgvCZYnY7V68vYPSk02N9npJ2IE6ujz5bPXrQhqBIMWexw
         2Jbg==
X-Gm-Message-State: AOJu0YyAjuBziqeuFpsvwG5rdkuXal4kJzfdFRevn7GFZpNpqbuNcjlz
	92n7pSILAFqkf/hQP6g8RddWBg8bMR6Mq74UuPSCtDGksw0h89CInH8piL8tzLIv+SQ6gm+FP/2
	qzlkG2z/bHZczJHgYVI6goZC/5u4UT0s=
X-Gm-Gg: AY/fxX5bIPXTQ9pVWHEXUvoh4sWTrTrtrWU7V7uIacN4gc+c8tqWhG/X3TkGnbTR7tA
	4hV4MhbVaBEeCC6HRVQ3/sRd6nGRoI8ib987i1O4DQ8T5jUVH8ojWHj9jFk4O8JADBF57N1NEyW
	W8oL4Iq3it65BWAODjsyivTCiejqZhMKN3Qgk+mC7Bsen2VKQSqvbB6eUUl5FhIBniS8J3JQW3J
	dteDhSHQXqMQMcu1umukRsNfOZFqxEYZn+Zls/9ItACntm7o8gYzwhu8DvGfk+q/mX/xw==
X-Google-Smtp-Source: AGHT+IEMLf/FywDGpq/zQ6D10Y6flZQt8zK9GKNYx1ZY2RwKNwNYWoCxOokcyU5qyO1GFb16UGpl++xDjhCx1Pl7Y/w=
X-Received: by 2002:a05:6a20:9184:b0:34f:b50e:e2e2 with SMTP id
 adf61e73a8af0-376aa1e75c1mr26489587637.58.1766847949938; Sat, 27 Dec 2025
 07:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com> <20251227113251.773795-7-Harish.Sadineni@windriver.com>
In-Reply-To: <20251227113251.773795-7-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 10:05:37 -0500
X-Gm-Features: AQt7F2oJhJjPFLAVHyLjAEphthZzrkHIPWkqkOByNHKboYS7QrBAGUE0j5PNt-k
Message-ID: <CADkTA4PX8XgjzzN9WOzrXiXR3fvExGS40gVw8KiXoaCX8TCwbw@mail.gmail.com>
Subject: Re: [PATCH 06/16] kernel-yocto: add rust support via "make
 rustavailable" in do_kernel_configme
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 15:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228574

And here's the answer to my previous question.

To me, this patch should be squashed with 05/16.

Bruce

On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com> wro=
te:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> To enable Rust integration in the Linux kernel build, this patch:
>
> - Adds `rust-native`, `clang-native` and `bindgen-cli-native` to `do_kern=
el_configme[depends]`
>   to ensure required tools are available for Rust support.
> - Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
>   the kernel for building Rust-based modules or core components.
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index 2584cadf0d..dda235d4d0 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -463,6 +463,11 @@ do_kernel_configme[depends] +=3D "virtual/cross-binu=
tils:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "virtual/cross-cc:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "bc-native:do_populate_sysroot bison-na=
tive:do_populate_sysroot"
>  do_kernel_configme[depends] +=3D "kern-tools-native:do_populate_sysroot"
> +RUST_KERNEL_TASK_DEPENDS ?=3D  "${@bb.utils.contains('DISTRO_FEATURES', =
'rust-kernel', ' \
> +                                  rust-native:do_populate_sysroot \
> +                                  clang-native:do_populate_sysroot \
> +                                  bindgen-cli-native:do_populate_sysroot=
', '', d)}"
> +do_kernel_configme[depends] +=3D "${RUST_KERNEL_TASK_DEPENDS}"
>  do_kernel_configme[dirs] +=3D "${S} ${B}"
>  do_kernel_configme() {
>         if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true',=
 'false', d)}; then
> @@ -513,6 +518,10 @@ do_kernel_configme() {
>                 echo "# Global settings from linux recipe" >> ${B}/.confi=
g
>                 echo "CONFIG_LOCALVERSION=3D"\"${LINUX_VERSION_EXTENSION}=
\" >> ${B}/.config
>         fi
> +
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true',=
 'false', d)}; then
> +               oe_runmake -C ${S} O=3D${B} rustavailable
> +       fi
>  }
>
>  addtask kernel_configme before do_configure after do_patch
> --
> 2.49.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

