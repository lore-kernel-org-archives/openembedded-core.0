Return-Path: <Awais_Belal@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 1AE6572710
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 13:53:10 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Y33Q6-0002i1-Ki from Awais_Belal@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Dec 2014 05:53:11 -0800
Received: from awais-Precision-M4700.mgc.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server id 14.3.181.6; Mon, 22 Dec 2014 13:53:09 +0000
From: Awais Belal <awais_belal@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Dec 2014 18:53:00 +0500
Message-ID: <1419256380-6483-1-git-send-email-awais_belal@mentor.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] gstreamer1.0-* use gitsm style SRC_URI for git recipes
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
X-List-Received-Date: Mon, 22 Dec 2014 13:53:18 -0000
Content-Type: text/plain

All gstreamer components when fetched through git have a git
submodule type repo rather than a main repo style. This
will make builds fail when there's no network connection
while the source is already downloaded.
We fix this by explicitly using the gitsm styled SRC_URI for
these submodules.

Signed-off-by: Awais Belal <awais_belal@mentor.com>
---
 .../gstreamer/gstreamer1.0-libav_git.bb            |    2 +-
 .../gstreamer/gstreamer1.0-omx_git.bb              |    2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |    2 +-
 .../gstreamer/gstreamer1.0_git.bb                  |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
index bf1b87e..376a7c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_git.bb
@@ -11,7 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
                     file://gst-libs/ext/libav/COPYING.LGPLv2.1;md5=bd7a443320af8c812e4c18d1b79df004 \
                     file://gst-libs/ext/libav/COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
+SRC_URI = "gitsm://anongit.freedesktop.org/gstreamer/gst-libav;branch=master"
 S = "${WORKDIR}/git"
 
 SRCREV = "127202d6f65584891dabf92be031f0d170b0e7f1"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 931a7fc..df7c58c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://omx/gstomx.h;beginline=1;endline=21;md5=5c8e1fca32704488e76d2ba9ddfa935f"
 
 SRC_URI = " \
-    git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
+    gitsm://anongit.freedesktop.org/gstreamer/gst-omx;branch=master \
     file://0001-omx-fixed-type-error-in-printf-call.patch \    
     "
 S = "${WORKDIR}/git"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 687aa2f..d857a40 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -43,7 +43,7 @@ def get_gst_srcuri(d):
     branch = d.getVar("GSTREAMER_1_0_GIT_BRANCH", True)
 
     if pv == "git":
-        s = "git://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
+        s = "gitsm://anongit.freedesktop.org/gstreamer/%s;branch=%s" % (gstpkg_basename, branch)
     else:
         s = "http://gstreamer.freedesktop.org/src/%s/%s-%s.tar.xz" % (gstpkg_basename, gstpkg_basename, pv)
     return s
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
index cb00d31..a8d3731 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0_git.bb
@@ -5,7 +5,7 @@ include gstreamer1.0.inc
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://gst/gst.h;beginline=1;endline=21;md5=e059138481205ee2c6fc1c079c016d0d"
 
-SRC_URI = "git://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
+SRC_URI = "gitsm://anongit.freedesktop.org/gstreamer/gstreamer;branch=master"
 S = "${WORKDIR}/git"
 
 SRCREV = "3b8181a8c550e74acaba4e8c55bdc649fa551dc9"
-- 
1.7.9.5


