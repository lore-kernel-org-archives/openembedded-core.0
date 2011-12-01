Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RW5Rq-0003tx-9g
	for openembedded-core@lists.openembedded.org;
	Thu, 01 Dec 2011 13:09:06 +0100
Received: by eekc1 with SMTP id c1so1174385eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 04:02:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=xBc2aG8d0PSjGfib2rlPnnfCcdVcpvMYQf1LTHqy2IM=;
	b=TihT283S4Oaw1RTFY8UujhgkyRqcOhSH0FjmlJbXl//PFLhqpFJpZs79PVPp+i81aS
	8sX64/meZYQ6Iz6Ob1HL+tAE9wX8WmcKToOo5C2/PEBBPcP1k62ViaKmutkZdqDrgChn
	UssqnZ1fOJW5I0f9KKj2eI2UQL7T4nKXa5N18=
Received: by 10.14.11.10 with SMTP id 10mr913979eew.112.1322740944794;
	Thu, 01 Dec 2011 04:02:24 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id x12sm16839483eef.9.2011.12.01.04.02.23
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 04:02:24 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  1 Dec 2011 13:02:07 +0100
Message-Id: <fe59e59bef7a0735537197b5cdd94274466295ce.1322740824.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc4
In-Reply-To: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
References: <9f1d39eb3edbde086f99f084c2e88d5e9fc21332.1322740824.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1322740824.git.Martin.Jansa@gmail.com>
References: <cover.1322740824.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 2/4] gconf: add polkit to DEPENDS only for target recipe and disable default-service for native
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
X-List-Received-Date: Thu, 01 Dec 2011 12:09:06 -0000

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



