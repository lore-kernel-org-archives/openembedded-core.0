Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbheO-0005el-Df
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:01:50 +0100
Received: by mail-ee0-f47.google.com with SMTP id l10so4771205eei.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 16:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=0QjGGaCIIlTInMY1vvDuN8LQWICzKoruQjkZsbKTkV4=;
	b=JRdmf2wLvpQy1PNiegrMPmskHPpI3gnyNKeohIUEw08c7PnyEF5Q0kZebbqnEhS8fg
	NLc50JLmUu12QZxaQIfKXQmDs8QUxk2jWzKW+bZWkFzs1/3OKpqq88ifXTDpKFimcCC2
	XjlCOFOKqVDtq/903u5clJtNQ45JYuvEmh0CGQiMBlfg5ZoOhrGikuCpcEhgu71Ck/SO
	/8unq6tn9Za7ZfUhfmk/TQ58N7s3YwR17Y5gr0fy0ifmVTBAUkXMOnGaRPcfNZX9LE+B
	LpspqMXGDWGHyQX6hL4PBdRkzavTJdL9r+SE9CFCEEVDZ0HTEwFQj/r8N5V0y3mZj4T+
	TZZw==
Received: by 10.14.193.136 with SMTP id k8mr6999431een.30.1353631663608;
	Thu, 22 Nov 2012 16:47:43 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id a45sm9682217eep.16.2012.11.22.16.47.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 16:47:43 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 01:47:17 +0100
Message-Id: <22cd7742fe2379b66f9a4398a5d89519a4e16066.1353631583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 3/4] xf86-video-omapfb: revive driver which actually works and is tested on real devices
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Nov 2012 01:01:50 -0000

* 0006-omapfb-port-to-new-xserver-video-API.patch added to port it to
  new xserver video API
* other patches just updated headers to be able to git am them

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 ...a-large-CRTC-upper-limit-to-not-prune-lar.patch |  41 +++
 ...virtual-size-when-configuring-framebuffer.patch |  32 ++
 .../xf86-video-omapfb/0003-force-plain-mode.patch  |  31 ++
 .../xf86-video-omapfb/0004-blacklist-tv-out.patch  |  33 +++
 .../0005-Attempt-to-fix-VRFB.patch                 | 325 +++++++++++++++++++++
 ...0006-omapfb-port-to-new-xserver-video-API.patch | 272 +++++++++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |  33 +++
 7 files changed, 767 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
new file mode 100644
index 0000000..9fb01d4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch
@@ -0,0 +1,41 @@
+From 8fb7d0f99d4afbb574b30cb4f1e66a8f89d94ad5 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 26 Jan 2011 12:04:36 +0100
+Subject: [PATCH 1/6] Revert "Set a large CRTC upper limit to not prune larger
+ resolutions"
+
+Picture is garbled after switching resolutions, so revert it.
+Virtual size too big, revert the commit 9c4d7592dcb7dc20a48a6f941d9d94bd73d34153.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/omapfb-crtc.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
+index 9aaa52f..cbeff35 100644
+--- a/src/omapfb-crtc.c
++++ b/src/omapfb-crtc.c
+@@ -190,13 +190,13 @@ OMAPFBCRTCInit(ScrnInfoPtr pScrn)
+ 	 * In practise, this doesn't seem to be supported.
+ 	 * (no way to setup the overlay offset/base address)
+ 	 */
+-	 /* FIXME: figure out what makes sense here. A known max resolution?
+-	  * framebuffer size?
+-	  */
+ 	xf86CrtcSetSizeRange(pScrn,
+-	                     8, 8, 2048, 2048);
++	                     8, 8,
++	                     ofb->state_info.xres_virtual,
++	                     ofb->state_info.yres_virtual);
+ 
+ 	ofb->crtc = xf86CrtcCreate(pScrn, &OMAPFBCrtcFuncs);
++
+ }
+ 
+ 
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
new file mode 100644
index 0000000..683a989
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch
@@ -0,0 +1,32 @@
+From 855c333ac0d16350f895f1d1b9391e9cbb0b6db4 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 26 Jan 2011 13:27:20 +0100
+Subject: [PATCH 2/6] Revert "Set virtual size when configuring framebuffer"
+
+Virtual size too big, so revert it.
+
+This reverts commit 2653ef07883fbd1a5e7025f9300cf89b79ba429a.
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/omapfb-crtc.c | 2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/omapfb-crtc.c b/src/omapfb-crtc.c
+index cbeff35..9655db2 100644
+--- a/src/omapfb-crtc.c
++++ b/src/omapfb-crtc.c
+@@ -98,8 +98,6 @@ OMAPFBCrtcCommitChangeMode (xf86CrtcPtr crtc)
+ 	v = ofb->state_info;
+ 	v.xres = mode->HDisplay;
+ 	v.yres = mode->VDisplay;
+-	v.xres_virtual = crtc->scrn->virtualX;
+-	v.yres_virtual = crtc->scrn->virtualY;
+ 	v.activate = FB_ACTIVATE_NOW;
+ 	v.pixclock = KHZ2PICOS(mode->Clock ? mode->Clock : 56000);
+ 	v.left_margin = mode->HTotal - mode->HSyncEnd;
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
new file mode 100644
index 0000000..67ea7c1
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0003-force-plain-mode.patch
@@ -0,0 +1,31 @@
+From 252f44c072d3447a32127fc9afe5d0d40f3c510e Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 26 Jan 2011 13:20:20 +0100
+Subject: [PATCH 3/6] force 'plain' mode
+
+The new DSS mode breaks XV, so force plain mode
+
+Upstream-Status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/omapfb-driver.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
+index 018e040..48aa09c 100644
+--- a/src/omapfb-driver.c
++++ b/src/omapfb-driver.c
+@@ -326,7 +326,7 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
+ 	OMAPFBProbeController(ofb->ctrl_name);
+ 
+ 	/* Do we have the DSS kernel API? */
+-	if (stat(SYSFS_DSS_DIR, &st) == 0) {
++	if (0) { //stat(SYSFS_DSS_DIR, &st) == 0) {
+ 		ofb->dss = TRUE;
+ 	} else {
+ 		ofb->dss = FALSE;
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
new file mode 100644
index 0000000..b0ac9a4
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0004-blacklist-tv-out.patch
@@ -0,0 +1,33 @@
+From cfa46b67f59115f6d8ef9414af60380749ff3eb3 Mon Sep 17 00:00:00 2001
+From: Koen Kooi <koen@dominion.thruhere.net>
+Date: Wed, 26 Jan 2011 13:21:12 +0100
+Subject: [PATCH 4/6] blacklist tv out
+
+The tv-out gets added last and the driver tries to reconfigure dvi to TV resolutions, which fails. so blacklist it
+
+Upstream-Status: Pending
+
+Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/omapfb-output-dss.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/omapfb-output-dss.c b/src/omapfb-output-dss.c
+index 6cc52de..83cb711 100644
+--- a/src/omapfb-output-dss.c
++++ b/src/omapfb-output-dss.c
+@@ -205,6 +205,10 @@ OMAPFBDSSOutputDetect (xf86OutputPtr output)
+ 	if(ofb->timings[idx][0] == '\0')
+ 		return XF86OutputStatusDisconnected;
+ 
++	// Hack to disable the tv out
++	if (strncmp(output->name, "tv", 2) == 0)
++		return XF86OutputStatusDisconnected;
++
+ 	return XF86OutputStatusConnected;
+ }
+ 
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
new file mode 100644
index 0000000..67b2840
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0005-Attempt-to-fix-VRFB.patch
@@ -0,0 +1,325 @@
+From 8b1f697a60e35ab82fffdabfaefdb45e9a9df379 Mon Sep 17 00:00:00 2001
+From: Eino-Ville Talvala <talvala@stanford.edu>
+Date: Tue, 23 Aug 2011 18:37:01 +0200
+Subject: [PATCH 5/6] Attempt to fix VRFB
+
+Upstream-Status: Pending
+
+http://dominion.thruhere.net/git/cgit.cgi/xf86-video-omapfb/commit/?h=koen/fixups&id=6833fc9f795265e4943d248103fbaf3463b515d6
+
+Signed-off-by: Sebastian Krzyszkowiak <dos@dosowisko.net>
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/image-format-conversions.c |  4 +--
+ src/image-format-conversions.h |  2 +-
+ src/omapfb-driver.c            | 28 +++++++++++++---
+ src/omapfb-xv-blizzard.c       |  1 +
+ src/omapfb-xv-generic.c        | 72 +++++++++++++++++++++++++++++++++---------
+ src/omapfb-xv.c                |  3 ++
+ 6 files changed, 88 insertions(+), 22 deletions(-)
+
+diff --git a/src/image-format-conversions.c b/src/image-format-conversions.c
+index dcefa9b..d43427d 100644
+--- a/src/image-format-conversions.c
++++ b/src/image-format-conversions.c
+@@ -38,13 +38,13 @@
+ #include "image-format-conversions.h"
+ 
+ /* Basic line-based copy for packed formats */
+-void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest)
++void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest)
+ {
+ 	int i;
+ 	int len = w * 2;
+ 	for (i = 0; i < h; i++)
+ 	{
+-		memcpy(dest + i * len, src + i * stride, len);
++		memcpy(dest + i * dst_stride, src + i * src_stride, len);
+ 	}
+ }
+ 
+diff --git a/src/image-format-conversions.h b/src/image-format-conversions.h
+index 584896a..ba7caf2 100644
+--- a/src/image-format-conversions.h
++++ b/src/image-format-conversions.h
+@@ -27,7 +27,7 @@
+ #include <stdint.h>
+ 
+ /* Basic line-based copy for packed formats */
+-void packed_line_copy(int w, int h, int stride, uint8_t *src, uint8_t *dest);
++void packed_line_copy(int w, int h, int src_stride, int dst_stride, uint8_t *src, uint8_t *dest);
+ 
+ /* Basic C implementation of YV12/I420 to UYVY conversion */
+ void uv12_to_uyvy(int w, int h, int y_pitch, int uv_pitch, uint8_t *y_p, uint8_t *u_p, uint8_t *v_p, uint8_t *dest);
+diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
+index 48aa09c..07989f5 100644
+--- a/src/omapfb-driver.c
++++ b/src/omapfb-driver.c
+@@ -66,6 +66,7 @@
+ #define OMAPFB_VERSION 1000
+ #define OMAPFB_DRIVER_NAME "OMAPFB"
+ #define OMAPFB_NAME "omapfb"
++#define ENFORCE_MODES
+ 
+ static Bool OMAPFBProbe(DriverPtr drv, int flags);
+ static Bool OMAPFBPreInit(ScrnInfoPtr pScrn, int flags);
+@@ -105,11 +106,13 @@ static SymTabRec OMAPFBChipsets[] = {
+ typedef enum {
+ 	OPTION_ACCELMETHOD,
+ 	OPTION_FB,
++	OPTION_ROTATE,
+ } FBDevOpts;
+ 
+ static const OptionInfoRec OMAPFBOptions[] = {
+ 	{ OPTION_ACCELMETHOD,	"AccelMethod",	OPTV_STRING,	{0},	FALSE },
+ 	{ OPTION_FB,		"fb",		OPTV_STRING,	{0},	FALSE },
++	{ OPTION_ROTATE,	"rotation",	OPTV_STRING,	{0},	FALSE },
+ 	{ -1,			NULL,		OPTV_NONE,	{0},	FALSE }
+ };
+ 
+@@ -286,6 +289,7 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
+ {
+ 	OMAPFBPtr ofb;
+ 	EntityInfoPtr pEnt;
++	char *rotate;
+ 	rgb zeros = { 0, 0, 0 };
+ 	struct stat st;
+ 
+@@ -379,6 +383,8 @@ OMAPFBPreInit(ScrnInfoPtr pScrn, int flags)
+ 	pScrn->progClock = TRUE;
+ 	pScrn->chipset   = "omapfb";
+ 	
++	xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Rotate test version 0.02\n");
++	
+ 	/* Start with configured virtual size */
+ 	pScrn->virtualX = pScrn->display->virtualX;
+ 	pScrn->virtualY = pScrn->display->virtualY;
+@@ -496,12 +502,21 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	ofb->CloseScreen = pScreen->CloseScreen;
+ 	pScreen->CloseScreen = OMAPFBCloseScreen;
+ 
++	/* Enforce the default mode (this is silly I guess) */
++#ifdef ENFORCE_MODES
++	//xf86DrvMsg(pScrn->scrnIndex, X_INFO, "Enforcing modes\n");
++	//set_mode(ofb, &ofb->default_mode);
++	//pScrn->displayWidth = ofb->fixed_info.line_length /
++	//  (ofb->state_info.bits_per_pixel>>3); //ofb->state_info.xres;
++#endif
++
+ 	/* Map our framebuffer memory */
++	ofb->mem_info.size = ofb->fixed_info.line_length * ofb->state_info.yres;
+ 	ofb->fb = mmap (NULL, ofb->mem_info.size,
+ 	                PROT_READ | PROT_WRITE, MAP_SHARED,
+ 	                ofb->fd, 0);
+-	if (ofb->fb == NULL) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed\n");
++	if (ofb->fb == MAP_FAILED) {
++		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
+ 		return FALSE;
+ 	}
+ 
+@@ -578,8 +593,13 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	} else if (!ofb->dss) {
+ 
+ 		ofb->plane_info.enabled = 1;
+-		ofb->plane_info.out_width = ofb->state_info.xres;
+-		ofb->plane_info.out_height = ofb->state_info.yres;
++		if (ofb->state_info.rotate == 0 || ofb->state_info.rotate == 2) {
++			ofb->plane_info.out_width = ofb->state_info.xres;
++			ofb->plane_info.out_height = ofb->state_info.yres;
++		} else {
++			ofb->plane_info.out_width = ofb->state_info.yres;
++			ofb->plane_info.out_height = ofb->state_info.xres;
++		}
+ 
+ 		if (ioctl (ofb->fd, OMAPFB_SETUP_PLANE, &ofb->plane_info)) {
+ 			xf86DrvMsg(scrnIndex, X_ERROR,
+diff --git a/src/omapfb-xv-blizzard.c b/src/omapfb-xv-blizzard.c
+index 406ffc6..b71d2aa 100644
+--- a/src/omapfb-xv-blizzard.c
++++ b/src/omapfb-xv-blizzard.c
+@@ -220,6 +220,7 @@ int OMAPFBXVPutImageBlizzard (ScrnInfoPtr pScrn,
+ 			packed_line_copy(src_w & ~3,
+ 			                 src_h & ~3,
+ 			                 ((src_w + 1) & ~1) * 2,
++					 ofb->port->fixed_info.line_length,
+ 			                 (uint8_t*)buf,
+ 			                 (uint8_t*)ofb->port->fb);
+ 			break;
+diff --git a/src/omapfb-xv-generic.c b/src/omapfb-xv-generic.c
+index e6f89fe..b33f344 100644
+--- a/src/omapfb-xv-generic.c
++++ b/src/omapfb-xv-generic.c
+@@ -62,7 +62,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
+ 
+-	/* The memory size is already set in OMAPFBXVQueryImageAttributes */
++	/* The memory size is already set before we get here */
+ 	if (ioctl(ofb->port->fd, OMAPFB_SETUP_MEM, &ofb->port->mem_info) != 0) {
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "Failed to allocate video plane memory\n");
+@@ -73,19 +73,20 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ 	ofb->port->fb = mmap (NULL, ofb->port->mem_info.size,
+ 	                PROT_READ | PROT_WRITE, MAP_SHARED,
+ 	                ofb->port->fd, 0);
+-	if (ofb->port->fb == NULL) {
++	if (ofb->port->fb == MAP_FAILED) {
+ 		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "Mapping video memory failed\n");
+ 		return XvBadAlloc;
+ 	}
+ 
+ 	/* Update the state info */
++	/* Let's not - it's bad
+ 	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
+ 	{
+ 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
+ 		return XvBadAlloc;
+ 	}
+-
++	*/
+ 	return Success;
+ }
+ 
+@@ -93,6 +94,7 @@ int OMAPXVAllocPlane(ScrnInfoPtr pScrn)
+ int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
++	int ret;
+ 
+ 	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
+ 	{
+@@ -104,6 +106,31 @@ int OMAPXVSetupVideoPlane(ScrnInfoPtr pScrn)
+ 		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
+ 		return XvBadAlloc;
+ 	}
++	/* Changing rotation/nonstd flags can change the fixed info! */
++	if (ioctl (ofb->port->fd, FBIOGET_FSCREENINFO, &ofb->port->fixed_info))
++	{
++		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
++	/* Correct fixed info requires recalculation of needed memory */
++	ofb->port->mem_info.size = ofb->port->fixed_info.line_length * ofb->port->state_info.yres;
++
++	/* Allocate buffer memory */
++	ret = OMAPXVAllocPlane(pScrn);
++	if (ret != Success)
++		return ret;
++
++	/* Workaround for reset of mode after memory allo */
++	if (ioctl (ofb->port->fd, FBIOPUT_VSCREENINFO, &ofb->port->state_info))
++	{
++		xf86Msg(X_ERROR, "%s: setting state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
++	if (ioctl (ofb->port->fd, FBIOGET_VSCREENINFO, &ofb->port->state_info))
++	{
++		xf86Msg(X_ERROR, "%s: Reading state info failed\n", __FUNCTION__);
++		return XvBadAlloc;
++	}
+ 
+ 	if(ioctl(ofb->port->fd, OMAPFB_SETUP_PLANE,
+ 	   &ofb->port->plane_info) != 0) {
+@@ -124,6 +151,8 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+                              DrawablePtr pDraw)
+ {
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
++	short drw_temp;
++	short rot_xres, rot_yres;
+ 
+ 	if (!ofb->port->plane_info.enabled
+ 	 || ofb->port->update_window.x != src_x
+@@ -163,13 +192,6 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 			return Success;
+ 		}
+ 
+-		/* If we don't have the plane running, enable it */
+-		if (!ofb->port->plane_info.enabled) {
+-			ret = OMAPXVAllocPlane(pScrn);
+-			if (ret != Success)
+-				return ret;
+-		}
+-
+ 		/* Set up the state info, xres and yres will be used for
+ 		 * scaling to the values in the plane info struct
+ 		 */
+@@ -179,12 +201,31 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 		ofb->port->state_info.yres_virtual = 0;
+ 		ofb->port->state_info.xoffset = 0;
+ 		ofb->port->state_info.yoffset = 0;
+-		ofb->port->state_info.rotate = 0;
++		//ofb->port->state_info.rotate = 0;
+ 		ofb->port->state_info.grayscale = 0;
+ 		ofb->port->state_info.activate = FB_ACTIVATE_NOW;
+ 		ofb->port->state_info.bits_per_pixel = 0;
+ 		ofb->port->state_info.nonstd = xv_to_omapfb_format(image);
+ 
++		/* Plane info does not rotate with state_info */
++		if (ofb->port->state_info.rotate == 1 ||
++		  ofb->port->state_info.rotate == 3) {
++			drw_temp = drw_x;
++			drw_x = drw_y;
++			drw_y = drw_temp;
++
++			drw_temp = drw_w;
++			drw_w = drw_h;
++			drw_h = drw_temp;
++
++			rot_xres = ofb->port->state_info.yres;
++			rot_yres = ofb->port->state_info.xres;
++		} else {
++			rot_xres = ofb->port->state_info.xres;
++			rot_yres = ofb->port->state_info.yres;
++		}
++
++
+ 		/* Set up the video plane info */
+ 		ofb->port->plane_info.enabled = 1;
+ 		ofb->port->plane_info.pos_x = drw_x;
+@@ -193,13 +234,13 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 		ofb->port->plane_info.out_height = drw_h & ~15;
+ 
+ 		/* Cap output to screen size */
+-		if (ofb->port->plane_info.out_width > ofb->state_info.xres) {
++		if (ofb->port->plane_info.out_width > rot_xres) {
+ 			ofb->port->plane_info.pos_x = 0;
+-			ofb->port->plane_info.out_width = ofb->state_info.xres;
++			ofb->port->plane_info.out_width = rot_xres;
+ 		}
+-		if (ofb->port->plane_info.out_height > ofb->state_info.yres) {
++		if (ofb->port->plane_info.out_height > rot_yres) {
+ 			ofb->port->plane_info.pos_y = 0;
+-			ofb->port->plane_info.out_height = ofb->state_info.yres;
++			ofb->port->plane_info.out_height = rot_yres;
+ 		}
+ 
+ 		ret = OMAPXVSetupVideoPlane(pScrn);
+@@ -223,6 +264,7 @@ int OMAPFBXVPutImageGeneric (ScrnInfoPtr pScrn,
+ 			packed_line_copy(src_w & ~15,
+ 			                 src_h & ~15,
+ 			                 ((src_w + 1) & ~1) * 2,
++			                 ofb->port->fixed_info.line_length,
+ 			                 (uint8_t*)buf,
+ 			                 (uint8_t*)ofb->port->fb);
+ 			break;
+diff --git a/src/omapfb-xv.c b/src/omapfb-xv.c
+index 1df651e..0fee2c6 100644
+--- a/src/omapfb-xv.c
++++ b/src/omapfb-xv.c
+@@ -169,8 +169,11 @@ static int OMAPFBXVQueryImageAttributes (ScrnInfoPtr pScrn,
+ 	h = *height;
+ 
+ 	w = (w + 1) & ~1;
++
++	/* Can't calculate these here - don't know line length
+ 	ofb->port->mem_info.size = w << 1;
+ 	ofb->port->mem_info.size *= h;
++	*/
+ 
+ 	return size;
+ }
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
new file mode 100644
index 0000000..d567299
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0006-omapfb-port-to-new-xserver-video-API.patch
@@ -0,0 +1,272 @@
+From 803ecf2909949e6152f4a81b6cbb92a4430679ac Mon Sep 17 00:00:00 2001
+From: Martin Jansa <Martin.Jansa@gmail.com>
+Date: Fri, 23 Nov 2012 00:31:06 +0100
+Subject: [PATCH 6/6] omapfb: port to new xserver video API
+
+Upstream-Status: Pending
+
+Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
+---
+ src/compat-api.h    | 96 +++++++++++++++++++++++++++++++++++++++++++++++++++++
+ src/omapfb-driver.c | 41 ++++++++++++-----------
+ 2 files changed, 118 insertions(+), 19 deletions(-)
+ create mode 100644 src/compat-api.h
+
+diff --git a/src/compat-api.h b/src/compat-api.h
+new file mode 100644
+index 0000000..b1591b1
+--- /dev/null
++++ b/src/compat-api.h
+@@ -0,0 +1,96 @@
++/*
++ * Copyright 2012 Red Hat, Inc.
++ *
++ * Permission is hereby granted, free of charge, to any person obtaining a
++ * copy of this software and associated documentation files (the "Software"),
++ * to deal in the Software without restriction, including without limitation
++ * the rights to use, copy, modify, merge, publish, distribute, sublicense,
++ * and/or sell copies of the Software, and to permit persons to whom the
++ * Software is furnished to do so, subject to the following conditions:
++ *
++ * The above copyright notice and this permission notice (including the next
++ * paragraph) shall be included in all copies or substantial portions of the
++ * Software.
++ *
++ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
++ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
++ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
++ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
++ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
++ * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
++ * DEALINGS IN THE SOFTWARE.
++ *
++ * Author: Dave Airlie <airlied@redhat.com>
++ */
++
++/* this file provides API compat between server post 1.13 and pre it,
++   it should be reused inside as many drivers as possible */
++#ifndef COMPAT_API_H
++#define COMPAT_API_H
++
++#ifndef GLYPH_HAS_GLYPH_PICTURE_ACCESSOR
++#define GetGlyphPicture(g, s) GlyphPicture((g))[(s)->myNum]
++#define SetGlyphPicture(g, s, p) GlyphPicture((g))[(s)->myNum] = p
++#endif
++
++#ifndef XF86_HAS_SCRN_CONV
++#define xf86ScreenToScrn(s) xf86Screens[(s)->myNum]
++#define xf86ScrnToScreen(s) screenInfo.screens[(s)->scrnIndex]
++#endif
++
++#ifndef XF86_SCRN_INTERFACE
++
++#define SCRN_ARG_TYPE int
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = xf86Screens[(arg1)]
++
++#define SCREEN_ARG_TYPE int
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = screenInfo.screens[(arg1)]
++
++#define SCREEN_INIT_ARGS_DECL int index, ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL int arg, pointer blockData, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, blockData, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL int scrnIndex, ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS scrnIndex, pScreen
++
++#define ADJUST_FRAME_ARGS_DECL int arg, int x, int y, int flags
++
++#define SWITCH_MODE_ARGS_DECL int arg, DisplayModePtr mode, int flags
++
++#define FREE_SCREEN_ARGS_DECL int arg, int flags
++#define FREE_SCREEN_ARGS(x) (x)->scrnIndex, 0
++
++#define VT_FUNC_ARGS_DECL int arg, int flags
++#define VT_FUNC_ARGS(flags) pScrn->scrnIndex, (flags)
++
++#define XF86_ENABLEDISABLEFB_ARG(x) ((x)->scrnIndex)
++#else
++#define SCRN_ARG_TYPE ScrnInfoPtr
++#define SCRN_INFO_PTR(arg1) ScrnInfoPtr pScrn = (arg1)
++
++#define SCREEN_ARG_TYPE ScreenPtr
++#define SCREEN_PTR(arg1) ScreenPtr pScreen = (arg1)
++
++#define SCREEN_INIT_ARGS_DECL ScreenPtr pScreen, int argc, char **argv
++
++#define BLOCKHANDLER_ARGS_DECL ScreenPtr arg, pointer pTimeout, pointer pReadmask
++#define BLOCKHANDLER_ARGS arg, pTimeout, pReadmask
++
++#define CLOSE_SCREEN_ARGS_DECL ScreenPtr pScreen
++#define CLOSE_SCREEN_ARGS pScreen
++
++#define ADJUST_FRAME_ARGS_DECL ScrnInfoPtr arg, int x, int y
++#define SWITCH_MODE_ARGS_DECL ScrnInfoPtr arg, DisplayModePtr mode
++
++#define FREE_SCREEN_ARGS_DECL ScrnInfoPtr arg
++#define FREE_SCREEN_ARGS(x) (x)
++
++#define VT_FUNC_ARGS_DECL ScrnInfoPtr arg
++#define VT_FUNC_ARGS(flags) pScrn
++
++#define XF86_ENABLEDISABLEFB_ARG(x) (x)
++
++#endif
++
++#endif
+diff --git a/src/omapfb-driver.c b/src/omapfb-driver.c
+index 07989f5..486ffa4 100644
+--- a/src/omapfb-driver.c
++++ b/src/omapfb-driver.c
+@@ -44,6 +44,8 @@
+ 
+ #include "exa.h"
+ 
++#include "compat-api.h"
++
+ #ifdef HAVE_XEXTPROTO_71
+ #include <X11/extensions/dpmsconst.h>
+ #else
+@@ -70,10 +72,10 @@
+ 
+ static Bool OMAPFBProbe(DriverPtr drv, int flags);
+ static Bool OMAPFBPreInit(ScrnInfoPtr pScrn, int flags);
+-static Bool OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv);
+-static Bool OMAPFBEnterVT(int scrnIndex, int flags);
+-static void OMAPFBLeaveVT(int scrnIndex, int flags);
+-static Bool OMAPFBSwitchMode(int scrnIndex, DisplayModePtr mode, int flags);
++static Bool OMAPFBScreenInit(SCREEN_INIT_ARGS_DECL);
++static Bool OMAPFBEnterVT(VT_FUNC_ARGS_DECL);
++static void OMAPFBLeaveVT(VT_FUNC_ARGS_DECL);
++static Bool OMAPFBSwitchMode(SWITCH_MODE_ARGS_DECL);
+ 
+ static Bool
+ OMAPFBEnsureRec(ScrnInfoPtr pScrn)
+@@ -481,7 +483,7 @@ OMAPFBXvScreenInit(ScreenPtr pScreen)
+ }
+ 
+ static Bool
+-OMAPFBCloseScreen(int scrnIndex, ScreenPtr pScreen)
++OMAPFBCloseScreen(CLOSE_SCREEN_ARGS_DECL)
+ {
+ 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
+@@ -490,11 +492,11 @@ OMAPFBCloseScreen(int scrnIndex, ScreenPtr pScreen)
+ 
+ 	pScreen->CloseScreen = ofb->CloseScreen;
+ 	
+-	return (*pScreen->CloseScreen)(scrnIndex, pScreen);
++	return (*pScreen->CloseScreen)(CLOSE_SCREEN_ARGS);
+ }
+ 
+ static Bool
+-OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
++OMAPFBScreenInit(SCREEN_INIT_ARGS_DECL)
+ {
+ 	ScrnInfoPtr pScrn = xf86Screens[pScreen->myNum];
+ 	OMAPFBPtr ofb = OMAPFB(pScrn);
+@@ -516,7 +518,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	                PROT_READ | PROT_WRITE, MAP_SHARED,
+ 	                ofb->fd, 0);
+ 	if (ofb->fb == MAP_FAILED) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "Mapping framebuffer memory failed, wanted %d bytes.\n", ofb->mem_info.size);
+ 		return FALSE;
+ 	}
+ 
+@@ -526,7 +528,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	/* Only support TrueColor for now */
+ 	if (!miSetVisualTypes(pScrn->depth, TrueColorMask,
+ 		pScrn->rgbBits, pScrn->defaultVisual)) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "visual type setup failed"
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "visual type setup failed"
+ 		           " for %d bits per pixel [1]\n",
+ 		           pScrn->bitsPerPixel);
+ 		return FALSE;
+@@ -534,7 +536,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 
+ 	/* Set up pixmap depth information */
+ 	if (!miSetPixmapDepths()) {
+-		xf86DrvMsg(scrnIndex,X_ERROR,"pixmap depth setup failed\n");
++		xf86DrvMsg(pScrn->scrnIndex,X_ERROR,"pixmap depth setup failed\n");
+ 		return FALSE;
+ 	}
+ 
+@@ -546,7 +548,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	                  pScrn->virtualY, pScrn->xDpi,
+ 	                  pScrn->yDpi, pScrn->displayWidth,
+ 	                  pScrn->bitsPerPixel)) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "fbScreenInit failed\n");
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "fbScreenInit failed\n");
+ 		return FALSE;
+ 	}
+ 
+@@ -567,7 +569,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 
+ 	/* Initialize XRender fallbacks */
+ 	if (!fbPictureInit(pScreen, NULL, 0)) {
+-		xf86DrvMsg(scrnIndex, X_ERROR, "fbPictureInit failed\n");
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "fbPictureInit failed\n");
+ 		return FALSE;
+ 	}
+ 	
+@@ -579,7 +581,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 
+ 	/* Initialize default colormap */
+ 	if (!miCreateDefColormap(pScreen)) {
+-		xf86DrvMsg(scrnIndex, X_ERROR,
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 		           "creating default colormap failed\n");
+ 		return FALSE;
+ 	}
+@@ -589,7 +591,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 		/* This is non-fatal since we might be running against older
+ 		 * kernel driver in which case we only do basic 2D stuff...
+ 		 */
+-		xf86DrvMsg(scrnIndex, X_ERROR, "Reading plane info failed\n");
++		xf86DrvMsg(pScrn->scrnIndex, X_ERROR, "Reading plane info failed\n");
+ 	} else if (!ofb->dss) {
+ 
+ 		ofb->plane_info.enabled = 1;
+@@ -602,7 +604,7 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 		}
+ 
+ 		if (ioctl (ofb->fd, OMAPFB_SETUP_PLANE, &ofb->plane_info)) {
+-			xf86DrvMsg(scrnIndex, X_ERROR,
++			xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
+ 			            "%s: Plane setup failed: %s\n",
+ 			            __FUNCTION__, strerror(errno));
+ 			return FALSE;
+@@ -645,9 +647,10 @@ OMAPFBScreenInit(int scrnIndex, ScreenPtr pScreen, int argc, char **argv)
+ 	return TRUE;
+ }
+ 
+-static Bool OMAPFBSwitchMode(int scrnIndex, DisplayModePtr mode, int flags)
++static Bool OMAPFBSwitchMode(SWITCH_MODE_ARGS_DECL)
+ {
+-	return xf86SetSingleMode (xf86Screens[scrnIndex], mode, RR_Rotate_0);
++	SCRN_INFO_PTR(arg);
++	return xf86SetSingleMode (pScrn, mode, RR_Rotate_0);
+ }
+ 
+ void
+@@ -699,14 +702,14 @@ OMAPFBPrintCapabilities(ScrnInfoPtr pScrn,
+ /*** Unimplemented: */
+ 
+ static Bool
+-OMAPFBEnterVT(int scrnIndex, int flags)
++OMAPFBEnterVT(VT_FUNC_ARGS_DECL)
+ {
+ 	xf86Msg(X_NOT_IMPLEMENTED, "%s\n", __FUNCTION__);
+ 	return TRUE;
+ }
+ 
+ static void
+-OMAPFBLeaveVT(int scrnIndex, int flags)
++OMAPFBLeaveVT(VT_FUNC_ARGS_DECL)
+ {
+ 	xf86Msg(X_NOT_IMPLEMENTED, "%s\n", __FUNCTION__);
+ }
+-- 
+1.8.0
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
new file mode 100644
index 0000000..50ce4c2
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -0,0 +1,33 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
+
+DESCRIPTION = "omapfb driver supports the basic Texas Instruments OMAP \
+framebuffer."
+
+LICENSE = "MIT-X & GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
+DEPENDS += "virtual/libx11"
+
+SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
+PR = "${INC_PR}.7"
+PV = "0.1.1+gitr${SRCPV}"
+
+SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
+  file://0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch \
+  file://0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch \
+  file://0003-force-plain-mode.patch \
+  file://0004-blacklist-tv-out.patch \
+  file://0005-Attempt-to-fix-VRFB.patch \
+  file://0006-omapfb-port-to-new-xserver-video-API.patch \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF_armv7a = " --enable-neon "
+CFLAGS += " -I${STAGING_INCDIR}/xorg "
+
+# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
+do_compile_prepend_armv7a () {
+        sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
+}
-- 
1.8.0



