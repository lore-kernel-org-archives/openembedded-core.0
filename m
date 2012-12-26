Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1TnvnD-00041Q-8O
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Dec 2012 19:33:33 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 26 Dec 2012 10:17:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,357,1355126400"; d="scan'208";a="263075112"
Received: from unknown (HELO [10.255.14.89]) ([10.255.14.89])
	by orsmga002.jf.intel.com with ESMTP; 26 Dec 2012 10:18:32 -0800
Message-ID: <50DB3F78.20409@linux.intel.com>
Date: Wed, 26 Dec 2012 10:18:32 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Constantin Musca <constantinx.musca@intel.com>
References: <cover.1356337650.git.constantinx.musca@intel.com>
	<7052eafcfa91495d9a4323c1437435cb68c95158.1356337650.git.constantinx.musca@intel.com>
In-Reply-To: <7052eafcfa91495d9a4323c1437435cb68c95158.1356337650.git.constantinx.musca@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 08/15] libfm: upgrade to 1.1.0
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
X-List-Received-Date: Wed, 26 Dec 2012 18:33:33 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/2012 12:34 AM, Constantin Musca wrote:
> fix-includedir-ln.patch: added
> - fix infinite link recursion by specifying the absolute path
> - fix make parallelism issues
>
> libfm_fix_for_automake-1.12.patch: removed
> - problem not reprodicible anymore
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> ---
>   .../libfm-0.1.17/libfm_fix_for_automake-1.12.patch | 48 ----------------------
>   .../configure_fix.patch                            |  0
If this patch is not being used any more, then it should be removed.

>   .../libfm/libfm-1.1.0/fix-includedir-ln.patch      | 45 ++++++++++++++++++++
What is the intent of this, it seems to be part of the cause of the 
pcmanfm failure.

See below

Sau!

>   .../libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb}      |  8 ++--
>   4 files changed, 49 insertions(+), 52 deletions(-)
>   delete mode 100644 meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
>   rename meta/recipes-support/libfm/{libfm-0.1.17 => libfm-1.1.0}/configure_fix.patch (100%)
>   create mode 100644 meta/recipes-support/libfm/libfm-1.1.0/fix-includedir-ln.patch
>   rename meta/recipes-support/libfm/{libfm_0.1.17.bb => libfm_1.1.0.bb} (75%)
>
> diff --git a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch b/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
> deleted file mode 100644
> index 3efb4dd..0000000
> --- a/meta/recipes-support/libfm/libfm-0.1.17/libfm_fix_for_automake-1.12.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -Upstream-Status: Pending
> -
> -This patch fixes following kind of issues with automake 1.12
> -| automake: warnings are treated as errors
> -| data/ui/Makefile.am:21: warning: '%'-style pattern rules are a GNU make extension
> -...
> -| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: warning: 'libfm-gtk.la': linking libtool libraries using a non-POSIX
> -| /srv/home/nitin/builds/build-gcc47/tmp/sysroots/x86_64-linux/usr/share/automake-1.12/am/ltlibrary.am: archiver requires 'AM_PROG_AR' in 'configure.ac'
> -...
> -| src/Makefile.am:21: warning: compiling 'glib-compat.c' with per-target flags requires 'AM_PROG_CC_C_O' in 'configure.ac'
> -
> -Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
> -2012/05/03
> -
> -Index: libfm-0.1.17/configure.ac
> -===================================================================
> ---- libfm-0.1.17.orig/configure.ac
> -+++ libfm-0.1.17/configure.ac
> -@@ -4,11 +4,17 @@
> - AC_PREREQ([2.63])
> - AC_INIT([libfm], [0.1.17], [http://pcmanfm.sorceforge.net/])
> - AM_INIT_AUTOMAKE([-Wall -Werror foreign])
> -+
> -+# automake 1.12 seems to require this, but automake 1.11 doesn't recognize it
> -+m4_pattern_allow([AM_PROG_AR])
> -+AM_PROG_AR
> -+
> - AC_CONFIG_MACRO_DIR(m4)
> - AC_CONFIG_HEADERS([config.h])
> -
> - # Checks for programs.
> - AC_PROG_CC
> -+AM_PROG_CC_C_O
> - AM_PROG_LIBTOOL
> -
> - # Checks for libraries.
> -Index: libfm-0.1.17/data/ui/Makefile.am
> -===================================================================
> ---- libfm-0.1.17.orig/data/ui/Makefile.am
> -+++ libfm-0.1.17/data/ui/Makefile.am
> -@@ -18,6 +18,6 @@ EXTRA_DIST = \
> - 	$(NULL)
> -
> - # Purge GtkBuilder UI files
> --%.ui: %.glade
> -+.glade.ui:
> - 	cp $< $@
> - 	$(top_builddir)/src/xml-purge $@
> diff --git a/meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch b/meta/recipes-support/libfm/libfm-1.1.0/configure_fix.patch
> similarity index 100%
> rename from meta/recipes-support/libfm/libfm-0.1.17/configure_fix.patch
> rename to meta/recipes-support/libfm/libfm-1.1.0/configure_fix.patch
> diff --git a/meta/recipes-support/libfm/libfm-1.1.0/fix-includedir-ln.patch b/meta/recipes-support/libfm/libfm-1.1.0/fix-includedir-ln.patch
> new file mode 100644
> index 0000000..3f06278
> --- /dev/null
> +++ b/meta/recipes-support/libfm/libfm-1.1.0/fix-includedir-ln.patch
> @@ -0,0 +1,45 @@
> +Fix infinite link recursion by specifying the absolute path
> +Fix make parallelism issues
> +
> +Upstream-Status: Pending
> +Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
> +
> +Index: libfm-1.1.0/src/Makefile.in
> +===================================================================
> +--- libfm-1.1.0.orig/src/Makefile.in
> ++++ libfm-1.1.0/src/Makefile.in
> +@@ -2523,8 +2523,6 @@ info: info-recursive
> + info-am:
> +
> + install-data-am: install-data-local install-giomodulesLTLIBRARIES \
> +-	install-libfmgtkincludeHEADERS install-libfmincludeHEADERS \
> +-	install-pkgincludeHEADERS
> +
> + install-dvi: install-dvi-recursive
> +
> +@@ -2617,7 +2615,9 @@ gtk/fm-gtk-marshal.h: gtk/fm-gtk-marshal
> + gtk/fm-gtk-marshal.c: gtk/fm-gtk-marshal.list
> + 	glib-genmarshal --body --prefix=fm_marshal $? > $@.tmp && mv $@.tmp $@
> +
> +-install-data-local:
> ++install-data-local: install-libfmgtkincludeHEADERS install-libfmincludeHEADERS \
> ++	install-pkgincludeHEADERS
> ++
> + 	@if test -e "$(DESTDIR)$(includedir)/@PACKAGE@"; then \
> + 		echo rm -rf "$(DESTDIR)$(includedir)/@PACKAGE@"; \
> + 		rm -rf "$(DESTDIR)$(includedir)/@PACKAGE@"; \
> +Index: libfm-1.1.0/src/Makefile.am
> +===================================================================
> +--- libfm-1.1.0.orig/src/Makefile.am
> ++++ libfm-1.1.0/src/Makefile.am
> +@@ -453,8 +453,8 @@ install-data-local:
> + 		echo rm -rf "$(DESTDIR)$(includedir)/@PACKAGE@"; \
> + 		rm -rf "$(DESTDIR)$(includedir)/@PACKAGE@"; \
> + 	fi
> +-	test -z "$(includedir)" || $(MKDIR_P) "$(DESTDIR)$(includedir)"
> +-	@LN_S@ @PACKAGE@-@FMLIBVER@ "$(DESTDIR)$(includedir)/@PACKAGE@"
> ++	rm -rf $(DESTDIR)$(includedir)/@PACKAGE@
> ++	@LN_S@ $(DESTDIR)$(includedir)/@PACKAGE@-@FMLIBVER@ $(DESTDIR)$(includedir)/@PACKAGE@
> +
this does not look right and I think produces the following:

tmp/sysroots/qemuarm/usr/include/libfm:
total 4
lrwxrwxrwx 1 sgw sgw 98 Dec 25 22:55 libfm-1.0 -> 
/intel/builds/world/tmp/work/armv5te-poky-linux-gnueabi/libfm/1.1.0-r0/image/usr/include/libfm-1.0

Notice linking back into the image dir, that's not correct.


> + uninstall-local:
> + 	@if test -L "$(DESTDIR)$(includedir)/@PACKAGE@"; then \
> diff --git a/meta/recipes-support/libfm/libfm_0.1.17.bb b/meta/recipes-support/libfm/libfm_1.1.0.bb
> similarity index 75%
> rename from meta/recipes-support/libfm/libfm_0.1.17.bb
> rename to meta/recipes-support/libfm/libfm_1.1.0.bb
> index 2cac361..7282871 100644
> --- a/meta/recipes-support/libfm/libfm_0.1.17.bb
> +++ b/meta/recipes-support/libfm/libfm_1.1.0.bb
> @@ -10,14 +10,14 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
>   SECTION = "x11/libs"
>   DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native"
>
> -PR = "r4"
> +PR = "r0"
>
>   SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.gz \
> -           file://libfm_fix_for_automake-1.12.patch \
> +           file://fix-includedir-ln.patch \
>              "
>
> -SRC_URI[md5sum] = "a97e03d973e6ac727f28d0934d6c9ad5"
> -SRC_URI[sha256sum] = "1740681cff4cd4c5a2eaa9805d8898269cfb6a49a0bda0acb242def15bc7131b"
> +SRC_URI[md5sum] = "a5bc8b8291cf810c659bfb3af378b5de"
> +SRC_URI[sha256sum] = "b9426e588670b53570b808c49abd1d103863614dd3622559b8c3ef1392fe0b3d"
>
>   inherit autotools pkgconfig
>
>


