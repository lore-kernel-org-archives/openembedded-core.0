Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95DD5C3601E
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 12:42:20 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web11.33524.1744288936004264968
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 05:42:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=T/FhTCkm;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso8559585e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 05:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1744288934; x=1744893734; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Usw0IAaHDziWNF1R/bPZPRjqJjCpX4X+tCrV+yA5a8=;
        b=T/FhTCkmTl5VKOnmauiG2YIQzuNzxUTD2IcHtmslrsVgFhZfLD6EMuWUjMIcY5QWDf
         +U03tbSs7VIxUBRcVAlholFVXCKdnXfGUGVZor0ce8OWG4fNhK7XCcwg4Ny8sxAEDkpG
         QqA97wUBirlZG7A9LnpFOeZq5TRxeHisL8p5s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744288934; x=1744893734;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8Usw0IAaHDziWNF1R/bPZPRjqJjCpX4X+tCrV+yA5a8=;
        b=GPN5sCxxmGlCNwkfkgXJ9jn3VwAfxA5t1Q4KlmLK8xUr6kXIa35yIrm0eE1DKV8Ea8
         8NKppPPplcmPOeF0WKjLPGc2VdYJfxnyyuELeN24mrL3rTNWuvjss1iKoQTNu5kC64jg
         WQBZdgnm5DJlYkO9yb5WH2C1wtekp3zyfvIFQD8+/ddQssEnBBmJzYWkWK4dTl9dETxh
         JPX16PEdAK7Q5egENcKtPD28J/zI5RLcsTxNxIggR5c3J1Bw/A2K1lFZEcWB6ONX0yx1
         9HZBtkJo1HHdk3mykiUTZqOTYzgPHh6ZDbjIwR9Vr/1C+dOq6sFnXgPxTE/Zn8KAdEwW
         nh1A==
X-Forwarded-Encrypted: i=1; AJvYcCW8hJF9FPekWBs7pjD9opNVTOSn35Y5bX604OuWa8gkIm6wHP1AzlnLEYD+ZQBu2zqtzJwXvZZGS7lg0+MjSiWeqA==@lists.openembedded.org
X-Gm-Message-State: AOJu0Yw3zOS0s52juMToq497lSld+fIKb+KUUdDnzpbYFff5IZA8Zc8i
	n6aMW0jOSxt+hOaH0lVa5SRkZ/FB+UObtQ133QJ8mRJU0rhqLM7j3ca7jNaj9C49YdSCAZEInRp
	Q
X-Gm-Gg: ASbGncssj8HWFXk+AvotE5BPE6lwMhsk6xTS7l/GHtJcND2GtxG5OcALS6W9j/H7bTV
	YyvBViTSt1Anjd6x+BbFLZ7wqUictR1RmPst467QwCQt207jOn1NdyPykkxNeXr9CvKI1/60w7p
	2bLZPODsyHX/rdIoiD8orlwXdrtZHuAtGjJPQADHH+x3sybdA7sbgQNW5g0zl4DMPQKu2t9z3yz
	nNGakgsCuYwM3f+IM7U3xJiLUI7sJTFrHC7/yleMEihECCd/q91s3/AuOM0j1tvSabiXuYqv2Di
	yhrTiY8NMhEHn5UeKE4xuX5DAM2x+dXOHihHvDvg7Zs33OS+0K8fSIyf0VdVAsBzyvCF5Clx9x9
	TSB0XKnFtmL8AjH5ahPh1yOlN+4OxeY5c0RoUrgQm
X-Google-Smtp-Source: AGHT+IGEe6hVSiWpSKqc6JYqPJHbNm/gjAbI0M/2DkzDfbY362Y+r5cXvvREB5vTdoNMlRtJpjz4CQ==
X-Received: by 2002:a05:600c:8706:b0:43d:9f2:6274 with SMTP id 5b1f17b1804b1-43f2fedc590mr25493255e9.14.1744288933953;
        Thu, 10 Apr 2025 05:42:13 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6? ([2001:8b0:aba:5f3c:ddb2:da8c:e063:58d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f207c90a9sm53722165e9.36.2025.04.10.05.42.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 05:42:13 -0700 (PDT)
Message-ID: <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: mikko.rapeli@linaro.org, openembedded-core@lists.openembedded.org
Date: Thu, 10 Apr 2025 13:42:12 +0100
In-Reply-To: <20250404162932.447699-4-mikko.rapeli@linaro.org>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
	 <20250404162932.447699-4-mikko.rapeli@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0-1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 12:42:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214660

On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via lists.openembedded.org =
wrote:
> At the moment linux-yocto kernels for various architectures
> are not very modular and a lot of drivers are built into the kernel
> even when they are not needed at runtime. These make the main kernel
> binary big and slow to boot. This also impacts udev in userspace
> which takes a long time processing events from all these built in drivers=
,
> for example when udev runs in initrd.
>=20
> Then constructing the initrd is very device and kernel configuration spec=
ific.
> initrd image needs explicitly define which binary packages to install
> to avoid pulling in complex dependencies. A full set of kernel modules
> via kernel-modules meta package is too big for initrd and most of the
> drivers are not needed for use cases like "just load modules to mount
> main rootfs". Then the initrd configuration breaks if kernel driver
> is built into the kernel since the binary package doesn't exist.
>=20
> Introduce kernel-initrd-modules meta package to solve these problems.
> The meta package adds dependencies to real kernel modules based on
> the kernel module file paths so that it will include several
> kernel subsystems and their drivers which are often needed to find
> main rootfs from some block device. This works when drivers are built
> as modules but does not break if drivers are built into the kernel.
>=20
> The resulting initrd is also smaller since only a subset of drivers
> are needed for "mount the rootfs" usecase. Tested on genericarm64
> kernel and qemu and AMD KV260 HW.
>=20
> Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> ---
> =C2=A0.../kernel-module-split.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 48 +++++++++++++++++++
> =C2=A0meta/classes-recipe/kernel.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +-
> =C2=A0meta/classes-recipe/module.bbclass=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 37 ++++++++++++++
> =C2=A03 files changed, 89 insertions(+), 1 deletion(-)
>=20
> diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/class=
es-recipe/kernel-module-split.bbclass
> index 9487365eb7..101c5cd959 100644
> --- a/meta/classes-recipe/kernel-module-split.bbclass
> +++ b/meta/classes-recipe/kernel-module-split.bbclass
> @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?=3D ""
> =C2=A0KERNEL_MODULE_PACKAGE_SUFFIX ?=3D "-${KERNEL_VERSION}"
> =C2=A0KERNEL_MODULE_PROVIDE_VIRTUAL ?=3D "1"
> =C2=A0
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from b=
lock device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NA=
ME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files =
in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +
> =C2=A0python split_kernel_module_packages () {
> =C2=A0=C2=A0=C2=A0=C2=A0 import re
> =C2=A0
> @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> =C2=A0=C2=A0=C2=A0=C2=A0 modules =3D do_split_packages(d, root=3D'${nonar=
ch_base_libdir}/modules', file_regex=3Dmodule_regex, output_pattern=3Dmodul=
e_pattern, description=3D'%s kernel module', postinst=3Dpostinst, postrm=3D=
postrm, recursive=3DTrue, hook=3Dfrob_metadata, extra_depends=3D'%s-%s' % (=
kernel_package_name, kernel_version))
> =C2=A0=C2=A0=C2=A0=C2=A0 if modules:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('RDEPENDS:' =
+ metapkg, ' '+' '.join(modules))
> +
> +=C2=A0=C2=A0=C2=A0 initrd_metapkg =3D d.getVar('KERNEL_INITRD_MODULES_ME=
TA_PACKAGE') or ""
> +=C2=A0=C2=A0=C2=A0 initrd_module_regex =3D d.getVar('KERNEL_INITRD_MODUL=
ES_REGEX') or ""
> +=C2=A0=C2=A0=C2=A0 if (initrd_metapkg !=3D "") and (initrd_module_regex =
!=3D ""):
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initrd_module_regex =3D re.co=
mpile(initrd_module_regex)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 initrd_modules =3D []
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for module in modules:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 files=
 =3D d.getVar('FILES:' + module)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 m =3D=
 re.match(initrd_module_regex, files)
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if m:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 initrd_modules.append(module)
> +
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if initrd_modules:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.app=
endVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
> =C2=A0}
> =C2=A0
> =C2=A0do_package[vardeps] +=3D '${@" ".join(map(lambda s: "module_conf_" =
+ s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/ker=
nel.bbclass
> index 36ce659762..3dcaebcaed 100644
> --- a/meta/classes-recipe/kernel.bbclass
> +++ b/meta/classes-recipe/kernel.bbclass
> @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_=
transform_bundled_initramfs d
> =C2=A0
> =C2=A0# kernel-base becomes kernel-${KERNEL_VERSION}
> =C2=A0# kernel-image becomes kernel-image-${KERNEL_VERSION}
> -PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}=
-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> +PACKAGES =3D "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNE=
L_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}=
-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-modules $=
{KERNEL_PACKAGE_NAME}-dbg"
> =C2=A0FILES:${PN} =3D ""
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-base =3D "${nonarch_base_libdir}/modul=
es/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_=
VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/m=
odules.builtin.modinfo"
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-image =3D ""
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-dev =3D "/${KERNEL_IMAGEDEST}/System.m=
ap* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KER=
NEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-vmlinux =3D "/${KERNEL_IMAGEDEST}/vmli=
nux-${KERNEL_VERSION_NAME}"
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-modules =3D ""
> +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules =3D ""
> =C2=A0FILES:${KERNEL_PACKAGE_NAME}-dbg =3D "/usr/lib/debug /usr/src/debug=
"
> =C2=A0RDEPENDS:${KERNEL_PACKAGE_NAME} =3D "${KERNEL_PACKAGE_NAME}-base (=
=3D ${EXTENDPKGV})"
> =C2=A0# Allow machines to override this dependency if kernel image files =
are
> @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} =3D "1"
> =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base =3D "1"
> =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image =3D "1"
> =C2=A0ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules =3D "1"
> +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "1"
> =C2=A0DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules =3D "Kernel modules meta=
 package"
> +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules =3D "Kernel initrd mod=
ules meta package"
> =C2=A0
> =C2=A0pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> =C2=A0	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/mod=
ule.bbclass
> index f2f0b25a2d..51f864f1f9 100644
> --- a/meta/classes-recipe/module.bbclass
> +++ b/meta/classes-recipe/module.bbclass
> @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> =C2=A0KERNEL_MODULES_META_PACKAGE =3D "${PN}"
> =C2=A0FILES:${PN} =3D ""
> =C2=A0ALLOW_EMPTY:${PN} =3D "1"
> +
> +# subset of kernel modules needed in initrd, to e.g. mount rootfs from b=
lock device
> +KERNEL_INITRD_MODULES_META_PACKAGE ?=3D "${@ d.getVar("KERNEL_PACKAGE_NA=
ME") or "kernel" }-initrd-modules"
> +
> +# match regex to path or file name. E.g. include all drivers with files =
in path /drivers/ata/
> +KERNEL_INITRD_MODULES_REGEX ?=3D "(.*)(\
> +/drivers/acpi/|\
> +/drivers/ata/|\
> +/drivers/block/|\
> +/drivers/cdrom/|\
> +/drivers/char/hw_random/|\
> +/drivers/char/tpm/|\
> +/drivers/char/|\
> +/drivers/crypto/|\
> +/drivers/dax/|\
> +/drivers/firmware/arm_scmi/|\
> +/drivers/gpu/drm/|\
> +/drivers/md/|\
> +/drivers/mmc/|\
> +/drivers/mtd/|\
> +/drivers/nvdimm/|\
> +/drivers/nvme/|\
> +/drivers/pci/|\
> +/drivers/scsi/|\
> +/drivers/tee/|\
> +/drivers/tty/serial/|\
> +/drivers/virtio/|\
> +/drivers/watchdog/|\
> +/kernel/arch/|\
> +/kernel/block/|\
> +/kernel/crypto/|\
> +/kernel/fs/|\
> +/kernel/lib/\
> +)(.*)"
> +
> +FILES:${PN}-initrd =3D ""
> +ALLOW_EMPTY:${PN}-initrd =3D "1"

What is the difference between the variable defined in kernel-module-
split.bbclass and this one in module.bbclass? Do we need/want to
separate but seemingly similar definitions?

Cheers,

Richard




