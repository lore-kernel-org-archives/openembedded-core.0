Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 124B470618
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 16:41:22 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id l18so2298576wgh.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 09:41:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=OuH6pZaVZvq3wwM9q77LJ0z7XvLFLlm+U2+m8WnYtUI=;
	b=d1bb9sKl0mwZkCkoyr0/4OhFLbb+4ttVSjKf35rz1ZM1kmrOFBpUzFhwfbPbU4M/Ev
	mgGGTesx/hmHKA4K82XpotJH+Ry/78hIXZOOyG2m9P/IGHjaVH8lZsAW84BECx3ot4cu
	iChODqVHxgDayHZDRfr8O4YY5HgFXHSceXFElCCWt+CcS0ubyyagqYIjA2tc3tXIVK8y
	LPXYyfGjc7Cf3+r1Lbiev4HG9+cunxvkQCM4fLxP4NxrJMzk1NwzTSs2MzlME1AcIO73
	zFDRCwzi7VL8waZBRCW93vW865zyge3kUnPsF+BmtqbAM6ZJZasKi2Gc0TWdFgaYNVGu
	VlXw==
X-Gm-Message-State: ALoCoQmYR0S4zgyl5+wyBZHm32Vmsv3C3pTFfHtd2vI0bHmkQdtT+8JwENgHtswaxp8evfLarJH5
X-Received: by 10.180.91.194 with SMTP id cg2mr24449433wib.12.1405615283457;
	Thu, 17 Jul 2014 09:41:23 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id d12sm7340412wjx.0.2014.07.17.09.41.21
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 17 Jul 2014 09:41:22 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 17:41:18 +0100
Message-Id: <1405615278-28413-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] xf86-video-intel: disable non-deterministic tests for libX11
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
X-List-Received-Date: Thu, 17 Jul 2014 16:41:27 -0000

libX11 et al are checked for at confgure time and tests optionally built.  As
these don't get installed we don't want to add build dependencies, but the
non-determinism means that builds can fail.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xf86-video-intel/disable-x11-dri3.patch           |   17 +++++++++++++++++
 .../xorg-driver/xf86-video-intel_2.99.912.bb          |    3 ++-
 2 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
new file mode 100644
index 0000000..dda508d
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel/disable-x11-dri3.patch
@@ -0,0 +1,17 @@
+These modules are only used for tests that don't get installed, and the
+automatic detection without explicit dependencies means that a build can find
+e.g. xshmfence at configure time but then it's been removed from the sysroot by
+the time compile happens.
+
+As the tests don't get installed, just disable the checks.
+
+Upstream-Status: Inappropriate [OE-specific]
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+diff --git a/configure.ac b/configure.ac
+index bd654f3..78a0e0d 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -251 +251 @@ fi
+-PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-present x11-xcb xshmfence x11 xrender xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
++#PKG_CHECK_MODULES(X11_DRI3, [xcb-dri3 xcb-sync xcb-present x11-xcb xshmfence x11 xrender xext libdrm], [x11_dri3="yes"], [x11_dri3="no"])
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
index 0777690..544de4a 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.912.bb
@@ -9,7 +9,8 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-SRC_URI += "file://configure-dri.patch"
+SRC_URI += "file://configure-dri.patch \
+            file://disable-x11-dri3.patch"
 
 SRC_URI[md5sum] = "88d1a884f9b7bd07bf0755cfa34052d4"
 SRC_URI[sha256sum] = "7c8ffc492d59f34cac64093deb70717b4d9223cf416ecc6fa016ab2e8bde9501"
-- 
1.7.10.4


