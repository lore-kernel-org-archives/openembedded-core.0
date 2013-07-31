Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9797B6A9C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 22:34:13 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 31 Jul 2013 15:34:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,790,1367996400"; d="scan'208";a="275983684"
Received: from unknown (HELO [10.255.13.203]) ([10.255.13.203])
	by AZSMGA002.ch.intel.com with ESMTP; 31 Jul 2013 15:34:12 -0700
Message-ID: <51F990E4.3060505@linux.intel.com>
Date: Wed, 31 Jul 2013 15:34:12 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130514 Thunderbird/17.0.6
MIME-Version: 1.0
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
References: <cover.1375275560.git.laurentiu.palcu@intel.com>
	<435e5b32a36fbc1e2eabda8d9ed1eff7273673c5.1375275560.git.laurentiu.palcu@intel.com>
In-Reply-To: <435e5b32a36fbc1e2eabda8d9ed1eff7273673c5.1375275560.git.laurentiu.palcu@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/13] subversion: upgrade to 1.8.1
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
X-List-Received-Date: Wed, 31 Jul 2013 22:34:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/31/2013 06:09 AM, Laurentiu Palcu wrote:
> This patch adds a new recipe actually, for 1.8.1. The reason for that is
> that subversion supports the 1.7 release with security patches and
> fixes for critical bugs only. The recommended version, however, is 1.8.
>
I am still not sure why you want to retain 1.7?  1.8 has addressed the 
same bugs and security fixes, correct?  We do not normally keep older 
versions around.

Also, there was also an update to opkg and the newer 1.8 was not parsing 
the URL correctly.
> NOTE: Executing RunQueue Tasks
> WARNING: Failed to fetch URL svn://opkg.googlecode.com/svn;module=trunk;protocol=http, attempting MIRRORS if available
> ERROR: Fetcher failure: Fetch command failed with exit code 1, output:
> svn: E170000: Unrecognized URL scheme for 'http://opkg.googlecode.com/svn/trunk'
>
> ERROR: Function failed: Fetcher failure for URL: 'svn://opkg.googlecode.com/svn;module=trunk;protocol=http'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /srv/ssd/sgw/builds/world/tmp/work/x86_64-linux/opkg-native/1_0.1.8+svnr650-r13.0/temp/log.do_fetch.9948
> ERROR: Task 0 (virtual:native:/srv/ssd/sgw/poky/meta/recipes-devtools/opkg/opkg_svn.bb, do_fetch) failed with exit code '1'
> NOTE: Tasks Summary: Attempted 141 tasks of which 140 didn't need to be rerun and 1 failed.
>

I tried running the svn command by hand it it infact did fail with 1.8, 
but worked with the 1.7 release.


>  /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/svn --non-interactive --trust-server-cert co --no-auth-cache -r 650 http://opkg.googlecode.com/svn/trunk@650 trunk
> svn: E170000: Unrecognized URL scheme for 'http://opkg.googlecode.com/svn/trunk'

It looks like you are missing some modules or configuration:

1.7:
>  /srv/hdd/builds/world/tmp/sysroots/x86_64-linux/usr/bin/svn --version
> svn, version 1.7.10 (r1485443)
>    compiled Jul 31 2013, 14:37:01
>
> Copyright (C) 2013 The Apache Software Foundation.
> This software consists of contributions made by many people; see the NOTICE
> file for more information.
> Subversion is open source software, see http://subversion.apache.org/
>
> The following repository access (RA) modules are available:
>
> * ra_neon : Module for accessing a repository via WebDAV protocol using Neon.
>   - handles 'http' scheme
>   - handles 'https' scheme
> * ra_svn : Module for accessing a repository using the svn network protocol.
>   - handles 'svn' scheme
> * ra_local : Module for accessing a repository on local disk.
>   - handles 'file' scheme
>

1.8:
> /srv/ssd/sgw/builds/world/tmp/sysroots/x86_64-linux/usr/bin/svn --version
> svn, version 1.8.1 (r1503906)
>    compiled Jul 31 2013, 10:32:05 on x86_64-pc-linux-gnu
>
> Copyright (C) 2013 The Apache Software Foundation.
> This software consists of contributions made by many people;
> see the NOTICE file for more information.
> Subversion is open source software, see http://subversion.apache.org/
>
> The following repository access (RA) modules are available:
>
> * ra_svn : Module for accessing a repository using the svn network protocol.
>   - handles 'svn' scheme
> * ra_local : Module for accessing a repository on local disk.
>   - handles 'file' scheme
>

Notice the missing RA Module for http(s) - ra_neon

Sau!

> Additionaly:
>   * change libtool2.patch to apply clean on the new version;
>   * removed fix-install-depends.patch since neon support has been removed
>     completely from 1.8;
>   * remove the 'neon' RDEPENDS/DEPENDS too from the reason explained above;
>   * added disable_mac_checks.patch in order to avoid MAC OS features checks.
>     Otherwise we'll end up with a configure error when cross-compiling;
>   * removed 1.6 recipes since this version is no longer supported by
>     subversion;
>   * licence changed slightly with the addition of a small piece for
>     libsvn_subr/utf_width.c (see below):
>
>         "Markus Kuhn -- 2007-05-26 (Unicode 5.0)
>
>         Permission to use, copy, modify, and distribute this software
>         for any purpose and without fee is hereby granted. The author
>         disclaims all warranties with regard to this software."
>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> ---
>   .../subversion-1.8.1/disable_mac_checks.patch      |   21 +++++++++
>   .../libtool2.patch                                 |   14 +++---
>   .../subversion/disable-revision-install.patch      |   36 ----------------
>   .../subversion/fix-install-depends.patch           |   45 --------------------
>   .../{subversion_1.6.15.bb => subversion_1.8.1.bb}  |   24 +++++------
>   5 files changed, 40 insertions(+), 100 deletions(-)
>   create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.1/disable_mac_checks.patch
>   rename meta/recipes-devtools/subversion/{subversion => subversion-1.8.1}/libtool2.patch (54%)
>   delete mode 100644 meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
>   delete mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
>   rename meta/recipes-devtools/subversion/{subversion_1.6.15.bb => subversion_1.8.1.bb} (54%)
>
> diff --git a/meta/recipes-devtools/subversion/subversion-1.8.1/disable_mac_checks.patch b/meta/recipes-devtools/subversion/subversion-1.8.1/disable_mac_checks.patch
> new file mode 100644
> index 0000000..e8e1009
> --- /dev/null
> +++ b/meta/recipes-devtools/subversion/subversion-1.8.1/disable_mac_checks.patch
> @@ -0,0 +1,21 @@
> +Upstream-Status: Inappropriate (embedded specific)
> +
> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> +
> +Index: subversion-1.8.1/configure.ac
> +===================================================================
> +--- subversion-1.8.1.orig/configure.ac	2013-07-30 14:44:23.745412720 +0300
> ++++ subversion-1.8.1/configure.ac	2013-07-30 14:45:19.784154761 +0300
> +@@ -484,9 +484,9 @@
> +
> + dnl Mac OS specific features -------------------
> +
> +-SVN_LIB_MACHO_ITERATE
> +-SVN_LIB_MACOS_PLIST
> +-SVN_LIB_MACOS_KEYCHAIN
> ++#SVN_LIB_MACHO_ITERATE
> ++#SVN_LIB_MACOS_PLIST
> ++#SVN_LIB_MACOS_KEYCHAIN
> +
> + dnl APR_HAS_DSO -------------------
> +
> diff --git a/meta/recipes-devtools/subversion/subversion/libtool2.patch b/meta/recipes-devtools/subversion/subversion-1.8.1/libtool2.patch
> similarity index 54%
> rename from meta/recipes-devtools/subversion/subversion/libtool2.patch
> rename to meta/recipes-devtools/subversion/subversion-1.8.1/libtool2.patch
> index 32f88b7..4cc148a 100644
> --- a/meta/recipes-devtools/subversion/subversion/libtool2.patch
> +++ b/meta/recipes-devtools/subversion/subversion-1.8.1/libtool2.patch
> @@ -1,10 +1,12 @@
>   Upstream-Status: Inappropriate [embedded specific]
>
> -Index: subversion-1.5.5/configure.ac
> +Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
> +
> +Index: subversion-1.8.1/configure.ac
>   ===================================================================
> ---- subversion-1.5.5.orig/configure.ac	2008-08-26 18:27:56.000000000 +0100
> -+++ subversion-1.5.5/configure.ac	2009-01-07 18:00:47.000000000 +0000
> -@@ -153,8 +153,8 @@
> +--- subversion-1.8.1.orig/configure.ac	2013-07-30 13:41:09.000000000 +0300
> ++++ subversion-1.8.1/configure.ac	2013-07-30 13:45:01.430887155 +0300
> +@@ -226,8 +226,8 @@
>      LIBTOOL="$sh_libtool"
>      SVN_LIBTOOL="$sh_libtool"
>    else
> @@ -12,6 +14,6 @@ Index: subversion-1.5.5/configure.ac
>   -  SVN_LIBTOOL="\$(SHELL) $sh_libtool"
>   +  sh_libtool="$abs_builddir/$host_alias-libtool"
>   +  SVN_LIBTOOL="\$(SHELL) \$(abs_builddir)/$host_alias-libtool"
> -   dnl libtoolize requires that the following line not be indented
> - ifdef([LT_INIT], [LT_INIT], [AC_PROG_LIBTOOL])
>    fi
> + AC_SUBST(SVN_LIBTOOL)
> +
> diff --git a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch b/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
> deleted file mode 100644
> index 66450fa..0000000
> --- a/meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -Upstream-Status: Inappropriate [embedded specific]
> -
> -Index: subversion-1.6.15/Makefile.in
> -===================================================================
> ---- subversion-1.6.15.orig/Makefile.in	2010-11-17 06:47:23.000000000 -0800
> -+++ subversion-1.6.15/Makefile.in	2011-01-31 10:11:07.358779686 -0800
> -@@ -305,7 +305,7 @@
> - clean: external-clean local-clean
> - distclean: external-distclean local-distclean
> - extraclean: external-extraclean local-extraclean
> --install: external-install local-install revision-install
> -+install: external-install local-install #revision-install
> -
> - @INCLUDE_OUTPUTS@
> -
> -@@ -363,13 +363,13 @@
> - local-install: @INSTALL_RULES@
> -
> - ### HACK!! Find a better way to do this
> --revision-install:
> --	test -d $(DESTDIR)$(includedir)/subversion-1 || \
> --	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
> --	(subversion/svnversion/svnversion $(top_srcdir) ||  \
> --	 svnversion $(top_srcdir) ||                        \
> --	 echo "unknown";                                    \
> --	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
> -+#revision-install:
> -+#	test -d $(DESTDIR)$(includedir)/subversion-1 || \
> -+#	  $(MKDIR) $(DESTDIR)$(includedir)/subversion-1
> -+#	(subversion/svnversion/svnversion $(top_srcdir) ||  \
> -+#	 svnversion $(top_srcdir) ||                        \
> -+#	 echo "unknown";                                    \
> -+#	) > $(DESTDIR)$(includedir)/subversion-1/svn-revision.txt
> -
> - install-static: @INSTALL_STATIC_RULES@
> -
> diff --git a/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch b/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
> deleted file mode 100644
> index 6f49ed4..0000000
> --- a/meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -install-neon-lib should depend on libsvn_delta's installation
> -
> -install-neon-lib needs libsvn_delta-1.la which will be regenerated
> -during libsvn_delta-1.la's installation, if libsvn_delta-1.la is
> -in regenerating and at the same time install-neon-lib links it, the
> -error willl happen.
> -
> -Let install-neon-lib run after libsvn_delta-1.la is installed will fix
> -the problem.
> -
> -Upstream-Status: Pending
> -
> -Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ----
> - build-outputs.mk |    2 +-
> - build.conf       |    2 ++
> - 2 files changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/build-outputs.mk b/build-outputs.mk
> ---- a/build-outputs.mk
> -+++ b/build-outputs.mk
> -@@ -979,7 +979,7 @@ install-locale: subversion/po/de.mo subversion/po/es.mo subversion/po/fr.mo subv
> - 	$(MKDIR) $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES
> - 	cd subversion/po ; $(INSTALL_LOCALE) zh_TW.mo $(DESTDIR)$(localedir)/zh_TW/LC_MESSAGES/$(PACKAGE_NAME).mo
> -
> --install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la
> -+install-neon-lib: subversion/libsvn_ra_neon/libsvn_ra_neon-1.la $(SVN_FS_LIB_INSTALL_DEPS)
> - 	$(MKDIR) $(DESTDIR)$(neon_libdir)
> - 	cd subversion/libsvn_ra_neon ; $(INSTALL_NEON_LIB) libsvn_ra_neon-1.la $(DESTDIR)$(neon_libdir)/libsvn_ra_neon-1.la
> -
> -diff --git a/build.conf b/build.conf
> ---- a/build.conf
> -+++ b/build.conf
> -@@ -272,6 +272,8 @@ type = ra-module
> - path = subversion/libsvn_ra_neon
> - install = neon-lib
> - libs = libsvn_delta libsvn_subr aprutil apriconv apr neon
> -+# conditionally add more dependencies
> -+add-install-deps = $(SVN_FS_LIB_INSTALL_DEPS)
> - msvc-static = yes
> -
> - # Accessing repositories via DAV through serf
> ---
> -1.7.10.4
> -
> diff --git a/meta/recipes-devtools/subversion/subversion_1.6.15.bb b/meta/recipes-devtools/subversion/subversion_1.8.1.bb
> similarity index 54%
> rename from meta/recipes-devtools/subversion/subversion_1.6.15.bb
> rename to meta/recipes-devtools/subversion/subversion_1.8.1.bb
> index ef679b3..d47d95c 100644
> --- a/meta/recipes-devtools/subversion/subversion_1.6.15.bb
> +++ b/meta/recipes-devtools/subversion/subversion_1.8.1.bb
> @@ -1,29 +1,26 @@
>   DESCRIPTION = "The Subversion (svn) client"
>   SECTION = "console/network"
> -DEPENDS = "apr-util neon sqlite3"
> -RDEPENDS_${PN} = "neon"
> +DEPENDS = "apr-util sqlite3"
>   LICENSE = "Apache-2"
>   HOMEPAGE = "http://subversion.tigris.org"
>
>   BBCLASSEXTEND = "native"
>
> -PR = "r3"
> +inherit gettext
>
> -SRC_URI = "http://subversion.tigris.org/downloads/${BPN}-${PV}.tar.bz2 \
> -           file://disable-revision-install.patch \
> +SRC_URI = "${APACHE_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
>              file://libtool2.patch \
> -           file://fix-install-depends.patch \
> -          "
> +           file://disable_mac_checks.patch \
> +"
> +SRC_URI[md5sum] = "f2ee0471b8a560f5efa0f2349d9c9ab9"
> +SRC_URI[sha256sum] = "faaaaedba25777331e761884598af1dd9fe33631d6415b2e0ba5348867c4edb4"
>
> -SRC_URI[md5sum] = "113fca1d9e4aa389d7dc2b210010fa69"
> -SRC_URI[sha256sum] = "b2919d603a5f3c19f42e3265c4b930e2376c43b3969b90ef9c42b2f72d5aaa45"
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=2a69fef414e2cb907b4544298569300b"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1c2f0119e478700b5428e26386cff923"
>
>   PACKAGECONFIG[sasl] = "--with-sasl,--without-sasl,cyrus-sasl"
>
>   EXTRA_OECONF = " \
> -                --without-berkeley-db --without-apxs --without-apache \
> +                --without-berkeley-db --without-apxs \
>                   --without-swig --with-apr=${STAGING_BINDIR_CROSS} \
>                   --with-apr-util=${STAGING_BINDIR_CROSS} \
>                   ac_cv_path_RUBY=none"
> @@ -36,6 +33,7 @@ acpaths = "-I build/ -I build/ac-macros/"
>
>   do_configure_prepend () {
>   	rm -f ${S}/libtool
> -	rm -f ${S}/build/libtool.m4
> +	rm -f ${S}/build/libtool.m4 ${S}/build/ltmain.sh ${S}/build/ltoptions.m4 ${S}/build/ltsugar.m4 ${S}/build/ltversion.m4 ${S}/build/lt~obsolete.m4
> +	rm -f ${S}/aclocal.m4
>   	sed -i -e 's:with_sasl="/usr/local":with_sasl="${STAGING_DIR}":' ${S}/build/ac-macros/sasl.m4
>   }
>

