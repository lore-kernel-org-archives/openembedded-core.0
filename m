Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1482C3DA41
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 19:08:49 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.3273.1720638519902360891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 12:08:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BykMhKs5;
 spf=pass (domain: gmail.com, ip: 209.85.128.49, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4265c2b602aso670195e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 12:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720638518; x=1721243318; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L3Xqry0NIwRfLAvFaVQvR1aakpexlN6UJKLJYskK50E=;
        b=BykMhKs5mz0HZXbFEnjRVymabShonSpvWZX/aUXt5YSAWcVXDLTYd9rFXniFAFLIbF
         3Ez+qCOjzwAAxmC3BTGGJ1RMMyqpv3kume4X5mQGD7Yz5vntkP2iI0YFV80AjI9w+en8
         86u8GYQCQ3AUE4CW6jevwTir7NuCJgz/F9Zx0NKmx7UMA7e3dGLeWNkSe4zzYSDyiGzM
         yCcDMSL6dcLuzuzw+wpGePwOheJsywcNg0XXN29i3hTJmetCOihPL4+tbOMAraExu6Uo
         I85OlSfJf81tMSM1H2XvoMaN2A9G/It5J6hd0eJrqFx+5Wp/DcPO/3GyQnQeaO1uDXAy
         PQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720638518; x=1721243318;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L3Xqry0NIwRfLAvFaVQvR1aakpexlN6UJKLJYskK50E=;
        b=sSbxbJnZ0sL+0966/q+lmoKZyiHN2ZZMgWo4YjdwIhSJBj3+pbAIY4eB2pHDL1ysd9
         95caCVh3TKs0BckqbuAUEibDoDn8XrV1VaeQeirdaRaSYrgJb0HysLsdggEFQvQpc3hW
         Qro8qqvxCidM7+5wnXeUdkEwMbbZMolBZP6W6sGjT59OoCfh3CTBv0Bx5/H9aTprNFPq
         ybAPC4WGFwQlhynrn1HiRTbZcSYmIHH14a/QLVbwTgJx+wjWVFaYzH47rEBL1OSiLT6h
         STo0XnGMAr29uDZqm9gg228ggx09X6XPmZXNies373jF7fYNGkVkmgd0z4GJWJO4E4+D
         ojGw==
X-Forwarded-Encrypted: i=1; AJvYcCVH8zTHj62MUk/nMGv/ef+UkM/WGIW7S71sXK99Ts+VWa4QDUTfjzko+KkPfbBlSAMTLQbIUYMTxh5I3zK0iwsiluLEwaiR3R17lKcxP4G60FbvECxXF64h
X-Gm-Message-State: AOJu0Yy1FE0JnKXF25ehff65v8dT3Rx+KDQfccWeqiA89N+Mv/2F8eod
	yay/DEffAPQZSELKlg/iE+e7BbEPeRXnJFLEkYEpko03gd9y2OE1
X-Google-Smtp-Source: AGHT+IEkWHmVhBltxVs/3OxbsnDCkO14oA810xMRe/T/B1rAsq8z1XKEaxa1QuGKBwXwF0SBQwMQDw==
X-Received: by 2002:a05:600c:54e6:b0:426:5b22:4d61 with SMTP id 5b1f17b1804b1-426707e355dmr44266265e9.22.1720638517888;
        Wed, 10 Jul 2024 12:08:37 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367cdfab7d4sm5949613f8f.113.2024.07.10.12.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 12:08:37 -0700 (PDT)
Message-ID: <a062cdea18f6f67ba61fd4360d13d739034e7969.camel@gmail.com>
Subject: Re: [OE-core] [PATCH 09/14] kernel-fitimage: refactor
 do_assemble_fitimage_initramfs
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: Mark Hatle <mark.hatle@kernel.crashing.org>, 
	openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Date: Wed, 10 Jul 2024 21:08:36 +0200
In-Reply-To: <e37f2059-2a77-4f33-b3f2-bf2541307013@kernel.crashing.org>
References: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
	 <20240704071013.2982700-10-adrian.freihofer@gmail.com>
	 <e37f2059-2a77-4f33-b3f2-bf2541307013@kernel.crashing.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.2 (3.52.2-1.fc40app2) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 19:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201738

On Tue, 2024-07-09 at 15:08 -0500, Mark Hatle wrote:
>=20
>=20
> On 7/4/24 2:09 AM, Adrian Freihofer wrote:
> > From: Adrian Freihofer <adrian.freihofer@siemens.com>
> >=20
> > Make the fitimage_assemble function usable with absolute paths for
> > the
> > generated its and the fitImage file.
> >=20
> > Later on this will allow to take the linux.bin and the DTB files
> > from
> > the sstated deploy derectory and write the generated files to a
> > separate
> > folder with independent sstate-cache handling.
> >=20
> > Add 3 comments which are helpful for the next commit.
> >=20
> > Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> > ---
> > =C2=A0 meta/classes-recipe/kernel-fitimage.bbclass | 49 ++++++++++++++-=
-
> > -----
> > =C2=A0 1 file changed, 34 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/meta/classes-recipe/kernel-fitimage.bbclass
> > b/meta/classes-recipe/kernel-fitimage.bbclass
> > index fbeb20596ea..e084dc57573 100644
> > --- a/meta/classes-recipe/kernel-fitimage.bbclass
> > +++ b/meta/classes-recipe/kernel-fitimage.bbclass
> > @@ -174,8 +174,9 @@ fitimage_emit_section_kernel() {
> > =C2=A0=20
> > =C2=A0=C2=A0	ENTRYPOINT=3D"${UBOOT_ENTRYPOINT}"
> > =C2=A0=C2=A0	if [ -n "${UBOOT_ENTRYSYMBOL}" ]; then
> > +		kernel_base=3D$(basename $3)
> > =C2=A0=C2=A0		ENTRYPOINT=3D`${HOST_PREFIX}nm vmlinux | \
> > -			awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print
> > "0x"$1;exit}'`
> > +			awk '$kernel_base=3D=3D"${UBOOT_ENTRYSYMBOL}"
> > {print "0x"$1;exit}'`
> > =C2=A0=C2=A0	fi
> > =C2=A0=20
> > =C2=A0=C2=A0	cat << EOF >> $1
> > @@ -572,7 +573,7 @@ fitimage_assemble() {
> > =C2=A0=C2=A0	setupcount=3D""
> > =C2=A0=C2=A0	bootscr_id=3D""
> > =C2=A0=C2=A0	default_dtb_image=3D""
> > -	rm -f $1 arch/${ARCH}/boot/$2
> > +	rm -f "$1" "arch/${ARCH}/boot/$(basename $2)"
> > =C2=A0=20
> > =C2=A0=C2=A0	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a
> > "${UBOOT_SIGN_KEYNAME}" =3D "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> > =C2=A0=C2=A0		bbfatal "Keys used to sign images and
> > configuration nodes must be different."
> > @@ -586,7 +587,7 @@ fitimage_assemble() {
> > =C2=A0=C2=A0	fitimage_emit_section_maint $1 imagestart
> > =C2=A0=20
> > =C2=A0=C2=A0	uboot_prep_kimage
> > -	fitimage_emit_section_kernel $1 $kernelcount linux.bin
> > "$linux_comp"
> > +	fitimage_emit_section_kernel $1 $kernelcount "$(readlink -
> > f linux.bin)" "$linux_comp"
> > =C2=A0=20
> > =C2=A0=C2=A0	#
> > =C2=A0=C2=A0	# Step 2: Prepare a DTB image section
> > @@ -610,9 +611,20 @@ fitimage_assemble() {
> > =C2=A0=C2=A0				DTB_PATH=3D"${KERNEL_OUTPUT_DIR}/$DT
> > B"
> > =C2=A0=C2=A0			fi
> > =C2=A0=20
> > -		=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # Strip off the path comp=
onent from the
> > filename
> > +			# Strip off the path component from the
> > filename
> > =C2=A0=C2=A0			if "${@'false' if
> > oe.types.boolean(d.getVar('KERNEL_DTBVENDORED')) else 'true'}";
> > then
> > -			=C2=A0=C2=A0=C2=A0 DTB=3D`basename $DTB`
> > +				DTB=3D`basename $DTB`
> > +			fi
> > +
>=20
> I'm purely reading the comment here (below).=C2=A0 It talks about using
> the 'deploy'=20
> folder.=C2=A0 I'm not sure what current behavior is, but with our (amd
> fpga) code,=20
> we've tried to completely move away from using ANYTHING out of the
> deploy=20
> directory.=C2=A0 We found it horrible fragile [during the build] because
> the=20
> do_deploy can be delayed or not executed in some cases.=C2=A0 (To be clea=
r
> that isn't=20
> a bug!)
>=20
> Instead everything we've done has moved to using the workdir/recipe-
> sysroot to=20
> access files and components.

In general, I see no difference between do_deploy and
do_recipe_sysroot. Both are sstated tasks, and if the task dependencies
are set correctly, the files should be available in one folder or the
other. Or am I missing something?

But anyway, I'm working on a different implementation now, following
your advice. Let's see if it helps to fix the build error that occurred
on the AB. It looks like moving a task to after do_deploy causes
problems that are almost unsolvable. Staging via do_recipe_sysroot
would run before do_deploy.


>=20
> > +			# Find DTBs without sub-folders when
> > running in deploy folder
> > +			if [ ! -e "$DTB_PATH" ]; then
> > +				DTB=3D$(basename $DTB)
> > +				DTB_PATH=3D$(readlink -f $DTB)
> > +			fi
> > +
> > +			# Fail as early as possible if there is
> > still no DTB file found
> > +			if [ ! -e "$DTB_PATH" ]; then
> > +				bberror "Cannot find the DTB file
> > at $DTB_PATH"
> > =C2=A0=C2=A0			fi
> > =C2=A0=20
> > =C2=A0=C2=A0			# Set the default dtb image if it exists
> > in the devicetree.
> > @@ -665,9 +677,8 @@ fitimage_assemble() {
> > =C2=A0=20
> > =C2=A0=C2=A0	if [ -n "${UBOOT_ENV}" ] && [ -d
> > "${STAGING_DIR_HOST}/boot" ]; then
> > =C2=A0=C2=A0		if [ -e
> > "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
> > -			cp
> > ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
> > =C2=A0=C2=A0			bootscr_id=3D"${UBOOT_ENV_BINARY}"
> > -			fitimage_emit_section_boot_script $1
> > "$bootscr_id" ${UBOOT_ENV_BINARY}
> > +			fitimage_emit_section_boot_script $1
> > "$bootscr_id" "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}"
> > =C2=A0=C2=A0		else
> > =C2=A0=C2=A0			bbwarn
> > "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
> > =C2=A0=C2=A0		fi
> > @@ -676,9 +687,14 @@ fitimage_assemble() {
> > =C2=A0=C2=A0	#
> > =C2=A0=C2=A0	# Step 4: Prepare a setup section. (For x86)
> > =C2=A0=C2=A0	#
> > +	# Run from kernel build folder (bundled mode)
> > =C2=A0=C2=A0	if [ -e ${KERNEL_OUTPUT_DIR}/setup.bin ]; then
> > =C2=A0=C2=A0		setupcount=3D1
> > =C2=A0=C2=A0		fitimage_emit_section_setup $1 $setupcount
> > ${KERNEL_OUTPUT_DIR}/setup.bin
>=20
> Same comment here about the 'deploy' vs recipe-sysroot.=C2=A0 It looks to
> me like=20
> it's doing all of this in the CWD, but I'm unclear what it has been
> set to.=C2=A0 So=20
> this could be an issue?=C2=A0 I think that's why it was KERNEL_OUTPUT_DIR
> before.

Using CWD or KERNEL_OUTPUT_DIR should be the same in that sense since
KERNEL_OUTPUT_DIR is relative to CWD:
  bitbake-getvar -r virtual/kernel KERNEL_OUTPUT_DIR
  KERNEL_OUTPUT_DIR=3D"arch/x86/boot"

CWD is defined by the [dirs] variable flag of the task (acc. to
https://docs.yoctoproject.org/bitbake/singleindex.html). I think this
is more reliable than using cd in tasks. cd is likely to break with
bbappends.

But also this will probably be simpler with v2.

Thank you for the re-view
Adrian


>=20
> > +	# Run from deploy folder (unbundled mode)
> > +	elif [ -e setup.bin ]; then
> > +		setupcount=3D1
> > +		fitimage_emit_section_setup $1 $setupcount
> > "$(readlink -f setup.bin)"
> > =C2=A0=C2=A0	fi
> > =C2=A0=20
> > =C2=A0=C2=A0	#
> > @@ -751,8 +767,8 @@ fitimage_assemble() {
> > =C2=A0=C2=A0	#
> > =C2=A0=C2=A0	${UBOOT_MKIMAGE} \
> > =C2=A0=C2=A0		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> > len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> > -		-f $1 \
> > -		${KERNEL_OUTPUT_DIR}/$2
> > +		-f "$1" \
> > +		"$2"
> > =C2=A0=20
> > =C2=A0=C2=A0	#
> > =C2=A0=C2=A0	# Step 8: Sign the image
> > @@ -761,7 +777,7 @@ fitimage_assemble() {
> > =C2=A0=C2=A0		${UBOOT_MKIMAGE_SIGN} \
> > =C2=A0=C2=A0			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> > len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> > =C2=A0=C2=A0			-F -k "${UBOOT_SIGN_KEYDIR}" \
> > -			-r ${KERNEL_OUTPUT_DIR}/$2 \
> > +			-r "$2" \
> > =C2=A0=C2=A0			${UBOOT_MKIMAGE_SIGN_ARGS}
> > =C2=A0=C2=A0	fi
> > =C2=A0 }
> > @@ -769,9 +785,9 @@ fitimage_assemble() {
> > =C2=A0 do_assemble_fitimage() {
> > =C2=A0=C2=A0	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
> > =C2=A0=C2=A0		cd ${B}
> > -		fitimage_assemble fit-image.its fitImage-none ""
> > +		fitimage_assemble fit-image.its
> > "${KERNEL_OUTPUT_DIR}/fitImage-none" ""
> > =C2=A0=C2=A0		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
> > -			ln -sf fitImage-none
> > ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> > +			ln -sf fitImage-none
> > "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
> > =C2=A0=C2=A0		fi
> > =C2=A0=C2=A0	fi
> > =C2=A0 }
> > @@ -791,10 +807,10 @@ do_assemble_fitimage_initramfs() {
> > =C2=A0=C2=A0		test -n "${INITRAMFS_IMAGE}" ; then
> > =C2=A0=C2=A0		cd ${B}
> > =C2=A0=C2=A0		if [ "${INITRAMFS_IMAGE_BUNDLE}" =3D "1" ]; then
> > -			fitimage_assemble fit-image-
> > ${INITRAMFS_IMAGE}.its fitImage-bundle ""
> > -			ln -sf fitImage-bundle
> > ${B}/${KERNEL_OUTPUT_DIR}/fitImage
> > +			fitimage_assemble "fit-image-
> > ${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-bundle" ""
> > +			ln -sf fitImage-bundle
> > "${B}/${KERNEL_OUTPUT_DIR}/fitImage"
> > =C2=A0=C2=A0		else
> > -			fitimage_assemble fit-image-
> > ${INITRAMFS_IMAGE}.its fitImage-${INITRAMFS_IMAGE} 1
> > +			fitimage_assemble "fit-image-
> > ${INITRAMFS_IMAGE}.its" "${KERNEL_OUTPUT_DIR}/fitImage-
> > ${INITRAMFS_IMAGE}" 1
> > =C2=A0=C2=A0		fi
> > =C2=A0=C2=A0	fi
> > =C2=A0 }
> > @@ -852,6 +868,7 @@ kernel_do_deploy:append() {
> > =C2=A0=C2=A0	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
> > =C2=A0=20
> > =C2=A0=C2=A0		if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
> > +			# deploy the artifacts of
> > do_assemble_fitimage
> > =C2=A0=C2=A0			bbnote "Copying fit-image.its source
> > file..."
> > =C2=A0=C2=A0			install -m 0644 ${B}/fit-image.its
> > "$deployDir/fitImage-its-${KERNEL_FIT_NAME}.its"
> > =C2=A0=C2=A0			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> > @@ -866,12 +883,14 @@ kernel_do_deploy:append() {
> > =C2=A0=C2=A0		fi
> > =C2=A0=20
> > =C2=A0=C2=A0		if [ -n "${INITRAMFS_IMAGE}" ]; then
> > +			# deploy the artifacts of
> > do_assemble_fitimage_initramfs for bundled as well as un-bundled
> > mode
> > =C2=A0=C2=A0			bbnote "Copying fit-image-
> > ${INITRAMFS_IMAGE}.its source file..."
> > =C2=A0=C2=A0			install -m 0644 ${B}/fit-image-
> > ${INITRAMFS_IMAGE}.its "$deployDir/fitImage-its-
> > ${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its"
> > =C2=A0=C2=A0			if [ -n "${KERNEL_FIT_LINK_NAME}" ] ; then
> > =C2=A0=C2=A0				ln -snf fitImage-its-
> > ${INITRAMFS_IMAGE_NAME}-${KERNEL_FIT_NAME}.its
> > "$deployDir/fitImage-its-${INITRAMFS_IMAGE_NAME}-
> > ${KERNEL_FIT_LINK_NAME}"
> > =C2=A0=C2=A0			fi
> > =C2=A0=20
> > +			# deploy the artifacts of
> > do_assemble_fitimage_initramfs for bundled mode only
> > =C2=A0=C2=A0			if [ "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ];
> > then
> > =C2=A0=C2=A0				bbnote "Copying fitImage-
> > ${INITRAMFS_IMAGE} file..."
> > =C2=A0=C2=A0				install -m 0644
> > ${B}/${KERNEL_OUTPUT_DIR}/fitImage-${INITRAMFS_IMAGE}
> > "$deployDir/fitImage-${INITRAMFS_IMAGE_NAME}-
> > ${KERNEL_FIT_NAME}${KERNEL_FIT_BIN_EXT}"
> >=20
> >=20
> >=20
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#201513):
> > https://lists.openembedded.org/g/openembedded-core/message/201513
> > Mute This Topic:
> > https://lists.openembedded.org/mt/107033894/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe:
> > https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[
> > mark.hatle@kernel.crashing.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >=20


