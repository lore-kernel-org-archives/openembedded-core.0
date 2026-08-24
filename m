Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C20C5DF9C
	for <webhook@archiver.kernel.org>; Mon, 24 Aug 2026 18:57:43 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4901.1787597861502895401
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Aug 2026 11:57:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=LkiDNpRz;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47de0093c42so3046097f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 11:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1787597860; x=1788202660; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WpaUjs+G1h8Gf6AgG8wsBfy4lvijinoFo05ixwg4B4c=;
        b=LkiDNpRz5rW1KDiSfUnufzXsbqjWKmdROCT0cSNlArP17OtzQ97DaJtOxTpdN32lGL
         Ip9xoNe4ZB+YQm+Yi1spuvX0XxnNnRI5p6DoWDJn2N1sa9Nyz4zJQ7tnJHALM0hbQhYs
         MNrw01262rysDcMxz3zfEDXpX8oabytPtOSbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787597860; x=1788202660;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WpaUjs+G1h8Gf6AgG8wsBfy4lvijinoFo05ixwg4B4c=;
        b=DVFnBUa7afCtuLASKr6vA2676QSiwwhgb4DSPUnim1ZfygInlkKWc5jdSUlRYUBgFs
         tGkuCKpSV4HhnsDk1a7RecICY9zyXFen77MoVX/wwojzurrwbVO8FqBL12l6rQ+lb0S4
         pM3LDMf8NYPP79t4b1Bz4W6eLZFuIdhQ4WIMgK0nujJSVG1+XeDOOAJW/RIK+efms6IT
         oOHP4+d0uQpOHVsdX4jQgk9zleIjjwuTDrlsEjpHgrBgk9F3bZPmUDZW79MzyAnzQkx1
         EQ3wKcWeYLrp0/FuUCuatj6UsAuDgv8pjj0SwplrO9wro8I6HugBr+Ter1OEee9/+6mM
         MHhg==
X-Forwarded-Encrypted: i=1; AHgh+Ro+WzpWMLHlioJZWIXoM+3mkSv4c8M2vG/X3IEMYOPFZVi80aAAVh1A2fBMhE8GON+waJmFaf1fCkH21kZMUrMR8w==@lists.openembedded.org
X-Gm-Message-State: AFuF++mRYk/2Wt365FAxoA8+7dyPLdKM0NXwmslcta2Iie1/QDFkqmwp
	/1WYTtbmEMGMLVDo90QVF4UC6x3Zb3sRLaZd0BeaUODm6xm8FB4P+2U64jiYF74nAKs=
X-Gm-Gg: AR+sD12zgsN0zr7ynDu6PhLX2aiO0x/83Zibv4edhi/CDmGizSDCm5UiL9bscZCcdnx
	AvleUSVTpKllXnVatC2L5kyWAzEVHwsu8+4IePrayWAgTpYUJPzTJUb5WT8NhDApABxtO1ezVyS
	f9hCTCg0lzfBVZafpfKQL2mNRNkw4J2xoICudQ802yet2rbl3vEFxI4qvW3jUqjC9vaZ1yt6Hbl
	jZ2HM/nva7sGcjEVr7RcKMriSwMeQbaM7ifikrWY/R2ft5Tw1v3JRkMNnwwtizopm5Dv2n6g3gG
	fdHDMhTeesVrrGzxB0vMWLtDUJtKR9yopbBd3Ta26fPyRbTE8J7pbr8rs/fMSmnHL3M53jI5tR7
	zh6t9iVMSK/60IWyx84o5mMUG84wxHIcWzkqkg3RRasD/PkOzFlbBs5iOmcW/kGUUwtCpMXM0O5
	rJFubH+yWXEePSfx/D+lNrwoaopvBP1+mvNI4ssb56kX9saZkbYqwUvnctveBA2ewx/G+tstXRs
	9FhmII0dzEDyDVISOoJy/NW4wdRQ1IsAt/dPK16KdQoDetUY4bv/A==
X-Received: by 2002:a5d:584f:0:b0:47f:e748:3ae3 with SMTP id ffacd0b85a97d-482d9ed6cdfmr914386f8f.3.1787597859728;
        Mon, 24 Aug 2026 11:57:39 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f? ([2001:8b0:aba:5f3c:5c5b:7a15:ab97:8d7f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9b69a60sm9234437f8f.1.2026.08.24.11.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 11:57:38 -0700 (PDT)
Message-ID: <7a5b45d7162c3c6ddaa263355b5654330bdd00bd.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v4 3/4] kernel: centralize kernel module
 installation path in one variable
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anis Bougrine <anis.bougrine10@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: antonin.godard@bootlin.com, bruce.ashfield@gmail.com, 
	jose.quaresma@oss.qualcomm.com
Date: Mon, 24 Aug 2026 19:57:37 +0100
In-Reply-To: <20260822002601.90667-4-anis.bougrine10@gmail.com>
References: <20260822002601.90667-1-anis.bougrine10@gmail.com>
	 <20260822002601.90667-4-anis.bougrine10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Aug 2026 18:57:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244149

On Sat, 2026-08-22 at 02:26 +0200, Anis Bougrine wrote:
> The kernel module installation path is currently defined in multiple
> places, although it is used 10 times throughout the code. This
> increases the risk of bugs due to inconsistencies or desynchronization.
>=20
> Centralizing the path in a single variable makes the code more
> reliable and easier to maintain.
>=20
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
> =C2=A0=C2=A0=C2=A0 changes in v4:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 - Re-sign kernel modules after package stripping proce=
ss
> =C2=A0=C2=A0=C2=A0 - Remove package-stripping skip in package.py
> =C2=A0=C2=A0=C2=A0 - Add MOD_INSTALL_PREFIX variable
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 changes in v3:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 - Fixing rebase issue.
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 changes in v2:
> =C2=A0=C2=A0=C2=A0=20
> =C2=A0=C2=A0=C2=A0 - Use the conditional INSTALL_MOD_STRIP environment va=
riable to avoid
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 duplicating the oe_runmake call.
> =C2=A0=C2=A0=C2=A0 - Use `scripts/config` script instead of grepping .con=
fig file.
> ---
> =C2=A0meta/classes-recipe/kernel-module-split.bbclass |=C2=A0 4 +++-
> =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 13 +++++++------
> =C2=A02 files changed, 10 insertions(+), 7 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index 253a723b95..061522fc22 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -48,6 +48,8 @@ KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> =C2=A0
> =C2=A0# Sign kernel modules if auto-signing is enabled in the kernel conf=
ig
> +# MOD_INSTALL_PREFIX must be the same at installation and signing time.
> +MOD_INSTALL_PREFIX ?=3D "${nonarch_base_libdir}/modules/${KERNEL_VERSION=
}"
> =C2=A0post_strip_kernel_modules_signing(){
> =C2=A0=C2=A0=C2=A0=C2=A0 # Read .config values
> =C2=A0=C2=A0=C2=A0=C2=A0 is_modules=3D"$(${S}/scripts/config --file ${B}/=
.config --state MODULES)"

Rather than setting that in two places, you could set it once in
kernel-arch.bbclass. I did a bit of work to try and allow common things
to go in one place...

This series looks like a much better solution to the signing issue btw,
thanks!

Cheers,

Richard

