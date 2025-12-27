Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1ACE8E92712
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 15:03:29 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8840.1766847803789265452
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 07:03:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hMeX4MSK;
 spf=pass (domain: gmail.com, ip: 209.85.216.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c277ea011so8048423a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 07:03:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766847803; x=1767452603; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ri1y+5Tn834im+wCUjApOjKtY5wKWhIiLnrwBmrWc+s=;
        b=hMeX4MSK3qE+i9PY7ZENxBikNUgYBDhoOqpgmWF0TyXSZ/ZacT5fNV5vc7Eqz2cqZN
         8GTR2h1bJ1GHUAxYgKJ3b6nN/7xtymcHmMO/nOPO8Jf7er5WZjaHw8qayUVH2MEFK/Zf
         rYNJkxZchBeZBkFv/P3460zq5p8ivzkdDre7ReBLndPYZSdKZMG/9exFQpXCAWyWaFPN
         +L/Mo4d3B8Viam0fAEpUydV+4aHkPcid1h4GFhY582PRyhgn/lzBzNNGYWtpAt0OHvv2
         k9rMROEPf4KckBraXuqEdA+qF8vWku0Mptnn3XJolhfh7HcUhS8lFtd5JyILCUpz/QWb
         CYkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766847803; x=1767452603;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ri1y+5Tn834im+wCUjApOjKtY5wKWhIiLnrwBmrWc+s=;
        b=S51yrE84c5vIzvVmw0DOrqKUmRilB5jLrUkN8CyTDln/rRIfJbMIerF6SefsNShdnJ
         pqzXAz+S+7luK5s62rZcw6qDhmkZCln+Tbm93XYeVAinudVaYrsa+1fokGtVlkLPv/yk
         CFgWma2HoSrfZNDqg39YFcdpx35v8E9q6kN92ymFT8L7xqsuOPdep0aahw4mEghZtd/K
         BG+Cvy2uRwm8HbPsJ8V9T1bzMf58HuwNYd1bo5tBq7InItkG+F/4vCQmMPg+VdsRzv5h
         Roxji1eL66RiTW4BVcb5CAZ2CHRjvqufCfPu1KJkqWfeXYjRyUErXDjPYq6uGsTix4Xo
         AD9w==
X-Gm-Message-State: AOJu0Yx/7txK+Lk9BbW5/RKAkTo/hbH+1v+xbUFdSz8SbF4LfB2q2BRx
	aiYdrsva0foVdUGef9EQuadE4SBVp/E1ZqO0R1X98MgIglzS0ORNH4cWNTCredAXPkZg4DtPbC2
	ycr3TBV8lO1MvlFVq/Kvplp4J/hgK0cM=
X-Gm-Gg: AY/fxX5IM/6nmG0E5iAT22vfYe3RuoroeYSBlg0sy9V7d/8SQaj1yvWCZiS9xSsV/7a
	fpvpr4brbHSkp5T4DvDgUhBoob6LlS3p+k2gi8OhRE89X+M0crNaWXnacbmyw0fwYumcKfbdiMB
	FmThGIpmY6h7VQ1uDvAmIlsPXEAookiH0k7OJnhOBlH3hoMhc300pFscJFCCUcSYWR4uZDgaDGJ
	t4DyonMjWcNi4TLRr/eQI2h8unT80zk/m83Wx6IvaH6Omy4v6VcWJNH9GAC44MhL+PJmQ==
X-Google-Smtp-Source: AGHT+IFaIsG9eyTr7ecU06TiiW3ENEyi3A5or1aY4GcfVWtB8jDNHcrwgp8MyD0q6nntePxrpUHRiOkcCfw74y9oh7I=
X-Received: by 2002:a17:90b:2f47:b0:343:66e2:5f9b with SMTP id
 98e67ed59e1d1-34e921bf160mr24185605a91.24.1766847803066; Sat, 27 Dec 2025
 07:03:23 -0800 (PST)
MIME-Version: 1.0
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com> <20251227113251.773795-6-Harish.Sadineni@windriver.com>
In-Reply-To: <20251227113251.773795-6-Harish.Sadineni@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 27 Dec 2025 10:03:11 -0500
X-Gm-Features: AQt7F2plA87YANsN8xSkeS8e4hDa8P5LFF0ExijmDsXsrx5IwEv4iMuZypSVhVY
Message-ID: <CADkTA4NJkyhue37mEMpy=dqwzv5nHzZSbRbHyi3TSvHOV9keXg@mail.gmail.com>
Subject: Re: [PATCH 05/16] kernel-yocto: stage rustlib sources for linux-yocto
 'make rustavailable' support
To: Harish.Sadineni@windriver.com
Cc: openembedded-core@lists.openembedded.org, Randy.MacLeod@windriver.com, 
	Sundeep.Kokkonda@windriver.com, yoann.congal@smile.fr, 
	elmehdi.younes@smile.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 15:03:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228573

On Sat, Dec 27, 2025 at 7:33=E2=80=AFAM <Harish.Sadineni@windriver.com> wro=
te:
>
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>
> When building the Linux kernel with Rust support enabled (e.g., via `make=
 rustavailable`),
> the build system expects the Rust standard library sources to be availabl=
e under:
> ${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust
>
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
>  meta/classes-recipe/kernel-yocto.bbclass | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-reci=
pe/kernel-yocto.bbclass
> index e53bf15194..2584cadf0d 100644
> --- a/meta/classes-recipe/kernel-yocto.bbclass
> +++ b/meta/classes-recipe/kernel-yocto.bbclass
> @@ -465,6 +465,13 @@ do_kernel_configme[depends] +=3D "bc-native:do_popul=
ate_sysroot bison-native:do_po
>  do_kernel_configme[depends] +=3D "kern-tools-native:do_populate_sysroot"
>  do_kernel_configme[dirs] +=3D "${S} ${B}"
>  do_kernel_configme() {
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true',=
 'false', d)}; then
> +               if [ ! -d ${STAGING_LIBDIR_NATIVE}/rustlib/src/rust ]; th=
en
> +                       mkdir -p ${STAGING_LIBDIR_NATIVE}/rustlib/src/
> +                       cp -r ${TMPDIR}/work-shared/rust ${STAGING_LIBDIR=
_NATIVE}/rustlib/src/.
> +               fi
> +       fi

There should be a comment both here, and in the commit message
about why this is done in the configme task.  i.e. is it related to
configuration ?

Bruce

> +
>         do_kernel_metadata config
>
>         # translate the kconfig_mode into something that merge_config.sh
> --
> 2.49.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

