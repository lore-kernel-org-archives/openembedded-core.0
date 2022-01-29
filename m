Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C745C433F5
	for <webhook@archiver.kernel.org>; Sat, 29 Jan 2022 01:06:34 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web08.748.1643418392824424499
 for <openembedded-core@lists.openembedded.org>;
 Fri, 28 Jan 2022 17:06:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=efpbz4tT;
 spf=pass (domain: axis.com, ip: 195.60.68.18,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1643418393;
  x=1674954393;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=IjlsL+oU9u2xq0KgPMhV+/x9zt0Te9p4WZemGc2VLW4=;
  b=efpbz4tTB72/wr5Gtotzu4S7p3DIXnmK6T986Xpcqq4ZmUATdCNEatXH
   j1rrG70oFt94e0TuZyfuGfQgTBWPyR6nbp0TSYf0k/Bwk9l377SgOFDDi
   6DE5hnlZlH7cko40uMdq+tjmqg5wQma9gqwPfwrp+ucyF1uUIpfAeg9hr
   Rocds36GIpf8bD2tmjScoE+Bxav0BCmqcPUlVGwQQUpVifh2Qk5a1zjkW
   byBrl8tSgpK93hZTHdXfV7+J8jaCqDiunygwxbavTYi7lSVGQPeClshRa
   2myNQ/nDPk81+wz1fhFSuh6XOZ1te7h1NtuFgtYE6tHpC2xZkyt9d+s/H
   Q==;
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: Marek Vasut <marex@denx.de>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Richard Purdie
	<richard.purdie@linuxfoundation.org>
Subject: RE: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Topic: [OE-core] [PATCH] Revert "featimage: refactor style"
Thread-Index: AQHYFKdQcSt1hC1cm0GYPVsV99Xj7qx5LaAQ
Date: Sat, 29 Jan 2022 01:06:30 +0000
Message-ID: <93bb78f01d7c44c1b5918e1576f2a804@axis.com>
References: <20220129002907.84534-1-marex@denx.de>
In-Reply-To: <20220129002907.84534-1-marex@denx.de>
Accept-Language: en-US, sv-SE
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.0.5.60]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 29 Jan 2022 01:06:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161089

> -----Original Message-----
> From: openembedded-core@lists.openembedded.org <openembedded-
> core@lists.openembedded.org> On Behalf Of Marek Vasut
> Sent: den 29 januari 2022 01:29
> To: openembedded-core@lists.openembedded.org
> Cc: Marek Vasut <marex@denx.de>; Andrej Valek <andrej.valek@siemens.com>;
> Richard Purdie <richard.purdie@linuxfoundation.org>
> Subject: [OE-core] [PATCH] Revert "featimage: refactor style"
>=20
> This reverts commit f44bb458884da64356ee188917094b5515d3b159.
>=20
> The reverted patch attempted to perform some sort of clean up, however
> it only brought in style inconsistencies like this:
>=20
> ```
> conf_desc=3D"$conf_desc${sep}setup"
> ```
>=20
> The curly brackets around variables were placed in the kernel-fitimage
> bbclass deliberately, since when assembling the fitimage ITS there are
> multiple variables where it is difficult to identify where the variable
> ends and some sort of follow up string starts.

There is actually a technical reason to not use ${foo} for shell=20
variables unless necessary in bitbake files and it is because=20
bitbake will treat them all as potential bitbake variables. This=20
means they are unnecessarily included in the taskhashes that=20
bitbake calculates.

//Peter

>=20
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrej Valek <andrej.valek@siemens.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  meta/classes/kernel-fitimage.bbclass | 289 +++++++++++++--------------
>  meta/classes/uboot-sign.bbclass      |  56 +++---
>  2 files changed, 171 insertions(+), 174 deletions(-)
>=20
> diff --git a/meta/classes/kernel-fitimage.bbclass b/meta/classes/kernel-
> fitimage.bbclass
> index b0c971b0eb..1e3bc21f1f 100644
> --- a/meta/classes/kernel-fitimage.bbclass
> +++ b/meta/classes/kernel-fitimage.bbclass
> @@ -73,7 +73,7 @@ FIT_SIGN_INDIVIDUAL ?=3D "0"
>  #
>  # $1 ... .its filename
>  fitimage_emit_fit_header() {
> -	cat << EOF >> $1
> +	cat << EOF >> ${1}
>  /dts-v1/;
>=20
>  / {
> @@ -94,24 +94,24 @@ EOF
>  fitimage_emit_section_maint() {
>  	case $2 in
>  	imagestart)
> -		cat << EOF >> $1
> +		cat << EOF >> ${1}
>=20
>          images {
>  EOF
>  	;;
>  	confstart)
> -		cat << EOF >> $1
> +		cat << EOF >> ${1}
>=20
>          configurations {
>  EOF
>  	;;
>  	sectend)
> -		cat << EOF >> $1
> +		cat << EOF >> ${1}
>  	};
>  EOF
>  	;;
>  	fitend)
> -		cat << EOF >> $1
> +		cat << EOF >> ${1}
>  };
>  EOF
>  	;;
> @@ -137,28 +137,28 @@ fitimage_emit_section_kernel() {
>  			awk '$3=3D=3D"${UBOOT_ENTRYSYMBOL}" {print
> "0x"$1;exit}'`
>  	fi
>=20
> -	cat << EOF >> $1
> -                kernel-$2 {
> +	cat << EOF >> ${1}
> +                kernel-${2} {
>                          description =3D "Linux kernel";
> -                        data =3D /incbin/("$3");
> +                        data =3D /incbin/("${3}");
>                          type =3D "kernel";
>                          arch =3D "${UBOOT_ARCH}";
>                          os =3D "linux";
> -                        compression =3D "$4";
> +                        compression =3D "${4}";
>                          load =3D <${UBOOT_LOADADDRESS}>;
> -                        entry =3D <$ENTRYPOINT>;
> +                        entry =3D <${ENTRYPOINT}>;
>                          hash-1 {
> -                                algo =3D "$kernel_csum";
> +                                algo =3D "${kernel_csum}";
>                          };
>                  };
>  EOF
>=20
> -	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "$kernel_sign_keyname" ] ; then
> -		sed -i '$ d' $1
> -		cat << EOF >> $1
> +	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "${kernel_sign_keyname}" ] ; then
> +		sed -i '$ d' ${1}
> +		cat << EOF >> ${1}
>                          signature-1 {
> -                                algo =3D "$kernel_csum,$kernel_sign_algo=
";
> -                                key-name-hint =3D "$kernel_sign_keyname"=
;
> +                                algo =3D
> "${kernel_csum},${kernel_sign_algo}";
> +                                key-name-hint =3D "${kernel_sign_keyname=
}";
>                          };
>                  };
>  EOF
> @@ -186,26 +186,26 @@ fitimage_emit_section_dtb() {
>  	elif [ -n "${UBOOT_DTB_LOADADDRESS}" ]; then
>  		dtb_loadline=3D"load =3D <${UBOOT_DTB_LOADADDRESS}>;"
>  	fi
> -	cat << EOF >> $1
> -                fdt-$2 {
> +	cat << EOF >> ${1}
> +                fdt-${2} {
>                          description =3D "Flattened Device Tree blob";
> -                        data =3D /incbin/("$3");
> +                        data =3D /incbin/("${3}");
>                          type =3D "flat_dt";
>                          arch =3D "${UBOOT_ARCH}";
>                          compression =3D "none";
> -                        $dtb_loadline
> +                        ${dtb_loadline}
>                          hash-1 {
> -                                algo =3D "$dtb_csum";
> +                                algo =3D "${dtb_csum}";
>                          };
>                  };
>  EOF
>=20
> -	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "$dtb_sign_keyname" ] ; then
> -		sed -i '$ d' $1
> -		cat << EOF >> $1
> +	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "${dtb_sign_keyname}" ] ; then
> +		sed -i '$ d' ${1}
> +		cat << EOF >> ${1}
>                          signature-1 {
> -                                algo =3D "$dtb_csum,$dtb_sign_algo";
> -                                key-name-hint =3D "$dtb_sign_keyname";
> +                                algo =3D "${dtb_csum},${dtb_sign_algo}";
> +                                key-name-hint =3D "${dtb_sign_keyname}";
>                          };
>                  };
>  EOF
> @@ -220,29 +220,29 @@ EOF
>  # $3 ... Path to boot script image
>  fitimage_emit_section_boot_script() {
>=20
> -	bootscr_csum=3D"${FIT_HASH_ALG}"
> +        bootscr_csum=3D"${FIT_HASH_ALG}"
>  	bootscr_sign_algo=3D"${FIT_SIGN_ALG}"
>  	bootscr_sign_keyname=3D"${UBOOT_SIGN_IMG_KEYNAME}"
>=20
> -        cat << EOF >> $1
> -                bootscr-$2 {
> +        cat << EOF >> ${1}
> +                bootscr-${2} {
>                          description =3D "U-boot script";
> -                        data =3D /incbin/("$3");
> +                        data =3D /incbin/("${3}");
>                          type =3D "script";
>                          arch =3D "${UBOOT_ARCH}";
>                          compression =3D "none";
>                          hash-1 {
> -                                algo =3D "$bootscr_csum";
> +                                algo =3D "${bootscr_csum}";
>                          };
>                  };
>  EOF
>=20
> -	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "$bootscr_sign_keyname" ] ; then
> -		sed -i '$ d' $1
> -		cat << EOF >> $1
> +	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "${bootscr_sign_keyname}" ] ; then
> +		sed -i '$ d' ${1}
> +		cat << EOF >> ${1}
>                          signature-1 {
> -                                algo =3D
> "$bootscr_csum,$bootscr_sign_algo";
> -                                key-name-hint =3D "$bootscr_sign_keyname=
";
> +                                algo =3D
> "${bootscr_csum},${bootscr_sign_algo}";
> +                                key-name-hint =3D
> "${bootscr_sign_keyname}";
>                          };
>                  };
>  EOF
> @@ -259,10 +259,10 @@ fitimage_emit_section_setup() {
>=20
>  	setup_csum=3D"${FIT_HASH_ALG}"
>=20
> -	cat << EOF >> $1
> -                setup-$2 {
> +	cat << EOF >> ${1}
> +                setup-${2} {
>                          description =3D "Linux setup.bin";
> -                        data =3D /incbin/("$3");
> +                        data =3D /incbin/("${3}");
>                          type =3D "x86_setup";
>                          arch =3D "${UBOOT_ARCH}";
>                          os =3D "linux";
> @@ -270,7 +270,7 @@ fitimage_emit_section_setup() {
>                          load =3D <0x00090000>;
>                          entry =3D <0x00090000>;
>                          hash-1 {
> -                                algo =3D "$setup_csum";
> +                                algo =3D "${setup_csum}";
>                          };
>                  };
>  EOF
> @@ -297,28 +297,28 @@ fitimage_emit_section_ramdisk() {
>  		ramdisk_entryline=3D"entry =3D
> <${UBOOT_RD_ENTRYPOINT}>;"
>  	fi
>=20
> -	cat << EOF >> $1
> -                ramdisk-$2 {
> +	cat << EOF >> ${1}
> +                ramdisk-${2} {
>                          description =3D "${INITRAMFS_IMAGE}";
> -                        data =3D /incbin/("$3");
> +                        data =3D /incbin/("${3}");
>                          type =3D "ramdisk";
>                          arch =3D "${UBOOT_ARCH}";
>                          os =3D "linux";
>                          compression =3D "none";
> -                        $ramdisk_loadline
> -                        $ramdisk_entryline
> +                        ${ramdisk_loadline}
> +                        ${ramdisk_entryline}
>                          hash-1 {
> -                                algo =3D "$ramdisk_csum";
> +                                algo =3D "${ramdisk_csum}";
>                          };
>                  };
>  EOF
>=20
> -	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "$ramdisk_sign_keyname" ] ; then
> -		sed -i '$ d' $1
> -		cat << EOF >> $1
> +	if [ "${UBOOT_SIGN_ENABLE}" =3D "1" -a "${FIT_SIGN_INDIVIDUAL}" =3D
> "1" -a -n "${ramdisk_sign_keyname}" ] ; then
> +		sed -i '$ d' ${1}
> +		cat << EOF >> ${1}
>                          signature-1 {
> -                                algo =3D
> "$ramdisk_csum,$ramdisk_sign_algo";
> -                                key-name-hint =3D "$ramdisk_sign_keyname=
";
> +                                algo =3D
> "${ramdisk_csum},${ramdisk_sign_algo}";
> +                                key-name-hint =3D
> "${ramdisk_sign_keyname}";
>                          };
>                  };
>  EOF
> @@ -343,13 +343,13 @@ fitimage_emit_section_config() {
>  		conf_sign_keyname=3D"${UBOOT_SIGN_KEYNAME}"
>  	fi
>=20
> -	its_file=3D"$1"
> -	kernel_id=3D"$2"
> -	dtb_image=3D"$3"
> -	ramdisk_id=3D"$4"
> -	bootscr_id=3D"$5"
> -	config_id=3D"$6"
> -	default_flag=3D"$7"
> +	its_file=3D"${1}"
> +	kernel_id=3D"${2}"
> +	dtb_image=3D"${3}"
> +	ramdisk_id=3D"${4}"
> +	bootscr_id=3D"${5}"
> +	config_id=3D"${6}"
> +	default_flag=3D"${7}"
>=20
>  	# Test if we have any DTBs at all
>  	sep=3D""
> @@ -364,106 +364,106 @@ fitimage_emit_section_config() {
>=20
>  	# conf node name is selected based on dtb ID if it is present,
>  	# otherwise its selected based on kernel ID
> -	if [ -n "$dtb_image" ]; then
> -		conf_node=3D$conf_node$dtb_image
> +	if [ -n "${dtb_image}" ]; then
> +		conf_node=3D$conf_node${dtb_image}
>  	else
> -		conf_node=3D$conf_node$kernel_id
> +		conf_node=3D$conf_node${kernel_id}
>  	fi
>=20
> -	if [ -n "$kernel_id" ]; then
> +	if [ -n "${kernel_id}" ]; then
>  		conf_desc=3D"Linux kernel"
>  		sep=3D", "
> -		kernel_line=3D"kernel =3D \"kernel-$kernel_id\";"
> +		kernel_line=3D"kernel =3D \"kernel-${kernel_id}\";"
>  	fi
>=20
> -	if [ -n "$dtb_image" ]; then
> -		conf_desc=3D"$conf_desc${sep}FDT blob"
> +	if [ -n "${dtb_image}" ]; then
> +		conf_desc=3D"${conf_desc}${sep}FDT blob"
>  		sep=3D", "
> -		fdt_line=3D"fdt =3D \"fdt-$dtb_image\";"
> +		fdt_line=3D"fdt =3D \"fdt-${dtb_image}\";"
>  	fi
>=20
> -	if [ -n "$ramdisk_id" ]; then
> -		conf_desc=3D"$conf_desc${sep}ramdisk"
> +	if [ -n "${ramdisk_id}" ]; then
> +		conf_desc=3D"${conf_desc}${sep}ramdisk"
>  		sep=3D", "
> -		ramdisk_line=3D"ramdisk =3D \"ramdisk-$ramdisk_id\";"
> +		ramdisk_line=3D"ramdisk =3D \"ramdisk-${ramdisk_id}\";"
>  	fi
>=20
> -	if [ -n "$bootscr_id" ]; then
> -		conf_desc=3D"$conf_desc${sep}u-boot script"
> +	if [ -n "${bootscr_id}" ]; then
> +		conf_desc=3D"${conf_desc}${sep}u-boot script"
>  		sep=3D", "
> -		bootscr_line=3D"bootscr =3D \"bootscr-$bootscr_id\";"
> +		bootscr_line=3D"bootscr =3D \"bootscr-${bootscr_id}\";"
>  	fi
>=20
> -	if [ -n "$config_id" ]; then
> -		conf_desc=3D"$conf_desc${sep}setup"
> -		setup_line=3D"setup =3D \"setup-$config_id\";"
> +	if [ -n "${config_id}" ]; then
> +		conf_desc=3D"${conf_desc}${sep}setup"
> +		setup_line=3D"setup =3D \"setup-${config_id}\";"
>  	fi
>=20
> -	if [ "$default_flag" =3D "1" ]; then
> +	if [ "${default_flag}" =3D "1" ]; then
>  		# default node is selected based on dtb ID if it is
> present,
>  		# otherwise its selected based on kernel ID
> -		if [ -n "$dtb_image" ]; then
> -			default_line=3D"default =3D \"conf-
> $dtb_image\";"
> +		if [ -n "${dtb_image}" ]; then
> +			default_line=3D"default =3D \"conf-
> ${dtb_image}\";"
>  		else
> -			default_line=3D"default =3D \"conf-
> $kernel_id\";"
> +			default_line=3D"default =3D \"conf-
> ${kernel_id}\";"
>  		fi
>  	fi
>=20
> -	cat << EOF >> $its_file
> -                $default_line
> +	cat << EOF >> ${its_file}
> +                ${default_line}
>                  $conf_node {
> -                        description =3D "$default_flag $conf_desc";
> -                        $kernel_line
> -                        $fdt_line
> -                        $ramdisk_line
> -                        $bootscr_line
> -                        $setup_line
> +			description =3D "${default_flag}
> ${conf_desc}";
> +			${kernel_line}
> +			${fdt_line}
> +			${ramdisk_line}
> +			${bootscr_line}
> +			${setup_line}
>                          hash-1 {
> -                                algo =3D "$conf_csum";
> +                                algo =3D "${conf_csum}";
>                          };
>  EOF
>=20
> -	if [ -n "$conf_sign_keyname" ] ; then
> +	if [ ! -z "${conf_sign_keyname}" ] ; then
>=20
>  		sign_line=3D"sign-images =3D "
>  		sep=3D""
>=20
> -		if [ -n "$kernel_id" ]; then
> -			sign_line=3D"$sign_line${sep}\"kernel\""
> +		if [ -n "${kernel_id}" ]; then
> +			sign_line=3D"${sign_line}${sep}\"kernel\""
>  			sep=3D", "
>  		fi
>=20
> -		if [ -n "$dtb_image" ]; then
> -			sign_line=3D"$sign_line${sep}\"fdt\""
> +		if [ -n "${dtb_image}" ]; then
> +			sign_line=3D"${sign_line}${sep}\"fdt\""
>  			sep=3D", "
>  		fi
>=20
> -		if [ -n "$ramdisk_id" ]; then
> -			sign_line=3D"$sign_line${sep}\"ramdisk\""
> +		if [ -n "${ramdisk_id}" ]; then
> +			sign_line=3D"${sign_line}${sep}\"ramdisk\""
>  			sep=3D", "
>  		fi
>=20
> -		if [ -n "$bootscr_id" ]; then
> -			sign_line=3D"$sign_line${sep}\"bootscr\""
> +		if [ -n "${bootscr_id}" ]; then
> +			sign_line=3D"${sign_line}${sep}\"bootscr\""
>  			sep=3D", "
>  		fi
>=20
> -		if [ -n "$config_id" ]; then
> -			sign_line=3D"$sign_line${sep}\"setup\""
> +		if [ -n "${config_id}" ]; then
> +			sign_line=3D"${sign_line}${sep}\"setup\""
>  		fi
>=20
> -		sign_line=3D"$sign_line;"
> +		sign_line=3D"${sign_line};"
>=20
> -		cat << EOF >> $its_file
> +		cat << EOF >> ${its_file}
>                          signature-1 {
> -                                algo =3D "$conf_csum,$conf_sign_algo";
> -                                key-name-hint =3D "$conf_sign_keyname";
> -                                $sign_line
> +                                algo =3D "${conf_csum},${conf_sign_algo}=
";
> +                                key-name-hint =3D "${conf_sign_keyname}"=
;
> +				${sign_line}
>                          };
>  EOF
>  	fi
>=20
> -	cat << EOF >> $its_file
> +	cat << EOF >> ${its_file}
>                  };
>  EOF
>  }
> @@ -478,21 +478,21 @@ fitimage_assemble() {
>  	kernelcount=3D1
>  	dtbcount=3D""
>  	DTBS=3D""
> -	ramdiskcount=3D$3
> +	ramdiskcount=3D${3}
>  	setupcount=3D""
>  	bootscr_id=3D""
> -	rm -f $1 arch/${ARCH}/boot/$2
> +	rm -f ${1} arch/${ARCH}/boot/${2}
>=20
> -	if [ -n "${UBOOT_SIGN_IMG_KEYNAME}" -a "${UBOOT_SIGN_KEYNAME}"
> =3D "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
> +	if [ ! -z "${UBOOT_SIGN_IMG_KEYNAME}" -a
> "${UBOOT_SIGN_KEYNAME}" =3D "${UBOOT_SIGN_IMG_KEYNAME}" ]; then
>  		bbfatal "Keys used to sign images and configuration
> nodes must be different."
>  	fi
>=20
> -	fitimage_emit_fit_header $1
> +	fitimage_emit_fit_header ${1}
>=20
>  	#
>  	# Step 1: Prepare a kernel image section.
>  	#
> -	fitimage_emit_section_maint $1 imagestart
> +	fitimage_emit_section_maint ${1} imagestart
>=20
>  	uboot_prep_kimage
>  	fitimage_emit_section_kernel $1 $kernelcount linux.bin
> "$linux_comp"
> @@ -504,9 +504,9 @@ fitimage_assemble() {
>  	if [ -n "${KERNEL_DEVICETREE}" ]; then
>  		dtbcount=3D1
>  		for DTB in ${KERNEL_DEVICETREE}; do
> -			if echo $DTB | grep -q '/dts/'; then
> -				bbwarn "$DTB contains the full
> path to the the dts file, but only the dtb name should be used."
> -				DTB=3D`basename $DTB | sed
> 's,\.dts$,.dtb,g'`
> +			if echo ${DTB} | grep -q '/dts/'; then
> +				bbwarn "${DTB} contains the
> full path to the the dts file, but only the dtb name should be used."
> +				DTB=3D`basename ${DTB} | sed
> 's,\.dts$,.dtb,g'`
>  			fi
>=20
>  			# Skip ${DTB} if it's also provided in
> ${EXTERNAL_KERNEL_DEVICETREE}
> @@ -514,23 +514,23 @@ fitimage_assemble() {
>  				continue
>  			fi
>=20
> -			DTB_PATH=3D"arch/${ARCH}/boot/dts/$DTB"
> -			if [ ! -e "$DTB_PATH" ]; then
> -
> 	DTB_PATH=3D"arch/${ARCH}/boot/$DTB"
> +			DTB_PATH=3D"arch/${ARCH}/boot/dts/${DTB}"
> +			if [ ! -e "${DTB_PATH}" ]; then
> +
> 	DTB_PATH=3D"arch/${ARCH}/boot/${DTB}"
>  			fi
>=20
> -			DTB=3D$(echo "$DTB" | tr '/' '_')
> -			DTBS=3D"$DTBS $DTB"
> -			fitimage_emit_section_dtb $1 $DTB
> $DTB_PATH
> +			DTB=3D$(echo "${DTB}" | tr '/' '_')
> +			DTBS=3D"${DTBS} ${DTB}"
> +			fitimage_emit_section_dtb ${1} ${DTB}
> ${DTB_PATH}
>  		done
>  	fi
>=20
>  	if [ -n "${EXTERNAL_KERNEL_DEVICETREE}" ]; then
>  		dtbcount=3D1
>  		for DTB in $(find "${EXTERNAL_KERNEL_DEVICETREE}" \(
> -name '*.dtb' -o -name '*.dtbo' \) -printf '%P\n' | sort); do
> -			DTB=3D$(echo "$DTB" | tr '/' '_')
> -			DTBS=3D"$DTBS $DTB"
> -			fitimage_emit_section_dtb $1 $DTB
> "${EXTERNAL_KERNEL_DEVICETREE}/$DTB"
> +			DTB=3D$(echo "${DTB}" | tr '/' '_')
> +			DTBS=3D"${DTBS} ${DTB}"
> +			fitimage_emit_section_dtb ${1} ${DTB}
> "${EXTERNAL_KERNEL_DEVICETREE}/${DTB}"
>  		done
>  	fi
>=20
> @@ -542,7 +542,7 @@ fitimage_assemble() {
>  		if [ -e
> "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY}" ]; then
>  			cp
> ${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} ${B}
>  			bootscr_id=3D"${UBOOT_ENV_BINARY}"
> -			fitimage_emit_section_boot_script $1
> "$bootscr_id" ${UBOOT_ENV_BINARY}
> +			fitimage_emit_section_boot_script ${1}
> "${bootscr_id}" ${UBOOT_ENV_BINARY}
>  		else
>  			bbwarn
> "${STAGING_DIR_HOST}/boot/${UBOOT_ENV_BINARY} not found."
>  		fi
> @@ -553,7 +553,7 @@ fitimage_assemble() {
>  	#
>  	if [ -e arch/${ARCH}/boot/setup.bin ]; then
>  		setupcount=3D1
> -		fitimage_emit_section_setup $1 $setupcount
> arch/${ARCH}/boot/setup.bin
> +		fitimage_emit_section_setup ${1} "${setupcount}"
> arch/${ARCH}/boot/setup.bin
>  	fi
>=20
>  	#
> @@ -562,30 +562,27 @@ fitimage_assemble() {
>  	if [ "x${ramdiskcount}" =3D "x1" ] && [
> "${INITRAMFS_IMAGE_BUNDLE}" !=3D "1" ]; then
>  		# Find and use the first initramfs image archive
> type we find
>  		for img in cpio.lz4 cpio.lzo cpio.lzma cpio.xz
> cpio.zst cpio.gz ext2.gz cpio; do
> -
> 	initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.$im
> g"
> -			echo -n "Searching for $initramfs_path..."
> -			if [ -e "$initramfs_path" ]; then
> -				echo "found"
> -				fitimage_emit_section_ramdisk
> $1 "$ramdiskcount" "$initramfs_path"
> +
> 	initramfs_path=3D"${DEPLOY_DIR_IMAGE}/${INITRAMFS_IMAGE_NAME}.${i
> mg}"
> +			echo "Using $initramfs_path"
> +			if [ -e "${initramfs_path}" ]; then
> +				fitimage_emit_section_ramdisk
> ${1} "${ramdiskcount}" "${initramfs_path}"
>  				break
> -			else
> -				echo "not found"
>  			fi
>  		done
>  	fi
>=20
> -	fitimage_emit_section_maint $1 sectend
> +	fitimage_emit_section_maint ${1} sectend
>=20
>  	# Force the first Kernel and DTB in the default config
>  	kernelcount=3D1
> -	if [ -n "$dtbcount" ]; then
> +	if [ -n "${dtbcount}" ]; then
>  		dtbcount=3D1
>  	fi
>=20
>  	#
>  	# Step 6: Prepare a configurations section
>  	#
> -	fitimage_emit_section_maint $1 confstart
> +	fitimage_emit_section_maint ${1} confstart
>=20
>  	# kernel-fitimage.bbclass currently only supports a single
> kernel (no less or
>  	# more) to be added to the FIT image along with 0 or more
> device trees and
> @@ -596,33 +593,33 @@ fitimage_assemble() {
>  	# the default configuration to be used is based on the
> dtbcount. If there is
>  	# no dtb present than select the default configuation to be
> based on
>  	# the kernelcount.
> -	if [ -n "$DTBS" ]; then
> +	if [ -n "${DTBS}" ]; then
>  		i=3D1
>  		for DTB in ${DTBS}; do
>  			dtb_ext=3D${DTB##*.}
> -			if [ "$dtb_ext" =3D "dtbo" ]; then
> -				fitimage_emit_section_config $1
> "" "$DTB" "" "$bootscr_id" "" "`expr $i =3D $dtbcount`"
> +			if [ "${dtb_ext}" =3D "dtbo" ]; then
> +				fitimage_emit_section_config
> ${1} "" "${DTB}" "" "${bootscr_id}" "" "`expr ${i} =3D ${dtbcount}`"
>  			else
> -				fitimage_emit_section_config $1
> $kernelcount "$DTB" "$ramdiskcount" "$bootscr_id" "$setupcount" "`expr $i
> =3D $dtbcount`"
> +				fitimage_emit_section_config
> ${1} "${kernelcount}" "${DTB}" "${ramdiskcount}" "${bootscr_id}"
> "${setupcount}" "`expr ${i} =3D ${dtbcount}`"
>  			fi
> -			i=3D`expr $i + 1`
> +			i=3D`expr ${i} + 1`
>  		done
>  	else
>  		defaultconfigcount=3D1
> -		fitimage_emit_section_config $1 $kernelcount ""
> "$ramdiskcount" "$bootscr_id"  "$setupcount" $defaultconfigcount
> +		fitimage_emit_section_config ${1} "${kernelcount}"
> "" "${ramdiskcount}" "${bootscr_id}"  "${setupcount}"
> "${defaultconfigcount}"
>  	fi
>=20
> -	fitimage_emit_section_maint $1 sectend
> +	fitimage_emit_section_maint ${1} sectend
>=20
> -	fitimage_emit_section_maint $1 fitend
> +	fitimage_emit_section_maint ${1} fitend
>=20
>  	#
>  	# Step 7: Assemble the image
>  	#
>  	${UBOOT_MKIMAGE} \
>  		${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> -		-f $1 \
> -		arch/${ARCH}/boot/$2
> +		-f ${1} \
> +		arch/${ARCH}/boot/${2}
>=20
>  	#
>  	# Step 8: Sign the image and add public key to U-Boot dtb
> @@ -639,7 +636,7 @@ fitimage_assemble() {
>  			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
>  			-F -k "${UBOOT_SIGN_KEYDIR}" \
>  			$add_key_to_u_boot \
> -			-r arch/${ARCH}/boot/$2 \
> +			-r arch/${ARCH}/boot/${2} \
>  			${UBOOT_MKIMAGE_SIGN_ARGS}
>  	fi
>  }
> @@ -647,7 +644,7 @@ fitimage_assemble() {
>  do_assemble_fitimage() {
>  	if echo ${KERNEL_IMAGETYPES} | grep -wq "fitImage"; then
>  		cd ${B}
> -		fitimage_assemble fit-image.its fitImage ""
> +		fitimage_assemble fit-image.its fitImage
>  	fi
>  }
>=20
> diff --git a/meta/classes/uboot-sign.bbclass b/meta/classes/uboot-
> sign.bbclass
> index 8d136e9405..c39b30f43b 100644
> --- a/meta/classes/uboot-sign.bbclass
> +++ b/meta/classes/uboot-sign.bbclass
> @@ -176,8 +176,8 @@ concat_dtb() {
>  		mkdir -p ${DEPLOYDIR}
>  		if [ -n "${UBOOT_CONFIG}" ]; then
>  			for config in ${UBOOT_MACHINE}; do
> -				CONFIG_B_PATH=3D"$config"
> -				cd ${B}/$config
> +				CONFIG_B_PATH=3D"${config}"
> +				cd ${B}/${config}
>  				concat_dtb_helper
>  			done
>  		else
> @@ -193,8 +193,8 @@ concat_spl_dtb() {
>  		mkdir -p ${DEPLOYDIR}
>  		if [ -n "${UBOOT_CONFIG}" ]; then
>  			for config in ${UBOOT_MACHINE}; do
> -				CONFIG_B_PATH=3D"$config"
> -				cd ${B}/$config
> +				CONFIG_B_PATH=3D"${config}"
> +				cd ${B}/${config}
>  				concat_spl_dtb_helper
>  			done
>  		else
> @@ -245,7 +245,7 @@ do_install:append() {
>  	if [ "${PN}" =3D "${UBOOT_PN}" ]; then
>  		if [ -n "${UBOOT_CONFIG}" ]; then
>  			for config in ${UBOOT_MACHINE}; do
> -				cd ${B}/$config
> +				cd ${B}/${config}
>  				if [ "${UBOOT_SIGN_ENABLE}" =3D
> "1" -o "${UBOOT_FITIMAGE_ENABLE}" =3D "1" ] && \
>  					[ -n
> "${UBOOT_DTB_BINARY}" ]; then
>  					install_helper
> @@ -300,19 +300,19 @@ addtask uboot_generate_rsa_keys before
> do_uboot_assemble_fitimage after do_compi
>  # Create a ITS file for the U-boot FIT, for use when
>  # we want to sign it so that the SPL can verify it
>  uboot_fitimage_assemble() {
> -	uboot_its=3D"$1"
> -	uboot_nodtb_bin=3D"$2"
> -	uboot_dtb=3D"$3"
> -	uboot_bin=3D"$4"
> -	spl_dtb=3D"$5"
> +	uboot_its=3D"${1}"
> +	uboot_nodtb_bin=3D"${2}"
> +	uboot_dtb=3D"${3}"
> +	uboot_bin=3D"${4}"
> +	spl_dtb=3D"${5}"
>  	uboot_csum=3D"${UBOOT_FIT_HASH_ALG}"
>  	uboot_sign_algo=3D"${UBOOT_FIT_SIGN_ALG}"
>  	uboot_sign_keyname=3D"${SPL_SIGN_KEYNAME}"
>=20
> -	rm -f $uboot_its $uboot_bin
> +	rm -f ${uboot_its} ${uboot_bin}
>=20
>  	# First we create the ITS script
> -	cat << EOF >> $uboot_its
> +	cat << EOF >> ${uboot_its}
>  /dts-v1/;
>=20
>  / {
> @@ -322,7 +322,7 @@ uboot_fitimage_assemble() {
>      images {
>          uboot {
>              description =3D "U-Boot image";
> -            data =3D /incbin/("$uboot_nodtb_bin");
> +            data =3D /incbin/("${uboot_nodtb_bin}");
>              type =3D "standalone";
>              os =3D "u-boot";
>              arch =3D "${UBOOT_ARCH}";
> @@ -332,34 +332,34 @@ uboot_fitimage_assemble() {
>  EOF
>=20
>  	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> -		cat << EOF >> $uboot_its
> +		cat << EOF >> ${uboot_its}
>              signature {
> -                algo =3D "$uboot_csum,$uboot_sign_algo";
> -                key-name-hint =3D "$uboot_sign_keyname";
> +                algo =3D "${uboot_csum},${uboot_sign_algo}";
> +                key-name-hint =3D "${uboot_sign_keyname}";
>              };
>  EOF
>  	fi
>=20
> -	cat << EOF >> $uboot_its
> +	cat << EOF >> ${uboot_its}
>          };
>          fdt {
>              description =3D "U-Boot FDT";
> -            data =3D /incbin/("$uboot_dtb");
> +            data =3D /incbin/("${uboot_dtb}");
>              type =3D "flat_dt";
>              arch =3D "${UBOOT_ARCH}";
>              compression =3D "none";
>  EOF
>=20
>  	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
> -		cat << EOF >> $uboot_its
> +		cat << EOF >> ${uboot_its}
>              signature {
> -                algo =3D "$uboot_csum,$uboot_sign_algo";
> -                key-name-hint =3D "$uboot_sign_keyname";
> +                algo =3D "${uboot_csum},${uboot_sign_algo}";
> +                key-name-hint =3D "${uboot_sign_keyname}";
>              };
>  EOF
>  	fi
>=20
> -	cat << EOF >> $uboot_its
> +	cat << EOF >> ${uboot_its}
>          };
>      };
>=20
> @@ -379,8 +379,8 @@ EOF
>  	#
>  	${UBOOT_MKIMAGE} \
>  		${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if
> len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
> -		-f $uboot_its \
> -		$uboot_bin
> +		-f ${uboot_its} \
> +		${uboot_bin}
>=20
>  	if [ "${SPL_SIGN_ENABLE}" =3D "1" ] ; then
>  		#
> @@ -389,8 +389,8 @@ EOF
>  		${UBOOT_MKIMAGE_SIGN} \
>  			${@'-D "${SPL_MKIMAGE_DTCOPTS}"' if
> len('${SPL_MKIMAGE_DTCOPTS}') else ''} \
>  			-F -k "${SPL_SIGN_KEYDIR}" \
> -			-K "$spl_dtb" \
> -			-r $uboot_bin \
> +			-K "${spl_dtb}" \
> +			-r ${uboot_bin} \
>  			${SPL_MKIMAGE_SIGN_ARGS}
>  	fi
>=20
> @@ -422,8 +422,8 @@ do_uboot_assemble_fitimage() {
>  		kernel_uboot_fitimage_name=3D`basename
> ${STAGING_DATADIR}/u-boot-fitImage-*`
>  		kernel_uboot_its_name=3D`basename
> ${STAGING_DATADIR}/u-boot-its-*`
>  		cd ${B}
> -		uboot_fitimage_assemble $kernel_uboot_its_name
> ${UBOOT_NODTB_BINARY} \
> -					${UBOOT_DTB_BINARY}
> $kernel_uboot_fitimage_name \
> +		uboot_fitimage_assemble ${kernel_uboot_its_name}
> ${UBOOT_NODTB_BINARY} \
> +					${UBOOT_DTB_BINARY}
> ${kernel_uboot_fitimage_name} \
>  					${SPL_DTB_BINARY}
>  	fi
>  }
> --
> 2.34.1


