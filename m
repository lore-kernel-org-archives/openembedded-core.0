Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QvfTg-0004U0-N2
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 03:08:28 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 22 Aug 2011 18:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="40786812"
Received: from unknown (HELO [10.255.13.234]) ([10.255.13.234])
	by orsmga002.jf.intel.com with ESMTP; 22 Aug 2011 18:03:42 -0700
Message-ID: <4E52FC6E.9040902@linux.intel.com>
Date: Mon, 22 Aug 2011 18:03:42 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:5.0) Gecko/20110707 Thunderbird/5.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1313589414.6733.219.camel@phil-desktop>
In-Reply-To: <1313589414.6733.219.camel@phil-desktop>
Cc: Phil Blundell <philb@gnu.org>
Subject: Re: [PATCH] libxslt: fix packaging of static libraries
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
X-List-Received-Date: Tue, 23 Aug 2011 01:08:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/17/2011 06:56 AM, Phil Blundell wrote:
> This prevents warnings about .a files being installed but not shipped.
>
> Signed-off-by: Phil Blundell<philb@gnu.org>
> ---
>   meta/recipes-support/libxslt/libxslt_1.1.26.bb |   15 ++++++++-------
>   1 files changed, 8 insertions(+), 7 deletions(-)
>
> diff --git a/meta/recipes-support/libxslt/libxslt_1.1.26.bb b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> index b5f6962..cc64ba7 100644
> --- a/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> +++ b/meta/recipes-support/libxslt/libxslt_1.1.26.bb
> @@ -6,8 +6,8 @@ LICENSE = "MIT"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=0cd9a07afbeb24026c9b03aecfeba458"
>
>   SECTION = "libs"
> -DEPENDS = "libxml2 (>=2.6.27)"
> -PR = "r1"
> +DEPENDS = "libxml2"
> +PR = "r2"
>
>   SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
>              file://pkgconfig_fix.patch;patch=1"
> @@ -16,13 +16,14 @@ SRC_URI[md5sum] = "e61d0364a30146aaa3001296f853b2b9"
>   SRC_URI[sha256sum] = "55dd52b42861f8a02989d701ef716d6280bfa02971e967c285016f99c66e3db1"
>   S = "${WORKDIR}/libxslt-${PV}"
>
> -inherit autotools pkgconfig binconfig
> +inherit autotools pkgconfig binconfig lib_package
>
>   EXTRA_OECONF = "--without-python --without-debug --without-mem-debug --without-crypto"
> +# older versions of this recipe had ${PN}-utils
> +RPROVIDES_${PN}-bin += "${PN}-utils"
> +RCONFLICTS_${PN}-bin += "${PN}-utils"
> +RREPLACES_${PN}-bin += "${PN}-utils"
>
> -PACKAGES = "${PN}-dbg ${PN}-dev ${PN}-utils ${PN} ${PN}-doc ${PN}-locale"
> -
> -FILES_${PN}-dev += "${bindir}/xslt-config"
> -FILES_${PN}-utils += "${bindir}"
> +FILES_${PN}-dev += "${bindir}/xsltConf.sh"
>
>   BBCLASSEXTEND = "native"

Merged into OE-Core

Thanks
	Sau!



