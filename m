Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id B4DC8745CD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 May 2018 18:12:46 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 May 2018 11:12:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.49,352,1520924400"; d="scan'208";a="42174592"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 01 May 2018 11:12:47 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2018 21:06:44 +0300
Message-Id: <20180501180646.28212-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180501180646.28212-1-alexander.kanavin@linux.intel.com>
References: <20180501180646.28212-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/4] gtk+: do not look into $HOME when looking for modules
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
X-List-Received-Date: Tue, 01 May 2018 18:12:46 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...ok-into-HOME-when-looking-for-gtk-modules.patch | 29 ++++++++++++++++++++++
 meta/recipes-gnome/gtk+/gtk+_2.24.32.bb            |  3 ++-
 2 files changed, 31 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch

diff --git a/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch b/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
new file mode 100644
index 00000000000..9201e45c39e
--- /dev/null
+++ b/meta/recipes-gnome/gtk+/gtk+/0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch
@@ -0,0 +1,29 @@
+From 34ce93e1c50bfb88f92a687d4f82de55584f3f6a Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 11 Apr 2018 14:20:39 +0300
+Subject: [PATCH] Do not look into $HOME when looking for gtk modules
+
+On the host it causes host contamination, on the target it's a
+potential security issue. Gtk+3 has already removed this.
+
+Upstream-Status: Inapproriate [gtk2 is in maintenance mode]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ gtk/gtkmodules.c | 4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/gtk/gtkmodules.c b/gtk/gtkmodules.c
+index 50729b6..e09b583 100644
+--- a/gtk/gtkmodules.c
++++ b/gtk/gtkmodules.c
+@@ -65,10 +65,6 @@ get_module_path (void)
+   if (result)
+     return result;
+ 
+-  home_dir = g_get_home_dir();
+-  if (home_dir)
+-    home_gtk_dir = g_build_filename (home_dir, ".gtk-2.0", NULL);
+-
+   module_path_env = g_getenv ("GTK_PATH");
+   exe_prefix = g_getenv ("GTK_EXE_PREFIX");
+ 
diff --git a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb b/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
index 20703588c39..89fca736b25 100644
--- a/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
+++ b/meta/recipes-gnome/gtk+/gtk+_2.24.32.bb
@@ -10,7 +10,8 @@ SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk+/2.24/gtk+-${PV}.tar.xz \
            file://toggle-font.diff;striplevel=0 \
            file://doc-fixes.patch \
            file://strict-prototypes.patch \
-	  "
+           file://0001-Do-not-look-into-HOME-when-looking-for-gtk-modules.patch \
+           "
 
 SRC_URI[md5sum] = "d5742aa42275203a499b59b4c382a784"
 SRC_URI[sha256sum] = "b6c8a93ddda5eabe3bfee1eb39636c9a03d2a56c7b62828b359bf197943c582e"
-- 
2.16.1


