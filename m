Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SKdkw-0005OY-9R
	for openembedded-core@lists.openembedded.org;
	Thu, 19 Apr 2012 00:53:46 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Apr 2012 15:44:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="134123436"
Received: from unknown (HELO [10.255.12.104]) ([10.255.12.104])
	by orsmga002.jf.intel.com with ESMTP; 18 Apr 2012 15:44:17 -0700
Message-ID: <4F8F43C0.6020608@linux.intel.com>
Date: Wed, 18 Apr 2012 15:44:16 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1334781049-7980-1-git-send-email-jonas.danielsson@lundinova.se>
In-Reply-To: <1334781049-7980-1-git-send-email-jonas.danielsson@lundinova.se>
Subject: Re: [PATCH] bluez4: make alsa support conditional upon DISTRO_FEATURES
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
X-List-Received-Date: Wed, 18 Apr 2012 22:53:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/18/2012 01:30 PM, Jonas Danielsson wrote:
> Do not enable alsa in bluez4 unless it's included in DISTRO_FEATURES.
>
> Signed-off-by: Jonas Danielsson<jonas.danielsson@lundinova.se>
> ---
>   meta/recipes-connectivity/bluez/bluez4.inc     |    7 +++++--
>   meta/recipes-connectivity/bluez/bluez4_4.99.bb |   11 +++++++----
>   2 files changed, 12 insertions(+), 6 deletions(-)
>
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc b/meta/recipes-connectivity/bluez/bluez4.inc
> index fbbe0bf..0ce7c31 100644
> --- a/meta/recipes-connectivity/bluez/bluez4.inc
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
>                       file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \
>                       file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f926e \
>                       file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb191"
> -DEPENDS = "udev alsa-lib libusb dbus-glib glib-2.0 libcheck"
> +DEPENDS = "\
> +  udev ${@base_contains('DISTRO_FEATURES', 'alsa', 'alsa-lib', '', d)} \
> +  libusb dbus-glib glib-2.0 libcheck \
> +  "
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>
>   ASNEEDED = ""
> @@ -21,7 +24,7 @@ inherit autotools
>
>   EXTRA_OECONF = "\
>     --disable-gstreamer \
> -  --enable-alsa \
> +  ${@base_contains('DISTRO_FEATURES', 'alsa', '--enable-alsa', '--disable-alsa', d)} \
>     --enable-usb \
>     --enable-tools \
>     --enable-bccmd \

Thanks for the contribution, there are some adjustments that I would 
suggest making to more maintainable.

You should be using PACKAGECONFIG here instead of base_contains.


> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.99.bb b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> index 5033d34..5f1ef45 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.99.bb
> @@ -1,6 +1,6 @@
>   require bluez4.inc
>
> -PR = "r1"
> +PR = "r2"
>
>   SRC_URI += "file://bluetooth.conf \
>               file://sbc_mmx.patch \
> @@ -19,13 +19,16 @@ do_install_append() {
>
>   RDEPENDS_${PN}-dev = "bluez-hcidump"
>
> -PACKAGES =+ "libasound-module-bluez"
> +PACKAGES =+ "${@base_contains('DISTRO_FEATURES', 'alsa', 'libasound-module-bluez', '', d)}"
>
> -FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so ${datadir}/alsa"
> +FILES_libasound-module-bluez = "\
> +  ${@base_contains('DISTRO_FEATURES', 'alsa', '${libdir}/alsa-lib/lib*.so', '', d)} \
> +  ${@base_contains('DISTRO_FEATURES', 'alsa', '${datadir}/alsa', '', d)} \
> +"

Also, you can use ALLOW_EMPTY_libasound-module-bluez = "1" so that it 
does not matter if the files are available

>   FILES_${PN} += "${libdir}/bluetooth/plugins ${libdir}/bluetooth/plugins/*.so ${base_libdir}/udev/ ${systemd_unitdir}/"
>   FILES_${PN}-dev += "\
>     ${libdir}/bluetooth/plugins/*.la \
> -  ${libdir}/alsa-lib/*.la \
> +  ${@base_contains('DISTRO_FEATURES', 'alsa', '${libdir}/alsa-lib/*.la', '', d)} \
>   "
>
The base_contains is not needed here, if the alsa-lib/*.la files are not 
there then I don't think any warnings or errors will occur

>   FILES_${PN}-dbg += "\


