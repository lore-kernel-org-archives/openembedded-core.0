Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F56D41D74
	for <webhook@archiver.kernel.org>; Mon, 15 Dec 2025 12:00:44 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.46763.1765800040713517309
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Dec 2025 04:00:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=b7LsvCpY;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so2347696f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 04:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1765800039; x=1766404839; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sgoF2iRfAi1ZlJJvxOYV8E4qVMvqxVZrHUTS/5YuYA=;
        b=b7LsvCpYsrutHNLLhLWyopRWMrz2i8W+tp4qShFaVJaSxYwbHRJzhhjZ/vWnz3dp87
         lzP0aoE+PPTuvcacM67RWKMkB8sBmNZdz9ML6RExB3HqWBx+70BQKv3OwybQw7/9yxLw
         O9K8tzZ9Exy4/XYS1ivD7GC6H04ZjZUhuUMxo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765800039; x=1766404839;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3sgoF2iRfAi1ZlJJvxOYV8E4qVMvqxVZrHUTS/5YuYA=;
        b=kwt+M7SM4Yg+3S5av/GtFQmLF5SnT5/EpWKi8exQ4LC145ju+GNPgd5fUUL3R2mEJx
         m0cO5MD1nEberi4/Qz9cLxqy/xE7//ps36UfNanGhD2BBfYHLAM0Dro50F1XN8+FUYVl
         UyFqHRSCBC/VSf2EaJLDpQLy0MuKC9m6LxJE9rVZOsJWmjuZsiGfkOsRihRrs1QW4eHx
         7ouzQlDHqAyBKtGAw3LW9+6aPiqlXiwN6BT8whx42IEjTYIAAMuF1OS6NmNvTLdvJ+YP
         I1i9vza0bcdmE/G5TLzT8SL4ZFcWxKMfPhqyYqeWUhme3poIMZnNPmk52Wf4iarn81ru
         kBNw==
X-Forwarded-Encrypted: i=1; AJvYcCXxaQaSACP6VGHQ/zBQWnRXwp8g+iP/kQIWqGOA+h4Aq6ry+JI/DfiVWbAy/day+T9vhWiN7njd0tVCCG5TQmUHug==@lists.openembedded.org
X-Gm-Message-State: AOJu0YxkGUN0ytIJ87MIKNNq4sJCreF5APO2O/OMO55YyarTGMtnuwmq
	H0xkyxSKUlAqetNXjJ29+/BHgjIioY3pMjToAmzpxpr1guuPA+5xCTc8fKW5EjpxeWA=
X-Gm-Gg: AY/fxX4ipweL6AYbtRHu6t0rX0mxjUQOXzC3hEyJrZEqXY3hNrhas3wo2QLQhJOp/dn
	mS6hasG7PzJj4K9WzzhrwxsKMwYgJeD6tGkjUaNNJA+151d/k9eqBUqMLOq+0n3LvJzU62ZtpAT
	jWoA1zm2OIxA1JydGBfpJDkCndGhXr+ugB6TXaFFvwDZu/oDzAWrKq/rckcXpbclwKkUO20kTnO
	gZkkh1jK29v7/UJD39GaWFCnIGDptCcikIvyu6LSu53IOzJVvRmhqNr1vyIjB7cx2ToUwuQtQ+d
	0+8AScjTkMBLRHNsR+sNAehCxJOB3tsMFAPEtsCqMMCMVI1R7lc8awjIpQdcD+bsTtrcaeQLnMg
	S3EuudYXBOeiL+a4DNtkdK4jY21uLlYM/iCgjUcri9rynpI/MoG3MIP0Suj1+aaKdworwHULEc+
	TmZivgDYesoGbnpBvIZKc2t0nORjnRyVp7Mvpe2iRcOfOWdLrESnFqvugmBISBW9XuuJpgONTHG
	pE=
X-Google-Smtp-Source: AGHT+IGxBnqL5tEG5F9yq6aoy52NSjME4yJUs+BwHrCpudolTZ89rIvNwXH36SW7+Nv9wY19cege9A==
X-Received: by 2002:a5d:64e7:0:b0:430:fdc8:8bbf with SMTP id ffacd0b85a97d-430fdc88fa4mr2146171f8f.59.1765800038886;
        Mon, 15 Dec 2025 04:00:38 -0800 (PST)
Received: from ?IPv6:2001:8b0:aba:5f3c:fad4:125a:6e75:b598? ([2001:8b0:aba:5f3c:fad4:125a:6e75:b598])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-430f4126477sm12953648f8f.10.2025.12.15.04.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 04:00:38 -0800 (PST)
Message-ID: <9dc9c4ff830b37a20b16fd36e2cc723f2cd04c44.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v5 1/5] distro/include: Add debug_build.inc
 when DEBUG_BUILD is enabled
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: hongxu.jia@eng.windriver.com, peter.kjellerstedt@axis.com, 
	randy.macleod@windriver.com, raj.khem@gmail.com, 
	openembedded-core@lists.openembedded.org, mathieu.dubois-briand@bootlin.com
Date: Mon, 15 Dec 2025 12:00:37 +0000
In-Reply-To: <20251010075258.2161972-1-hongxu.jia@windriver.com>
References: <20251010075258.2161972-1-hongxu.jia@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1ubuntu0.1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Dec 2025 12:00:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227731

On Fri, 2025-10-10 at 15:52 +0800, hongxu via lists.openembedded.org wrote:
> In bitbake.conf, use ??=3D to set *_OPTIMIZATION, add a new include
> file debug_build.inc to use ?=3D to override *_OPTIMIZATION when
> DEBUG_BUILD is enabled
>=20
> When DEBUG_BUILD is enabled:
> - Defer inherit bblcass debug_build, while setting DEBUG_BUILD =3D "1" in
> =C2=A0 local.conf, the debug build is enabled globally. For the recipe (s=
uch
> =C2=A0 as qemu) which doesn't work without optimization, set DEBUG_BUILD =
=3D "0"
> =C2=A0 to disable it for a given recipe
>=20
> - Use include_all to allow other layers to add their own debug build
> =C2=A0 configurations
>=20
> Suggested-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
> =C2=A0meta/classes-global/base.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 3 +++
> =C2=A0meta/classes-recipe/debug_build.bbclass=C2=A0 | 8 ++++++++
> =C2=A0meta/conf/bitbake.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 9 +++----=
--
> =C2=A0meta/conf/distro/include/debug_build.inc | 5 +++++
> =C2=A0meta/conf/documentation.conf=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A05 files changed, 20 insertions(+), 7 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/debug_build.bbclass
> =C2=A0create mode 100644 meta/conf/distro/include/debug_build.inc
>=20
> diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.=
bbclass
> index 6de17d1bb5..0f4398e26f 100644
> --- a/meta/classes-global/base.bbclass
> +++ b/meta/classes-global/base.bbclass
> @@ -35,6 +35,9 @@ TOOLCHAIN_NATIVE ??=3D "${PREFERRED_TOOLCHAIN_NATIVE}"
> =C2=A0inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
> =C2=A0inherit_defer toolchain/${TOOLCHAIN}
> =C2=A0
> +DEBUG_BUILD ??=3D "0"
> +inherit_defer ${@oe.utils.vartrue('DEBUG_BUILD', 'debug_build', '', d)}
> +
> =C2=A0def lsb_distro_identifier(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 adjust =3D d.getVar('LSB_DISTRO_ADJUST')
> =C2=A0=C2=A0=C2=A0=C2=A0 adjust_func =3D None
> diff --git a/meta/classes-recipe/debug_build.bbclass b/meta/classes-recip=
e/debug_build.bbclass
> new file mode 100644
> index 0000000000..a917e9cbc9
> --- /dev/null
> +++ b/meta/classes-recipe/debug_build.bbclass
> @@ -0,0 +1,8 @@
> +#
> +# Copyright OpenEmbedded Contributors
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +
> +# Allow other layers to add their own debug build configurations
> +include_all conf/distro/include/debug_build.inc
> diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
> index 5406e542db..52ceb76bbb 100644
> --- a/meta/conf/bitbake.conf
> +++ b/meta/conf/bitbake.conf
> @@ -658,13 +658,10 @@ DEBUG_PREFIX_MAP ?=3D "\
> =C2=A0"
> =C2=A0DEBUG_LEVELFLAG ?=3D "-g"
> =C2=A0
> -FULL_OPTIMIZATION =3D "-O2 ${DEBUG_LEVELFLAG}"
> -DEBUG_OPTIMIZATION =3D "-Og ${DEBUG_LEVELFLAG}"
> -SELECTED_OPTIMIZATION =3D "${@d.getVar(oe.utils.vartrue('DEBUG_BUILD', '=
DEBUG_OPTIMIZATION', 'FULL_OPTIMIZATION', d))}"
> -SELECTED_OPTIMIZATION[vardeps] +=3D "FULL_OPTIMIZATION DEBUG_OPTIMIZATIO=
N DEBUG_BUILD"
> +FULL_OPTIMIZATION ??=3D "-O2 ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION ??=3D "${FULL_OPTIMIZATION}"
> =C2=A0# compiler flags for native/nativesdk
> -BUILD_OPTIMIZATION =3D "${@oe.utils.vartrue('DEBUG_BUILD', '-Og -g', '-O=
2', d)}"
> -BUILD_OPTIMIZATION[vardeps] +=3D "DEBUG_BUILD"
> +BUILD_OPTIMIZATION ??=3D "-O2"
> =C2=A0
> =C2=A0##################################################################
> =C2=A0# Reproducibility
> diff --git a/meta/conf/distro/include/debug_build.inc b/meta/conf/distro/=
include/debug_build.inc
> new file mode 100644
> index 0000000000..95e09e64f5
> --- /dev/null
> +++ b/meta/conf/distro/include/debug_build.inc
> @@ -0,0 +1,5 @@
> +# Override SELECTED_OPTIMIZATION and BUILD_OPTIMIZATION when DEBUG_BUILD=
 is enabled.
> +DEBUG_OPTIMIZATION ?=3D "-Og ${DEBUG_LEVELFLAG}"
> +SELECTED_OPTIMIZATION ?=3D "${DEBUG_OPTIMIZATION}"
> +# compiler flags for native/nativesdk
> +BUILD_OPTIMIZATION ?=3D "-Og -g"
> diff --git a/meta/conf/documentation.conf b/meta/conf/documentation.conf
> index 741130a392..2a7418ccb3 100644
> --- a/meta/conf/documentation.conf
> +++ b/meta/conf/documentation.conf
> @@ -129,7 +129,7 @@ CVE_CHECK_LAYER_INCLUDELIST[doc] =3D "Defines which l=
ayers to include during cve-c
> =C2=A0D[doc] =3D "The destination directory."
> =C2=A0DATE[doc] =3D "The date the build was started using YMD format."
> =C2=A0DATETIME[doc] =3D "The date and time the build was started."
> -DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable."
> +DEBUG_BUILD[doc] =3D "Specifies to build packages with debugging informa=
tion. This influences the value of the SELECTED_OPTIMIZATION variable and i=
ncludes file conf/distro/include/debug_build.inc"
> =C2=A0DEBUG_OPTIMIZATION[doc] =3D "The options to pass in TARGET_CFLAGS a=
nd CFLAGS when compiling a system for debugging. This variable defaults to =
'-Og ${DEBUG_LEVELFLAG}'."
> =C2=A0DEFAULT_PREFERENCE[doc] =3D "Specifies a weak bias for recipe selec=
tion priority."
> =C2=A0DEPENDS[doc] =3D "Lists a recipe's build-time dependencies (i.e. ot=
her recipe files)."

Sorry about the delay in getting to this, we had to focus on the
release. I have been giving this some thought and it is heading the
right way but I have a couple of ideas.

The problem with DEBUG_BUILD is that we have a lot of debug information
in builds anyway and this is now unclear what it means. The
documentation.conf entry mentions packages which is now incorrect too.
The variable is a very old one and the interface is poorly designed
compared to other areas now.

Rather than keeping "DEBUG_BUILD" alive, perhaps we drop that and
simply document the INHERIT instead? I did wonder about making it a
config fragment instead too instead of a class?

I'm also wondering whether we should remove SELECTED_OPTIMIZATION
entirely? Certainly DEBUG_OPTIMIZATION and FULL_OPTIMIZATION can be
dropped. Whether that should be this patch or another, I don't mind.

Cheers,

Richard

