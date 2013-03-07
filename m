Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UDd1x-0001eO-Jz
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Mar 2013 16:46:53 +0100
Received: by mail-ee0-f47.google.com with SMTP id e52so420790eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2013 07:30:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=LYJ74zzZiYLQt1FeuCx0r7Fk62ngcSj4IaaHzoYGvwo=;
	b=C8plV8lX1qr6i60DI0Gea9WspKgSsraW9HIeJHLEMVP2y5LBoogavgSSatb8KQal00
	MbdpINf+agnd9qIiCji5MhIvmCtYpjSrKbVxmSAxAQ48QDZXsdE4rEZNWfNLz/wYYnR6
	iMi1z5DEmZ4SuCOT1zLXLTUFjBHAf95IBiDhS9wizuEEQ+r+FM0Iz8fDaQamNrB3/lxx
	a7hmnfr6qkM/hZJ+IV+SIVTO6eOMyEO12ghH7ejapeFCy23/0fHJypzwQ1h4JH+JpKhR
	hYdLmvquQwonYGtNTRwfZlrUZ1oEWqom/qOJEGuMlsUNuyi4j98rWWkIBrJ1agHaMiAL
	KgPw==
X-Received: by 10.194.110.69 with SMTP id hy5mr55459339wjb.1.1362670217517;
	Thu, 07 Mar 2013 07:30:17 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id o8sm33808022wix.7.2013.03.07.07.30.15
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 07 Mar 2013 07:30:16 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Mar 2013 15:27:49 +0000
Message-Id: <1362670069-7129-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnp5qD4b8//4QI8AJ8StQNIgaWOQWlSS3LN7HMCqsat4ZFv2ALVw3x/EUH9vWCzv1+puc6v
Subject: [PATCH] gconf: make polkit an option, and disable by default
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
X-List-Received-Date: Thu, 07 Mar 2013 15:46:54 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb |   19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
index a37bd00..a245fa2 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -3,10 +3,7 @@ SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
-POLKIT = "polkit"
-POLKIT_libc-uclibc = ""
-
-DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native ${POLKIT} gobject-introspection-stub"
+DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native gobject-introspection-stub"
 DEPENDS_class-native = "glib-2.0-native dbus-native dbus-glib-native libxml2-native intltool-native gnome-common-native gobject-introspection-stub-native"
 
 PR = "r0"
@@ -22,12 +19,16 @@ SRC_URI[archive.sha256sum] = "1912b91803ab09a5eed34d364bf09fe3a2a9c96751fde03a4e
 
 S = "${WORKDIR}/GConf-${PV}"
 
-POLKIT_OECONF = "--enable-defaults-service"
-POLKIT_OECONF_class-native = "--disable-defaults-service"
-POLKIT_OECONF_libc-uclibc = "--disable-default-service"
-
 EXTRA_OECONF = "--enable-shared --disable-static --enable-debug=yes \
-                --disable-introspection --disable-orbit --with-openldap=no ${POLKIT_OECONF} --disable-gtk"
+                --disable-introspection --disable-orbit --with-openldap=no --disable-gtk"
+
+# Disable PolicyKit by default
+PACKAGECONFIG ??= ""
+# We really don't want PolicyKit for native or uclibc
+PACKAGECONFIG_class-native = ""
+PACKAGECONFIG_libc-uclibc = ""
+
+PACKAGECONFIG[policykit] = "--enable-defaults-service,--disable-defaults-service,polkit"
 
 do_install_append() {
 	# this directory need to be created to avoid an Error 256 at gdm launch
-- 
1.7.10.4



