Return-Path: <andrea.adami@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by mail.openembedded.org (Postfix) with ESMTP id BBBC560B9B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 23:04:55 +0000 (UTC)
Received: by mail-la0-f43.google.com with SMTP id e16so926984lan.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f8y8YTDwWWQ/B51thM2GIzgmA92NPCeedIqJIgCMdZs=;
	b=eyPZ1OiDOV8EsdxImsXJWvAx3L94ELgShXFaGE+Mx2UxXu7V8tgqxjP57JSeF45/w0
	+eWglZqKSCR2eUCwy6yDjj7Atk2Qda4ascKAhCYUAMUq3f3zNYoHj5c57S+BIOuRRq07
	6eJ71MHJlW7DgONR8R4x3xqJtqERSmFmHN+UYtioYyniO2ZM7nXYnvrVTIQWnYay+mlv
	7MkjMwG2cii+iVO6lCnJA6jHrpp+uL088IZtaDYyp7esssL52s39qLjbBeh5KgzcaO8l
	5b/vspcqXCM0zkntSMZ/EbwQQzy9TCAuvHFOnCCA/UtrWPRLrmqg2fgu78z2pdkTvtQc
	iMog==
MIME-Version: 1.0
X-Received: by 10.112.200.130 with SMTP id js2mr11243145lbc.28.1395788695923; 
	Tue, 25 Mar 2014 16:04:55 -0700 (PDT)
Received: by 10.112.162.100 with HTTP; Tue, 25 Mar 2014 16:04:55 -0700 (PDT)
In-Reply-To: <1395676565-14427-2-git-send-email-jonas.eriksson@enea.com>
References: <1395676565-14427-1-git-send-email-jonas.eriksson@enea.com>
	<1395676565-14427-2-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Mar 2014 00:04:55 +0100
Message-ID: <CAAQYJAvbzVjJkKQ+xZkwMBXtvWQZR-XYnG1Fn56Euj-Dih8_Ow@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: Josep Puigdemont <josep.puigdemont@enea.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] cpio rootfs build: Avoid modifying rootfs dir
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
X-List-Received-Date: Tue, 25 Mar 2014 23:04:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Mar 24, 2014 at 4:56 PM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> The Linux kernel requires that initrd images contain a /init file for
> the image to be used as an initrd, even if it is empty. Adding it into
> the rootfs directory creates a race, that can upset tar when building
> both a .tar and .cpio image file ("tar: .: file changed as we read it").
> Additionally, whether or not the tar file will contain the /init file is
> also up to the race condition.
>
> To avoid this problem, move the /init addition out from the rootfs
> directory, and thus only include it in the .cpio image.
>
> Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> Cc: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>  meta/classes/image_types.bbclass | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 602c1f0..8001025 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -67,10 +67,12 @@ IMAGE_CMD_squashfs-xz = "mksquashfs ${IMAGE_ROOTFS} ${DEPLOY_DIR_IMAGE}/${IMAGE_
>  IMAGE_CMD_tar = "tar -cvf ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.tar -C ${IMAGE_ROOTFS} ."
>
>  IMAGE_CMD_cpio () {
> -       if [ ! -L ${IMAGE_ROOTFS}/init ]; then
> -               touch ${IMAGE_ROOTFS}/init
> -       fi
>         (cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +       if [ ! -e ${IMAGE_ROOTFS}/init ]; then
> +               mkdir -p ${WORKDIR}/cpio_append
> +               touch ${WORKDIR}/cpio_append/init
> +               (cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${DEPLOY_DIR_IMAGE}/${IMAGE_NAME}.rootfs.cpio)
> +       fi
>  }
>
>  ELF_KERNEL ?= "${STAGING_DIR_HOST}/usr/src/kernel/${KERNEL_IMAGETYPE}"
> --
> 1.9.0
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

I admit I did not encounter this race, still I tested the patch
because it caught my attention.

There are some rare cases where init is a symlink pointing to a custom
executable so the previous test was specifically done in order to
avoid to touch a symlink.
I was initially afraid of the change but actually the test is done
after the creation of the cpio so this patch doesn't seem to break our
special case.

Acked-by: Andrea Adami <andrea.adami@gmail.com>

