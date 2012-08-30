Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T78Pz-0004iC-1y
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 19:20:35 +0200
Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 10:08:17 -0700
Received: by wibhn17 with SMTP id hn17so498872wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 10:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=jGxG0Gwx7LD5/WA7M7NcQr/HmX9qMBytvPVqKHapdjA=;
	b=C3sGATDQIka19buVAFUZG77dj4m6v1kz58OI6rj/cIVz7ccNgiALQt8ScYMx+RqQL7
	L3rVAEV/pnookH28MeELQQkyfqES1+wYy240gv/hLCVyyY4VqTIkV+u40p+QYSnF9Y1e
	+S5BundaQEcdUMCN7NdQEiwY6SjP1gS2WVcq/Tjfad4ghcQatrp+zBFZAoZP/eWOg27k
	vbYKocyyiu7FUxMEFdIA9P2vDv7YzGnXB3bdiN3YPwZjh9oLGCOeKPlsR4U/y4/c5j2M
	A/e4EufSYwFcmjZmpV6J/CDdeoQzzLyliOCE2EOROR0OunQakea+eATEy/V1ErCplGKn
	8haQ==
Received: by 10.216.136.167 with SMTP id w39mr3524794wei.76.1346346496405;
	Thu, 30 Aug 2012 10:08:16 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id hv8sm1707554wib.0.2012.08.30.10.08.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 10:08:15 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Aug 2012 18:07:24 +0100
Message-Id: <bdb43140fcbd5c61c7698318dae74e9d03067bd5.1346346320.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
In-Reply-To: <cover.1346346320.git.ross.burton@intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQlCzeNrw1z0zTdeTmEDF4iHVV8uVllvv35O0rFX7WvL7Z7YHgZE9MXpneb10M5ZdV2oEcrH
Subject: [PATCH 5/6] x11-common: just support Xorg now that kdrive has been removed
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
X-List-Received-Date: Thu, 30 Aug 2012 17:20:35 -0000

This script was also handling Xomap, Xipaq and Xepson...

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../x11-common/x11-common/etc/X11/Xserver          |   43 +-------------------
 meta/recipes-graphics/x11-common/x11-common_0.1.bb |    2 +-
 2 files changed, 2 insertions(+), 43 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
index cea733e..73570df 100644
--- a/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
+++ b/meta/recipes-graphics/x11-common/x11-common/etc/X11/Xserver
@@ -1,53 +1,12 @@
 #!/bin/sh
 #
 
-# note xinit needs full server path
-XSERVER=/usr/bin/Xipaq
-if [ -f /usr/bin/Xfbdev ]; then
-  XSERVER=/usr/bin/Xfbdev
-fi
-if [ -f /usr/bin/Xepson ]; then
-  XSERVER=/usr/bin/Xepson
-fi
-if [ -f /usr/bin/Xorg ]; then
-  XSERVER=/usr/bin/Xorg
-fi
-if [ -f /usr/bin/Xomap ]; then
-  XSERVER=/usr/bin/Xomap
-fi
+XSERVER=/usr/bin/Xorg
 
 . /etc/profile
 
 ARGS=" -br -pn"
 
-if [ "$XSERVER" != "/usr/bin/Xorg" ]; then
-
-        . /etc/formfactor/config
-
-        ARGS="$ARGS -keybd keyboard"
-
-        # use usb mouse if present
-        if [ -z "$TSLIB_TSDEVICE" ] && [ -e /dev/input/mice ]; then
-          ARGS="$ARGS -mouse mouse,/dev/input/mice"
-        fi
-
-        # kdrive 1.4 onwards needs -mouse args
-        if [ -n "$TSLIB_TSDEVICE" ]; then
-          ARGS="$ARGS -mouse tslib"
-        fi
-
-        ARGS="$ARGS -screen ${DISPLAY_WIDTH_PIXELS}x${DISPLAY_HEIGHT_PIXELS}@${DISPLAY_ORIENTATION}x${DISPLAY_BPP}"
-
-        if [ ! -z "$DISPLAY_DPI" ]; then
-                ARGS="$ARGS -dpi $DISPLAY_DPI"
-        fi
-
-        if [ ! -z "$DISPLAY_SUBPIXEL_ORDER" ]; then
-                ARGS="$ARGS -rgba $DISPLAY_SUBPIXEL_ORDER"
-        fi
-
-fi
-
 DISPLAY=':0'
 
 exec xinit /etc/X11/Xsession -- $XSERVER $DISPLAY $ARGS $*
diff --git a/meta/recipes-graphics/x11-common/x11-common_0.1.bb b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
index 2675145..6a04cfb 100644
--- a/meta/recipes-graphics/x11-common/x11-common_0.1.bb
+++ b/meta/recipes-graphics/x11-common/x11-common_0.1.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Common X11 scripts and configuration files"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 SECTION = "x11"
-PR = "r45"
+PR = "r46"
 
 SRC_URI = "file://etc \
            file://gplv2-license.patch"
-- 
1.7.10



