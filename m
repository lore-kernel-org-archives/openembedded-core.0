Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RTPlv-0004up-6i
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Nov 2011 04:14:47 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAO38EKU024754
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2011 19:08:14 -0800 (PST)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 23 Nov 2011 19:08:13 -0800
Message-ID: <a79efe4b5d981c64a4d394af91c7f50298740adb.1322102636.git.xiaofeng.yan@windriver.com>
In-Reply-To: <cover.1322102636.git.xiaofeng.yan@windriver.com>
References: <cover.1322102636.git.xiaofeng.yan@windriver.com>
Old-Date: Wed, 23 Nov 2011 13:26:15 +0800
Date: Thu, 24 Nov 2011 11:06:12 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/9] gconf: Disable dbus-x11 when x11 isn't in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 24 Nov 2011 03:14:47 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

If x11 isn't in DISTRO_FEATURES, then an error information "no providers ..." will \
arise. I modified this bb file to disable "dbus-x11" when no x11 in DISTRO_FEATURES.

[YOCTO #1674]

Signed-off-by: Xiaofeng Yan <xiaofeng.yan@windriver.com>
---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.3.bb b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
index 3d3e65f..98c23b2 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.3.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.3.bb
@@ -1,8 +1,11 @@
 DESCRIPTION = "GNOME configuration system"
 SECTION = "x11/gnome"
 LICENSE = "LGPLv2+"
+PR = "r1"
+
 LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 
+
 DEPENDS = "glib-2.0 dbus dbus-glib libxml2 intltool-native"
 
 inherit gnomebase
@@ -30,7 +33,9 @@ do_install_append() {
 	rm ${D}${libdir}/gio/*/*.*a
 }
 
-RDEPENDS_${PN} += "dbus-x11"
+# disable dbus-x11 when x11 isn't in DISTRO_FEATURES
+RDEPENDS_${PN} += "${@base_contains('DISTRO_FEATURES', 'x11', 'dbus-x11', '', d)}"
+
 FILES_${PN} += "${libdir}/GConf/* \
 	        ${libdir}/gio/*/*.so \
 		${datadir}/polkit* \
-- 
1.7.0.4



