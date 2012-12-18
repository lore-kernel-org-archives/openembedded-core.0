Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1Tkvu0-0006aP-N6
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 13:04:04 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 Dec 2012 03:47:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,308,1355126400"; d="scan'208";a="258889693"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by orsmga002.jf.intel.com with ESMTP; 18 Dec 2012 03:48:22 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 13:48:46 +0200
Message-Id: <df9415f8e85e066e6adc1fceec7b11ba7cdeca09.1355830852.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1355830852.git.constantinx.musca@intel.com>
References: <cover.1355830852.git.constantinx.musca@intel.com>
Subject: [PATCH v2 6/7] polkit: fix multilib packaging issue
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
X-List-Received-Date: Tue, 18 Dec 2012 12:04:04 -0000

- use BPN instead of PN (PN includes MLPREFIX)
- fix the following warning:
WARNING: QA Issue: lib32-polkit: Files/directories were installed but not shipped
  /usr/share/polkit-1
  /usr/share/polkit-1/actions
  /usr/share/polkit-1/actions/org.freedesktop.policykit.policy
  /usr/share/polkit-1/actions/org.freedesktop.policykit.examples.pkexec.policy
  /usr/lib/polkit-1
  /usr/lib/polkit-1/extensions
  /usr/lib/polkit-1/extensions/libnullbackend.so
  /usr/lib/polkit-1/extensions/libnullbackend.a
  /usr/lib/polkit-1/extensions/libnullbackend.la
  /usr/lib/polkit-1/extensions/.debug
  /usr/lib/polkit-1/extensions/.debug/libnullbackend.so

[YOCTO #3438]

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/recipes-extended/polkit/polkit_0.104.bb | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-extended/polkit/polkit_0.104.bb b/meta/recipes-extended/polkit/polkit_0.104.bb
index 67c375a..74b5379 100644
--- a/meta/recipes-extended/polkit/polkit_0.104.bb
+++ b/meta/recipes-extended/polkit/polkit_0.104.bb
@@ -10,7 +10,7 @@ DEPENDS = "expat glib-2.0 intltool-native gobject-introspection-stub"
 PACKAGECONFIG = "${@base_contains('DISTRO_FEATURES', 'pam', 'pam', '', d)}"
 PACKAGECONFIG[pam] = "--with-authfw=pam,--with-authfw=shadow,libpam,libpam"
 
-PR = "r7"
+PR = "r8"
 
 PAM_SRC_URI = "file://polkit-1_pam.patch"
 SRC_URI = "http://hal.freedesktop.org/releases/polkit-${PV}.tar.gz \
@@ -27,12 +27,12 @@ EXTRA_OECONF = "--with-os-type=moblin --disable-man-pages --disable-introspectio
 inherit autotools gtk-doc pkgconfig
 
 do_install_append() {
-	rm -f ${D}${libdir}/${PN}-1/extensions/*.a
+	rm -f ${D}${libdir}/${BPN}-1/extensions/*.a
 }
 
-FILES_${PN} += "${libdir}/${PN}-1/extensions/*.so \
-                ${datadir}/${PN}-1/actions/* \
+FILES_${PN} += "${libdir}/${BPN}-1/extensions/*.so \
+                ${datadir}/${BPN}-1/actions/* \
                 ${datadir}/dbus-1/system-services/*"
-FILES_${PN}-dbg += "${libdir}/${PN}-1/extensions/.debug/*.so"
-FILES_${PN}-dev += "${libdir}/${PN}-1/extensions/*.la "
+FILES_${PN}-dbg += "${libdir}/${BPN}-1/extensions/.debug/*.so"
+FILES_${PN}-dev += "${libdir}/${BPN}-1/extensions/*.la "
 
-- 
1.7.11.7



