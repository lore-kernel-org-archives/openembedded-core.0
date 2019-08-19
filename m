Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3FDAA7F282
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Aug 2019 13:47:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Aug 2019 06:47:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,405,1559545200"; d="scan'208";a="168755309"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga007.jf.intel.com with ESMTP; 19 Aug 2019 06:47:17 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Aug 2019 21:47:10 +0800
Message-Id: <1566222430-20029-3-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1566222430-20029-1-git-send-email-anuj.mittal@intel.com>
References: <1566222430-20029-1-git-send-email-anuj.mittal@intel.com>
Subject: [warrior][PATCH 3/3] glib-2.0: fix CVE-2019-13012
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
X-List-Received-Date: Mon, 19 Aug 2019 13:47:17 -0000

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../glib-2.0/glib-2.0/CVE-2019-13012.patch         | 40 ++++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb      |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
new file mode 100644
index 0000000..c882cba
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/CVE-2019-13012.patch
@@ -0,0 +1,40 @@
+From 9fd6b4b21891adc318784f6a141f40d767b0d73c Mon Sep 17 00:00:00 2001
+From: Matthias Clasen <mclasen@redhat.com>
+Date: Tue, 22 Jan 2019 13:26:31 -0500
+Subject: [PATCH] keyfile settings: Use tighter permissions
+
+When creating directories, create them with 700 permissions,
+instead of 777.
+
+Closes: #1658
+CVE: CVE-2019-13012
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/glib/commit/5e4da714f00f6bfb2ccd6d73d61329c6f3a08429]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+
+---
+ gio/gkeyfilesettingsbackend.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gio/gkeyfilesettingsbackend.c b/gio/gkeyfilesettingsbackend.c
+index a37978e..580a0b0 100644
+--- a/gio/gkeyfilesettingsbackend.c
++++ b/gio/gkeyfilesettingsbackend.c
+@@ -89,7 +89,8 @@ g_keyfile_settings_backend_keyfile_write (GKeyfileSettingsBackend *kfsb)
+ 
+   contents = g_key_file_to_data (kfsb->keyfile, &length, NULL);
+   g_file_replace_contents (kfsb->file, contents, length, NULL, FALSE,
+-                           G_FILE_CREATE_REPLACE_DESTINATION,
++                           G_FILE_CREATE_REPLACE_DESTINATION |
++                           G_FILE_CREATE_PRIVATE,
+                            NULL, NULL, NULL);
+ 
+   compute_checksum (kfsb->digest, contents, length);
+@@ -640,7 +641,7 @@ g_keyfile_settings_backend_new (const gchar *filename,
+ 
+   kfsb->file = g_file_new_for_path (filename);
+   kfsb->dir = g_file_get_parent (kfsb->file);
+-  g_file_make_directory_with_parents (kfsb->dir, NULL, NULL);
++  g_mkdir_with_parents (g_file_peek_path (kfsb->dir), 0700);
+ 
+   kfsb->file_monitor = g_file_monitor (kfsb->file, 0, NULL, NULL);
+   kfsb->dir_monitor = g_file_monitor (kfsb->dir, 0, NULL, NULL);
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
index 733a2d4..2286d03 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.58.3.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson.build-do-not-hardcode-linux-as-the-host-system.patch \
            file://0001-meson-do-a-build-time-check-for-strlcpy-before-attem.patch \
            file://glib-meson.cross \
+           file://CVE-2019-13012.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
-- 
2.7.4


