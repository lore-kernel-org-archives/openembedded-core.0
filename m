Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9wKg-0003HD-Cv
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 13:02:42 +0200
Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 07 Sep 2012 03:50:12 -0700
Received: by wgbdr1 with SMTP id dr1so2046396wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 03:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=cIlbrYLHFFDf+VeWJq5ZqvY5/Q71fcy2xxkXe99ydPU=;
	b=QxcNblHRbPx12nlsASgQcHKB6pF7dr38ycsM1a1WCSVtTm40StT42aJuHpnfVBL9b4
	gIu4VnBKnosivmEtmwR9JhYiBtTWcVtm3gi6S9mvfM3g46X3tsU1ei6kzy8w1i7y9Z+4
	8i6SCXikU9D5ttuqUYrLX/+06Zr8iYmRgBhD4pESKl5+iM+PqELtJuqTP+xTZsNqL5I5
	9Zzypzv9+O9fUMwhE87cxAA6r3VwQ2c0WJildymBUKHTrtZ/k8F4w7XFl76DQsEOULIq
	6HlYDEX6lLeiZ4yjXbQrBFZNJOebM6zDe6dEonRzH0Dbhyh21aeaJvpx8lP9IauwFLWs
	41Wg==
Received: by 10.180.91.1 with SMTP id ca1mr45649594wib.8.1347015010807;
	Fri, 07 Sep 2012 03:50:10 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id q4sm9053094wix.9.2012.09.07.03.50.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 03:50:09 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Sep 2012 11:49:25 +0100
Message-Id: <1347014965-24440-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQms1+jBuZ1ZI3/ONXP8EQiRzN90VwfDTDfAY3xrER79eRZVJ6/eOJpuWUrSyDiTsGEhlxPS
Subject: [PATCH] xserver-xorg: make DRI/GLX options respect opengl distro feature
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
X-List-Received-Date: Fri, 07 Sep 2012 11:02:42 -0000

If the distro doesn't have the opengl feature there's no point building the DRI
or GLX support, making the mesa-dri build dependency optional.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc               |    2 +-
 meta/recipes-graphics/xorg-xserver/xserver-xorg.inc    |   16 ++++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index b4a348c..c71896a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r6"
+PR = "r7"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index a0309aa..210abad 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -123,21 +123,13 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev"
+PACKAGECONFIG ??= "udev ${@base_contains('DISTRO_FEATURES', 'opengl', 'glx', '', d)}"
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
+PACKAGECONFIG[glx] = "--enable-dri --enable-dri2 --enable-glx --enable-glx-tls,\
+                      --disable-dri --disable-glx,\
+                      xf86driproto dri2proto mesa-dri"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
 	rmdir ${D}${localstatedir}/log/
 }
-
-
-# Mesa/GLX/DRI
-PROTO_DEPS += "xf86driproto dri2proto"
-LIB_DEPS += "mesa-dri"
-
-EXTRA_OECONF += "\
-                 --enable-dri \
-                 --enable-dri2 \
-                 --enable-glx-tls \
-"
-- 
1.7.10



