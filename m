Return-Path: <net147@gmail.com>
Received: from mail-pb0-f51.google.com (mail-pb0-f51.google.com
	[209.85.160.51])
	by mail.openembedded.org (Postfix) with ESMTP id C6F7B608F7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 09:53:52 +0000 (UTC)
Received: by mail-pb0-f51.google.com with SMTP id jt11so1931209pbb.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 02:53:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6rv8nn0a7KplzC5cLvc/RdyJFmcG/TKNjlzGo6l4/Nk=;
	b=EqR0ItpgzFCarp6AJ0kKsPSW5nq/FhBWNHWJ2lM8Vp8cbtoIfHwdHRy3Ns0xjJhG9L
	7t1JxnhSh3KNBogNDy6kYNLClN9wIgUgaDiu913HG3MbHumGkyD0IeRopnreF4qVSSvU
	QIm2TWNamBDU0vH/Lc4cvqwUYhHMOklE8436dP4S37H2XcdxZaBmeLiViVVNiLYZp1mV
	N05gVm5t2YMBj8KSrDYCG2ddI9Kp8InB4la81JWK4lhYUYLSW4no4ibOAwRkyu7XaJRn
	la8askjHeY3SM6b4Nj7sBYpIBD1uLCFrCyMS23iEeHwrGv9a748Ol0NB0xHqzJJJNAI8
	RGbA==
X-Received: by 10.66.20.66 with SMTP id l2mr12495685pae.205.1369994033927;
	Fri, 31 May 2013 02:53:53 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	ag4sm46016339pbc.20.2013.05.31.02.53.51 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 02:53:53 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 20:07:34 +1000
Message-Id: <1369994854-22597-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3
Subject: [PATCH] xf86-video-modesetting: backport fix for graphics corruption
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
X-List-Received-Date: Fri, 31 May 2013 09:53:52 -0000

This fixes graphics corruption that can occur when using 32 bpp pixmaps
with 24 bpp framebuffer.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 ...ort-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch | 31 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-modesetting_0.7.0.bb    |  2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
new file mode 100644
index 0000000..c351757
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting/support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch
@@ -0,0 +1,31 @@
+Upstream-Status: Backport
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+From cba29fd8c2f605ed66718aa3a6b5833deb5d4cf9 Mon Sep 17 00:00:00 2001
+From: Maarten Lankhorst <maarten.lankhorst@canonical.com>
+Date: Wed, 3 Apr 2013 12:08:44 +0200
+Subject: [PATCH] support 32 bpp pixmaps when 24 bpp fb is used.
+
+Fixes background corruption in ubuntu.
+
+Signed-off-by: Maarten Lankhorst <maarten.lankhorst@canonical.com>
+---
+ src/driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/driver.c b/src/driver.c
+index 06d6d53..742aadd 100644
+--- a/src/driver.c
++++ b/src/driver.c
+@@ -650,7 +650,7 @@ PreInit(ScrnInfoPtr pScrn, int flags)
+ #endif
+     drmmode_get_default_bpp(pScrn, &ms->drmmode, &defaultdepth, &defaultbpp);
+     if (defaultdepth == 24 && defaultbpp == 24)
+-	    bppflags = Support24bppFb;
++	    bppflags = SupportConvert32to24 | Support24bppFb;
+     else
+ 	    bppflags = PreferConvert24to32 | SupportConvert24to32 | Support32bppFb;
+     
+-- 
+1.8.3
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
index e45703f..9f43402 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-modesetting_0.7.0.bb
@@ -3,5 +3,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=5e53d3fcadb1c23d122ad63cb099a918"
 
 DESCRIPTION = "X.Org X server -- modesetting display driver"
 
+SRC_URI += "file://support-32-bpp-pixmaps-when-24-bpp-fb-is-used.patch"
+
 SRC_URI[md5sum] = "38e64eb09cef9bdf1de400bbe9818321"
 SRC_URI[sha256sum] = "2bc55f776eaee7b4e13df13238d36c4facf1cdca095a11519baf2376f5c996ac"
-- 
1.8.3


