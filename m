Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S100c-0007uJ-6h
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 19:36:46 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 24 Feb 2012 10:28:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="121015885"
Received: from unknown (HELO [10.255.15.58]) ([10.255.15.58])
	by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2012 10:28:22 -0800
Message-ID: <4F47D6C6.6020507@linux.intel.com>
Date: Fri, 24 Feb 2012 10:28:22 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.1) Gecko/20120216 Thunderbird/10.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <4F34729A.3020402@opendreambox.org>
In-Reply-To: <4F34729A.3020402@opendreambox.org>
Subject: Re: [PATCH/RFC] xorg-lib: don't build libs unless requested by DISTRO_FEATURES
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
X-List-Received-Date: Fri, 24 Feb 2012 18:36:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/09/2012 05:27 PM, Andreas Oberritter wrote:
> * If 'x11' is not set in DISTRO_FEATURES, then skip all
>    recipes using xorg-lib-common.inc instead of only those
>    using libx11.inc.
>
> * One exception: pixman, which is not only used by xorg,
>    but also by cairo.
>
> Signed-off-by: Andreas Oberritter<obi@opendreambox.org>
> ---
>   meta/recipes-graphics/xorg-lib/libx11.inc          |    5 -----
>   meta/recipes-graphics/xorg-lib/xorg-lib-common.inc |    6 ++++++
>   2 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/meta/recipes-graphics/xorg-lib/libx11.inc b/meta/recipes-graphics/xorg-lib/libx11.inc
> index 748a48c..9057edc 100644
> --- a/meta/recipes-graphics/xorg-lib/libx11.inc
> +++ b/meta/recipes-graphics/xorg-lib/libx11.inc
> @@ -49,8 +49,3 @@ do_compile_prepend() {
>   # Multiple libx11 derivatives from from this file and are selected by virtual/libx11
>   # A world build should only build the correct version, not all of them.
>   EXCLUDE_FROM_WORLD = "1"
> -
> -python () {
> -       if not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
> -       	  raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
> -}
> diff --git a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> index d106054..3d5d378 100644
> --- a/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> +++ b/meta/recipes-graphics/xorg-lib/xorg-lib-common.inc
> @@ -14,3 +14,9 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
>   inherit autotools pkgconfig
>
>   EXTRA_OECONF = "--enable-malloc0returnsnull --with-fop=no --without-xmlto"
> +
> +python () {
> +        whitelist = [ "pixman" ]
> +        if not d.getVar('BPN', True) in whitelist and not oe.utils.contains ('DISTRO_FEATURES', 'x11', True, False, d):
> +                raise bb.parse.SkipPackage("X11 not enabled for this DISTRO")
> +}

Merged into OE-core

Thanks
	Sau!


