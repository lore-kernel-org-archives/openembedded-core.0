Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13411C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 15:34:50 +0000 (UTC)
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web12.45535.1635780864510944525
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Nov 2021 08:34:49 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="218228624"
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="218228624"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:48 -0700
X-IronPort-AV: E=Sophos;i="5.87,200,1631602800";
   d="scan'208";a="488694335"
Received: from aaronhpe-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.232.69])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 08:34:47 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 18/18] meta: bump HASHEQUIV_HASH_VERSION after RPM
 fix
Date: Mon,  1 Nov 2021 23:34:13 +0800
Message-Id: 
 <2c41e766219032dca953eb7c0b18e812a8d0b8f2.1635780638.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1635780638.git.anuj.mittal@intel.com>
References: <cover.1635780638.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Nov 2021 15:34:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157725

ef37fca2f4 fixes issues where PLATFORM tag in RPMs generated
n aarch and x86 hosts are different for noarch RPMs. But, we'd
still need to bump hashequiv version for allarch recipes
to avoid issues because of the RPMs that were incorrectly
generated so reproducibility tests don't fail. Also bump PR
to force rebuilds.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../hicolor-icon-theme/hicolor-icon-theme_0.17.bb            | 4 ++++
 meta/recipes-graphics/wayland/wayland-protocols_1.20.bb      | 4 ++++
 meta/recipes-graphics/xorg-font/encodings_1.0.5.bb           | 4 ++++
 .../wireless-regdb/wireless-regdb_2021.08.28.bb              | 4 ++++
 meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb     | 4 ++++
 meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb          | 4 ++++
 .../pulseaudio-sato/pulseaudio-client-conf-sato_1.bb         | 4 ++++
 meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb       | 5 ++++-
 meta/recipes-support/iso-codes/iso-codes_4.6.0.bb            | 4 ++++
 9 files changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
index 74e3430528..d70265ee50 100644
--- a/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
+++ b/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb
@@ -16,3 +16,7 @@ inherit allarch autotools
 FILES_${PN} += "${datadir}/icons"
 
 BBCLASSEXTEND = "native nativesdk"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb b/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
index 3fb78f658c..35a46dbb08 100644
--- a/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
+++ b/meta/recipes-graphics/wayland/wayland-protocols_1.20.bb
@@ -20,3 +20,7 @@ inherit allarch autotools pkgconfig
 
 PACKAGES = "${PN}"
 FILES_${PN} += "${datadir}/pkgconfig/wayland-protocols.pc"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
index 713fcfb935..02c8cff25d 100644
--- a/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
+++ b/meta/recipes-graphics/xorg-font/encodings_1.0.5.bb
@@ -23,3 +23,7 @@ EXTRA_OECONF += "--with-encodingsdir=${datadir}/fonts/X11/encodings"
 # postinst from .inc doesn't apply to this recipe
 pkg_postinst_${PN} () {
 }
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
index 376311804e..b1cad01a25 100644
--- a/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
+++ b/meta/recipes-kernel/wireless-regdb/wireless-regdb_2021.08.28.bb
@@ -41,3 +41,7 @@ do_install_append_class-native() {
 RSUGGESTS_${PN} = "crda"
 
 BBCLASSEXTEND = "native"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
index 26542fbbbc..0d4a30a304 100644
--- a/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-topology-conf_1.2.4.bb
@@ -20,3 +20,7 @@ do_install() {
 PACKAGES = "${PN}"
 
 FILES_${PN} = "*"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
index 32cf41c8fd..7787dad268 100644
--- a/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
+++ b/meta/recipes-multimedia/alsa/alsa-ucm-conf_1.2.4.bb
@@ -21,3 +21,7 @@ do_install() {
 PACKAGES = "${PN}"
 
 FILES_${PN} = "*"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
index e27339fb46..cfba2074f4 100644
--- a/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
+++ b/meta/recipes-sato/pulseaudio-sato/pulseaudio-client-conf-sato_1.bb
@@ -15,3 +15,7 @@ do_install() {
 
 FILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
 CONFFILES_${PN} = "${sysconfdir}/pulse/client.conf.d/50-sato.conf"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
index 28d5096023..08d3c3fe19 100644
--- a/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
+++ b/meta/recipes-sato/shutdown-desktop/shutdown-desktop.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384
 
 SRC_URI = "file://shutdown.desktop"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}"
 
@@ -22,3 +22,6 @@ pkg_postinst_${PN} () {
 }
 
 inherit allarch
+
+# remove at next version upgrade or when output changes
+HASHEQUIV_HASH_VERSION .= ".1"
diff --git a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
index f915716ce7..cd27fb0b70 100644
--- a/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_4.6.0.bb
@@ -20,3 +20,7 @@ S = "${WORKDIR}/git"
 inherit allarch autotools
 
 FILES_${PN} += "${datadir}/xml/"
+
+# remove at next version upgrade or when output changes
+PR = "r1"
+HASHEQUIV_HASH_VERSION .= ".1"
-- 
2.31.1


