Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id B29A177811
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 20:43:53 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wsfvZ0HbZz1qryn;
	Tue, 20 Jun 2017 22:43:53 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wsfvY5nMHz3j37M;
	Tue, 20 Jun 2017 22:43:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id yJjeERr7sAm4; Tue, 20 Jun 2017 22:43:52 +0200 (CEST)
X-Auth-Info: aCwpDAlv4ymCuV6zaJoK76GH2ZTIrY+KCe8bKZsyDUM=
Received: from [IPv6:::1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 20 Jun 2017 22:43:52 +0200 (CEST)
To: Brad Mouring <brad.mouring@ni.com>,
	Openembedded Core <openembedded-core@lists.openembedded.org>
References: <20170620204029.19499-1-brad.mouring@ni.com>
From: Marek Vasut <marex@denx.de>
Message-ID: <f35ef85f-1868-ef13-1003-3bf1cfc58b89@denx.de>
Date: Tue, 20 Jun 2017 22:43:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <20170620204029.19499-1-brad.mouring@ni.com>
Cc: Tom Rini <trini@konsulko.com>
Subject: Re: [RFC] u-boot-fw-utils: Allow target-specific fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 20:43:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06/20/2017 10:40 PM, Brad Mouring wrote:
> As implemented currently, the fw-utils recipe does not allow for
> a board- or distro-specific fw_env.config override, instead opting
> to include the default (commented, example-filled) fw_env.config
> from the u-boot source. This change introduces a variable that allows
> for overriding this, while defaulting to the example config file from
> the u-boot source.
> 
> Signed-off-by: Brad Mouring <brad.mouring@ni.com>
> ---
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> index c2e8f0fb84..b06282ac03 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> @@ -7,6 +7,11 @@ INSANE_SKIP_${PN} = "already-stripped"
>  EXTRA_OEMAKE_class-target = 'CROSS_COMPILE=${TARGET_PREFIX} CC="${CC} ${CFLAGS} ${LDFLAGS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" V=1'
>  EXTRA_OEMAKE_class-cross = 'ARCH=${TARGET_ARCH} CC="${CC} ${CFLAGS} ${LDFLAGS}" V=1'
>  
> +# U-Boot environment configuration file variables. This file is used
> +# by the U-Boot environment utilities "fw_printenv" and "fw_setenv".
> +# By default, use the default included in the U-Boot source
> +UBOOT_FW_ENV_CONFIG ??= "${S}/tools/env/fw_env.config"
> +
>  inherit uboot-config
>  
>  do_compile () {
> @@ -19,7 +24,7 @@ do_install () {
>  	install -d ${D}${sysconfdir}
>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> +	install -m 0644 ${UBOOT_FW_ENV_CONFIG} ${D}${sysconfdir}/fw_env.config

Do we really need yet another variable ? Wouldn't it make more sense to
add do_install_append_yourmachine() {} in your meta-whatever to
u-boot-fw-utils_%.bbappend and install whatever additional files you need ?

>  }
>  
>  do_install_class-cross () {
> 


-- 
Best regards,
Marek Vasut

