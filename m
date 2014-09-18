Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id A642171498
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 09:02:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8I925Y8007035
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Sep 2014 02:02:06 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Thu, 18 Sep 2014 02:02:05 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 18 Sep 2014 05:02:02 -0400
Message-ID: <569393a4d7f504dedbe1627ac6ce423523e0e787.1411030646.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1411030646.git.wenzong.fan@windriver.com>
References: <cover.1411030646.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer1.0-plugins-bad: disable libssh2
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
X-List-Received-Date: Thu, 18 Sep 2014 09:02:07 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

libssh2 is automatically linked to if present, this undetermined
dependency may cause build errors like:

  .../x86_64-poky-linux/4.9.0/ld: cannot find -lssh2

libssh2 isn't an oe-core recipe, disable it for now.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad.inc         |    4 ++
 .../configure-allow-to-disable-libssh2.patch       |   64 ++++++++++++++++++++
 2 files changed, 68 insertions(+)
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index d8aa6ee..dab0bf5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -6,6 +6,9 @@ DEPENDS += "gstreamer1.0-plugins-base bzip2 libpng jpeg"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
+SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
+           "
+
 inherit gettext
 
 # opengl packageconfig factored out to make it easy for distros
@@ -51,6 +54,7 @@ PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
 PACKAGECONFIG[rtmp]            = "--enable-rtmp,--disable-rtmp,rtmpdump"
+PACKAGECONFIG[libssh2]         = "--enable-libssh2,--disable-libssh2,libssh2"
 
 # these plugins have not been ported to 1.0 (yet):
 #   directdraw vcd apexsink dc1394 lv2 linsys musepack mythtv
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
new file mode 100644
index 0000000..d52afd5
--- /dev/null
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/configure-allow-to-disable-libssh2.patch
@@ -0,0 +1,64 @@
+From f59c5269f92d59a5296cbfeeb682d42095cd88ad Mon Sep 17 00:00:00 2001
+From: Wenzong Fan <wenzong.fan@windriver.com>
+Date: Thu, 18 Sep 2014 02:24:07 -0400
+Subject: [PATCH] gstreamer1.0-plugins-bad: allow to disable libssh2
+
+libssh2 is automatically linked to if present, this undetermined
+dependency may cause build errors like:
+
+  .../x86_64-poky-linux/4.9.0/ld: cannot find -lssh2
+
+libssh2 isn't an oe-core recipe, so allow to disable it from
+configure.
+
+Upstream-Status: Pending
+
+Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
+---
+ configure.ac |   23 +++++++++++++++++------
+ 1 file changed, 17 insertions(+), 6 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 0e95c5c..12153b4 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1901,6 +1901,15 @@ AG_GST_CHECK_FEATURE(CHROMAPRINT, [chromaprint], chromaprint, [
+ ])
+ 
+ dnl *** Curl ***
++AC_ARG_ENABLE([libssh2],
++     [  --enable-libssh2		enable LIBSSH2 support @<:@default=auto@:>@],
++     [case "${enableval}" in
++       yes)  NEED_SSH2=yes ;;
++       no)   NEED_SSH2=no ;;
++       auto) NEED_SSH2=auto ;;
++       *) AC_MSG_ERROR([bad value ${enableval} for --enable-libssh2]) ;;
++     esac],[NEED_SSH2=auto])
++
+ translit(dnm, m, l) AM_CONDITIONAL(USE_CURL, true)
+ AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
+   PKG_CHECK_MODULES(CURL, libcurl >= 7.21.0, [
+@@ -1915,12 +1924,14 @@ AG_GST_CHECK_FEATURE(CURL, [Curl plugin], curl, [
+   ])
+   AC_SUBST(CURL_CFLAGS)
+   AC_SUBST(CURL_LIBS)
+-  PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
+-    HAVE_SSH2="yes"
+-    AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
+-  ], [
+-    HAVE_SSH2="no"
+-  ])
++  if test "x$NEED_SSH2" != "xno"; then
++    PKG_CHECK_MODULES(SSH2, libssh2 >= 1.4.3, [
++      HAVE_SSH2="yes"
++      AC_DEFINE(HAVE_SSH2, 1, [Define if libssh2 is available])
++    ], [
++      HAVE_SSH2="no"
++    ])
++  fi
+   AM_CONDITIONAL(USE_SSH2, test "x$HAVE_SSH2" = "xyes")
+   AC_SUBST(SSH2_CFLAGS)
+   AC_SUBST(SSH2_LIBS)
+-- 
+1.7.9.5
+
-- 
1.7.9.5


