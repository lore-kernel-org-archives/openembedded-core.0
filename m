Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95D3AC369A8
	for <webhook@archiver.kernel.org>; Fri, 11 Apr 2025 08:07:49 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.20414.1744358868415103187
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Apr 2025 01:07:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=eswtvgIO;
 spf=pass (domain: linaro.org, ip: 209.85.208.178, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30dd5a93b49so13821851fa.0
        for <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 01:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744358866; x=1744963666; darn=lists.openembedded.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jf4YZG0pmk2Wx6EYDuk0274fOENJKfUk44bmlNZBE2c=;
        b=eswtvgIO/InmFgY43D1cwI03JVMhv2p3Ou99/XgQN9t1FIMtic088Rr4+3c2czM1am
         dYb4As2QsBEeMLVjs/GduqJJrk45Q16RF5i9sLlW6ygGMT6PkZfoPUo50/g6SV+FOU7K
         1YmUbcxTvOMQsBoJWOQuy/4n0XFzKdyJi6Ur6dfG6lwfQBDXOXreHn413xZz0pwujK81
         /aKq9EWl0s5lQR+PmD+3wlJCs0wchBntB5dSFHzeqkvgCR2jXTNuF70Qx2nHnDUBO4uU
         LqDnu3RSyB7EW4ITefn6/kvpv7h96oK5vieiPPGSrAcgSEv4VdeGoWto0GvY5PkIUi53
         liHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358866; x=1744963666;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jf4YZG0pmk2Wx6EYDuk0274fOENJKfUk44bmlNZBE2c=;
        b=EYBiYMd2uLugeeFm/VpQ+dH6ECUAI2U1bq8x5LlwyYZ48OdqHjpzqNKUGFlVvI7hRb
         84k+c2kZNr8JlhDb2vkDPVdBE/gFjuAq25QEz16lQm0B16iDfJqdU9q4GK53apumtYV1
         wKnuZHgRoy09FjoecLZLwi+opSr+6FemNP1sprZC9BJnSkGPUiQkrYYkMnthWcuz2bam
         GjKQ8it2tNBunYbi1K1l+3SpWrZSvPCvhJ/Y1EfXI2BasGGTkK4YNjsegbmmkH6jLzfM
         sdOj3W7XbAAz2aTpPay8TjeC1yzv+tZCFXJFAQTBfHG5VnD4BG08CcIfEf9mJmIxqID9
         g+Tg==
X-Forwarded-Encrypted: i=1; AJvYcCUEzL1EzDfnntBGLGCT95+3leS6qHCOJaSdmf4u9xgbVv6679e42sAKdv6vDsibIPe3Oythj9KlZ4PKKCZbrP+8ag==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyZIRoxpSs2oFRgvzqTXC3/r1fnck7C7S6x8WM+7SIxb20lCsbL
	8dl8oYs9UEFt0CCLzPxCZM02NDQAxXqEy7+d+JwLUfpWZzqZXzWtGv9y6PHbYf8=
X-Gm-Gg: ASbGncshexT1/9D3JUI7Qk70Rl6LV+c9CUrcZeFeTId3k3vvMvGLud8Z7tySLdgW9th
	ZlWqfctrYbAMlC0fHFvehwl0aTZDc0Hf3NUcDxxTf4oeWNUQbZZFTZAiiPKgyWwJFoo+wWxwgT6
	BYF+VeoR/v8C8fwR+yTqjfIwoign7arkgsjOIB34ZV0SsOAHsrsceJ8T9ov6zRS3tCSqi3jB07t
	+re5f/xuVGoxExOoL+xxz7zSFnZNqqN/7vnN6xGg8wltGaA7fTyhVgiHD6LPnwROXFQpCvw4BdL
	GTvUB7GMv65+To/qxepMiQam4tZ8AVHz1CsF/xvSQliwl+swqRlK8dleAF5V9PMm/yabB4dbfA=
	=
X-Google-Smtp-Source: AGHT+IHLmi3qkw06LfY24f+tFDBvO3eSSyT9REVrr9JAFIsrEeflnUvoUAyT1L7GorzY7OgVD4xQKQ==
X-Received: by 2002:a05:651c:19a5:b0:30b:9813:b00d with SMTP id 38308e7fff4ca-31049a0193emr6057821fa.23.1744358866257;
        Fri, 11 Apr 2025 01:07:46 -0700 (PDT)
Received: from nuoska (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464ea80bsm7376231fa.63.2025.04.11.01.07.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 01:07:45 -0700 (PDT)
Date: Fri, 11 Apr 2025 11:07:44 +0300
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH v3 03/11] kernel.bbclass: add
 kernel-initrd-modules meta package
Message-ID: <Z_jN0JK0Uv9JH20M@nuoska>
References: <20250404162932.447699-1-mikko.rapeli@linaro.org>
 <20250404162932.447699-4-mikko.rapeli@linaro.org>
 <1c55e7536de5f36fa37076ad04ff35588b6b5f1e.camel@linuxfoundation.org>
 <1834F69070219745.7383@lists.openembedded.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1834F69070219745.7383@lists.openembedded.org>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Apr 2025 08:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214717

Hi,

On Thu, Apr 10, 2025 at 04:00:50PM +0300, Mikko Rapeli via lists.openembedded.org wrote:
> On Thu, Apr 10, 2025 at 01:42:12PM +0100, Richard Purdie wrote:
> > On Fri, 2025-04-04 at 19:29 +0300, Mikko Rapeli via lists.openembedded.org wrote:
> > > At the moment linux-yocto kernels for various architectures
> > > are not very modular and a lot of drivers are built into the kernel
> > > even when they are not needed at runtime. These make the main kernel
> > > binary big and slow to boot. This also impacts udev in userspace
> > > which takes a long time processing events from all these built in drivers,
> > > for example when udev runs in initrd.
> > > 
> > > Then constructing the initrd is very device and kernel configuration specific.
> > > initrd image needs explicitly define which binary packages to install
> > > to avoid pulling in complex dependencies. A full set of kernel modules
> > > via kernel-modules meta package is too big for initrd and most of the
> > > drivers are not needed for use cases like "just load modules to mount
> > > main rootfs". Then the initrd configuration breaks if kernel driver
> > > is built into the kernel since the binary package doesn't exist.
> > > 
> > > Introduce kernel-initrd-modules meta package to solve these problems.
> > > The meta package adds dependencies to real kernel modules based on
> > > the kernel module file paths so that it will include several
> > > kernel subsystems and their drivers which are often needed to find
> > > main rootfs from some block device. This works when drivers are built
> > > as modules but does not break if drivers are built into the kernel.
> > > 
> > > The resulting initrd is also smaller since only a subset of drivers
> > > are needed for "mount the rootfs" usecase. Tested on genericarm64
> > > kernel and qemu and AMD KV260 HW.
> > > 
> > > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > > ---
> > > �.../kernel-module-split.bbclass�������������� | 48 +++++++++++++++++++
> > > �meta/classes-recipe/kernel.bbclass����������� |� 5 +-
> > > �meta/classes-recipe/module.bbclass����������� | 37 ++++++++++++++
> > > �3 files changed, 89 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/meta/classes-recipe/kernel-module-split.bbclass b/meta/classes-recipe/kernel-module-split.bbclass
> > > index 9487365eb7..101c5cd959 100644
> > > --- a/meta/classes-recipe/kernel-module-split.bbclass
> > > +++ b/meta/classes-recipe/kernel-module-split.bbclass
> > > @@ -42,6 +42,40 @@ KERNEL_MODULE_PACKAGE_PREFIX ?= ""
> > > �KERNEL_MODULE_PACKAGE_SUFFIX ?= "-${KERNEL_VERSION}"
> > > �KERNEL_MODULE_PROVIDE_VIRTUAL ?= "1"
> > > �
> > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > +
> > > +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > +/drivers/acpi/|\
> > > +/drivers/ata/|\
> > > +/drivers/block/|\
> > > +/drivers/cdrom/|\
> > > +/drivers/char/hw_random/|\
> > > +/drivers/char/tpm/|\
> > > +/drivers/char/|\
> > > +/drivers/crypto/|\
> > > +/drivers/dax/|\
> > > +/drivers/firmware/arm_scmi/|\
> > > +/drivers/gpu/drm/|\
> > > +/drivers/md/|\
> > > +/drivers/mmc/|\
> > > +/drivers/mtd/|\
> > > +/drivers/nvdimm/|\
> > > +/drivers/nvme/|\
> > > +/drivers/pci/|\
> > > +/drivers/scsi/|\
> > > +/drivers/tee/|\
> > > +/drivers/tty/serial/|\
> > > +/drivers/virtio/|\
> > > +/drivers/watchdog/|\
> > > +/kernel/arch/|\
> > > +/kernel/block/|\
> > > +/kernel/crypto/|\
> > > +/kernel/fs/|\
> > > +/kernel/lib/\
> > > +)(.*)"
> > > +
> > > �python split_kernel_module_packages () {
> > > ���� import re
> > > �
> > > @@ -183,6 +217,20 @@ python split_kernel_module_packages () {
> > > ���� modules = do_split_packages(d, root='${nonarch_base_libdir}/modules', file_regex=module_regex, output_pattern=module_pattern, description='%s kernel module', postinst=postinst, postrm=postrm, recursive=True, hook=frob_metadata, extra_depends='%s-%s' % (kernel_package_name, kernel_version))
> > > ���� if modules:
> > > �������� d.appendVar('RDEPENDS:' + metapkg, ' '+' '.join(modules))
> > > +
> > > +��� initrd_metapkg = d.getVar('KERNEL_INITRD_MODULES_META_PACKAGE') or ""
> > > +��� initrd_module_regex = d.getVar('KERNEL_INITRD_MODULES_REGEX') or ""
> > > +��� if (initrd_metapkg != "") and (initrd_module_regex != ""):
> > > +������� initrd_module_regex = re.compile(initrd_module_regex)
> > > +������� initrd_modules = []
> > > +������� for module in modules:
> > > +����������� files = d.getVar('FILES:' + module)
> > > +����������� m = re.match(initrd_module_regex, files)
> > > +����������� if m:
> > > +��������������� initrd_modules.append(module)
> > > +
> > > +������� if initrd_modules:
> > > +����������� d.appendVar('RDEPENDS:' + initrd_metapkg, ' '+' '.join(initrd_modules))
> > > �}
> > > �
> > > �do_package[vardeps] += '${@" ".join(map(lambda s: "module_conf_" + s, (d.getVar("KERNEL_MODULE_PROBECONF") or "").split()))}'
> > > diff --git a/meta/classes-recipe/kernel.bbclass b/meta/classes-recipe/kernel.bbclass
> > > index 36ce659762..3dcaebcaed 100644
> > > --- a/meta/classes-recipe/kernel.bbclass
> > > +++ b/meta/classes-recipe/kernel.bbclass
> > > @@ -695,13 +695,14 @@ EXPORT_FUNCTIONS do_compile do_transform_kernel do_transform_bundled_initramfs d
> > > �
> > > �# kernel-base becomes kernel-${KERNEL_VERSION}
> > > �# kernel-image becomes kernel-image-${KERNEL_VERSION}
> > > -PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > +PACKAGES = "${KERNEL_PACKAGE_NAME} ${KERNEL_PACKAGE_NAME}-base ${KERNEL_PACKAGE_NAME}-vmlinux ${KERNEL_PACKAGE_NAME}-image ${KERNEL_PACKAGE_NAME}-dev ${KERNEL_PACKAGE_NAME}-modules ${KERNEL_PACKAGE_NAME}-initrd-modules ${KERNEL_PACKAGE_NAME}-dbg"
> > > �FILES:${PN} = ""
> > > �FILES:${KERNEL_PACKAGE_NAME}-base = "${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.order ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/modules.builtin.modinfo"
> > > �FILES:${KERNEL_PACKAGE_NAME}-image = ""
> > > �FILES:${KERNEL_PACKAGE_NAME}-dev = "/${KERNEL_IMAGEDEST}/System.map* /${KERNEL_IMAGEDEST}/Module.symvers* /${KERNEL_IMAGEDEST}/config* ${KERNEL_SRC_PATH} ${nonarch_base_libdir}/modules/${KERNEL_VERSION}/build"
> > > �FILES:${KERNEL_PACKAGE_NAME}-vmlinux = "/${KERNEL_IMAGEDEST}/vmlinux-${KERNEL_VERSION_NAME}"
> > > �FILES:${KERNEL_PACKAGE_NAME}-modules = ""
> > > +FILES:${KERNEL_PACKAGE_NAME}-initrd-modules = ""
> > > �FILES:${KERNEL_PACKAGE_NAME}-dbg = "/usr/lib/debug /usr/src/debug"
> > > �RDEPENDS:${KERNEL_PACKAGE_NAME} = "${KERNEL_PACKAGE_NAME}-base (= ${EXTENDPKGV})"
> > > �# Allow machines to override this dependency if kernel image files are
> > > @@ -716,7 +717,9 @@ ALLOW_EMPTY:${KERNEL_PACKAGE_NAME} = "1"
> > > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-base = "1"
> > > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-image = "1"
> > > �ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-modules = "1"
> > > +ALLOW_EMPTY:${KERNEL_PACKAGE_NAME}-initrd-modules = "1"
> > > �DESCRIPTION:${KERNEL_PACKAGE_NAME}-modules = "Kernel modules meta package"
> > > +DESCRIPTION:${KERNEL_PACKAGE_NAME}-initrd-modules = "Kernel initrd modules meta package"
> > > �
> > > �pkg_postinst:${KERNEL_PACKAGE_NAME}-base () {
> > > �	if [ ! -e "$D/lib/modules/${KERNEL_VERSION}" ]; then
> > > diff --git a/meta/classes-recipe/module.bbclass b/meta/classes-recipe/module.bbclass
> > > index f2f0b25a2d..51f864f1f9 100644
> > > --- a/meta/classes-recipe/module.bbclass
> > > +++ b/meta/classes-recipe/module.bbclass
> > > @@ -86,3 +86,40 @@ EXPORT_FUNCTIONS do_compile do_install
> > > �KERNEL_MODULES_META_PACKAGE = "${PN}"
> > > �FILES:${PN} = ""
> > > �ALLOW_EMPTY:${PN} = "1"
> > > +
> > > +# subset of kernel modules needed in initrd, to e.g. mount rootfs from block device
> > > +KERNEL_INITRD_MODULES_META_PACKAGE ?= "${@ d.getVar("KERNEL_PACKAGE_NAME") or "kernel" }-initrd-modules"
> > > +
> > > +# match regex to path or file name. E.g. include all drivers with files in path /drivers/ata/
> > > +KERNEL_INITRD_MODULES_REGEX ?= "(.*)(\
> > > +/drivers/acpi/|\
> > > +/drivers/ata/|\
> > > +/drivers/block/|\
> > > +/drivers/cdrom/|\
> > > +/drivers/char/hw_random/|\
> > > +/drivers/char/tpm/|\
> > > +/drivers/char/|\
> > > +/drivers/crypto/|\
> > > +/drivers/dax/|\
> > > +/drivers/firmware/arm_scmi/|\
> > > +/drivers/gpu/drm/|\
> > > +/drivers/md/|\
> > > +/drivers/mmc/|\
> > > +/drivers/mtd/|\
> > > +/drivers/nvdimm/|\
> > > +/drivers/nvme/|\
> > > +/drivers/pci/|\
> > > +/drivers/scsi/|\
> > > +/drivers/tee/|\
> > > +/drivers/tty/serial/|\
> > > +/drivers/virtio/|\
> > > +/drivers/watchdog/|\
> > > +/kernel/arch/|\
> > > +/kernel/block/|\
> > > +/kernel/crypto/|\
> > > +/kernel/fs/|\
> > > +/kernel/lib/\
> > > +)(.*)"
> > > +
> > > +FILES:${PN}-initrd = ""
> > > +ALLOW_EMPTY:${PN}-initrd = "1"
> > 
> > What is the difference between the variable defined in kernel-module-
> > split.bbclass and this one in module.bbclass? Do we need/want to
> > separate but seemingly similar definitions?
> 
> One is for kernel compilation and in-tree drivers, the other is for
> out-of-tree modules.
> 
> The "kernel-modules" meta package is handled this way too, with
> duplication in both.

Sorry, I was wrong. KERNEL_INITRD_MODULES_REGEX duplication is a bug.
I will remove this from module.bbclass. It includes kernel-module-split.bbclass
so defition can be taken from there, just like for kernel.bbclass users.

Cheers,

-Mikko

