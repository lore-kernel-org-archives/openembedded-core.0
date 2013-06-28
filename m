Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E967E6023E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 01:11:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5S1B6D0010565
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Jun 2013 18:11:06 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Thu, 27 Jun 2013 18:11:06 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 09:11:05 +0800
Message-ID: <391d4b34129e491a4ee0c6737369e8470c3b98ca.1372381458.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1372381458.git.rongqing.li@windriver.com>
References: <cover.1372381458.git.rongqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] xf86-video-intel: backport a patch to fix a compile failure
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
X-List-Received-Date: Fri, 28 Jun 2013 01:11:05 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

backport a patch to fix a compile failure when xorg-xserver's version
is less than 1.10

Signed-off-by: Roy.Li <rongqing.li@windriver.com>
---
 ...-compilation-error-with-xorg-xserver-1.10.patch |   31 ++++++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.21.9.bb         |    2 ++
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch
new file mode 100644
index 0000000..0d0d99f
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch
@@ -0,0 +1,31 @@
+From b5e85e495e55e2537d305b7bebacdf6f97b66199 Mon Sep 17 00:00:00 2001
+From: "Roy.Li" <rongqing.li@windriver.com>
+Date: Thu, 27 Jun 2013 14:10:14 +0800
+Subject: [PATCH] uxa: fix the compilation error with xorg-xserver <= 1.10
+
+Upstream-Status: Backported
+
+struct _Screen has no canDoBGNoneRoot when ABI_VIDEODRV_VERSION is less than 10.0
+
+Signed-off-by: Roy.Li <rongqing.li@windriver.com>
+---
+ src/intel_display.c |    2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/intel_display.c b/src/intel_display.c
+index 17168e5..0acb86d 100644
+--- a/src/intel_display.c
++++ b/src/intel_display.c
+@@ -2113,7 +2113,9 @@ void intel_copy_fb(ScrnInfoPtr scrn)
+ 				0, 0,
+ 				scrn->virtualX, scrn->virtualY);
+ 	intel->uxa_driver->done_copy(dst);
++#if ABI_VIDEODRV_VERSION >= SET_ABI_VERSION(10, 0)
+ 	pScreen->canDoBGNoneRoot = TRUE;
++#endif
+ 
+ cleanup_dst:
+ 	(*pScreen->DestroyPixmap)(dst);
+-- 
+1.7.10.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
index 6112089..01c767b 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.21.9.bb
@@ -12,6 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 DEPENDS += "virtual/libx11 drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess udev"
 
+SRC_URI += "file://0001-uxa-fix-the-compilation-error-with-xorg-xserver-1.10.patch"
+
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-- 
1.7.10.4


