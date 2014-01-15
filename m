Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 517A86E38C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Jan 2014 15:12:20 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 15 Jan 2014 07:12:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,663,1384329600"; d="scan'208";a="439262016"
Received: from unknown (HELO [10.255.12.135]) ([10.255.12.135])
	by orsmga001.jf.intel.com with ESMTP; 15 Jan 2014 07:12:21 -0800
Message-ID: <52D6A554.2050705@linux.intel.com>
Date: Wed, 15 Jan 2014 07:12:20 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Paul Barker <paul@paulbarker.me.uk>, 
	openembedded-core@lists.openembedded.org
References: <1389752246-4296-1-git-send-email-paul@paulbarker.me.uk>
	<1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
In-Reply-To: <1389752246-4296-4-git-send-email-paul@paulbarker.me.uk>
Subject: Re: [PATCH 3/3] opkg: No longer PROVIDES update-alternatives
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
X-List-Received-Date: Wed, 15 Jan 2014 15:12:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/14/2014 06:17 PM, Paul Barker wrote:
> The new provider is the opkg-utils recipe.
>
This seems to have triggered a failure on the AB:

| Computing transaction...error: Can't install 
nativesdk-shadow-4.1.4.3-r13@i686_nativesdk: no package provides 
nativesdk-update-alternatives-opkg

Sau!


> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
> ---
>   meta/recipes-devtools/opkg/opkg.inc | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta/recipes-devtools/opkg/opkg.inc b/meta/recipes-devtools/opkg/opkg.inc
> index c9fb505..527fe5d 100644
> --- a/meta/recipes-devtools/opkg/opkg.inc
> +++ b/meta/recipes-devtools/opkg/opkg.inc
> @@ -39,17 +39,13 @@ EXTRA_OECONF = "\
>     --with-opkglibdir=${OPKGLIBDIR} \
>   "
>
> -PROVIDES += "virtual/update-alternatives"
> -RPROVIDES_update-alternatives-cworth += "update-alternatives"
> -RCONFLICTS_update-alternatives-cworth = "update-alternatives-dpkg"
>   RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_update-alternatives} opkg-config-base"
>   RDEPENDS_${PN}_class-native = ""
>   RDEPENDS_${PN}_class-nativesdk = ""
>   RREPLACES_${PN} = "opkg-nogpg"
>
> -PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg update-alternatives-cworth"
> +PACKAGES =+ "libopkg-dev libopkg-staticdev libopkg"
>
> -FILES_update-alternatives-cworth = "${bindir}/update-alternatives"
>   FILES_libopkg-dev = "${libdir}/*.la ${libdir}/*.so ${includedir}/libopkg"
>   FILES_libopkg-staticdev = "${libdir}/*.a"
>   FILES_libopkg = "${libdir}/*.so.* ${OPKGLIBDIR}/opkg/"
> @@ -74,10 +70,8 @@ do_install_append() {
>   	ln -sf opkg-cl ${D}${bindir}/opkg
>   }
>
> -do_install_append_class-native() {
> -	if [ "${PREFERRED_PROVIDER_virtual/update-alternatives-native}" != "${PN}" ]; then
> -		rm ${D}${bindir}/update-alternatives
> -	fi
> +do_install_append() {
> +	rm ${D}${bindir}/update-alternatives
>   }
>
>   pkg_postinst_${PN} () {
>

