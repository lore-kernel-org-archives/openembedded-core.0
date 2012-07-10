Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SoaiK-00031M-7i for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 15:42:52 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ADVhEo017175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:31:43 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15604-07 for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:31:39 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6ADVXGc017167
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 14:31:34 +0100
Message-ID: <1341927093.24837.7.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Jul 2012 14:31:33 +0100
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: gconf: Disable gtk support
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
X-List-Received-Date: Tue, 10 Jul 2012 13:42:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

There are only a couple of helper utilities within gconf that need gtk+ as a
dependency and those are unused and pretty useless. We might as well drop
the dependency on gtk and allow more parallel builds by reducing dependency
bottlenecks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index ccbc24e..1da7203 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 POLKIT = "polkit"
 POLKIT_libc-uclibc = ""
 
-DEPENDS = "glib-2.0 gtk+ dbus dbus-glib libxml2 intltool-native ${POLKIT}"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT}"
 DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r8"
+PR = "r9"
 
 inherit gnomebase
 
@@ -26,10 +26,8 @@ POLKIT_OECONF = "--enable-defaults-service"
 POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
 POLKIT_OECONF_libc-uclibc = "--disable-default-service"
 
-GTKOECONF = "--with-gtk=2.0 --enable-gtk"
-GTKOECONF_virtclass-native = "--disable-gtk"
 EXTRA_OECONF = "--disable-gtk-doc --enable-shared --disable-static --enable-debug=yes \
-                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} ${GTKOECONF}"
+                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} --disable-gtk"
 
 do_configure_prepend () {
 	touch gtk-doc.make




