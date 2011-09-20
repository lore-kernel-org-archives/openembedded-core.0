Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1R5zhh-0005FQ-IM
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Sep 2011 14:45:38 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 20 Sep 2011 05:40:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="50625073"
Received: from unknown (HELO helios.localnet) ([10.252.120.89])
	by orsmga002.jf.intel.com with ESMTP; 20 Sep 2011 05:40:18 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Sep 2011 13:40:16 +0100
User-Agent: KMail/1.13.6 (Linux/2.6.38-10-generic-pae; KDE/4.6.2; i686; ; )
References: <1316516896-6884-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1316516896-6884-1-git-send-email-koen@dominion.thruhere.net>
MIME-Version: 1.0
Message-Id: <201109201340.17057.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] bluez4: split gstreamer plugin into a seperate recipe
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
X-List-Received-Date: Tue, 20 Sep 2011 12:45:38 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Tuesday 20 September 2011 12:08:16 Koen Kooi wrote:
> This eliminates a good chunk of buildtime when building console-only image.
> 
> The bluez4 and this recipe share a .inc file since the source is the same.
> 
> Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ---
>  meta/recipes-connectivity/bluez/bluez4.inc         |   37 +++++++++++++++
>  meta/recipes-connectivity/bluez/bluez4_4.96.bb     |   49
> +++----------------- .../bluez/gst-plugin-bluetooth_4.96.bb             | 
>  28 +++++++++++ 3 files changed, 72 insertions(+), 42 deletions(-)
>  create mode 100644 meta/recipes-connectivity/bluez/bluez4.inc
>  create mode 100644
> meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
> 
> diff --git a/meta/recipes-connectivity/bluez/bluez4.inc
> b/meta/recipes-connectivity/bluez/bluez4.inc new file mode 100644
> index 0000000..cc9810e
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez/bluez4.inc
> @@ -0,0 +1,37 @@
> +SUMMARY = "Linux Bluetooth Stack Userland V4"
> +DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These
> include a system configurations, daemons, tools and system libraries."
> +HOMEPAGE = "http://www.bluez.org"
> +SECTION = "libs"
> +LICENSE = "GPLv2+ & LGPLv2.1+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> +                   
> file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \ +               
>    
> file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f9
> 26e \ +                   
> file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb1
> 91" +DEPENDS = "udev alsa-lib libusb dbus-glib"
> +RDEPENDS_${PN}-dev = "bluez-hcidump"
> +
> +ASNEEDED = ""
> +
> +SRC_URI = "\
> +  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> +"
> +S = "${WORKDIR}/bluez-${PV}"
> +
> +inherit autotools
> +
> +EXTRA_OECONF = "\
> +  --disable-gstreamer \
> +  --enable-alsa \
> +  --enable-usb \
> +  --enable-tools \
> +  --enable-bccmd \
> +  --enable-hid2hci \
> +  --enable-dfutool \
> +  --enable-hidd \
> +  --enable-pand \
> +  --enable-dund \
> +  --disable-cups \
> +  --enable-test \
> +  --enable-configfiles \
> +"
> +
> diff --git a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> b/meta/recipes-connectivity/bluez/bluez4_4.96.bb index 994cec7..505e8f7
> 100644
> --- a/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> +++ b/meta/recipes-connectivity/bluez/bluez4_4.96.bb
> @@ -1,47 +1,12 @@
> -SUMMARY = "Linux Bluetooth Stack Userland V4"
> -DESCRIPTION = "Linux Bluetooth stack V4 userland components.  These
> include a system configurations, daemons, tools and system libraries."
> -HOMEPAGE = "http://www.bluez.org"
> -SECTION = "libs"
> -LICENSE = "GPLv2+ & LGPLv2.1+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e \
> -                   
> file://COPYING.LIB;md5=fb504b67c50331fc78734fed90fb0e09 \ -               
>    
> file://src/main.c;beginline=1;endline=24;md5=9bc54b93cd7e17bf03f52513f39f9
> 26e \ -                   
> file://sbc/sbc.c;beginline=1;endline=25;md5=1a40781ed30d50d8639323a184aeb1
> 91" -DEPENDS = "udev gst-plugins-base alsa-lib libusb dbus-glib"
> -RDEPENDS_${PN}-dev = "bluez-hcidump"
> -
> -ASNEEDED = ""
> +require bluez4.inc
> 
> -PR = "r0"
> +PR = "r1"
> 
> -SRC_URI = "\
> -  ${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.gz \
> -  file://bluetooth.conf \
> -"
> +SRC_URI += "file://bluetooth.conf"
> 
>  SRC_URI[md5sum] = "296111afac49e3f9035085ac14daf518"
>  SRC_URI[sha256sum] =
> "c06fd50fd77909cad55e3181a42c6bce7cfcf7abb8cd87871c13d0d70f87fa99"
> 
> -S = "${WORKDIR}/bluez-${PV}"
> -
> -inherit autotools
> -
> -EXTRA_OECONF = "\
> -  --enable-gstreamer \
> -  --enable-alsa \
> -  --enable-usb \
> -  --enable-tools \
> -  --enable-bccmd \
> -  --enable-hid2hci \
> -  --enable-dfutool \
> -  --enable-hidd \
> -  --enable-pand \
> -  --enable-dund \
> -  --disable-cups \
> -  --enable-test \
> -  --enable-configfiles \
> -"
> -
>  do_install_append() {
>  	install -m 0644 ${S}/audio/audio.conf ${D}/${sysconfdir}/bluetooth/
>  	install -m 0644 ${S}/network/network.conf ${D}/${sysconfdir}/bluetooth/
> @@ -50,19 +15,19 @@ do_install_append() {
>  	install -m 0644 ${WORKDIR}/bluetooth.conf
> ${D}/${sysconfdir}/dbus-1/system.d/ }
> 
> -PACKAGES =+ "gst-plugin-bluez libasound-module-bluez"
> +RDEPENDS_${PN}-dev = "bluez-hcidump"
> +
> +PACKAGES =+ "libasound-module-bluez"
> 
> -FILES_gst-plugin-bluez = "${libdir}/gstreamer-0.10/lib*.so"
>  FILES_libasound-module-bluez = "${libdir}/alsa-lib/lib*.so
> ${datadir}/alsa" FILES_${PN} += "${libdir}/bluetooth/plugins/*.so
> ${base_libdir}/udev/ ${base_libdir}/systemd/" FILES_${PN}-dev += "\
>    ${libdir}/bluetooth/plugins/*.la \
>    ${libdir}/alsa-lib/*.la \
> -  ${libdir}/gstreamer-0.10/*.la \
>  "
> 
>  FILES_${PN}-dbg += "\
>    ${libdir}/bluetooth/plugins/.debug \
>    ${libdir}/*/.debug \
>    ${base_libdir}/udev/.debug \
> -"
> +
> diff --git a/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
> b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb new file
> mode 100644
> index 0000000..a137b12
> --- /dev/null
> +++ b/meta/recipes-connectivity/bluez/gst-plugin-bluetooth_4.96.bb
> @@ -0,0 +1,28 @@
> +require bluez4.inc
> +require recipes-multimedia/gstreamer/gst-plugins-package.inc
> +
> +DEPENDS = "bluez4 gst-plugins-base"
> +
> +EXTRA_OECONF = "\
> +  --enable-gstreamer \
> +"
> +
> +# clean unwanted files
> +do_install_append() {
> +	rm -rf ${D}${bindir}
> +	rm -rf ${D}${sbindir}
> +	rm -f  ${D}${libdir}/lib*
> +	rm -rf ${D}${sysconfdir}
> +	rm -rf ${D}${base_libdir}
> +}
> +
> +FILES_${PN} = "${libdir}/gstreamer-0.10/lib*.so"
> +FILES_${PN}-dev += "\
> +  ${libdir}/gstreamer-0.10/*.la \
> +"
> +
> +FILES_${PN}-dbg += "\
> +  ${libdir}/*/.debug \
> +"
> +
> +

Looks good to me!

Acked-by: Paul Eggleton <paul.eggleton@linux.intel.com>

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre


