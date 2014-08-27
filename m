Return-Path: <marius.avram@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B5D6E70E5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Aug 2014 09:20:04 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 27 Aug 2014 02:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,409,1406617200"; d="scan'208";a="590482681"
Received: from mavram-vostro.rb.intel.com ([10.237.105.71])
	by fmsmga002.fm.intel.com with ESMTP; 27 Aug 2014 02:20:05 -0700
From: Marius Avram <marius.avram@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Aug 2014 12:23:13 +0300
Message-Id: <1409131393-405-1-git-send-email-marius.avram@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2] Fix USB not mounted in file manager
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
X-List-Received-Date: Wed, 27 Aug 2014 09:20:10 -0000

Currently a USB stick gets mounted on /run/media/sdX, where X is the
letter corresponding to a certain drive. In older builds of core-image-sato
it got mounted in /media/sdX. This change made the drives to not be
displayed in graphical applications which use glib-2.0 such as the
File Manager (pcmanfm). The reason is that the gio component of glib-2.0
which handles mounts contains a function which determines if a mount
is worthy to be displayed in the UI or not. The function is called
g_unix_mount_guess_should_display().

It expects a drive to be mounted in /run/media/<username>/sdX, but
in the current build the username part is missing in case a root user
is authenticated in the system.

The easiest solution is to allow the display of drives mounted in the
path used by the current configuration and that is /run/media/sdX.

[YOCTO #6492]

Signed-off-by: Marius Avram <marius.avram@intel.com>
---
 ...un-media-sdX-drive-mount-if-username-root.patch |   39 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb      |    1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch b/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
new file mode 100644
index 0000000..3d0c008
--- /dev/null
+++ b/meta/recipes-core/glib-2.0/glib-2.0/allow-run-media-sdX-drive-mount-if-username-root.patch
@@ -0,0 +1,39 @@
+From c53e94a520b573aa0dcf12903e9563fe8badc34c Mon Sep 17 00:00:00 2001
+From: Marius Avram <marius.avram@intel.com>
+Date: Wed, 27 Aug 2014 12:10:41 +0300
+Subject: [PATCH] Allow /run/media/sdX drive mount if username root
+
+In case that the username logged in the system is root
+the drives are directly mounted in /run/media/sdX and
+not /run/media/<username>/sdX as the function
+g_unix_mount_guess_should_display() expects.
+
+Without this change USB stick mounts are not accesible from
+graphical applications such as the File Manager (pcmanfm).
+
+Upstream-Status: Inappropriate
+
+Signed-off-by: Marius Avram <marius.avram@intel.com>
+---
+ gio/gunixmounts.c |    5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/gio/gunixmounts.c b/gio/gunixmounts.c
+index 4999354..f6c1472 100644
+--- a/gio/gunixmounts.c
++++ b/gio/gunixmounts.c
+@@ -2136,6 +2136,11 @@ g_unix_mount_guess_should_display (GUnixMountEntry *mount_entry)
+           mount_path[sizeof ("/run/media/") - 1 + user_name_len] == '/')
+         is_in_runtime_dir = TRUE;
+ 
++      /* Allow no username in path in /run/media if current user is root */
++      if (strcmp(user_name, "root") == 0 &&
++          strncmp (mount_path, "/run/media/", sizeof("run/media")) == 0)
++        is_in_runtime_dir = TRUE;
++
+       if (is_in_runtime_dir || g_str_has_prefix (mount_path, "/media/"))
+         {
+           char *path;
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
index ff1fb87..4b1bcf8 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.40.0.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://ptest-paths.patch \
            file://uclibc.patch \
            file://0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch \
+           file://allow-run-media-sdX-drive-mount-if-username-root.patch \
           "
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
-- 
1.7.9.5


