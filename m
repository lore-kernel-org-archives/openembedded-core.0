Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8715C3DA60
	for <webhook@archiver.kernel.org>; Thu, 18 Jul 2024 08:37:09 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.10659.1721291820466606649
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jul 2024 01:37:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fFw6clEf;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-426636ef8c9so383015e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 01:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1721291818; x=1721896618; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Aa2zmyhq4NmAvlvoELf4UY7tnZjmUg48YhsUoqrqNA=;
        b=fFw6clEfv1zMesJ73MZh1eJ5ZmKFcQ3ROD6y2ijmhEXnTKQDyNKhQTo7q2i0MlQiBU
         pB5H6tOXU9qs9aRDZ2zJ2lQQHT5RFfPs1LzwtbH8n4E8CvvsWqnQ7/oCkbxaWTC53nHh
         fanILdKA8NhAhwF+4Fx7OkKQ9tNZ/nbnodrGE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721291818; x=1721896618;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Aa2zmyhq4NmAvlvoELf4UY7tnZjmUg48YhsUoqrqNA=;
        b=hLOGrUflvPd0RrhxkadLQRYfigfru8B7g8y/XEVNDf0Gj6pDD3Hs0zU3pzBNj3K0/J
         YmHXsq/CJwlE0vpiqCfx8m5v38Io5HSZH0jKgiydmzp/jkzmRKX13WJccS7DB9uOrNQr
         ksCLhv6Jjl5t7UMafCN+x3xd81BIWvhXtDwImzCV0Zvo3QBFrfxZYwqua3g7g1m2KDfm
         /xuUwUlmoviRWBUBxtGGud9l/U5CRy0ayk71K5W6S8z0DMkW7Ord4VKUdLnLDwK1yujq
         FFITTUTbNGZfIZe2/wlXf+UZzn043A/+0kL0rZKYFmE4NI3wVV3HFXoSyLq/wdGINBCy
         bZ+w==
X-Forwarded-Encrypted: i=1; AJvYcCVJCBvEVbqOrwQ8NbYNXJcuKpQwa5wch5mFTtubqPguPfk06NY5MpNonTrcB5ro3cvdKLFi/Q6GsrmbrpZQFl7ksk7g8zSJ7nAbEX895xBK8s5gIKU+uhgR
X-Gm-Message-State: AOJu0YyGgorVY9bhfkLHX1eOJyHS2XD8/EinWYaB8gSZyITSiZ8/kZwV
	2EF1hVb4VYlU+1J/Lxop8TQ7AIeMTdcyPzVZQsW6vmtCpoPS/AjYzZDuZEMmqV0=
X-Google-Smtp-Source: AGHT+IE0+Ju17brNPhtsylvcJ9R8G/t8QtjnuMNh4uj248vyk5SFdoevtePFpuWHC+T6byhN2XCQfA==
X-Received: by 2002:a05:600c:3153:b0:426:5fcf:5e89 with SMTP id 5b1f17b1804b1-427c2d0733cmr27392725e9.33.1721291818410;
        Thu, 18 Jul 2024 01:36:58 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:490f:365a:34f5:8141? ([2001:8b0:aba:5f3c:490f:365a:34f5:8141])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427d2b18420sm1288065e9.19.2024.07.18.01.36.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jul 2024 01:36:58 -0700 (PDT)
Message-ID: <eec760ce10c80b3fc1f3d36858e73d369e7162c5.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] gcc: remove paths to sysroot from
 configargs.h and checksum-options for gcc-cross-canadian
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: ohnatiuk@cisco.com, openembedded-core@lists.openembedded.org
Date: Thu, 18 Jul 2024 09:36:56 +0100
In-Reply-To: <20240717095606.3572072-1-ohnatiuk@cisco.com>
References: 
	<CANNYZj8AxXZ2Cpk6DiCo0V8sk7pROD-Rp-WXkUHU5mGmHcK2Qg@mail.gmail.com>
	 <20240717095606.3572072-1-ohnatiuk@cisco.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jul 2024 08:37:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202193

On Wed, 2024-07-17 at 02:56 -0700, Oleksandr Hnatiuk via lists.openembedded=
.org wrote:
> Apply fixes from gcc-cross (84a78f46d594 and 0ead8cbdfb96) to gcc-cross-c=
anadian.
> This will improve (but not fix) reproducibility of gcc-cross-canadian.
> Also move this code to functions to avoid code duplication.
>=20
> Signed-off-by: Oleksandr Hnatiuk <ohnatiuk@cisco.com>
> ---
> =C2=A0.../gcc/gcc-configure-common.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 19 +++++++++++++++++++
> =C2=A0.../gcc/gcc-cross-canadian.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 3 +++
> =C2=A0meta/recipes-devtools/gcc/gcc-cross.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 ++-------------
> =C2=A0meta/recipes-devtools/gcc/gcc-target.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 | 16 ++--------------
> =C2=A04 files changed, 26 insertions(+), 27 deletions(-)
>=20
> diff --git a/meta/recipes-devtools/gcc/gcc-configure-common.inc b/meta/re=
cipes-devtools/gcc/gcc-configure-common.inc
> index d77b2ec3d1de..c936d1a9bd7b 100644
> --- a/meta/recipes-devtools/gcc/gcc-configure-common.inc
> +++ b/meta/recipes-devtools/gcc/gcc-configure-common.inc
> @@ -120,3 +120,22 @@ do_configure () {
> =C2=A0	oe_runconf
> =C2=A0}
> =C2=A0
> +remove_sysroot_paths_from_configargs () {
> +	# Prevent sysroot path from being used in configargs.h header, as it wi=
ll
> +	# be rewritten when used by other sysroots preventing support for gcc
> +	# plugins. Additionally the path is embeddeded into the output binary, =
this
> +	# prevents building a reproducible binary.
> +	oe_runmake configure-gcc
> +	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
> +	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
> +}
> +
> +remove_sysroot_paths_from_checksum_options () {
> +	# Prevent sysroot/workdir paths from being used in checksum-options.
> +	# checksum-options is used to generate a checksum which is embedded int=
o
> +	# the output binary.
> +	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
> +	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
> +	sed -i 's@${1}@/host@g' ${B}/gcc/checksum-options
> +}
> +
> diff --git a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc b/meta/reci=
pes-devtools/gcc/gcc-cross-canadian.inc
> index 7c4233c21157..9528b71272dd 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross-canadian.inc
> @@ -64,6 +64,9 @@ do_configure () {
> =C2=A0}
> =C2=A0
> =C2=A0do_compile () {
> +	remove_sysroot_paths_from_configargs
> +	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
> +
> =C2=A0	oe_runmake all-host configure-target-libgcc
> =C2=A0	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c u=
nwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
> =C2=A0}
> diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devto=
ols/gcc/gcc-cross.inc
> index 5b0ca15d4762..f8a7730cf322 100644
> --- a/meta/recipes-devtools/gcc/gcc-cross.inc
> +++ b/meta/recipes-devtools/gcc/gcc-cross.inc
> @@ -62,19 +62,8 @@ do_compile () {
> =C2=A0	export CXXFLAGS_FOR_TARGET=3D"${TARGET_CXXFLAGS}"
> =C2=A0	export LDFLAGS_FOR_TARGET=3D"${TARGET_LDFLAGS}"
> =C2=A0
> -	# Prevent native/host sysroot path from being used in configargs.h head=
er,
> -	# as it will be rewritten when used by other sysroots preventing suppor=
t
> -	# for gcc plugins
> -	oe_runmake configure-gcc
> -	sed -i 's@${STAGING_DIR_TARGET}@/host@g' ${B}/gcc/configargs.h
> -	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/configargs.h
> -
> -	# Prevent sysroot/workdir paths from being used in checksum-options.
> -	# checksum-options is used to generate a checksum which is embedded int=
o
> -	# the output binary.
> -	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
> -	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
> -	sed -i 's@${STAGING_DIR_HOST}@/host@g' ${B}/gcc/checksum-options
> +	remove_sysroot_paths_from_configargs
> +	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_HOST}'
> =C2=A0
> =C2=A0	oe_runmake all-host configure-target-libgcc
> =C2=A0	(cd ${B}/${TARGET_SYS}/libgcc; oe_runmake enable-execute-stack.c u=
nwind.h md-unwind-support.h sfp-machine.h gthr-default.h)
> diff --git a/meta/recipes-devtools/gcc/gcc-target.inc b/meta/recipes-devt=
ools/gcc/gcc-target.inc
> index e9187fc444b9..bd7506fe3a55 100644
> --- a/meta/recipes-devtools/gcc/gcc-target.inc
> +++ b/meta/recipes-devtools/gcc/gcc-target.inc
> @@ -132,20 +132,8 @@ FILES:${PN}-doc =3D "\
> =C2=A0"
> =C2=A0
> =C2=A0do_compile () {
> -	# Prevent full target sysroot path from being used in configargs.h head=
er,
> -	# as it will be rewritten when used by other sysroots preventing suppor=
t
> -	# for gcc plugins. Additionally the path is embeddeded into the output
> -	# binary, this prevents building a reproducible binary.
> -	oe_runmake configure-gcc
> -	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/configargs.h
> -	sed -i 's@${STAGING_DIR_HOST}@/@g' ${B}/gcc/configargs.h
> -
> -	# Prevent sysroot/workdir paths from being used in checksum-options.
> -	# checksum-options is used to generate a checksum which is embedded int=
o
> -	# the output binary.
> -	oe_runmake TARGET-gcc=3Dchecksum-options all-gcc
> -	sed -i 's@${DEBUG_PREFIX_MAP}@@g' ${B}/gcc/checksum-options
> -	sed -i 's@${STAGING_DIR_TARGET}@/@g' ${B}/gcc/checksum-options
> +	remove_sysroot_paths_from_configargs
> +	remove_sysroot_paths_from_checksum_options '${STAGING_DIR_TARGET}'
> =C2=A0
> =C2=A0	oe_runmake all-host
> =C2=A0}

I think this also causes a reproducibility issue. In testing this patch see=
med to cause:

https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/5079/ste=
ps/13/logs/stdio

which leads to:

http://autobuilder.yocto.io/pub/repro-fail/oe-reproducible-20240717-49lmc_9=
g/packages/diff-html/

which is a difference in EXPORTED_CONST=C2=B7unsigned=C2=B7char=C2=B7execut=
able_checksum[16].

Cheers,

Richard


