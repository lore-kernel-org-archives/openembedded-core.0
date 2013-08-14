Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id F17CE60017
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 15:25:14 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id eh20so533885lab.18
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Aug 2013 08:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=4PSvNykbF2BgwgtVEOTu3vRUtAs10rj/gj0ouSVUOiE=;
	b=w+pIll3rREogaoL7BrxdztwRZXWzoyav/RXiSZlqTvHmlpEPvUEeE9QbDm59T2FbQW
	U0jfv+ihlo4unzxnMtw30p9gn3Em2/zQ5DOhzScGOspg6N+Y4GqMXqR9vt6XMpAn/9V8
	FS0egI+DD2XtjDwCIiDatAeIu1YPY9u2hJ7LEntdO1KORYR1+JsccEyF+pfKMMPJpuxF
	dCgRlylPcZqDHG+PW9o0a8K2oeN3vl+AxvKRPSTalePeGnJulb//nN0pGHd/FAfgm18L
	pfPjehk53GicT5CrN9qpE3YKki8EPtaFRTeDFz7yFS/ZeLNecwy6cXyhNkjgkllq6RRF
	eYHQ==
MIME-Version: 1.0
X-Received: by 10.112.18.130 with SMTP id w2mr722164lbd.51.1376493914978; Wed,
	14 Aug 2013 08:25:14 -0700 (PDT)
Received: by 10.112.158.229 with HTTP; Wed, 14 Aug 2013 08:25:14 -0700 (PDT)
In-Reply-To: <1376494338-11646-2-git-send-email-fcooper@ti.com>
References: <1376494338-11646-1-git-send-email-fcooper@ti.com>
	<1376494338-11646-2-git-send-email-fcooper@ti.com>
Date: Wed, 14 Aug 2013 11:25:14 -0400
Message-ID: <CADkTA4M3MDkpPuZ2kEq6Uz-RfGyDLBUNK0npsxCB=is8M9JMYQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-dtb.inc: Run dts through the preprocessor
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
X-List-Received-Date: Wed, 14 Aug 2013 15:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 14, 2013 at 11:32 AM, Franklin S. Cooper Jr <fcooper@ti.com> wrote:
> * In the 3.11 kernel some dts files now include C code that must first run
>   through the preprocessor.
> * Update building the dtb by first running the dts file through the user's
>   compiler before building using the device tree compiler.
> * The logic used is based on mainline u-boot dts/Makefile.

We are already working through a change from Otavio that changes the way we
build DTB files, using the in kernel resources.

So this shouldn't be required in the end, or at least heavily modified.

So I suggest we hold on this change for now, and rebase it once the
patch I mentioned
is merged.

Bruce

>
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  meta/recipes-kernel/linux/linux-dtb.inc |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-dtb.inc b/meta/recipes-kernel/linux/linux-dtb.inc
> index 41dd599..f1aafa2 100644
> --- a/meta/recipes-kernel/linux/linux-dtb.inc
> +++ b/meta/recipes-kernel/linux/linux-dtb.inc
> @@ -21,7 +21,10 @@ do_install_append() {
>                         DTS_BASE_NAME=`basename ${DTS_FILE} | awk -F "." '{print $1}'`
>                         DTB_NAME=`echo ${KERNEL_IMAGE_BASE_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
>                         DTB_SYMLINK_NAME=`echo ${KERNEL_IMAGE_SYMLINK_NAME} | sed "s/${MACHINE}/${DTS_BASE_NAME}/g"`
> -                       dtc -I dts -O dtb ${KERNEL_DEVICETREE_FLAGS} -o ${DTS_BASE_NAME} ${DTS_FILE}
> +
> +                       cat ${DTS_FILE} | \
> +                               ${CPP} -x assembler-with-cpp -I ./include/ -I ./arch/${ARCH}/boot/dts - | \
> +                               dtc ${KERNEL_DEVICETREE_FLAGS} -O dtb -o ${DTS_BASE_NAME} -i arch/${ARCH}/boot/dts/ -
>                         install -m 0644 ${DTS_BASE_NAME} ${D}/${KERNEL_IMAGEDEST}/devicetree-${DTB_SYMLINK_NAME}.dtb
>                 done
>         fi
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

