Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (unknown [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 72E2165EDC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 09:56:07 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s4M9u21N025659 for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:56:02 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 64mK1zS4jNso
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:56:02 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s4M9tv4h025646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 May 2014 10:55:59 +0100
Message-ID: <1400752550.17834.67.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 22 May 2014 10:55:50 +0100
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] lighthttp: Use pkg-config for pcre dependency
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
X-List-Received-Date: Thu, 22 May 2014 09:56:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch b/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
new file mode 100644
index 0000000..e395f92
--- /dev/null
+++ b/meta/recipes-extended/lighttpd/lighttpd/pkgconfig.patch
@@ -0,0 +1,33 @@
+Use pkg-config for pcre dependency instead of -config script.
+
+Upstream-Status: Pending
+
+RP 2014/5/22
+
+
+Index: lighttpd-1.4.35/configure.ac
+===================================================================
+--- lighttpd-1.4.35.orig/configure.ac	2014-03-06 14:08:00.000000000 +0000
++++ lighttpd-1.4.35/configure.ac	2014-05-13 16:58:30.758471169 +0000
+@@ -309,16 +309,14 @@
+ AC_MSG_RESULT([$WITH_PCRE])
+ 
+ if test "$WITH_PCRE" != "no"; then
+-  AC_PATH_PROG(PCRECONFIG, pcre-config)
+-
+-  if test x"$PCRECONFIG" != x; then
+-    PCRE_LIB=`$PCRECONFIG --libs`
+-    CPPFLAGS="$CPPFLAGS `$PCRECONFIG --cflags`"
++  PKG_CHECK_MODULES(PCREPKG, [libpcre], [
++    PCRE_LIB=${PCREPKG_LIBS}
++    CPPFLAGS="$CPPFLAGS ${PCREPKG_CFLAGS}"
+     AC_DEFINE([HAVE_LIBPCRE], [1], [libpcre])
+     AC_DEFINE([HAVE_PCRE_H], [1], [pcre.h])
+-  else
++  ], [
+      AC_MSG_ERROR([pcre-config not found, install the pcre-devel package or build with --without-pcre])
+-  fi
++  ])
+ fi
+ 
+ AC_SUBST(PCRE_LIB)
diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index bcab7d1..0acc37d 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -23,6 +23,7 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
         file://lighttpd.conf \
         file://lighttpd \
         file://lighttpd.service \
+        file://pkgconfig.patch \
         "
 
 SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"



