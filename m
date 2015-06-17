Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4F438758D8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205524"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:57 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:29 +0300
Message-Id: <1434547172-24620-20-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 19/22] Add a recipe for epiphany
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:57 -0000

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


