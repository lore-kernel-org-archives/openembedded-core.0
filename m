Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 41CF865C87
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 10:26:06 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id em10so5865361wid.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 03:26:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=ESbmJnUtKBDbp0dWije1fuV69O0+7pxTbsHFjkw74BY=;
	b=cqTRoD864Crx001YqUWP9tFdYHKVMbUW4J03565XdURAND9Ubxniz4I7Bds6cQPzQ6
	IUhxJ6O9nd/QW3TygLGR1DDcFMx9Hz+nXbgR//gu8MYUMwzTo4huoHY0x+e2yirX8LEI
	3h/UZyFvVA3e4K1YsVrlJxBYwU3tR9iqHZEBfkPJtn5yH4FbjO1JQsBsJOjzzRS2Iwqs
	oXOJC3pzZZUDOzH7rDUDCxVn5vPfQrKUB2s7gbvQXotzpPDBx77Bn1dKTXwpR45Hy2bF
	ATFokMQNoxBIBOoJKFJGf/VGWipRwaZ/zjKh/6fwKEwKPIYEQMLODz9lIo8fpXoOF0LT
	P9Bg==
X-Gm-Message-State: ALoCoQnnXDP+T/H0c4iaaLh4R/9N1q54DSYiLg9g71myQIfwJA6gNuxF9gm/xZ+3wO9q0PgTqhnd
X-Received: by 10.180.100.106 with SMTP id ex10mr19280066wib.63.1413800766572; 
	Mon, 20 Oct 2014 03:26:06 -0700 (PDT)
Received: from ?IPv6:2001:610:612::85bd:42f1:e222:74e0?
	([2001:610:612:0:85bd:42f1:e222:74e0])
	by mx.google.com with ESMTPSA id u9sm9116837wiv.8.2014.10.20.03.26.05
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 20 Oct 2014 03:26:05 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1413746147-7120-5-git-send-email-marex@denx.de>
Date: Mon, 20 Oct 2014 12:26:04 +0200
Message-Id: <84924DE0-BBAC-45C0-B0B3-66A3EB6841CC@dominion.thruhere.net>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.1990.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Oct 2014 10:26:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 19 okt. 2014, om 21:15 heeft Marek Vasut <marex@denx.de> het =
volgende geschreven:
>=20
> Pull the uImage image format generation from kernel.bbclass into
> a separate kernel-uimage.bbclass. The recipes which now need to
> generate an uImage will have to inherit kernel-uimage instead of
> kernel class.

To keep backward compatibility, could you rework this into something =
like:

kernel.bbclass:
	inherit kernel-${KERNEL_IMAGETYPE}

kernel-${KERNEL_IMAGETYPE}:
	inherit kernel-base
	imagetype stuff

kernel-base:
	old kernel.bbclass stuff

That would keep existing BSPs working *and* split out the image types.

regards,

Koen

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
> meta/classes/kernel-uimage.bbclass | 44 =
+++++++++++++++++++++++++++++++++++++
> meta/classes/kernel.bbclass        | 45 =
--------------------------------------
> 2 files changed, 44 insertions(+), 45 deletions(-)
> create mode 100644 meta/classes/kernel-uimage.bbclass
>=20
> diff --git a/meta/classes/kernel-uimage.bbclass =
b/meta/classes/kernel-uimage.bbclass
> new file mode 100644
> index 0000000..f51321b
> --- /dev/null
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -0,0 +1,44 @@
> +inherit kernel
> +
> +DEPENDS +=3D " u-boot-mkimage-native "
> +
> +uboot_prep_kimage() {
> +	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +		vmlinux_path=3D"arch/${ARCH}/boot/compressed/vmlinux"
> +		linux_suffix=3D""
> +		linux_comp=3D"none"
> +	else
> +		vmlinux_path=3D"vmlinux"
> +		linux_suffix=3D".gz"
> +		linux_comp=3D"gzip"
> +	fi
> +
> +	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" =
linux.bin
> +
> +	if [ "${linux_comp}" !=3D "none" ] ; then
> +		rm -f linux.bin
> +		gzip -9 linux.bin
> +		mv -f "linux.bin${linux_suffix}" linux.bin
> +	fi
> +
> +	echo "${linux_comp}"
> +}
> +
> +do_uboot_mkimage() {
> +	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then
> +		if test "x${KEEPUIMAGE}" !=3D "xyes" ; then
> +			uboot_prep_kimage
> +
> +			ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> +			if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +				ENTRYPOINT=3D`${HOST_PREFIX}nm =
${S}/vmlinux | \
> +					awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}=
" {print $1}'`
> +			fi
> +
> +			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T =
kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +			rm -f linux.bin
> +		fi
> +	fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ec4d930..f3ba19c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -15,10 +15,6 @@ python __anonymous () {
>     import re
>=20
>     kerneltype =3D d.getVar('KERNEL_IMAGETYPE', True)
> -    if kerneltype =3D=3D 'uImage':
> -        depends =3D d.getVar("DEPENDS", True)
> -        depends =3D "%s u-boot-mkimage-native" % depends
> -        d.setVar("DEPENDS", depends)
>=20
>     d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', =
kerneltype))
>=20
> @@ -448,47 +444,6 @@ MODULE_TARBALL_BASE_NAME ?=3D =
"${MODULE_IMAGE_BASE_NAME}.tgz"
> MODULE_TARBALL_SYMLINK_NAME ?=3D "modules-${MACHINE}.tgz"
> MODULE_TARBALL_DEPLOY ?=3D "1"
>=20
> -uboot_prep_kimage() {
> -	if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -		vmlinux_path=3D"arch/${ARCH}/boot/compressed/vmlinux"
> -		linux_suffix=3D""
> -		linux_comp=3D"none"
> -	else
> -		vmlinux_path=3D"vmlinux"
> -		linux_suffix=3D".gz"
> -		linux_comp=3D"gzip"
> -	fi
> -
> -	${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" =
linux.bin
> -
> -	if [ "${linux_comp}" !=3D "none" ] ; then
> -		rm -f linux.bin
> -		gzip -9 linux.bin
> -		mv -f "linux.bin${linux_suffix}" linux.bin
> -	fi
> -
> -	echo "${linux_comp}"
> -}
> -
> -do_uboot_mkimage() {
> -	if test "x${KERNEL_IMAGETYPE}" =3D "xuImage" ; then=20
> -		if test "x${KEEPUIMAGE}" !=3D "xyes" ; then
> -			uboot_prep_kimage
> -
> -			ENTRYPOINT=3D${UBOOT_ENTRYPOINT}
> -			if test -n "${UBOOT_ENTRYSYMBOL}"; then
> -				ENTRYPOINT=3D`${HOST_PREFIX}nm =
${S}/vmlinux | \
> -					awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}=
" {print $1}'`
> -			fi
> -
> -			uboot-mkimage -A ${UBOOT_ARCH} -O linux -T =
kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n =
"${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> -			rm -f linux.bin
> -		fi
> -	fi
> -}
> -
> -addtask uboot_mkimage before do_install after do_compile
> -
> kernel_do_deploy() {
> 	install -m 0644 ${KERNEL_OUTPUT} =
${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
> 	if [ ${MODULE_TARBALL_DEPLOY} =3D "1" ] && (grep -q -i -e =
'^CONFIG_MODULES=3Dy$' .config); then
> --=20
> 2.1.1
>=20
>=20


