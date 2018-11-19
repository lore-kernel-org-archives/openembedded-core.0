Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 2C4B96C10D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Nov 2018 14:17:36 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 42z9sD2zvYz1r0H5;
	Mon, 19 Nov 2018 15:17:36 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 42z9sD2C18z1qqkG;
	Mon, 19 Nov 2018 15:17:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id rxuQ1JCpboOg; Mon, 19 Nov 2018 15:17:34 +0100 (CET)
X-Auth-Info: xgYaHZPIpwsPvVB0kbLImaktB/u5fq81zQag5Bs6CVU=
Received: from [IPv6:::1] (unknown [195.140.253.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Mon, 19 Nov 2018 15:17:34 +0100 (CET)
To: Alexey Brodkin <alexey.brodkin@synopsys.com>,
	openembedded-core@lists.openembedded.org
References: <20181119100443.2882-1-abrodkin@synopsys.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <1fd9e473-66ba-bbb8-87a9-32bb78e359e3@denx.de>
Date: Mon, 19 Nov 2018 13:51:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181119100443.2882-1-abrodkin@synopsys.com>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	linux-snps-arc@lists.infradead.org
Subject: Re: [PATCH v3] u-boot: Add mkenvimage tool
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
X-List-Received-Date: Mon, 19 Nov 2018 14:17:38 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 11/19/2018 11:04 AM, Alexey Brodkin wrote:
> This utility is used for creation of images containing
> usable in run-time U-Boot environment.
> 
> As of today this utility is added per-board like here [1]
> for Intel Edison board.
> 
> [1] http://git.yoctoproject.org/cgit/cgit.cgi/meta-intel-edison/tree/meta-intel-edison-bsp/recipes-bsp/u-boot/u-boot-tools_2014.04.bb
> 
> Given there're quite some U-Boot tools that we may want to add later
> this recipe name switch from "u-boot-mkimage" to generic "u-boot-tools"
> still for compatibility we provide "u-boot-mkimage" with help
> of PROVIDES as well as proposed "u-boot-mkenvimage".
> 
> Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Otavio Salvador <otavio@ossystems.com.br>
> Cc: Martin Jansa <martin.jansa@gmail.com>
> Cc: Ross Burton <ross.burton@intel.com>
> Cc: Marek Vasut <marex@denx.de>

Do we want to generate one package per tool or not ?

> ---
> 
> Changes v2 -> v3:
>  * Recipe renamed to "u-boot-tools" to better match its contents
>    (especially in the future as we add more tools there)
>  * Existing "u-boot-mkimage" and newly introduced "u-boot-mkenvimage"
>    made avaialble via PROVIDES
> 
> Changes v1 -> v2:
>  * Got rid of a separate recipe and instead added mkenvimage
>    to u-boot mkimage recipy
> 
>  .../{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb}       | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>  rename meta/recipes-bsp/u-boot/{u-boot-mkimage_2018.07.bb => u-boot-tools_2018.07.bb} (83%)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> similarity index 83%
> rename from meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> rename to meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> index 08bff1d161..140afa8dfe 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-mkimage_2018.07.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-tools_2018.07.bb
> @@ -1,7 +1,8 @@
>  require u-boot-common_${PV}.inc
>  
> -SUMMARY = "U-Boot bootloader image creation tool"
> +SUMMARY = "U-Boot bootloader tools"
>  DEPENDS += "openssl"
> +PROVIDES = "u-boot-mkimage u-boot-mkenvimage"
>  
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE="${TARGET_PREFIX}" CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
>  EXTRA_OEMAKE_class-native = 'CC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" STRIP=true V=1'
> @@ -20,8 +21,14 @@ do_compile () {
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
> 


-- 
Best regards,
Marek Vasut

