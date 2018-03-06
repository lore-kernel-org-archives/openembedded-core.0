Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id DE32178A40
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 00:04:37 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w2604ZLX020529
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 5 Mar 2018 16:04:37 -0800
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 5 Mar 2018 16:04:00 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 5 Mar 2018 16:04:32 -0800
Message-ID: <20180306000432.254391-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] gnome-desktop3: eliminate erroneous free()
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
X-List-Received-Date: Tue, 06 Mar 2018 00:04:38 -0000
Content-Type: text/plain

gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch introduced
a call to localtime() and a free() of the structure returned.  This is
incorrect, as the structure is static.  For glibc 2.26, this will cause
the program to abort.  Eliminate the free() and call localtime_r()
which lets us allocate the tm structure.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../gnome-desktop/fix_erroneous_free.patch         | 35 ++++++++++++++++++++++
 .../gnome-desktop/gnome-desktop3_3.26.2.bb         |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch

diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch b/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch
new file mode 100644
index 0000000..c27e4d5
--- /dev/null
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop/fix_erroneous_free.patch
@@ -0,0 +1,35 @@
+gnome-desktop3: eliminate erroneous free()
+
+Do not free() a static structure.  Use re-entrant localtime_r().
+
+Upstream-Status: Pending
+
+Signed-off-by: Joe Slater <jslater@windriver.com>
+
+
+--- a/libgnome-desktop/gnome-desktop-thumbnail.c
++++ b/libgnome-desktop/gnome-desktop-thumbnail.c
+@@ -1200,7 +1200,7 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+   char *tmp_path = NULL;
+   int tmp_fd;
+   char mtime_str[21];
+-  struct tm *tmp_mtime = NULL;
++  struct tm tmp_mtime;
+   gboolean ret = FALSE;
+   GError *error = NULL;
+   const char *width, *height;
+@@ -1220,11 +1220,10 @@ save_thumbnail (GdkPixbuf  *pixbuf,
+     goto out;
+   close (tmp_fd);
+ 
+-  tmp_mtime = localtime (&mtime);
+-  if (!tmp_mtime)
++  if (!localtime_r (&mtime,&tmp_mtime))
+     goto out;
+-  strftime (mtime_str, 21, "%s", tmp_mtime);
+-  free (tmp_mtime);
++
++  strftime (mtime_str, 21, "%s", &tmp_mtime);
+   width = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Width");
+   height = gdk_pixbuf_get_option (pixbuf, "tEXt::Thumb::Image::Height");
+ 
diff --git a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
index cd6c194..2cd3234 100644
--- a/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
+++ b/meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.26.2.bb
@@ -14,6 +14,7 @@ SRC_URI += " \
            file://gnome-desktop-thumbnail-don-t-convert-time_t-to-long.patch \
            file://0001-configure.ac-Remove-gnome-common-macro-calls.patch \
            file://0001-Disable-libseccomp-sycall-filtering-mechanism.patch \
+           file://fix_erroneous_free.patch \
            "
 
 DEPENDS += "intltool-native gsettings-desktop-schemas gconf virtual/libx11 gtk+3 glib-2.0 startup-notification xkeyboard-config iso-codes udev"
-- 
2.7.4


