Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrIFq-00028c-O7
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 01:32:07 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 10 Aug 2011 16:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,353,1309762800"; 
   d="scan'208";a="5975312"
Received: from unknown (HELO [10.255.14.248]) ([10.255.14.248])
	by AZSMGA002.ch.intel.com with ESMTP; 10 Aug 2011 16:27:34 -0700
Message-ID: <4E4313E5.4000709@linux.intel.com>
Date: Wed, 10 Aug 2011 16:27:33 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.17) Gecko/20110428 Fedora/3.1.10-1.fc13 Thunderbird/3.1.10
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>
In-Reply-To: <1311846297-30202-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCHv2] gst-plugins: partially sync packaging with OE	.dev
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
X-List-Received-Date: Wed, 10 Aug 2011 23:32:07 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/28/2011 02:44 AM, Koen Kooi wrote:
> Gst-plugins get 2 extra packages:
>
> ${PN}-apps: helper apps in ${bindir}
> ${PN}-meta: meta package that will drag in all plugins, libs and apps ${PN} generates
>
> And all libs are split out and run through debian style renaming if enabled.
>
> The packaging include was split out to be reused by external plugins (e.g. gst-plugin-gl, gst-fluendo-*).
>
> The new package list looks like:
>
> libgstapp-0.10-0_0.10.32-r1_armv7a.ipk
> libgstfft-0.10-0_0.10.32-r1_armv7a.ipk
> [..]
> gst-plugins-base-videorate_0.10.32-r1_armv7a.ipk
> gst-plugins-base-videoscale_0.10.32-r1_armv7a.ipk
> [..]
> gst-plugins-base-meta_0.10.32-r1_armv7a.ipk
> [..]
> gst-plugins-base-apps_0.10.32-r1_armv7a.ipk
>
> Signed-off-by: Koen Kooi<koen@dominion.thruhere.net>
> ---
>
> Changes since v1:
> 	* keep gst-plugin-{base,good,base,ugly}-foo naming, this will get addressed in a follow-up patch
>
>   .../gstreamer/gst-plugins-bad_0.10.21.bb           |    2 +-
>   .../gstreamer/gst-plugins-base_0.10.32.bb          |    2 +-
>   .../gstreamer/gst-plugins-good_0.10.28.bb          |    2 +-
>   .../gstreamer/gst-plugins-package.inc              |   34 ++++++++++++++++++++
>   .../gstreamer/gst-plugins-ugly_0.10.17.bb          |    2 +-
>   meta/recipes-multimedia/gstreamer/gst-plugins.inc  |   18 +---------
>   6 files changed, 40 insertions(+), 20 deletions(-)
>   create mode 100644 meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> index 2b8a89c..a7023e3 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-bad_0.10.21.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=0636e73ff0215e8d672dc4c32c317bb3 \
>
>   DEPENDS += "gst-plugins-base libmusicbrainz tremor librsvg"
>
> -PR = "r0"
> +PR = "r1"
>
>   inherit gettext
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> index a9e2b52..82d9afc 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-base_0.10.32.bb
> @@ -13,7 +13,7 @@ SRC_URI += " file://gst-plugins-base-tremor.patch"
>   SRC_URI[md5sum] = "2920af2b3162f3d9fbaa7fabc8ed4d38"
>   SRC_URI[sha256sum] = "e9aabfac83f6480896da0686e9c911989f896fbad634821b7771ed84a446172b"
>
> -PR = "r0"
> +PR = "r1"
>
>   inherit gettext
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
> index b9648e3..cca63e9 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-good_0.10.28.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>
>   DEPENDS += "gst-plugins-base gconf cairo jpeg libpng gtk+ zlib libid3tag flac \
>   	    speex libsoup-2.4"
> -PR = "r0"
> +PR = "r1"
>
>   inherit gettext
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> new file mode 100644
> index 0000000..796df14
> --- /dev/null
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-package.inc
> @@ -0,0 +1,34 @@
> +LIBV = "0.10"
> +
> +python populate_packages_prepend () {
> +	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
> +	postinst = bb.data.getVar('plugin_postinst', d, 1)
> +	glibdir = bb.data.expand('${libdir}', d)
> +
> +	do_split_packages(d, glibdir, '^lib(.*)\.so\.*', 'lib%s', 'gstreamer %s library', extra_depends='', allow_links=True)
> +	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
> +	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
> +	
> +	pn = bb.data.getVar('PN', d, 1)
> +	metapkg =  pn + '-meta'
> +	bb.data.setVar('ALLOW_EMPTY_' + metapkg, "1", d)
> +	bb.data.setVar('FILES_' + metapkg, "", d)
> +	blacklist = [ pn + '-locale', pn + '-dev', pn + '-dbg', pn + '-doc' ]
> +	metapkg_rdepends = []
> +	packages = bb.data.getVar('PACKAGES', d, 1).split()
> +	for pkg in packages[1:]:
> +		if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.count('locale') and not pkg.count('-static'):
> +			metapkg_rdepends.append(pkg)
> +	bb.data.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends), d)
> +	bb.data.setVar('DESCRIPTION_' + metapkg, pn + ' meta package', d)
> +}
> +
> +ALLOW_EMPTY = "1"
> +
> +PACKAGES += "${PN}-apps ${PN}-meta"
> +FILES_${PN}-apps = "${bindir}"
> +
> +FILES_${PN} = "${datadir}/gstreamer-${LIBV}"
> +FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
> +
> +
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
> index 76e00a5..2a79c2a 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins-ugly_0.10.17.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343 \
>                       file://gst/mpegstream/gstmpegparse.h;beginline=1;endline=18;md5=ff65467b0c53cdfa98d0684c1bc240a9"
>
>   DEPENDS += "gst-plugins-base libid3tag libmad mpeg2dec liba52 lame"
> -PR = "r0"
> +PR = "r1"
>
>   inherit gettext
>
> diff --git a/meta/recipes-multimedia/gstreamer/gst-plugins.inc b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> index ad6c3a4..b23d399 100644
> --- a/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> +++ b/meta/recipes-multimedia/gstreamer/gst-plugins.inc
> @@ -14,13 +14,6 @@ EXTRA_OECONF = "--disable-valgrind --disable-debug --disable-examples "
>
>   acpaths = "-I ${S}/common/m4 -I ${S}/m4"
>
> -LIBV = "0.10"
> -#FILES_${PN} += "${libdir}/gstreamer-${LIBV}/*.so"
> -#FILES_${PN}-dev += "${libdir}/gstreamer-${LIBV}/*.la ${libdir}/gstreamer-${LIBV}/*.a"
> -FILES_${PN}-dbg += "${libdir}/gstreamer-${LIBV}/.debug"
> -
> -PACKAGES_DYNAMIC = "${PN}-*"
> -
>   # orc.m4 calls pkg-config ----variable=orcc orc-0.4 to get the path to orcc,
>   # resulting in /usr/bin/orcc. Force it to use the staged orcc.
>   do_configure_append() {
> @@ -29,14 +22,7 @@ do_configure_append() {
>    	done
>   }
>
> -python populate_packages_prepend () {
> -	gst_libdir = bb.data.expand('${libdir}/gstreamer-${LIBV}', d)
> -	postinst = bb.data.getVar('plugin_postinst', d, 1)
> +require gst-plugins-package.inc
>
> -#	Can't package separate debug packages yet
> -#	do_split_packages(d, gst_libdir, '\.debug/libgst(.*)\.so$', bb.data.expand('${PN}-%s-dbg', d), 'GStreamer plugin for %s (with debugging symbols)', recursive=True, extra_depends=bb.data.expand('${PN}-dbg', d), match_path=True)
> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.so$', bb.data.expand('${PN}-%s', d), 'GStreamer plugin for %s', postinst=postinst, extra_depends=bb.data.expand('${PN}',d))
> -	do_split_packages(d, gst_libdir, 'libgst(.*)\.l?a$', bb.data.expand('${PN}-%s-dev', d), 'GStreamer plugin for %s (development files)', extra_depends=bb.data.expand('${PN}-dev',d))
> -}
> +PACKAGES_DYNAMIC = "${PN}-*"
>
> -ALLOW_EMPTY = "1"

Merged to OE-Core

Thanks
	Sau!


