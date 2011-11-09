Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1ROA1c-0003hw-72 for openembedded-core@lists.openembedded.org;
	Wed, 09 Nov 2011 16:25:16 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9FJ1rP016466
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 15:19:01 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16128-02 for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2011 15:18:56 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id pA9FIs3U016460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 9 Nov 2011 15:18:55 GMT
Message-ID: <1320851936.10843.185.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Wed, 09 Nov 2011 15:18:56 +0000
In-Reply-To: <227a87e41b4906aeadd7f878c221beb9f938b1af.1320799787.git.josh@linux.intel.com>
References: <cover.1320799787.git.josh@linux.intel.com>
	<227a87e41b4906aeadd7f878c221beb9f938b1af.1320799787.git.josh@linux.intel.com>
X-Mailer: Evolution 3.2.1- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 3/3] gconf: add upstream GNOME gconf 3.2.3 and drop gconf-dbus
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
X-List-Received-Date: Wed, 09 Nov 2011 15:25:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2011-11-08 at 16:53 -0800, Joshua Lock wrote:
> The D-Bus backend has been integrated into upstream GConf so we can
> switch to upstream and drop gconf-dbus.
> 
> I've gone for a release in the 3.2 series as we disable Gtk+, and
> therefore are not impacted by the gtk+3 changes, and the D-Bus backend
> was unstable before this release.
> 
> Signed-off-by: Joshua Lock <josh@linux.intel.com>
> ---
>  meta/conf/distro/include/default-providers.inc     |    2 -
>  meta/conf/multilib.conf                            |    2 +-
>  meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch |   59 ++++++++++++++++++++
>  meta/recipes-gnome/gnome/gconf-dbus_705.bb         |   43 --------------
>  meta/recipes-gnome/gnome/gconf_3.2.3.bb            |   43 ++++++++++++++
>  5 files changed, 103 insertions(+), 46 deletions(-)
>  create mode 100644 meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
>  delete mode 100644 meta/recipes-gnome/gnome/gconf-dbus_705.bb
>  create mode 100644 meta/recipes-gnome/gnome/gconf_3.2.3.bb
> 
> diff --git a/meta/conf/distro/include/default-providers.inc b/meta/conf/distro/include/default-providers.inc
> index be23d36..afea5e7 100644
> --- a/meta/conf/distro/include/default-providers.inc
> +++ b/meta/conf/distro/include/default-providers.inc
> @@ -21,8 +21,6 @@ VIRTUAL-RUNTIME_update-alternatives ?= "update-alternatives-cworth"
>  #
>  PREFERRED_PROVIDER_dbus-glib ?= "dbus-glib"
>  PREFERRED_PROVIDER_dbus-glib-native ?= "dbus-glib-native"
> -PREFERRED_PROVIDER_gconf ?= "gconf-dbus"
> -PREFERRED_PROVIDER_gconf-native ?= "gconf-dbus-native"
>  PREFERRED_PROVIDER_gdk-pixbuf ?= "gdk-pixbuf"
>  PREFERRED_PROVIDER_libgcc ?= "libgcc"
>  PREFERRED_PROVIDER_libgcc-nativesdk ?= "libgcc-nativesdk"
> diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
> index 5e4b435..de53540 100644
> --- a/meta/conf/multilib.conf
> +++ b/meta/conf/multilib.conf
> @@ -103,7 +103,7 @@ BBCLASSEXTEND_append_pn-gcc-cross-initial = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gcc-cross-intermediate = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gcc-cross = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gcc-runtime = " ${MULTILIBS}"
> -BBCLASSEXTEND_append_pn-gconf-dbus = " ${MULTILIBS}"
> +BBCLASSEXTEND_append_pn-gconf = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gdbm = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gdb = " ${MULTILIBS}"
>  BBCLASSEXTEND_append_pn-gdk-pixbuf = " ${MULTILIBS}"
> diff --git a/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch b/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
> new file mode 100644
> index 0000000..29181e3
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/gconf-3.2.3/nointro.patch
> @@ -0,0 +1,59 @@
> +This is a hacky way to prevent GConf from trying to build the introspection related pieces.
> +Clearly not appropriate for upstream.
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Joshua Lock <josh@linux.intel.com>
> +
> +Index: GConf-3.2.2/gconf/Makefile.am
> +===================================================================
> +--- GConf-3.2.2.orig/gconf/Makefile.am
> ++++ GConf-3.2.2/gconf/Makefile.am
> +@@ -145,34 +145,6 @@ libgconf_2_la_LDFLAGS = -version-info $(
> + 
> + libgconf_2_la_LIBADD = $(INTLLIBS) $(DEPENDENT_LIBS) $(DEPENDENT_DBUS_LIBS) $(DEPENDENT_ORBIT_LIBS)
> + 
> +--include $(INTROSPECTION_MAKEFILE)
> +-INTROSPECTION_GIRS =
> +-INTROSPECTION_SCANNER_ARGS = --warn-all --add-include-path=$(srcdir)
> +-INTROSPECTION_COMPILER_ARGS= --includedir=$(srcdir)
> +-
> +-if HAVE_INTROSPECTION
> +-introspection_files =				\
> +-	$(gconfinclude_HEADERS)			\
> +-	$(filter-out $(CORBA_SOURCECODE), $(filter %.c,$(libgconf_2_la_SOURCES)))
> +-GConf-2.0.gir: libgconf-2.la Makefile
> +-GConf_2_0_gir_INCLUDES = GObject-2.0
> +-GConf_2_0_gir_CFLAGS = \
> +-	$(INCLUDES)
> +-GConf_2_0_gir_LIBS = libgconf-2.la
> +-GConf_2_0_gir_FILES = $(addprefix $(srcdir)/, $(introspection_files))
> +-GConf_2_0_gir_SCANNERFLAGS = --identifier-prefix=GConf --symbol-prefix=gconf --c-include "gconf/gconf.h"
> +-GConf_2_0_gir_EXPORT_PACKAGES = gconf-2.0
> +-INTROSPECTION_GIRS += GConf-2.0.gir
> +-
> +-girdir = $(datadir)/gir-1.0/
> +-gir_DATA = $(INTROSPECTION_GIRS)
> +-
> +-typelibsdir = $(libdir)/girepository-1.0/
> +-typelibs_DATA = $(INTROSPECTION_GIRS:.gir=.typelib)
> +-
> +-CLEANFILES += $(gir_DATA) $(typelibs_DATA)
> +-endif
> +-
> + EXTRA_DIST=GConfX.idl default.path.in org.gnome.GConf.service.in gconfmarshal.list regenerate-enum-header.sh regenerate-enum-footer.sh
> + 
> + default.path: $(srcdir)/default.path.in
> +Index: GConf-3.2.2/configure.in
> +===================================================================
> +--- GConf-3.2.2.orig/configure.in
> ++++ GConf-3.2.2/configure.in
> +@@ -354,8 +354,6 @@ AM_GLIB_GNU_GETTEXT
> + 
> + AC_CHECK_FUNCS(bind_textdomain_codeset)
> + 
> +-GOBJECT_INTROSPECTION_CHECK([0.9.5])
> +-
> + AC_SUBST(CFLAGS)
> + AC_SUBST(CPPFLAGS)
> + AC_SUBST(LDFLAGS)
> diff --git a/meta/recipes-gnome/gnome/gconf-dbus_705.bb b/meta/recipes-gnome/gnome/gconf-dbus_705.bb
> deleted file mode 100644
> index 52e8a08..0000000
> --- a/meta/recipes-gnome/gnome/gconf-dbus_705.bb
> +++ /dev/null
> @@ -1,43 +0,0 @@
> -DESCRIPTION = "Settings daemon using DBUS for communication."
> -SECTION = "x11/utils"
> -LICENSE = "LGPLv2+"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> -
> -DEPENDS = "intltool-native virtual/libintl glib-2.0 dbus dbus-glib libxml2 popt gtk-doc-native"
> -PROVIDES = "gconf"
> -RPROVIDES_${PN} = "gconf"
> -RPROVIDES_${PN}-dev = "gconf-dev"
> -
> -#SRCREV = "705"
> -#PV = "2.16.0+svnr${SRCPV}"
> -PR = "r2"
> -
> -# This SVN repo is no longer available use a tarball mirror site until
> -# we move to proper gconf recipe.
> -#SRC_URI = "svn://developer.imendio.com/svn/gconf-dbus;module=trunk;proto=http"
> -SRC_URI = "http://autobuilder.pokylinux.org/sources/trunk_developer.imendio.com_.svn.gconf-dbus_705_.tar.gz"
> -
> -SRC_URI[md5sum] = "dba8d534b0c6262d24817c842b36369d"
> -SRC_URI[sha256sum] = "5552b1884d42d4072a199c93e35a28dc1799f9166baefbf9243394966039e416"
> -
> -S = "${WORKDIR}/trunk"
> -
> -inherit pkgconfig autotools
> -
> -PARALLEL_MAKE = ""
> -
> -
> -EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes"
> -
> -
> -do_configure_prepend() {
> -        touch gtk-doc.make
> -}
> -
> -FILES_${PN} = "${libdir}/GConf-dbus/2/*.so ${libdir}/dbus-1.0 ${sysconfdir} ${datadir}/dbus* ${libdir}/*.so.* ${bindir}/* ${libexecdir}/*"
> -FILES_${PN}-dbg += " ${libdir}/GConf-dbus/2/.debug"
> -FILES_${PN}-dev += "${datadir}/sgml/gconf/gconf-1.0.dtd \
> -		    ${libdir}/GConf-dbus/2/*.la"
> -
> -BBCLASSEXTEND = "native"
> -
> diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> new file mode 100644
> index 0000000..0e06cb5
> --- /dev/null
> +++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
> @@ -0,0 +1,43 @@
> +DESCRIPTION = "GNOME configuration system"
> +SECTION = "x11/gnome"
> +LICENSE = "LGPLv2+"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
> +
> +DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"

I can't build a sato image with this due to nothing providing
polkit-native :(

Cheers,

Richard



