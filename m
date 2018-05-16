Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DB08674609
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 08:40:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w4G8eath009898
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 01:40:36 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 16 May 2018 01:40:24 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 May 2018 16:09:38 +0800
Message-ID: <9fba7999731367d15272a033c57ef244adbfef06.1526458108.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <cover.1526458108.git.kai.kang@windriver.com>
References: <cover.1526458108.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] gstreamer1.0-plugins-good: enable PACKAGECONFIG gtk conditionally
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
X-List-Received-Date: Wed, 16 May 2018 08:40:36 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

PACKAGECONFIG 'gtk' is enabled by default for gstreamer1.0-plugins-good
and it makes gstreamer1.0-plugins-good depends on package gtk+3 which
requires any distro feature in ${GTK3DISTROFEATURES}. When none distro
feature is enabled from ${GTK3DISTROFEATURES}, it causes error:

| ERROR: Nothing PROVIDES 'gtk+3' (but .../meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
| DEPENDS on or otherwise requires it)
| gtk+3 was skipped: one of '['x11', 'wayland']' needs to be in DISTRO_FEATURES

So enable PACKAGECONFIG gtk conditionally for gstreamer1.0-plugins-good.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
index a420039fa85..b269fce1735 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.14.0.bb
@@ -27,7 +27,8 @@ inherit gettext
 PACKAGECONFIG ??= " \
     ${GSTREAMER_ORC} \
     ${@bb.utils.filter('DISTRO_FEATURES', 'pulseaudio x11', d)} \
-    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib gtk mpg123 lame \
+    ${@bb.utils.contains_any('DISTRO_FEATURES', d.getVar('GTK3DISTROFEATURES'), 'gtk', '', d)} \
+    cairo flac gdk-pixbuf gudev jpeg libpng soup speex taglib v4l2 bz2 zlib mpg123 lame \
 "
 
 X11DEPENDS = "virtual/libx11 libsm libxrender libxfixes libxdamage"
-- 
2.14.1


