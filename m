Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 57268758D7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:36:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 18 Jun 2015 05:36:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="745804262"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jun 2015 05:36:12 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:57 +0300
Message-Id: <8b22ca0452b35c75002b9295fa47ef27cf887fef.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
References: <6ef0af09f1d738f8f447f286ccefb0b74c4511de.1434630758.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
References: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
Subject: [PATCHv2 19/21] epiphany: add a recipe from meta-gnome
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
X-List-Received-Date: Thu, 18 Jun 2015 12:36:12 -0000

Epiphany is replacing midori as the browser in oe-core recipe set
and poky distribution.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/recipes-gnome/epiphany/epiphany_3.16.1.bb | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)
 create mode 100644 meta/recipes-gnome/epiphany/epiphany_3.16.1.bb

diff --git a/meta/recipes-gnome/epiphany/epiphany_3.16.1.bb b/meta/recipes-gnome/epiphany/epiphany_3.16.1.bb
new file mode 100644
index 0000000..3f45706
--- /dev/null
+++ b/meta/recipes-gnome/epiphany/epiphany_3.16.1.bb
@@ -0,0 +1,23 @@
+SUMMARY = "WebKit based web browser for GNOME"
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
+
+DEPENDS = "libsoup-2.4 webkitgtk gtk+3 iso-codes ca-certificates avahi libnotify gcr libwnck3 \
+	   gsettings-desktop-schemas gnome-desktop3"
+
+inherit gnomebase gsettings
+SRC_URI[archive.md5sum] = "bf03453eac5701049c4ec82e1b0c8532"
+SRC_URI[archive.sha256sum] = "4e59a13c299d1ce726871958e1925b42f93d8c73bf1bb0decf79749be00e9666"
+
+EXTRA_OECONF += " --disable-nss --with-distributor-name=${DISTRO}"
+
+do_configure_prepend() {
+    touch ${S}/gnome-doc-utils.make
+    sed -i -e s:help::g ${S}/Makefile.am
+}
+
+FILES_${PN} += "${datadir}/appdata ${datadir}/dbus-1 ${datadir}/gnome-shell/search-providers"
+FILES_${PN}-dbg += "${libdir}/${PN}/*/web-extensions/.debug/libephywebextension.so"
+RDEPENDS_${PN} = "iso-codes"
+RRECOMMENDS_${PN} = "ca-certificates"
+
-- 
2.1.4


