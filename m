Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id C3CA873F56
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 19:50:40 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yrtir-0005OK-Ff from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Mon, 11 May 2015 12:50:41 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Mon, 11 May 2015 20:50:40 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 May 2015 22:50:38 +0300
Message-ID: <1431373838-1058-1-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCH] qt4-x11-free: make virtual/libgl dependecy conditional
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
X-List-Received-Date: Mon, 11 May 2015 19:50:42 -0000
Content-Type: text/plain

Make qt4-x11-free depend on virtual/libgl only if the DISTRO_FEATURES
contain opengl. Otherwise there will be no package to fullfil this
dependency.

Using PACKAGECONFIG for this seems to be unreasonable: it is not used by
qt4-x11-free to track other dependencies. Also QT_GLFLAGS variable
properly tracks passing -opengl or -no-opengl to configure script.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 3b1e0fe..835fc96 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -4,7 +4,8 @@ SUMMARY = "Cross-platform UI toolkit and application framework (X11 version)"
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
-- 
2.1.4


