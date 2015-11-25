Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7088260620
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Nov 2015 21:33:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 25 Nov 2015 13:33:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,344,1444719600"; d="scan'208";a="859439374"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga002.jf.intel.com with ESMTP; 25 Nov 2015 13:33:35 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 25 Nov 2015 13:25:31 -0800
Message-Id: <1448486731-20166-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: jurobystricky@hotmail.com
Subject: [PATCH v2] psplash: update to latest git version
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
X-List-Received-Date: Wed, 25 Nov 2015 21:33:37 -0000

Latest git version contains various changes, including
fix for big endian RGB888 rendering. It also makes the patch:
"0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch"
unnecessary, as this patch has been upstreamed.

[YOCTO#7236]

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 ...Convert-psplash_fb_plot_pixel-to-a-static.patch | 53 ----------------------
 meta/recipes-core/psplash/psplash_git.bb           |  3 +-
 2 files changed, 1 insertion(+), 55 deletions(-)
 delete mode 100644 meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch

diff --git a/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch b/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
deleted file mode 100644
index 93b3c6b..0000000
--- a/meta/recipes-core/psplash/files/0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From 8f5de12cc75bfaa8400adf32f30c015d8f813540 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Sat, 22 Aug 2015 07:12:20 -0700
-Subject: [PATCH] psplash-fb: Convert psplash_fb_plot_pixel() to a static
- inline
-
-This function is not used outside psplash-fb.c and by making it
-static inline we keep the performance and also make it portable across
-multiple compilers and gcc versions
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
-Upstream-Status: Pending
-
- psplash-fb.c | 2 +-
- psplash-fb.h | 8 --------
- 2 files changed, 1 insertion(+), 9 deletions(-)
-
-diff --git a/psplash-fb.c b/psplash-fb.c
-index bd9cd9d..6d235db 100644
---- a/psplash-fb.c
-+++ b/psplash-fb.c
-@@ -260,7 +260,7 @@ psplash_fb_new (int angle)
- 
- #define OFFSET(fb,x,y) (((y) * (fb)->stride) + ((x) * ((fb)->bpp >> 3)))
- 
--inline void
-+static inline void
- psplash_fb_plot_pixel (PSplashFB    *fb,
- 		       int          x,
- 		       int          y,
-diff --git a/psplash-fb.h b/psplash-fb.h
-index 42592ed..c6c3144 100644
---- a/psplash-fb.h
-+++ b/psplash-fb.h
-@@ -57,14 +57,6 @@ psplash_fb_destroy (PSplashFB *fb);
- PSplashFB*
- psplash_fb_new (int angle);
- 
--inline void
--psplash_fb_plot_pixel (PSplashFB    *fb, 
--		       int          x, 
--		       int          y, 
--		       uint8        red,
--		       uint8        green,
--		       uint8        blue);
--
- void
- psplash_fb_draw_rect (PSplashFB    *fb, 
- 		      int          x, 
--- 
-2.1.4
-
diff --git a/meta/recipes-core/psplash/psplash_git.bb b/meta/recipes-core/psplash/psplash_git.bb
index b3b6479..0537426 100644
--- a/meta/recipes-core/psplash/psplash_git.bb
+++ b/meta/recipes-core/psplash/psplash_git.bb
@@ -5,12 +5,11 @@ SECTION = "base"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85bed78dd09dc7745c6"
 
-SRCREV = "14c8f7b705de944beb4de3f296506d80871e410f"
+SRCREV = "88343ad23c90fa1dd8d79ac0d784a691aa0c6d2b"
 PV = "0.1+git${SRCPV}"
 PR = "r15"
 
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
-           file://0001-psplash-fb-Convert-psplash_fb_plot_pixel-to-a-static.patch \
            file://psplash-init \
            ${SPLASH_IMAGES}"
 
-- 
1.9.1


