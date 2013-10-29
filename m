Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 0BA926D13F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2013 15:36:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 29 Oct 2013 08:33:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="426532413"
Received: from unknown (HELO [10.255.12.29]) ([10.255.12.29])
	by orsmga002.jf.intel.com with ESMTP; 29 Oct 2013 08:36:49 -0700
Message-ID: <526FD611.30304@linux.intel.com>
Date: Tue, 29 Oct 2013 08:36:49 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: qiang.chen@windriver.com, openembedded-core@lists.openembedded.org
References: <1382937354-31622-1-git-send-email-qiang.chen@windriver.com>
In-Reply-To: <1382937354-31622-1-git-send-email-qiang.chen@windriver.com>
Subject: Re: [PATCH] openssl: create package for openssl configuration file
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
X-List-Received-Date: Tue, 29 Oct 2013 15:36:48 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/27/2013 10:15 PM, qiang.chen@windriver.com wrote:
> From: Qiang Chen <qiang.chen@windriver.com>
>
> * Add the openssl-conf package to the list of packages to
>    be created.  This package contains the openssl.cnf file
>    which is used by both the openssl executable in the
>    openssl package and the libcrypto library.
>
> * This is to avoid messages like:
>      WARNING: can't open config file: /usr/lib/ssl/openssl.cnf
>
> * When running "openssl req" to request and generate a certificate
>    the command will fail without the openssl.cnf file being
>    installed on the target system.
>
> * Made this package an RRECOMMENDS for libcrypto since:
> 	* libcrypto is a RDEPENDS for the openssl package
> 	* Users can specify a configuration file at another
>        location so it is not stricly required and many
>        commands will work without it (with warnings)
>
> Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> Signed-off-by: Qiang Chen <qiang.chen@windriver.com>
> ---
>   meta/recipes-connectivity/openssl/openssl.inc |   12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssl/openssl.inc b/meta/recipes-connectivity/openssl/openssl.inc
> index 78ff7ae..f4b786a 100644
> --- a/meta/recipes-connectivity/openssl/openssl.inc
> +++ b/meta/recipes-connectivity/openssl/openssl.inc
> @@ -33,13 +33,21 @@ export AS = "${CC} -c"
>
>   inherit pkgconfig siteinfo multilib_header
>
> -PACKAGES =+ "libcrypto libssl ${PN}-misc"
> +PACKAGES =+ "libcrypto libssl ${PN}-misc openssl-conf"
How about ${BPN}-conf here instead?

>   FILES_libcrypto = "${base_libdir}/libcrypto${SOLIBS}"
>   FILES_libssl = "${libdir}/libssl.so.*"
>   FILES_${PN} =+ " ${libdir}/ssl/*"
> -FILES_${PN}-misc = "${libdir}/ssl/misc ${libdir}/ssl/openssl.cnf"
> +FILES_${PN}-misc = "${libdir}/ssl/misc"
>   FILES_${PN}-dev += "${base_libdir}/libcrypto${SOLIBSDEV}"
>
> +# Add the openssl.cnf file to the openssl-conf package.  Make the libcrypto
> +# package RRECOMMENDS on this package.  This will enable the configuration
> +# file to be installed for both the base openssl package and the libcrypto
> +# package since the base openssl package depends on the libcrypto package.
> +FILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
> +CONFFILES_openssl-conf = "${libdir}/ssl/openssl.cnf"
> +RRECOMMENDS_libcrypto += "openssl-conf"
> +
Same here, please use ${BPN} instead of openssl for the package 
construction.

This actually points out an inssue with alot of other packages that use 
${PN} for CONFFILES and packages that contain config files when setup on 
a multilib system.  I will be filing a general bug against this and 
watching for patches.

Thanks
	Sau!
>   do_configure_prepend_darwin () {
>   	sed -i -e '/version-script=openssl\.ld/d' Configure
>   }
>

