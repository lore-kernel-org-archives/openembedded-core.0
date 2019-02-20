Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 79C697C420
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Feb 2019 07:12:50 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2019 23:12:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,388,1544515200"; d="scan'208";a="276403703"
Received: from anmitta2-mobl1.png.intel.com ([10.221.16.243])
	by orsmga004.jf.intel.com with ESMTP; 19 Feb 2019 23:12:50 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Feb 2019 15:12:47 +0800
Message-Id: <20190220071247.3758-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190220071247.3758-1-anuj.mittal@intel.com>
References: <20190220071247.3758-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] glib-networking: upgrade 2.54.1 -> 2.58.0
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
X-List-Received-Date: Wed, 20 Feb 2019 07:12:50 -0000

* Autotools support has been removed upstream, so migrate recipe to
meson. For changes, see:
https://gitlab.gnome.org/GNOME/glib-networking/blob/glib-2-58/NEWS

* Remove unsupported configure options: pkcs11, ca-certificates. See:
https://bugzilla.gnome.org/show_bug.cgi?id=793281
https://bugzilla.gnome.org/show_bug.cgi?id=753260

License-Update: Change to LGPLv2.1

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ng_2.54.1.bb => glib-networking_2.58.0.bb} | 26 ++++++++++---------
 1 file changed, 14 insertions(+), 12 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.54.1.bb => glib-networking_2.58.0.bb} (40%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
similarity index 40%
rename from meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
index 5d17a824f0..f3190e1cae 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.54.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.58.0.bb
@@ -3,27 +3,29 @@ DESCRIPTION = "glib-networking contains the implementations of certain GLib netw
 HOMEPAGE = "https://gitlab.gnome.org/GNOME/glib-networking/"
 BUGTRACKER = "http://bugzilla.gnome.org"
 
-LICENSE = "LGPLv2"
-LIC_FILES_CHKSUM = "file://COPYING;md5=5f30f0716dfdd0d91eb439ebec522ec2"
+LICENSE = "LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "99867463f182c2767bce0c74bc9cc981"
-SRC_URI[archive.sha256sum] = "eaa787b653015a0de31c928e9a17eb57b4ce23c8cf6f277afaec0d685335012f"
+SRC_URI[archive.md5sum] = "75b14b7e73a67753be9ce307751c661d"
+SRC_URI[archive.sha256sum] = "bdfa0255e031b8ee003cc283002536b77ee76450105f1dc6ab066b9bf4330068"
 
-PACKAGECONFIG ??= "ca-certificates gnutls"
+PACKAGECONFIG ??= "gnutls"
 
-# No explicit dependency as it works without ca-certificates installed
-PACKAGECONFIG[ca-certificates] = "--with-ca-certificates=${sysconfdir}/ssl/certs/ca-certificates.crt,--without-ca-certificates"
-PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
-PACKAGECONFIG[libproxy] = "--with-libproxy,--without-libproxy,libproxy"
-PACKAGECONFIG[pkcs11] = "--with-pkcs11,--without-pkcs11,p11-kit"
+PACKAGECONFIG[gnutls] = "-Dgnutls=true,-Dgnutls=false,gnutls"
+PACKAGECONFIG[libproxy] = "-Dlibproxy_support=true,-Dlibproxy_support=false,libproxy"
 
-EXTRA_OECONF = "--without-gnome-proxy"
+EXTRA_OEMESON = "-Dgnome_proxy_support=false"
 
+GNOMEBASEBUILDCLASS = "meson"
 inherit gnomebase gettext upstream-version-is-even gio-module-cache
 
-FILES_${PN} += "${libdir}/gio/modules/libgio*.so ${datadir}/dbus-1/services/"
+FILES_${PN} += "\
+                ${libdir}/gio/modules/libgio*.so \
+                ${datadir}/dbus-1/services/ \
+                ${systemd_user_unitdir} \
+                "
 FILES_${PN}-dev += "${libdir}/gio/modules/libgio*.la"
 FILES_${PN}-staticdev += "${libdir}/gio/modules/libgio*.a"
-- 
2.17.1


