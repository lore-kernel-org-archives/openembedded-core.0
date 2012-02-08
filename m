Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RuyvO-0005QU-TI
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Feb 2012 05:14:31 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 07 Feb 2012 20:06:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="64289573"
Received: from unknown (HELO [10.255.14.116]) ([10.255.14.116])
	by AZSMGA002.ch.intel.com with ESMTP; 07 Feb 2012 20:06:26 -0800
Message-ID: <4F31F4C2.2090900@linux.intel.com>
Date: Tue, 07 Feb 2012 20:06:26 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111222 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1328535211-24985-1-git-send-email-mac@mcrowe.com>
In-Reply-To: <1328535211-24985-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: Re: [PATCH] libusb1: Cope with ${libdir} and ${base_libdir} being the same
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
X-List-Received-Date: Wed, 08 Feb 2012 04:14:31 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/06/2012 05:33 AM, Mike Crowe wrote:
> ${libdir} and ${base_libdir} may be the same. If they are don't try and
> move files onto themselves.
>
> Signed-off-by: Mike Crowe<mac@mcrowe.com>
> ---
>   meta/recipes-support/libusb/libusb1_1.0.8.bb |    6 ++++--
>   1 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/libusb/libusb1_1.0.8.bb b/meta/recipes-support/libusb/libusb1_1.0.8.bb
> index 8873de7..e45a9d9 100644
> --- a/meta/recipes-support/libusb/libusb1_1.0.8.bb
> +++ b/meta/recipes-support/libusb/libusb1_1.0.8.bb
> @@ -6,7 +6,7 @@ SECTION = "libs"
>   LICENSE = "LGPLv2.1+"
>   LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
>
> -PR = "r2"
> +PR = "r3"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2"
>
> @@ -20,7 +20,9 @@ EXTRA_OECONF = "--libdir=${base_libdir}"
>
>   do_install_append() {
>   	install -d ${D}${libdir}
> -	mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> +	if [ ! ${D}${libdir} -ef ${D}${base_libdir} ]; then
> +		mv ${D}${base_libdir}/pkgconfig ${D}${libdir}
> +	fi
>   }
>
>   FILES_${PN} += "${base_libdir}/*.so.*"


Merged all 3 of this series into OE-core

Thanks
	Sau!


