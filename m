Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7F1CC3DA42
	for <webhook@archiver.kernel.org>; Wed, 10 Jul 2024 09:44:18 +0000 (UTC)
Received: from esa7.hc1455-7.c3s2.iphmx.com (esa7.hc1455-7.c3s2.iphmx.com [139.138.61.252])
 by mx.groups.io with SMTP id smtpd.web11.10231.1720604657687666188
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jul 2024 02:44:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=MjNuElbT;
 spf=pass (domain: fujitsu.com, ip: 139.138.61.252, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1720604657; x=1752140657;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=9MAP+GEvVjq2EAVCM2IQoWG1lGEDbCzFv71lxkuoH3s=;
  b=MjNuElbT3TV5fdjbOiuxErVf4YJgTUq2yc2XwtB434WpAiFXTE48GIBk
   KZNBJRi94t1s/F2b3xuJookw/6whEnxgQEfLu7nmYzUIzCjv9sTAPLfLG
   SXHDUOachJvxDveOXCJqYNlz0EjfuTEoI5QkqQeMQkoiXIrDHTx29aGg/
   zhxuSBLeVoudVYYFFRLVp5dhvZbgsZybIIyxrImHMnroWJbN3lP1zwlQo
   QsSnrwmkWDLp8Ut/lzwtayBF/0f2Zj5iSMk3GZZjrnyTeVDeDg528muyx
   VhG4Nlhm07ym5TGxgkaq+pl0CoBOmxXcccbps4n9LvM1mzJh+S4OAqKYn
   w==;
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="145396397"
X-IronPort-AV: E=Sophos;i="6.09,197,1716217200"; 
   d="scan'208";a="145396397"
Received: from unknown (HELO oym-r1.gw.nic.fujitsu.com) ([210.162.30.89])
  by esa7.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2024 18:44:15 +0900
Received: from oym-m4.gw.nic.fujitsu.com (oym-nat-oym-m4.gw.nic.fujitsu.com [192.168.87.61])
	by oym-r1.gw.nic.fujitsu.com (Postfix) with ESMTP id A3005D29E1
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:13 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by oym-m4.gw.nic.fujitsu.com (Postfix) with ESMTP id DC70BD4C13
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 557202005018E
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 18:44:12 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 06C671A0002;
	Wed, 10 Jul 2024 17:44:11 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-core@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH 10/30] gstreamer: upgrade 1.24.4 -> 1.24.5
Date: Wed, 10 Jul 2024 17:43:34 +0800
Message-Id: <1720604634-23406-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
References: <1720604634-23406-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28520.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28520.006
X-TMASE-Result: 10--13.947100-10.000000
X-TMASE-MatchedRID: uhFBvrq0w1ajz0nOeth/yTo39wOA02LhMVVFhl7NwvMIp79RyzRFTIGu
	uB5GbmmMye0MgpC/RogKG5wPc3Kleis/FOpu5r/Auce7gFxhKa3Vy4hHC3/gyLKw8Hx0EGitsPg
	sj1zRh6I1gIHPPGxSe/+EMOr9fJmZL/tBTZzO5Q0bzCsRwPXnzWa/brzlyUyEUJ52LFhfM6vT0P
	pHDbMis/GreLFhOYYLCmpOJyVooQAR/RzaGxMQM+KggdmU+sgMfb+ZO7kHlEhLWMri+QqmsSQGh
	5qJzqDbcyQQqtRxQEdHXGIar+yGm8ze6zZZ3y2ea87CDXaKRVJkt5Wqykg+R4WZ12shSzfiMFdd
	v+pLbrfeqf14WTE2+JqEYsVSaJsoL0C23a86C36/QNwZdfw3FU3yuY9BGW8rOxJ4Q8KVbh1tjZW
	MxmYEJAGsHl8sPNqm5YAvdCWT1bADFgoHQs6fmqqHmm/V4M/PltF+xW+zhUh5eyhu4TpIqyRM9p
	S/s/NIYO39Qks8bd2WI0/lg2yjOxQP7xKjlK+PJ5oIExjxwSd9LQinZ4QefIWH8POvJNOWIpL3U
	uT3Jij3FLeZXNZS4DjAdLIal4R6oYgMcnESdnMMz4MfeGOhU/U+X5r0s449M0K8DaD51rIh3qES
	+fwSTQ==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jul 2024 09:44:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201707

From: Wang Mingyu <wangmy@fujitsu.com>

0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
0002-tests-add-support-for-install-the-tests.patch
refreshed for 1.24.5

Changelog:
 https://gstreamer.freedesktop.org/releases/1.24

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...tools_1.24.4.bb => gst-devtools_1.24.5.bb} |  2 +-
 ...1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} |  2 +-
 ...path_get_basename-instead-of-libc-ba.patch | 96 -------------------
 ....bb => gstreamer1.0-plugins-bad_1.24.5.bb} |  3 +-
 ...bb => gstreamer1.0-plugins-base_1.24.5.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-good_1.24.5.bb} |  2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.24.5.bb} |  2 +-
 ....24.4.bb => gstreamer1.0-python_1.24.5.bb} |  2 +-
 ....bb => gstreamer1.0-rtsp-server_1.24.5.bb} |  2 +-
 ...1.24.4.bb => gstreamer1.0-vaapi_1.24.5.bb} |  2 +-
 ...ts-add-support-for-install-the-tests.patch |  8 +-
 ...er1.0_1.24.4.bb => gstreamer1.0_1.24.5.bb} |  2 +-
 12 files changed, 14 insertions(+), 111 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.4.bb => gst-devtools_1.24.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.4.bb => gstreamer1.0-libav_1.24.5.bb} (91%)
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.24.4.bb => gstreamer1.0-plugins-bad_1.24.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.24.4.bb => gstreamer1.0-plugins-base_1.24.5.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.24.4.bb => gstreamer1.0-plugins-good_1.24.5.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.24.4.bb => gstreamer1.0-plugins-ugly_1.24.5.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.24.4.bb => gstreamer1.0-python_1.24.5.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.24.4.bb => gstreamer1.0-rtsp-server_1.24.5.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.24.4.bb => gstreamer1.0-vaapi_1.24.5.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.24.4.bb => gstreamer1.0_1.24.5.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
index eca0753cf2..d4a81b69a1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.5.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "8bff1b388522e03d761786e61fe9aff1f9867b8f7cc230043cbb2622dcf6f0fe"
+SRC_URI[sha256sum] = "a96675898129a480d05bbf91071ec4e40154dcad6d62f3944154a6cb326045a4"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
index dfd26f7df7..24c6c792c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.5.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "4d3803f36008e847fc4842c8dd366162baf8359526cc46c1851bf68bb638da73"
+SRC_URI[sha256sum] = "7fd16bdfa56ed51c40b474648fc35c4edde3e8ac934b12b82b49727b5d703521"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
deleted file mode 100644
index cc21435dde..0000000000
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch
+++ /dev/null
@@ -1,96 +0,0 @@
-From 7c558e8ef9375aea953d1e7c854b25947c967f76 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 7 Jun 2024 23:09:54 -0700
-Subject: [PATCH] uvcgadget: Use g_path_get_basename instead of libc basename
-
-Musl does not implement GNU basename and have fixed a bug where the
-prototype was leaked into string.h [1], which resullts in compile errors
-with GCC-14 and Clang-17+
-
-| sys/uvcgadget/configfs.c:262:21: error: call to undeclared function 'basename'
-ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
-|   262 |     const char *v = basename (globbuf.gl_pathv[i]);
-|       |                     ^
-
-Use glib function instead makes it portable across musl and glibc on
-linux
-
-[1] https://git.musl-libc.org/cgit/musl/commit/?id=725e17ed6dff4d0cd22487bb64470881e86a92e7a
-
-Upstream-Status: Backport [https://gitlab.freedesktop.org/gstreamer/gstreamer/merge_requests/7006]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- .../gst-plugins-bad/sys/uvcgadget/configfs.c   | 18 ++++++++++++------
- 1 file changed, 12 insertions(+), 6 deletions(-)
-
---- a/sys/uvcgadget/configfs.c
-+++ b/sys/uvcgadget/configfs.c
-@@ -7,7 +7,7 @@
-  * Contact: Kieran Bingham <kieran.bingham@ideasonboard.com>
-  */
- 
--/* To provide basename and asprintf from the GNU library. */
-+/* To provide asprintf from the GNU library. */
- #define _GNU_SOURCE
- 
- #include <dirent.h>
-@@ -259,9 +259,10 @@ udc_find_video_device (const char *udc,
-   }
- 
-   if (i < globbuf.gl_pathc) {
--    const char *v = basename (globbuf.gl_pathv[i]);
-+    gchar *v = g_path_get_basename (globbuf.gl_pathv[i]);
- 
-     video = path_join ("/dev", v);
-+    g_free (v);
-   }
- 
-   globfree (&globbuf);
-@@ -894,6 +895,7 @@ configfs_parse_uvc_function (const char
- {
-   struct uvc_function_config *fc;
-   char *fpath;
-+  gchar *bname;
-   int ret = 0;
- 
-   fc = malloc (sizeof *fc);
-@@ -923,11 +925,10 @@ configfs_parse_uvc_function (const char
-    * Parse the function configuration. Remove the gadget name qualifier
-    * from the function name, if any.
-    */
--  if (function)
--    function = basename (function);
-+  bname = g_path_get_basename (function);
- 
-   fc->udc = attribute_read_str (fpath, "../../UDC");
--  fc->video = udc_find_video_device (fc->udc, function);
-+  fc->video = udc_find_video_device (fc->udc, bname);
-   if (!fc->video) {
-     ret = -ENODEV;
-     goto done;
-@@ -942,6 +943,7 @@ done:
-   }
- 
-   free (fpath);
-+  g_free (bname);
- 
-   return fc;
- }
-@@ -979,12 +981,16 @@ configfs_parse_uvc_videodev (int fd, con
-   char *function = NULL;
-   char rpath[PATH_MAX];
-   char *res;
-+  gchar *bname;
- 
-   res = realpath (video, rpath);
-   if (!res)
-     return NULL;
- 
--  function = video_find_config_name (basename (rpath));
-+  bname = g_path_get_basename (rpath);
-+  function = video_find_config_name (bname);
-+  g_free (bname);
-+
-   if (!function)
-     return NULL;
- 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
index c7fb9dc91a..e549728c20 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.5.bb
@@ -9,9 +9,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0001-fix-maybe-uninitialized-warnings-when-compiling-with.patch \
            file://0002-avoid-including-sys-poll.h-directly.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
-           file://0001-uvcgadget-Use-g_path_get_basename-instead-of-libc-ba.patch \
            "
-SRC_URI[sha256sum] = "260bd0a463b4faff9a42f41e5e028f787f10a92b779af8959aec64586f546bd3"
+SRC_URI[sha256sum] = "3029bfd7265314d609dc8eab503675a344ea46e8274fd73ab34566c8442dc847"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
index bda9f3e737..9d19ea233d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.5.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "09f4ddf246eeb819da1494ce336316edbbcb28fdff3ee2f9804891e84df39b2a"
+SRC_URI[sha256sum] = "0e33ec9b59eef5ef3a6a53bbd55c44340e681d0000910caca12541a73db38a7d"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
index 48d5f9ce86..1c33ffde00 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.24.5.bb
@@ -6,7 +6,7 @@ BUGTRACKER = "https://gitlab.freedesktop.org/gstreamer/gst-plugins-good/-/issues
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-good-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "023096d661cf58cde3e0dcdbf56897bf588830232358c305f3e15fd63e116626"
+SRC_URI[sha256sum] = "badcfc5292b035bde99a77327d468b2f0b116b40420bc9f25fb8e3970824ba75"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
index 37f870be59..6cae61ed35 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.24.5.bb
@@ -15,7 +15,7 @@ SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
 
-SRC_URI[sha256sum] = "4604f8709c0bc4d6960ef6ae6fd91e0b20af011bfe22e103f5b85377cf3f1ef4"
+SRC_URI[sha256sum] = "333267b6e00770440a4a00402910dd59ed8fd619eaebf402815fbe111da7776d"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb
index 6f05863486..a4574f1262 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.24.5.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5510358316eb5c965829a393714b4d88306033cd64db3eae8cc62b41ae80a392"
+SRC_URI[sha256sum] = "c23570c144e6276efd9e82de2ac0cea46b168a57fb2e436bed96cb285d641bf6"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
index 13431ed788..9971eee48e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.5.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "eeca811cef6312fa21433294ae216b3c6fa0a389d8980727102516bdcf973eae"
+SRC_URI[sha256sum] = "a3062665e41814d3dba3e02b7b06b77326d54d2b6f178ffcb196af9b91a1bfb9"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb
index b4ace68129..c23794f4b6 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-vaapi_1.24.5.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${REALPN}/${REALPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "2dfb322e37370b6671b62ff60dc1da81f87dac5a17c1c7ef15a783d2355900b8"
+SRC_URI[sha256sum] = "fdb2da26b23895c56b20c6bad9edcf0faec3a3887765bc62c88f0955ed5b7c72"
 
 S = "${WORKDIR}/${REALPN}-${PV}"
 DEPENDS = "libva gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
index a990940cc6..8a0d5bd51b 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0/0002-tests-add-support-for-install-the-tests.patch
@@ -1,4 +1,4 @@
-From 31dea17a1d5de0003719a875a1089df43a50219a Mon Sep 17 00:00:00 2001
+From 19b1768acde5b30def36f0d1ac2725b265151d13 Mon Sep 17 00:00:00 2001
 From: Jose Quaresma <quaresma.jose@gmail.com>
 Date: Sun, 11 Apr 2021 19:48:13 +0100
 Subject: [PATCH] tests: add support for install the tests
@@ -19,10 +19,10 @@ Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
  create mode 100644 tests/check/template.test.in
 
 diff --git a/meson.build b/meson.build
-index efcf189..c97d9a8 100644
+index 0809b4c..ffb61c4 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -624,6 +624,10 @@ if bashcomp_dep.found()
+@@ -645,6 +645,10 @@ if bashcomp_dep.found()
    endif
  endif
  
@@ -46,7 +46,7 @@ index 340fb58..5b87f68 100644
  # Feature options
  option('check', type : 'feature', value : 'auto', description : 'Build unit test libraries')
 diff --git a/tests/check/meson.build b/tests/check/meson.build
-index e9501fe..08f8fd8 100644
+index bf0021f..9a8c42c 100644
 --- a/tests/check/meson.build
 +++ b/tests/check/meson.build
 @@ -125,10 +125,16 @@ test_defines = [
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb
index 0625accb7b..c2da99f7e4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.5.bb
@@ -22,7 +22,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gstreamer/gstreamer-${PV}.tar.x
            file://0003-tests-use-a-dictionaries-for-environment.patch \
            file://0004-tests-add-helper-script-to-run-the-installed_tests.patch \
            "
-SRC_URI[sha256sum] = "52c93bc48e03533aa676fd8c15eb6b5fc326c68db311c50bcc0a865f31a6c653"
+SRC_URI[sha256sum] = "2bdef209252bf146351843134b797db6b6e7adb4c00d82e83bd5abe608253a7b"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('PTEST_ENABLED', '1', 'tests', '', d)} \
                    check \
-- 
2.34.1


