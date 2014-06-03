Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E643A60E23
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Jun 2014 00:23:45 +0000 (UTC)
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1WrcW3-0002F8-7y from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jun 2014 17:23:47 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Mon, 2 Jun 2014 17:23:40 -0700
Received: from key-largo.mgc.mentorg.com ([172.30.4.192]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Mon, 2 Jun 2014 17:23:39 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jun 2014 20:23:36 -0400
Message-Id: <1401755018-9951-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.9.1
X-OriginalArrivalTime: 03 Jun 2014 00:23:40.0032 (UTC)
	FILETIME=[118E3000:01CF7EC2]
Subject: [PATCH 1/3] mesa-demos: Build with system data files
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
X-List-Received-Date: Tue, 03 Jun 2014 00:23:46 -0000

Use the "--with-system-data-files" when configuring mesa-demos
so that the data files in /usr/share/mesa-demos/ will be properly
located at run time.

Copy some additional data files into the target filesystem.

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
index 7cda19e..972ead3 100644
--- a/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
+++ b/meta/recipes-graphics/mesa/mesa-demos_8.1.0.bb
@@ -27,6 +27,8 @@ PACKAGECONFIG ?= "drm osmesa freetype2 gbm egl gles1 gles2 \
 # The Wayland code doesn't work with Wayland 1.0, so disable it for now
 #${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
 
+EXTRA_OECONF = "--with-system-data-files"
+
 PACKAGECONFIG[drm] = "--enable-libdrm,--disable-libdrm,libdrm"
 PACKAGECONFIG[egl] = "--enable-egl,--disable-egl,virtual/egl"
 PACKAGECONFIG[freetype2] = "--enable-freetype2,--disable-freetype2,freetype"
@@ -38,3 +40,12 @@ PACKAGECONFIG[osmesa] = "--enable-osmesa,--disable-osmesa,"
 PACKAGECONFIG[vg] = "--enable-vg,--disable-vg,virtual/libvg"
 PACKAGECONFIG[wayland] = "--enable-wayland,--disable-wayland,virtual/libgl wayland"
 PACKAGECONFIG[x11] = "--enable-x11,--disable-x11,virtual/libx11"
+
+do_install_append () {
+    install -m 0644 ${S}/src/perf/*.frag \
+                    ${S}/src/perf/*.vert \
+                    ${S}/src/glsl/*.frag \
+                    ${S}/src/glsl/*.vert \
+                    ${S}/src/glsl/*.geom \
+                    ${S}/src/glsl/*.glsl ${D}${datadir}/${BPN}
+}
-- 
1.9.1


