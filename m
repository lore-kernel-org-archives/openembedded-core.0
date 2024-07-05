Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5700C30658
	for <webhook@archiver.kernel.org>; Fri,  5 Jul 2024 10:04:06 +0000 (UTC)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web10.13846.1720173837927094455
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Jul 2024 03:03:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=grUFLrWA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.208.173, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebec2f11b7so17216161fa.2
        for <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 03:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1720173836; x=1720778636; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xROus20MwyjmzLn7YnbSkrHAeLtTOKU/9iO/On3S4UE=;
        b=grUFLrWAonovo+Z+Wp1wf7Y9i5UGO1VvulWKSFZMUmphcEcqgGidV/RFkGxRQnBa7d
         /Gi411GNHHJjNCbfi/7eElJWiPi958XDak/+jBLwN2I/0an6r6x4IWKaF7Vge5vtFiml
         VYN+IWA+/yFXuNR82kMTQM0zccj0sUKmTSo88=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173836; x=1720778636;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xROus20MwyjmzLn7YnbSkrHAeLtTOKU/9iO/On3S4UE=;
        b=jfq6LpJoECWDT6tI+gP29wAXA01m8SBH4tP+cIcz/FvpAU9jOX00FSOgKUA/WDaQ02
         2FweRDWy5XbUd8ojtZHPW0yxIa2NK28HBzlXmBPyLimqF82T6gZJ6boT0Rz1ZIlMtZfE
         Vi8Zhf0aha6EoLyoEnoH0adMyf2luxesGwRQzx8sPeYnwRHyzWAVknfdew91UmY+uAXs
         NNSXQGA8RE++IFpap6ahJjO5sbj1aaGLIHZ8ctyRNu8oK5On+IQZ3C0rrOtAK2ULstlc
         2GqCj9/HJ9R4BvvTp//uMW+T13eWFcrskDMhkFIHrqkDVt595ZdSEEPxaEcjMUOn5q+f
         dNqA==
X-Forwarded-Encrypted: i=1; AJvYcCUrQjWA/F4U/6WG42wpfcCZVOYNn5v1mE8tLvJjOLP2JwTMsxvdmt/gzyRKz/Yav7k4LnjGZKG/ulcTHQFH1iuEJSFRpiLx3GGkOFXq+Gt0CvipHLkjJ17n
X-Gm-Message-State: AOJu0YwJnwBxBCth4JisSksT6KXp9XdDlT+UU4TPuog4jmWNqUZ1lHLh
	8dCJmdBPWCnmig7zh9r1uDM/K+9CBwBa5ta2ZEz/v8TCBYnqkCfk7YlAINGb54U=
X-Google-Smtp-Source: AGHT+IGmOEecPjxdDUAIWKs5+8DbPaWZeaZVy1NIQSzWAUXV7oBOuR2kC4HocUSVMHTKkqonj0CZ3A==
X-Received: by 2002:a2e:7d10:0:b0:2ec:1a8b:c374 with SMTP id 38308e7fff4ca-2ee8edf13bamr25728601fa.45.1720173835615;
        Fri, 05 Jul 2024 03:03:55 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c? ([2001:8b0:aba:5f3c:cb88:bb2:1190:3f2c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d50c3sm55237275e9.2.2024.07.05.03.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jul 2024 03:03:55 -0700 (PDT)
Message-ID: <b62c397649ef55f847345288c10db34a372b6f8c.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v2] u-boot: set B = WORKDIR/build
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: joerg.sommer@navimatix.de, openembedded-core@lists.openembedded.org
Date: Fri, 05 Jul 2024 11:03:54 +0100
In-Reply-To: <4641ec5ba60aa447167bbee07fac87a3f6da3aea.1720172390.git.joerg.sommer@navimatix.de>
References: 
	<8ebaf41b89622ecc6b27b140cb8264bf50d15f68.camel@linuxfoundation.org>
	 <4641ec5ba60aa447167bbee07fac87a3f6da3aea.1720172390.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.0-1build2 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jul 2024 10:04:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201598

On Fri, 2024-07-05 at 11:39 +0200, J=C3=B6rg Sommer via lists.openembedded.=
org wrote:
> From: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
>=20
> The build of u-boot fails, if `UBOOT_MACHINE` (instead of `UBOOT_CONFIG`)=
 is
> used. U-boot doe not like the setting of `O=3D$S` in the make call, which
> happen when `UBOOT_MACHINE` is used. Therefore, use a dedicated build
> directory to circumvent the conflict `$B =3D=3D $S`.
>=20
> Yocto build message:
>=20
> ```
> > if [ -f /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnuea=
bi/u-boot-variscite/1.0-r0.fwkos.6/git/.config -o -d /build/tmp/work/da850_=
funkwerk_rp1_eval_board-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6=
/git/include/config ]; then \
> > 	echo >&2 "=C2=A0 /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-l=
inux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run '=
make mrproper'"; \
> > 	echo >&2 "=C2=A0 in the '/build/tmp/work/da850_funkwerk_rp1_eval_board=
-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.";\
> > 	/bin/false; \
> > fi;
> > =C2=A0 /build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux-gnueab=
i/u-boot-variscite/1.0-r0.fwkos.6/git is not clean, please run 'make mrprop=
er'
> > =C2=A0 in the '/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linu=
x-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git' directory.
> > make[1]: Leaving directory '/build/tmp/work/da850_funkwerk_rp1_eval_boa=
rd-fwkos-linux-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git'
> > make[1]: *** [/build/tmp/work/da850_funkwerk_rp1_eval_board-fwkos-linux=
-gnueabi/u-boot-variscite/1.0-r0.fwkos.6/git/Makefile:1928: prepare3] Error=
 1
> > ERROR: oe_runmake failed
> ```
>=20
> U-Boot test:
>=20
> ```
> % make O=3D$PWD all
> make[1]: Entering directory '/home/joerg/git/u-boot'
> =C2=A0 UPD=C2=A0=C2=A0=C2=A0=C2=A0 include/generated/timestamp_autogenera=
ted.h
> =C2=A0 Using /home/joerg/git/u-boot as source for U-Boot
> =C2=A0 /home/joerg/git/u-boot is not clean, please run 'make mrproper'
> =C2=A0 in the '/home/joerg/git/u-boot' directory.
> make[1]: *** [/home/joerg/git/u-boot/Makefile:1928: prepare3] Error 1
> make[1]: Leaving directory '/home/joerg/git/u-boot'
> make: *** [Makefile:177: sub-make] Error 2
> ```
>=20
> Signed-off-by: J=C3=B6rg Sommer <joerg.sommer@navimatix.de>
> ---
> =C2=A0meta/recipes-bsp/u-boot/u-boot.inc | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/meta/recipes-bsp/u-boot/u-boot.inc b/meta/recipes-bsp/u-boot=
/u-boot.inc
> index fc36c21ec2..bdc4b60e43 100644
> --- a/meta/recipes-bsp/u-boot/u-boot.inc
> +++ b/meta/recipes-bsp/u-boot/u-boot.inc
> @@ -9,6 +9,8 @@ inherit uboot-config uboot-extlinux-config uboot-sign dep=
loy python3native kerne
> =C2=A0
> =C2=A0DEPENDS +=3D "swig-native"
> =C2=A0
> +B =3D "${WORKDIR}/build"
> +
> =C2=A0EXTRA_OEMAKE =3D 'CROSS_COMPILE=3D${TARGET_PREFIX} CC=3D"${TARGET_P=
REFIX}gcc ${TOOLCHAIN_OPTIONS} ${DEBUG_PREFIX_MAP}" V=3D1'
> =C2=A0EXTRA_OEMAKE +=3D 'HOSTCC=3D"${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LD=
FLAGS}"'
> =C2=A0EXTRA_OEMAKE +=3D 'STAGING_INCDIR=3D${STAGING_INCDIR_NATIVE} STAGIN=
G_LIBDIR=3D${STAGING_LIBDIR_NATIVE}'
>=20

I did a little digging as I wondered why this wasn't already the case.
That variable is set in u-boot-common.inc along with a cleandirs for B.
Are you able to use that common inc file? I didn't check the situation
on older releases.

Cheers,

Richard





