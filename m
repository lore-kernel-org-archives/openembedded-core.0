Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RCBIj-0002ZS-Ls for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 16:21:26 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EMILK010345 for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:22:19 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id JN62rH7nfA72
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Oct 2011 15:22:18 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p97EMEqx010342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 7 Oct 2011 15:22:16 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Fri, 07 Oct 2011 15:15:36 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317996944.2405.20.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] font-alias: Convert to use allarch including a patch to disable compiler checks
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
X-List-Received-Date: Fri, 07 Oct 2011 14:21:26 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
new file mode 100644
index 0000000..48e183c
--- a/dev/null
+++ b/meta/recipes-graphics/xorg-font/font-alias-1.0.3/nocompiler.patch
@@ -0,0 +1,30 @@
+XORG_DEFAULT_OPTIONS pulls in the following dependency chains:
+
+XORG_CWARNFLAGS -> AC_PROG_CC_C99
+XORG_STRICT_OPTION -> AC_PROG_CC_C99, XORG_CWARNFLAGS
+XORG_MANPAGE_SECTIONS -> AC_CANONICAL_HOST -> Checks host 
+
+each of which triggers the use of the host compiler. As an "all"
+architecture package, it shouldn't need a compiler (and doesn't).
+
+RP 17/5/2011
+
+diff -uNr font-alias-1.0.3.orig//configure.ac font-alias-1.0.3/configure.ac
+--- font-alias-1.0.3.orig//configure.ac	2011-05-18 21:29:18.378258643 +0200
++++ font-alias-1.0.3/configure.ac	2011-05-18 21:32:06.865258593 +0200
+@@ -28,12 +28,12 @@
+ AM_INIT_AUTOMAKE([foreign dist-bzip2])
+ AM_MAINTAINER_MODE
+ 
+-# Require xorg-macros: XORG_DEFAULT_OPTIONS
+ m4_ifndef([XORG_MACROS_VERSION],
+ 	  [m4_fatal([must install xorg-macros 1.3 or later before running autoconf/autogen])])
+ XORG_MACROS_VERSION(1.3)
+-XORG_DEFAULT_OPTIONS
+-
++XORG_RELEASE_VERSION
++XORG_CHANGELOG
++XORG_INSTALL
+ AC_PROG_INSTALL
+ 
+ XORG_FONTROOTDIR
diff --git a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
index 1b63961..7005291 100644
--- a/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
+++ b/meta/recipes-graphics/xorg-font/font-alias_1.0.3.bb
@@ -9,14 +9,16 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=bf0158b89be493d523d69d9f29265038 \
                     file://misc/fonts.alias;md5=a8ec05d528431d4c9703b55a7efd67a8 \
                     file://100dpi/fonts.alias;md5=85bebd6ca213aa656c301a72eb4397cb"
 
-DEPENDS = "virtual/xserver font-util"
+SRC_URI += "file://nocompiler.patch"
+
+DEPENDS = "util-macros-native"
 RDEPENDS_${PN} = "encodings font-util"
 RDEPENDS_${PN}_virtclass-native = "font-util-native"
 
-PE = "1"
-PR = "${INC_PR}.1"
+inherit allarch
 
-PACKAGE_ARCH = "all"
+PE = "1"
+PR = "${INC_PR}.2"
 
 SRC_URI[md5sum] = "6d25f64796fef34b53b439c2e9efa562"
 SRC_URI[sha256sum] = "8b453b2aae1cfa8090009ca037037b8c5e333550651d5a158b7264ce1d472c9a"




