Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C463F6FFC8
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Apr 2017 11:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 59F4D31E51FD;
	Sun,  9 Apr 2017 13:18:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id afmLNOcB0lwe; Sun,  9 Apr 2017 13:18:15 +0200 (CEST)
Received: from t510.zcs.saftware.de (p57A6179E.dip0.t-ipconnect.de
	[87.166.23.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 33C1231E51EE;
	Sun,  9 Apr 2017 13:18:15 +0200 (CEST)
Date: Sun, 9 Apr 2017 13:18:14 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: liu.ming50@gmail.com
Message-ID: <20170409131814.375640af@t510.zcs.saftware.de>
In-Reply-To: <1491669825-17958-3-git-send-email-liu.ming50@gmail.com>
References: <1491669825-17958-1-git-send-email-liu.ming50@gmail.com>
	<1491669825-17958-3-git-send-email-liu.ming50@gmail.com>
MIME-Version: 1.0
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V6 2/2] kernel-initramfs: add recipe
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
X-List-Received-Date: Sun, 09 Apr 2017 11:18:19 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  8 Apr 2017 18:43:45 +0200
liu.ming50@gmail.com wrote:

> From: Ming Liu <peter.x.liu@external.atlascopco.com>
> 
> To implement initramfs bundled kernel packaging.
> 
> The kernel images are copied from DEPLOY_DIR_IMAGE, and a list of
> packages will be generated according to KERNEL_IMAGETYPES setting.
> 
> For instance:
> For KERNEL_IMAGETYPES = "bzImage vmlinux"
> 
> the generated packages would be:
> - kernel-initramfs (Base package, RDEPENDS on kernel-initramfs-image)
> - kernel-initramfs-image (Image package, RDEPENDS on all sub images)
> - kernel-initramfs-image-bzimage (Contains bzImage image)
> - kernel-initramfs-image-vmlinux (Contains vmlinux image)
> 
> This recipe would be skipped if INITRAMFS_IMAGE_BUNDLE or
> INITRAMFS_IMAGE is not being set correctly.

This requires setting global variables, which makes it impossible to
create multiple initramfs images for different purposes using this recipe.

How about implementing this as a bbclass instead, which people inherit
in their own initramfs recipes? This would result in more meaningful
package names, too.

> 
> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
> ---
>  meta/recipes-kernel/linux/kernel-initramfs.bb | 95 +++++++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 meta/recipes-kernel/linux/kernel-initramfs.bb
> 
> diff --git a/meta/recipes-kernel/linux/kernel-initramfs.bb b/meta/recipes-kernel/linux/kernel-initramfs.bb
> new file mode 100644
> index 0000000..8bb7fbe
> --- /dev/null
> +++ b/meta/recipes-kernel/linux/kernel-initramfs.bb
> @@ -0,0 +1,95 @@
> +SUMMARY = "Initramfs bundled kernel images"
> +DESCRIPTION = "When built, it packages initramfs bundled kernel images of the \
> +preferred virtual/kernel provider."
> +SECTION = "kernel"
> +LICENSE = "GPLv2"
> +
> +inherit linux-kernel-base
> +
> +# Whilst not a module, this ensures we don't get multilib extended. (which would make no sense)
> +inherit module-base
> +
> +S = "${STAGING_KERNEL_DIR}"
> +B = "${WORKDIR}/build"
> +
> +# we dont need the default dependencies.
> +INHIBIT_DEFAULT_DEPS = "1"
> +
> +KERNEL_ALT_IMAGETYPE ??= ""
> +KERNEL_IMAGETYPE ?= "zImage"
> +KERNEL_IMAGEDEST ?= "boot"
> +KERNEL_VERSION = "${@['1.0.0', get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}')][get_kernelversion_file('${STAGING_KERNEL_BUILDDIR}') != None]}"
> +KERNEL_PKG_NAME = "${@legitimize_package_name(d.getVar('KERNEL_VERSION'))}"
> +KERNEL_PRIORITY ?= "${@int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[0]) * 10000 + \
> +                       int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[1]) * 100 + \
> +                       int(d.getVar('KERNEL_VERSION').split('-')[0].split('+')[0].split('.')[-1])}"
> +
> +PACKAGES = "${PN} ${PN}-image"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-image = ""
> +RDEPENDS_${PN} = "${PN}-image"
> +PKG_${PN} = "${PN}-${KERNEL_PKG_NAME}"
> +PKG_${PN}-image = "${PN}-image-${KERNEL_PKG_NAME}"
> +RPROVIDES_${PN} += "${PN}-${KERNEL_VERSION}"
> +ALLOW_EMPTY_${PN} = "1"
> +ALLOW_EMPTY_${PN}-image = "1"
> +
> +PACKAGE_ARCH = "${MACHINE_ARCH}"
> +
> +PACKAGES_DYNAMIC = "^kernel-initramfs-image-.*"
> +
> +python __anonymous () {
> +    # Skip processing of this recipe if INITRAMFS_IMAGE or INITRAMFS_IMAGE_BUNDLE
> +    # is not set correctly, to avoid generating only empty packages which makes
> +    # no sense.
> +    if not d.getVar('INITRAMFS_IMAGE') or d.getVar('INITRAMFS_IMAGE_BUNDLE') != '1':
> +        raise bb.parse.SkipPackage("Set INITRAMFS_IMAGE and INITRAMFS_IMAGE_BUNDLE to enable it")
> +
> +    # Merge KERNEL_IMAGETYPE and KERNEL_ALT_IMAGETYPE into KERNEL_IMAGETYPES
> +    types = set((d.getVar('KERNEL_IMAGETYPES') or "").split())
> +    types.add(d.getVar('KERNEL_IMAGETYPE') or "")
> +    types.add(d.getVar('KERNEL_ALT_IMAGETYPE') or "")
> +    types = ' '.join(sorted(types)).strip()
> +    d.setVar('KERNEL_IMAGETYPES', types)
> +
> +    for type in types.split():
> +        pn = d.getVar('PN')
> +        imagedest = d.getVar('KERNEL_IMAGEDEST')
> +        typelower = "image-%s" % type.lower()
> +
> +        d.appendVar('PACKAGES', ' %s-%s' % (pn, typelower))
> +        d.appendVar('RDEPENDS_%s-image' % pn, ' %s-%s' % (pn, typelower))
> +
> +        d.setVar('FILES_%s-%s' % (pn, typelower), '/%s/%s-initramfs-${KERNEL_VERSION}' % (imagedest, type))
> +        d.setVar('PKG_%s-%s' % ( pn, typelower), '%s-%s-${KERNEL_PKG_NAME}' % (pn, typelower))
> +
> +        priority = d.getVar('KERNEL_PRIORITY', False)
> +        postinst = '#!/bin/sh\nupdate-alternatives --install /%s/%s-initramfs %s-initramfs %s-initramfs-${KERNEL_VERSION} %s || true\n' % (imagedest, type, type, type, priority)
> +        d.setVar('pkg_postinst_%s-%s' % (pn, typelower), postinst)
> +
> +        postrm = '#!/bin/sh\nupdate-alternatives --remove %s-initramfs %s-initramfs-${KERNEL_VERSION} || true\n' % (type, type)
> +        d.setVar('pkg_postrm_%s-%s' % (pn, typelower), postrm)
> +}

This duplicates code from kernel.bbclass. Would it be possible to
move this to a shared location, at least partially?

Regards,
Andreas


> +
> +# Need the output of deploy.
> +do_install[depends] += "virtual/kernel:do_deploy"
> +
> +# We only need the packaging tasks - disable the rest
> +do_fetch[noexec] = "1"
> +do_unpack[noexec] = "1"
> +do_patch[noexec] = "1"
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +do_populate_sysroot[noexec] = "1"
> +
> +do_install() {
> +	if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
> +		echo "Copying initramfs bundled kernel images from ${DEPLOY_DIR_IMAGE}..."
> +		install -d ${D}/${KERNEL_IMAGEDEST}
> +		for type in ${KERNEL_IMAGETYPES}; do
> +			echo "Copying initramfs bundled kernel image: $type-initramfs-${MACHINE}.bin"
> +			install -m 0644 ${DEPLOY_DIR_IMAGE}/$type-initramfs-${MACHINE}.bin ${D}/${KERNEL_IMAGEDEST}/$type-initramfs-${KERNEL_VERSION}
> +		done
> +	fi
> +}


