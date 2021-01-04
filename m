Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web11.11864.1609757083088116423
 for <openembedded-core@lists.openembedded.org>;
 Mon, 04 Jan 2021 02:44:43 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: chee.yang.lee@intel.com)
IronPort-SDR: sone4NyyWu9QLf6MaYIRFx1hLn4srx0nZmPMa/ACMiPNE7mMUD/bfgggA2LkESxQKmGlcaHRm0
 FpHnzma9x7wg==
X-IronPort-AV: E=McAfee;i="6000,8403,9853"; a="173429156"
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="173429156"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2021 02:44:42 -0800
IronPort-SDR: kAE9vh79hkUzAPIMOqMqka8cdsuDl3COvQh3L0UC+X3Kv+6qq50IfxjnBchUWtxubXVRoTjtT3
 rU0It14UPYHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,473,1599548400"; 
   d="scan'208";a="345861480"
Received: from unknown (HELO guest1-ubuntu1804.png.intel.com) ([10.221.183.51])
  by orsmga003.jf.intel.com with ESMTP; 04 Jan 2021 02:44:41 -0800
From: "Lee Chee Yang" <chee.yang.lee@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] p11-kit: upgrade 0.23.21 -> 0.23.22
Date: Mon,  4 Jan 2021 18:44:40 +0800
Message-Id: <20210104104440.72633-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.17.1

From: Lee Chee Yang <chee.yang.lee@intel.com>

https://github.com/p11-glue/p11-kit/releases/tag/0.23.22

Release notes:
Fix memory-safety issues that affect the RPC protocol (CVE-2020-29361, CVE-2020-29362, and CVE-2020-29363), discovered and fixed by David Cook
anchor: Prefer persistent format when storing anchor [#329]
common: Fix infloop in p11_path_build [#326, #327]
proxy: C_CloseAllSessions: Make sure that calloc args are non-zero [#325]
common: Check for a NULL locale before freeing it [#321]
Build and test fixes [#313, #315, #317, #318, #319, #323, #330, #333, #334, #335, #338, #339]

https://github.com/p11-glue/p11-kit/commit/c4e75e10021ce86ab42682ea4936dce94ced2f77
patch to fix trailing newline using custom_target() caused error
with DISTRO_FEATURES api-documentation due to meson bugs, enable
manpages PACKAGECONFIG should prevent this error.
| warning: failed to load external entity "../version.xml"
| ../p11-kit-docs.xml:11: parser error : Failure to process entity version
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| ../p11-kit-docs.xml:11: parser error : Entity 'version' not defined
| 		<releaseinfo>for p11-kit &version;</releaseinfo>
| 		                                  ^
| unable to parse ../p11-kit-docs.xml

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb}     | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.21.bb => p11-kit_0.23.22.bb} (76%)

diff --git a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
similarity index 76%
rename from meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
rename to meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
index b1fd2334b2..173a30a5e6 100644
--- a/meta/recipes-support/p11-kit/p11-kit_0.23.21.bb
+++ b/meta/recipes-support/p11-kit/p11-kit_0.23.22.bb
@@ -2,17 +2,18 @@ SUMMARY = "Provides a way to load and enumerate PKCS#11 modules"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=02933887f609807fbb57aa4237d14a50"
 
-inherit meson gettext pkgconfig gtk-doc bash-completion
+inherit meson gettext pkgconfig gtk-doc bash-completion manpages
 
 DEPENDS = "libtasn1 libtasn1-native libffi"
 
 DEPENDS_append = "${@' glib-2.0' if d.getVar('GTKDOC_ENABLED') == 'True' else ''}"
 
-SRC_URI = "git://github.com/p11-glue/p11-kit"
-SRCREV = "fd8b56f3ee971f94dc6fc95411fc01e1c12153ab"
+SRC_URI = "git://github.com/p11-glue/p11-kit;branch=0.23"
+SRCREV = "bd97afbfe28d5fbbde95ce36ff7a8834fc0291ee"
 S = "${WORKDIR}/git"
 
 PACKAGECONFIG ??= ""
+PACKAGECONFIG[manpages] = "-Dman=true,-Dman=false"
 PACKAGECONFIG[trust-paths] = "-Dtrust_paths=/etc/ssl/certs/ca-certificates.crt,,,ca-certificates"
 
 GTKDOC_MESON_OPTION = 'gtk_doc'
-- 
2.17.1

