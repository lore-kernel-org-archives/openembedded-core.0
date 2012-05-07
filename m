Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SRKlS-0004GO-2Q for openembedded-core@lists.openembedded.org;
	Mon, 07 May 2012 12:01:58 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479q9Xr002329
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 10:52:09 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 01723-04 for <openembedded-core@lists.openembedded.org>;
	Mon,  7 May 2012 10:52:05 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q479q2To002323
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 7 May 2012 10:52:03 +0100
Message-ID: <1336384326.23777.70.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 07 May 2012 10:52:06 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] glib-2.0: Fix issues with libelf dependency creeping in
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
X-List-Received-Date: Mon, 07 May 2012 10:01:58 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
new file mode 100644
index 0000000..e9b3b26
--- a/dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nolibelf.patch
@@ -0,0 +1,37 @@
+Ideally there would be configureation option for this but there is not. We
+can't allow this code since it could detect the host system's libelf with
+disasterous effects when cross compiling.
+
+RP 2012/5/7
+
+Upstream-Status: Pending (would need to be made a configure option to disabe)
+
+Index: glib-2.32.2/configure.ac
+===================================================================
+--- glib-2.32.2.orig/configure.ac	2012-05-07 08:30:04.481149925 +0000
++++ glib-2.32.2/configure.ac	2012-05-07 08:31:02.185148588 +0000
+@@ -1816,23 +1816,7 @@
+ dnl *** check for libelf ***
+ dnl ************************
+ 
+-PKG_CHECK_MODULES([LIBELF], [libelf], [have_libelf=yes], [have_libelf=maybe])
+-
+-if test $have_libelf = maybe; then
+-  AC_CHECK_LIB([elf], [elf_begin], , [have_libelf=no])
+-  AC_CHECK_LIB([elf], [elf_getshdrstrndx], , [have_libelf=no])
+-  AC_CHECK_LIB([elf], [elf_getshdrnum], , [have_libelf=no])
+-  AC_CHECK_HEADER([libelf.h], , [have_libelf=no])
+-
+-  if test $have_libelf != no; then
+-    LIBELF_LIBS=-lelf
+-    have_libelf = yes
+-  fi
+-fi
+-
+-if test $have_libelf = yes; then
+-  AC_DEFINE(HAVE_LIBELF, 1, [Define if libelf is available])
+-fi
++have_libelf=no
+ 
+ dnl ****************************************
+ dnl *** platform dependent source checks ***
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
index f303cb4..b9b3356 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.32.2.bb
@@ -1,6 +1,7 @@
 require glib.inc
 
 PE = "1"
+PR = "r1"
 
 DEPENDS += "libffi python-argparse-native zlib"
 DEPENDS_virtclass-native += "libffi-native python-argparse-native"
@@ -13,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://60_wait-longer-for-threads-to-die.patch \
            file://glib-2.0_fix_for_x32.patch \
            file://nodbus.patch \
+           file://nolibelf.patch \
           "
 SRC_URI[md5sum] = "5bfdb6197afb90e4dbc7b1bb98f0eae0"
 SRC_URI[sha256sum] = "b1764abf00bac96e0e93e29fb9715ce75f3583579acac40648e18771d43d6136"




