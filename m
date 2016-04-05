Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id B1CC1770D8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Apr 2016 19:17:23 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Apr 2016 12:17:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,445,1455004800"; d="scan'208";a="948697003"
Received: from desmith4-mobl.amr.corp.intel.com (HELO swold-mobl.jf.intel.com)
	([10.254.118.184])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2016 12:17:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue,  5 Apr 2016 12:17:22 -0700
Message-Id: <1459883842-21834-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] xf86-video-intel: Add patch to fix some poor image quality
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
X-List-Received-Date: Tue, 05 Apr 2016 19:17:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This fixes a problem on the Intel Gen8 Graphics and is backport from
the upstream master of xf86-video-intel driver code

[YOCTO #8587]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../0001-gen8-Fix-the-YUV-RGB-shader.patch         | 65 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.99.917.bb       |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
new file mode 100644
index 0000000..3576219
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-gen8-Fix-the-YUV-RGB-shader.patch
@@ -0,0 +1,65 @@
+From c43617b739e358064396912c7a7a8028ca91d201 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
+Date: Thu, 16 Apr 2015 20:40:39 +0300
+Subject: [PATCH] gen8: Fix the YUV->RGB shader
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Use the correct register (Yn_01) with first half of the
+Y samples instead of using the register (Yn_23) with the
+second half twice when computing the green channel.
+
+Also use the Yn_01 register name instead of Yn for the red
+channel as well, just for a bit of extra consistency.
+
+Bugzilla: https://bugs.freedesktop.org/show_bug.cgi?id=89807
+Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
+Tested-by: Chris Wilson <chris@chris-wilson.co.uk>
+
+Upstream-Status: Backport
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+---
+ src/render_program/exa_wm_yuv_rgb.g8a | 4 ++--
+ src/render_program/exa_wm_yuv_rgb.g8b | 2 +-
+ 2 files changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/src/render_program/exa_wm_yuv_rgb.g8a b/src/render_program/exa_wm_yuv_rgb.g8a
+index 7def093..34973ba 100644
+--- a/src/render_program/exa_wm_yuv_rgb.g8a
++++ b/src/render_program/exa_wm_yuv_rgb.g8a
+@@ -76,7 +76,7 @@ add (16)    Cbn<1>F		Cb<8,8,1>F	-0.501961F  { compr align1 };
+     /* 
+      * R = Y + Cr * 1.596
+      */
+-mov (8)    acc0<1>F		Yn<8,8,1>F		    { compr align1 };
++mov (8)    acc0<1>F		Yn_01<8,8,1>F		    { compr align1 };
+ mac.sat(8) src_sample_r_01<1>F	Crn_01<8,8,1>F	1.596F	    { compr align1 };
+      
+ mov (8)    acc0<1>F		Yn_23<8,8,1>F		    { compr align1 };
+@@ -84,7 +84,7 @@ mac.sat(8) src_sample_r_23<1>F	Crn_23<8,8,1>F	1.596F	    { compr align1 };
+     /*
+      * G = Crn * -0.813 + Cbn * -0.392 + Y
+      */
+-mov (8)    acc0<1>F		Yn_23<8,8,1>F		    { compr align1 };
++mov (8)    acc0<1>F		Yn_01<8,8,1>F		    { compr align1 };
+ mac (8)    acc0<1>F		Crn_01<8,8,1>F    	-0.813F	    { compr align1 };
+ mac.sat(8) src_sample_g_01<1>F	Cbn_01<8,8,1>F    	-0.392F	    { compr align1 };
+ 
+diff --git a/src/render_program/exa_wm_yuv_rgb.g8b b/src/render_program/exa_wm_yuv_rgb.g8b
+index 4494953..2cd6fc4 100644
+--- a/src/render_program/exa_wm_yuv_rgb.g8b
++++ b/src/render_program/exa_wm_yuv_rgb.g8b
+@@ -6,7 +6,7 @@
+    { 0x80600048, 0x21c03ae8, 0x3e8d02c0, 0x3fcc49ba },
+    { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
+    { 0x80600048, 0x21e03ae8, 0x3e8d02e0, 0x3fcc49ba },
+-   { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
++   { 0x00600001, 0x24003ae0, 0x008d0300, 0x00000000 },
+    { 0x00600048, 0x24003ae0, 0x3e8d02c0, 0xbf5020c5 },
+    { 0x80600048, 0x22003ae8, 0x3e8d0340, 0xbec8b439 },
+    { 0x00600001, 0x24003ae0, 0x008d0320, 0x00000000 },
+-- 
+2.5.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index f412556..d75b44f 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -14,6 +14,7 @@ SRC_URI += "file://disable-x11-dri3.patch \
             file://sna-Protect-against-ABI-breakage-in-recent-versions-.patch \
             file://udev-fstat.patch \
             file://0001-uxa-fix-the-call-to-PixmapSyncDirtyHelper-broken-by-.patch \
+            file://0001-gen8-Fix-the-YUV-RGB-shader.patch \
            "
 
 SRC_URI[md5sum] = "fa196a66e52c0c624fe5d350af7a5e7b"
-- 
2.5.0


