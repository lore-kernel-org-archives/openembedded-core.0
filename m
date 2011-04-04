Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Q6iFy-0006jD-Iz for openembedded-core@lists.openembedded.org;
	Mon, 04 Apr 2011 13:47:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BjcVk015510
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:45:38 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14972-09 for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Apr 2011 12:45:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p34BjXWo015500
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Apr 2011 12:45:33 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <b99cebc92f8dcab7c4a0128bb5a266672c0bd33d.1301631488.git.raj.khem@gmail.com>
References: <cover.1301631488.git.raj.khem@gmail.com>
	<b99cebc92f8dcab7c4a0128bb5a266672c0bd33d.1301631488.git.raj.khem@gmail.com>
Date: Mon, 04 Apr 2011 12:45:30 +0100
Message-ID: <1301917530.24596.336.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 07/46] libiconv: update from 1.9.2 -> 1.11.1
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
X-List-Received-Date: Mon, 04 Apr 2011 11:48:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-03-31 at 21:28 -0700, Khem Raj wrote:
> 1.11.1 was the last LGPLv2 release
> shared_preloadable_libiconv_linux.patch is needed to make libtool 2.4
> happy
> 
> Autoconf patch is similarly made to point m4 directory and update to
> newer autoconf

There is no header on these patches saying where the patches came from
and what they're for :(

Cheers,

Richard

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../libiconv/libiconv-1.11.1/autoconf.patch        |   42 ++++++++++++++++++++
>  .../shared_preloadable_libiconv_linux.patch        |   16 +++++++
>  meta/recipes-support/libiconv/libiconv_1.11.1.bb   |   30 ++++++++++++++
>  meta/recipes-support/libiconv/libiconv_1.9.2.bb    |   21 ----------
>  4 files changed, 88 insertions(+), 21 deletions(-)
>  create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
>  create mode 100644 meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
>  create mode 100644 meta/recipes-support/libiconv/libiconv_1.11.1.bb
>  delete mode 100644 meta/recipes-support/libiconv/libiconv_1.9.2.bb
> 
> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
> new file mode 100644
> index 0000000..377521b
> --- /dev/null
> +++ b/meta/recipes-support/libiconv/libiconv-1.11.1/autoconf.patch
> @@ -0,0 +1,42 @@
> +Index: libiconv-1.11.1/configure.ac
> +===================================================================
> +--- libiconv-1.11.1.orig/configure.ac
> ++++ libiconv-1.11.1/configure.ac
> +@@ -23,7 +23,7 @@ AC_CONFIG_AUX_DIR(build-aux)
> + AM_INIT_AUTOMAKE(libiconv, 1.11)
> + AC_CONFIG_HEADERS(config.h lib/config.h)
> + AC_PROG_MAKE_SET
> +-
> ++AC_CONFIG_MACRO_DIR([m4])
> + dnl           checks for basic programs
> + 
> + AC_PROG_CC
> +Index: libiconv-1.11.1/libcharset/configure.ac
> +===================================================================
> +--- libiconv-1.11.1.orig/libcharset/configure.ac
> ++++ libiconv-1.11.1/libcharset/configure.ac
> +@@ -16,17 +16,17 @@ dnl along with the GNU CHARSET Library;
> + dnl write to the Free Software Foundation, Inc., 51 Franklin Street,
> + dnl Fifth Floor, Boston, MA 02110-1301, USA.
> + 
> +-AC_PREREQ(2.13)
> ++AC_PREREQ(2.61)
> ++AC_INIT([libcharset],[1.4] )
> ++AC_CONFIG_SRCDIR([lib/localcharset.c])
> + 
> +-PACKAGE=libcharset
> +-VERSION=1.4
> +-
> +-AC_INIT(lib/localcharset.c)
> + AC_CONFIG_AUX_DIR(build-aux)
> + AC_CONFIG_HEADER(config.h)
> + AC_PROG_MAKE_SET
> +-AC_SUBST(PACKAGE)
> +-AC_SUBST(VERSION)
> ++dnl AC_SUBST(PACKAGE)
> ++dnl AC_SUBST(VERSION)
> ++
> ++AC_CONFIG_MACRO_DIR([m4])
> + 
> + dnl           checks for basic programs
> + 
> diff --git a/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
> new file mode 100644
> index 0000000..9f978c3
> --- /dev/null
> +++ b/meta/recipes-support/libiconv/libiconv-1.11.1/shared_preloadable_libiconv_linux.patch
> @@ -0,0 +1,16 @@
> +Index: libiconv-1.11.1/lib/Makefile.in
> +===================================================================
> +--- libiconv-1.11.1.orig/lib/Makefile.in
> ++++ libiconv-1.11.1/lib/Makefile.in
> +@@ -70,9 +70,9 @@ preloadable_libiconv.so : preloadable_li
> + 
> + preloadable_libiconv_linux.so : $(SOURCES)
> + 	if test -n "@GCC@"; then \
> +-	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
> ++	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -fPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
> + 	else \
> +-	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -shared -o preloadable_libiconv_linux.so; \
> ++	  $(LIBTOOL_LINK) $(CC) $(LDFLAGS) $(INCLUDES) $(CFLAGS) $(CPPFLAGS) $(DEFS) -KPIC -DPIC -DLIBICONV_PLUG $(SOURCES) -rpath $(libdir) -o libpreload_iconv.la && cp .libs/libpreload_iconv.so preloadable_libiconv_linux.so; \
> + 	fi
> + 
> + preloadable_libiconv_solaris.so : $(SOURCES)
> diff --git a/meta/recipes-support/libiconv/libiconv_1.11.1.bb b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> new file mode 100644
> index 0000000..28c70c8
> --- /dev/null
> +++ b/meta/recipes-support/libiconv/libiconv_1.11.1.bb
> @@ -0,0 +1,30 @@
> +DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
> +multiple character encodings, but that support lacks from your system."
> +HOMEPAGE = "http://www.gnu.org/software/libiconv"
> +SECTION = "libs"
> +PRIORITY = "optional"
> +NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
> +PROVIDES = "virtual/libiconv"
> +PR = "r0"
> +LICENSE = "LGPL"
> +LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674 \
> +                    file://libcharset/COPYING.LIB;md5=9f604d8a4f8e74f4f5140845a21b6674"
> +SRC_URI = "${GNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
> +           file://autoconf.patch \
> +	   file://shared_preloadable_libiconv_linux.patch \
> +          "
> +
> +SRC_URI[md5sum] = "d42b97f6ef5dd0ba4469d520ed732fed"
> +SRC_URI[sha256sum] = "e78c347a1a0cb15f2648519e9799151f4b4a934b61ad9ee7424478efe2b8257f"
> +
> +S = "${WORKDIR}/libiconv-${PV}"
> +
> +inherit autotools pkgconfig gettext
> +
> +EXTRA_OECONF += "--enable-shared --enable-static --enable-relocatable"
> +
> +LEAD_SONAME = "libiconv.so"
> +
> +do_configure_prepend () {
> +	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
> +}
> diff --git a/meta/recipes-support/libiconv/libiconv_1.9.2.bb b/meta/recipes-support/libiconv/libiconv_1.9.2.bb
> deleted file mode 100644
> index dac9e3c..0000000
> --- a/meta/recipes-support/libiconv/libiconv_1.9.2.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "GNU libiconv - libiconv is for you if your application needs to support \
> -multiple character encodings, but that support lacks from your system."
> -HOMEPAGE = "http://www.gnu.org/software/libiconv"
> -SECTION = "libs"
> -PRIORITY = "optional"
> -NOTES = "Needs to be stripped down to: ascii iso8859-1 eucjp iso-2022jp gb utf8"
> -PROVIDES = "virtual/libiconv"
> -PR = "r4"
> -LICENSE = "LGPL"
> -SRC_URI = "${GNU_MIRROR}/libiconv/libiconv-${PV}.tar.gz"
> -
> -S = "${WORKDIR}/libiconv-${PV}"
> -
> -inherit autotools pkgconfig
> -
> -EXTRA_OECONF += "--enable-shared --enable-static"
> -
> -do_configure () {
> -	rm -f m4/libtool.m4 libcharset/m4/libtool.m4
> -	autotools_do_configure
> -}




