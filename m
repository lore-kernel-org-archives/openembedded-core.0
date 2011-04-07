Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Q7dSy-0005S5-BA
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Apr 2011 02:53:01 +0200
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Q7dQw-0004bi-Hn from Tom_Rini@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Apr 2011 17:50:50 -0700
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 6 Apr 2011 17:50:50 -0700
Received: from localhost.localdomain ([172.30.80.151]) by
	na2-mail.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 6 Apr 2011 18:50:48 -0600
From: Tom Rini <tom_rini@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Apr 2011 17:50:40 -0700
Message-Id: <e92e40acfc599c9ecbce8df402337c6e38a1ea83.1302137428.git.tom_rini@mentor.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1302137428.git.tom_rini@mentor.com>
References: <cover.1302137428.git.tom_rini@mentor.com>
X-OriginalArrivalTime: 07 Apr 2011 00:50:49.0114 (UTC)
	FILETIME=[D6469FA0:01CBF4BD]
Subject: [PATCH 1/1] ncurses: Update to 5.9
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
X-List-Received-Date: Thu, 07 Apr 2011 00:53:01 -0000

The previous 5.7 release was relatively close to 5.8 due to it bringing
in a patch to sync with upstream work-in-progress.  We skip over the
5.8 release and move to 5.9.  Also, we move most of the contents of the
main recipe into the previously unused ncurses.inc file.

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 .../{ncurses-5.7 => ncurses-5.9}/config.cache      |    0
 .../{ncurses-5.7 => ncurses-5.9}/tic-hang.patch    |    0
 meta/recipes-core/ncurses/ncurses.inc              |  256 +++++++++++++++-----
 meta/recipes-core/ncurses/ncurses_5.7.bb           |  246 -------------------
 meta/recipes-core/ncurses/ncurses_5.9.bb           |   10 +
 5 files changed, 204 insertions(+), 308 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/config.cache (100%)
 rename meta/recipes-core/ncurses/{ncurses-5.7 => ncurses-5.9}/tic-hang.patch (100%)
 delete mode 100644 meta/recipes-core/ncurses/ncurses_5.7.bb
 create mode 100644 meta/recipes-core/ncurses/ncurses_5.9.bb

diff --git a/meta/recipes-core/ncurses/ncurses-5.7/config.cache b/meta/recipes-core/ncurses/ncurses-5.9/config.cache
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.7/config.cache
rename to meta/recipes-core/ncurses/ncurses-5.9/config.cache
diff --git a/meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch b/meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
similarity index 100%
rename from meta/recipes-core/ncurses/ncurses-5.7/tic-hang.patch
rename to meta/recipes-core/ncurses/ncurses-5.9/tic-hang.patch
diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 3f897f6..e244eb8 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -2,7 +2,7 @@ SUMMARY = "The New Curses library"
 DESCRIPTION = "SVr4 and XSI-Curses compatible curses library and terminfo tools including tic, infocmp, captoinfo. Supports color, multiple highlights, forms-drawing characters, and automatic recognition of keypad and function-key sequences. Extensions include resizable windows and mouse support on both xterm and Linux console using the gpm library."
 HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cf3c7ab00720a1b83391f49ea9956277"
+LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
 SECTION = "libs"
 DEPENDS = "ncurses-native"
 DEPENDS_virtclass-native = ""
@@ -11,53 +11,121 @@ PACKAGES_append = " ncurses-terminfo"
 FILES_ncurses_append = " ${datadir}/tabset"
 RSUGGESTS_${PN} = "ncurses-terminfo"
 RPROVIDES = "libncurses5"
+INC_PR = "r0"
 
-inherit autotools
+inherit autotools binconfig
 
-# This keeps only tput/tset in ncurses
-# clear/reset are in already busybox
-FILES_ncurses-tools = "${bindir}/tic ${bindir}/toe ${bindir}/infotocap ${bindir}/captoinfo ${bindir}/infocmp ${bindir}/clear.${PN} ${bindir}/reset.${PN} ${bindir}/tack "
-FILES_ncurses-terminfo = "${datadir}/terminfo"
-FILES_${PN} = "${bindir}/tput ${bindir}/tset ${libdir}/lib*.so.* /usr/share/tabset /etc/terminfo"
-
-PARALLEL_MAKE=""
-
-FILESPATH = "${FILE_DIRNAME}/local:${FILE_DIRNAME}/ncurses-${PV}-${PR}:${FILE_DIRNAME}/ncurses-${PV}:${FILE_DIRNAME}/ncurses:${FILE_DIRNAME}"
-
-EXTRA_OECONF = "--with-shared \
-                --with-libtool \
-	        --without-profile \
-	        --without-debug \
-	        --disable-rpath \
-	        --enable-echo \
-	        --enable-const \
-	        --without-ada \
-	        --enable-termcap \
-	        --without-cxx-binding \
-	        --with-terminfo-dirs=${sysconfdir}/terminfo:${datadir}/terminfo \
-	        --enable-overwrite \
-	        --with-build-ldflags='' \
-	        --with-build-ccflags='' "
-export BUILD_CCFLAGS = "-I${S}/ncurses -I${S}/include ${BUILD_CFLAGS}"
-export BUILD_LDFLAGS = ""
-export EXTRA_OEMAKE = '"BUILD_LDFLAGS=" "BUILD_CCFLAGS=${BUILD_CCFLAGS}"'
+# Upstream has useful patches at times at ftp://invisible-island.net/ncurses/
+SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz"
+
+EXTRA_AUTORECONF = "-I m4"
+CONFIG_SITE =+ "${WORKDIR}/config.cache"
+
+# Whether to enable separate widec libraries; must be 'true' or 'false'
+#
+# TODO: remove this variable when widec is supported in every setup?
+ENABLE_WIDEC = "true"
+
+# _GNU_SOURCE is required for widec stuff and is detected automatically
+# for target objects.  But it must be set manually for native and sdk
+# builds.
+BUILD_CPPFLAGS += "-D_GNU_SOURCE"
+
+# Override the function from the autotools class; ncurses requires a
+# patched autoconf213 to generate the configure script. This autoconf
+# is not available so that the shipped script will be used.
+do_configure() {
+        # check does not work with cross-compiling and is generally
+        # broken because it requires stdin to be pollable (which is
+        # not the case for /dev/null redirections)
+        export cf_cv_working_poll=yes
+
+        for i in \
+        'narrowc' \
+        'widec   --enable-widec --without-progs'; do
+                set -- $i
+                mkdir -p $1
+                cd $1
+                shift
+
+                oe_runconf \
+                        --disable-static \
+                        --without-debug \
+                        --without-ada \
+                        --without-gpm \
+                        --enable-hard-tabs \
+                        --enable-xmc-glitch \
+                        --enable-colorfgbg \
+                        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
+                        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
+                        --with-shared \
+                        --disable-big-core \
+                        --program-prefix= \
+                        --with-ticlib \
+                        --with-termlib=tinfo \
+                        --enable-sigwinch \
+                        --enable-pc-files \
+                        --disable-rpath-hack \
+                        "$@"
+                cd ..
+        done
+}
+
+do_compile() {
+        oe_runmake -C narrowc libs
+        oe_runmake -C narrowc/progs
+
+        ! ${ENABLE_WIDEC} || \
+            oe_runmake -C widec libs
+}
+
+# set of expected differences between narrowc and widec header
+#
+# TODO: the NCURSES_CH_T difference can cause real problems :(
+_unifdef_cleanup = " \
+  -e '\!/\* \$Id: curses.wide,v!,\!/\* \$Id: curses.tail,v!d' \
+  -e '/^#define NCURSES_CH_T /d' \
+  -e '/^#include <wchar.h>/d' \
+  -e '\!^/\* .* \*/!d' \
+"
+
+do_test[depends] = "unifdef-native:do_populate_sysroot"
+do_test[dirs] = "${S}"
+do_test() {
+        ${ENABLE_WIDEC} || return 0
+
+        # make sure that the narrow and widec header are compatible
+        # and differ only in minor details.
+        unifdef -k narrowc/include/curses.h | \
+            sed ${_unifdef_cleanup} > curses-narrowc.h
+        unifdef -k widec/include/curses.h | \
+            sed ${_unifdef_cleanup} > curses-widec.h
+
+        diff curses-narrowc.h curses-widec.h
+}
+
+_install_opts = "\
+  DESTDIR='${D}' \
+  PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
+  install.libs install.includes install.man \
+"
 
 do_install() {
-	# This is necessary so that the "tic" command executed during the install can
-	# link with the correct libary in staging.
-	export LD_LIBRARY_PATH="${STAGING_LIBDIR_NATIVE}"
+        # Order of installation is important; widec installs a 'curses.h'
+        # header with more definitions and must be installed last hence.
+        # Compatibility of these headers will be checked in 'do_test()'.
+        oe_runmake -C narrowc ${_install_opts} \
+                install.data install.progs
 
-	autotools_do_install
+        ! ${ENABLE_WIDEC} || \
+            oe_runmake -C widec ${_install_opts}
 
-	ln -sf curses.h ${D}${includedir}/ncurses.h
 
-	# our ncurses has termcap support
-	ln -sf libncurses.so ${D}${libdir}/libtermcap.so
-	ln -sf libncurses.a ${D}${libdir}/libtermcap.a
+        cd narrowc
 
-	# include some basic terminfo files
-	# stolen ;) from gentoo and modified a bit
-	for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86
+        # include some basic terminfo files
+        # stolen ;) from gentoo and modified a bit
+        for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86
         do
                 local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
                 local basedir="$(basename $(dirname "${termfile}"))"
@@ -70,32 +138,96 @@ do_install() {
                                 ${D}${datadir}/terminfo/${basedir}/${x}
                 fi
         done
-	# i think we can use xterm-color as default xterm
-	if [ -e ${D}${sysconfdir}/terminfo/x/xterm-color ]
-	then
-		ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
-	fi
-
-	if [ "${PN}" = "ncurses" ]; then
-		mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
-		mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
-	fi
+        # i think we can use xterm-color as default xterm
+        if [ -e ${D}${sysconfdir}/terminfo/x/xterm-color ]
+        then
+                ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
+        fi
+
+        if [ "${PN}" = "ncurses" ]; then
+                mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
+                mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
+        fi
+
+
+        # create linker scripts for libcurses.so and libncurses to
+        # link against -ltinfo when needed. Some builds might break
+        # else when '-Wl,--no-copy-dt-needed-entries' has been set in
+        # linker flags.
+        for i in libncurses libncursesw; do
+		f=${D}${libdir}/$i.so
+                test -h $f || continue
+                rm -f $f
+                echo '/* GNU ld script */'  >$f
+                echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
+        done
+
+        # create libtermcap.so linker script for backward compatibility
+        f=${D}${libdir}/libtermcap.so
+        echo '/* GNU ld script */' >$f
+        echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
 }
-		
-		
+
+python populate_packages_prepend () {
+        libdir = bb.data.expand("${libdir}", d)
+        pnbase = bb.data.expand("${PN}-lib%s", d)
+        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
+}
+
+
 pkg_postinst_ncurses-tools () {
-	if [ "${PN}" = "ncurses" ]; then
-		update-alternatives --install ${bindir}/clear clear clear.${PN} 100
-		update-alternatives --install ${bindir}/reset reset reset.${PN} 100
-	fi
+        if [ "${PN}" = "ncurses" ]; then
+                update-alternatives --install ${bindir}/clear clear clear.${PN} 100
+                update-alternatives --install ${bindir}/reset reset reset.${PN} 100
+        fi
 }
-				
-			
+
 pkg_prerm_ncurses-tools () {
-	if [ "${PN}" = "ncurses" ]; then
-		update-alternatives --remove clear clear.${PN}
-		update-alternatives --remove reset reset.${PN}
-	fi
+        if [ "${PN}" = "ncurses" ]; then
+                update-alternatives --remove clear clear.${PN}
+                update-alternatives --remove reset reset.${PN}
+        fi
 }
 
 BBCLASSEXTEND = "native nativesdk"
+
+PACKAGES += " \
+  ${PN}-tools \
+  ${PN}-terminfo \
+  ${PN}-terminfo-base \
+"
+
+FILES_${PN} = "\
+  ${bindir}/tput \
+  ${bindir}/tset \
+  ${bindir}/ncurses5-config \
+  ${bindir}/ncursesw5-config \
+  ${datadir}/tabset \
+"
+
+# This keeps only tput/tset in ncurses
+# clear/reset are in already busybox
+FILES_${PN}-tools = "\
+  ${bindir}/tic \
+  ${bindir}/toe \
+  ${bindir}/infotocap \
+  ${bindir}/captoinfo \
+  ${bindir}/infocmp \
+  ${bindir}/clear.${PN} \
+  ${bindir}/reset.${PN} \
+  ${bindir}/tack \
+  ${bindir}/tabs \
+"
+# 'reset' is a symlink to 'tset' which is in the 'ncurses' package
+RDEPENDS_${PN}-tools = "${PN}"
+
+FILES_${PN}-terminfo = "\
+  ${datadir}/terminfo \
+"
+
+FILES_${PN}-terminfo-base = "\
+  ${sysconfdir}/terminfo \
+"
+
+RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
+RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
diff --git a/meta/recipes-core/ncurses/ncurses_5.7.bb b/meta/recipes-core/ncurses/ncurses_5.7.bb
deleted file mode 100644
index 7ab078d..0000000
--- a/meta/recipes-core/ncurses/ncurses_5.7.bb
+++ /dev/null
@@ -1,246 +0,0 @@
-DESCRIPTION = "Ncurses library"
-HOMEPAGE = "http://www.gnu.org/software/ncurses/ncurses.html"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://ncurses/base/version.c;beginline=1;endline=27;md5=cbc180a8c44ca642e97c35452fab5f66"
-SECTION = "libs"
-PATCHDATE = "20100501"
-PKGV = "${PV}+${PATCHDATE}"
-PR = "r1"
-
-DEPENDS = "ncurses-native"
-DEPENDS_virtclass-native = ""
-
-inherit autotools binconfig
-
-SRC_URI = "${GNU_MIRROR}/ncurses/ncurses-${PV}.tar.gz;name=tarball \
-        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-20100424-patch.sh.bz2;apply=yes;name=p20100424sh \
-\
-        http://autobuilder.yoctoproject.org/sources/ncurses-5.7-${PATCHDATE}.patch.gz;name=p20100501 \
-        file://tic-hang.patch \
-        file://config.cache \
-"
-
-
-#        ftp://invisible-island.net/ncurses/5.7/ncurses-5.7-${PATCHDATE}.patch.gz;name=p20100501 
-
-SRC_URI[tarball.md5sum] = "cce05daf61a64501ef6cd8da1f727ec6"
-SRC_URI[tarball.sha256sum] = "0a9bdea5c7de8ded5c9327ed642915f2cc380753f12d4ad120ef7da3ea3498f4"
-SRC_URI[p20100424sh.md5sum] = "3a5f76613f0f7ec3e0e73b835bc24864"
-SRC_URI[p20100424sh.sha256sum] = "1e9d70d2d1fe1fea471868832c52f1b9cc6065132102e49e2a3755f2f4f5be53"
-SRC_URI[p20100501.md5sum] = "6518cfa5d45e9069a1e042468161448b"
-SRC_URI[p20100501.sha256sum] = "a97ccc30e4bd6fbb89564f3058db0fe84bd35cfefee831556c500793b477abde"
-
-#PARALLEL_MAKE = ""
-EXTRA_AUTORECONF = "-I m4"
-CONFIG_SITE =+ "${WORKDIR}/config.cache"
-
-# Whether to enable separate widec libraries; must be 'true' or 'false'
-#
-# TODO: remove this variable when widec is supported in every setup?
-ENABLE_WIDEC = "true"
-
-# _GNU_SOURCE is required for widec stuff and is detected automatically
-# for target objects.  But it must be set manually for native and sdk
-# builds.
-BUILD_CPPFLAGS += "-D_GNU_SOURCE"
-
-# Override the function from the autotools class; ncurses requires a
-# patched autoconf213 to generate the configure script. This autoconf
-# is not available so that the shipped script will be used.
-do_configure() {
-        # check does not work with cross-compiling and is generally
-        # broken because it requires stdin to be pollable (which is
-        # not the case for /dev/null redirections)
-        export cf_cv_working_poll=yes
-
-        for i in \
-        'narrowc' \
-        'widec   --enable-widec --without-progs'; do
-                set -- $i
-                mkdir -p $1
-                cd $1
-                shift
-
-                oe_runconf \
-                        --disable-static \
-                        --without-debug \
-                        --without-ada \
-                        --without-gpm \
-                        --enable-hard-tabs \
-                        --enable-xmc-glitch \
-                        --enable-colorfgbg \
-                        --with-termpath='${sysconfdir}/termcap:${datadir}/misc/termcap' \
-                        --with-terminfo-dirs='${sysconfdir}/terminfo:${datadir}/terminfo' \
-                        --with-shared \
-                        --disable-big-core \
-                        --program-prefix= \
-                        --with-ticlib \
-                        --with-termlib=tinfo \
-                        --enable-sigwinch \
-                        --enable-pc-files \
-                        --disable-rpath-hack \
-                        "$@"
-                cd ..
-        done
-}
-
-do_compile() {
-        oe_runmake -C narrowc libs
-        oe_runmake -C narrowc/progs
-
-        ! ${ENABLE_WIDEC} || \
-            oe_runmake -C widec libs
-}
-
-# set of expected differences between narrowc and widec header
-#
-# TODO: the NCURSES_CH_T difference can cause real problems :(
-_unifdef_cleanup = " \
-  -e '\!/\* \$Id: curses.wide,v!,\!/\* \$Id: curses.tail,v!d' \
-  -e '/^#define NCURSES_CH_T /d' \
-  -e '/^#include <wchar.h>/d' \
-  -e '\!^/\* .* \*/!d' \
-"
-
-do_test[depends] = "unifdef-native:do_populate_sysroot"
-do_test[dirs] = "${S}"
-do_test() {
-        ${ENABLE_WIDEC} || return 0
-
-        # make sure that the narrow and widec header are compatible
-        # and differ only in minor details.
-        unifdef -k narrowc/include/curses.h | \
-            sed ${_unifdef_cleanup} > curses-narrowc.h
-        unifdef -k widec/include/curses.h | \
-            sed ${_unifdef_cleanup} > curses-widec.h
-
-        diff curses-narrowc.h curses-widec.h
-}
-
-_install_opts = "\
-  DESTDIR='${D}' \
-  PKG_CONFIG_LIBDIR='${libdir}/pkgconfig' \
-  install.libs install.includes install.man \
-"
-
-do_install() {
-        # Order of installation is important; widec installs a 'curses.h'
-        # header with more definitions and must be installed last hence.
-        # Compatibility of these headers will be checked in 'do_test()'.
-        oe_runmake -C narrowc ${_install_opts} \
-                install.data install.progs
-
-        ! ${ENABLE_WIDEC} || \
-            oe_runmake -C widec ${_install_opts}
-
-
-        cd narrowc
-
-        # include some basic terminfo files
-        # stolen ;) from gentoo and modified a bit
-        for x in ansi console dumb linux rxvt screen sun vt{52,100,102,200,220} xterm-color xterm-xfree86
-        do
-                local termfile="$(find "${D}${datadir}/terminfo/" -name "${x}" 2>/dev/null)"
-                local basedir="$(basename $(dirname "${termfile}"))"
-
-                if [ -n "${termfile}" ]
-                then
-                        install -d ${D}${sysconfdir}/terminfo/${basedir}
-                        mv ${termfile} ${D}${sysconfdir}/terminfo/${basedir}/
-                        ln -s /etc/terminfo/${basedir}/${x} \
-                                ${D}${datadir}/terminfo/${basedir}/${x}
-                fi
-        done
-        # i think we can use xterm-color as default xterm
-        if [ -e ${D}${sysconfdir}/terminfo/x/xterm-color ]
-        then
-                ln -sf xterm-color ${D}${sysconfdir}/terminfo/x/xterm
-        fi
-
-        if [ "${PN}" = "ncurses" ]; then
-                mv ${D}${bindir}/clear ${D}${bindir}/clear.${PN}
-                mv ${D}${bindir}/reset ${D}${bindir}/reset.${PN}
-        fi
-
-
-        # create linker scripts for libcurses.so and libncurses to
-        # link against -ltinfo when needed. Some builds might break
-        # else when '-Wl,--no-copy-dt-needed-entries' has been set in
-        # linker flags.
-        for i in libncurses libncursesw; do
-		f=${D}${libdir}/$i.so
-                test -h $f || continue
-                rm -f $f
-                echo '/* GNU ld script */'  >$f
-                echo "INPUT($i.so.5 AS_NEEDED(-ltinfo))" >>$f
-        done
-
-        # create libtermcap.so linker script for backward compatibility
-        f=${D}${libdir}/libtermcap.so
-        echo '/* GNU ld script */' >$f
-        echo 'INPUT(AS_NEEDED(-ltinfo))' >>$f
-}
-
-python populate_packages_prepend () {
-        libdir = bb.data.expand("${libdir}", d)
-        pnbase = bb.data.expand("${PN}-lib%s", d)
-        do_split_packages(d, libdir, '^lib(.*)\.so\..*', pnbase, 'ncurses %s library', prepend=True, extra_depends = '', allow_links=True)
-}
-
-
-pkg_postinst_ncurses-tools () {
-        if [ "${PN}" = "ncurses" ]; then
-                update-alternatives --install ${bindir}/clear clear clear.${PN} 100
-                update-alternatives --install ${bindir}/reset reset reset.${PN} 100
-        fi
-}
-
-pkg_prerm_ncurses-tools () {
-        if [ "${PN}" = "ncurses" ]; then
-                update-alternatives --remove clear clear.${PN}
-                update-alternatives --remove reset reset.${PN}
-        fi
-}
-
-BBCLASSEXTEND = "native nativesdk"
-
-PACKAGES += " \
-  ${PN}-tools \
-  ${PN}-terminfo \
-  ${PN}-terminfo-base \
-"
-
-FILES_${PN} = "\
-  ${bindir}/tput \
-  ${bindir}/tset \
-  ${bindir}/ncurses5-config \
-  ${bindir}/ncursesw5-config \
-  ${datadir}/tabset \
-"
-
-# This keeps only tput/tset in ncurses
-# clear/reset are in already busybox
-FILES_${PN}-tools = "\
-  ${bindir}/tic \
-  ${bindir}/toe \
-  ${bindir}/infotocap \
-  ${bindir}/captoinfo \
-  ${bindir}/infocmp \
-  ${bindir}/clear.${PN} \
-  ${bindir}/reset.${PN} \
-  ${bindir}/tack \
-  ${bindir}/tabs \
-"
-# 'reset' is a symlink to 'tset' which is in the 'ncurses' package
-RDEPENDS_${PN}-tools = "${PN}"
-
-FILES_${PN}-terminfo = "\
-  ${datadir}/terminfo \
-"
-
-FILES_${PN}-terminfo-base = "\
-  ${sysconfdir}/terminfo \
-"
-
-RSUGGESTS_${PN}-libtinfo = "${PN}-terminfo"
-RRECOMMENDS_${PN}-libtinfo = "${PN}-terminfo-base"
diff --git a/meta/recipes-core/ncurses/ncurses_5.9.bb b/meta/recipes-core/ncurses/ncurses_5.9.bb
new file mode 100644
index 0000000..4e1f143
--- /dev/null
+++ b/meta/recipes-core/ncurses/ncurses_5.9.bb
@@ -0,0 +1,10 @@
+require ncurses.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://tic-hang.patch \
+            file://config.cache \
+"
+
+SRC_URI[md5sum] = "8cb9c412e5f2d96bc6f459aa8c6282a1"
+SRC_URI[sha256sum] = "9046298fb440324c9d4135ecea7879ffed8546dd1b58e59430ea07a4633f563b"
-- 
1.7.0.4



