Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fcooperjr27@gmail.com>) id 1TJbDe-0004iU-2Q
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Oct 2012 04:31:22 +0200
Received: by mail-oa0-f47.google.com with SMTP id h1so549oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 19:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=84lqBrqG3AJCB19vfDfqzThgJ/ktLRG/zb/W2mb3pH0=;
	b=e1YTJDwP1rDuwr3QYV7hjyuU4Kb6L6j6d6fMS7RTWZg0R7cQNBXVVvGGGZNvzXdRwQ
	i2AuMVNND4kUXezfPc/UBhi4q8NjVDIN83+0dJPZUuau6+WA1yajdQQqH949w/ukE2hr
	O8eTi+cE1mVZpt405CLZAJZu88pxMwwLEK9abEWpRXhMN7Y/kK3bXSzFfH78qjGd2v+Q
	BLKCNAsPa96MMs59oJXS9rvEq2UaoyESD+dVngrVRTuDWb3Hu0j4Wjy5Oa0cFvzs1FJF
	rv3vUwe92SaKCq0HRKvju1F+cGdPnKmBy2e1vOL5fFTnG3SGP8rtODEpowCvATCQwQRe
	8FnA==
Received: by 10.60.22.198 with SMTP id g6mr3062342oef.18.1349317101381;
	Wed, 03 Oct 2012 19:18:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id k7sm4240933oek.6.2012.10.03.19.18.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 03 Oct 2012 19:18:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Oct 2012 21:46:15 -0500
Message-Id: <1349318775-17939-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [for-denzil][PATCH] gconf: Disable gtk support
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
X-List-Received-Date: Thu, 04 Oct 2012 02:31:22 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There are only a couple of helper utilities within gconf that need gtk+ as a
dependency and those are unused and pretty useless. We might as well drop
the dependency on gtk and allow more parallel builds by reducing dependency
bottlenecks.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    8 +++-----
 1 files changed, 3 insertions(+), 5 deletions(-)

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
-- 
1.7.0.4



