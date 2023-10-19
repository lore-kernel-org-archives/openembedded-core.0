Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E94CDB465
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 12:40:50 +0000 (UTC)
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
 by mx.groups.io with SMTP id smtpd.web11.26310.1697719242117420924
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Oct 2023 05:40:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FyXIbXwx;
 spf=pass (domain: gmail.com, ip: 209.85.166.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-35164833a21so1863415ab.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697719241; x=1698324041; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cIN75/f5SKus6uyiP0ntmT/udYI4thI4J8GlnZnc1Tc=;
        b=FyXIbXwx5Kx12sc2t6SRcx+27BbrlLY+/mSGXOD1631HSI+hjebNy4zg/zzPP9hDZu
         FC+EuG2imHnPzIF/S+C7ikjU8Fe4koUpraxKtA3sjgKUxdcUiKMfXizp7duR7+0fucpm
         s2SyJuSxj9yUBpnO8Rh153FIUKfrUiNExV16gRIS/Hm4U8iMv56EjXmOrQagfystB194
         hNDOr0Bu65ieoWx2ZbwTsuJaB6598kc77ZkYBk/oNA4u1pkg0SGuSqiojiImUnn9opLo
         yJxuhekz6ZUOIojz/elLtw1w+5uXz2Xt5JaSNolAui591+XMvx6RIWT2RarNZPiwXE73
         dCQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697719241; x=1698324041;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cIN75/f5SKus6uyiP0ntmT/udYI4thI4J8GlnZnc1Tc=;
        b=YW6DHEW3U0R0rnmvNR+aGt/BsuSnYnJ+ykoVwD+PRyzw4tf8/a8NA5r6sg3wX1TaDK
         PMYVht+Wbar8DZzf7HiRmovLpT3oAQ33DK+8iuUZWZz7HN3c6sK1m0+yDzNSufgripzc
         V+DzwX/CzynfNa5eZTIcFMM8jD8TzqpXbZr5ncGtDIVOCXjFtb1drqKPj0PKgfmlMwl6
         oF86bVbBni4vdOFiRtdl3dVjqiB7wCTYSgKOOQrVmu+1hM+ASbrrkRIBF2HA2q4/cSP1
         pzZhpA1YUGxO6pb01i+8PBrtbvQKYYaTre5l+BhBH2EjU1Qdbmxrc4AiUTT4ef/llDnl
         RzaQ==
X-Gm-Message-State: AOJu0YxPhE+P1dgzX8nMauaujo6seArbbk50QsZIWhomX9+pdI1/oKe0
	s0YqfIPJbOww2/79/DtfE/hr77R/5EJkt/zVlCU=
X-Google-Smtp-Source: AGHT+IH+icgBfOqsSoZQSVrK0idUaacwzm1rfyI33YeqhO/fPkywnsTyGCTZepY9b8I/t6EKNph1UfYjD81O5E3e4U4=
X-Received: by 2002:a05:6e02:3888:b0:351:e7e:bf8 with SMTP id
 cn8-20020a056e02388800b003510e7e0bf8mr1517044ilb.7.1697719241232; Thu, 19 Oct
 2023 05:40:41 -0700 (PDT)
MIME-Version: 1.0
References: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
In-Reply-To: <20231019123202.2195576-1-rasmus.villemoes@prevas.dk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 19 Oct 2023 08:40:29 -0400
Message-ID: <CADkTA4OYooZsd50P1=AqrU4+RYj+Rk3CC3EkhDv=FwN+CX=vgw@mail.gmail.com>
Subject: Re: [PATCH] perf: lift TARGET_CC_ARCH modification out of security_flags.inc
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Oct 2023 12:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189453

On Thu, Oct 19, 2023 at 8:32=E2=80=AFAM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
>
> From: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
>
> Building perf without security_flags.inc being included in one's
> distro results in the buildpaths warning
>
> WARNING: perf-1.0-r9 do_package_qa: QA Issue: File /usr/bin/trace in
> package perf contains reference to TMPDIR
>
> because the ${DEBUG_PREFIX_MAP} does not get used. Most recipes get
> that from CFLAGS, but the perf recipe explicitly unsets that.
>
> Now ${SELECTED_OPTIMIZATION} of course contains more than just
> ${DEBUG_FLAGS}/${DEBUG_PREFIX_MAP}. For most TUs, perf's build system
> adds its own optimization flags (-O6 for odd reasons), so for those
> including the -O2 or -Og doesn't change anything. But looking at the
> .o.cmd files show that there are some TUs which currently get built
> without any -O flag. So for those adding the distro's
> SELECTED_OPTIMIZATION seem to be the right thing to do.

The change is fine with me.

>
> Signed-off-by: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
> ---
>  meta/conf/distro/include/security_flags.inc | 1 -
>  meta/recipes-kernel/perf/perf.bb            | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/dist=
ro/include/security_flags.inc
> index 2972f05b4e..d97a6edb0f 100644
> --- a/meta/conf/distro/include/security_flags.inc
> +++ b/meta/conf/distro/include/security_flags.inc
> @@ -69,4 +69,3 @@ SECURITY_LDFLAGS:pn-xserver-xorg =3D "${SECURITY_X_LDFL=
AGS}"
>  TARGET_CC_ARCH:append:pn-binutils =3D " ${SELECTED_OPTIMIZATION}"
>  TARGET_CC_ARCH:append:pn-gcc =3D " ${SELECTED_OPTIMIZATION}"
>  TARGET_CC_ARCH:append:pn-gdb =3D " ${SELECTED_OPTIMIZATION}"
> -TARGET_CC_ARCH:append:pn-perf =3D " ${SELECTED_OPTIMIZATION}"
> diff --git a/meta/recipes-kernel/perf/perf.bb b/meta/recipes-kernel/perf/=
perf.bb
> index 675acfaf26..a6110dedc9 100644
> --- a/meta/recipes-kernel/perf/perf.bb
> +++ b/meta/recipes-kernel/perf/perf.bb
> @@ -72,6 +72,7 @@ SPDX_S =3D "${S}/tools/perf"
>  # symbols and this is preferred than requiring patches to every old
>  # supported kernel.
>  LDFLAGS=3D"-ldl -lutil"
> +TARGET_CC_ARCH +=3D "${SELECTED_OPTIMIZATION}"

I'd even go so far as to add a comment above the relocated line with a
hint / reminder that this adds the debug prefix map.

Bruce

>
>  EXTRA_OEMAKE =3D '\
>      V=3D1 \
> --
> 2.40.1.1.g1c60b9335d
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

