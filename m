Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E60B9759E6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga103.fm.intel.com with ESMTP; 17 Jun 2015 06:19:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205510"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:55 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:27 +0300
Message-Id: <1434547172-24620-18-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
Subject: [PATCH 17/22] Add a warning suppression patch to glib
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

Otherwise QA check will fail.
Some schemas in gsettings-desktop-schemas (such as proxy and locale)
are still using deprecated paths, as of 3.16.1. This causes warning
messages, and meta/lib/oe/rootfs.py complaints about them.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...warning-about-deprecated-paths-in-schemas.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb      |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
new file mode 100644
index 0000000..54e830c
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
@@ -0,0 +1,32 @@
+From 41534253b6b61ed4769eb6a3966698a50ee73b71 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Fri, 12 Jun 2015 17:08:46 +0300
+Subject: [PATCH] Remove the warning about deprecated paths in schemas
+
+Some schemas in gsettings-desktop-schemas (such as proxy and locale)
+are still using deprecated paths, as of 3.16.1. This causes warning
+messages, and meta/lib/oe/rootfs.py complaints about them.
+---
+ gio/glib-compile-schemas.c | 6 ------
+ 1 file changed, 6 deletions(-)
+
+diff --git a/gio/glib-compile-schemas.c b/gio/glib-compile-schemas.c
+index e42949b..ec79d7c 100644
+--- a/gio/glib-compile-schemas.c
++++ b/gio/glib-compile-schemas.c
+@@ -1202,12 +1202,6 @@ parse_state_start_schema (ParseState  *state,
+       return;
+     }
+ 
+-  if (path && (g_str_has_prefix (path, "/apps/") ||
+-               g_str_has_prefix (path, "/desktop/") ||
+-               g_str_has_prefix (path, "/system/")))
+-    g_printerr ("warning: Schema '%s' has path '%s'.  Paths starting with "
+-                "'/apps/', '/desktop/' or '/system/' are deprecated.\n", id, path);
+-
+   state->schema_state = schema_state_new (path, gettext_domain,
+                                           extends, extends_name, list_of);
+ 
+-- 
+2.1.4
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
index 8eaccfb..1e3d36a 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb
@@ -14,6 +14,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://uclibc.patch \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
            file://allow-run-media-sdX-drive-mount-if-username-root.patch \
+	   file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
2.1.4


