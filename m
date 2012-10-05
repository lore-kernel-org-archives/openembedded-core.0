Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TK6a5-0002jz-7B for openembedded-core@lists.openembedded.org;
	Fri, 05 Oct 2012 14:00:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95BlYUO016450
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 12:47:34 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 16305-01 for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2012 12:47:30 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q95BlPHt016444
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Oct 2012 12:47:26 +0100
Message-ID: <1349437649.15658.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 05 Oct 2012 12:47:29 +0100
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] libdrm: Explicitly disable the cairo dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 12:00:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We don't want the cairo dependency. Unfortunately simply checking whether its present
isn't good enough. If its not in DEPENDS, it can disappear half way through building.
We therefore need to explicitly disable it.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index cc09791..2ed9c14 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -18,6 +18,8 @@ DEPENDS += " libpciaccess"
 
 inherit autotools pkgconfig
 
+EXTRA_OECONF += "--disable-cairo"
+
 PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
 FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
diff --git a/meta/recipes-graphics/drm/libdrm/nocairo.patch b/meta/recipes-graphics/drm/libdrm/nocairo.patch
new file mode 100644
index 0000000..f9b7f3a
--- a/dev/null
+++ b/meta/recipes-graphics/drm/libdrm/nocairo.patch
@@ -0,0 +1,39 @@
+We don't want the cairo dependency. Unfortunately simply checking whether its present 
+isn't good enough. If its not in DEPENDS, it can disappear half way through building.
+We therefore need to explictly disable it.
+
+RP
+2012/10/5
+
+Index: libdrm-2.4.39/configure.ac
+===================================================================
+--- libdrm-2.4.39.orig/configure.ac	2012-08-24 14:54:42.000000000 +0000
++++ libdrm-2.4.39/configure.ac	2012-10-05 11:37:52.484821221 +0000
+@@ -63,6 +63,11 @@
+ 	      [Disable KMS mm abstraction library (default: auto)]),
+ 	      [LIBKMS=$enableval], [LIBKMS=auto])
+ 
++AC_ARG_ENABLE(cairo,
++	      AS_HELP_STRING([--disable-cairo],
++	      [Disable cairo (default: auto)]),
++	      [ENABLECAIRO=$enableval], [ENABLECAIRO=auto])
++
+ AC_ARG_ENABLE(intel,
+ 	      AS_HELP_STRING([--disable-intel],
+ 	      [Enable support for intel's KMS API (default: auto)]),
+@@ -201,9 +206,12 @@
+ 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
+ fi
+ 
+-PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
+-if test "x$HAVE_CAIRO" = xyes; then
+-	AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
++HAVE_CAIRO=no
++if test "x$ENABLECAIRO" = xyes; then
++	PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
++	if test "x$HAVE_CAIRO" = xyes; then
++		AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
++	fi
+ fi
+ AM_CONDITIONAL(HAVE_CAIRO, [test "x$HAVE_CAIRO" = xyes])
+ 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
index 4e6a8d5..cb1f7f9 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
@@ -4,6 +4,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
+            file://nocairo.patch \
            "
 
 SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"




