Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3504378A12
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Mar 2018 01:35:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w281ZVVC002241
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 7 Mar 2018 17:35:31 -0800 (PST)
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 7 Mar 2018 17:34:57 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 7 Mar 2018 17:35:30 -0800
Message-ID: <20180308013530.125242-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] gnome-desktop: do not free() a static buffer
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
X-List-Received-Date: Thu, 08 Mar 2018 01:35:30 -0000
Content-Type: text/plain

Do not free() the buffer returned by localtime().  Also,
switch to calling localtime_r() which is re-entrant.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 ...op-thumbnail-don-t-convert-time_t-to-long.patch | 27 +++++++++-------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
index c1a7d4f..be657a8 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch
@@ -9,12 +9,11 @@ build for X32, where long's size doesn't match that of time_t.
 Upstream-Status: Pending
 Signed-off-by: Christopher Larson <chris_larson@mentor.com>
 
----
- libgnome-desktop/gnome-desktop-thumbnail.c | 16 ++++++++++++++--
- 1 file changed, 14 insertions(+), 2 deletions(-)
+Modified to use localtime_r() and not free() a static structure.
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
 
-diff --git a/libgnome-desktop/gnome-desktop-thumbnail.c b/libgnome-desktop/gnome-desktop-thumbnail.c
-index e56c3d7..5d96bf3 100644
 --- a/libgnome-desktop/gnome-desktop-thumbnail.c
 +++ b/libgnome-desktop/gnome-desktop-thumbnail.c
 @@ -120,6 +120,8 @@
@@ -30,24 +29,23 @@ index e56c3d7..5d96bf3 100644
    char *tmp_path = NULL;
    int tmp_fd;
    char mtime_str[21];
-+  struct tm *tmp_mtime = NULL;
++  struct tm tmp_mtime;
    gboolean ret = FALSE;
    GError *error = NULL;
    const char *width, *height;
-@@ -1124,7 +1127,11 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+@@ -1124,7 +1127,10 @@ save_thumbnail (GdkPixbuf  *pixbuf,
      goto out;
    close (tmp_fd);
  
 -  g_snprintf (mtime_str, 21, "%" G_GINT64_FORMAT, (gint64) mtime);
-+  tmp_mtime = localtime (&mtime);
-+  if (!tmp_mtime)
++  if (!localtime_r (&mtime,&tmp_mtime))
 +    goto out;
-+  strftime (mtime_str, 21, "%s", tmp_mtime);
-+  free (tmp_mtime);
++
++  strftime (mtime_str, 21, "%s", &tmp_mtime);
    width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
    height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
  
-@@ -1319,6 +1326,7 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+@@ -1319,6 +1325,7 @@ gnome_desktop_thumbnail_is_valid (GdkPix
  {
    const char *thumb_uri, *thumb_mtime_str;
    time_t thumb_mtime;
@@ -55,7 +53,7 @@ index e56c3d7..5d96bf3 100644
  
    thumb_uri = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::URI");
    if (g_strcmp0 (uri, thumb_uri) != 0)
-@@ -1327,7 +1335,11 @@ gnome_desktop_thumbnail_is_valid (GdkPixbuf          *pixbuf,
+@@ -1327,7 +1334,11 @@ gnome_desktop_thumbnail_is_valid (GdkPix
    thumb_mtime_str = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::MTime");
    if (!thumb_mtime_str)
      return FALSE;
@@ -68,6 +66,3 @@ index e56c3d7..5d96bf3 100644
    if (mtime != thumb_mtime)
      return FALSE;
  
--- 
-2.14.1
-
-- 
2.7.4


