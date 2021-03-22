Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.7183.1616377301187997965
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Mar 2021 18:41:52 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mdxJUA31UrH1ex5PNFJwU4PNiTk+bVLy5AABleOIcEtkKavmCj9kXvqkywRxMuPg7x6rnydGcw
 ZBiqD9SDJ7+Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190211607"
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="190211607"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:52 -0700
IronPort-SDR: Nm+RJvJfuA63klijJHZMUJ+qpJqlKZFkzsiaRaPSwNVzmYSbQL95mXuEI1TTejW90n7qpu7g/9
 hqq5YF0iTnAw==
X-IronPort-AV: E=Sophos;i="5.81,266,1610438400"; 
   d="scan'208";a="524295179"
Received: from myusoff-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.78.4])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2021 18:41:51 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 10/25] libsecret: Improve determimism
Date: Mon, 22 Mar 2021 09:41:12 +0800
Message-Id: <9c807afd997f0729fe3c90e81b2d8351ec980010.1616377115.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1616377115.git.anuj.mittal@intel.com>
References: <cover.1616377115.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 28175c44e7402397a24a00a4b056eef39b0a03fa)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../libsecret/libsecret/determinism.patch     | 37 +++++++++++++++++++
 .../libsecret/libsecret_0.20.3.bb             |  3 +-
 2 files changed, 39 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/libsecret/libsecret/determinism.patch

diff --git a/meta/recipes-gnome/libsecret/libsecret/determinism.patch b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
new file mode 100644
index 0000000000..ad96e8f59b
--- /dev/null
+++ b/meta/recipes-gnome/libsecret/libsecret/determinism.patch
@@ -0,0 +1,37 @@
+secret-enum-types.c/h.template: Fix reproducibility issue 
+
+When full filenames are used in generated sources it makes the resulting
+debug packages non-reproducible. Best practise is to use basename in
+comments instead.
+
+Signed-off-by: Richard Purdie richard.purdie@linuxfoundation.org
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/libsecret/-/merge_requests/68]
+
+Index: libsecret-0.20.4/libsecret/secret-enum-types.c.template
+===================================================================
+--- libsecret-0.20.4.orig/libsecret/secret-enum-types.c.template
++++ libsecret-0.20.4/libsecret/secret-enum-types.c.template
+@@ -23,8 +23,8 @@
+ /*** END file-header ***/
+ 
+ /*** BEGIN file-production ***/
+-#include "@filename@"
+-/* enumerations from "@filename@" */
++#include "@basename@"
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
+Index: libsecret-0.20.4/libsecret/secret-enum-types.h.template
+===================================================================
+--- libsecret-0.20.4.orig/libsecret/secret-enum-types.h.template
++++ libsecret-0.20.4/libsecret/secret-enum-types.h.template
+@@ -27,7 +27,7 @@ G_BEGIN_DECLS
+ 
+ /*** BEGIN file-production ***/
+ 
+-/* enumerations from "@filename@" */
++/* enumerations from "@basename@" */
+ /*** END file-production ***/
+ 
+ /*** BEGIN value-header ***/
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
index 533015a1e4..b72206535f 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.20.3.bb
@@ -13,7 +13,8 @@ inherit gnomebase gtk-doc vala gobject-introspection manpages
 
 DEPENDS += "glib-2.0 libgcrypt gettext-native"
 
-SRC_URI += "file://0001-meson-add-option-introspection.patch"
+SRC_URI += "file://0001-meson-add-option-introspection.patch \
+            file://determinism.patch"
 
 SRC_URI[archive.md5sum] = "47c3fdfeb111a87b509ad271e4a6f496"
 SRC_URI[archive.sha256sum] = "4fcb3c56f8ac4ab9c75b66901fb0104ec7f22aa9a012315a14c0d6dffa5290e4"
-- 
2.30.2

