Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 2BD4477DB1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Aug 2017 18:06:50 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y43so4975725wrd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Aug 2017 11:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pbQ/IhzF2+X4HdNKdLXoB+nv/SOoB6GHrloH9jCc2BY=;
	b=R4Ip8D7GS+JOCNBDTuD0Z08kQq9+U183aC2VOXybDYGMP+ZDSWGCxTNyNOZbhN2Cy8
	0dPrEKFrFsy0zCtaK1RMs0e6w89FNAu33OR1c1S59C02GJEZcZslm5g06rsl+Y05cG9H
	KQAyf68Y4FyOnEbxt5E4HdRiqD8J1WxRAMRNpA74vzgFqVDUJnQPc7uB7gnSdi3KlGRg
	gr/dOoBujv9Qtj74MQsg6Uco2Cu+G53x5xsAj6OQ1Inm59wZSsTSrnOmns5lTlf0Dk6Y
	emcThOC3AdpG5cGdcqrSmFpPrQNHWzYBKGb+wT4xM5euho/rgJ8OIe1sYJtj8WsGuRJo
	UmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pbQ/IhzF2+X4HdNKdLXoB+nv/SOoB6GHrloH9jCc2BY=;
	b=iEoH78wN7zQXymNCm7UE2O2GcEsp8iVWvzpftK38kPn5+rjKLZdPX/tYN5e/vDdnvu
	kuYBUs+MlowfPTZV5egvPez7UaEXePAV3KfWt0mSb6SuHZeKzmfihZe0N//3Qn7AEbxU
	TEd4zOvMMLeGLiLEqRddBh9om3cJFBezrhTERcshzFfmPpoqaJB+EFX6GZYHiXVwognG
	lFE3q/9+qQDBtVtR/MqOt/jBfc84LefHXkvj5wj4p/8ZxNCTHoqeHrJEQWVPA/4xqoG5
	0RRvXgvZiB9hoKsLmJEVlRFSJ0vuG38dhvD/7tHvlcMX94mY72KILhE+3Z2H2yN9vu4m
	mvQg==
X-Gm-Message-State: AHYfb5jDrzQtYcQQXgymmGe8zp+hIjCC0ScrBAFg9WfJUjzGwLHlXt03
	loQ3VVsYVqcuZUKtnshzSK0UqpQJUQ==
X-Received: by 10.223.179.211 with SMTP id x19mr6272425wrd.7.1502302011695;
	Wed, 09 Aug 2017 11:06:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Wed, 9 Aug 2017 11:06:51 -0700 (PDT)
In-Reply-To: <1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 9 Aug 2017 11:06:51 -0700
Message-ID: <CAJ86T=Ud6Yh6m6+=n6DNaOm06fU+fc0L6ZhAoA32dDNSpTfWxg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/11] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Wed, 09 Aug 2017 18:06:51 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 9, 2017 at 10:48 AM, Juro Bystricky
<juro.bystricky@intel.com> wrote:
> This patch helps to build cpio images that are binary reproducible.
> The changes are as follows:
>
> 1. By default, cpio from the host is used, which can be quite old.
>    Hence we need to implement a way to use/call cpio-native, which supports
>    new features needed for binary reproducibility, notably the arguments
>    such as "--reproducible" and "--ignore-devno".
>    This can be achieved by specifying the following (in local.conf):

Is it useful to keep the option using cpio from the host? Why not
always use cpio-native?

>    do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
>    EXTRANATIVEPATH += "cpio-native"
>
> 2. Provide a way to pass custom arguments to cpio. This is done via
>    a new variable IMAGE_CMD_CPIO. For binary reproducible cpio archives
>    one needs to set (in local.conf)
>
>    IMAGE_CMD_CPIO = "cpio --ignore-devno --reproducible "
>
> 3. A symlink is created as part of the image. Here we make sure it gets the
>    timestamps (mtime) based on the timestamp of the symlink target, rather than
>    the timestamp corresponding to the build time.
>
> Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
> ---
>  meta/classes/image_types.bbclass | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index e0368c7..50d0c07 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -122,9 +122,17 @@ IMAGE_CMD_TAR ?= "tar"
>  # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
>  IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
>
> +# By default, cpio from the host is used, which can be quite old. If
> +# you need special parameters (like --ignore-devno --reproducible) which are only
> +# supported by GNU cpio upstream >= 2.12, then override that default:
> +# IMAGE_CMD_CPIO = "cpio --ignore-devno"
> +# do_image_cpio[depends] += "cpio-replacement-native:do_populate_sysroot"
> +# EXTRANATIVEPATH += "cpio-native"
> +
> +IMAGE_CMD_CPIO ?= "cpio"
>  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>  IMAGE_CMD_cpio () {
> -       (cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +       (cd ${IMAGE_ROOTFS} && find . | ${IMAGE_CMD_CPIO} -o -H newc -v >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>         # We only need the /init symlink if we're building the real
>         # image. The -dbg image doesn't need it! By being clever
>         # about this we also avoid 'touch' below failing, as it
> @@ -134,10 +142,12 @@ IMAGE_CMD_cpio () {
>                 if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e ${IMAGE_ROOTFS}/init ]; then
>                         if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e ${IMAGE_ROOTFS}/sbin/init ]; then
>                                 ln -sf /sbin/init ${WORKDIR}/cpio_append/init
> +                               # improve reproducibility: set the link mtime to be the same as the target
> +                               touch -h -r ${IMAGE_ROOTFS}/sbin/init ${WORKDIR}/cpio_append/init
>                         else
>                                 touch ${WORKDIR}/cpio_append/init
>                         fi
> -                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
> +                       (cd  ${WORKDIR}/cpio_append && echo ./init | ${IMAGE_CMD_CPIO} -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>                 fi
>         fi
>  }
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

