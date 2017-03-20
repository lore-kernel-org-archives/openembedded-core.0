Return-Path: <andrea.adami@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 8766471DEF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 09:38:19 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id z133so13301669wmb.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Mar 2017 02:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7K1mDMiTpqHFKWJOMpoBKsgg2Hp1Bz7xIEuCCYBUAaE=;
	b=BCJzOftsIvzssvVQvNQskKFB9ILr2xJ3I0qP1zdg+X0J6b6vrlqHGk1mArMyid+asL
	jQif5riBGz2UQFmHgWi8UZy2FlCSZf/xa9meF1FbY+2yoeJ0msS3g9oyqxb61EveNCTE
	yI1i7bRtG0tUNF+2QJN265gtHSr/DjVyDS4vYpw7SbcB/m5dQIlJPdyTmUYLVAcSFYsB
	0H6nLKmZy0rguDXYYNOGEpWuwqK6ppShn4kdjuPeCkm0P4INg4NZAxAHmDRMfZwrBpUx
	eCQPNJuRbrrdF1YEqR4B9Q4IW9X0y87gA7hJe6VGkX/t4mwEd5VdYjRjNuxncousmu2H
	DB1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7K1mDMiTpqHFKWJOMpoBKsgg2Hp1Bz7xIEuCCYBUAaE=;
	b=cNBFBxbSLelY4oLhVGb6OcAvWzQoOA3Z03OuNa1a0rxvkz63OXF1OPZBHzyV7GzOol
	wRTICXRTz+1HDnjENw9lWVrAh2VdzAd1xMVfambhsX5RUYS00BqLxJWAbdRFimG3b2Rz
	pELUQ8ni9FyxEmT5c35aoVA5bLZxkOeKjc4IQRPGVuCkidoGyv/4muDiPpaN69B5o650
	e+mcux5NwAmBeqYUkrgPbagohDY7SMrljRWnXKHBw5263jw6RwN2T2XLWegwO56+fc1K
	fP1W/0fMNz9/+fSoD6fwbK2szNxKH5sBFLFgfIWQ4RRB+33cQuPuG72V0qrakzNymAYI
	Dqww==
X-Gm-Message-State: AFeK/H3VTmNFRBskH/RI3HxRn4dW94dR76/mQYuCtDlm+jIaKDX6wGZFtUT9yPfQ510pYdxhEtCAHSOy6yY6iQ==
X-Received: by 10.28.1.68 with SMTP id 65mr9302894wmb.63.1490002699876; Mon,
	20 Mar 2017 02:38:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.150.195 with HTTP; Mon, 20 Mar 2017 02:38:19 -0700 (PDT)
In-Reply-To: <1489929217-24568-3-git-send-email-liu.ming50@gmail.com>
References: <1489929217-24568-1-git-send-email-liu.ming50@gmail.com>
	<1489929217-24568-3-git-send-email-liu.ming50@gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 20 Mar 2017 10:38:19 +0100
Message-ID: <CAAQYJAtekfDc6GmD0uhm=qTqf28PQde7-b9Qa1Xa1HHPhWrVsg@mail.gmail.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Cc: Bruce Ashfield <bruce.ashfield@windriver.com>, "Tao,
	Yue" <yue.tao@windriver.com>,
	Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: Re: [PATCH 2/4] kernel.bbclass: handle kernel-vmlinux in KERNEL_IMAGETYPES
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
X-List-Received-Date: Mon, 20 Mar 2017 09:38:19 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Mar 19, 2017 at 2:13 PM,  <liu.ming50@gmail.com> wrote:
> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>
> There is a mess after KERNEL_IMAGETYPES was introduced in commit 849b67b2:
> [ kernel: Add KERNEL_IMAGETYPES to build multi types kernel at one time ]
>
> There are two packages both providing vmlinux image if 'vmlinux' is set in
> KERNEL_IMAGETYPES, they are kernel-vmlinux and kernel-image-vmlinux, to
> let them to be able to coexist, kernel-image-vmlinux was set to empty
> allowable, but its postinst/postrm scripts still remain trying to install/rm
> a update-alternatives link to /boot/vmlinux-${KERNEL_VERSION_NAME} but that
> file is actually being provided by the other package kernel-vmlinux.
>
> Fixed this mess by appending vmlinux to KERNEL_IMAGETYPES and process it
> in anonymous python function. It would not change the original behavior,
> all the generated packages would be same with before except that the
> ALLOW_EMPTY variable, it is removed in this patch.

Hi,

I am testing the 'old-style' of embedding the initramfs in the images [1].
Your patch does add 'vmlinux' even if we have KERNEL_IMAGETYPE ?= "zImage"
so it leads to the following error:

| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_deploy
| install: cannot stat 'arch/arm/boot/vmlinux': No such file or director

The solution for our custom kernel recipe is:

inherit kernel
addtask kernel_link_images after do_compile before do_strip

as done in linux-yocto.inc.

So with this little adjustment it is still possible to build in the old-way.

I didn't test yet the other part of the patchset so I cannot fully ack it.
FWIW I never liked the *BUNDLE framework for the need of specifying
the INITRAMFS_IMAGE in a conf file and not in the kernel recipe as
done with the old framework.

Cheers
Andrea

[1] http://cgit.openembedded.org/meta-handheld/tree/recipes-kernel/linux/linux-gcw0-kexecboot_4.7.bb


>
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/classes/kernel.bbclass | 47 +++++++++++++++++++--------------------------
>  1 file changed, 20 insertions(+), 27 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 6905a9b..1a4335c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -14,6 +14,7 @@ OE_TERMINAL_EXPORTS += "KBUILD_OUTPUT"
>  # we include gcc above, we dont need virtual/libc
>  INHIBIT_DEFAULT_DEPS = "1"
>
> +KERNEL_IMAGETYPES_append = " vmlinux"
>  KERNEL_IMAGETYPE ?= "zImage"
>  INITRAMFS_IMAGE ?= ""
>  INITRAMFS_IMAGE_NAME ?= "${@['${INITRAMFS_IMAGE}-${MACHINE}', ''][d.getVar('INITRAMFS_IMAGE') == '']}"
> @@ -35,38 +36,33 @@ python __anonymous () {
>      import re
>
>      # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
> -    type = d.getVar('KERNEL_IMAGETYPE') or ""
> -    alttype = d.getVar('KERNEL_ALT_IMAGETYPE') or ""
> -    types = d.getVar('KERNEL_IMAGETYPES') or ""
> -    if type not in types.split():
> -        types = (type + ' ' + types).strip()
> -    if alttype not in types.split():
> -        types = (alttype + ' ' + types).strip()
> +    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
> +    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
> +    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
> +    types = ' '.join(sorted(types)).strip()
>      d.setVar('KERNEL_IMAGETYPES', types)
> -
> -    typeformake = re.sub(r'\.gz', '', types)
> -    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', typeformake)
> +    d.setVar('KERNEL_IMAGETYPE_FOR_MAKE', re.sub(r'\.gz', '', types))
>
>      for type in types.split():
> -        typelower = type.lower()
>          imagedest = d.getVar('KERNEL_IMAGEDEST')
> +        if type == "vmlinux":
> +            typelower = type.lower()
> +        else:
> +            typelower = "image-%s" % type.lower()
>
> -        d.appendVar('PACKAGES', ' ' + 'kernel-image-' + typelower)
> -
> -        d.setVar('FILES_kernel-image-' + typelower, '/' + imagedest + '/' + type + '-${KERNEL_VERSION_NAME}')
> -
> -        d.appendVar('RDEPENDS_kernel-image', ' ' + 'kernel-image-' + typelower)
> -
> -        d.setVar('PKG_kernel-image-' + typelower, 'kernel-image-' + typelower + '-${KERNEL_VERSION_PKG_NAME}')
> +        d.appendVar('PACKAGES', ' kernel-%s' % typelower)
> +        if type != 'vmlinux' or d.getVar('KERNEL_IMAGETYPE') == 'vmlinux':
> +            d.appendVar('RDEPENDS_kernel-image', ' kernel-%s' % typelower)
>
> -        d.setVar('ALLOW_EMPTY_kernel-image-' + typelower, '1')
> +        d.setVar('FILES_kernel-%s' % typelower, '/%s/%s-${KERNEL_VERSION_NAME}' % (imagedest, type))
> +        d.setVar('PKG_kernel-%s' % typelower, 'kernel-%s-${KERNEL_VERSION_PKG_NAME}' % typelower)
>
>          priority = d.getVar('KERNEL_PRIORITY')
> -        postinst = '#!/bin/sh\n' + 'update-alternatives --install /' + imagedest + '/' + type + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} ' + priority + ' || true' + '\n'
> -        d.setVar('pkg_postinst_kernel-image-' + typelower, postinst)
> +        postinst = '#!/bin/sh\nupdate-alternatives --install /%s/%s %s %s-${KERNEL_VERSION_NAME} %s || true\n' % (imagedest, type, type, type, priority)
> +        d.setVar('pkg_postinst_kernel-%s' % typelower, postinst)
>
> -        postrm = '#!/bin/sh\n' + 'update-alternatives --remove' + ' ' + type + ' ' + type + '-${KERNEL_VERSION_NAME} || true' + '\n'
> -        d.setVar('pkg_postrm_kernel-image-' + typelower, postrm)
> +        postrm = '#!/bin/sh\nupdate-alternatives --remove %s %s-${KERNEL_VERSION_NAME} || true\n' % (type, type)
> +        d.setVar('pkg_postrm_kernel-%s' % typelower, postrm)
>
>      image = d.getVar('INITRAMFS_IMAGE')
>      if image:
> @@ -319,7 +315,6 @@ kernel_do_install() {
>         done
>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
> -       install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
>         [ -e Module.symvers ] && install -m 0644 Module.symvers ${D}/boot/Module.symvers-${KERNEL_VERSION}
>         install -d ${D}${sysconfdir}/modules-load.d
>         install -d ${D}${sysconfdir}/modprobe.d
> @@ -484,19 +479,17 @@ EXPORT_FUNCTIONS do_compile do_install do_configure
>
>  # kernel-base becomes kernel-${KERNEL_VERSION}
>  # kernel-image becomes kernel-image-${KERNEL_VERSION}
> -PACKAGES = "kernel kernel-base kernel-vmlinux kernel-image kernel-dev kernel-modules"
> +PACKAGES = "kernel kernel-base kernel-image kernel-dev kernel-modules"
>  FILES_${PN} = ""
>  FILES_kernel-base = "/lib/modules/${KERNEL_VERSION}/modules.order /lib/modules/${KERNEL_VERSION}/modules.builtin"
>  FILES_kernel-image = ""
>  FILES_kernel-dev = "/boot/System.map* /boot/Module.symvers* /boot/config* ${KERNEL_SRC_PATH} /lib/modules/${KERNEL_VERSION}/build"
> -FILES_kernel-vmlinux = "/boot/vmlinux-${KERNEL_VERSION_NAME}"
>  FILES_kernel-modules = ""
>  RDEPENDS_kernel = "kernel-base"
>  # Allow machines to override this dependency if kernel image files are
>  # not wanted in images as standard
>  RDEPENDS_kernel-base ?= "kernel-image"
>  PKG_kernel-image = "kernel-image-${@legitimize_package_name('${KERNEL_VERSION}')}"
> -RDEPENDS_kernel-image += "${@base_conditional('KERNEL_IMAGETYPE', 'vmlinux', 'kernel-vmlinux', '', d)}"
>  PKG_kernel-base = "kernel-${@legitimize_package_name('${KERNEL_VERSION}')}"
>  RPROVIDES_kernel-base += "kernel-${KERNEL_VERSION}"
>  ALLOW_EMPTY_kernel = "1"
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

