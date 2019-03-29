Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2CE616BE39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Mar 2019 06:40:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2T6e0dd013325
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 23:40:10 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Thu, 28 Mar 2019 23:39:49 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 29 Mar 2019 14:39:48 +0800
Message-ID: <1553841588-296038-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] gdk-pixbuf: fix run query-loaders fail
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
X-List-Received-Date: Fri, 29 Mar 2019 06:40:20 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Reproduce steps:
1. add below config into local.conf
   IMAGE_INSTALL_append = " packagegroup-xfce-base"
   DISTRO_FEATURES_append = " polkit"
2. bitbake core-image-minimal

do_rootfs failed with below error:

qemu-i386 -r 3.2.0 -E LD_LIBRARY_PATH=/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/usr/lib:/tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/lib -L /tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs /tmp/work/qemux86-poky-linux/core-image-minimal/1.0-r0/rootfs/usr/lib/gdk-pixbuf-2.0/gdk-pixbuf-query-loaders

** (process:162531): CRITICAL **: 02:10:12.174: Failed to get connection to xfconfd: Cannot autolaunch D-Bus without X11 $DISPLAY

Signey-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...001-gdk-pixbuf-fix-run-query-loaders-fail.patch | 59 ++++++++++++++++++++++
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb |  1 +
 2 files changed, 60 insertions(+)
 create mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-fix-run-query-loaders-fail.patch

diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-fix-run-query-loaders-fail.patch b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-fix-run-query-loaders-fail.patch
new file mode 100644
index 0000000..836dcae
--- /dev/null
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-gdk-pixbuf-fix-run-query-loaders-fail.patch
@@ -0,0 +1,59 @@
+From fa0d2ba51f1ccc848da9ff708c23a76b22c6e764 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Thu, 28 Mar 2019 17:27:45 +0800
+Subject: [PATCH] gdk-pixbuf: fix run query-loaders fail
+
+run query-loaders fail with error:
+
+** (process:417595): CRITICAL **: 09:21:35.330: Failed to
+get connection to xfconfd: Cannot autolaunch D-Bus without X11 $DISPLAY
+
+Commit https://github.com/GNOME/gdk-pixbuf/commit/49d4becc33ca6bc99199dc845f3413e16eeb7f53
+change method of getting pixbuf_libdir, but call of function g_file_new_for_path 
+make this error happen, fix by only use g_file_new_for_path for WIN32, 
+for other platform, still use g_strdup.
+
+Maybe this fix just like a workaround, and have send upstream for review.
+
+Upstream-Status: Submitted [https://gitlab.gnome.org/GNOME/gdk-pixbuf/merge_requests/44]
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ gdk-pixbuf/queryloaders.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/gdk-pixbuf/queryloaders.c b/gdk-pixbuf/queryloaders.c
+index b813d99..59d62f7 100644
+--- a/gdk-pixbuf/queryloaders.c
++++ b/gdk-pixbuf/queryloaders.c
+@@ -316,15 +316,14 @@ int main (int argc, char **argv)
+         GString *contents;
+         gchar *cache_file = NULL;
+         gint first_file = 1;
+-        GFile *pixbuf_libdir_file;
+         gchar *pixbuf_libdir;
+         gboolean success = TRUE;
+ 
+ #ifdef G_OS_WIN32
++        GFile *pixbuf_libdir_file;
+         gchar *libdir;
+         GFile *pixbuf_prefix_file;
+         gchar *pixbuf_prefix;
+-#endif
+ 
+         /* An intermediate GFile here will convert all the path separators
+          * to the right one used by the platform
+@@ -332,6 +331,10 @@ int main (int argc, char **argv)
+         pixbuf_libdir_file = g_file_new_for_path (PIXBUF_LIBDIR);
+         pixbuf_libdir = g_file_get_path (pixbuf_libdir_file);
+         g_object_unref (pixbuf_libdir_file);
++#else
++        pixbuf_libdir = g_strdup (PIXBUF_LIBDIR);
++#endif
++
+ 
+ #ifdef G_OS_WIN32
+         pixbuf_prefix_file = g_file_new_for_path (GDK_PIXBUF_PREFIX);
+-- 
+2.7.4
+
diff --git a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
index c5de7a9..6435473 100644
--- a/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
+++ b/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.38.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
            file://0001-Fix-a-couple-of-decisions-around-cross-compilation.patch \
            file://0001-loaders.cache-depend-on-loaders-being-fully-build.patch \
            file://0004-Do-not-run-tests-when-building.patch \
+           file://0001-gdk-pixbuf-fix-run-query-loaders-fail.patch \
            "
 
 SRC_URI_append_class-target = " \
-- 
2.7.4


