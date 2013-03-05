Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UCoGP-0000U0-9P for openembedded-core@lists.openembedded.org;
	Tue, 05 Mar 2013 10:34:25 +0100
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r259PcLH012949; Tue, 5 Mar 2013 09:25:38 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 8LAwFnxpeNJH; Tue,  5 Mar 2013 09:25:38 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r259PYLI012945
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Tue, 5 Mar 2013 09:25:37 GMT
Message-ID: <1362475056.29587.77.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Ross Burton <ross.burton@intel.com>
Date: Tue, 05 Mar 2013 09:17:36 +0000
In-Reply-To: <eefbfac657e1cae6e2eb915ad8e101caf1d05014.1362401323.git.ross.burton@intel.com>
References: <cover.1362401323.git.ross.burton@intel.com>
	<eefbfac657e1cae6e2eb915ad8e101caf1d05014.1362401323.git.ross.burton@intel.com>
X-Mailer: Evolution 3.6.3-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] gtk-update-icon-cache-native: add
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Mar 2013 09:34:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2013-03-04 at 12:52 +0000, Ross Burton wrote:
> This recipe builds natively just the gtk-update-icon-cache binary that is
> required to run the gtk-icon-cache.bbclass postinstall scripts.
> 
> The advantage of doing this is it means running 400 less tasks which takes four
> minutes on my machine, as the alternative is building GTK+ natively (and so
> libX11, freetype, fontconfig...).
> 
> Signed-off-by: Ross Burton <ross.burton@intel.com>
> ---
>  .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |   44 ++++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> 
> diff --git a/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> new file mode 100644
> index 0000000..5941bbd
> --- /dev/null
> +++ b/meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb
> @@ -0,0 +1,44 @@
> +SUMMARY = "gtk-update-icon-cache built natively"
> +DESCRIPTION = "Just gtk-update-icon-cache built from GTK+ natively, for on-host postinst script execution."
> +SECTION = "libs"
> +
> +PROVIDES = "virtual/gtk-update-icon-cache-native"
> +
> +DEPENDS = "gdk-pixbuf-native"
> +
> +LICENSE = "LGPLv2 & LGPLv2+ & LGPLv2.1+"
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2 \
> +                    file://gtk/gtk.h;endline=25;md5=1d8dc0fccdbfa26287a271dce88af737 \
> +                    file://gdk/gdk.h;endline=25;md5=c920ce39dc88c6f06d3e7c50e08086f2 \
> +                    file://tests/testgtk.c;endline=25;md5=cb732daee1d82af7a2bf953cf3cf26f1"
> +
> +SRC_URI = "http://download.gnome.org/sources/gtk+/3.4/gtk+-${PV}.tar.xz"
> +SRC_URI[md5sum] = "1b2cf29502a6394e8d4b30f7f5bb9131"
> +SRC_URI[sha256sum] = "f154e460075034da4c0ce89c320025dcd459da2a1fdf32d92a09522eaca242c7"
> +
> +S = "${WORKDIR}/gtk+-${PV}"
> +
> +inherit pkgconfig native
> +
> +PKG_CONFIG_FOR_BUILD = "${STAGING_BINDIR_NATIVE}/pkg-config-native"
> +
> +do_configure() {
> +	# Quite ugly but defines enough to compile the tool.
> +	if ! test -f gtk/config.h; then
> +		echo "#define GETTEXT_PACKAGE \"gtk30\"" >> gtk/config.h
> +		echo "#define HAVE_UNISTD_H 1" >> gtk/config.h
> +		echo "#define HAVE_FTW_H 1" >> gtk/config.h
> +
> +	fi
> +}
> +
> +do_compile() {
> +	${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS} $(${PKG_CONFIG_FOR_BUILD} --cflags --libs gdk-pixbuf-2.0) \
> +		-o gtk-update-icon-cache ${S}/gtk/updateiconcache.c

I saw failures when building locally for this, I think its down to
linker order. Moving ${S}/gtk/updateiconcache.c before the pkg-config
libs made it work...

Cheers,

Richard





