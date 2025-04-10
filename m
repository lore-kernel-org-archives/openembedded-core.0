Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3895C369A6
	for <webhook@archiver.kernel.org>; Thu, 10 Apr 2025 13:01:00 +0000 (UTC)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
 by mx.groups.io with SMTP id smtpd.web11.33916.1744290055460379379
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Apr 2025 06:00:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=a27qR5Ej;
 spf=pass (domain: linaro.org, ip: 209.85.208.181, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30effbfaf61so8624241fa.0
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 06:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744290053; x=1744894853; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EncOWCiJDqrd59GEXXcvx9ShBh5RfE+SbnlM3fJQvNQ=;
        b=a27qR5EjH9Spz3LgdyikNs0HGMac74CDU5+5mlUTFo42SiF6FTyKRf+uOzOD5gkhNn
         g+D9Z/wxhgVhpML+xCfPK8eh6GCLrdDB5y6C9Xoth2eXQEdJ/6wZe125Fkp69b/BeVYn
         n6wy9YebuH31x3w49dp1eGUkBKyzFTI6IlbB01j2Z/3amLYZEPgyvjUJHBlAq98iAuOo
         jtYSHHIKqnF5lWREM95O7sSnDlFph0VGdEn4tTQaw3Y/wpD6rUHCc5W+GDYWa6rh5t2K
         QErX6cNf8aU0Ynqq8SMkAl9izszPjPeZH9zIaCLipKUyYqb/8A4RjhpyGWcDo0DMMrnh
         7qow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744290054; x=1744894854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EncOWCiJDqrd59GEXXcvx9ShBh5RfE+SbnlM3fJQvNQ=;
        b=h8Jnhd/bVg02bpkKMV7ufbKfAZ2W3Wq6zTNYz1dZ5P4SsOlRUsrBx8WPW0298OXV5K
         vtcTMM4kuow/s21qRw2DMuLvwWj2hY2/yPC7WPRXXX27GUG6/BZS2uQ/Dtn/agZkl4ra
         Ex1NpF31fHMyW4QDILpAhm+AfYUb7pGP7ZBB71ETQYL73MSZ1y77LXsAlPJ5zeXtUzlT
         cKUhC5O7EcdIo/oR8lzy/xIeYXmxm+5p8dUp07xuXBiw1UzQ1aO+UmfGastGtR3UPut9
         WmMYcQqRNh4aDF6Tz1y9VCvfcvUX8NGz9xctjDYjrTm+cwjOY9FCwxZJBuDcUs5hsjrB
         2raQ==
X-Gm-Message-State: AOJu0Yx76SHF/Z3Mj6Pz76IiLAk5H5DsKzkyA72C9VuscYAjFbFJPCEc
	p1y2D7HAqB9+0HOHMHhaprgXQACxarUGOaHMT4hSTHHN+fUdJ4DvodN1vXBdF6U=
X-Gm-Gg: ASbGnctjZOAwf5DugsPdUxwWsyd8gBDX0u0yZqJ0VDz0i8Jz7PQyGjVGVwqOlv+8SZe
	5eu8zFI8d3WB/nukF+T42mvI0wd8IbJLX+SH8zQ5QvhWRQ/gBjlI8r0agJRLd7fCrKnW53gwwHm
	QuPXLqC51uj4a9osL2dXdNzWXwM6N0++eaGCz7vKtlj/TSYkb+6yCydczh4AOjt1jedrZFy3mlE
	0oB68/OUqt5gIWJYSKx7Tkx/HKUr1AAAqo8+7Lzpa2WiFfsHrRF6HI+U9NKuKPnwYW+/BrxVXNU
	6+vbv1N7o0dgAgKmup2/u0mlhiBdUIFYiaE/Sx2W/F/OrAt77svtpOjVVlTxMqLTW1ckElYlEw=
	=
X-Google-Smtp-Source: AGHT+IG3zcjGaZR/hD6XhxAz9gVos/tSeoplioUkBpXhpFH383Xew1tgj74bn77qPSZL+IkNPL96Cw==
X-Received: by 2002:a2e:6e08:0:b0:30c:432c:5f36 with SMTP id 38308e7fff4ca-30fdf513763mr7495791fa.5.1744290052080;
        Thu, 10 Apr 2025 06:00:52 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f465d4ec6sm4749581fa.72.2025.04.10.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 06:00:51 -0700 (PDT)
Date: Thu, 10 Apr 2025 16:00:50 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z_fBAsbV-hY-x_SC@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org>
 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Apr 2025 13:01:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214664

Hi,

On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > At the moment linux-yocto kernels for various architectures
> > are not very modular and a lot of drivers are built into the kernel
> > even when they are not needed at runtime. These make the main kernel
> > binary big and slow to boot. This also impacts udev in userspace
> > which takes a long time processing events from all these built in drivers,
> > for example when udev runs in initrd.
> > 
> > Then constructing the initrd is very device and kernel configuration specific.
> > initrd image needs explicitly define which binary packages to install
> > to avoid pulling in complex dependencies. A full set of kernel modules
> > via kernel-modules meta package is too big for initrd and most of the
> > drivers are not needed for use cases like "just load modules to mount
> > main rootfs". Then the initrd configuration breaks if kernel driver
> > is built into the kernel since the binary package doesn't exist.
> > 
> > Introduce kernel-initrd-modules meta package to solve these problems.
> > The meta package adds dependencies to real kernel modules based on
> > the kernel module file paths so that it will include several
> > kernel subsystems and their drivers which are often needed to find
> > main rootfs from some block device. This works when drivers are built
> > as modules but does not break if drivers are built into the kernel.
> > 
> > The resulting initrd is also smaller since only a subset of drivers
> > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > kernel and qemu and AMD KV260 HW.
> > 
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> > �.../kernel-module-split.bbclass�������������� | 48 +++++++++++++++++++
> > �meta/classes-recipe/kernel.bbclass����������� |� 5 +-
> > �meta/classes-recipe/module.bbclass����������� | 37 ++++++++++++++
> > �3 files changed, 89 insertions(+), 1 deletion(-)
> > 
> > diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> > index 9487365eb7..101c5cd959 100644
> > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > �KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > �KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> > �
> > +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > +
> > +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > +/drivers/acpi/|\
> > +/drivers/ata/|\
> > +/drivers/block/|\
> > +/drivers/cdrom/|\
> > +/drivers/char/hw_random/|\
> > +/drivers/char/tpm/|\
> > +/drivers/char/|\
> > +/drivers/crypto/|\
> > +/drivers/dax/|\
> > +/drivers/firmware/arm_scmi/|\
> > +/drivers/gpu/drm/|\
> > +/drivers/md/|\
> > +/drivers/mmc/|\
> > +/drivers/mtd/|\
> > +/drivers/nvdimm/|\
> > +/drivers/nvme/|\
> > +/drivers/pci/|\
> > +/drivers/scsi/|\
> > +/drivers/tee/|\
> > +/drivers/tty/serial/|\
> > +/drivers/virtio/|\
> > +/drivers/watchdog/|\
> > +/kernel/arch/|\
> > +/kernel/block/|\
> > +/kernel/crypto/|\
> > +/kernel/fs/|\
> > +/kernel/lib/\
> > +)(.*)"
> > +
> > �python split_kernel_module_packages () {
> > ���� import re
> > �
> > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > ���� modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> > ���� if modules:
> > �������� d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > +
> > +��� initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE') or ""
> > +��� initrd_module_regex = d.getVar('KERNEL_INITRD_MODULES_REGEX') or ""
> > +��� if (initrd_metapkg != "") and (initrd_module_regex != ""):
> > +������� initrd_module_regex = re.compile(initrd_module_regex)
> > +������� initrd_modules = []
> > +������� for module in modules:
> > +����������� files = d.getVar('FILES:' + module)
> > +����������� m = re.match(initrd_module_regex, files)
> > +����������� if m:
> > +��������������� initrd_modules.append(module)
> > +
> > +������� if initrd_modules:
> > +����������� d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
> > �}
> > �
> > �do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > index 36ce659762..3dcaebcaed 100644
> > --- a/meta/classes-recipe/kernel.bbclass
> > +++ b/meta/classes-recipe/kernel.bbclass
> > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
> > �
> > �# kernel-base becomes kernel-${KERNEL_VERSION}
> > �# kernel-image becomes kernel-image-${KERNEL_VERSION}
> > -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > �FILES:${PN} = ""
> > �FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > �FILES:${KERNEL_PACKAGE_NAME}-image = ""
> > �FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > �FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > �FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
> > �FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> > �RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
> > �# Allow machines to override this dependency if kernel image files are
> > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
> > �DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
> > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd modules meta package"
> > �
> > �pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > �	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
> > index f2f0b25a2d..51f864f1f9 100644
> > --- a/meta/classes-recipe/module.bbclass
> > +++ b/meta/classes-recipe/module.bbclass
> > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > �KERNEL_MODULES_META_PACKAGE = "${PN}"
> > �FILES:${PN} = ""
> > �ALLOW_EMPTY:${PN} = "1"
> > +
> > +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > +
> > +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > +/drivers/acpi/|\
> > +/drivers/ata/|\
> > +/drivers/block/|\
> > +/drivers/cdrom/|\
> > +/drivers/char/hw_random/|\
> > +/drivers/char/tpm/|\
> > +/drivers/char/|\
> > +/drivers/crypto/|\
> > +/drivers/dax/|\
> > +/drivers/firmware/arm_scmi/|\
> > +/drivers/gpu/drm/|\
> > +/drivers/md/|\
> > +/drivers/mmc/|\
> > +/drivers/mtd/|\
> > +/drivers/nvdimm/|\
> > +/drivers/nvme/|\
> > +/drivers/pci/|\
> > +/drivers/scsi/|\
> > +/drivers/tee/|\
> > +/drivers/tty/serial/|\
> > +/drivers/virtio/|\
> > +/drivers/watchdog/|\
> > +/kernel/arch/|\
> > +/kernel/block/|\
> > +/kernel/crypto/|\
> > +/kernel/fs/|\
> > +/kernel/lib/\
> > +)(.*)"
> > +
> > +FILES:${PN}-initrd = ""
> > +ALLOW_EMPTY:${PN}-initrd = "1"
> 
> What is the difference between the variable defined in kernel-module-
> split.bbclass and this one in module.bbclass? Do we need/want to
> separate but seemingly similar definitions?

One is for kernel compilation and in-tree drivers, the other is for
out-of-tree modules.

The "kernel-modules" meta package is handled this way too, with
duplication in both.

Bruce says this should be moved to linux-yocto kernel recipe,
which IMO breaks the use of kernel-initrd-modules for vendor kernel recipes
outside of oe-core. I'd rather support them too to e.g. more easily boot
qemu or run oeqa selftests with qemu.

Cheers,

-Mikko

