Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7C2BC02187
	for <webhook@archiver.kernel.org>; Sun, 19 Jan 2025 17:10:56 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.18978.1737306647057704153
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Jan 2025 09:10:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=S8F17nT3;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-436202dd7f6so42580185e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 09:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737306645; x=1737911445; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wyhz71fAHuXcJTZMA91zaCqYxcsXWtH4/TuZic+gHE=;
        b=S8F17nT3H30cMTDRM+H7QBHD8RPX/uSQxYFVHDEQQKIopyHURam1+vluU4I2g2ta+b
         u9JTuyui1s7Q36OqKYAz7Bmi1kgGUtdhEFsjG+FpLbn/oOEu5S9WzLBGCkEwBgaNvo81
         3ctkKtqtyVRU5HgxzVx3yV1Sg4l0KA6wVtDCG9v1UpwKZ2JmGHUpglMSVA1nYRCv2ta9
         PeDQ7cfZnTcGwPglkmFTaftis2Ua9G0voAzFDS89lTKwaj7iTzQxL1u8d0y/rZGCqTFC
         cc5lnTwCP9yycLCxcODTbI08jyivhkaAma4/aqW/QkCwQofbmRB9JMmPIB+U/zrWniMP
         K4SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737306645; x=1737911445;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0wyhz71fAHuXcJTZMA91zaCqYxcsXWtH4/TuZic+gHE=;
        b=tAryBYofpQX+BcwDnxIkc38VT7Tlm8IOZPcQs3lLqbIShoTW3YxxjFJMwyIjmWEIMa
         wshhjkII8Q3PR4JzLzvMZ2+1GytF0MKCNTB3YZ8Z648MkmaWu/QPPxp0tLgl4cuWH0af
         PxveCU3LwMbXfySPlpru2ISf+0BC/e0AUrkxXNT+IZPWcV1bY+ujo2fSTlSqUXBGFNyi
         u8gYYQQYzNyeTxGW1X032hyGJvAgZHQKmlHu6HaTV4DVONdBP7YUUS00ZjBjm2xA8MbY
         dpy9e91aNsf2QZIDkA4SCDV9to5Cd7hfWX5AvPc4vSX1IyrdwoiGLZux5oq6ne5Vu6RH
         JQUw==
X-Forwarded-Encrypted: i=1; AJvYcCVU9Cu+mjWkWZ2QO4UCkBoW90iBhVth0zbKfNAOFxYSWhBPr0uvizjKzLt85nCL4qPMzV3Ua0Oy+k/wxmmFd13ZUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy5NHBghuWmFrjRrDureyZQaRzCcmN3GbcK9I/Co2FEls0bgNzL
	xGmnTS1y03DTi+fAWcriTfK24AfOI27KKM6j1hCttNiqL2iN5SPo
X-Gm-Gg: ASbGncuSLRfsEq7Z15+vxi++6I/IDymPUSqLjm4D+eb4+i9YkbeThn6NuPrZHcoKN0c
	bVxhLSdnVh4hpoSeflfjOIvvdO8kkJl6j6gdOGu1PYaDxztei5bKr6NcSDdPN5kcV0VyJ+Zu2FF
	QEp+BwrLlAxL9Ck5ssHU1yZEug2J2gOKoyuQIdlDTk/7ROLGuX1fB0kkV2O8OkXTl5qqJZO4+AT
	F8+k1ZRkjyLm6XPIMx5h9Ju998zhxydzhAjvzcoIAWT5u1/CbYFU/4RyAX6J2DNBApLMDZP0uCz
	9lJb/4TJXR9XOw80m7Vn/Rr8eI+maa5u854Uf6a3NgKG
X-Google-Smtp-Source: AGHT+IGZJ7ioeqgz5BajKFW/xzZHwR7bPnDk1LLw6rJycZFvbcNZGU0IvtxYYthS0JYExSm8dMhlyw==
X-Received: by 2002:a05:600c:6b18:b0:438:a1f4:3e9d with SMTP id 5b1f17b1804b1-438a1f43efdmr39847535e9.9.1737306645144;
        Sun, 19 Jan 2025 09:10:45 -0800 (PST)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c0f026c0sm93607215e9.0.2025.01.19.09.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 09:10:44 -0800 (PST)
Message-ID: <1dd5f8c1e6cbf62a4d2293427d8bf7adec0751ea.camel@gmail.com>
Subject: Re: [OE-core] [PATCH v4] u-boot: kernel-fitimage: Fix dependency
 loop if UBOOT_SIGN_ENABLE and UBOOT_ENV enabled
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: marex@denx.de, openembedded-core@lists.openembedded.org
Date: Sun, 19 Jan 2025 18:10:43 +0100
In-Reply-To: <20250119140349.21919-1-marex@denx.de>
References: <20250119140349.21919-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Jan 2025 17:10:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210017

Hi Marek

On Sun, 2025-01-19 at 15:03 +0100, Marek Vasut via
lists.openembedded.org wrote:
> In case both UBOOT_SIGN_ENABLE and UBOOT_ENV are enabled and
> kernel-fitimage.bbclass is in use to generate signed kernel
> fitImage, there is a circular dependency between uboot-sign
> and kernel-fitimage bbclasses . The loop looks like this:
>=20
> kernel-fitimage.bbclass:
> - do_populate_sysroot depends on do_assemble_fitimage
> =C2=A0 - do_assemble_fitimage depends on
> virtual/bootloader:do_populate_sysroot
> =C2=A0=C2=A0=C2=A0 - virtual/bootloader:do_populate_sysroot depends on
> virtual/bootloader:do_install
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =3D> The virtual/bootloader:do_install ins=
talls and the
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtual/bootloader:do_po=
pulate_sysroot places into
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 sysroot an U-Boot enviro=
nment script embedded into
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kernel fitImage during d=
o_assemble_fitimage run .
>=20
> uboot-sign.bbclass:
> - DEPENDS on KERNEL_PN, which is really virtual/kernel. More
> accurately
> =C2=A0 - do_deploy depends on do_uboot_assemble_fitimage
> =C2=A0 - do_install depends on do_uboot_assemble_fitimage
> =C2=A0 - do_uboot_assemble_fitimage depends on
> virtual/kernel:do_populate_sysroot
> =C2=A0=C2=A0=C2=A0 =3D> do_install depends on virtual/kernel:do_populate_=
sysroot
>=20
> =3D> virtual/bootloader:do_install depends on
> virtual/kernel:do_populate_sysroot
> =C2=A0=C2=A0 virtual/kernel:do_populate_sysroot depends on
> virtual/bootloader:do_install
>=20
> Attempt to resolve the loop. Pull fitimage configuration options into
> separate
> new bbclass kernel-fitimage-config.bbclass so these configuration
> options can
> be shared by both uboot-sign.bbclass and kernel-fitimage.bbclass, and
> make use
> of mkimage -f auto-conf / mkimage -f auto option to insert /signature
> node key-*
> subnode into U-Boot control DT without depending on the layout of
> kernel fitImage
> itself. This is perfectly valid to do, because the U-Boot /signature
> node key-*
> subnodes 'required' property can contain either of two values, 'conf'
> or 'image'
> to authenticate either selected configuration or all of images when
> booting the
> fitImage.
>=20
> For details of the U-Boot fitImage signing process, see:
> https://docs.u-boot.org/en/latest/usage/fit/signature.html
> For details of mkimage -f auto-conf and -f auto, see:
> https://manpages.debian.org/experimental/u-boot-tools/mkimage.1.en.html#E=
XAMPLES
>=20
> Fixes: 5e12dc911d0c ("u-boot: Rework signing to remove
> interdependencies")
> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Sean Anderson <sean.anderson@seco.com>
> ---
> V2: Take a different approach, split the kernel-fitimage.bbclass and
> =C2=A0=C2=A0=C2=A0 use it to generate dummy fitImage on demand
> V3: Use mkimage -f auto-conf and mkimage -f auto to break the loop,
> =C2=A0=C2=A0=C2=A0 the fitImage .its source is not even needed because th=
e
> 'required'
> =C2=A0=C2=A0=C2=A0 property can only have two values, 'conf' or 'image' .
> V4: Restore CC list
> ---
> =C2=A0.../kernel-fitimage-config.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 50 +++++++++++++++++
> =C2=A0meta/classes-recipe/kernel-fitimage.bbclass=C2=A0=C2=A0 | 54 +-----=
-----------
> --
> =C2=A0meta/classes-recipe/uboot-sign.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 26 ++++-----
> =C2=A03 files changed, 64 insertions(+), 66 deletions(-)
> =C2=A0create mode 100644 meta/classes-recipe/kernel-fitimage-
> config.bbclass
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage-config.bbclass
> b/meta/classes-recipe/kernel-fitimage-config.bbclass
> new file mode 100644
> index 00000000000..1f665f7d47c
> --- /dev/null
> +++ b/meta/classes-recipe/kernel-fitimage-config.bbclass
> @@ -0,0 +1,50 @@
> +# Description string
> +FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
> +
> +# Kernel fitImage Hash Algo
> +FIT_HASH_ALG ?=3D "sha256"
> +
> +# Kernel fitImage Signature Algo
> +FIT_SIGN_ALG ?=3D "rsa2048"
> +
> +# Kernel / U-Boot fitImage Padding Algo
> +FIT_PAD_ALG ?=3D "pkcs-1.5"
> +
> +# Generate keys for signing Kernel fitImage
> +FIT_GENERATE_KEYS ?=3D "0"
> +
> +# Size of private keys in number of bits
> +FIT_SIGN_NUMBITS ?=3D "2048"
> +
> +# args to openssl genrsa (Default is just the public exponent)
> +FIT_KEY_GENRSA_ARGS ?=3D "-F4"
> +
> +# args to openssl req (Default is -batch for non interactive mode
> and
> +# -new for new certificate)
> +FIT_KEY_REQ_ARGS ?=3D "-batch -new"
> +
> +# Standard format for public key certificate
> +FIT_KEY_SIGN_PKCS ?=3D "-x509"
> +
> +# Sign individual images as well
> +FIT_SIGN_INDIVIDUAL ?=3D "0"
> +
> +FIT_CONF_PREFIX ?=3D "conf-"
> +FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node
> name"
> +
> +FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma
> cpio.xz cpio.zst cpio.gz ext2.gz cpio"
> +
> +# Allow user to select the default DTB for FIT image when multiple
> dtb's exists.
> +FIT_CONF_DEFAULT_DTB ?=3D ""
> +
> +# length of address in number of <u32> cells
> +# ex: 1 32bits address, 2 64bits address
> +FIT_ADDRESS_CELLS ?=3D "1"
> +
> +# Keys used to sign individually image nodes.
> +# The keys to sign image nodes must be different from those used to
> sign
> +# configuration nodes, otherwise the "required" property, from
> +# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails
> on "image".
> +# Then the images signature checking will not be mandatory and no
> error will be
> +# raised in case of failure.
> +# UBOOT_SIGN_IMG_KEYNAME =3D "dev2" # keys name in keydir (eg.
> "dev2.crt", "dev2.key")
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 67c98adb232..33dae750672 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -4,7 +4,7 @@
> =C2=A0# SPDX-License-Identifier: MIT
> =C2=A0#
> =C2=A0
> -inherit kernel-uboot kernel-artifact-names uboot-config
> +inherit kernel-uboot kernel-artifact-names uboot-config kernel-
> fitimage-config
> =C2=A0
> =C2=A0def get_fit_replacement_type(d):
> =C2=A0=C2=A0=C2=A0=C2=A0 kerneltypes =3D d.getVar('KERNEL_IMAGETYPES') or=
 ""
> @@ -52,58 +52,6 @@ python __anonymous () {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.setVar('EXTERNAL_KERNE=
L_DEVICETREE',
> "${RECIPE_SYSROOT}/boot/devicetree")
> =C2=A0}
> =C2=A0
> -
> -# Description string
> -FIT_DESC ?=3D "Kernel fitImage for ${DISTRO_NAME}/${PV}/${MACHINE}"
> -
> -# Kernel fitImage Hash Algo
> -FIT_HASH_ALG ?=3D "sha256"
> -
> -# Kernel fitImage Signature Algo
> -FIT_SIGN_ALG ?=3D "rsa2048"
> -
> -# Kernel / U-Boot fitImage Padding Algo
> -FIT_PAD_ALG ?=3D "pkcs-1.5"
> -
> -# Generate keys for signing Kernel fitImage
> -FIT_GENERATE_KEYS ?=3D "0"
> -
> -# Size of private keys in number of bits
> -FIT_SIGN_NUMBITS ?=3D "2048"
> -
> -# args to openssl genrsa (Default is just the public exponent)
> -FIT_KEY_GENRSA_ARGS ?=3D "-F4"
> -
> -# args to openssl req (Default is -batch for non interactive mode
> and
> -# -new for new certificate)
> -FIT_KEY_REQ_ARGS ?=3D "-batch -new"
> -
> -# Standard format for public key certificate
> -FIT_KEY_SIGN_PKCS ?=3D "-x509"
> -
> -# Sign individual images as well
> -FIT_SIGN_INDIVIDUAL ?=3D "0"
> -
> -FIT_CONF_PREFIX ?=3D "conf-"
> -FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node
> name"
> -
> -FIT_SUPPORTED_INITRAMFS_FSTYPES ?=3D "cpio.lz4 cpio.lzo cpio.lzma
> cpio.xz cpio.zst cpio.gz ext2.gz cpio"
> -
> -# Allow user to select the default DTB for FIT image when multiple
> dtb's exists.
> -FIT_CONF_DEFAULT_DTB ?=3D ""
> -
> -# length of address in number of <u32> cells
> -# ex: 1 32bits address, 2 64bits address
> -FIT_ADDRESS_CELLS ?=3D "1"
> -
> -# Keys used to sign individually image nodes.
> -# The keys to sign image nodes must be different from those used to
> sign
> -# configuration nodes, otherwise the "required" property, from
> -# UBOOT_DTB_BINARY, will be set to "conf", because "conf" prevails
> on "image".
> -# Then the images signature checking will not be mandatory and no
> error will be
> -# raised in case of failure.
> -# UBOOT_SIGN_IMG_KEYNAME =3D "dev2" # keys name in keydir (eg.
> "dev2.crt", "dev2.key")
> -
> =C2=A0#
> =C2=A0# Emit the fitImage ITS header
> =C2=A0#
> diff --git a/meta/classes-recipe/uboot-sign.bbclass b/meta/classes-
> recipe/uboot-sign.bbclass
> index a17be745cec..d23ae4d8d15 100644
> --- a/meta/classes-recipe/uboot-sign.bbclass
> +++ b/meta/classes-recipe/uboot-sign.bbclass
> @@ -25,7 +25,7 @@
> =C2=A0# For more details on signature process, please refer to U-Boot
> documentation.
> =C2=A0
> =C2=A0# We need some variables from u-boot-config
> -inherit uboot-config
> +inherit uboot-config kernel-fitimage-config
> =C2=A0
> =C2=A0# Enable use of a U-Boot fitImage
> =C2=A0UBOOT_FITIMAGE_ENABLE ?=3D "0"
> @@ -85,9 +85,6 @@ UBOOT_FIT_KEY_SIGN_PKCS ?=3D "-x509"
> =C2=A0# ex: 1 32bits address, 2 64bits address
> =C2=A0UBOOT_FIT_ADDRESS_CELLS ?=3D "1"
> =C2=A0
> -# This is only necessary for determining the signing configuration
> -KERNEL_PN =3D "${PREFERRED_PROVIDER_virtual/kernel}"
> -
> =C2=A0UBOOT_FIT_UBOOT_LOADADDRESS ?=3D "${UBOOT_LOADADDRESS}"
> =C2=A0UBOOT_FIT_UBOOT_ENTRYPOINT ?=3D "${UBOOT_ENTRYPOINT}"
> =C2=A0
> @@ -96,8 +93,6 @@ python() {
> =C2=A0=C2=A0=C2=A0=C2=A0 sign =3D d.getVar('UBOOT_SIGN_ENABLE') =3D=3D '1=
'
> =C2=A0=C2=A0=C2=A0=C2=A0 if d.getVar('UBOOT_FITIMAGE_ENABLE') =3D=3D '1' =
or sign:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('DEPENDS', "=
 u-boot-tools-native dtc-native")
> -=C2=A0=C2=A0=C2=A0 if sign:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('DEPENDS', " " + =
d.getVar('KERNEL_PN'))
> =C2=A0}
> =C2=A0
> =C2=A0concat_dtb() {
> @@ -106,16 +101,25 @@ concat_dtb() {
> =C2=A0
> =C2=A0	if [ -e "${UBOOT_DTB_BINARY}" ]; then
> =C2=A0		# Re-sign the kernel in order to add the keys to our
> dtb
> +		UBOOT_MKIMAGE_MODE=3D"auto-conf"
> +		# Signing individual images is not recommended as
> that
> +		# makes fitImage susceptible to mix-and-match
> attack.
> +		if [ "${FIT_SIGN_INDIVIDUAL}" =3D "1" ] ; then
> +			UBOOT_MKIMAGE_MODE=3D"auto"
> +		fi
> =C2=A0		${UBOOT_MKIMAGE_SIGN} \
> =C2=A0			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -			-F -k "${UBOOT_SIGN_KEYDIR}" \
> +			-f ${UBOOT_MKIMAGE_MODE} -d /dev/null \

As UBOOT_MKIMAGE_MODE appears to be a shell variable and not a bitbake
variable, it should be used like $UBOOT_MKIMAGE_MODE and not like
${UBOOT_MKIMAGE_MODE}.

> +			-k "${UBOOT_SIGN_KEYDIR}" \
> +			-o "${FIT_HASH_ALG},${FIT_SIGN_ALG}" \
> +			-g "${UBOOT_SIGN_IMG_KEYNAME}" \
> =C2=A0			-K "${UBOOT_DTB_BINARY}" \
> -			-r ${B}/fitImage-linux \
> +			-r ${B}/unused.itb

Here a \ is missing. The line should look like:
			-r ${B}/unused.itb \

This patch looks much simpler than v2 and is a good step towards
decoupling the kernel and u-boot. Now the dependencies between u-boot
and the kernel are primarily some shared variables. The task
dependencies are much less critical.

Thank you
Adrian

> =C2=A0			${UBOOT_MKIMAGE_SIGN_ARGS}
> =C2=A0		# Verify the kernel image and u-boot dtb
> =C2=A0		${UBOOT_FIT_CHECK_SIGN} \
> =C2=A0			-k "${UBOOT_DTB_BINARY}" \
> -			-f ${B}/fitImage-linux
> +			-f ${B}/unused.itb
> =C2=A0		cp ${UBOOT_DTB_BINARY} ${UBOOT_DTB_SIGNED}
> =C2=A0	fi
> =C2=A0
> @@ -351,10 +355,6 @@ uboot_assemble_fitimage_helper() {
> =C2=A0}
> =C2=A0
> =C2=A0do_uboot_assemble_fitimage() {
> -	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" ] ; then
> -		cp "${STAGING_DIR_HOST}/sysroot-only/fitImage"
> "${B}/fitImage-linux"
> -	fi
> -
> =C2=A0	if [ -n "${UBOOT_CONFIG}" ]; then
> =C2=A0		unset i
> =C2=A0		for config in ${UBOOT_MACHINE}; do
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#210008):
> https://lists.openembedded.org/g/openembedded-core/message/210008
> Mute This Topic: https://lists.openembedded.org/mt/110697929/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


