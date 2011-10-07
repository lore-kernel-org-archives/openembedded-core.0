Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RCDxw-0005r4-E5
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Oct 2011 19:12:08 +0200
Received: by eyx24 with SMTP id 24so2129441eyx.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Oct 2011 10:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ojpWiKNlPCDLr1l6qePoUWMShc3qQQlV0WnZUWfB6Qk=;
	b=Wx0KrvZR3i9TE+7Rml5TpdKj5lNndY1SVreT5GWBUKD4laidYJGuo6VbhBP137/imc
	uR8mhk0UHW+W/Cb66GLfb+RrGNSzInqybN5xB/752DLL14HcpTusNki60yFvGejcsrmf
	WCe5psSFHMAl/vT4r1ZDJFL2TPRprrW4gsH7k=
Received: by 10.223.62.16 with SMTP id v16mr12364155fah.35.1318007191302;
	Fri, 07 Oct 2011 10:06:31 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id f25sm13623727faf.7.2011.10.07.10.06.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Oct 2011 10:06:30 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Oct 2011 19:05:03 +0200
Message-Id: <e8bd9688265db3d7ee9ad8c48b1f3d1aefee3892.1318007055.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
References: <8267017169d00aaa5a487a6f5d72cd67dad9c327.1318007055.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318007055.git.Martin.Jansa@gmail.com>
References: <cover.1318007055.git.Martin.Jansa@gmail.com>
Subject: [PATCHv3 08/31] xserver-xorg-common: move shared PROTO_DEPS and LIB_DEPS from xserver-xorg.inc and xserver-xorg-lite.inc to xserver-xorg-common.inc
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
X-List-Received-Date: Fri, 07 Oct 2011 17:12:08 -0000

* xserver-xorg.inc is appending extra xf86driproto dri2proto to PROTO_DEPS and virtual/libgl to LIB_DEPS
* both lite and dri variants now depend on font-util (from DEPENDS in xserver-xorg-common.inc)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xorg-common.inc           |    4 ++++
 .../xorg-xserver/xserver-xorg-lite.inc             |    6 ------
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    7 ++-----
 3 files changed, 6 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
index 0a5d8b6..d901e2c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-common.inc
@@ -20,6 +20,10 @@ S = "${WORKDIR}/${XORG_PN}-${PV}"
 
 inherit autotools pkgconfig
 
+PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
+LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
+DEPENDS = "${PROTO_DEPS} ${LIB_DEPS} font-util"
+
 # Split out some modules and extensions from the main package
 # These aren't needed for basic operations and only take up space:
 #  32.0k   libdri.so
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
index f1cef1b..a942a11 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-lite.inc
@@ -1,11 +1,5 @@
 require xserver-xorg-common.inc
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
-
-LIB_DEPS = "pixman libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
-
-DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
-
 RDEPENDS_${PN} += "xorg-minimal-fonts"
 
 FILES_${PN} += "${bindir}/Xorg "
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9bc0ee4..71754f7 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -1,10 +1,7 @@
 require xserver-xorg-common.inc
 
-PROTO_DEPS = "randrproto renderproto fixesproto damageproto xextproto xproto xf86dgaproto xf86miscproto xf86rushproto xf86vidmodeproto xf86bigfontproto compositeproto recordproto resourceproto videoproto scrnsaverproto evieext trapproto xineramaproto fontsproto kbproto inputproto bigreqsproto xcmiscproto glproto"
-
-LIB_DEPS = "pixman virtual/libgl libxfont xtrans libxau libxext libxdmcp libdrm libxkbfile libpciaccess openssl"
-
-DEPENDS = "${PROTO_DEPS} ${LIB_DEPS}"
+PROTO_DEPS += "xf86driproto dri2proto"
+LIB_DEPS += "virtual/libgl"
 
 RDEPENDS_${PN} += "xorg-minimal-fonts"
 
-- 
1.7.7



