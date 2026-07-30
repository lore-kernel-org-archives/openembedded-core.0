Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF15AC54FDF
	for <webhook@archiver.kernel.org>; Thu, 30 Jul 2026 10:43:54 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8647.1785408232782213074
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Jul 2026 03:43:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Fjh03/V6;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49802c418b5so2898985e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 03:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1785408231; x=1786013031; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=xee9Hz+614T09xBj8QdCX2FzznshzVtDeHKaSstHK2k=;
        b=Fjh03/V6UD4Ey5LJzR+u83WU0GUI/I1vSiUN7asNjvNfsJ6DEQeJQPD33vJp73d4c7
         DtgtW+sJN8uq/vNrNiadUgjgReUEvOYprnWiGs2drOLeSSnNOE1Yb0J432z/bb6XdxsF
         4hkSj968HZ1Agj132RNtsmbkvr2gh05s9TdL0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785408231; x=1786013031;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xee9Hz+614T09xBj8QdCX2FzznshzVtDeHKaSstHK2k=;
        b=TjSKdjYH6pGgzB3Wfx8Zawu62ULA5ds/MAmWy9t/y+KiqBwXn1I7F4kTuQNu7er+OM
         KA5uI1aBx7w5qds3OIvVTv03OV/Gv3OGac96+hxt29bGyJ2PxAdyMSo8yNLfQboWaq6U
         4EINteMg4Vv5Sg9sLsNChxIBbXjEO0o4CQp2uL3Cn2fNuUtWl8q9g/l46/IU7gm6GcPy
         TRF+ZZKvNq8tlZWjuUKFQevq+0bflF5XWm+uVGgGZ6ug6t5L17ZIfO6Z5IM9lAOQF4a1
         GeqSHuR9dTwqSAjQ0QHKKTPKQaLY0BB85ZRBfgH+ZTB1SuZyRVn7etCY/X427Y7GYNWl
         tUug==
X-Forwarded-Encrypted: i=1; AHgh+RpOSsNWFohO0XEKxCuSJioLZLObSEWWqUxvdMr8isaaPU0xu7najh7H73jVyO0EXv9yawAAH6l4op2+dzbfYtQAdg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxYMCe0qcFyn5/ix5WCJqefELG8jl8WQqPEf6hLuh4vUN+tBJ8
	Bkaph02hE2WojTRU/BEPFkDPc4sSSF2Mx3Zn6RywGSBHUFZq8mASM+4SuuZnxyuCMRg=
X-Gm-Gg: AR+sD10KTHk95lMLPZkESdSuKwFmizju3iTYbMs3xRPPMp+9a+ftW1CFE0nXQ1Q1EX3
	LnE9IymyFPiksI0/uBUWNRakwHhL2sIAmEJgWB9wNsksxlXDr2nDOSGMHi/TVZUdIaCtjzY8KDx
	EBG+4+7JNJk2GpmbKu2jRv2d6H9x/s2rCYq8BKbBFCXV/zLlxdI5jv5uI74FSiDAMxDbi0HYOdZ
	8yyGn919Vx380G2VRjCcIPrD7tO4TtyYSXLhNtlapi6SrhrrD0nvs8Z8nG3BsOLAdrtPJzo07nq
	lpoodKbpme0DR7Z4TRMgKtz0+lZbd9/Mj7Hoibvt5D0qXZbgN7PrJfWogZ+xCPvBaRB+A6LEJqw
	BHgLTtKAY5XWq3nKDyLuopims1gxFGx/8gOx+ETiYcj56/lXVh/d3Ka69LOUi78rL0TrjLSxVOi
	ryhpTyYX+E6QGDNyvrV4Kpzc63HcuaLvDS50TujqA9+B6mlO22MthZqsLBvus4CsHx58vrYCh7f
	dSvFgatXVLNh0zgoBBfGj499hDsE3Ijs9LUp5r0kdvsaTNqFnkhWU+/p1JmpA==
X-Received: by 2002:a05:600c:198a:b0:495:4491:b8c2 with SMTP id 5b1f17b1804b1-49800e72a9bmr23437145e9.3.1785408230977;
        Thu, 30 Jul 2026 03:43:50 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96? ([2001:8b0:aba:5f3c:75e2:b8ae:3bb9:d96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49801c073a3sm1104645e9.4.2026.07.30.03.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 03:43:48 -0700 (PDT)
Message-ID: <f0ab7f4d7d6c72feb2b1b8122a4434db98799370.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 1/3] kernel-uboot: move FIT_KERNEL_COMP_ALG
 to image-fitimage.conf
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: nora.schiffer@ew.tq-group.com, openembedded-core@lists.openembedded.org
Cc: oss@ew.tq-group.com
Date: Thu, 30 Jul 2026 11:43:48 +0100
In-Reply-To: <20260727090601.489155-2-nora.schiffer@ew.tq-group.com>
References: <20260727090601.489155-1-nora.schiffer@ew.tq-group.com>
	 <20260727090601.489155-2-nora.schiffer@ew.tq-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 30 Jul 2026 10:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242338

On Mon, 2026-07-27 at 11:05 +0200, Nora Schiffer via lists.openembedded.org=
 wrote:
> It is a bit weird that FIT_KERNEL_COMP_ALG also affects uImage creation,
> as kernel-uboot.bbclass is used for both, but fixing that would
> unnecessarily break backwards compatibility.
>=20
> Signed-off-by: Nora Schiffer <nora.schiffer@ew.tq-group.com>
> ---
> =C2=A0meta/classes-recipe/kernel-uboot.bbclass | 3 +--
> =C2=A0meta/conf/image-fitimage.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 3 +++
> =C2=A02 files changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-uboot.bbclass b/meta/classes-reci=
pe/kernel-uboot.bbclass
> index fa28be1715..9beccc2dff 100644
> --- a/meta/classes-recipe/kernel-uboot.bbclass
> +++ b/meta/classes-recipe/kernel-uboot.bbclass
> @@ -4,8 +4,7 @@
> =C2=A0# SPDX-License-Identifier: MIT
> =C2=A0#
> =C2=A0
> -# fitImage kernel compression algorithm
> -FIT_KERNEL_COMP_ALG ?=3D "gzip"
> +require conf/image-fitimage.conf
> =C2=A0
> =C2=A0# Kernel image type passed to mkimage (i.e. kernel kernel_noload...=
)
> =C2=A0UBOOT_MKIMAGE_KERNEL_TYPE ?=3D "kernel"
> diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-fitimage.con=
f
> index a06d30e494..abb17186a5 100644
> --- a/meta/conf/image-fitimage.conf
> +++ b/meta/conf/image-fitimage.conf
> @@ -48,6 +48,9 @@ FIT_OS ?=3D "linux"
> =C2=A0# DTBs are provided separately in a FIT image.
> =C2=A0FIT_LINUX_BIN ?=3D "linux.bin"
> =C2=A0
> +# fitImage kernel compression algorithm
> +FIT_KERNEL_COMP_ALG ?=3D "gzip"
> +
> =C2=A0# Additional mkimage options for FIT image creation
> =C2=A0FIT_MKIMAGE_EXTRA_OPTS ?=3D ""
>=20

We're realising that the kernel classes are a bit of a tangled spiders
web and we want to improve things and clean things up.

Adding a dependency on "fit" from the "uboot" class does therefore feed
a bit backward as you note.

You mention not breaking backwards compatibility. I think given the
other work we're thinking about, it might be worth considering that and
seeing if we can avoid tangling things up even further.

Cheers,

Richard



