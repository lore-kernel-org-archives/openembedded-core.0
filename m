Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1S1K8D-00084C-M7 for openembedded-core@lists.openembedded.org;
	Sat, 25 Feb 2012 17:05:57 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFvZoD021442
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:57:35 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 20924-02 for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:57:31 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q1PFvQiO021435
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Feb 2012 15:57:27 GMT
Message-ID: <1330185446.13788.40.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 25 Feb 2012 15:57:26 +0000
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: [PATCH] glib: Drop dbus dependency, it isn't useful
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
X-List-Received-Date: Sat, 25 Feb 2012 16:05:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

dbus is only needed for some of the glib tests which we don't use. We can
therefore drop the dependency and gain some small parallelism gains.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta-yocto/conf/distro/poky-tiny.conf b/meta-yocto/conf/distro/poky-tiny.conf
index 411347a..5d1d67a 100644
--- a/meta-yocto/conf/distro/poky-tiny.conf
+++ b/meta-yocto/conf/distro/poky-tiny.conf
@@ -108,3 +108,5 @@ IMAGE_FSTYPES = "ext2 cpio.gz"
 #        variants of all compatible machines, but that leads to a lot
 #        more machine configs to maintain long term.
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS = ""
+
+ASSUME_PROVIDED += "pkgconfig$"
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
new file mode 100644
index 0000000..1486203
--- a/dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/nodbus.patch
@@ -0,0 +1,23 @@
+Disable dbus dependency. Autodetecting isn't deterministic, we don't have the DEPENDS
+and we don't want to built this piece so hardcode it off.
+
+RP 2012/2/25
+
+Index: glib-2.30.2/configure.ac
+===================================================================
+--- glib-2.30.2.orig/configure.ac	2012-02-25 14:50:07.444242397 +0000
++++ glib-2.30.2/configure.ac	2012-02-25 14:51:28.096240485 +0000
+@@ -3769,10 +3769,9 @@
+ # Check for libdbus1 - Optional - is only used in the GDBus test cases
+ #
+ # 1.2.14 required for dbus_message_set_serial
+-PKG_CHECK_MODULES(DBUS1,
+-                  dbus-1 >= 1.2.14,
+-                  [AC_DEFINE(HAVE_DBUS1, 1, [Define if dbus-1 is available]) have_dbus1=yes],
+-                  have_dbus1=no)
++DBUS1_CFLAGS=
++DBUS1_LIBS=
++$have_dbus1=no      
+ AC_SUBST(DBUS1_CFLAGS)
+ AC_SUBST(DBUS1_LIBS)
+ AM_CONDITIONAL(HAVE_DBUS1, [test "x$have_dbus1" = "xyes"])
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
index e2170bc..0b26575 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb
@@ -1,6 +1,6 @@
 require glib.inc
 
-PR = "r5"
+PR = "r6"
 PE = "1"
 
 DEPENDS += "libffi python-argparse-native zlib"
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.bz2 \
            file://60_wait-longer-for-threads-to-die.patch \
            file://g_once_init_enter.patch \
            file://glib-2.0_fix_for_x32.patch \
+           file://nodbus.patch \
           "
 SRC_URI[md5sum] = "b40f3889e8d24e1b367763673ca6deb5"
 SRC_URI[sha256sum] = "94b1f1a1456c67060ca868d299bef3f7268a2c1c5c360aabb7149d4d9b2fdcd3"
diff --git a/meta/recipes-core/glib-2.0/glib.inc b/meta/recipes-core/glib-2.0/glib.inc
index d553869..6eddf8f 100644
--- a/meta/recipes-core/glib-2.0/glib.inc
+++ b/meta/recipes-core/glib-2.0/glib.inc
@@ -13,8 +13,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
 BUGTRACKER = "http://bugzilla.gnome.org"
 SECTION = "libs"
 
-DEPENDS = "glib-2.0-native gtk-doc-native zip dbus"
-DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native dbus-native"
+DEPENDS = "glib-2.0-native gtk-doc-native zip"
+DEPENDS_virtclass-native = "gtk-doc-native pkgconfig-native gettext-native"
 DEPENDS_virtclass-nativesdk = "libtool-nativesdk"
 PACKAGES =+ "${PN}-utils "
 




