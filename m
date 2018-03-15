Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9740C787A7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 16:03:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2FG3W6G006209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Mar 2018 09:03:32 -0700 (PDT)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 15 Mar 2018 09:03:31 -0700
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 15 Mar 2018 09:03:31 -0700
Message-ID: <20180315160331.187082-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH 1/1] gnome-desktop: do not assume time_t is long
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
X-List-Received-Date: Thu, 15 Mar 2018 16:03:31 -0000
Content-Type: text/plain

Replace use of atol() to set a time_t variable.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...op-thumbnail-don-t-assume-time_t-is-long.patch} | 30 +++++++---------------
 .../gnome-desktop/gnome-desktop3_3.26.2.bb         |  2 +-
 2 files changed, 10 insertions(+), 22 deletions(-)
 rename meta/recipes-gnome/gnome-desktop/gnome-desktop/{gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch => gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch} (70%)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
similarity index 70%
rename from meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
rename to meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
index c1a7d4f..fcc152f 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch
@@ -9,6 +9,15 @@ build for X32, where long's size doesn't match that of time_t.
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
+
+Modify patch described above to eliminate replacement of
+
+g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime)
+
+which is not necessary.  Retain replacement of atol().
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
 ---
  libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
  1 file changed, 14 insertions(+), 2 deletions(-)
@@ -26,27 +35,6 @@ index e56c3d7..5d96bf3 100644
  #include <config.h>
  
  #include <glib.h>
-@@ -1105,6 +1107,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
-   char *tmp_path = NULL;
-   int tmp_fd;
-   char mtime_str[21];
-+  struct tm *tmp_mtime = NULL;
-   gboolean ret = FALSE;
-   GError *error = NULL;
-   const char *width, *height;
-@@ -1124,7 +1127,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
-     goto out;
-   close (tmp_fd);
- 
--  g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime);
-+  tmp_mtime = localtime (&mtime);
-+  if (!tmp_mtime)
-+    goto out;
-+  strftime (mtime_str, 21, "%s", tmp_mtime);
-+  free (tmp_mtime);
-   width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
-   height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
- 
 @@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
  {
    const char *thumb_uri, *thumb_mtime_str;
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
index cd6c194..879dc9a 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
@@ -11,7 +11,7 @@ SRC_URI[archive.md5sum] = "6cee2ecd677d87eaa0eb5ebfa7b45fb3"
 SRC_URI[archive.sha256sum] = "f7561a7a313fc474b2c390cd9696df1f5c1e1556080e43f4afe042b1060e5f2a"
 
 SRC_URI += " \
-           file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch \
+           file://gnome-desktop-thumbnail-don-t-assume-time_t-is-long.patch \
            file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
            file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
            "
-- 
2.7.4


