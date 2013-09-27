Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4CE8E61005
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 21:42:18 +0000 (UTC)
Received: by mail-la0-f44.google.com with SMTP id eo20so2694630lab.3
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=PKMn1qYeMy1fJB4bablSMNDcObgvbWpf9QZ++k2MX2U=;
	b=bbuR/jXzbrM998/NerQb/L0Vs+2qeM3JjZM7JIRhOt5Vrs6npj0KKDHsrwF7VOThTZ
	myjMnXTBx3ARkWHIOZ88YNf7fRPQt7mYbwuT67w6aJnsPbY/qyIlpBS+IhopHvQOOVHR
	8SUPa8sGhL2dffjs4NVIPgLOybFZAqnhPZmM8bOjzOvGDY5Xxjngq4R/eHXUwQpLR7Q/
	J6Bn4CVqRLnQxd8KktfUvNuJIzU06STME7uXU1NTkUzLVBKXso/rS5QcTroIlnKCqVQm
	ORLrzDVqvgqb9zkRgjdimQ5/TEi83apNhJAGXs5u/JpqUQmfZ2s/Oomdgg+LMVfqT8wk
	ZrjQ==
MIME-Version: 1.0
X-Received: by 10.112.155.39 with SMTP id vt7mr10194109lbb.29.1380318139128;
	Fri, 27 Sep 2013 14:42:19 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Fri, 27 Sep 2013 14:42:19 -0700 (PDT)
In-Reply-To: <1380317520-2111-1-git-send-email-jason.wessel@windriver.com>
References: <1380317520-2111-1-git-send-email-jason.wessel@windriver.com>
Date: Fri, 27 Sep 2013 23:42:19 +0200
Message-ID: <CAAQYJAtmM7N3jtuzv4NMpJjUYNOZLnWqWvzcPA3PcjbvP18Uzw@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [v2 PATCH] kernel.bbclass: Allow INITRAMFS_TASK to trigger copy initramfs code
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
X-List-Received-Date: Fri, 27 Sep 2013 21:42:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Sep 27, 2013 at 11:32 PM, Jason Wessel
<jason.wessel@windriver.com> wrote:
> Activating the INITRAMFS_TASK can cause circular dependencies, but
> that is up to the end user to resolve in recipes.  The INITRAMFS_TASK
> should also trigger immediate linking of the cpio task in the first
> compile pass.  This was a subtle regression introduced by: 609d5a9ab
> (kernel.bbclass, image.bbclass: Implement kernel INITRAMFS dependency
> and bundling).
>
> This patch restores the previous behavior and only affects the
> INITRAMFS_TASK which is not set by any of the default build profiles
> in oe-core.
>
> Reviewed-by: Andrea Adami <andrea.adami@gmail.com>
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/kernel.bbclass |    8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8cf66ce..4acfb7e 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -83,6 +83,8 @@ KERNEL_IMAGETYPE_FOR_MAKE = "${@(lambda s: s[:-3] if s[-3:] == ".gz" else s)(d.g
>
>  copy_initramfs() {
>         echo "Copying initramfs into ./usr ..."
> +       # In case the directory is not created yet from the first pass compile:
> +       mkdir -p ${B}/usr
>         # Find and use the first initramfs image archive type we find
>         rm -f ${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
>         for img in cpio.gz cpio.lzo cpio.lzma cpio.xz; do
> @@ -156,6 +158,12 @@ kernel_do_compile() {
>         # different initramfs image.  The way to do that in the kernel
>         # is to specify:
>         # make ...args... CONFIG_INITRAMFS_SOURCE=some_other_initramfs.cpio
> +       if [ "$use_alternate_initrd" = "" ] && [ "${INITRAMFS_TASK}" != "" ] ; then
> +               # The old style way of copying an prebuilt image and building it
> +               # is turned on via INTIRAMFS_TASK != ""
> +               copy_initramfs
> +               use_alternate_initrd=CONFIG_INITRAMFS_SOURCE=${B}/usr/${INITRAMFS_IMAGE}-${MACHINE}.cpio
> +       fi
>         oe_runmake ${KERNEL_IMAGETYPE_FOR_MAKE} ${KERNEL_ALT_IMAGETYPE} CC="${KERNEL_CC}" LD="${KERNEL_LD}" ${KERNEL_EXTRA_ARGS} $use_alternate_initrd
>         if test "${KERNEL_IMAGETYPE_FOR_MAKE}.gz" = "${KERNEL_IMAGETYPE}"; then
>                 gzip -9c < "${KERNEL_IMAGETYPE_FOR_MAKE}" > "${KERNEL_OUTPUT}"
> --
> 1.7.9.5
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

Thanks

Tested by: Andrea Adami <andrea.adami@gmail.com>
Acked by: Andrea Adami <andrea.adami@gmail.com>

