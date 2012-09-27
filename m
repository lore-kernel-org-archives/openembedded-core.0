Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1THJKN-0008CO-1z
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Sep 2012 21:00:51 +0200
Received: by yenm2 with SMTP id m2so642223yen.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Sep 2012 11:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=oIHV+KuliHZUMCHaB+duhdGjRAuFRDnTOi+zPQp058o=;
	b=HhPSulYFE0usO8Tz/5SEqnoFoXLOkzRSxq4pJ1KuRXA/Be1K3rZ57L4kcewdD7WtA9
	eo67mp4PyWjf6kOQgW2cKl2TPs8K8aIU1bGlRl49K1sDZxDUAYnDGogHPplDGOJcV9i6
	DW8jMhni5pIhBmrNvBz/oOzQ59wtOhxq6XSSOlgVU2nDTy941dUOSQh9xXecuvndp45Q
	aVL2852AmvuRjpWH4EOS3eNuI9Ys7hC2uN0PPecE6SGNjs0s2A6lLpMKuCXCNYaqTivO
	m2+pQFZ35VZVdmZE8AhxgXrht+PX0kuFyXonLtwixGjA+fPVv3FfF2qe6QJxa2xn4VBb
	P68Q==
Received: by 10.236.191.233 with SMTP id g69mr5406515yhn.113.1348771678535;
	Thu, 27 Sep 2012 11:47:58 -0700 (PDT)
Received: from localhost.localdomain ([177.100.163.15])
	by mx.google.com with ESMTPS id c64sm10396565yhj.17.2012.09.27.11.47.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 27 Sep 2012 11:47:56 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Sep 2012 15:47:49 -0300
Message-Id: <1348771669-22222-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] xserver-xorg: Use rdepends to ensure xserver-xorg-module-exa match version
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
X-List-Received-Date: Thu, 27 Sep 2012 19:00:51 -0000

This fix the installation of xserver-xorg-module-exa package at rootfs
using opkg. It were failing as conflicts where not working properly.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../xorg-xserver/xserver-xorg-1.11.2.inc           |    2 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
index 35cb33a..32bd9fd 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg-1.11.2.inc
@@ -8,4 +8,4 @@ SRC_URI += "file://crosscompile.patch \
 SRC_URI[md5sum] = "8796fff441e5435ee36a72579008af24"
 SRC_URI[sha256sum] = "fa415decf02027ca278b06254ccfbcceba2a83c2741405257ebf749da4a73cf2"
 
-PR = "r8"
+PR = "r9"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index 7513399..bea0252 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -66,7 +66,7 @@ PACKAGES =+ "${PN}-security-policy \
 
 RRECOMMENDS_${PN} += "${PN}-security-policy xkeyboard-config rgb xserver-xf86-config"
 RDEPENDS_${PN}-xvfb += "xkeyboard-config"
-RCONFLICTS_${PN}-module-exa = "${PN} (< ${EXTENDPKGV})"
+RDEPENDS_${PN}-module-exa = "${PN} (= ${EXTENDPKGV})"
 
 FILES_${PN} = "${bindir} ${libdir}/X11/Options ${libdir}/X11/Cards ${libdir}/X11/getconfig ${libdir}/X11/etc ${libdir}/modules/*.so ${libdir}/xorg/modules/*.so /etc/X11 ${libdir}/xorg/protocol.txt ${datadir}/X11/xorg.conf.d"
 FILES_${PN}-dev += "${libdir}/xorg/modules/*.la ${libdir}/xorg/modules/*/*.la"
-- 
1.7.2.5



