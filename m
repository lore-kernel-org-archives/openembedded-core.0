Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBFF750F6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2018 08:55:49 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w368tlfe027490
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Fri, 6 Apr 2018 09:55:49 +0100
Received: from richard by hex with local (Exim 4.86_2)
	(envelope-from <richard@rpsys.net>)
	id 1f4N9v-0000Jn-VG; Fri, 06 Apr 2018 09:55:47 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Apr 2018 09:55:44 +0100
Message-Id: <1523004944-1185-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: [PATCH] libxcalibrate: Drop, no users anymore
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
X-List-Received-Date: Fri, 06 Apr 2018 08:55:50 -0000

xcalibrate was replaced with other xinput touchscreen protocols,
drop this remaining remnant.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../xorg-lib/libxcalibrate/fix-xcb.patch           | 29 ----------------------
 .../recipes-graphics/xorg-lib/libxcalibrate_git.bb | 23 -----------------
 2 files changed, 52 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb

diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch b/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
deleted file mode 100644
index d614883..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate/fix-xcb.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Upstream-Status: Pending
-
-There is no extra reply data and if we say not to disgard it, xcb
-throws fatal asserts.
-
-RP - 26/11/09
-
-Index: git/xcalibrate.c
-===================================================================
---- git.orig/xcalibrate.c	2009-11-26 08:11:48.000000000 +0000
-+++ git/xcalibrate.c	2009-11-26 08:09:55.000000000 +0000
-@@ -216,7 +216,7 @@
-   req->reqType = info->codes->major_opcode;
-   req->xCalibrateReqType = X_XCalibrateRawMode;
-   req->on = enable;
--  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse)) 
-+  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue)) 
-     {
-       UnlockDisplay (dpy);
-       SyncHandle ();
-@@ -240,7 +240,7 @@
-   req->xCalibrateReqType = X_XCalibrateScreenToCoord;
-   req->x = *x;
-   req->y = *y;
--  if (!_XReply (dpy, (xReply *) &rep, 0, xFalse)) 
-+  if (!_XReply (dpy, (xReply *) &rep, 0, xTrue)) 
-     {
-       UnlockDisplay (dpy);
-       SyncHandle ();
diff --git a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb b/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
deleted file mode 100644
index 0ed8fda..0000000
--- a/meta/recipes-graphics/xorg-lib/libxcalibrate_git.bb
+++ /dev/null
@@ -1,23 +0,0 @@
-SUMMARY = "XCalibrate: Touchscreen calibration library"
-
-DESCRIPTION = "libXCalibrate is a library for performing touchscreen \
-calibration with the kdrive tslib touchscreen driver."
-
-require xorg-lib-common.inc
-
-LICENSE = "MIT-style"
-LIC_FILES_CHKSUM = "file://xcalibrate.h;endline=21;md5=fa572df6439f0f235f2612f370f153d7 \
-                    file://xcalibrate.c;endline=21;md5=fa572df6439f0f235f2612f370f153d7"
-
-DEPENDS = "virtual/libx11 xorgproto libxext"
-
-SRCREV = "209d83af61ed38a002c8096377deac292b3e396c"
-PV = "0.0+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/lib/libXCalibrate \
-           file://fix-xcb.patch"
-UPSTREAM_CHECK_COMMITS = "1"
-
-S = "${WORKDIR}/git"
-
-FILES_${PN}-locale += "${datadir}/X11/locale"
-- 
2.7.4


