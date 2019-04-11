Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by mail.openembedded.org (Postfix) with ESMTP id 0AE997D8ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 17:26:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 9518B40B8F;
	Thu, 11 Apr 2019 17:26:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id SF0Vxo9GE12P; Thu, 11 Apr 2019 17:26:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 664D9407DA;
	Thu, 11 Apr 2019 17:26:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9B2AB16DC15; Thu, 11 Apr 2019 13:26:54 -0400 (EDT)
Date: Thu, 11 Apr 2019 13:26:54 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20190411172654.GO2112@denix.org>
References: <20190410172152.13509-1-alistair.francis@wdc.com>
	<eac980cd94a8d408a02f143f8ee9f2723655e819.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <eac980cd94a8d408a02f143f8ee9f2723655e819.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Denys Dmytriyenko <denys@ti.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Upgrade from 2019.01 to 2019.04
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
X-List-Received-Date: Thu, 11 Apr 2019 17:26:58 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 11, 2019 at 09:27:32AM +0100, Richard Purdie wrote:
> On Wed, 2019-04-10 at 17:23 +0000, Alistair Francis wrote:
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> > ---
> >  meta/recipes-bsp/u-boot/u-boot-common.inc                       | 2
> > +-
> >  .../{u-boot-fw-utils_2019.01.bb => u-boot-fw-utils_2019.04.bb}  | 0
> >  .../u-boot/{u-boot-tools_2019.01.bb => u-boot-tools_2019.04.bb} | 0
> >  .../recipes-bsp/u-boot/{u-boot_2019.01.bb => u-boot_2019.04.bb} | 0
> >  4 files changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-bsp/u-boot/{u-boot-fw-utils_2019.01.bb => u-
> > boot-fw-utils_2019.04.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot-tools_2019.01.bb => u-boot-
> > tools_2019.04.bb} (100%)
> >  rename meta/recipes-bsp/u-boot/{u-boot_2019.01.bb => u-
> > boot_2019.04.bb} (100%)
> 
> Breaks beaglebone-yocto:
> 
> https://autobuilder.yoctoproject.org/typhoon/#/builders/65/builds/490
> https://autobuilder.yoctoproject.org/typhoon/#/builders/46/builds/489

Richard,

This is quite interesting and surprisingly timely for me! Let me explain.

Both of the above errors are not really specific to beaglebone or even u-boot. 
In both cases, the failure is this:

| ERROR: _exec_cmd: install -m 0644 -D /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/deploy/images/beaglebone-yocto/u-boot.img /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/deploy-core-image-sato-sdk-ptest-image-complete/core-image-sato-sdk-ptest-beaglebone-yocto-20190410232147/tmp.wic.4xf3vi9f/boot.1/u-boot.img returned '1' instead of 0
| output: install: cannot stat '/home/pokybuild/yocto-worker/beaglebone/build/build/tmp/deploy/images/beaglebone-yocto/u-boot.img': No such file or directory
| ERROR: Function failed: do_image_wic (log file is located at /home/pokybuild/yocto-worker/beaglebone/build/build/tmp/work/beaglebone_yocto-poky-linux-gnueabi/core-image-sato-sdk-ptest/1.0-r0/temp/log.do_image_wic.41960)

I recently received exactly the same error report internally and have been 
investigating it. Though it is against Thud, for a different platform and with 
our own u-boot from meta-ti.

It seems to be a race condition - wic is trying to assemble an image when 
u-boot binary is not yet ready. Usually on subsequent rebuilds when u-boot 
needs to be rebuilt, but everything else is already available.

Packaging for wic is set with IMAGE_BOOT_FILES = "u-boot.img", but the build 
dependency is special, as u-boot is not part of rootfs and is being set by 
EXTRA_IMAGEDEPENDS = "u-boot":
http://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-yocto-bsp/conf/machine/beaglebone-yocto.conf

Since wic jumps right into packaging u-boot.img and doesn't wait for it to 
finish building/installing/deploying, it seems EXTRA_IMAGEDEPENDS is broken. 
But it used to work prior to Thud. It appears it may have been broken here:
https://git.openembedded.org/openembedded-core/commit/?id=b54cdaea7844ee3bf0c39eb97cc7c4c17ed5818c

While the above commit deals with licenses and manifests, removal of these 
lines is not clear:

-    extra_depends = d.getVar("EXTRA_IMAGEDEPENDS")
-    boot_depends = get_boot_dependencies(d)
-    depends.extend(extra_depends.split())
-    depends.extend(boot_depends)
-    depends = list(set(depends))

Could it have affected boot dependencies and EXTRA_IMAGEDEPENDS behavior? 
Please let me know if you need any more details. Thanks.

-- 
Denys

