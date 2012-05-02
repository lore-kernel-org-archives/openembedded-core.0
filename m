Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SPO4n-0003od-Nm
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 03:09:53 +0200
Received: by vcbfl13 with SMTP id fl13so82765vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 01 May 2012 18:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=yWgJ/c47P0ElnVCt4mCo3YzILK+Q1JbDdrUNQ3jH3RU=;
	b=bEOjC0yUoIduC+lSJsPfQWQFkL0bhnaBZKJhP+VAHf2Btc0SUgDhDCpgZPSvwWr9kr
	kyC18AMNNVVmghnl7leJ1iNSoTGeqHlrk7IEK3BPsciFNKb+CnQ3JW0YzZSdn1aOKBF/
	nKQhyxRqJjlln6c+0k2R1rjLftVu9fclF+yX28y9WbDG2y4Bm1ySpG9y6D/Q0Mf7UyW/
	acZIN9wI1/YasFTwT94S3IwTMazgkcxW08NgxThMXZ7Agvo/qY8qBtT9rHrVp+814nwt
	1FPZqyd63/tlCh1hYQuX6RzRh/8QlZJ6OFaObaw0JxELZqbZ+NNvNsTjKFpa08pNo1xa
	/h7Q==
Received: by 10.220.219.9 with SMTP id hs9mr6960677vcb.2.1335920409642;
	Tue, 01 May 2012 18:00:09 -0700 (PDT)
Received: from localhost.localdomain ([186.218.100.214])
	by mx.google.com with ESMTPS id i11sm302681vdj.16.2012.05.01.18.00.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 01 May 2012 18:00:09 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 May 2012 22:00:01 -0300
Message-Id: <1335920401-23586-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
Subject: [PATCH] qt4-graphics-system: set graphic system in profile instead of X11 session
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
X-List-Received-Date: Wed, 02 May 2012 01:09:53 -0000

To allow the use of Qt applications started manually to use the
configured graphics system the setting needs to be available in user
environment. This moves the setting to /etc/profile.d ensuring it is
set and available. This allow the removal of x11-common as dependency.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../qt4-graphics-system/qt4-graphics-system_1.0.bb |   12 +++++-------
 1 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
index bae0340..e816a90 100644
--- a/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
+++ b/meta/recipes-qt/qt4-graphics-system/qt4-graphics-system_1.0.bb
@@ -3,10 +3,9 @@ SECTION = "x11/base"
 LICENSE = "MIT-X"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-QT_GRAPHICS_SYSTEM ?= "raster"
+PR = "r1"
 
-# xserver-common, x11-common
-VIRTUAL-RUNTIME_xserver_common ?= "x11-common"
+QT_GRAPHICS_SYSTEM ?= "raster"
 
 def _get_extra_rdepends(d):
     gs = d.getVar('QT_GRAPHICS_SYSTEM', True)
@@ -16,12 +15,11 @@ def _get_extra_rdepends(d):
     return ""
 
 do_install () {
-	install -d ${D}/${sysconfdir}/X11/Xsession.d/
-	cfg_file=${D}/${sysconfdir}/X11/Xsession.d/85xqt-graphicssystem
+	install -d ${D}/${sysconfdir}/profile.d/
+	cfg_file=${D}/${sysconfdir}/profile.d/qt-graphicssystem
 	echo "export QT_GRAPHICSSYSTEM=${QT_GRAPHICS_SYSTEM}" > $cfg_file
-	chmod +x $cfg_file
 }
 
-RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_xserver_common} ${@_get_extra_rdepends(d)}"
+RDEPENDS_${PN} = "${@_get_extra_rdepends(d)}"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.7.2.5



