Return-Path: <jussi.kukkonen@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6E40573195
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2017 09:41:21 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Feb 2017 01:41:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,160,1484035200"; d="scan'208";a="65549124"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 14 Feb 2017 01:41:22 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id D628C6A4080;
	Tue, 14 Feb 2017 01:40:19 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Feb 2017 11:41:16 +0200
Message-Id: <1487065276-26271-1-git-send-email-jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] vte: Upgrade 0.44.2 -> 0.46.1
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
X-List-Received-Date: Tue, 14 Feb 2017 09:41:22 -0000

New release requires libpcre 2.

Enable gnutls by default to remove an annoying warning on every
vte widget. core-image-sato already has gnutls so this shouldn't
be a big deal.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---

This depends on "libpcre2: add it for newer vte" patch
(thanks Robert!)

Cheers,
 Jussi

 meta/recipes-support/vte/{vte_0.44.2.bb => vte_0.46.1.bb} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-support/vte/{vte_0.44.2.bb => vte_0.46.1.bb} (86%)

diff --git a/meta/recipes-support/vte/vte_0.44.2.bb b/meta/recipes-support/vte/vte_0.46.1.bb
similarity index 86%
rename from meta/recipes-support/vte/vte_0.44.2.bb
rename to meta/recipes-support/vte/vte_0.46.1.bb
index 8cddc98..0afe625 100644
--- a/meta/recipes-support/vte/vte_0.44.2.bb
+++ b/meta/recipes-support/vte/vte_0.46.1.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Virtual terminal emulator GTK+ widget library"
 BUGTRACKER = "https://bugzilla.gnome.org/buglist.cgi?product=vte"
 LICENSE = "LGPLv2.1+"
-DEPENDS = "glib-2.0 gtk+3 intltool-native libxml2-native"
+DEPENDS = "glib-2.0 gtk+3 libpcre2 intltool-native libxml2-native"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
@@ -11,8 +11,8 @@ inherit gnomebase gtk-doc distro_features_check upstream-version-is-even gobject
 SRC_URI += "file://0001-Don-t-enable-stack-protection-by-default.patch \
             ${@bb.utils.contains('PACKAGECONFIG', 'vala', '', 'file://0001-Add-m4-vapigen.m4.patch', d) } \
             "
-SRC_URI[archive.md5sum] = "eca8f8a9d9f9bb8e9d592d0acfeec015"
-SRC_URI[archive.sha256sum] = "a1ea594814bb136a3a9a6c7656b46240571f6a198825c1111007fe99194b0949"
+SRC_URI[archive.md5sum] = "e8f4393b9f1ec2e2f3cdb3fd4f5a16de"
+SRC_URI[archive.sha256sum] = "8800cf8bc259704a12ad1853fb0eb43bfe3857af15242e6fb9f2c3fd95b3f5c6"
 
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
@@ -27,7 +27,7 @@ export XDG_DATA_DIRS = "${STAGING_DATADIR}"
 # Package additional files
 FILES_${PN}-dev += "${datadir}/vala/vapi/*"
 
-PACKAGECONFIG ??= ""
+PACKAGECONFIG ??= "gnutls"
 PACKAGECONFIG[vala] = "--enable-vala,--disable-vala,vala-native vala"
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 
-- 
2.1.4


