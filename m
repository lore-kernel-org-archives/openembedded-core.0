Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A4CC28B20
	for <webhook@archiver.kernel.org>; Wed,  2 Apr 2025 07:22:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web11.2302.1743578542636804953
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Apr 2025 00:22:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=WoXvzDti;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so49921215e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 00:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743578541; x=1744183341; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=25PD+Mqw+8OwMnnL3+fKl8/7hfy9xy0DTbOswsmyOeg=;
        b=WoXvzDtiUe75c0XHPW0gBpsShE9lDKwXtVDITSCPGos/v/n9UNAFiLRlJmB/sLMqwr
         OuVcAi1EMVvmcWHTMwoW5HYlRy1L4kqNvvnU7WSUiovcP9Sm85jZqbaT4qoEo6GxpE6f
         7I9i2G22wuyenvdtoRXLdvQBldAkkfWFniMBY0Jeta36fjdnEpMrRiFvadcmukRDsPhO
         4+j4gq3kepvrmkw5Nl3Z9BYHIkIlzd37UANN+5qlmHLZAZLy5is6gC7oUl+CLDwKnAL9
         sRAE0Bo9ttwNRjTVh9mJh63twpxc3RS02pJRSlUcl/FYmfeyxb2lior6vXR5PnixKEvk
         wXFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578541; x=1744183341;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25PD+Mqw+8OwMnnL3+fKl8/7hfy9xy0DTbOswsmyOeg=;
        b=WhZuTtPynl01cA0rLQap+00hiC/ViBbQTeEASTyBFD8BZEvQn/MgrNOU7UQLgKVZsG
         iCTixdnyRNC+UJ00yJ92N7mc1YVvu+EF4S4BAo+OmxdFQhlt+UuLdqJ7ZVhKAmkdo3dO
         YEwkvBVKbffuJPyx9G3pmyo+H3+QKNQjDwT3bcVQWaL+lukVqba3QkjBc8xIwLq2tD5S
         lcpNPckMd++nFHFFVt+pIt/nEIjdv2PVA+0I8oOxH93eApwhhdsJ6/9WgTReJrsTiOC0
         Yux9XmqOAuxfckmEaT4kFmTgIzXAXCE5wR16uu2ELIAGN6lFRu3L5eQD4zHrmQZBoIU+
         k4hA==
X-Forwarded-Encrypted: i=1; AJvYcCVGkdgQslp8BsOdTwX8ygpfk2ttm2eGED9rh0KzkePJ1/xko/z2s/uyJiwsH8weOh/BMTeH50cnZo+9LyhqrtOSvQ==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yz03mIIWo+RBYEKerWg2dry+7zk1n6BN022xnez1h/0EDHd6njz
	VlHtK1Zt1jh4XIKUm2J3sdNXgr23DXh+S3oaF1fO41V6oDvdnGqU
X-Gm-Gg: ASbGncsgwLBXyTfHclcXTbzFMplMkNrAAkOJ5cpUfyRfYaa4BMbbPm44FQNRvs/1ywo
	2jP7P8/N+G8vmeZIpVLH/mVCvt2y+uxcEyC4TDLBwePWFrdXc4I7/IsIRjWN2eDP/CUpNCCItJg
	oszzG0+VYJhUY0m9jthtUzGN1OTMWSIOQEGSK+ONtbX7ZJ/ItupiURdyqNY8ZktPVbRyozBa2Yj
	Bq22DI5+wa6RUU0dq8PhGgtSTZyB6Qx020lKmXDO6xYD7KUHYbYx+eiivxWSrGnSe+LiPy53ZZG
	T0ay2bYvyH+MKpq/YPd6cvG+5eBjKwLHq+ccAVT9tEVWuMwjlXv5UCjQek6cR7Fh2/2HP/th4/E
	6OoG0moO+x1bh99jXwA==
X-Google-Smtp-Source: AGHT+IGFmGwkgn5R5bWR8fNFMalPveGmIuH75Uwz5nCn7tjB1Vl+JKCbumLt7TSvNye6jobI0C29fw==
X-Received: by 2002:a05:600c:3d8e:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43db6223fb0mr153828625e9.8.1743578540657;
        Wed, 02 Apr 2025 00:22:20 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:55c4:f628:91f3:4287? ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb6103a07sm11599325e9.29.2025.04.02.00.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 00:22:20 -0700 (PDT)
Message-ID: <efb987833e5a0b7147972519b3d1efe9cb3e8735.camel@gmail.com>
Subject: Re: [OE-core] [RFC PATCH] u-boot: kernel-fitimage: add
 pre-processing hooks
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: anshuld@ti.com, openembedded-core@lists.openembedded.org
Cc: c-shilwant@ti.com, vigneshr@ti.com, reatmon@ti.com, afd@ti.com,
 denys@ti.com
Date: Wed, 02 Apr 2025 09:22:19 +0200
In-Reply-To: <20250401135010.3278105-1-anshuld@ti.com>
References: <20250401135010.3278105-1-anshuld@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41app1) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Apr 2025 07:22:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214225

Hi Anshul

The kernel-fitimage.bbclass is already a bit complicated because of the
many special cases it supports. The patch looks like it adds support
for another very special use case to the kernel, which makes it even
more complicated. Especially when patches come without test cases, this
makes the situation worse.

Adding the same code multiple times does not look like an elegant
solution. This is of course also because of the existing code base. I'm
working on a re-implementation in Python, which would probably allow to
do this much more elegant.
https://web.git.yoctoproject.org/poky-
contrib/commit/?h=3Dadrianf/fitimage-improvements
Note: I have a newer version which I will push soon.
The next version of these patches will move the FIT image generation
out of the kernel recipe into a separate recipe. This would also allow
to have a customized recipe in your layer which does the pre-
processing. That would be much simpler than doing this in the context
of the complicated kernel recipe.
The plan is here:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D12912

Did you also consider to implement this feature in uboot mkimage?
mkimage is supposed to do the signing of all the artifacts in the FIT
image. There are 2 modes supported:
 * FIT_SIGN_INDIVIDUAL=3D1: Sign all the image artifacts and the
   configuration nodes
   This mode looks like doing what your patches try to do
   indepepndently from mkimage.
 * IT_SIGN_INDIVIDUAL=3D0: Sign only the configuration nodes.
Since your hook is related to signing: Is it the right approach to do
half of the signing process in OE-core when the design is currently
such that mkimage can normally do this completely on its own?

Thank you and regards,
Adrian



On Tue, 2025-04-01 at 19:20 +0530, Anshul Dalal via
lists.openembedded.org wrote:
> In some use cases it is desirable to perform some pre-processing on
> fitImage's individual components before packaging them in the final
> FIT
> such as using a custom signing mechanism for secure booting separate
> from mkimage.
>=20
> Therefore this patch adds a pre-processing hook called
> `preprocess_binary` in the kernel-fitimage class to allow bsp layers
> to
> override it and perform pre-processing to the fit components.
>=20
> This functionality is enabled by setting the FIT_PREPROCESS_BINARY
> variable to 1 which defaults to 0.
>=20
> Signed-off-by: Anshul Dalal <anshuld@ti.com>
> ---
> =C2=A0meta/classes-recipe/kernel-fitimage.bbclass | 52
> +++++++++++++++++++--
> =C2=A01 file changed, 47 insertions(+), 5 deletions(-)
>=20
> diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> b/meta/classes-recipe/kernel-fitimage.bbclass
> index 18ab17bd2c..ebe159ea03 100644
> --- a/meta/classes-recipe/kernel-fitimage.bbclass
> +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> @@ -84,6 +84,9 @@ FIT_KEY_SIGN_PKCS ?=3D "-x509"
> =C2=A0# Sign individual images as well
> =C2=A0FIT_SIGN_INDIVIDUAL ?=3D "0"
> =C2=A0
> +# Preprocess individual fitImage binaries (kernel, dtb etc.) with an
> overridable `preprocess_binary` function
> +FIT_PREPROCESS_BINARY ?=3D "0"
> +
> =C2=A0FIT_CONF_PREFIX ?=3D "conf-"
> =C2=A0FIT_CONF_PREFIX[doc] =3D "Prefix to use for FIT configuration node
> name"
> =C2=A0
> @@ -553,6 +556,10 @@ EOF
> =C2=A0EOF
> =C2=A0}
> =C2=A0
> +preprocess_binary() {
> + bbfatal "Provide an implementation for 'preprocess_binary' to
> preprocess fitImage binaries or unset FIT_PREPROCESS_BINARY"
> +}
> +
> =C2=A0#
> =C2=A0# Assemble fitImage
> =C2=A0#
> @@ -581,7 +588,14 @@ fitimage_assemble() {
> =C2=A0 fitimage_emit_section_maint $1 imagestart
> =C2=A0
> =C2=A0 uboot_prep_kimage
> - fitimage_emit_section_kernel $1 $kernelcount linux.bin
> "$linux_comp"
> + BINARY_PATH=3D"linux.bin"
> + if [ "x${FIT_PREPROCESS_BINARY}" =3D "x1" ]; then
> + PROCESSED_BINARY=3D"${BINARY_PATH}.processed"
> + preprocess_binary $BINARY_PATH $PROCESSED_BINARY
> + fitimage_emit_section_kernel $1 $kernelcount $PROCESSED_BINARY
> "$linux_comp"
> + else
> + fitimage_emit_section_kernel $1 $kernelcount $BINARY_PATH
> "$linux_comp"
> + fi
> =C2=A0
> =C2=A0 #
> =C2=A0 # Step 2: Prepare a DTB image section
> @@ -622,7 +636,14 @@ fitimage_assemble() {
> =C2=A0
> =C2=A0 DTBS=3D"$DTBS $DTB"
> =C2=A0 DTB=3D$(echo $DTB | tr '/' '_')
> - fitimage_emit_section_dtb $1 $DTB $DTB_PATH
> + BINARY_PATH=3D"$DTB_PATH"
> + if [ "x${FIT_PREPROCESS_BINARY}" =3D "x1" ]; then
> + PROCESSED_BINARY=3D"${BINARY_PATH}.processed"
> + preprocess_binary $BINARY_PATH $PROCESSED_BINARY
> + fitimage_emit_section_dtb $1 $DTB $PROCESSED_BINARY
> + else
> + fitimage_emit_section_dtb $1 $DTB $BINARY_PATH
> + fi
> =C2=A0 done
> =C2=A0 fi
> =C2=A0
> @@ -646,7 +667,14 @@ fitimage_assemble() {
> =C2=A0 [ $(symlink_points_below $DTB "${EXTERNAL_KERNEL_DEVICETREE}") ] &=
&
> continue
> =C2=A0
> =C2=A0 DTB=3D$(echo $DTB | tr '/' '_')
> - fitimage_emit_section_dtb $1 $DTB
> "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
> + BINARY_PATH=3D"${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
> + if [ "x${FIT_PREPROCESS_BINARY}" =3D "x1" ]; then
> + PROCESSED_BINARY=3D"${BINARY_PATH}.processed"
> + preprocess_binary $BINARY_PATH $PROCESSED_BINARY
> + fitimage_emit_section_dtb $1 $DTB $PROCESSED_BINARY
> + else
> + fitimage_emit_section_dtb $1 $DTB $BINARY_PATH
> + fi
> =C2=A0 done
> =C2=A0 fi
> =C2=A0
> @@ -662,7 +690,14 @@ fitimage_assemble() {
> =C2=A0 if [ -e "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
> =C2=A0 cp ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
> =C2=A0 bootscr_id=3D"${UBOOT_ENV_BINARY}"
> - fitimage_emit_section_boot_script $1 "$bootscr_id"
> ${UBOOT_ENV_BINARY}
> + BINARY_PATH=3D"${UBOOT_ENV_BINARY}"
> + if [ "x${FIT_PREPROCESS_BINARY}" =3D "x1" ]; then
> + PROCESSED_BINARY=3D"${BINARY_PATH}.processed"
> + preprocess_binary $BINARY_PATH $PROCESSED_BINARY
> + fitimage_emit_section_boot_script $1 "$bootscr_id"
> $PROCESSED_BINARY
> + else
> + fitimage_emit_section_boot_script $1 "$bootscr_id" $BINARY_PATH
> + fi
> =C2=A0 else
> =C2=A0 bbwarn "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
> =C2=A0 fi
> @@ -673,7 +708,14 @@ fitimage_assemble() {
> =C2=A0 #
> =C2=A0 if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
> =C2=A0 setupcount=3D1
> - fitimage_emit_section_setup $1 $setupcount
> ${KERNEL_OUTPUT_DIR}/setup.bin
> + BINARY_PATH=3D"${KERNEL_OUTPUT_DIR}/setup.bin"
> + if [ "x${FIT_PREPROCESS_BINARY}" =3D "x1" ]; then
> + PROCESSED_BINARY=3D"${BINARY_PATH}.processed"
> + preprocess_binary $BINARY_PATH $PROCESSED_BINARY
> + fitimage_emit_section_setup $1 $setupcount $PROCESSED_BINARY
> + else
> + fitimage_emit_section_setup $1 $setupcount $BINARY_PATH
> + fi
> =C2=A0 fi
> =C2=A0
> =C2=A0 #
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#214128):
> https://lists.openembedded.org/g/openembedded-core/message/214128
> Mute This Topic: https://lists.openembedded.org/mt/112026315/4454582
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-
> core/unsub=C2=A0[adrian.freihofer@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


