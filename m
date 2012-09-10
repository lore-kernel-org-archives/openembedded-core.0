Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TB7rs-0003Mf-13
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Sep 2012 19:33:52 +0200
Received: from mail-we0-f175.google.com ([74.125.82.175])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 10 Sep 2012 10:21:13 -0700
Received: by weyr6 with SMTP id r6so1413034wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2012 10:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=gWxnlLp5Dz8c7znf8AVz2T2H0KldW/tM6jwe9wQqttc=;
	b=lVzVqgP8khGl5wEI4UTSTdfQ4Ken3BFn/kAZHi+Zsr6VPVaO86tAjhbQZb7HYyE4TE
	n2vMyB2hhbIkMK8PqCPJzLPEcT7MEDPlxxj67jvkHqD/JmevMU77HH8pdaqYai2YRmWO
	16ZBO9XxkW1XMPp1UU1Vnxq0P4wTJ64VYgq2gRAloXBU5VW/g0vuE/G1y4ldCkU3ugaA
	eOIVLvkSwItGTimTPYxZ4RGhVEmVSOyd5ypgx/ktl2yGvO0RN7hilo0Vm0RMV2/nE28V
	MQP3JWQ4nEghmXxlPOoqDpUB1W9Fs6bzMMGEAJEvOCCkZyJs4kXVqoHQom+EQMC3l0Q+
	SnZA==
Received: by 10.216.23.202 with SMTP id v52mr8245847wev.32.1347297678737;
	Mon, 10 Sep 2012 10:21:18 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id r9sm26684729wia.2.2012.09.10.10.21.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 10 Sep 2012 10:21:17 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Sep 2012 18:20:29 +0100
Message-Id: <1347297632-16529-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkiM1srlk+GtEC7rCGDr6y26YNxDcQdwpq3sGeEKsFMAiXi/LVUOAbchJpZ3rwC/eqVfMgs
Subject: [PATCH 1/4] libx11-diet: you can't disable XCB anymore, so don't try
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
X-List-Received-Date: Mon, 10 Sep 2012 17:33:52 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
index 7d4facd..6a898b5 100644
--- a/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
+++ b/meta/recipes-graphics/xorg-lib/libx11-diet_1.5.0.bb
@@ -1,11 +1,11 @@
 require libx11.inc
 
-DESCRIPTION += " Support for XCB, UDC, XCMS and XLOCALE is disabled in \
+DESCRIPTION += " Support for UDC, XCMS and XLOCALE is disabled in \
 this version."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=172255dee66bb0151435b2d5d709fcf7"
 
-PR = "r1"
+PR = "r2"
 
 SRC_URI += "file://x11_disable_makekeys.patch \
             file://X18NCMSstubs.diff \
@@ -20,11 +20,11 @@ RPROVIDES_${PN}-locale = "libx11-locale"
 SRC_URI[md5sum] = "78b4b3bab4acbdf0abcfca30a8c70cc6"
 SRC_URI[sha256sum] = "c382efd7e92bfc3cef39a4b7f1ecf2744ba4414a705e3bc1e697f75502bd4d86"
 
-DEPENDS += "bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
+DEPENDS += "libxcb bigreqsproto xproto xextproto xtrans libxau xcmiscproto \
             libxdmcp xf86bigfontproto kbproto inputproto xproto-native"
 
 FILESDIR = "${@os.path.dirname(d.getVar('FILE', True))}/libx11"
 
-EXTRA_OECONF += "--without-xcb --disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
+EXTRA_OECONF += "--disable-udc --disable-xcms --disable-xlocale --with-keysymdefdir=${STAGING_INCDIR}/X11"
 CFLAGS += "-D_GNU_SOURCE"
 
-- 
1.7.10



