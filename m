Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 44C1C6D3A7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 03:28:19 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Nov 2013 19:28:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,535,1378882800"; d="scan'208";a="433620137"
Received: from unknown (HELO [10.255.15.132]) ([10.255.15.132])
	by orsmga002.jf.intel.com with ESMTP; 11 Nov 2013 19:28:19 -0800
Message-ID: <5281A053.2080500@linux.intel.com>
Date: Mon, 11 Nov 2013 19:28:19 -0800
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Khem Raj <raj.khem@gmail.com>, 
 openembedded-core@lists.openembedded.org
References: <1384161833-7231-1-git-send-email-raj.khem@gmail.com>
In-Reply-To: <1384161833-7231-1-git-send-email-raj.khem@gmail.com>
Subject: Re: [PATCH 1/2] tcl: Install header into 8.6 instead of PN-PV in user/include
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
X-List-Received-Date: Tue, 12 Nov 2013 03:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2013 01:23 AM, Khem Raj wrote:
> This helps in compiling other programs like expect which
> depend on private headers but 8.5, 8.6 and so on is enough
> granularity and currently we had 8.6.x and so on which
> means that expect recipe will need to be touched whenever there
> is minor update of tcl.
>
> Additionally the encode creating symlink to shared object in
> patch and remove it from recipe
>
> Refresh patches after making changes to Configure.in we
> propertly generate configure and not patch is directly as
> was the case.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>   .../tcltk/tcl/alter-includedir.patch               | 39 +++++++++++++
>   .../tcl/fix_issue_with_old_distro_glibc.patch      | 12 ++--
>   .../tcltk/tcl/fix_non_native_build_issue.patch     | 12 ++--
>   meta/recipes-devtools/tcltk/tcl/no_packages.patch  | 16 +++---
>   .../tcltk/tcl/tcl-add-soname.patch                 | 64 ++++++++++------------
>   .../tcl/tcl-remove-hardcoded-install-path.patch    | 26 ++++++---
>   meta/recipes-devtools/tcltk/tcl_8.6.1.bb           | 26 +++++----
>   7 files changed, 120 insertions(+), 75 deletions(-)
>   create mode 100644 meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
>
> diff --git a/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch
> new file mode 100644
> index 0000000..32e63c0
> --- /dev/null
> +++ b/meta/recipes-devtools/tcltk/tcl/alter-includedir.patch

New patch needs header please.

Thanks
	Sau!

> @@ -0,0 +1,39 @@
> +Index: unix/Makefile.in
> +===================================================================
> +--- unix.orig/Makefile.in	2013-11-11 01:00:36.431550403 -0800
> ++++ unix/Makefile.in	2013-11-11 01:05:09.587557282 -0800
> +@@ -53,7 +53,7 @@
> + SCRIPT_INSTALL_DIR	= $(INSTALL_ROOT)$(TCL_LIBRARY)
> +
> + # Directory in which to install the include file tcl.h:
> +-INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)
> ++INCLUDE_INSTALL_DIR	= $(INSTALL_ROOT)$(includedir)/tcl$(VERSION)
> +
> + # Path to the private tcl header dir:
> + PRIVATE_INCLUDE_DIR	= @PRIVATE_INCLUDE_DIR@
> +Index: unix/configure.in
> +===================================================================
> +--- unix.orig/configure.in	2013-11-11 01:00:36.467550403 -0800
> ++++ unix/configure.in	2013-11-11 01:00:36.503550404 -0800
> +@@ -791,7 +791,7 @@
> + eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
> +
> + TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
> +-PRIVATE_INCLUDE_DIR='$(includedir)'
> ++PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
> + HTML_DIR='$(DISTDIR)/html'
> +
> + # Note:  in the following variable, it's important to use the absolute
> +Index: unix/configure
> +===================================================================
> +--- unix.orig/configure	2013-11-11 01:00:36.467550403 -0800
> ++++ unix/configure	2013-11-11 01:00:36.503550404 -0800
> +@@ -19134,7 +19134,7 @@
> + eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
> +
> + TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
> +-PRIVATE_INCLUDE_DIR='$(includedir)'
> ++PRIVATE_INCLUDE_DIR='$(includedir)/tcl$(VERSION)'
> + HTML_DIR='$(DISTDIR)/html'
> +
> + # Note:  in the following variable, it's important to use the absolute
> diff --git a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
> index ed58175..be27341 100644
> --- a/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/fix_issue_with_old_distro_glibc.patch
> @@ -15,11 +15,11 @@ Fixes tcl target recipe build on old distros which have glibc older than 2.14
>   Signed-Off-By: Nitin A Kamble <nitin.a.kamble@intel.com>
>   2012/04/26
>
> -diff --git unix.orig/Makefile.in unix/Makefile.in
> -index 571d53f..16351f6 100644
> ---- unix.orig/Makefile.in
> -+++ unix/Makefile.in
> -@@ -679,7 +679,7 @@ topDirName:
> +Index: unix/Makefile.in
> +===================================================================
> +--- unix.orig/Makefile.in	2013-11-10 23:38:01.787425628 -0800
> ++++ unix/Makefile.in	2013-11-10 23:37:59.807425578 -0800
> +@@ -686,7 +686,7 @@
>    # tcltest executable gets the build directory burned into its ld search path.
>    # This keeps tcltest from picking up an already installed version of the Tcl
>    # library.
> @@ -28,7 +28,7 @@ index 571d53f..16351f6 100644
>    		TCLLIBPATH="@abs_builddir@/pkgs" \
>    		TCL_LIBRARY="${TCL_BUILDTIME_LIBRARY}"
>
> -@@ -705,7 +705,7 @@ test-tcl: ${TCLTEST_EXE}
> +@@ -712,7 +712,7 @@
>    	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
>
>    gdb-test: ${TCLTEST_EXE}
> diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> index 80d718c..c60eb75 100644
> --- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
> @@ -1,10 +1,10 @@
>   Upstream-Status: Pending
>
> -diff --git unix.orig/Makefile.in unix/Makefile.in
> -index df05759..571d53f 100644
> ---- unix.orig/Makefile.in
> -+++ unix/Makefile.in
> -@@ -702,23 +702,23 @@ tcltest-real:
> +Index: unix/Makefile.in
> +===================================================================
> +--- unix.orig/Makefile.in	2013-11-10 23:37:34.243424934 -0800
> ++++ unix/Makefile.in	2013-11-10 23:37:34.243424934 -0800
> +@@ -709,23 +709,23 @@
>    test: test-tcl test-packages
>
>    test-tcl: ${TCLTEST_EXE}
> @@ -32,7 +32,7 @@ index df05759..571d53f 100644
>
>    # The following target generates the shared libraries in dltest/ that are used
>    # for testing; they are included as part of the "tcltest" target (via the
> -@@ -736,23 +736,23 @@ dltest.marker: ${STUB_LIB_FILE}
> +@@ -743,23 +743,23 @@
>    # This target can be used to run tclsh from the build directory
>    # via `make shell SCRIPT=/tmp/foo.tcl`
>    shell: ${TCL_EXE}
> diff --git a/meta/recipes-devtools/tcltk/tcl/no_packages.patch b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
> index b045814..ab6cc43 100644
> --- a/meta/recipes-devtools/tcltk/tcl/no_packages.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/no_packages.patch
> @@ -5,11 +5,11 @@ Upstream-Status:Inappropriate [embedded specific]
>
>   Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>
> -diff --git unix.orig/Makefile.in unix/Makefile.in
> -index 16351f6..76ccadb 100644
> ---- unix.orig/Makefile.in
> -+++ unix/Makefile.in
> -@@ -601,7 +601,7 @@ SRCS = $(GENERIC_SRCS) $(TOMMATH_SRCS) $(UNIX_SRCS) $(NOTIFY_SRCS) \
> +Index: unix/Makefile.in
> +===================================================================
> +--- unix.orig/Makefile.in	2013-11-10 23:38:12.235425891 -0800
> ++++ unix/Makefile.in	2013-11-10 23:38:12.231425891 -0800
> +@@ -611,7 +611,7 @@
>    # Start of rules
>    #--------------------------------------------------------------------------
>
> @@ -18,7 +18,7 @@ index 16351f6..76ccadb 100644
>
>    binaries: ${LIB_FILE} $(STUB_LIB_FILE) ${TCL_EXE}
>
> -@@ -646,12 +646,12 @@ Makefile: $(UNIX_DIR)/Makefile.in $(DLTEST_DIR)/Makefile.in
> +@@ -653,12 +653,12 @@
>    #tclConfig.h: $(UNIX_DIR)/tclConfig.h.in
>    #	$(SHELL) config.status
>
> @@ -33,7 +33,7 @@ index 16351f6..76ccadb 100644
>    	rm -rf Makefile config.status config.cache config.log tclConfig.sh \
>    		tclConfig.h *.plist Tcl.framework tcl.pc
>    	cd dltest ; $(MAKE) distclean
> -@@ -699,7 +699,7 @@ tcltest-real:
> +@@ -706,7 +706,7 @@
>    # tcltest, ie:
>    #	% make test TESTFLAGS="-verbose bps -file fileName.test"
>
> @@ -42,7 +42,7 @@ index 16351f6..76ccadb 100644
>
>    test-tcl: ${TCLTEST_EXE}
>    	$(SHELL_ENV) ${TCLTEST_EXE} $(TOP_DIR)/tests/all.tcl $(TESTFLAGS)
> -@@ -764,7 +764,7 @@ INSTALL_PACKAGE_TARGETS = install-packages
> +@@ -771,7 +771,7 @@
>    INSTALL_DEV_TARGETS = install-headers
>    INSTALL_EXTRA_TARGETS = @EXTRA_INSTALL@
>    INSTALL_TARGETS = $(INSTALL_BASE_TARGETS) $(INSTALL_DOC_TARGETS) $(INSTALL_DEV_TARGETS) \
> diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> index d3691f6..96276ea 100644
> --- a/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/tcl-add-soname.patch
> @@ -2,29 +2,23 @@ Upstream-Status: Pending
>
>   Index: unix/configure
>   ===================================================================
> ---- unix.orig/configure	2013-09-19 23:17:13.000000000 +0300
> -+++ unix/configure	2013-10-16 15:58:37.450136217 +0300
> -@@ -6899,6 +6899,7 @@
> - 	    LIBS="$LIBS -lc"
> - 	    SHLIB_CFLAGS=""
> - 	    SHLIB_SUFFIX=".so"
> -+	    SHARED_LIB_SUFFIX='${VERSION}\$\{DBGX\}.so.0'
> +--- unix.orig/configure	2013-09-19 13:17:13.000000000 -0700
> ++++ unix/configure	2013-11-11 00:20:51.519490342 -0800
> +@@ -7599,6 +7599,9 @@
> + 	    # get rid of the warnings.
> + 	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
>
> ++	    # following line added by CW for Debian GNU/Linux
> ++	    TCL_SHLIB_LD_EXTRAS="-Wl,-soname,\${TCL_LIB_FILE}.0"
> ++
> + 	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
>    	    DL_OBJS="tclLoadDl.o"
> - 	    LD_LIBRARY_PATH_VAR="LIBPATH"
> + 	    DL_LIBS="-ldl"
>   Index: unix/tcl.m4
>   ===================================================================
> ---- unix.orig/tcl.m4	2013-09-19 23:17:13.000000000 +0300
> -+++ unix/tcl.m4	2013-10-16 16:18:50.719586228 +0300
> -@@ -1408,6 +1408,7 @@
> - 	Linux*|GNU*|NetBSD-Debian)
> - 	    SHLIB_CFLAGS="-fPIC"
> - 	    SHLIB_SUFFIX=".so"
> -+	    SHARED_LIB_SUFFIX='${TCL_TRIM_DOTS}\$\{DBGX\}.so.0'
> -
> - 	    CFLAGS_OPTIMIZE="-O2"
> - 	    # egcs-2.91.66 on Redhat Linux 6.0 generates lots of warnings
> -@@ -1415,12 +1416,15 @@
> +--- unix.orig/tcl.m4	2013-09-19 13:17:13.000000000 -0700
> ++++ unix/tcl.m4	2013-11-11 00:17:24.263485123 -0800
> +@@ -1415,6 +1415,9 @@
>    	    # get rid of the warnings.
>    	    #CFLAGS_OPTIMIZE="${CFLAGS_OPTIMIZE} -D__NO_STRING_INLINES -D__NO_MATH_INLINES"
>
> @@ -34,19 +28,19 @@ Index: unix/tcl.m4
>    	    SHLIB_LD='${CC} -shared ${CFLAGS} ${LDFLAGS}'
>    	    DL_OBJS="tclLoadDl.o"
>    	    DL_LIBS="-ldl"
> - 	    LDFLAGS="$LDFLAGS -Wl,--export-dynamic"
> - 	    AS_IF([test $doRpath = yes], [
> --		CC_SEARCH_FLAGS='-Wl,-rpath,${LIB_RUNTIME_DIR}'])
> -+		CC_SEARCH_FLAGS=''])
> - 	    LD_SEARCH_FLAGS=${CC_SEARCH_FLAGS}
> - 	    AS_IF([test "`uname -m`" = "alpha"], [CFLAGS="$CFLAGS -mieee"])
> - 	    AS_IF([test $do64bit = yes], [
> -@@ -2050,7 +2054,7 @@
> -
> -     AS_IF([test "${SHARED_BUILD}" = 1 -a "${SHLIB_SUFFIX}" != ""], [
> -         LIB_SUFFIX=${SHARED_LIB_SUFFIX}
> --        MAKE_LIB='${SHLIB_LD} -o [$]@ ${OBJS} ${TCL_SHLIB_LD_EXTRAS} ${SHLIB_LD_LIBS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
> -+        MAKE_LIB='${SHLIB_LD} -o $@ ${OBJS} ${SHLIB_LD_LIBS} ${TCL_SHLIB_LD_EXTRAS} ${TK_SHLIB_LD_EXTRAS} ${LD_SEARCH_FLAGS}'
> -         AS_IF([test "${SHLIB_SUFFIX}" = ".dll"], [
> -             INSTALL_LIB='$(INSTALL_LIBRARY) $(LIB_FILE) "$(BIN_INSTALL_DIR)/$(LIB_FILE)"'
> -             DLL_INSTALL_DIR="\$(BIN_INSTALL_DIR)"
> +Index: unix/Makefile.in
> +===================================================================
> +--- unix.orig/Makefile.in	2013-09-19 13:17:13.000000000 -0700
> ++++ unix/Makefile.in	2013-11-11 00:20:32.423489861 -0800
> +@@ -796,7 +796,10 @@
> + 	    done;
> + 	@echo "Installing $(LIB_FILE) to $(DLL_INSTALL_DIR)/"
> + 	@@INSTALL_LIB@
> +-	@chmod 555 "$(DLL_INSTALL_DIR)/$(LIB_FILE)"
> ++	mv "$(DLL_INSTALL_DIR)"/$(LIB_FILE) "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
> ++	ln -sf $(LIB_FILE).0 "$(DLL_INSTALL_DIR)"/$(LIB_FILE)
> ++	ln -sf "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0 ./
> ++	@chmod 555 "$(DLL_INSTALL_DIR)"/$(LIB_FILE).0
> + 	@echo "Installing ${TCL_EXE} as $(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
> + 	@$(INSTALL_PROGRAM) ${TCL_EXE} "$(BIN_INSTALL_DIR)/tclsh$(VERSION)${EXE_SUFFIX}"
> + 	@echo "Installing tclConfig.sh to $(CONFIG_INSTALL_DIR)/"
> diff --git a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> index afdd880..16f7c80 100644
> --- a/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> +++ b/meta/recipes-devtools/tcltk/tcl/tcl-remove-hardcoded-install-path.patch
> @@ -19,11 +19,24 @@ Signed-off-by: Kai Kang <kai.kang@windriver.com>
>    configure |    2 +-
>    1 file changed, 1 insertion(+), 1 deletion(-)
>
> -diff --git a/configure b/configure
> -index 478a4d5..79c2979 100755
> ---- a/configure
> -+++ b/configure
> -@@ -18772,7 +18772,7 @@ eval "TCL_LIB_FILE=libtcl${LIB_SUFFIX}"
> +Index: unix/configure
> +===================================================================
> +--- unix.orig/configure	2013-11-10 23:38:33.643426430 -0800
> ++++ unix/configure	2013-11-10 23:39:51.347428387 -0800
> +@@ -19134,7 +19134,7 @@
> +
> + eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
> +
> +-TCL_LIBRARY='$(prefix)/lib/tcl$(VERSION)'
> ++TCL_LIBRARY='$(libdir)/tcl$(VERSION)'
> + PRIVATE_INCLUDE_DIR='$(includedir)'
> + HTML_DIR='$(DISTDIR)/html'
> +
> +Index: unix/configure.in
> +===================================================================
> +--- unix.orig/configure.in	2013-11-10 23:20:50.000000000 -0800
> ++++ unix/configure.in	2013-11-10 23:39:41.199428131 -0800
> +@@ -790,7 +790,7 @@
>
>    eval "TCL_LIB_FILE=${TCL_LIB_FILE}"
>
> @@ -32,6 +45,3 @@ index 478a4d5..79c2979 100755
>    PRIVATE_INCLUDE_DIR='$(includedir)'
>    HTML_DIR='$(DISTDIR)/html'
>
> ---
> -1.7.9.5
> -
> diff --git a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
> index e239708..f40475d 100644
> --- a/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
> +++ b/meta/recipes-devtools/tcltk/tcl_8.6.1.bb
> @@ -15,11 +15,12 @@ BASE_SRC_URI = "${SOURCEFORGE_MIRROR}/tcl/tcl${PV}-src.tar.gz \
>                   file://tcl-add-soname.patch"
>
>   SRC_URI = "${BASE_SRC_URI} \
> -	   file://fix_non_native_build_issue.patch \
> -	   file://fix_issue_with_old_distro_glibc.patch \
> -	   file://no_packages.patch \
> -	   file://tcl-remove-hardcoded-install-path.patch \
> -       "
> +           file://fix_non_native_build_issue.patch \
> +           file://fix_issue_with_old_distro_glibc.patch \
> +           file://no_packages.patch \
> +           file://tcl-remove-hardcoded-install-path.patch \
> +           file://alter-includedir.patch \
> +          "
>   SRC_URI[md5sum] = "aae4b701ee527c6e4e1a6f9c7399882e"
>   SRC_URI[sha256sum] = "16ee769248e64ba1cae6b4834fcc4e4edd7470d881410e8d58f7dd1434343514"
>
> @@ -27,6 +28,8 @@ SRC_URI_class-native = "${BASE_SRC_URI}"
>
>   S = "${WORKDIR}/tcl${PV}/unix"
>
> +VER = "8.6"
> +
>   inherit autotools
>
>   DEPENDS_class-native = ""
> @@ -43,9 +46,8 @@ do_compile_prepend() {
>   }
>
>   do_install() {
> -	autotools_do_install
> -	oe_libinstall -so libtcl8.6 ${D}${libdir}
> -	ln -sf ./tclsh8.6 ${D}${bindir}/tclsh
> +	autotools_do_install install-private-headers
> +	ln -sf ./tclsh${VER} ${D}${bindir}/tclsh
>   	sed -i "s+${WORKDIR}+${STAGING_INCDIR}+g" tclConfig.sh
>   	sed -i "s,-L${libdir},-L=${libdir},g" tclConfig.sh
>   	sed -i "s,-I${includedir},-I=${includedir},g" tclConfig.sh
> @@ -54,8 +56,8 @@ do_install() {
>   	cd ..
>   	for dir in compat generic unix
>   	do
> -		install -d ${D}${includedir}/tcl${PV}/$dir
> -		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/tcl${PV}/$dir/
> +		install -d ${D}${includedir}/${BPN}${VER}/$dir
> +		install -m 0644 ${S}/../$dir/*.h ${D}${includedir}/${BPN}${VER}/$dir/
>   	done
>   }
>
> @@ -65,8 +67,8 @@ tcl_sysroot_preprocess () {
>   }
>
>   PACKAGES =+ "tcl-lib"
> -FILES_tcl-lib = "${libdir}/libtcl8.6.so*"
> -FILES_${PN} += "${libdir}/tcl8.6 ${libdir}/tcl8"
> +FILES_tcl-lib = "${libdir}/libtcl${VER}.so.*"
> +FILES_${PN} += "${libdir}/tcl${VER} ${libdir}/tcl8"
>   FILES_${PN}-dev += "${libdir}/tclConfig.sh ${libdir}/tclooConfig.sh"
>
>   # isn't getting picked up by shlibs code
>

