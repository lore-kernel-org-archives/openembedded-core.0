Return-Path: <mihai.prica@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 941246BBAF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 15:00:18 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 27 Aug 2013 08:00:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,968,1367996400"; d="scan'208";a="287368582"
Received: from unknown (HELO mihai-Vostro-460.rb.intel.com) ([10.237.105.31])
	by AZSMGA002.ch.intel.com with ESMTP; 27 Aug 2013 08:00:18 -0700
From: Mihai Prica <mihai.prica@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2013 17:59:39 +0300
Message-Id: <9bf418feb08245ef4c197f456e8bb1aa557b8b68.1377613447.git.mihai.prica@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
In-Reply-To: <cover.1377613447.git.mihai.prica@intel.com>
References: <cover.1377613447.git.mihai.prica@intel.com>
Subject: [PATCH 5/5] midori: add version 0.5.5 from meta-oe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 27 Aug 2013 15:00:18 -0000

Midori is a lightweight web browser that uses the WebKit
rendering engine and the GTK interface. This allows a more
easy testing of the functionality of webkit-gtk component
that is already in oe-core.

Signed-off-by: Mihai Prica <mihai.prica@intel.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb |   43 ++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 meta/recipes-sato/midori/midori_0.5.5.bb

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
new file mode 100644
index 0000000..e545753
--- /dev/null
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -0,0 +1,43 @@
+DESCRIPTION = "Midori is a lightweight web browser."
+HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
+
+SRC_URI = "http://www.midori-browser.org/downloads/${PN}_${PV}_all_.tar.bz2 \
+"
+
+SRC_URI[md5sum] = "b99e87d4b73a4732ed1c1e591f0242ac"
+SRC_URI[sha256sum] = "ca69382a285222a86028abebd73fed1976735883027ff0adc094b627789bbd62"
+
+inherit gtk-icon-cache pkgconfig vala pythonnative
+
+do_configure() {
+    sed -i -e 's:, shell=False::g' -e s:/usr/X11R6/include::g -e s:/usr/X11R6/lib::g wscript
+    ./configure \
+            --prefix=${prefix} \
+            --bindir=${bindir} \
+            --sbindir=${sbindir} \
+            --libexecdir=${libexecdir} \
+            --datadir=${datadir} \
+            --sysconfdir=${sysconfdir} \
+            --sharedstatedir=${sharedstatedir} \
+            --localstatedir=${localstatedir} \
+            --libdir=${libdir} \
+            --includedir=${includedir} \
+            --infodir=${infodir} \
+            --mandir=${mandir} \
+            --disable-gtk3 \
+            --disable-zeitgeist \
+}
+
+PARALLEL_MAKE = ""
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_install() {
+    oe_runmake DESTDIR=${D} install
+}
+
+RRECOMMENDS_${PN} += "glib-networking ca-certificates gnome-icon-theme"
+
+FILES_${PN}-dev += "${datadir}/vala/vapi"
-- 
1.7.9.5


