Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 0F51B6010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 09:33:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Aug 2018 02:33:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,311,1531810800"; d="scan'208";a="253432357"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 31 Aug 2018 02:33:41 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id D96C05802AD
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2018 02:33:40 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 Aug 2018 12:35:52 +0300
Message-Id: <1535708152-25053-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] glib-networking: upgrade to version 2.56.1
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
X-List-Received-Date: Fri, 31 Aug 2018 09:33:46 -0000

Update the recipe to use meson since project moved to meson build system.

License-Update: Updated license from LGPLv2 to LGPL-2.1

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../glib-networking/glib-networking_2.54.1.bb      | 29 ----------------------
 .../glib-networking/glib-networking_2.56.1.bb      | 29 ++++++++++++++++++++++
 2 files changed, 29 insertions(+), 29 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
 create mode 100644 meta/recipes-core/glib-networking/glib-networking_2.56.1.bb

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
deleted file mode 100644
index 2a6f8af..0000000
--- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-SUMMARY = "GLib networking extensions"
-DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
-HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
-BUGTRACKER = "http://bugzilla.gnome.org"
-
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
-
-SECTION = "libs"
-DEPENDS = "glib-2.0"
-
-SRC_URI[archive.md5sum] = "99867463f182c2767bce0c74bc9cc981"
-SRC_URI[archive.sha256sum] = "eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f"
-
-PACKAGECONFIG ??= "ca-certificates gnutls"
-
-# No explicit dependency as it works without ca-certificates installed
-PACKAGECONFIG[ca-certificates] = "--with-ca-certificates=${sysconfdir}/ssl/certs/ca-certificates.crt,--without-ca-certificates"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
-PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
-
-EXTRA_OECONF = "--without-gnome-proxy"
-
-inherit gnomebase gettext upstream-version-is-even gio-module-cache
-
-FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
-FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
-FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.56.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.56.1.bb
new file mode 100644
index 0000000..862053a
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking_2.56.1.bb
@@ -0,0 +1,29 @@
+SUMMARY = "GLib networking extensions"
+DESCRIPTION = "glib-networking contains the implementations of certain GLib networking features that cannot be implemented directly in GLib itself because of their dependencies."
+HOMEPAGE = "http://git.gnome.org/browse/glib-networking/"
+BUGTRACKER = "http://bugzilla.gnome.org"
+
+LICENSE = "LGPL-2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SECTION = "libs"
+DEPENDS = "glib-2.0 gnutls"
+
+SRC_URI[archive.md5sum] = "456572f1e8fea32ef747541d64508a8e"
+SRC_URI[archive.sha256sum] = "df47b0e0a037d2dcf6b1846cbdf68dd4b3cc055e026bb40c4a55f19f29f635c8"
+
+PACKAGECONFIG ??= "ca-certificates"
+
+# No explicit dependency as it works without ca-certificates installed
+PACKAGECONFIG[ca-certificates] = "-Dca_certificates_path=${sysconfdir}/ssl/certs/ca-certificates.crt,"
+PACKAGECONFIG[libproxy] = "-Dlibproxy_support=true,-Dlibproxy_support=false,libproxy"
+PACKAGECONFIG[pkcs11] = "-Dpkcs11_support=true,-Dpkcs11_support=false,p11-kit"
+
+EXTRA_OEMESON = "-Dgnome_proxy_support=false"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gettext upstream-version-is-even gio-module-cache
+
+FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
+FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
+FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
-- 
2.4.0


