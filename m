Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVtCM-00039k-O4
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 00:04:18 +0100
Received: by faaa19 with SMTP id a19so890491faa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 30 Nov 2011 14:57:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xBc2aG8d0PSjGfib2rlPnnfCcdVcpvMYQf1LTHqy2IM=;
	b=rh25U6dyuOHkjRzgXCBBPy2C8VURb33fwe+LG0ckS2I7IiOXdK8+EA5a2szJ8CNycW
	qkNuDzJ61dM9gpKt1uQpFcdaXlzK/1Lrr5nbHw0PwYKxok78J7PyVsyWdWPqg6yiLIU2
	AaMnUq7pgQM4TaBFLAM4/dlFrep9TGh9sIxM4=
Received: by 10.205.123.3 with SMTP id gi3mr4555346bkc.112.1322693852334;
	Wed, 30 Nov 2011 14:57:32 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id c4sm7128417bkk.13.2011.11.30.14.57.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Nov 2011 14:57:31 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 30 Nov 2011 23:57:01 +0100
Message-Id: <75d753667b4d18a12a8d6342ea66cf4075c3b637.1322693708.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
References: <6d1a17a6a97b72caa8790538af19ba2c942c91ff.1322693708.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322693708.git.Martin.Jansa@gmail.com>
References: <cover.1322693708.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 3/3] gconf: add polkit to DEPENDS only for target recipe and disable default-service for native
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
X-List-Received-Date: Wed, 30 Nov 2011 23:04:19 -0000

* gnome-common-native is needed because gnomebase.bbclass does only
  DEPENDS += "gnome-common"

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |   10 +++++++---
 1 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index aa9da78..cdc7a35 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -3,9 +3,10 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native polkit"
+DEPENDS_virtclass-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native"
 
-PR = "r1"
+PR = "r2"
 
 inherit gnomebase
 
@@ -18,7 +19,10 @@ SRC_URI[archive.sha256sum] = "52008a82a847527877d9e1e549a351c86cc53cada4733b8a70
 
 S = "${WORKDIR}/GConf-${PV}"
 
-EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes --disable-introspection --disable-orbit --with-openldap=no"
+POLKIT_OECONF = "--enable-defaults-service"
+POLKIT_OECONF_virtclass-native = "--disable-defaults-service"
+EXTRA_OECONF = "--disable-gtk-doc --disable-gtk --enable-shared --disable-static --enable-debug=yes \
+                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF}"
 
 do_configure_prepend () {
 	touch gtk-doc.make
-- 
1.7.8.rc4



