Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 8501760E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:51:05 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9p0HG025471 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:51:01 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 4V00ZH6FLN42
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:51:00 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9owUU025468
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:50:59 +0100
Message-ID: <1400752250.17834.59.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:50:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] gnupg: Convert to use pkg-config for dependencies
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
X-List-Received-Date: Thu, 22 May 2014 09:51:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Use pkg-config to find pth instead of pth-config and our own macros from
aclocal-copy.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/gnupg/gnupg/pkgconfig.patch b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
new file mode 100644
index 0000000..ae92392
--- /dev/null
+++ b/meta/recipes-support/gnupg/gnupg/pkgconfig.patch
@@ -0,0 +1,86 @@
+Use pkg-config to find pth instead of pth-config.
+
+Upstream-Status: Rejected
+[not submitted but they've been clear they don't want a pkg-config dependency]
+
+RP 2014/5/22
+
+Index: gnupg-2.0.22/m4/gnupg-pth.m4
+===================================================================
+--- gnupg-2.0.22.orig/m4/gnupg-pth.m4	2013-10-04 12:32:53.000000000 +0000
++++ gnupg-2.0.22/m4/gnupg-pth.m4	2014-05-13 21:33:21.000000000 +0000
+@@ -17,33 +17,9 @@
+ # Taken and modified from the m4 macros which come with Pth.
+ AC_DEFUN([GNUPG_PTH_VERSION_CHECK],
+   [
+-    _pth_version=`$PTH_CONFIG --version | awk 'NR==1 {print [$]3}'`
+     _req_version="ifelse([$1],,1.2.0,$1)"
++    PKG_CHECK_MODULES(PTH, [pth >= $_req_version], [have_pth=yes], [have_pth=no])
+ 
+-    AC_MSG_CHECKING(for PTH - version >= $_req_version)
+-    for _var in _pth_version _req_version; do
+-        eval "_val=\"\$${_var}\""
+-        _major=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\1/'`
+-        _minor=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\2/'`
+-        _rtype=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\3/'`
+-        _micro=`echo $_val | sed 's/\([[0-9]]*\)\.\([[0-9]]*\)\([[ab.]]\)\([[0-9]]*\)/\4/'`
+-        case $_rtype in
+-            "a" ) _rtype=0 ;;
+-            "b" ) _rtype=1 ;;
+-            "." ) _rtype=2 ;;
+-        esac
+-        _hex=`echo dummy | awk '{ printf("%d%02d%1d%02d", major, minor, rtype, micro); }' \
+-              "major=$_major" "minor=$_minor" "rtype=$_rtype" "micro=$_micro"`
+-        eval "${_var}_hex=\"\$_hex\""
+-    done
+-    have_pth=no
+-    if test ".$_pth_version_hex" != .; then
+-        if test ".$_req_version_hex" != .; then
+-            if test $_pth_version_hex -ge $_req_version_hex; then
+-                have_pth=yes
+-            fi
+-        fi
+-    fi
+     if test $have_pth = yes; then
+        AC_MSG_RESULT(yes)
+        AC_MSG_CHECKING([whether PTH installation is sane])
+@@ -51,9 +29,9 @@
+          _gnupg_pth_save_cflags=$CFLAGS
+          _gnupg_pth_save_ldflags=$LDFLAGS
+          _gnupg_pth_save_libs=$LIBS
+-         CFLAGS="$CFLAGS `$PTH_CONFIG --cflags`"
+-         LDFLAGS="$LDFLAGS `$PTH_CONFIG --ldflags`"
+-         LIBS="$LIBS `$PTH_CONFIG --libs --all`"
++         CFLAGS="$CFLAGS $PTH_CFLAGS"
++         LDFLAGS="$LDFLAGS $PTH_LDFLAGS"
++         LIBS="$LIBS $PTH_LIBS"
+          AC_LINK_IFELSE([AC_LANG_PROGRAM([#include <pth.h>
+                                          ],
+                                          [[ pth_init ();]])],
+@@ -81,23 +59,11 @@
+ #
+ AC_DEFUN([GNUPG_PATH_PTH],
++[
+-[ AC_ARG_WITH(pth-prefix,
+-             AC_HELP_STRING([--with-pth-prefix=PFX],
+-                           [prefix where GNU Pth is installed]),
+-     pth_config_prefix="$withval", pth_config_prefix="")
+-  if test x$pth_config_prefix != x ; then
+-     PTH_CONFIG="$pth_config_prefix/bin/pth-config"
+-  fi
+-  AC_PATH_PROG(PTH_CONFIG, pth-config, no)
+   tmp=ifelse([$1], ,1.3.7,$1)
+-  if test "$PTH_CONFIG" != "no"; then
+-    GNUPG_PTH_VERSION_CHECK($tmp)
+-    if test $have_pth = yes; then
+-       PTH_CFLAGS=`$PTH_CONFIG --cflags`
+-       PTH_LIBS=`$PTH_CONFIG --ldflags`
+-       PTH_LIBS="$PTH_LIBS `$PTH_CONFIG --libs --all`"
++  GNUPG_PTH_VERSION_CHECK($tmp)
++  if test $have_pth = yes; then
+        AC_DEFINE(HAVE_PTH, 1,
+                 [Defined if the GNU Pth is available])
+-    fi
+   fi
+   AC_SUBST(PTH_CFLAGS)
+   AC_SUBST(PTH_LIBS)
diff --git a/meta/recipes-support/gnupg/gnupg_2.0.22.bb b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
index c1ed28c..2746578 100644
--- a/meta/recipes-support/gnupg/gnupg_2.0.22.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.0.22.bb
@@ -10,7 +10,8 @@ PTH_libc-uclibc = "npth"
 
 inherit autotools gettext texinfo
 
-SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
+SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
+           file://pkgconfig.patch"
 
 SRC_URI[md5sum] = "ee22e7b4fdbfcb50229c2e6db6db291e"
 SRC_URI[sha256sum] = "437d0ab259854359fc48aa8795af80cff4975e559c111c92c03d0bc91408e251"
@@ -23,6 +24,14 @@ EXTRA_OECONF = "--disable-ldap \
                 --with-readline=${STAGING_LIBDIR}/.. \
                "
 
+do_configure_prepend () {
+	# Else these could be used in prefernce to those in aclocal-copy
+	rm -f ${S}/m4/gpg-error.m4
+	rm -f ${S}/m4/libassuan.m4
+	rm -f ${S}/m4/ksba.m4
+	rm -f ${S}/m4/libgcrypt.m4
+}
+
 do_install_append() {
 	ln -sf gpg2 ${D}${bindir}/gpg
 	ln -sf gpgv2 ${D}${bindir}/gpgv



