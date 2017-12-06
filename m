Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id B469871AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 02:42:53 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id n138so4707840wmg.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Dec 2017 18:42:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7YlLeFLVGoRxEvq4bE35O01U8CpVSBvr22j4pkeSHIc=;
	b=cHk2dhslE/U2CL59fSDciqhKaXZhzL4qaPGZeMh6GfRnB+r/+h8a0VmYqL4U4uIXbD
	9lOK0u+NKmgqx0qxSZVdBaOVe5VNW728F4jpIhyog4iKoMD6ZKhAAwiZxhsYml2NXJOm
	HvP+F9xQpQGJNhIiO773eqcF1cvrnwBGjP4tbipOsvWdkKHpSA5MQRLWe0vb2xdh+IWB
	APiJsI9oVG2OsftjlVQKwm+rvdSFhNqPy3d1u/POpYk7j/ACKZjAfMWSYLcfi5SB0Vec
	lIYVSUDvEDNJQQwyjF9yal4a276N5NSXJH4aSR0/CeCkqm7xlR26uhAxGnz3ra0Tm2Ef
	7wDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7YlLeFLVGoRxEvq4bE35O01U8CpVSBvr22j4pkeSHIc=;
	b=Y4Sce5XVppL3wkSbDzAnmDGwGDvj3ZBYjEPbOqdnxLYLFtYY4rVv0zLbWOscvi8hlV
	yqov0r3lzkLUeYfDLowjdxjkUud38297XIjzXgdN1FGjPqJnJSn85MDyIzLAI8dB0gss
	evLm5fU8LQV/WBXPzEr5KoTDD+Gv4qlCJetpNClBMCP++evJfR0GmOWhn0yKRqYys7tv
	o1eI8g0qYTVinl+xVNRfmXBYQIKXjBNaisVNkgX0X3SV6Co+fyH8xyv0IKKqMzFKLnwJ
	PA3eKU3W5z4MDcaDKKn2w3GBqwrMcr4a0HtReTEDakTt7q2mUeLxWgaLHeJ+dcFBHSRL
	s2PQ==
X-Gm-Message-State: AKGB3mLaQRrNE7lg5QIKNWZQCAxvQR+FNSscynxsogdVh3QeGqZB2Jxd
	2pWY6JI5WlG8GRoJYtH70AXXkLqreke2AItE+Wc=
X-Google-Smtp-Source: AGs4zMZ9Q9T4RpFTzcWXWKx9ZYeU3T9TWzLRBJRQyFLB6lc6I/sPQt0pjvRd30PWLFu6rS4WROkAje4b7oGxOCR/ul0=
X-Received: by 10.28.118.19 with SMTP id r19mr7936430wmc.10.1512528174484;
	Tue, 05 Dec 2017 18:42:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.133.68 with HTTP; Tue, 5 Dec 2017 18:42:53 -0800 (PST)
In-Reply-To: <20171205232727.27430-1-sgw@linux.intel.com>
References: <20171205232727.27430-1-sgw@linux.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 5 Dec 2017 18:42:53 -0800
Message-ID: <CAJ86T=Wt34pxXWNkS59A8Z=nXGgOcDoWu7ePzKRtJ+tXWETQJA@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] image_types: add support for modern f2fs flash filesystem
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
X-List-Received-Date: Wed, 06 Dec 2017 02:42:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Dec 5, 2017 at 3:27 PM, Saul Wold <sgw@linux.intel.com> wrote:
> The f2fs filesystem is a newer flash filesystem that is available in
> meta-filesystems. This needs a minimum sized blank space to operate
> in correctly.
>
> The f2fs has overprovision functionality and when building smaller
> filesystems, you actually need more space, therefore under 500M (or so)
> double the amount of space needed in order to handle the overprovision
> functions in f2fs.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>
> ---
>  meta/classes/image_types.bbclass | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>
> diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
> index d09d1277eaa..aaba1073a08 100644
> --- a/meta/classes/image_types.bbclass
> +++ b/meta/classes/image_types.bbclass
> @@ -218,6 +218,24 @@ IMAGE_CMD_ubi () {
>
>  IMAGE_CMD_ubifs = "mkfs.ubifs -r ${IMAGE_ROOTFS} -o ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.ubifs ${MKUBIFS_ARGS}"
>
> +MKF2FS_ARGS = ""
> +FIX_F2FS_SIZE ?= "524288"
> +IMAGE_CMD_f2fs () {
> +        # We need to add additional smarts here form devices smaller than 1.5G
> +        # Need to scale appropriately between 40M -> 1.5G as the "overprovision
> +        # ratio" goes down as the device gets bigger (70% -> 4.5%), below about
> +        # 500M the standard IMAGE_OVERHEAD_FACTOR does not work, so add additional
> +        # space here when under 500M
> +       size=${ROOTFS_SIZE}
> +       if [ ${size} -lt ${FIX_F2FS_SIZE} ] ; then
> +               size=`expr ${size}*2`
> +               bbwarn "Rootfs size is too small for F2FS. Filesystem will be extended to ${size}K"
> +       fi
> +       dd if=/dev/zero of=${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs count=${size} bs=1024

The equivalent dd command in oe_mkext234fs() creates a sparse file.
Any reason not to do so here (and in IMAGE_CMD_btrfs()) ?

> +       mkfs.f2fs ${MKF2FS_ARGS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> +       sload.f2fs -f ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.f2fs
> +}
> +
>  EXTRA_IMAGECMD = ""
>
>  inherit siteinfo kernel-arch
> @@ -231,6 +249,7 @@ EXTRA_IMAGECMD_ext3 ?= "-i 4096"
>  EXTRA_IMAGECMD_ext4 ?= "-i 4096"
>  EXTRA_IMAGECMD_btrfs ?= "-n 4096"
>  EXTRA_IMAGECMD_elf ?= ""
> +EXTRA_IMAGECMD_f2fs ?= ""

This probably doesn't need to be defined (since IMAGE_CMD_f2fs() uses
MKF2FS_ARGS to pass custom arguments, rather than using EXTRA_IMAGECMD
as the other image commands do) ?

>  do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
>  do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
> @@ -246,6 +265,7 @@ do_image_elf[depends] += "virtual/kernel:do_populate_sysroot mkelfimage-native:d
>  do_image_ubi[depends] += "mtd-utils-native:do_populate_sysroot"
>  do_image_ubifs[depends] += "mtd-utils-native:do_populate_sysroot"
>  do_image_multiubi[depends] += "mtd-utils-native:do_populate_sysroot"
> +do_image_f2fs[depends] += "f2fs-tools-native:do_populate_sysroot"
>
>  # This variable is available to request which values are suitable for IMAGE_FSTYPES
>  IMAGE_TYPES = " \
> @@ -264,6 +284,7 @@ IMAGE_TYPES = " \
>      elf \
>      wic wic.gz wic.bz2 wic.lzma \
>      container \
> +    f2fs \
>  "
>
>  # Compression is a special case of conversion. The old variable
> --
> 2.13.6
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

