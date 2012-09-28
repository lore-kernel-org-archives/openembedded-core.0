Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THarg-0005pL-4K
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 15:44:24 +0200
Received: by yenm2 with SMTP id m2so876308yen.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 06:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=QRKdoQ/tUTu6lPBMZXdQBKkpgCm52TtRBClqXy17hNs=;
	b=wapXqErXrbcI/k5auIx8PVwOXAvXHJXgHq1j1oWyqc4cv69OET+dYRL1Iy58HBuMve
	EqyrBLalPCCwzVU7Re9Ul+CD5iqijX3taJ3qcmW0yh1I5SSiNY2uVp6n4pxDx+mR3Ysm
	H9RvBd637JFBfFLyJJ4abcWFFRFPPvy/GFquoxBsZB+2w0YTXIxXLJR5IuDjdiOb+z/2
	Dm5Hphe0OvKxDxHl3UlMHghUYz3KN6NNVx/O1QkSjb5wv8fu3tOMONv+SMaNYEIeeDna
	sG7ht8+/hTdXNvlpXbIbwb8twlVgEv0cawiUQswfUd4qvP7KO+hcHP2vQskb8UwwWhRK
	sCXg==
Received: by 10.236.182.197 with SMTP id o45mr7932054yhm.23.1348839090483;
	Fri, 28 Sep 2012 06:31:30 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id k2sm9626710anl.11.2012.09.28.06.31.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 06:31:29 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Sep 2012 10:31:21 -0300
Message-Id: <1348839081-7511-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] xserver-xorg: Remove RCONFLICTS against xserver-xorg
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
X-List-Received-Date: Fri, 28 Sep 2012 13:44:24 -0000

When merging the xserver-xorg fix the to use RDEPENDS in
xserver-xorg-module-exa the RCONFLICTS has not been removed by
mistake. This drops the RCONFLICTS to properly fix it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    1 -
 .../xorg-xserver/xserver-xorg_1.11.2.bb            |    2 +-
 2 files changed, 1 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 9b474de..bea0252 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -66,7 +66,6 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
 RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
index 2512fb2..a219f81 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.11.2.bb
@@ -10,4 +10,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r9"
+PR = "r10"
-- 
1.7.2.5



