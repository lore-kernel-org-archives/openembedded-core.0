Return-Path: <openembedded-devel@urbanec.net>
Received: from mail14.tpgi.com.au (mail14.tpgi.com.au [203.12.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id 312EC7374F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Feb 2015 17:32:05 +0000 (UTC)
X-TPG-Junk-Status: Message not scanned
X-TPG-Antivirus: Passed
X-TPG-Abuse: host=60-242-171-118.static.tpgi.com.au; ip=60.242.171.118;
	date=Fri, 27 Feb 2015 04:32:04 +1100
Received: from gw.urbanec.net (60-242-171-118.static.tpgi.com.au
	[60.242.171.118])
	by mail14.tpgi.com.au (envelope-from openembedded-devel@urbanec.net)
	(8.14.3/8.14.3) with ESMTP id t1QHW1DM014094
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 04:32:04 +1100
Received: from beep.urbanec.net ([192.168.42.2]) by gw.urbanec.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_128_CBC_SHA256:128) (Exim 4.84)
	(envelope-from <openembedded-devel@urbanec.net>)
	id 1YR2I5-0005Hs-AS; Fri, 27 Feb 2015 04:32:01 +1100
From: Peter Urbanec <openembedded-devel@urbanec.net>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 04:31:33 +1100
Message-Id: <1424971893-6258-1-git-send-email-openembedded-devel@urbanec.net>
X-Mailer: git-send-email 2.3.0
Cc: Peter Urbanec <openembedded-devel@urbanec.net>
Subject: [PATCH] gstreamer1.0: Shorten __FILE__ in gst_debug_log output on all platforms.
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
X-List-Received-Date: Thu, 26 Feb 2015 17:32:06 -0000

On WIN32 the file argument to gst_debug_log_valist is shortened to just
the filename. This is useful not only for MSVC, but also with gcc/Linux
when doing cross-compilation builds and out-of-tree builds.

Signed-off-by: Peter Urbanec <openembedded-devel@urbanec.net>
---
 ...gstinfo-Shorten-__FILE__-on-all-platforms.patch | 55 ++++++++++++++++++++++
 .../gstreamer/gstreamer1.0_1.4.5.bb                |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
new file mode 100644
index 0000000..8213c4b
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch
@@ -0,0 +1,55 @@
+From 81fecd367b016e5ac4fb0c04b84da5c474f30da6 Mon Sep 17 00:00:00 2001
+From: Peter Urbanec <git.user@urbanec.net>
+Date: Fri, 27 Feb 2015 01:16:58 +1100
+Subject: [PATCH 1/1] gstinfo: Shorten __FILE__ on all platforms.
+
+This is useful not only for MSVC, but also with gcc/Linux when doing
+cross-compilation builds and out-of-tree builds.
+
+Upstream-Status: Submitted [https://bugzilla.gnome.org/show_bug.cgi?id=745213]
+
+Signed-off-by: Peter Urbanec <git.user@urbanec.net>
+---
+ gst/gstinfo.c | 11 ++++-------
+ 1 file changed, 4 insertions(+), 7 deletions(-)
+
+diff --git a/gst/gstinfo.c b/gst/gstinfo.c
+index b2a3005..8b61d09 100644
+--- a/gst/gstinfo.c
++++ b/gst/gstinfo.c
+@@ -444,7 +444,6 @@ gst_debug_log (GstDebugCategory * category, GstDebugLevel level,
+   va_end (var_args);
+ }
+ 
+-#ifdef G_OS_WIN32
+ /* based on g_basename(), which we can't use because it was deprecated */
+ static inline const gchar *
+ gst_path_basename (const gchar * file_name)
+@@ -467,7 +466,6 @@ gst_path_basename (const gchar * file_name)
+ 
+   return file_name;
+ }
+-#endif
+ 
+ /**
+  * gst_debug_log_valist:
+@@ -497,12 +495,11 @@ gst_debug_log_valist (GstDebugCategory * category, GstDebugLevel level,
+   g_return_if_fail (function != NULL);
+   g_return_if_fail (format != NULL);
+ 
+-  /* The predefined macro __FILE__ is always the exact path given to the
+-   * compiler with MSVC, which may or may not be the basename.  We work
+-   * around it at runtime to improve the readability. */
+-#ifdef G_OS_WIN32
++  /* The predefined macro __FILE__ can be an absolute path in some build
++   * environments, such as MSVC or out-of-tree cross-compiles. This may
++   * be significantly longer than the filename.  We work around it at
++   * runtime to improve the readability. */
+   file = gst_path_basename (file);
+-#endif
+ 
+   message.message = NULL;
+   message.format = format;
+-- 
+2.3.0
+
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
index 94be846..0a2ce86 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.4.5.bb
@@ -6,6 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
 SRC_URI = " \
     http://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.xz \
     file://0001-Fix-crash-with-gst-inspect.patch \
+    file://0001-gstinfo-Shorten-__FILE__-on-all-platforms.patch \
 "
 SRC_URI[md5sum] = "88a9289c64a4950ebb4f544980234289"
 SRC_URI[sha256sum] = "40801aa7f979024526258a0e94707ba42b8ab6f7d2206e56adbc4433155cb0ae"
-- 
2.3.0


