Received: from mga09.intel.com (mga09.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7839.1614918154051973024
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Mar 2021 20:22:47 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: TzpwOS9AY4TV6OAfEwj4llNnXpM1g1uDiEN/8O1AOQpCW8s27AEbgwvBmimbBsKu2G1IwKyzxb
 kS6Aib+l624Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9913"; a="187671139"
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="187671139"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:47 -0800
IronPort-SDR: 9LLCREna8+7pBca7TCxp3VhqiqwVBo1mg/jR1gJIBWwnEamjbowTa5ibHVukgZRHACBtmkDZ2c
 xLXocTo80BdA==
X-IronPort-AV: E=Sophos;i="5.81,224,1610438400"; 
   d="scan'208";a="408129031"
Received: from selvan2x-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.249])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2021 20:22:46 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 36/52] gcr: Fix reproducibility issue
Date: Fri,  5 Mar 2021 12:21:12 +0800
Message-Id: <4afaa08a739e1eef9762bbc527505bda332258ae.1614917620.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1614917620.git.anuj.mittal@intel.com>
References: <cover.1614917620.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b53133572de9e5bdf77dd44831a86ec34bf41b2c)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-gnome/gcr/gcr_3.36.0.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/meta/recipes-gnome/gcr/gcr_3.36.0.bb b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
index ff455a68ec..567ca8b774 100644
--- a/meta/recipes-gnome/gcr/gcr_3.36.0.bb
+++ b/meta/recipes-gnome/gcr/gcr_3.36.0.bb
@@ -11,6 +11,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=55ca817ccb7d5b5b66355690e9abc605"
 DEPENDS = "gtk+3 p11-kit glib-2.0 libgcrypt gnupg-native \
            ${@bb.utils.contains('GI_DATA_ENABLED', 'True', 'libxslt-native', '', d)}"
 
+CACHED_CONFIGUREVARS += "ac_cv_path_GPG='gpg2'"
+
 GNOMEBASEBUILDCLASS = "meson"
 GTKDOC_MESON_OPTION = "gtk_doc"
 inherit gnomebase gtk-icon-cache gtk-doc features_check upstream-version-is-even vala gobject-introspection gettext mime mime-xdg
@@ -32,3 +34,11 @@ FILES_${PN} += " \
 ARM_INSTRUCTION_SET_armv4 = "arm"
 ARM_INSTRUCTION_SET_armv5 = "arm"
 ARM_INSTRUCTION_SET_armv6 = "arm"
+
+EXTRA_OEMESON += "--cross-file ${WORKDIR}/meson-${PN}.cross"
+do_write_config_append() {
+    cat >${WORKDIR}/meson-${PN}.cross <<EOF
+[binaries]
+gpg2 = '${bindir}/gpg2'
+EOF
+}
-- 
2.29.2

