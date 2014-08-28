Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 63F5070281
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:30:29 +0000 (UTC)
Received: from svr-orw-fem-05.mgc.mentorg.com ([147.34.97.43])
	by relay1.mentorg.com with esmtp 
	id 1XMzmY-0000i5-J1 from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 28 Aug 2014 06:30:30 -0700
Received: from key-largo.mgc.mentorg.com (147.34.91.1) by
	svr-orw-fem-05.mgc.mentorg.com (147.34.97.43) with Microsoft SMTP
	Server id 14.2.247.3; Thu, 28 Aug 2014 06:30:29 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 09:30:28 -0400
Message-ID: <1409232628-3113-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] gstreamer: Set DEPENDS dynamically for plugins-ugly and plugins-bad
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
X-List-Received-Date: Thu, 28 Aug 2014 13:30:38 -0000
Content-Type: text/plain

Only add plugins-ugly or plugins-bad to the DEPENDS if they are
added to the COMMERCIAL_AUDIO_PLUGINS or COMMERCIAL_VIDEO_PLUGINS.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb     | 7 ++++++-
 meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb | 5 ++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
index 518ab72..039abe1 100644
--- a/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-meta-base_0.10.bb
@@ -1,6 +1,11 @@
 SUMMARY = "GStreamer package groups"
 LICENSE = "MIT"
-DEPENDS = "gstreamer gst-plugins-base gst-plugins-good gst-plugins-bad"
+
+COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
+DEPENDS_UGLY="${@'gst-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_BAD="${@'gst-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS = "gstreamer gst-plugins-base gst-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
+
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
index a703d9b..3ef10c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-meta-base.bb
@@ -3,7 +3,10 @@ LICENSE = "MIT"
 
 inherit packagegroup
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad"
+COMMERCIAL_PLUGINS = "${COMMERCIAL_AUDIO_PLUGINS} ${COMMERCIAL_VIDEO_PLUGINS}"
+DEPENDS_UGLY="${@'gstreamer1.0-plugins-ugly' if 'ugly' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS_BAD="${@'gstreamer1.0-plugins-bad' if 'bad' in COMMERCIAL_PLUGINS.split('-') else ''}"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good ${DEPENDS_UGLY} ${DEPENDS_BAD}"
 
 PACKAGES = "\
     gstreamer1.0-meta-base \
-- 
1.9.1


