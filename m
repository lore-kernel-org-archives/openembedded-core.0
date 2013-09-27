Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id B43756CAC8
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 21:06:36 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so2607621lab.4
	for <Openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2013 14:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XRD4duxl0bwTkBsgsUUY6D8KrKxAZvXmsmip3rzb8JU=;
	b=lpbAqiEvWs+Gwiz32XMpG0HwT1JsPK74icgGFEnprSz++J003u9Or7XB1CiywquQRi
	Sb2d0iPkCpubwrxcPTVvYXwKnjsdQskLIZcWd/vinZO5nBYzY9pR69tr551RZQjQ5c58
	fsITLAYNY7FjDbJ8GSg26xSB3nk0iz6Uma1CTTEdQuZfAgfhjQqVRWpWRiGGSKR8+RL7
	S7S8IhPPlcwKICBHx0Y0mRDsCtycoChPktcoEAxrpqvJ9mqyuAc5kL/r89DvnN/u+u6A
	VAdcyZoX9pGKGIGtiEQB3wUX0BJAuMf3i6h4hgvveYCiaKoXfbd/lErghQrpB08N3CCl
	0d5g==
MIME-Version: 1.0
X-Received: by 10.112.146.33 with SMTP id sz1mr10104763lbb.14.1380315997108;
	Fri, 27 Sep 2013 14:06:37 -0700 (PDT)
Received: by 10.112.52.74 with HTTP; Fri, 27 Sep 2013 14:06:37 -0700 (PDT)
In-Reply-To: <1380299019-10777-1-git-send-email-jason.wessel@windriver.com>
References: <1380299019-10777-1-git-send-email-jason.wessel@windriver.com>
Date: Fri, 27 Sep 2013 23:06:37 +0200
Message-ID: <CAAQYJAsFbxdCsOTKRKMk+TMHe2=oAjw4vOaAwKpWMbKfwHHpfg@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: Openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] kernel.bbclass: Allow INITRAMFS_TASK to trigger copy initramfs code
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
X-List-Received-Date: Fri, 27 Sep 2013 21:06:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

Jason,

there is one more problem here:

| DEBUG: Executing shell function do_compile
| Copying initramfs into ./usr ...
| cp: cannot create regular file
'/oe/oe-core/build/tmp-eglibc/work/poodle-oe-linux-gnueabi/linux-yocto-tiny-kexecboot/3.10.11+gitAUTOINC+dad2b7e1ce_e1aa804148-r0/linux-poodle-tiny-build/usr/.':
No such file or directory

I'm solving it this way:

copy_initramfs() {
        echo "Covpying initramfs into ./usr ..."
+        mkdir -p ${B}/usr
        # Find and use the first initramfs image archive type we find


Please take care of this.
Thanks

Andrea




On Fri, Sep 27, 2013 at 6:23 PM, Jason Wessel
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
> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
> ---
>  meta/classes/kernel.bbclass |    6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index 8cf66ce..73c525f 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -156,6 +156,12 @@ kernel_do_compile() {
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

