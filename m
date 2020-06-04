Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.22096.1591298987366989793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2020 12:29:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AFC7D40C2E;
	Thu,  4 Jun 2020 19:29:46 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EqX7LhQkS1gZ; Thu,  4 Jun 2020 19:29:46 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 6EB6D40B53;
	Thu,  4 Jun 2020 19:29:42 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id DCA4717320C; Thu,  4 Jun 2020 15:29:41 -0400 (EDT)
Date: Thu, 4 Jun 2020 15:29:41 -0400
From: "Denys Dmytriyenko" <denis@denix.org>
To: Jens Rehsack <rehsack@gmail.com>
Cc: openembedded-core@lists.openembedded.org,
	Anuj Mittal <anuj.mittal@intel.com>,
	Otavio Salvador <otavio.salvador@gmail.com>,
	Jens Rehsack <sno@netbsd.org>
Subject: Re: [OE-core][PATCH v4 1/2] initscripts/init-system-helpers: fix mountnfs.sh dependency
Message-ID: <20200604192941.GG17660@denix.org>
References: <20200602134256.8156-1-sno@netbsd.org>
MIME-Version: 1.0
In-Reply-To: <20200602134256.8156-1-sno@netbsd.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 02, 2020 at 03:42:55PM +0200, Jens Rehsack wrote:
> With commit c9fc9110be33fe0f24bc3a7c242b584a4ca33e04
>     Author: Yue Tao <Yue.Tao@windriver.com>
>     Date:   Fri May 25 10:48:08 2018 +0800
> 
> 	initscripts: Avoid starting rpcbind daemon twice
> 
> 	Check the status before start it to avoid duplicates.
> 
> the use of a script {/usr/sbin/}service is introduced - maybe earlier
> provided by systemd, nowadays mostly by init-system-helpers from
> debian project.
> 
> For the very first shot, maybe discussions and improvements based
> on that script collection, use just the init-system-helpers-service
> in initscripts/mountnfs.sh to avoid problems mounting NFS in later
> boot stage.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>
> ---
>  meta/conf/distro/include/maintainers.inc      |  1 +
>  .../initscripts/init-system-helpers_1.57.bb   | 46 +++++++++++++++++++
>  .../initscripts/initscripts_1.0.bb            |  1 +
>  3 files changed, 48 insertions(+)
>  create mode 100644 meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> 
> diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
> index 51e6da669c..adac9fd824 100644
> --- a/meta/conf/distro/include/maintainers.inc
> +++ b/meta/conf/distro/include/maintainers.inc
> @@ -265,6 +265,7 @@ RECIPE_MAINTAINER_pn-icu = "Alexander Kanavin <alex.kanavin@gmail.com>"
>  RECIPE_MAINTAINER_pn-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-inetutils = "Tom Rini <trini@konsulko.com>"
>  RECIPE_MAINTAINER_pn-init-ifupdown = "Anuj Mittal <anuj.mittal@intel.com>"
> +RECIPE_MAINTAINER_pn-init-system-helpers = "Anuj Mittal <anuj.mittal@intel.com>"
>  RECIPE_MAINTAINER_pn-initramfs-boot = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER_pn-initramfs-framework = "Otavio Salvador <otavio.salvador@ossystems.com.br>"
>  RECIPE_MAINTAINER_pn-initramfs-live-boot = "Anuj Mittal <anuj.mittal@intel.com>"
> diff --git a/meta/recipes-core/initscripts/init-system-helpers_1.57.bb b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> new file mode 100644
> index 0000000000..d41bb94791
> --- /dev/null
> +++ b/meta/recipes-core/initscripts/init-system-helpers_1.57.bb
> @@ -0,0 +1,46 @@
> +SUMMARY = "helper tools for all init systems"
> +DESCRIPTION = "This package contains helper tools that are necessary for switching between \
> +the various init systems that Debian contains (e. g. sysvinit or \
> +systemd). An example is deb-systemd-helper, a script that enables systemd unit \
> +files without depending on a running systemd. \
> +\
> +It also includes the \"service\", \"invoke-rc.d\", and \"update-rc.d\" scripts which \
> +provide an abstraction for enabling, disabling, starting, and stopping \
> +services for all supported Debian init systems as specified by the policy. \
> +\
> +While this package is maintained by pkg-systemd-maintainers, it is NOT \
> +specific to systemd at all. Maintainers of other init systems are welcome to \
> +include their helpers in this package."
> +HOMEPAGE = "https://salsa.debian.org/debian/init-system-helpers"
> +SECTION = "base"
> +LICENSE = "BSD-3-Clause & GPLv2"
> +LIC_FILES_CHKSUM = "file://debian/copyright;md5=ee2b1830fcfead84d07bc060ec43e072"
> +
> +DEPENDS = "perl"
> +
> +SRCREV = "760c625ec0e1ffebec2e391d891d389da0f65726"
> +SRC_URI = "git://salsa.debian.org/debian/init-system-helpers.git"

I'm getting this:

WARNING: init-system-helpers-1.57-r0 do_fetch: Failed to fetch URL git://salsa.debian.org/debian/init-system-helpers.git, attempting MIRRORS if available


> +
> +S = "${WORKDIR}/git"
> +
> +do_configure[noexec] = "1"
> +do_compile[noexec] = "1"
> +
> +do_install() {
> +	install -d -m 0755 ${D}${sbindir}
> +	install -m 0755 ${S}/script/invoke-rc.d ${D}${sbindir}
> +	install -m 0755 ${S}/script/service ${D}${sbindir}
> +	install -m 0755 ${S}/script/update-rc.d ${D}${sbindir}
> +}
> +
> +PACKAGES += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
> +
> +FILES_${PN} = ""
> +FILES_${PN}-invoke-rc.d = "${sbindir}/invoke-rc.d"
> +FILES_${PN}-service = "${sbindir}/service"
> +FILES_${PN}-update-rc.d = "${sbindir}/update-rc.d"
> +
> +ALLOW_EMPTY_${PN} = "1"
> +
> +RDEPENDS_${PN}-update-rc.d = "perl"
> +RRECOMMENDS_${PN} += "${PN}-invoke-rc.d ${PN}-service ${PN}-update-rc.d"
> diff --git a/meta/recipes-core/initscripts/initscripts_1.0.bb b/meta/recipes-core/initscripts/initscripts_1.0.bb
> index 1a59b82fbf..4080c4a495 100644
> --- a/meta/recipes-core/initscripts/initscripts_1.0.bb
> +++ b/meta/recipes-core/initscripts/initscripts_1.0.bb
> @@ -50,6 +50,7 @@ PACKAGE_WRITE_DEPS_append = " ${@bb.utils.contains('DISTRO_FEATURES','systemd','
>  PACKAGES =+ "${PN}-functions ${PN}-sushell"
>  RDEPENDS_${PN} = "initd-functions \
>                    ${@bb.utils.contains('DISTRO_FEATURES','selinux','${PN}-sushell','',d)} \
> +                  init-system-helpers-service \
>  		 "
>  # Recommend pn-functions so that it will be a preferred default provider for initd-functions
>  RRECOMMENDS_${PN} = "${PN}-functions"
> -- 
> 2.17.1
> 

> 

