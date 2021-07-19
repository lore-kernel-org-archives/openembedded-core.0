Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.25103.1626680855400358113
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Jul 2021 00:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: alexandre.belloni@bootlin.com)
Received: (Authenticated sender: alexandre.belloni@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4F83120004;
	Mon, 19 Jul 2021 07:47:33 +0000 (UTC)
Date: Mon, 19 Jul 2021 09:47:33 +0200
From: "Alexandre Belloni" <alexandre.belloni@bootlin.com>
To: Ross Burton <ross@burtonini.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] image_types_wic: pass --debug for verbose logs
Message-ID: <YPUuFUhKwP9YY5PQ@piout.net>
References: <20210715143257.4050923-1-ross.burton@arm.com>
MIME-Version: 1.0
In-Reply-To: <20210715143257.4050923-1-ross.burton@arm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Ross,

On 15/07/2021 15:32:57+0100, Ross Burton wrote:
> The output goes to a log file, so having more information is useful for debugging.
> 

This took me a while to bisect and you are going to love that, this is
causing oe-selftest failures:

ERROR: Task (/home/pokybuild/yocto-worker/oe-selftest-debian/build/meta/recipes-core/images/core-image-minimal.bb:do_image_wic) failed with exit code '1' 
Pseudo log:
Setup complete, sending SIGUSR1 to pid 45400.
path mismatch [2 links]: ino 51906351 db '/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-47887/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/bin/cpio' req '/home/pokybuild/yocto-worker/oe-selftest-debian/build/build-st-47887/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tmp-wic/rootfs1/bin/cpio'.

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/2296/steps/14/logs/stdio

path mismatch [2 links]: ino 431231414 db '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-932813/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/sbin/killall5' req '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-932813/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tmp-wic/rootfs1/sbin/killall5'.

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2321/steps/14/logs/stdio

path mismatch [2 links]: ino 175906237 db '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-44531/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/sbin/runlevel' req '/home/pokybuild/yocto-worker/oe-selftest-centos/build/build-st-44531/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tmp-wic/rootfs1/sbin/runlevel'.

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/2318/steps/15/logs/stdio

path mismatch [4 links]: ino 40503579 db '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-417831/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/usr/bin/udevadm' req '/home/pokybuild/yocto-worker/oe-selftest-fedora/build/build-st-417831/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tmp-wic/rootfs1/usr/libexec/udevadm'.

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/2298/steps/14/logs/stdio

path mismatch [2 links]: ino 34603692 db '/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-21395/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/var/lock' req '/home/pokybuild/yocto-worker/oe-selftest-ubuntu/build/build-st-21395/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/tmp-wic/rootfs1/var/lock'.

https://autobuilder.yoctoproject.org/typhoon/#/builders/87/builds/2334/steps/14/logs/stdio

> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  meta/classes/image_types_wic.bbclass | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/classes/image_types_wic.bbclass b/meta/classes/image_types_wic.bbclass
> index 49be1da77a..143a6a6e4f 100644
> --- a/meta/classes/image_types_wic.bbclass
> +++ b/meta/classes/image_types_wic.bbclass
> @@ -39,7 +39,7 @@ IMAGE_CMD_wic () {
>  	if [ -z "$wks" ]; then
>  		bbfatal "No kickstart files from WKS_FILES were found: ${WKS_FILES}. Please set WKS_FILE or WKS_FILES appropriately."
>  	fi
> -	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
> +	BUILDDIR="${TOPDIR}" PSEUDO_UNLOAD=1 wic create --debug "$wks" --vars "${STAGING_DIR}/${MACHINE}/imgdata/" -e "${IMAGE_BASENAME}" -o "$build_wic/" -w "$tmp_wic" ${WIC_CREATE_EXTRA_ARGS}
>  	mv "$build_wic/$(basename "${wks%.wks}")"*.direct "$out${IMAGE_NAME_SUFFIX}.wic"
>  }
>  IMAGE_CMD_wic[vardepsexclude] = "WKS_FULL_PATH WKS_FILES TOPDIR"
> -- 
> 2.25.1
> 

> 
> 
> 


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
