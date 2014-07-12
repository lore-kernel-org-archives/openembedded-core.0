Return-Path: <pab@pabigot.com>
X-Greylist: delayed 433 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 12 Jul 2014 02:49:43 UTC
Received: from p3plsmtpa07-01.prod.phx3.secureserver.net
	(p3plsmtpa07-01.prod.phx3.secureserver.net [173.201.192.230])
	by mail.openembedded.org (Postfix) with ESMTP id 5C1227032F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jul 2014 02:49:43 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa07-01.prod.phx3.secureserver.net with 
	id REiV1o00A1mTNtu01EiWtK; Fri, 11 Jul 2014 19:42:31 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Jul 2014 21:42:27 -0500
Message-Id: <1405132947-32495-1-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.7.9.5
Cc: "Peter A. Bigot" <pab@pabigot.com>
Subject: [meta-oe][PATCH] cups: extend cups-no-gcrypt.patch to apply to configure script
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
X-List-Received-Date: Sat, 12 Jul 2014 02:49:48 -0000

From: "Peter A. Bigot" <pab@pabigot.com>

The original patch removed gcrypt from an m4 source file that
contributes to configure.in, but didn't apply those changes to or
rebuild the configure script itself.  This allowed libgcrypt-config to
be found, adding native libraries to the target build.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 .../cups/cups/cups-no-gcrypt.patch                 |   87 +++++++++++++++++++-
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
index 8bbcf39..05646ee 100644
--- a/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
+++ b/meta/recipes-extended/cups/cups/cups-no-gcrypt.patch
@@ -10,11 +10,12 @@ Backported from http://www.cups.org/strfiles.php/3308/cups-no-gcrypt.patch
 Upstream-Status: Backport 
 
 Signed-off-by: Armin Kuster <akuster@mvista.com>
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
 
 Last-Update: 2014-04-07
 --- a/config-scripts/cups-ssl.m4
 +++ b/config-scripts/cups-ssl.m4
-@@ -66,7 +66,6 @@
+@@ -66,7 +66,6 @@ if test x$enable_ssl != xno; then
      dnl Then look for GNU TLS...
      if test $have_ssl = 0 -a "x$enable_gnutls" != "xno" -a "x$PKGCONFIG" != x; then
      	AC_PATH_PROG(LIBGNUTLSCONFIG,libgnutls-config)
@@ -22,7 +23,7 @@ Last-Update: 2014-04-07
  	if $PKGCONFIG --exists gnutls; then
  	    have_ssl=1
  	    SSLLIBS=`$PKGCONFIG --libs gnutls`
-@@ -84,14 +83,6 @@
+@@ -84,14 +83,6 @@ if test x$enable_ssl != xno; then
  	if test $have_ssl = 1; then
  	    CUPS_SERVERCERT="ssl/server.crt"
  	    CUPS_SERVERKEY="ssl/server.key"
@@ -37,9 +38,86 @@ Last-Update: 2014-04-07
  	fi
      fi
  
+diff --git a/configure b/configure
+index 58623bb..c1f47c0 100755
+--- a/configure
++++ b/configure
+@@ -651,7 +651,6 @@ SSLFLAGS
+ IPPALIASES
+ CUPS_SERVERKEY
+ CUPS_SERVERCERT
+-LIBGCRYPTCONFIG
+ LIBGNUTLSCONFIG
+ PTHREAD_FLAGS
+ CUPS_DEFAULT_GSSSERVICENAME
+@@ -8342,47 +8341,6 @@ else
+ $as_echo "no" >&6; }
+ fi
+ 
+-
+-    	# Extract the first word of "libgcrypt-config", so it can be a program name with args.
+-set dummy libgcrypt-config; ac_word=$2
+-{ $as_echo "$as_me:${as_lineno-$LINENO}: checking for $ac_word" >&5
+-$as_echo_n "checking for $ac_word... " >&6; }
+-if ${ac_cv_path_LIBGCRYPTCONFIG+:} false; then :
+-  $as_echo_n "(cached) " >&6
+-else
+-  case $LIBGCRYPTCONFIG in
+-  [\\/]* | ?:[\\/]*)
+-  ac_cv_path_LIBGCRYPTCONFIG="$LIBGCRYPTCONFIG" # Let the user override the test with a path.
+-  ;;
+-  *)
+-  as_save_IFS=$IFS; IFS=$PATH_SEPARATOR
+-for as_dir in $PATH
+-do
+-  IFS=$as_save_IFS
+-  test -z "$as_dir" && as_dir=.
+-    for ac_exec_ext in '' $ac_executable_extensions; do
+-  if { test -f "$as_dir/$ac_word$ac_exec_ext" && $as_test_x "$as_dir/$ac_word$ac_exec_ext"; }; then
+-    ac_cv_path_LIBGCRYPTCONFIG="$as_dir/$ac_word$ac_exec_ext"
+-    $as_echo "$as_me:${as_lineno-$LINENO}: found $as_dir/$ac_word$ac_exec_ext" >&5
+-    break 2
+-  fi
+-done
+-  done
+-IFS=$as_save_IFS
+-
+-  ;;
+-esac
+-fi
+-LIBGCRYPTCONFIG=$ac_cv_path_LIBGCRYPTCONFIG
+-if test -n "$LIBGCRYPTCONFIG"; then
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: $LIBGCRYPTCONFIG" >&5
+-$as_echo "$LIBGCRYPTCONFIG" >&6; }
+-else
+-  { $as_echo "$as_me:${as_lineno-$LINENO}: result: no" >&5
+-$as_echo "no" >&6; }
+-fi
+-
+-
+ 	if $PKGCONFIG --exists gnutls; then
+ 	    have_ssl=1
+ 	    SSLLIBS=`$PKGCONFIG --libs gnutls`
+@@ -8404,14 +8362,6 @@ fi
+ 	if test $have_ssl = 1; then
+ 	    CUPS_SERVERCERT="ssl/server.crt"
+ 	    CUPS_SERVERKEY="ssl/server.key"
+-
+-            if $PKGCONFIG --exists gcrypt; then
+-	        SSLLIBS="$SSLLIBS `$PKGCONFIG --libs gcrypt`"
+-	        SSLFLAGS="$SSLFLAGS `$PKGCONFIG --cflags gcrypt`"
+-	    elif test "x$LIBGCRYPTCONFIG" != x; then
+-	        SSLLIBS="$SSLLIBS `$LIBGCRYPTCONFIG --libs`"
+-	        SSLFLAGS="$SSLFLAGS `$LIBGCRYPTCONFIG --cflags`"
+-	    fi
+ 	fi
+     fi
+ 
+diff --git a/cups/http-private.h b/cups/http-private.h
+index 99a85c3..a674852 100644
 --- a/cups/http-private.h
 +++ b/cups/http-private.h
-@@ -80,7 +80,6 @@
+@@ -80,7 +80,6 @@ typedef int socklen_t;
  #  elif defined HAVE_GNUTLS
  #    include <gnutls/gnutls.h>
  #    include <gnutls/x509.h>
@@ -47,3 +125,6 @@ Last-Update: 2014-04-07
  #  elif defined(HAVE_CDSASSL)
  #    include <CoreFoundation/CoreFoundation.h>
  #    include <Security/Security.h>
+-- 
+1.8.5.5
+
-- 
1.7.9.5


