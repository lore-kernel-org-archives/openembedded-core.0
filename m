Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UQxvJ-0007Wk-EY for openembedded-core@lists.openembedded.org;
	Sat, 13 Apr 2013 12:43:29 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3DAOssN002392; Sat, 13 Apr 2013 11:25:39 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id iOwEAkakCz3L; Sat, 13 Apr 2013 11:25:38 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r3DAPVlk002547
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Sat, 13 Apr 2013 11:25:35 +0100
Message-ID: <1365848719.16702.74.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Sat, 13 Apr 2013 11:25:19 +0100
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Subject: [PATCH] gdk-pixbuf: Fix libpng determinism issues
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
X-List-Received-Date: Sat, 13 Apr 2013 10:43:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the 1.2
version gets preferred which is not desirable and does not give deterministic builds.

We really do want to use libpng since the item in DEPENDS will provide this so
manipulate the search list so the one we DEPEND on gets chosen. This was the cause of a
recent autobuilder failure.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
new file mode 100644
index 0000000..81a3d06
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf-2.26.5/pngversion.patch
@@ -0,0 +1,23 @@
+We now have libpng 1.6. If we build libpng12 as well as libpng 1.6, the 1.2 version gets 
+preferred which is not desirable and does not give deterministic builds.
+
+We really do want to use libpng since the item in DEPENDS will provide this so
+manipulate the search list so the one we DEPEND on gets chosen.
+
+RP 2013/4/13
+
+Upstream-Status: Pending [worth discussing at least]
+
+Index: gdk-pixbuf-2.26.5/configure.ac
+===================================================================
+--- gdk-pixbuf-2.26.5.orig/configure.ac	2013-03-26 15:45:16.594820303 +0000
++++ gdk-pixbuf-2.26.5/configure.ac	2013-04-13 10:15:19.241433789 +0000
+@@ -588,7 +588,7 @@
+ 
+ dnl Test for libpng
+   if test x$with_libpng != xno && test -z "$LIBPNG"; then
+-    for l in libpng15 libpng14 libpng12 libpng13 libpng10 libpng ; do
++    for l in libpng libpng15 libpng14 libpng12 libpng13 libpng10 ; do
+       AC_MSG_CHECKING(for $l)
+       if $PKG_CONFIG --exists $l ; then
+         AC_MSG_RESULT(yes)
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
index cc2ea50..b35f7c6 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.26.5.bb
@@ -15,6 +15,7 @@ SRC_URI = "http://ftp.acc.umu.se/pub/GNOME/sources/gdk-pixbuf/2.26/gdk-pixbuf-${
            file://hardcoded_libtool.patch \
            file://configure_fix.patch \
            file://extending-libinstall-dependencies.patch \
+           file://pngversion.patch \
            "
 
 SRC_URI[md5sum] = "339329e6d619ee3e1cb93979111b04c0"




