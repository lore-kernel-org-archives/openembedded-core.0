Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1RBouv-0006Gf-EH for openembedded-core@lists.openembedded.org;
	Thu, 06 Oct 2011 16:27:21 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96ESGbK012174 for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:28:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 117ciheFn8rK
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Oct 2011 15:28:16 +0100 (BST)
Received: from [192.168.1.66] (tim [93.97.173.237]) (authenticated bits=0)
	by dan.rpsys.net (8.14.2/8.14.2/Debian-2build1) with ESMTP id
	p96ESAHE012170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Oct 2011 15:28:12 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu, 06 Oct 2011 15:21:33 +0100
X-Mailer: Evolution 3.1.91- 
Message-ID: <1317910901.6398.88.camel@ted>
Mime-Version: 1.0
Subject: [PATCH] xserver-xf86: Use PACKAGECONFIG for udev/hal choice and default to udev
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
X-List-Received-Date: Thu, 06 Oct 2011 14:27:21 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
index 000aea3..4c8b732 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-common.inc
@@ -35,3 +35,8 @@ FILES_${PN}-dbg += "${libdir}/xorg/modules/.debug \
 SRC_URI += "file://macro_tweak.patch"
 
 EXTRA_OECONF = "--with-fop=no"
+
+PACKAGECONFIG ??= "udev"
+PACKAGECONFIG[hal] = "--enable-config-hal,--disable-config-hal,,hal"
+PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,,udev"
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
index 3aca760..6b13873 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite.inc
@@ -6,7 +6,7 @@ LIB_DEPS = "pixman virtual/libgl libxfont xtrans libxau libxext libxdmcp libdrm
 
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
 
-RDEPENDS_${PN} += "hal xorg-minimal-fonts"
+RDEPENDS_${PN} += "xorg-minimal-fonts"
 
 FILES_${PN} += "${bindir}/Xorg "
 
@@ -34,4 +34,3 @@ EXTRA_OECONF += "--disable-static \
 
 # Due to mesa-dri
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
index 035e39c..b797f97 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_1.10.1.bb
@@ -7,7 +7,7 @@ PROTO_DEPS += "xf86driproto dri2proto"
 DEPENDS += "font-util"
 
 PE = "1"
-PR = "r1"
+PR = "r3"
 
 SRC_URI += "file://crosscompile.patch"
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
index 066ff13..87ba040 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 SRCREV = "6689e8add183835274a70ee013e5d3bc8023681f"
 PE = "1"
-PR = "r1"
+PR = "r3"
 PV = "1.10+git${SRCPV}"
 
 PROTO_DEPS += "xf86driproto dri2proto"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
index 5447058..131c258 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite.inc
@@ -8,7 +8,7 @@ LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile lib
 
 DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
 
-RDEPENDS_${PN} += "hal xorg-minimal-fonts"
+RDEPENDS_${PN} += "xorg-minimal-fonts"
 
 FILES_${PN} += "${bindir}/Xorg "
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
index 5575c0f..e42f27d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
@@ -2,7 +2,7 @@ require xserver-xf86-lite.inc
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
-PR = "r1"
+PR = "r3"
 
 DEPENDS += "font-util"
 




