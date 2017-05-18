Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 3DD4A72F74
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 01:06:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 53B8320B7A;
	Thu, 18 May 2017 01:06:29 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id XpMCJvGCR0te; Thu, 18 May 2017 01:06:29 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2239920756;
	Thu, 18 May 2017 01:06:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A121B1624C6; Wed, 17 May 2017 21:06:26 -0400 (EDT)
Date: Wed, 17 May 2017 21:06:26 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Max Krummenacher <max.oss.09@gmail.com>
Message-ID: <20170518010626.GR28053@denix.org>
References: <20170517201134.26758-1-max.krummenacher@toradex.com>
MIME-Version: 1.0
In-Reply-To: <20170517201134.26758-1-max.krummenacher@toradex.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Max Krummenacher <max.krummenacher@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot-mkimage: fix nativesdk build
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
X-List-Received-Date: Thu, 18 May 2017 01:06:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 17, 2017 at 10:11:34PM +0200, Max Krummenacher wrote:
> If building for nativesdk the wrong rss sysroot is used leading the
> following error message.
> 
> | ERROR: oe_runmake failed
> | In file included from tools/imximage.c:13:0:
> | include/image.h:1024:27: fatal error: openssl/evp.h: No such file or directory
> |  # include  <openssl/evp.h>
> 
> Tools needed on the build host (script/basic/fixdep) and code compiled
> for the SDK machine are both built with the build host's compiler,
> leading to additinal errors.
> 
> Adding CROSS_COMPILE="${HOST_PREFIX}" and using the cross-compiler for
> the SDK_ARCH fixes the build error.
> The resulting binary in the SDK is working.
> 
> Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>

Reviewed-by: Denys Dmytriyenko <denys@ti.com>


> ---
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> index 1aa95e7..de999e7 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2017.01.bb
> @@ -7,7 +7,7 @@ DEPENDS = "openssl"
>  
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> -EXTRA_OEMAKE_class-nativesdk = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> +EXTRA_OEMAKE_class-nativesdk = 'CROSS_COMPILE="${HOST_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  
>  do_compile () {
>  	oe_runmake sandbox_defconfig
> -- 
> 2.9.3
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

