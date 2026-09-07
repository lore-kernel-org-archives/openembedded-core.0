Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65FDCC79F99
	for <webhook@archiver.kernel.org>; Mon,  7 Sep 2026 21:56:39 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6313.1788818195789844005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2026 14:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=OUFUWG4O;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.42, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-495590dde14so56794255e9.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 14:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788818194; x=1789422994; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=uwEY9tR//jHlmqr/5uuiVuNqv1CptfVzREWzWCqygzs=;
        b=OUFUWG4O5ViXwhVrZP7wlpkkIjChXpcsc4UImetJTl7BZxcrq6XxWQfS5AwHTshyE+
         etAuaBBysJIS+D1N59FChKTFMIJfd4eJ5IskqK3uxS7Hl6sO/HKNRfbdSEySgfV1K/GD
         rm6cl92573TyqoJ3tUDnnMyNhhzMHrEGQBB0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788818194; x=1789422994;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uwEY9tR//jHlmqr/5uuiVuNqv1CptfVzREWzWCqygzs=;
        b=jnzCZic4dxvkAwoxysK5yaynqSoj2eXZCvE78ZjwsAZPftxHFYHkSU5MJxk6lb3f8+
         NXQrbRhCaxCaxJUQ83oVvsNSXwhNQ1mHASzDxTuZc26zNrREXRrj9svbG8zAuDsc3j+o
         0dvgRMB9Mae9nfyI4wIwWXMdOI8a849lUuNj8lU8RwnkOBNh7XvKfu5uoVPdorFdguLy
         D0TD6lNIaMGDH507YglsDVXaVagL4Lm3Z8AM6RLhpwffsVV9Sv+HIUQPHeUCxAttef3y
         rLPwDb2VKDTV823hKdZsqrHgVBZsHc/5RJjbULgq8TcYe37l05wh5kZ/In7LEIfv5SAM
         Pt6Q==
X-Forwarded-Encrypted: i=1; AKwUvBy5ej/rYRa/w7ezddMt3BztH35pMDrC4EDfXWsQHBv509stQgVqslOq0HrkYE4A/nugM5LBTrS0mdfaEoc/dO2tEQ==@lists.openembedded.org
X-Gm-Message-State: AFuF++n2qOnmDvvQec3iG5d+psk38MZx/kDVahdptK1KgNk0jJhOTMJD
	q6TE3qe+K1htE37bCappXY7x8t+Aaajwm0y/joT3Vwxy7MewDyFZfONFKaaf5clG6RHXgCrZPPq
	+ELhwnn0=
X-Gm-Gg: AYBFou3BuQbtf6L190jMkwomF0SxdMwyjBllj0LvKfD/fI9pkbJ7sb1N9wha5d0yBft
	sIR9R+HHOZjU762k+8boCelBjcZJE7AD1mgtyKev3aTvNaUQQcsSuk4zJgLp+LS/ylHtWpx/wjj
	ZBWGqKgOgf/1cqU0PdrUC0fvmK6xQPNm4kIbz5sp8tVO5IlNiPVd6CYfd2z6wfH2yJbxp1IJ6Rx
	vfqo/CjuEuVIvh1e8p0Jzo5+Oj8YDI9y6FEQbgqYbiUoTS84ZRhr/S0lbHyMEeZiO9CtgqCohsk
	ygue/1IE6dfXFiVwSp9UfRMS0LsdWnIGypx2Kt850IaLFzL5E3fY4n3nJ1+kbpx+INMVswHwILA
	CFIhaRrN9PISWqujA0QFsX0QJm8/500G3uGQAIR/aq0W8+zlbqGgtAZUHSb8PeuF6gZXbmRyYnB
	8A2NcWijtB4V2SbckzijulcttB0rXojQgDRyJOr2oD6UHSS06NK31kHKTwL5j91tppgArA1IK1k
	dhLi7JLHZii+jC7asgoyp9esDwhoH8Msq0Tczol7V503DphrEL5WA==
X-Received: by 2002:a05:600c:4ecc:b0:49d:870:7a69 with SMTP id 5b1f17b1804b1-49d08707aafmr227168915e9.12.1788818193766;
        Mon, 07 Sep 2026 14:56:33 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:e2ae:fec4:d03e:3153? ([2001:8b0:aba:5f3c:e2ae:fec4:d03e:3153])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cfbdacc45sm310809535e9.11.2026.09.07.14.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 14:56:32 -0700 (PDT)
Message-ID: <19734acbbb01f4ad17ab04a23fd92295b0e5db6f.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2 2/3] toolchain-scripts: source
 target-specific environment setup scripts
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Harish.Sadineni@windriver.com, openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Date: Mon, 07 Sep 2026 22:56:32 +0100
In-Reply-To: <20260807093116.3680514-2-Harish.Sadineni@windriver.com>
References: <20260807093116.3680514-1-Harish.Sadineni@windriver.com>
	 <20260807093116.3680514-2-Harish.Sadineni@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2026 21:56:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245308

On Fri, 2026-08-07 at 02:31 -0700, Sadineni, Harish via lists.openembedded.=
org wrote:
> From: Harish Sadineni <Harish.Sadineni@windriver.com>
>=20
> YOCTO [#15061]
>=20
> Export `OECORE_TARGET_SYS` in the generated SDK and tree environment
> setup scripts, and source any `*.sh` files from
> `environment-setup.d/${TARGET_SYS}` in addition to the existing
> `environment-setup.d` directory.
>=20
> This complements the rust-cross-canadian changes, where Rust
> environment setup scripts are installed under a target-specific
> directory. By sourcing only the scripts that match the active target,
> the SDK avoids loading environment settings for other target variants,
> such as mixing 32-bit and 64-bit configurations in multilib SDKs.
>=20
> Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
> ---
> =C2=A0meta/classes-recipe/toolchain-scripts.bbclass | 8 ++++++++
> =C2=A01 file changed, 8 insertions(+)
>=20
> diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes=
-recipe/toolchain-scripts.bbclass
> index d94dcdee39..f0f599959d 100644
> --- a/meta/classes-recipe/toolchain-scripts.bbclass
> +++ b/meta/classes-recipe/toolchain-scripts.bbclass
> @@ -76,6 +76,7 @@ toolchain_create_sdk_env_script () {
> =C2=A0	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('=
TARGET_ARCH', d)}"' >>$script
> =C2=A0	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
> =C2=A0	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET',=
 d)}"' >>$script
> +	echo 'export OECORE_TARGET_SYS=3D"${TARGET_SYS}"' >> $script
> =C2=A0
> =C2=A0	echo 'unset command_not_found_handle' >> $script
> =C2=A0
> @@ -110,6 +111,7 @@ toolchain_create_tree_env_script () {
> =C2=A0	echo 'export OECORE_MESON_HOST_CPU_FAMILY=3D"${@meson_cpu_family('=
TARGET_ARCH', d)}"' >>$script
> =C2=A0	echo 'export OECORE_MESON_HOST_CPU=3D"${TARGET_ARCH}"' >>$script
> =C2=A0	echo 'export OECORE_MESON_HOST_ENDIAN=3D"${@meson_endian('TARGET',=
 d)}"' >>$script
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 echo 'export OECORE_TARGET_SY=
S=3D"${TARGET_SYS}"' >> $script
> =C2=A0
> =C2=A0	toolchain_shared_env_script
> =C2=A0
> @@ -172,6 +174,12 @@ if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d=
" ]; then
> =C2=A0	=C2=A0=C2=A0=C2=A0 . \$envfile
> =C2=A0=C2=A0=C2=A0=C2=A0 done
> =C2=A0fi
> +if [ -d "\$OECORE_NATIVE_SYSROOT/environment-setup.d/\$OECORE_TARGET_SYS=
" ]; then
> +=C2=A0=C2=A0=C2=A0 for envfile in \$OECORE_NATIVE_SYSROOT/environment-se=
tup.d/\$OECORE_TARGET_SYS/*.sh; do
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 . \$e=
nvfile
> +=C2=A0=C2=A0=C2=A0 done
> +fi
> +
> =C2=A0EOF
> =C2=A0}

Thanks to your other emails, I think I finally understand what is going
on here. Sorry for being a bit slow in understanding the issues
involved. I think what has been confusing me is that we have this code
which was meant to handle the target specific scripts:

https://git.openembedded.org/openembedded-core/commit/?id=3D2d9466734f0c0c9=
0724820bc36992b2800ffa4d0

which I appear to have added in 2014. I can't find any record of
anything actually successfully adding a target environment.d file using
the above layout, everything is nativesdk based as far as I can see.
I'm not even sure it is possible to add such a thing easily.

So your approach is probably the right one but at the same time, we
should probably remove this other confusing one, assuming we can find
nothing installing such scripts. That should reduce the confusion and
code complexity a little.

This does bring one further detail we need to get right, which is the
name of the directory.

The recipe is named: PN =3D "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"

i.e. it regenerates if TARGET_ARCH changes.

You're placing the files in TARGET_SYS, which is not equal to
TARGET_ARCH. Which one is correct? If we build a target which combines
glibc and musl, would we need a different rust-cross-canadian for each
libc?

I suspect PN is wrong and it should also use TARGET_SYS?

The patches in this series also need to be the other way around - add
the search path in first, then use it in the next patch.

Cheers,

Richard

