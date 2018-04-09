Return-Path: <maxin.john@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 90FED745B8
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 11:29:15 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 Apr 2018 04:29:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,427,1517904000"; d="scan'208";a="30681640"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga007.fm.intel.com with ESMTP; 09 Apr 2018 04:29:16 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 58C495803B6
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 04:29:15 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Apr 2018 14:29:37 +0300
Message-Id: <1523273377-15643-3-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
References: <1523273377-15643-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH v2 2/2] atk: upgrade to version 2.28.1
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
X-List-Received-Date: Mon, 09 Apr 2018 11:29:15 -0000

convert to meson build and provide flags for introspection and
documentation.

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-support/atk/atk_2.26.1.bb | 19 -------------------
 meta/recipes-support/atk/atk_2.28.1.bb | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 19 deletions(-)
 delete mode 100644 meta/recipes-support/atk/atk_2.26.1.bb
 create mode 100644 meta/recipes-support/atk/atk_2.28.1.bb

diff --git a/meta/recipes-support/atk/atk_2.26.1.bb b/meta/recipes-support/atk/atk_2.26.1.bb
deleted file mode 100644
index 685b599..0000000
--- a/meta/recipes-support/atk/atk_2.26.1.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-SUMMARY = "Accessibility toolkit for GNOME"
-HOMEPAGE = "http://live.gnome.org/GAP/"
-BUGTRACKER = "https://bugzilla.gnome.org/"
-SECTION = "x11/libs"
-
-LICENSE = "GPLv2+ & LGPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
-                    file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
-                    file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
-
-DEPENDS = "glib-2.0"
-
-inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
-
-SRC_URI[archive.md5sum] = "7cddcc313b9a3efd19b2ddf079ba68f5"
-SRC_URI[archive.sha256sum] = "ef00ff6b83851dddc8db38b4d9faeffb99572ba150b0664ee02e46f015ea97cb"
-
-BBCLASSEXTEND = "native"
-
diff --git a/meta/recipes-support/atk/atk_2.28.1.bb b/meta/recipes-support/atk/atk_2.28.1.bb
new file mode 100644
index 0000000..b233446
--- /dev/null
+++ b/meta/recipes-support/atk/atk_2.28.1.bb
@@ -0,0 +1,32 @@
+SUMMARY = "Accessibility toolkit for GNOME"
+HOMEPAGE = "http://live.gnome.org/GAP/"
+BUGTRACKER = "https://bugzilla.gnome.org/"
+SECTION = "x11/libs"
+
+LICENSE = "GPLv2+ & LGPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3bf50002aefd002f49e7bb854063f7e7 \
+                    file://atk/atkutil.c;endline=18;md5=6fd31cd2fdc9b30f619ca8d819bc12d3 \
+                    file://atk/atk.h;endline=18;md5=fcd7710187e0eae485e356c30d1b0c3b"
+
+DEPENDS = "glib-2.0"
+
+GNOMEBASEBUILDCLASS = "meson"
+inherit gnomebase gtk-doc gettext upstream-version-is-even gobject-introspection
+
+GTKDOC_ENABLE_FLAG = "-Denable_docs=true"
+GTKDOC_DISABLE_FLAG = "-Denable_docs=false"
+
+GI_ENABLE_FLAG = "-Ddisable_introspection=false"
+GI_DISABLE_FLAG = "-Ddisable_introspection=true"
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GI_DATA_ENABLED', 'True', '${GI_ENABLE_FLAG}', \
+                                                                                       '${GI_DISABLE_FLAG}', d)} "
+
+EXTRA_OEMESON_append_class-target = " ${@bb.utils.contains('GTKDOC_ENABLED', 'True', '${GTKDOC_ENABLE_FLAG}', \
+                                                                                     '${GTKDOC_DISABLE_FLAG}', d)} "
+
+SRC_URI[archive.md5sum] = "dfb5e7474220afa3f4ca7e45af9f3a11"
+SRC_URI[archive.sha256sum] = "cd3a1ea6ecc268a2497f0cd018e970860de24a6d42086919d6bf6c8e8d53f4fc"
+
+BBCLASSEXTEND = "native"
+
-- 
2.4.0


