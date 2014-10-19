Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id AB45F60673
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 22:08:57 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id q1so2984325lam.32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Oct 2014 15:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L8WVEFyv/6fc0k2TDQ22GSxApPTQky/otQR6dgjJ7q0=;
	b=1I6DZQz1qplbqisKjJhGR1aq/Jz6LceU9Cw+MMxT/2it7KVvLgJ1VV8AlNW3vAlwtk
	Q8hzhvdSdOY23F90YeIf6cztv3i/twt4ci0H50up/HNgap+QlIDBqwC8hOHoo+T/AfEb
	v8PJ8BHmmkbBey6KYj8kkfKrZ0oRbVUMhPHdowKEdhlmn9/KxztReuPPwwEa2NTWUIyH
	A0Ml/BzuQLT4ZNvAUSmkbaGKkDX8UZTS/ethBgWC9N+Foc5/eEhTpdkz1sQzzg6sEntN
	cGOCaEVXphLejgFAvEpqolNXBXSkUhLV/KdkFnXIJbJPpINJmAG6wDN5FaDELmUA+EGG
	Pd2w==
MIME-Version: 1.0
X-Received: by 10.112.130.41 with SMTP id ob9mr22868638lbb.74.1413756537411;
	Sun, 19 Oct 2014 15:08:57 -0700 (PDT)
Received: by 10.112.4.168 with HTTP; Sun, 19 Oct 2014 15:08:57 -0700 (PDT)
In-Reply-To: <1413746147-7120-5-git-send-email-marex@denx.de>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
Date: Sun, 19 Oct 2014 18:08:57 -0400
Message-ID: <CADkTA4PhjW0vDu2tDW+FzBvOSLf7YSO7Zzzr3T2XGaZMs1k5hw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Marek Vasut <marex@denx.de>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 19 Oct 2014 22:09:02 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Oct 19, 2014 at 3:15 PM, Marek Vasut <marex@denx.de> wrote:
> Pull the uImage image format generation from kernel.bbclass into
> a separate kernel-uimage.bbclass. The recipes which now need to
> generate an uImage will have to inherit kernel-uimage instead of
> kernel class.

The commit log doesn't tell us why. What's the benefit or functionality we gain
via the change ?

Bruce

>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Koen Kooi <koen@dominion.thruhere.net>
> Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/classes/kernel-uimage.bbclass | 44 +++++++++++++++++++++++++++++++++++++
>  meta/classes/kernel.bbclass        | 45 --------------------------------------
>  2 files changed, 44 insertions(+), 45 deletions(-)
>  create mode 100644 meta/classes/kernel-uimage.bbclass
>
> diff --git a/meta/classes/kernel-uimage.bbclass b/meta/classes/kernel-uimage.bbclass
> new file mode 100644
> index 0000000..f51321b
> --- /dev/null
> +++ b/meta/classes/kernel-uimage.bbclass
> @@ -0,0 +1,44 @@
> +inherit kernel
> +
> +DEPENDS += " u-boot-mkimage-native "
> +
> +uboot_prep_kimage() {
> +       if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> +               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> +               linux_suffix=""
> +               linux_comp="none"
> +       else
> +               vmlinux_path="vmlinux"
> +               linux_suffix=".gz"
> +               linux_comp="gzip"
> +       fi
> +
> +       ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
> +
> +       if [ "${linux_comp}" != "none" ] ; then
> +               rm -f linux.bin
> +               gzip -9 linux.bin
> +               mv -f "linux.bin${linux_suffix}" linux.bin
> +       fi
> +
> +       echo "${linux_comp}"
> +}
> +
> +do_uboot_mkimage() {
> +       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> +               if test "x${KEEPUIMAGE}" != "xyes" ; then
> +                       uboot_prep_kimage
> +
> +                       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> +                       if test -n "${UBOOT_ENTRYSYMBOL}"; then
> +                               ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> +                                       awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> +                       fi
> +
> +                       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> +                       rm -f linux.bin
> +               fi
> +       fi
> +}
> +
> +addtask uboot_mkimage before do_install after do_compile
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index ec4d930..f3ba19c 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -15,10 +15,6 @@ python __anonymous () {
>      import re
>
>      kerneltype = d.getVar('KERNEL_IMAGETYPE', True)
> -    if kerneltype == 'uImage':
> -        depends = d.getVar("DEPENDS", True)
> -        depends = "%s u-boot-mkimage-native" % depends
> -        d.setVar("DEPENDS", depends)
>
>      d.setVar("KERNEL_IMAGETYPE_FOR_MAKE", re.sub(r'\.[^\.]$', '', kerneltype))
>
> @@ -448,47 +444,6 @@ MODULE_TARBALL_BASE_NAME ?= "${MODULE_IMAGE_BASE_NAME}.tgz"
>  MODULE_TARBALL_SYMLINK_NAME ?= "modules-${MACHINE}.tgz"
>  MODULE_TARBALL_DEPLOY ?= "1"
>
> -uboot_prep_kimage() {
> -       if test -e arch/${ARCH}/boot/compressed/vmlinux ; then
> -               vmlinux_path="arch/${ARCH}/boot/compressed/vmlinux"
> -               linux_suffix=""
> -               linux_comp="none"
> -       else
> -               vmlinux_path="vmlinux"
> -               linux_suffix=".gz"
> -               linux_comp="gzip"
> -       fi
> -
> -       ${OBJCOPY} -O binary -R .note -R .comment -S "${vmlinux_path}" linux.bin
> -
> -       if [ "${linux_comp}" != "none" ] ; then
> -               rm -f linux.bin
> -               gzip -9 linux.bin
> -               mv -f "linux.bin${linux_suffix}" linux.bin
> -       fi
> -
> -       echo "${linux_comp}"
> -}
> -
> -do_uboot_mkimage() {
> -       if test "x${KERNEL_IMAGETYPE}" = "xuImage" ; then
> -               if test "x${KEEPUIMAGE}" != "xyes" ; then
> -                       uboot_prep_kimage
> -
> -                       ENTRYPOINT=${UBOOT_ENTRYPOINT}
> -                       if test -n "${UBOOT_ENTRYSYMBOL}"; then
> -                               ENTRYPOINT=`${HOST_PREFIX}nm ${S}/vmlinux | \
> -                                       awk '$3=="${UBOOT_ENTRYSYMBOL}" {print $1}'`
> -                       fi
> -
> -                       uboot-mkimage -A ${UBOOT_ARCH} -O linux -T kernel -C "${linux_comp}" -a ${UBOOT_LOADADDRESS} -e $ENTRYPOINT -n "${DISTRO_NAME}/${PV}/${MACHINE}" -d linux.bin arch/${ARCH}/boot/uImage
> -                       rm -f linux.bin
> -               fi
> -       fi
> -}
> -
> -addtask uboot_mkimage before do_install after do_compile
> -
>  kernel_do_deploy() {
>         install -m 0644 ${KERNEL_OUTPUT} ${DEPLOYDIR}/${KERNEL_IMAGE_BASE_NAME}.bin
>         if [ ${MODULE_TARBALL_DEPLOY} = "1" ] && (grep -q -i -e '^CONFIG_MODULES=y$' .config); then
> --
> 2.1.1
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

