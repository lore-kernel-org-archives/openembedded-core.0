Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id A49FA60E23
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:51:35 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9pVTO025519 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:51:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id F1FPI1YBITgT
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:51:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9pRAC025504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:51:29 +0100
Message-ID: <1400752280.17834.60.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:51:20 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] libxslt: Use pkg-config for dependencies
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
X-List-Received-Date: Thu, 22 May 2014 09:51:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-support/libxslt/libxslt/pkgconfig.patch b/meta/recipes-support/libxslt/libxslt/pkgconfig.patch
new file mode 100644
index 0000000..89d14c9
--- /dev/null
+++ b/meta/recipes-support/libxslt/libxslt/pkgconfig.patch
@@ -0,0 +1,118 @@
+Use pkg-config to find gcrypt and libxml2.
+
+Upstream-Status: Pending [libxml2 is upstreamable]
+
+RP 2014/5/22
+
+Index: libxslt-1.1.28/configure.in
+===================================================================
+--- libxslt-1.1.28.orig/configure.in	2014-05-13 16:46:02.278474967 +0000
++++ libxslt-1.1.28/configure.in	2014-05-13 16:53:56.510472561 +0000
+@@ -376,6 +376,8 @@
+ AC_SUBST(PYTHON_SUBDIR)
+ AC_SUBST(PYTHON_LIBS)
+ 
++PKG_PROG_PKG_CONFIG
++
+ AC_ARG_WITH(crypto, [  --with-crypto           Add crypto support to exslt (on)])
+ WITH_CRYPTO=0
+ if test "$with_crypto" = "no" ; then
+@@ -391,26 +393,13 @@
+     WITH_CRYPTO=1
+     ;;
+   *)
+-    AC_PATH_PROG(LIBGCRYPT_CONFIG, libgcrypt-config, no)
+-    if test "$LIBGCRYPT_CONFIG" != "no" ; then
+-      LIBGCRYPT_VERSION=`$LIBGCRYPT_CONFIG --version`
+-      if test VERSION_TO_NUMBER(echo $LIBGCRYPT_VERSION) -lt VERSION_TO_NUMBER(echo "1.1.42")
+-      then
+-        LIBGCRYPT_CFLAGS=""
+-        LIBGCRYPT_LIBS=""
+-        echo 'gcrypt library version < 1.1.42 - Crypto extensions will not be available.'
+-      else
+-        LIBGCRYPT_CFLAGS=`$LIBGCRYPT_CONFIG $libgcrypt_config_args --cflags`
+-        LIBGCRYPT_LIBS=`$LIBGCRYPT_CONFIG $libgcrypt_config_args --libs`
+-        AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
+-        echo 'Crypto extensions will be available.'
++    PKG_CHECK_MODULES(LIBGCRYPT, [libgcrypt >= 1.1.42], [
++          AC_DEFINE(HAVE_GCRYPT, 1, [Define if gcrypt library is available.])
++          echo 'Crypto extensions will be available.'
+ 		WITH_CRYPTO=1
+-      fi
+-    else
+-      LIBGCRYPT_CFLAGS=""
+-      LIBGCRYPT_LIBS=""
+-      echo 'Crypto extensions will not be available. Install libgcrypt and reconfigure to make available.'
+-    fi
++	], [
++          echo 'Crypto extensions will not be available. Install libgcrypt >= 1.1.42 and reconfigure to make available.'
++        ])
+ esac
+ fi
+ AC_SUBST(WITH_CRYPTO)
+@@ -471,24 +460,8 @@
+ dnl some tweaking - David Härdeman 30/10/2001
+ dnl
+ 
+-LIBXML_CONFIG_PREFIX=""
+ LIBXML_SRC=""
+ 
+-AC_ARG_WITH(libxml-prefix,
+-        [  --with-libxml-prefix=[PFX]		Specify location of libxml config],
+-	LIBXML_CONFIG_PREFIX=$withval
+-)
+-        
+-AC_ARG_WITH(libxml-include-prefix,
+-        [  --with-libxml-include-prefix=[PFX]	Specify location of libxml headers],
+-        LIBXML_CFLAGS="-I$withval"
+-)
+-
+-AC_ARG_WITH(libxml-libs-prefix,
+-        [  --with-libxml-libs-prefix=[PFX]	Specify location of libxml libs],
+-        LIBXML_LIBS="-L$withval"
+-)
+-
+ AC_ARG_WITH(libxml-src,
+ 	[  --with-libxml-src=[DIR]              For libxml thats not installed yet (sets all three above)],
+ 	LIBXML_SRC="$withval"
+@@ -551,28 +524,9 @@
+ 	fi
+ fi
+ 
+-dnl
+-dnl make sure xml2-config is executable,
+-dnl test version and init our variables
+-dnl
+-
+-if ${XML_CONFIG} --libs print > /dev/null 2>&1
+-then
+-	XMLVERS=`$XML_CONFIG --version`
+-	if test VERSION_TO_NUMBER(echo $XMLVERS) -ge VERSION_TO_NUMBER(echo $LIBXML_REQUIRED_VERSION)
+-	then
+-		AC_MSG_RESULT($XMLVERS found)
+-	else
+-		AC_MSG_ERROR(Version $XMLVERS found. You need at least libxml2 $LIBXML_REQUIRED_VERSION for this version of libxslt)
+-	fi
+-	LIBXML_LIBS="$LIBXML_LIBS `$XML_CONFIG --libs`"
+-	if test "x$LIBXML_SRC" = "x"; then
+-		LIBXML_CFLAGS="$LIBXML_CFLAGS `$XML_CONFIG --cflags`"
+-	fi
+-else
+-	AC_MSG_ERROR([Could not find libxml2 anywhere, check ftp://xmlsoft.org/.])
+-fi
+-
++PKG_CHECK_MODULES(LIBXML, [libxml-2.0 >= $LIBXML_REQUIRED_VERSION],,
++    [AC_MSG_ERROR([Could not find libxml-2.0 >= $LIBXML_REQUIRED_VERSION anywhere, check ftp://xmlsoft.org/.])]
++)
+ 
+ AC_SUBST(CFLAGS)
+ AC_SUBST(CPPFLAGS)
+@@ -597,7 +551,7 @@
+ 
+ if test "$with_plugins" = "yes" ; then
+   AC_MSG_CHECKING([libxml2 module support])
+-  WITH_MODULES="`$XML_CONFIG --modules`"
++  WITH_MODULES="`$PKG_CONFIG --variable=modules libxml-2.0`"
+   if test "${WITH_MODULES}" = "1"; then
+     AC_MSG_RESULT(yes)
+   else
diff --git a/meta/recipes-support/libxslt/libxslt_1.1.28.bb b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
index 24401bb..5401f3c 100644
--- a/meta/recipes-support/libxslt/libxslt_1.1.28.bb
+++ b/meta/recipes-support/libxslt/libxslt_1.1.28.bb
@@ -9,7 +9,8 @@ SECTION = "libs"
 DEPENDS = "libxml2"
 
 SRC_URI = "ftp://xmlsoft.org/libxslt//libxslt-${PV}.tar.gz \
-           file://pkgconfig_fix.patch"
+           file://pkgconfig_fix.patch \
+           file://pkgconfig.patch"
 
 SRC_URI[md5sum] = "9667bf6f9310b957254fdcf6596600b7"
 SRC_URI[sha256sum] = "5fc7151a57b89c03d7b825df5a0fae0a8d5f05674c0e7cf2937ecec4d54a028c"



