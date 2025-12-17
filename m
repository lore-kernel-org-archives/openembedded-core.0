Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A763ED66BB2
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 21:31:39 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.26345.1766007093520398305
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 13:31:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SdbJZ/l6;
 spf=pass (domain: gmail.com, ip: 209.85.221.41, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-42fbc3056afso2988635f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766007092; x=1766611892; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MkjHC8OHOSqZqgX8sNh2XGvCBvCon3pw9WkxEIUhjVQ=;
        b=SdbJZ/l6Jk8t9bTyVQS8idsOdGZGDwtfeg3CCVAsJ1Dt17ZAw7OFdvWMxoSsryzjDY
         KeyqrgU7IfZGOY7o2LkJs0SSLGyJWROxrE6G4eseTDb/kuGuVFWgIA39Zad/Qkx3BaIX
         4EZBKVIS00Jma7NnNGLL565ohscBEs+S2BX/BV5ghnfbC+/2ltKQlfuMDpGC8/GTkvGa
         8futLAbqY+PU9Jkp394aNElr5B/AaUPxfvBqQjDaXHPDAhW/020tQJ4DzEwaP/qx9XYn
         OVigyDRP4l4YyvJC1A+3E2c7/bokxjEi41wjSRBaMdzIylJktKxMM7VTaJduAk38GBEt
         6ARQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766007092; x=1766611892;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MkjHC8OHOSqZqgX8sNh2XGvCBvCon3pw9WkxEIUhjVQ=;
        b=dGZouloH+GFkqAyCFuvKCg75oJVDS6PPl3JT10O86A2tXeiX0AzfqNhrVfpm0ilzTV
         NRzXD1GTJXBx+f+AwicrzONbzcvWh/HVzr9FDhR5luGKGfcHfbZWGTAEbkkUo8UmMmew
         vs1T9AUHWLoQfgepFMgEOtDwsYkLh19WhDVc6Yd6tZ/saU2RCCjU6RdW27hNHKMlCd43
         KseiIK43I0sxq4A5vx4ORW80GL/7RdsGFS7rkrvTjySjtYKdw/lxhx5DoLiqgSUlomNE
         GtAm3rC6B77mC5koJNJe8aQIX9y0KHExXMy9Ag/Q42uj3ksgXcKM4yIsTQ5dNHEfiVvU
         1srQ==
X-Forwarded-Encrypted: i=1; AJvYcCUcM8dUax0i5EaMjGNnw0KMCOXnIyLZryAkPP3a7sUMi4ZeoXIt7IqNGE0hse8OaiND8JuvL3TMx1NJWQYHWWEqTw==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz74F3KI+7Gi0I8l022fi7ZuwnZIyF+tjUpux6GK0iUnjAJJBbE
	Qgkmm/P/Bc+IrCIIMGXjBCCqLfBYw+4ISzhNlrnbMlmR+heOj1iNmxIx
X-Gm-Gg: AY/fxX4bFUiqXCA2Fhdz7sa/Zl41S5FQs5sw99s64yFxOgpVPOCvRHPo6qeyduxIFt+
	LMoP2lWeOfK+0rqRMm2iSjlTv4W8lbCx6giX4gK2DAKJS6tbEyeIHzFlC7rUF70D/uvZaDEIO33
	zs//t0F+u/qgUmqBo0WveXuHNc1esphrC8Sm30u8JoB6fYkeOGW6YxWX+pRk1AsDDeK7Zo9an83
	WvrlJICo2eQlVvVUeeFQ/AL31+1FrbCb6bAYdLrnQU7xzDYFQIyAyFw75sugd5BmxcbSq/L5Fun
	G/y1Xjw7b37Lv0w3uU+U2oFhDCFYc34/8zGu6CUvu8Xug3hX80FgXH5G8DawFoeZvyIb01+I+66
	vvD/zE/T1tzIKhoAVnCjv3UYczcv5hRjKi8Cy/l5C/gICBj0qdc0oN8vTArsYHslHjs63A0/zoU
	X1EQYT+gjTUQUlpm/pQ6bSLqU5X+3QN2KrRoEiGsBypNG52i5AMwtzsR8J4VxOJYg9LLjST4E=
X-Google-Smtp-Source: AGHT+IHCIZ0bNRJJlX+TUEtNUVtoQkCh4qFfmEleeBHEgh1+rTMtHn7eAiSURlqKgMHMRneSkPTA1g==
X-Received: by 2002:a5d:5f94:0:b0:430:f58d:40cf with SMTP id ffacd0b85a97d-430f58d437amr15549981f8f.16.1766007091469;
        Wed, 17 Dec 2025 13:31:31 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432449ae0ffsm1015211f8f.39.2025.12.17.13.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 13:31:30 -0800 (PST)
Message-ID: <7a13d7376a83bb7deb6374124bc42669d86803fc.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v2] fitimage: Add support for
 UBOOT_MKIMAGE_EXTRA_OPTS
From: adrian.freihofer@gmail.com
To: Randy MacLeod <randy.macleod@windriver.com>, kavinaya@qti.qualcomm.com, 
	openembedded-core@lists.openembedded.org
Cc: reatmon@ti.com, benjamin.missey@non.se.com
Date: Wed, 17 Dec 2025 22:31:30 +0100
In-Reply-To: <57dd38bf-653d-4b74-8de4-d05f4d2b9797@windriver.com>
References: <20251210110443.3230272-1-kavinaya@qti.qualcomm.com>
	 <57dd38bf-653d-4b74-8de4-d05f4d2b9797@windriver.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 21:31:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228077

Hi Kavinaya, Randy

On Mon, 2025-12-15 at 13:17 -0500, Randy MacLeod wrote:=C2=A0
-D dtcoption" Provide special options to the device tree compiler that is u=
sed to create the image.> Kavinaya, Adrian,=C2=A0=C2=A0 and others who have=
 touched:
> =C2=A0=C2=A0=C2=A0 meta/classes-recipe/kernel-fit-image.bbclass
> =C2=A0in the last=C2=A0 ~ year.
> =C2=A0
> This needs more review than we had time for in the YP patch review
> meeting today.
> =C2=A0
> I think the concern was that there had been some independent
> improvements to fitimage
> =C2=A0and that perhaps no one was looking at the overall design.
> =C2=A0=C2=A0
> This may be a red herring but for example, is there overlap with:
> =C2=A0=C2=A0=C2=A0 meta/classes/kernel-fitimage.bbclass
> =C2=A0=C2=A0=C2=A0 # Options for the device tree compiler passed to mkima=
ge '-D'
> feature:
> =C2=A0=C2=A0=C2=A0 UBOOT_MKIMAGE_DTCOPTS =3D "-I dts -O dtb -p 2000"
> =C2=A0
That's almost the same. mkimage calls the dtc compiler.
The UBOOT_MKIMAGE_DTCOPTS variable contains arguments which are passed
to dtc.

There is also UBOOT_MKIMAGE_SIGN_ARGS which is passed to mkimage when
it gets called for signing an image. Also a slightly different topic.

The new variable UBOOT_MKIMAGE_EXTRA_OPTS is different. It provides
other options which are handled by mkimage itself.
Adding a new variable seams to be needed.

> If you think this is a sensible, maintainable change, do say so and
> explain your point of view.
> =C2=A0=C2=A0
> Please don't shoot the messenger, as I don't work with u-boot or
> fitImage myself !
Thank you for adding me.

> =C2=A0
> Thanks,
> ../Randy
> =C2=A0
> =C2=A0
> On 2025-12-10 6:04 a.m., Kavinaya S via lists.openembedded.org wrote:
> =C2=A0
> > Currently, mkimage options in U-Boot recipes are fixed, which
> > limits
> > flexibility for platforms that require additional mkimage
> > arguments.
> > Introduce UBOOT_MKIMAGE_EXTRA_OPTS to allow passing extra options
> > to
> > mkimage during image generation.
> >=20
> > This is a generic need because different SoCs and boot
> > configurations
> > often require mkimage flags beyond the defaults. For example:
> > - `-E` enables external data in FIT images, which is essential for
> > =C2=A0=C2=A0modular boot setups, secure boot workflows, and reducing im=
age
> > size.
> > - `-B 8` enforces 8-byte alignment, ensuring compatibility with
> > boot
> > =C2=A0=C2=A0ROM requirements, improving memory access efficiency, and
> > supporting
> > =C2=A0=C2=A0predictable offsets for multi-component FIT images.
> >=20
> > By exposing this variable, we provide a clean and extensible
> > mechanism
> > for developers to meet hardware-specific and security requirements
> > without hardcoding options in recipes.
> >=20
> > Example:
> >=20
> > UBOOT_MKIMAGE_EXTRA_OPTS =3D "-B 8 -E"
> > will result in the mkimage command being invoked as:
> > `mkimage -B 8 -E -f fitImage.its fitImage.itb`
> >=20
> > Signed-off-by: Kavinaya S <kavinaya@qti.qualcomm.com>
> > ---
> > =C2=A0meta/classes-recipe/kernel-fit-image.bbclass | 1 +
> > =C2=A0meta/conf/image-fitimage.conf | 3 +++
> > =C2=A0meta/lib/oe/fitimage.py | 3 +++
> > =C2=A03 files changed, 7 insertions(+)
> >=20
> > diff --git a/meta/classes-recipe/kernel-fit-image.bbclass
> > b/meta/classes-recipe/kernel-fit-image.bbclass
> > index fd0d21ceee..5456311f00 100644
> > --- a/meta/classes-recipe/kernel-fit-image.bbclass
> > +++ b/meta/classes-recipe/kernel-fit-image.bbclass
> > @@ -56,6 +56,7 @@ python do_compile() {
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.getVar('HOST_PR=
EFIX'), d.getVar('UBOOT_ARCH'),
> > d.getVar("FIT_CONF_PREFIX"),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0oe.types.boolean(=
d.getVar('FIT_KERNEL_SIGN_ENABLE')),
> > d.getVar("FIT_KERNEL_SIGN_KEYDIR"),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.getVar("UBOOT_M=
KIMAGE"),
> > d.getVar("UBOOT_MKIMAGE_DTCOPTS"),
> > + d.getVar('UBOOT_MKIMAGE_EXTRA_OPTS'),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.getVar("UBOOT_M=
KIMAGE_SIGN"),
> > d.getVar("UBOOT_MKIMAGE_SIGN_ARGS"),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.getVar('FIT_HAS=
H_ALG'), d.getVar('FIT_SIGN_ALG'),
> > d.getVar('FIT_PAD_ALG'),
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0d.getVar('FIT_KER=
NEL_SIGN_KEYNAME'),
> > diff --git a/meta/conf/image-fitimage.conf b/meta/conf/image-
> > fitimage.conf
> > index 090ee148f4..e470adad5c 100644
> > --- a/meta/conf/image-fitimage.conf
> > +++ b/meta/conf/image-fitimage.conf
> > @@ -47,6 +47,9 @@ FIT_LINUX_BIN ?=3D "linux.bin"
> > =C2=A0# Allow user to select the default DTB for FIT image when multipl=
e
> > dtb's exists.
> > =C2=A0FIT_CONF_DEFAULT_DTB ?=3D ""
> > =C2=A0
> > +# Additional mkimage options for FIT image creation
> > +UBOOT_MKIMAGE_EXTRA_OPTS ?=3D ""

Defining an UBOOT_ name-spaced variable in image-fitimage.conf looks
strange. But I see why you ended up with that:
 * All the mkimage related variables start with UBOOT_
 * This variable is used by the kernel-fit-image.bbclass only. Defining
   it in uboot-config.bbclass looks strange as well.

But, all UBOOT_ variables are defined in uboot-config.bbclass. Would it
be more consistent if the variable would be defined in uboot-
config.bbclass or if the variable would be renamed to
FIT_MKIMAGE_EXTRA_OPTS?

> > +
> > =C2=A0# length of address in number of <u32> cells
> > =C2=A0# ex: 1 32bits address, 2 64bits address
> > =C2=A0FIT_ADDRESS_CELLS ?=3D "1"
> > diff --git a/meta/lib/oe/fitimage.py b/meta/lib/oe/fitimage.py
> > index f303799155..15a36310e0 100644
> > --- a/meta/lib/oe/fitimage.py
> > +++ b/meta/lib/oe/fitimage.py
> > @@ -156,6 +156,7 @@ class ItsNodeRootKernel(ItsNode):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def __init__(self, description, address_c=
ells, host_prefix,
> > arch, conf_prefix,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sign_enable=3DFalse, sign_keydir=3DN=
one,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mkimage=3DNone, mkimage_dtcopts=3DNo=
ne,
> > + mkimage_extra_opts=3DNone,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0mkimage_sign=3DNone, mkimage_sign_ar=
gs=3DNone,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0hash_algo=3DNone, sign_algo=3DNone, =
pad_algo=3DNone,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0sign_keyname_conf=3DNone,
> > @@ -177,6 +178,7 @@ class ItsNodeRootKernel(ItsNode):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._sign_keydir=
 =3D sign_keydir
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._mkimage =3D=
 mkimage
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._mkimage_dtc=
opts =3D mkimage_dtcopts
> > + self._mkimage_extra_opts =3D shlex.split(mkimage_extra_opts)

The class should work with the default parameters. But this just
explodes.

>>> import shlex
>>> shlex.split(None)
Traceback (most recent call last):
File "<stdin>", line 1, in <module>
shlex.split(None)
~~~~~~~~~~~^^^^^^
File "/usr/lib64/python3.13/shlex.py", line 308, in split
raise ValueError("s argument must not be None")
ValueError: s argument must not be None


This would work:

self._mkimage_extra_opts =3D shlex.split(mkimage_extra_opts) if
mkimage_extra_opts else []


> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._mkimage_sig=
n =3D mkimage_sign
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._mkimage_sig=
n_args =3D mkimage_sign_args
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0self._hash_algo =
=3D hash_algo
> > @@ -483,6 +485,7 @@ class ItsNodeRootKernel(ItsNode):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0def run_mkimage_assemble(self, itsfile, f=
itfile):
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0cmd =3D [
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0self._mkimage,
> > + *self._mkimage_extra_opts,

Also this one explodes with None. But if the initialization above gets
fixed, this will be fine as well.

> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0'-f', itsfile,
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0fitfile
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0]
> > =C2=A0


Thank you.
Regards,
Adrian

> > =C2=A0=C2=A0
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#227471):
> > https://lists.openembedded.org/g/openembedded-core/message/227471
> > Mute This Topic:
> > https://lists.openembedded.org/mt/116710036/3616765
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-
> > core/unsub [randy.macleod@windriver.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20
> > =C2=A0
> =C2=A0
>=20
> =C2=A0
> =C2=A0

