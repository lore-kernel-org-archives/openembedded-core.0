Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S7jg9-0004Pz-GP
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 09:35:29 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 14 Mar 2012 01:26:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="120848801"
Received: from unknown (HELO [10.255.15.152]) ([10.255.15.152])
	by orsmga002.jf.intel.com with ESMTP; 14 Mar 2012 01:25:29 -0700
Message-ID: <4F6055F9.6030608@linux.intel.com>
Date: Wed, 14 Mar 2012 01:25:29 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1331684788.18586.14.camel@ted>
In-Reply-To: <1331684788.18586.14.camel@ted>
Subject: Re: [PATCH] opensp: Fix unnecessary rpath warnings
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 14 Mar 2012 08:35:29 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/13/2012 05:26 PM, Richard Purdie wrote:
> Stale m4 macros seemed to be corrupting the opensp build. By removing
> them, we can fix the warnings:
>
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spent contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/onsgmls contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospcat contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/osgmlnorm contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sgmlnorm contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospent contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/ospam contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/nsgmls contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spcat contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/osx contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/spam contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sx contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/bin/sgml2xml contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3.0.0 contains probably-redundant RPATH /usr/lib
> WARNING: QA Issue: opensp: /work/i586-poky-linux/opensp-1.5-r2/packages-split/opensp/usr/lib/libosp.so.3 contains probably-redundant RPATH /usr/lib
>
> Signed-off-by: Richard Purdie<richard.purdie@linuxfoundation.org>
> ---
> diff --git a/meta/recipes-devtools/opensp/opensp_1.5.bb b/meta/recipes-devtools/opensp/opensp_1.5.bb
> index d692137..e225add 100644
> --- a/meta/recipes-devtools/opensp/opensp_1.5.bb
> +++ b/meta/recipes-devtools/opensp/opensp_1.5.bb
> @@ -29,6 +29,11 @@ EXTRA_OECONF_virtclass-native = "\
>   	--enable-default-search-path=${datadir}/sgml \
>   	"
>
> +do_configure_prepend () {
> +	# Stale m4 macros cause a variety of problems
> +	rm -rf ${S}/m4/*
> +}
> +
>   do_install_append() {
>   	# Set up symlinks to often-used alternate names. See
>   	# http://www.linuxfromscratch.org/blfs/view/stable/pst/opensp.html
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

I got some failure with this patch, not sure it's 100% at this point.

Sorry, I don't have the error messages anymore.

Sau!


