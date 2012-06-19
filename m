Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Sh11S-00027q-Bn
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jun 2012 18:11:18 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 19 Jun 2012 09:00:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="155520347"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.123])
	by orsmga001.jf.intel.com with ESMTP; 19 Jun 2012 09:00:05 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jun 2012 08:59:41 -0700
Message-Id: <f1701238a3c52df25ecffa273c84ef843d572d1c.1340121099.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
In-Reply-To: <cover.1340121099.git.sgw@linux.intel.com>
References: <cover.1340121099.git.sgw@linux.intel.com>
Subject: [PATCH 23/39] gnome-keyring: clean up FILE after PACKAGE reorder
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
X-List-Received-Date: Tue, 19 Jun 2012 16:11:18 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb |   14 ++++++++++----
 1 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
index 1a5ee05..ad60094 100644
--- a/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
+++ b/meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
 
 SECTION = "x11/gnome"
 
-PR = "r6"
+PR = "r7"
 
 inherit autotools gnome pkgconfig
 
@@ -38,6 +38,12 @@ pkg_postinst_${PN} () {
 	test -x ${bindir}/glib-compile-schemas && glib-compile-schemas  ${datadir}/glib-2.0/schemas
 }
 
-FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr ${base_libdir}/security/*.so"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/standalone/.debug/ ${base_libdir}/security/*.la"
-FILES_${PN}-dbg += "${libdir}/gnome-keyring/devel/.debug/ ${base_libdir}/security/.debug"
+FILES_${PN} += "${datadir}/dbus-1/services ${datadir}/gcr"
+                
+
+FILES_${PN}-dev += "${libdir}/${BPN}/devel/*.la \
+                    ${libdir}/${BPN}/devel/*${SOLIBSDEV} \
+                    ${libdir}/${BPN}/standalone/*.la"
+
+FILES_${PN}-dbg += "${libdir}/${BPN}/standalone/.debug/ \
+                    ${libdir}/${BPN}/devel/.debug/"
-- 
1.7.7.6



