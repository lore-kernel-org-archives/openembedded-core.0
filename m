Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 7D5D66C131
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Nov 2018 14:50:50 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42wknQ3lZ2z1qxlK;
	Thu, 15 Nov 2018 15:50:50 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42wknQ36Kzz1qsKJ;
	Thu, 15 Nov 2018 15:50:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id d4Yh338uRZkc; Thu, 15 Nov 2018 15:50:48 +0100 (CET)
X-Auth-Info: o+JUSnl/A/5uISNSkvoMI4H1RKyPRE9TGOJM7Fal3fE=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Thu, 15 Nov 2018 15:50:48 +0100 (CET)
To: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	openembedded-core@lists.openembedded.org
References: <20181115124339.19543-1-abrodkin@synopsys.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <23029415-903d-40f8-9f72-7d97d67aee7b@denx.de>
Date: Thu, 15 Nov 2018 14:43:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181115124339.19543-1-abrodkin@synopsys.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v2] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Thu, 15 Nov 2018 14:50:50 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/15/2018 01:43 PM, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> Note it is already gets built with "make tools" command
> together with "mkimage" so we just need to install "mkenvimage".
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>
> ---
> 
> Chnages v1 -> v2:
> 
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipy
> 
>  meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> index 08bff1d161..8a8a1ed449 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> @@ -1,6 +1,6 @@
>  require u-boot-common_${PV}.inc
>  
> -SUMMARY = "U-Boot bootloader image creation tool"
> +SUMMARY = "U-Boot bootloader environment & image creation tools"
>  DEPENDS += "openssl"
>  
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> @@ -20,8 +20,14 @@ do_compile () {
>  
>  do_install () {
>  	install -d ${D}${bindir}
> +
> +	# mkimage
>  	install -m 0755 tools/mkimage ${D}${bindir}/uboot-mkimage
>  	ln -sf uboot-mkimage ${D}${bindir}/mkimage
> +
> +	# mkenvimage
> +	install -m 0755 tools/mkenvimage ${D}${bindir}/uboot-mkenvimage
> +	ln -sf uboot-mkenvimage ${D}${bindir}/mkenvimage
>  }
>  
>  RDEPENDS_${PN} += "dtc"

I have to admit, the recipe name becomes a misnomer then. But renaming
this recipe would be hard, since it's used all over the place. Any ideas?

-- 
Best regards,
Marek Vasut

