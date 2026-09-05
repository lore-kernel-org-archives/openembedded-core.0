Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E280C624D6
	for <webhook@archiver.kernel.org>; Sat,  5 Sep 2026 07:39:11 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3965.1788593946081881048
 for <openembedded-core@lists.openembedded.org>;
 Sat, 05 Sep 2026 00:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=JUnev1zs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-485888b3c3dso1848360f8f.2
        for <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 00:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1788593944; x=1789198744; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=g8KZ6e7+I7sJZbHkGJoKsct+NlC+WJGK6CX4Cnp1DYc=;
        b=JUnev1zsibhOClqS0AbIPt9SxLyDASGHCp2E/4NnGZjzBpfthDHg+6d9UdmkFhQoIx
         GSOp/Omt24PerDrUMoKybH7NKM1N4Ht/BOr/9x6dP0T0athS0vUQ9GPXvdL+avYAHcxj
         feK1U5jdXXVbtSEqb0vNBObakSWJQ4hIX1q0I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788593944; x=1789198744;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g8KZ6e7+I7sJZbHkGJoKsct+NlC+WJGK6CX4Cnp1DYc=;
        b=bjBu9XNrFPITuHpSkgSN2POUWQO8cQrZ6DCAoAm/SCmRvUR7PBXQhO3LR48QALRMQS
         tAM2wra8MgLSVRs9mMw/JQguAy+F9WND2cqHVKawbmOFSyJIhCRul/4VdV1PCF07TaXU
         5VeyCND69M1aWb9LQ+sVSrsoynVEDogwIHYvDbBtOfA/4SVihzoN8PjV8pz1yk2U4al5
         4bFPQEuam0CFRsfOMvlvEU0pXYzzsY0DHjthzE2j47TOT7R6+eScvvgjiZN2oVAhwTaY
         fg2GcaB+0qx2zU41XQ9YBBfBhsZTkDwIT5SN5PARFhJsUvVlDgUcsMx2o3GgaA4rA0GJ
         RJ+A==
X-Forwarded-Encrypted: i=1; AKwUvBwtVNNG7AMHdM0MippkcHv6HZSk7+ChoRASNT7RLzD/CPAjEd0Je9HOPln40Q2z6vuiS73B19LrpumV+XwxDuMa9Q==@lists.openembedded.org
X-Gm-Message-State: AFuF++mD9lglhYr4TH6feDwhHbaDzWyWtjDLSdP24T4zvexOGBP7hXN4
	zJWV462HKy0KZBUIDynZegtUrnxFr1O3eBzvCKzKNJOLxn6c1vSyzRgHBRRDV6zZsZI=
X-Gm-Gg: AYBFou0bIyS04iEXn+TUprAlH/4DLG2yZN9TSH5GOKE5fJbLzmDsEO3bfLmlYTsyhE1
	duE8Z0xnwy5gwJPYmrNk8AmYmXMkaBZ7IVRCGYpy7E54OzuSLf28F5MoRrPX7aHAInonoMKpbja
	9dsIKRGcYTgOWOlHLg09torwhdoiB/yoD5uhYkoEQcFOGJ4U0i3yYuAtZJRAs2utrsEQz2WRq4H
	GotwZq7kqWijXmGzcs87m6cXnBqTwlrbSDHRv/IVseSZy4K+tGTJDNjqNYeUwmYgElI8r2BLk64
	TVaCnEJMQmv2SGL7ONyrXz3bnrrfQB5CuxlPMfSteSDab0NCQnhzxlz+KyTeyoxbv5ZD+64EDtN
	35bT4y2cvOjPjNVnSNji4oN1OCRpNJwf4X7pDMDb8JNxYwKABTbl5uhMvybcjy3/kFcZAZ6ZTZl
	/i9I6veTG4NFZZGxL2H+Pl3aw/vKSGkYqvmThRBPP3+chGUBg7ODPm73awcLrf1orgWYSMBAlg1
	+RAvZIqBkX4O8KGMETOpIvqxjBZAK4o2i3SjG8khf2WS0NLN+o=
X-Received: by 2002:a05:6000:4a14:b0:485:8f42:e8e2 with SMTP id ffacd0b85a97d-4858f42eb77mr3783710f8f.1.1788593944158;
        Sat, 05 Sep 2026 00:39:04 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:98f:90b6:41a8:38d5? ([2001:8b0:aba:5f3c:98f:90b6:41a8:38d5])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm2482190f8f.0.2026.09.05.00.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 00:39:03 -0700 (PDT)
Message-ID: <7f5c5ec971adc08fc5e2ca6e4b0c30840880cb3f.camel@linuxfoundation.org>
Subject: Re: [OE-core][PATCH v7 2/5] kernel: re-sign kernel modules after
 package stripping process
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Anis Bougrine <anis.bougrine10@gmail.com>, 
	openembedded-core@lists.openembedded.org
Cc: Ross Burton <ross.burton@arm.com>, Bruce Ashfield
 <bruce.ashfield@gmail.com>
Date: Sat, 05 Sep 2026 08:39:02 +0100
In-Reply-To: <20260826233416.37047-3-anis.bougrine10@gmail.com>
References: <20260826233416.37047-1-anis.bougrine10@gmail.com>
	 <20260826233416.37047-3-anis.bougrine10@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 05 Sep 2026 07:39:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245145

On Thu, 2026-08-27 at 01:34 +0200, Anis Bougrine wrote:
> Fixes [YOCTO #12927]
>=20
> Currently, signed kernel modules are not stripped in order to preserve
> their valid signatures. See commit 4c47e5f.
>=20
> Therefore, this commit makes kernel modules stripped and correctly
> signed. Two options are possible:
>=20
> =C2=A0=C2=A0=C2=A0 - Strip the kernel modules after installation and befo=
re signing.
> =C2=A0=C2=A0=C2=A0 - Re-sign the kernel modules after stripping and befor=
e package splitting.
>=20
> The first option was rejected because debug symbols would be dropped earl=
y
> in the build workflow, which may impact the SPDX process.
>=20
> The second option is adopted because it does not impact the build flow.
>=20
> Reported-by: Ross Burton <ross.burton@arm.com>
> Signed-off-by: Anis Bougrine <anis.bougrine10@gmail.com>
> ---
> =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 25 +++++++++++++++++++
> =C2=A01 file changed, 25 insertions(+)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index ab2f0d1c37..2b40437cc2 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -35,6 +35,11 @@ modprobedir ??=3D "${@bb.utils.contains('DISTRO_FEATUR=
ES', 'systemd', '${nonarch_b
> =C2=A0
> =C2=A0KERNEL_SPLIT_MODULES ?=3D "1"
> =C2=A0PACKAGESPLITFUNCS =3D+ "split_kernel_module_packages"
> +# Order matters:
> +# 1. Strip the modules
> +# 2. Re-sign the modules (if enabled)
> +# 3. Split the packages
> +PACKAGESPLITFUNCS =3D+ "post_strip_kernel_modules_signing"
> =C2=A0
> =C2=A0KERNEL_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NAME=
") or "kernel" }-modules"
> =C2=A0
> @@ -42,6 +47,26 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> =C2=A0
> +# This function supports both in-tree and out-of-tree modules.
> +post_strip_kernel_modules_signing(){
> +=C2=A0=C2=A0=C2=A0 # Read .config values to determine if module auto-sig=
ning is enabled
> +=C2=A0=C2=A0=C2=A0 is_modules=3D"$(${STAGING_KERNEL_DIR}/scripts/config =
--file ${KBUILD_OUTPUT}/.config --state MODULES)"
> +=C2=A0=C2=A0=C2=A0 is_module_sig=3D"$(${STAGING_KERNEL_DIR}/scripts/conf=
ig --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG)"
> +=C2=A0=C2=A0=C2=A0 is_module_sig_all=3D"$(${STAGING_KERNEL_DIR}/scripts/=
config --file ${KBUILD_OUTPUT}/.config --state MODULE_SIG_ALL)"
> +
> +=C2=A0=C2=A0=C2=A0 if [ "$is_modules" =3D "y" ] && [ "$is_module_sig" =
=3D "y" ] && [ "$is_module_sig_all" =3D "y" ]; then
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Sign modules under ${PKGD},=
 with M=3D if out-of-tree module.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Out-of-tree module Makefile=
s invoke the kernel Makefile by appending M=3D (the module directory) to MA=
KEFLAGS.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # However, they usually do no=
t provide a modules_sign target. Therefore, the kernel modules_sign target =
has to
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # be invoked manually after r=
etrieving M=3D variable from package source code Makefile.
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 oe_runmake \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -C ${=
KBUILD_OUTPUT}=C2=A0 \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 MODLI=
B=3D${PKGD}${nonarch_base_libdir}/modules/${KERNEL_VERSION} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ${@'M=
=3D%s' % oe.kernel_module.get_ext_mod(d) if not "virtual/kernel" in d.getVa=
r('PROVIDES') else ''} \
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 modul=
es_sign
> +=C2=A0=C2=A0=C2=A0 fi
> +}

This has merged and I'm really happy to see the signing code improved.
There is a weird bug this as introduced though where the eSDK is
breaking in kernel module compile tests.

This is an example failure:

https://autobuilder.yoctoproject.org/valkyrie/#/builders/30/builds/4551

In the bad environment, you can source the test eSDK environment:

. /srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-lin=
ux/core-image-sato/1.0/testsdkext/environment-setup-core2-32-poky-linux

Rerun the compile step:

/srv/pokybuild/yocto-worker/qemux86/build/build/tmp/work/qemux86-poky-linux=
/core-image-sato/1.0/testsdkext/tmp/work/qemux86-poky-linux/kernel-module-h=
ello-world/1.0+git/temp/run.do_compile

where you see hello-world.ko get generated:

make[2]: Entering directory '/srv/pokybuild/yocto-worker/qemux86/build/buil=
d/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/sour=
ces/kernel-module-hello-world'
  LD [M]  hello-world.ko
make[2]: Leaving directory '/srv/pokybuild/yocto-worker/qemux86/build/build=
/tmp/work/qemux86-poky-linux/core-image-sato/1.0/testsdkext/workspace/sourc=
es/kernel-module-hello-world'

then watch:

devtool build kernel-module-hello-world

fail as above, noting that the hello-world.ko file disappears by the time i=
t runs.

To cut a long story short (hours of debugging), this happens during
parsing of the kernel-module-hello-world recipe. If you add a
bb.warn("Executing make") to oe.kernel_module.get_ext_mod() in
meta/lib/oe/kernel_module.py, you will see it runs make during parsing
and that make command deletes the .ko file.

This raises a few questions:

a) why is make being run during parsing?

The shell function is being expanded to work out dependencies=C2=A0=20
and=C2=A0that triggers the python function call. This should definitely not
be happening during parsing so that is a bug.

b) why does calling --dry-run on the kernel makefile delete files?

We need to fix this somehow to avoid the failures/bad behaviour. I at
least wanted to explain the issue now I'd found the underlying area of
the problem. I've not really had a chance to think about solutions yet.

Cheers,

Richard





