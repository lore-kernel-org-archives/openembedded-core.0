Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D72FD605BB
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 05:47:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB15l8aQ011057
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 21:47:08 -0800 (PST)
Received: from pek-kkang-d2.wrs.com (128.224.162.180) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 Nov 2015 21:47:08 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 13:47:10 +0800
Message-ID: <1448948830-9690-1-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] matchbox-desktop: sync with gio for the inotify-sub
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
X-List-Received-Date: Tue, 01 Dec 2015 05:47:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

matchbox-desktop builds with included libinotify which
is very old (last sync was in 2008), if we compile glib-2.0
with -fvisibility=default (the default is hidden for libglib
and libgio), it will crash because of inconsistency of
inotify-sub, so port the related parts to fix the issue.

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../files/gio-sync-for-the-inotify-sub.patch       | 112 +++++++++++++++++++++
 .../matchbox-desktop/matchbox-desktop_git.bb       |   4 +-
 2 files changed, 115 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/gio-sync-for-the-inotify-sub.patch

diff --git a/meta/recipes-sato/matchbox-desktop/files/gio-sync-for-the-inotify-sub.patch b/meta/recipes-sato/matchbox-desktop/files/gio-sync-for-the-inotify-sub.patch
new file mode 100644
index 0000000..a9367e9
--- /dev/null
+++ b/meta/recipes-sato/matchbox-desktop/files/gio-sync-for-the-inotify-sub.patch
@@ -0,0 +1,112 @@
+From 84b7272c446cea5c6ae185548de0c6cad3a42355 Mon Sep 17 00:00:00 2001
+From: Jackie Huang <jackie.huang@windriver.com>
+Date: Sat, 28 Nov 2015 07:53:38 +0000
+Subject: [PATCH] gio: sync for the inotify-sub
+
+This only sync for the inotify-sub with glib-2.44
+to keep _ih_sub_new consistent.
+
+Upstream-Status: Pending
+
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ libtaku/inotify/inotify-sub.c | 15 +++++++++------
+ libtaku/inotify/inotify-sub.h | 13 +++++++++----
+ libtaku/taku-menu-desktop.c   |  2 +-
+ 3 files changed, 19 insertions(+), 11 deletions(-)
+
+diff --git a/libtaku/inotify/inotify-sub.c b/libtaku/inotify/inotify-sub.c
+index 404dc20..85b3411 100644
+--- a/libtaku/inotify/inotify-sub.c
++++ b/libtaku/inotify/inotify-sub.c
+@@ -16,8 +16,7 @@
+ 
+    You should have received a copy of the GNU Library General Public
+    License along with the Gnome Library; see the file COPYING.LIB.  If not,
+-   write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
+-   Boston, MA 02111-1307, USA.
++   see <http://www.gnu.org/licenses/>.
+ 
+    Authors: 
+ 		 John McCutchan <john@johnmccutchan.com>
+@@ -38,15 +37,17 @@ dup_dirname (const gchar *dirname)
+   gchar *d_dirname = g_strdup (dirname);
+   size_t len = strlen (d_dirname);
+   
+-  if (d_dirname[len] == '/')
+-    d_dirname[len] = '\0';
++  if (len && d_dirname[len - 1] == '/')
++    d_dirname[len - 1] = '\0';
+   
+   return d_dirname;
+ }
+ 
+ inotify_sub*
+ _ih_sub_new (const gchar *dirname, 
+-             const gchar *filename, 
++             const gchar *filename,
++             gboolean     pair_moves,
++             gboolean     watch_hardlinks,
+              gpointer     user_data)
+ {
+   inotify_sub *sub = NULL;
+@@ -54,8 +55,10 @@ _ih_sub_new (const gchar *dirname,
+   sub = g_new0 (inotify_sub, 1);
+   sub->dirname = dup_dirname (dirname);
+   sub->filename = g_strdup (filename);
++  sub->pair_moves = pair_moves;
++  sub->hardlinks = watch_hardlinks;
+   sub->user_data = user_data;
+-  
++
+   IS_W ("new subscription for %s being setup\n", sub->dirname);
+   
+   return sub;
+diff --git a/libtaku/inotify/inotify-sub.h b/libtaku/inotify/inotify-sub.h
+index 36561e7..ff37567 100644
+--- a/libtaku/inotify/inotify-sub.h
++++ b/libtaku/inotify/inotify-sub.h
+@@ -14,8 +14,7 @@
+ 
+    You should have received a copy of the GNU Library General Public
+    License along with the Gnome Library; see the file COPYING.LIB.  If not,
+-   write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330,
+-   Boston, MA 02111-1307, USA.
++   see <http://www.gnu.org/licenses/>.
+ 
+    Author: John McCutchan <john@johnmccutchan.com>
+ */
+@@ -30,9 +29,15 @@ typedef struct
+ 	gchar*   filename;
+ 	gboolean cancelled;
+ 	gpointer user_data;
++	gboolean pair_moves;
++	gboolean hardlinks;
+ } inotify_sub;
+ 
+-inotify_sub* _ih_sub_new (const gchar* dirname, const gchar* filename, gpointer user_data);
+-void         _ih_sub_free (inotify_sub* sub);
++inotify_sub *_ih_sub_new (const gchar  *dirname,
++			  const gchar  *filename,
++			  gboolean      pair_moves,
++			  gboolean      watch_hardlinks,
++			  gpointer      user_data);
++void         _ih_sub_free (inotify_sub *sub);
+ 
+ #endif /* __INOTIFY_SUB_H */
+diff --git a/libtaku/taku-menu-desktop.c b/libtaku/taku-menu-desktop.c
+index 34b10d9..ef88421 100644
+--- a/libtaku/taku-menu-desktop.c
++++ b/libtaku/taku-menu-desktop.c
+@@ -415,7 +415,7 @@ monitor (const char *directory)
+   if (!with_inotify)
+     return;
+ 
+-  sub = _ih_sub_new (directory, NULL, NULL);
++  sub = _ih_sub_new (directory, NULL, FALSE, FALSE, NULL);
+   _ip_start_watching (sub);
+ }
+ 
+-- 
+2.5.0
+
diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 318d2e0..4fcc69e 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -13,7 +13,9 @@ SECTION = "x11/wm"
 SRCREV = "71e3e6e04271e9d5a14f1c231ef100c7f320134d"
 PV = "2.0+git${SRCPV}"
 
-SRC_URI = "git://git.yoctoproject.org/${BPN}-2"
+SRC_URI = "git://git.yoctoproject.org/${BPN}-2 \
+           file://gio-sync-for-the-inotify-sub.patch \
+"
 
 EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
-- 
1.9.1


