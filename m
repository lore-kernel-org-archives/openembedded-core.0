Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A9BB36E9BD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2014 19:50:39 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 28 Jan 2014 11:50:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,737,1384329600"; d="scan'208";a="472199230"
Received: from unknown (HELO [10.255.13.109]) ([10.255.13.109])
	by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2014 11:50:39 -0800
Message-ID: <52E80A0F.5070003@linux.intel.com>
Date: Tue, 28 Jan 2014 11:50:39 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1390931044-24421-1-git-send-email-ross.burton@intel.com>
In-Reply-To: <1390931044-24421-1-git-send-email-ross.burton@intel.com>
Subject: Re: [PATCH] pkgconfig: remove out-dated configure options and dependencies
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
X-List-Received-Date: Tue, 28 Jan 2014 19:50:40 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


Although not in this email a change to this patch seems to have removed 
the glibconfig-sysdefs.h file but not the entry in SRC_URI for the _0,28 
and _git recipes.

Not sure what happened with this, but master is not working and we 
should either revert this change or clean up the issue.

Thanks
	Sau!


On 01/28/2014 09:44 AM, Ross Burton wrote:
> 0.27 onwards uses a snapshot of glib 2 not glib 1, so drop the
> do_configure_prepend and update the internal/installed options as appropriate.
>
> Legacy scripts were removed in 0.26.
>
> Use of popt was removed in 0.28.
>
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>   meta/recipes-devtools/pkgconfig/pkgconfig.inc |   12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
>
> diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig.inc b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> index 3e655a9..62c886f 100644
> --- a/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> +++ b/meta/recipes-devtools/pkgconfig/pkgconfig.inc
> @@ -8,7 +8,7 @@ SECTION = "console/utils"
>   LICENSE = "GPLv2+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
>
> -DEPENDS = "glib-2.0 popt"
> +DEPENDS = "glib-2.0"
>   DEPENDS_class-native = ""
>   DEPENDS_class-nativesdk = ""
>
> @@ -18,15 +18,11 @@ S = "${WORKDIR}/pkg-config-${PV}/"
>
>   inherit autotools
>
> -EXTRA_OECONF = "--with-installed-glib --with-installed-popt --disable-legacy-scripts --with-internal-glib"
> -EXTRA_OECONF_class-native = "--disable-legacy-scripts --with-internal-glib"
> -EXTRA_OECONF_class-nativesdk = "--disable-legacy-scripts --with-internal-glib"
> +EXTRA_OECONF = "--without-internal-glib"
> +EXTRA_OECONF_class-native = "--with-internal-glib"
> +EXTRA_OECONF_class-nativesdk = "--with-internal-glib"
>
>   acpaths = "-I ."
> -do_configure_prepend () {
> -	mkdir --parents ${B}/glib-1.2.10
> -	install -m 0644 ${WORKDIR}/glibconfig-sysdefs.h ${B}/glib-1.2.10/
> -}
>
>   BBCLASSEXTEND = "native nativesdk"
>
>

