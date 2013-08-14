Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 91FCF61220
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:32:29 +0000 (UTC)
Received: by mail-la0-f48.google.com with SMTP id er20so542841lab.21
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 08:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qZXQam0lDLpnK/uAmPX1tXztqj5/uF+Ej4fJ0RVpsvI=;
	b=RRrYzW9tSVESLDeV7O3OMFnmCKzT+YXa5HtZ9KXDzkW4HxMPHuNpaUib3xzyztJY4A
	iGVtVN1i15KTMsgpIppD4LodFc08BCxRD4ou1CoIafqdB0C/p6k4x1GBUlL7DNBQS6tw
	rd1EFycsfq2GuEMYZQNa57ZLsX2W+PoXTL4jIyJgTWaNqGZwAcQ3buIYp/bgpa4YCkV/
	tT/Hu0/DWwX2umKmQxeOdpU9SrwhHSULBi7eEFHehww4FgCr81yxfPDbnDXphjXy/l73
	A+GqI11JJPeCGHKE8JJEa9QcqdtvBJ8+LpySD3hG8NK5ZDoOvd1QpetS45h+k1V/lpDy
	fQsQ==
MIME-Version: 1.0
X-Received: by 10.152.29.103 with SMTP id j7mr8856980lah.7.1376494349649; Wed,
	14 Aug 2013 08:32:29 -0700 (PDT)
Received: by 10.112.158.229 with HTTP; Wed, 14 Aug 2013 08:32:29 -0700 (PDT)
In-Reply-To: <1376494338-11646-1-git-send-email-fcooper@ti.com>
References: <1376494338-11646-1-git-send-email-fcooper@ti.com>
Date: Wed, 14 Aug 2013 11:32:29 -0400
Message-ID: <CADkTA4OcJ1Une4FHwWUscXVuPi+xfewxn6+2ze9DjbOkQVsqcQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Create symbolic link to add ${KERNEL_IMAGETYPE} to boot package
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
X-List-Received-Date: Wed, 14 Aug 2013 15:32:30 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 11:32 AM, Franklin S. Cooper Jr <fcooper@ti.com> wrote:
> * By default for some platforms U-boot assumes the kernel image is located in
>   the boot directory of the root filesystem.
> * The kernel.bbclass already includes the kernel image in the /boot directory
>   but adds a version number to the file name.
> * Create a symbolic link that names the kernel image in the exact way that
>   U-boot expects.

I swear I've seen this change before, but my grep didn't return a hit ..

>
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta/classes/kernel.bbclass |    1 +
>  1 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index e039dfc..248ee71 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -109,6 +109,7 @@ kernel_do_install() {
>         install -d ${D}/${KERNEL_IMAGEDEST}
>         install -d ${D}/boot
>         install -m 0644 ${KERNEL_OUTPUT} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION}
> +       ln      -s ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${D}/${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE}

This should probably be -sf, to match the rest of the linking in the file.

Bruce

>         install -m 0644 System.map ${D}/boot/System.map-${KERNEL_VERSION}
>         install -m 0644 .config ${D}/boot/config-${KERNEL_VERSION}
>         install -m 0644 vmlinux ${D}/boot/vmlinux-${KERNEL_VERSION}
> --
> 1.7.0.4
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

