Return-Path: <fabien.proriol@jdsu.com>
Received: from ks.kazoe.org (ks.kazoe.org [91.121.82.209])
	by mail.openembedded.org (Postfix) with ESMTP id BE4EC72D73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 10:13:54 +0000 (UTC)
From: Fabien Proriol <fabien.proriol@jdsu.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 11:13:44 +0100
Message-Id: <1422440024-9110-1-git-send-email-fabien.proriol@jdsu.com>
X-Mailer: git-send-email 2.0.5
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH] qt4-x11-free: Fix Qt4 to build without opengl
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
X-List-Received-Date: Wed, 28 Jan 2015 10:13:56 -0000

If we don't have opengl support on target, qt4 still depends to libgl, but Qt4 don't need it...

Signed-off-by: Fabien Proriol <fabien.proriol@jdsu.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index 3b1e0fe..ae3e1ca 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -4,7 +4,8 @@ SUMMARY = "Cross-platform UI toolkit and application framework (X11 version)"
 DESCRIPTION = "Qt is a versatile cross-platform application framework -- this is the X11 version."
 HOMEPAGE = "http://qt-project.org/"
 SECTION = "x11/libs"
-DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
+DEPENDS += "${@bb.utils.contains('QT_CONFIG_FLAGS', '-opengl', 'virtual/libgl', '', d)} "
 PROVIDES += "qt4-x11"
 QT4DEPENDS = ""
 
-- 
2.0.5

