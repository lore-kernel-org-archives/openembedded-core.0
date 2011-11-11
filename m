Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1ROu4Y-0005YU-94
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Nov 2011 17:35:22 +0100
Received: by mail-bw0-f47.google.com with SMTP id zs2so3543817bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Nov 2011 08:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DRbMsKvf5H1sbxmYvuuvjx6gJokB4ZgA9liueVjKCMM=;
	b=CSAlvRhI1IBpoPlyM/Ixoo0TeW7coq4cOYV+myalnlg44yQTAnOnRZkBBwJa2mpXFT
	O8btYj4Nlle92pFlNCniepzJWI1rB1wObsbu/I0aRl9nx3XDaFRB2Zo5nXFzydg0RvfZ
	2Bw0QHf8oVevEOhKDvwDA7wi7z6m0B9rVynaI=
Received: by 10.205.122.71 with SMTP id gf7mr1186034bkc.122.1321028946624;
	Fri, 11 Nov 2011 08:29:06 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id m12sm1763235bkg.14.2011.11.11.08.29.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 11 Nov 2011 08:29:05 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Nov 2011 17:28:37 +0100
Message-Id: <d99edd412e58edeb79c64112f7eb6ba522342bf9.1321028799.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.rc1
In-Reply-To: <cover.1321028799.git.Martin.Jansa@gmail.com>
References: <cover.1321028799.git.Martin.Jansa@gmail.com>
Subject: [PATCH][oe-core 01/22] qt4-x11-free: bring back pkg-config fixups
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
X-List-Received-Date: Fri, 11 Nov 2011 16:35:22 -0000

From: Simon Busch <morphis@gravedo.de>

* With b40b9c024be5e1ec81a31961158b3e6b529acfe0 some pkg-config fixups where removed from
  qt4.inc which breaks the pkg-config files for qt4-embedded. Without that the pkg-config
  files for qt4-x11-free are broken. So this patch puts the fixes into the qt4-x11-free.inc
  file to be used by qt4-x11-free and not qt4-embedded.

* Resending because nobody replied on
  http://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg10609.html

Signed-off-by: Simon Busch <morphis@gravedo.de>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-qt/qt4/qt4-x11-free.inc |   16 +++++++++++++++-
 1 files changed, 15 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-qt/qt4/qt4-x11-free.inc b/meta/recipes-qt/qt4/qt4-x11-free.inc
index f391028..04b7885 100644
--- a/meta/recipes-qt/qt4/qt4-x11-free.inc
+++ b/meta/recipes-qt/qt4/qt4-x11-free.inc
@@ -5,7 +5,7 @@ HOMEPAGE = "http://qt.nokia.com"
 SECTION = "x11/libs"
 DEPENDS += "virtual/libgl virtual/libx11 fontconfig libxft libxext libxrender libxrandr libxcursor"
 
-INC_PR = "r32"
+INC_PR = "r33"
 
 QT_GLFLAGS ?= "${@base_contains('DISTRO_FEATURES', 'opengl', '-opengl', '-no-opengl', d)} "
 QT_GLFLAGS_qemux86 = "-opengl"
@@ -16,3 +16,17 @@ QT_BASE_LIB  ?= "libqt"
 
 inherit qt4x11
 
+do_install_append() {
+  # fix pkgconfig, libtool and prl files
+  sed -i -e 's#I/usr/include#Iincludedir}#g' \ 
+    -e 's#Iin#I${in#g' \
+    ${D}${libdir}/*.la ${D}${libdir}/*.prl ${D}${libdir}/pkgconfig/*.pc
+
+  # QT abuses $includedir to point to its headers, which breaks pkgconfig sysroot, so
+  # manually fix it up here:
+  for pc in ${D}${libdir}/pkgconfig/*.pc ; do
+    sed -i -e "s:prefix}include/${QT_BASE_NAME}/$(basename $pc .pc):prefix}/include:" \
+      -e "s,Cflags: ,Cflags: -IP{includedir}/${QT_BASE_NAME}/$(basename $pc .pc) ," \
+      -e 's:IP{:I${:g' $pc
+  done
+}
-- 
1.7.8.rc1



