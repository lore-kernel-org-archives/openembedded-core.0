Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 41E7171957
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Mar 2016 14:34:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 5780F2E104;
	Mon,  7 Mar 2016 15:34:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 4JOg83rJhO7M; Mon,  7 Mar 2016 15:34:45 +0100 (CET)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id EEF1E2E12C;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id D7878122;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id C0E1015BC;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id BE8D6A0C;
	Mon,  7 Mar 2016 15:34:44 +0100 (CET)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u27EYiwl006359;
	Mon, 7 Mar 2016 15:34:44 +0100
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u27EYidu006358;
	Mon, 7 Mar 2016 15:34:44 +0100
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org,
	Andre McCurdy <armccurdy@gmail.com>
Date: Mon,  7 Mar 2016 15:34:31 +0100
Message-Id: <9eed04bf5413949be4ad3bf75a3db1223f7c1b4c.1457361163.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1457361163.git.pkj@axis.com>
References: <cover.1457361163.git.pkj@axis.com>
In-Reply-To: <cover.1457361163.git.pkj@axis.com>
References: <cover.1457361163.git.pkj@axis.com>
Subject: [PATCH 1/1] Revert "gstreamer1.0-plugins-XXX: move inherit gettext into common .inc file"
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
X-List-Received-Date: Mon, 07 Mar 2016 14:34:48 -0000

Do not assume that the recipes in OE-Core are the only ones using
gstreamer1.0-plugins.inc or that all GStreamer plugins support
localization. Without this reversal, all our GStreamer plugin recipes
started spewing out:

configure: WARNING: unrecognized options: --disable-nls

This reverts commit 282fa5ff059db6f6daa108d5ec4ea3d0bfbe0fe2.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc  | 2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc | 2 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc      | 2 +-
 5 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 64d89b0..a8bff19 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -4,7 +4,7 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
-inherit bluetooth
+inherit gettext bluetooth
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
index f75efea..427611a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base.inc
@@ -4,6 +4,8 @@ LICENSE = "GPLv2+ & LGPLv2+"
 
 DEPENDS += "iso-codes util-linux zlib"
 
+inherit gettext
+
 PACKAGES_DYNAMIC =+ "^libgst.*"
 
 PACKAGECONFIG ??= " \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
index 6b005aa..4621bf8 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good.inc
@@ -4,6 +4,8 @@ LICENSE = "GPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libcap zlib bzip2"
 
+inherit gettext
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio', '', d)} \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
index 38e358f..aff2230 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly.inc
@@ -5,6 +5,8 @@ LICENSE_FLAGS = "commercial"
 
 DEPENDS += "gstreamer1.0-plugins-base libid3tag"
 
+inherit gettext
+
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     a52dec lame mad mpeg2dec \
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
index 18ed6cf..0a6ff80 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 
 DEPENDS = "gstreamer1.0 glib-2.0-native"
 
-inherit autotools pkgconfig gettext upstream-version-is-even
+inherit autotools pkgconfig upstream-version-is-even
 
 acpaths = "-I ${S}/common/m4 -I ${S}/m4"
 
-- 
2.1.0


