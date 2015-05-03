Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 90F1960024
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 10:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43ASaQG019691 for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:28:36 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Bn0NJE_nqfII
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 May 2015 11:28:36 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t43ASM0p019677
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 3 May 2015 11:28:33 +0100
Message-ID: <1430648902.18360.92.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sun, 03 May 2015 11:28:22 +0100
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Subject: [PATCH] directfb: Correct bashism
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
X-List-Received-Date: Sun, 03 May 2015 10:28:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Fix builds of directfb on systems with dash as /bin/sh

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/meta/recipes-graphics/directfb/directfb.inc b/meta/recipes-graphics/directfb/directfb.inc
index e863b12..4fbca87 100644
--- a/meta/recipes-graphics/directfb/directfb.inc
+++ b/meta/recipes-graphics/directfb/directfb.inc
@@ -13,7 +13,8 @@ DEPENDS = "jpeg libpng freetype zlib tslib sysfsutils"
 
 SRC_URI = "http://www.directfb.org/downloads/Core/DirectFB-1.7/DirectFB-${PV}.tar.gz \
            file://configurefix.patch \
-           file://fusion.patch"
+           file://fusion.patch \
+           file://bashism.patch"
 
 S = "${WORKDIR}/DirectFB-${PV}"
 
diff --git a/meta/recipes-graphics/directfb/directfb/bashism.patch b/meta/recipes-graphics/directfb/directfb/bashism.patch
new file mode 100644
index 0000000..2ef4e93
--- /dev/null
+++ b/meta/recipes-graphics/directfb/directfb/bashism.patch
@@ -0,0 +1,18 @@
+${x//y/} is a bash syntax. Replace with something dash compatible
+
+RP 2015/5/3
+Upstream-Status: Pending
+
+Index: DirectFB-1.7.7/configure.in
+===================================================================
+--- DirectFB-1.7.7.orig/configure.in
++++ DirectFB-1.7.7/configure.in
+@@ -2696,7 +2696,7 @@ AM_CONDITIONAL(BUILD_TOOLS, test "$with_
+ AM_CONDITIONAL(CROSS_COMPILING, test "$cross_compiling" = "yes")
+ 
+ CFLAGS="$CFLAGS $DFB_INTERNAL_CFLAGS"
+-CXXFLAGS="$CXXFLAGS ${CFLAGS//-Werror-implicit-function-declaration/}"
++CXXFLAGS="$CXXFLAGS $(printf '%s\n' "$CFLAGS" | sed 's/-Werror-implicit-function-declaration//g')"
+ DFB_LDFLAGS="$LDFLAGS $ZLIB_LIBS"
+ 
+ CFLAGS="$CFLAGS $CFLAGS_STD"



