Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDyd-0005tt-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:12:54 +0200
Received: by mail-gy0-f175.google.com with SMTP id 8so3931090gyg.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FYY5vtMTGX12/Agr8yGkoa4TepCu4vhYzbuBMrOtCb4=;
	b=F3eWx4XH8alj+1RErkquNd7kSnMlO2/3ccNN16wY7WyLDlHUnIursqso7VmTVUBZ7v
	rAX57ZWZ2N0qSbXbtRrpq0w3wWsTTsAvOQlFkkX1B8Mh853F8m21TJ2U/dBSwrSKRmwW
	8OK+v83EpVwlm3BRxjT20XOkFN1VQKKoNS13c=
Received: by 10.223.4.132 with SMTP id 4mr11819986far.12.1318007236493;
	Fri, 07 Oct 2011 10:07:16 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm13626889faf.7.2011.10.07.10.07.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:07:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:08 +0200
Message-Id: <f17ced8c9f90e9bd7911ee48aca2b21084024641.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 13/31] xserver-xorg: move shared EXTRA_OECONF entries to shared .inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Oct 2011 17:12:54 -0000

* after this xserver-xorg-lite.inc is disabling only dri/glx
  and xserver-xorg.inc is forcing dri/dri2 enabled
  the rest is defined in xserver-xorg-common.inc

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |   21 ++++++++++++++++++-
 .../xorg-xserver/xserver-xorg-lite.inc             |   20 +----------------
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   22 +++----------------
 3 files changed, 26 insertions(+), 37 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 77c3761..0cc3dc0 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -94,7 +94,26 @@ FILES_${PN}-module-xaa = "${libdir}/xorg/modules/libxaa.so"
 FILES_${PN}-module-libxf1bpp = "${libdir}/xorg/modules/libxf1bpp.so"
 FILES_${PN}-module-libxf4bpp = "${libdir}/xorg/modules/libxf4bpp.so"
 
-EXTRA_OECONF = "--with-fop=no"
+EXTRA_OECONF += "--with-fop=no \
+                 --disable-static \
+                 --disable-acfb \
+                 --disable-ccfb \
+                 --disable-mcfb \
+                 --disable-dga \
+                 --disable-xinerama \
+                 --disable-xf86misc \
+                 --disable-xorgcfg \
+                 --disable-record \
+                 --disable-dmx \
+                 --disable-xnest \
+                 --disable-xvfb \
+                 --enable-composite \
+                 --sysconfdir=/etc/X11 \
+                 --localstatedir=/var \
+                 --with-fontdir=${datadir}/fonts/X11 \
+                 --with-xkb-output=/var/lib/xkb \
+                 ac_cv_file__usr_share_sgml_X11_defs_ent=no \
+"
 
 PACKAGECONFIG ??= "udev"
 PACKAGECONFIG[hal] = "--enable-config-hal,--disable-config-hal,,hal"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index b82d153..be84e9e 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,22 +1,6 @@
 require xserver-xorg-common.inc
 
-EXTRA_OECONF += "--disable-static \
-                 --disable-acfb \
-                 --disable-ccfb \
-                 --disable-mcfb \
-                 --disable-dga \
-                 --disable-xinerama \
-                 --disable-xf86misc \
-                 --disable-xorgcfg \
-                 --disable-record \
-                 --disable-dmx \
-                 --disable-xnest \
-                 --disable-xvfb \
-                 --enable-composite \
+EXTRA_OECONF += "\
                  --disable-dri \
                  --disable-glx \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
-                 --with-fontdir=${datadir}/fonts/X11 \
-                 --with-xkb-output=/var/lib/xkb \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no"
+"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 726fbaa..f734873 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -5,26 +5,12 @@ LIB_DEPS += "virtual/libgl"
 
 require ../mesa/glx-use-tls.inc
 
-EXTRA_OECONF += "--disable-static \
-                 --disable-acfb \
-                 --disable-ccfb \
-                 --disable-mcfb \
-                 --disable-dga \
-                 --disable-xinerama \
-                 --disable-xf86misc \
-                 --disable-xorgcfg \
-                 --disable-record \
-                 --disable-dmx \
-                 --disable-xnest \
-                 --disable-xvfb \
-                 --enable-composite \
-                 --sysconfdir=/etc/X11 \
-                 --localstatedir=/var \
+EXTRA_OECONF += "\
+                 --enable-dri \
+                 --enable-dri2 \
                  --with-pic \
                  --with-int10=x86emu \
-                 --with-fontdir=${datadir}/fonts/X11 \
-                 --with-xkb-output=/var/lib/xkb \
-                 ac_cv_file__usr_share_sgml_X11_defs_ent=no"
+"
 
 # Due to mesa-dri
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.7



