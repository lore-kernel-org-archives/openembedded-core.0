Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id DE1046FFA1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Jun 2017 23:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 12FFD208AD;
	Tue, 20 Jun 2017 23:55:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ILXj9lc_V1fR; Tue, 20 Jun 2017 23:55:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CC274204E0;
	Tue, 20 Jun 2017 23:55:44 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 42C7516250F; Tue, 20 Jun 2017 19:55:44 -0400 (EDT)
Date: Tue, 20 Jun 2017 19:55:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Otavio Salvador <otavio@ossystems.com.br>
Message-ID: <20170620235544.GO28053@denix.org>
References: <20170620221512.21860-1-otavio@ossystems.com.br>
MIME-Version: 1.0
In-Reply-To: <20170620221512.21860-1-otavio@ossystems.com.br>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: marex@denx.de, trini@konsulko.com, brad.mouring@ni.com,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Allow replacement of fw_env.config
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
X-List-Received-Date: Tue, 20 Jun 2017 23:55:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 20, 2017 at 07:15:12PM -0300, Otavio Salvador wrote:
> If a fw_env.config file is found in workdir, this is preferred over
> the U-Boot example.
> 
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
> ---
> 
>  meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> index c2e8f0fb84..0682f9274b 100644
> --- a/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> +++ b/meta/recipes-bsp/u-boot/u-boot-fw-utils_2017.05.bb
> @@ -19,7 +19,14 @@ do_install () {
>  	install -d ${D}${sysconfdir}
>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_printenv
>  	install -m 755 ${S}/tools/env/fw_printenv ${D}${base_sbindir}/fw_setenv
> -	install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config
> +
> +	# If a specific file is added in a .bbappend, this is used instead
> +	# of the generic one
> +	if [ -e ${WORKDIR}/fw_env.config ]; then
> +		install -m 0644 ${WORKDIR}/fw_env.config ${D}${sysconfdir}/fw_env.config

I don't get it - if it's expected that a .bbappend will be adding a more 
specific version of fw_env.config, why that .bbappend can't simply install 
it with do_install_append()?


> +	else
> +		install -m 0644 ${S}/tools/env/fw_env.config ${D}${sysconfdir}/fw_env.config.example
> +	fi
>  }
>  
>  do_install_class-cross () {
> -- 
> 2.13.1
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

