Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RVWBx-0008Bu-0X
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Nov 2011 23:30:21 +0100
Received: by bkbzs2 with SMTP id zs2so9989243bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2011 14:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=xBc2aG8d0PSjGfib2rlPnnfCcdVcpvMYQf1LTHqy2IM=;
	b=QHcpODsH00primfciPLrm8gpfiIlJs+9XDh+EPXcVojGBAZ2EJXwDaJEm5kYyJc59e
	OFEnJ7MYlFIFC8z4VER0+S82JhmooYOkRwji+l2cQqMBIaaDZYRmPKY48eSsqhMKhKhV
	wm5qT9l1J6m9/KhPa38+hrx+xrpMtPEJRNasM=
Received: by 10.205.118.14 with SMTP id fo14mr52859044bkc.63.1322605409988;
	Tue, 29 Nov 2011 14:23:29 -0800 (PST)
Received: from localhost ([94.230.152.246]) by mx.google.com with ESMTPS id
	hw14sm27067463bkc.16.2011.11.29.14.23.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 29 Nov 2011 14:23:29 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Nov 2011 23:23:20 +0100
Message-Id: <1322605400-30257-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
References: <2752f234bc996b128d06ad63bf5ad36e00a3d3ea.1322549636.git.Martin.Jansa@gmail.com>
Subject: [PATCH] gconf: add polkit to DEPENDS only for target recipe and disable default-service for native
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
X-List-Received-Date: Tue, 29 Nov 2011 22:30:21 -0000

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



