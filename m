Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f65.google.com (mail-vk0-f65.google.com
	[209.85.213.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5148E74B14
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 21:56:26 +0000 (UTC)
Received: by mail-vk0-f65.google.com with SMTP id q189-v6so1993300vkb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 May 2018 14:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0aXaNioqd788haZ9IQeFEmiH8wp7Bx/0tgxF+dEaLm4=;
	b=ZsgoU2C8qJpDFV+881EDiE2xP0FpkCt2spYQCkA58Q29y9gozZcP3hZ2f7dZ4Gmnjm
	m3b6Sf+PUzxiukrj07HweDx0ixIVv37KotrioW/XXu0828y5JercIYlxx6VZu3jAjBXN
	YlcTnSExhqUcj0s/5b16hdz8kUx/3EODdOx48sHeClyeJFi7p+MAfSDyFb3ranXvlmgq
	ohY6vHtGCDhroBqkKksC6ViZbGkkBCbhB8i8um/6HE0Fjgjg899OhyEZBM6a44d6pLUf
	IT/vH69uWXZlXd8XWeAU9ESrhRK3pe9hJU/tcO8/hE+0GrYFA69GWN79W68esP/EraHE
	oimQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0aXaNioqd788haZ9IQeFEmiH8wp7Bx/0tgxF+dEaLm4=;
	b=kflctwlvUPl5ifcS5QlIy4Ean/lg6VLc1Zy6hLSv0kvgx8wAI+uFEiPFoek7JxEWza
	QFnbsNkDLx7lwKn2OHINgQn9qCUP7mBQwhITwCa1z66pyMgwvKJNC7a4jc/UWKEIVcrv
	wSjZPJONBl0oTSjfL/I4Cp+ukUHOQBl2BQlCchSt6alMOkzk7kuaIdZDIb6KaskNgMLR
	WUyzN4s+Or9U8klq82MWp7QpmjyhSSQEW8ASeiV4gwM/JFUQTrcpsPK6z9N1T9MYicmj
	t6xRF80pHqepZuiZRGpPHBdBwV5bzgyb3AJBazhXBbdmonEnTLfvxEPCrDJmYdfbl1cv
	AJHg==
X-Gm-Message-State: ALKqPwd0BawQ0zjEznZi+FUZE+9sALLC4c2P8DGG4D2VjcfG/Zkc0oxC
	xDo+ASZAkJFMTh6gd1l+v4u2tpVs9lGp2M/A+iM=
X-Google-Smtp-Source: AB8JxZpd38BZIBMqGKp/2yzmHaJyXx/ws2T9tSCoA3dgccvs+kPUmapqEI30NMGx8UL6OYjA5ko9bea2o5xKD5y1AtM=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr5443456vkv.174.1527198987810; 
	Thu, 24 May 2018 14:56:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:3094:0:0:0:0:0 with HTTP; Thu, 24 May 2018 14:56:27
	-0700 (PDT)
In-Reply-To: <20180524212755.3124-1-kamel.hacene@smile.fr>
References: <20180524212755.3124-1-kamel.hacene@smile.fr>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 24 May 2018 14:56:27 -0700
Message-ID: <CAJ86T=X79s63TYMp98zCmTtkbzb7bEYgftrkLDaxFgTkmJa5vg@mail.gmail.com>
To: Kamel Hacene <kamel.hacene@smile.fr>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: improve reproducibility of .cpio files.
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
X-List-Received-Date: Thu, 24 May 2018 21:56:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 24, 2018 at 2:27 PM, Kamel Hacene <kamel.hacene@smile.fr> wrote:
> When BUILD_REPRODUCIBLE_BINARIES is set, run cpio command with the
> --reproducible flag and set the timestamp of the created /init file to
> REPRODUCIBLE_TIMESTAMP_ROOTFS in accordance with reproducible_final_image_task
> in image.bbclass.
>
> Signed-off-by: Kamel Hacene <kamel.hacene@smile.fr>
> ---
>  meta/classes/image_types.bbclass | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index 00a00d318f..345dba5358 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -127,9 +127,16 @@ IMAGE_CMD_TAR ?= "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
>  IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>
> +# Extra options given to the cpio command
> +CPIO_EXTRA_OPTS ?= ""
> +CPIO_EXTRA_OPTS += "${@'--reproducible' if d.getVar('BUILD_REPRODUCIBLE_BINARIES') == '1' else ''}"
>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>  IMAGE_CMD_cpio () {
> -       (cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +       # Ensure cpio provides --reproducible option if generating a reproducible binary
> +       if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ] && ! cpio --help | grep -q "\-\-reproducible"; then
> +               bbfatal "cpio v2.12 or higher is required to generate a reproducible binary. Upgrade your host's cpio command or use oe's cpio recipe by adding a depend to cpio-native in your image."

If the host version of cpio can't be relied on it would be better to
make use of cpio-native.

> +       fi
> +       (cd ${IMAGE_ROOTFS} && find . | cpio ${CPIO_EXTRA_OPTS} -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>         # We only need the /init symlink if we're building the real
>         # image. The -dbg image doesn't need it! By being clever
>         # about this we also avoid 'touch' below failing, as it
> @@ -142,7 +149,10 @@ IMAGE_CMD_cpio () {
>                         else
>                                 touch ${WORKDIR}/cpio_append/init
>                         fi
> -                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +                       if [ "$BUILD_REPRODUCIBLE_BINARIES" = "1" ]; then
> +                               touch --no-dereference --date=@${REPRODUCIBLE_TIMESTAMP_ROOTFS} ${WORKDIR}/cpio_append/init
> +                       fi
> +                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio ${CPIO_EXTRA_OPTS} -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>                 fi
>         fi
>  }
> --
> 2.16.2
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

