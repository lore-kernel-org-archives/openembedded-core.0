Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id D23006D8BF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 15:07:03 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id n7so4287895lam.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 07:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fTx0EM4Sq90OMv+I2gIKJv4BosOb6CaOe8g32JOsbU8=;
	b=g0IO8u0G8QJgK5pkgq7T+VMWCx80YRJMU2YdG300h7qK71mis9OiNCic9ux1+lIflz
	fZD9n1sycLfBODCchU5NeaPID1CwXc9dGf3Evzfk0HIlORgGtWbBwQwavV7unv5kE3cV
	D2359C8Bhqh0g2QQlhLjfmrXVypjre/FV6odmSHo17ZAUkT7YdG6QvP7CJ2hRvqv5rIC
	AV3qQQOLhXqodI3xoU9aH3xPho8+H5xG/qTbdXXNygZAOSz7tmU0uaZev+ToCB9+UKRy
	JWx9NlOcjppkpYCCsxaVmZlXdBqbmn8NZRlgSeD/DBmEn6XXF8mM+z/XF19LMYEDD9pY
	Vbmg==
MIME-Version: 1.0
X-Received: by 10.152.29.65 with SMTP id i1mr32838lah.77.1384268824823; Tue,
	12 Nov 2013 07:07:04 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Tue, 12 Nov 2013 07:07:04 -0800 (PST)
In-Reply-To: <1384244230-30541-1-git-send-email-ming.liu@windriver.com>
References: <1384244230-30541-1-git-send-email-ming.liu@windriver.com>
Date: Tue, 12 Nov 2013 10:07:04 -0500
Message-ID: <CADkTA4OqaxJyRp-T298LG-Jm36tUNkZXvKawoWGtKOCETARTvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Ming Liu <ming.liu@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: handles symbolic KERNEL_OUTPUT in bundle_initramfs task
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
X-List-Received-Date: Tue, 12 Nov 2013 15:07:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Nov 12, 2013 at 3:17 AM, Ming Liu <ming.liu@windriver.com> wrote:
> In many cases, KERNEL_OUTPUT is a symbolic link to the real bootable image,
> but in bundle_initramfs task, it's not considered so that the KERNEL_OUTPUT
> is being renamed/restored as a regular file, this leads it finally point to
> a incorrect target, or even worse, break the bundle_initramfs task for
> KERNEL_OUTPUT is not going to be regenerated in case it is a symbolic link
> to vmlinux.
>
> Also, we need move bundle_initramfs after kernel_link_vmlinux.
>
> Signed-off-by: Ming Liu <ming.liu@windriver.com>
> ---
>  meta/classes/kernel.bbclass | 24 ++++++++++++++++++++----
>  1 file changed, 20 insertions(+), 4 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index a4db9f5..2ec09ae 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -123,13 +123,29 @@ do_bundle_initramfs () {
>         if [ ! -z "${INITRAMFS_IMAGE}" -a x"${INITRAMFS_IMAGE_BUNDLE}" = x1 ]; then
>                 echo "Creating a kernel image with a bundled initramfs..."
>                 copy_initramfs
> -               if [ -e ${KERNEL_OUTPUT} ] ; then
> +               # Backuping kernel image relies on its type(regular file or symbolic link)
> +               linkpath=""
> +               realpath=""
> +               if [ -h ${KERNEL_OUTPUT} ] ; then
> +                       linkpath=`readlink -n ${KERNEL_OUTPUT}`
> +                       realpath=`readlink -fn ${KERNEL_OUTPUT}`
> +                       mv -f $realpath $realpath.bak
> +               elif [ -f ${KERNEL_OUTPUT} ]; then
>                         mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.bak
>                 fi
>                 use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>                 kernel_do_compile
> -               mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
> -               mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> +               # Restoring kernel image
> +               if [ ! -z $realpath ]; then

Why not  if [ -n "$realpath" ] ? I always find that reads easier.

> +                       mv -f $realpath $realpath.initramfs
> +                       mv -f $realpath.bak $realpath
> +                       cd ${B}/$(dirname ${KERNEL_OUTPUT})
> +                       ln -sf $linkpath
> +                       ln -sf $linkpath.initramfs

Won't the links just follow .. they are symbolic after all. Since things are
being put back in place. Or are the names changing underneath ?

> +               else
> +                       mv -f ${KERNEL_OUTPUT} ${KERNEL_OUTPUT}.initramfs
> +                       mv -f ${KERNEL_OUTPUT}.bak ${KERNEL_OUTPUT}
> +               fi
>                 # Update install area
>                 echo "There is kernel image bundled with initramfs: ${B}/${KERNEL_OUTPUT}.initramfs"
>                 install -m 0644 ${B}/${KERNEL_OUTPUT}.initramfs ${D}/boot/${KERNEL_IMAGETYPE}-initramfs-${MACHINE}.bin
> @@ -152,7 +168,7 @@ python do_devshell_prepend () {
>      os.environ["LDFLAGS"] = ''
>  }
>
> -addtask bundle_initramfs after do_compile before do_build
> +addtask bundle_initramfs after do_kernel_link_vmlinux before do_build

This isn't explained in the commit log.

Bruce

>
>  kernel_do_compile() {
>         unset CFLAGS CPPFLAGS CXXFLAGS LDFLAGS MACHINE
> --
> 1.8.4.1
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

