Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RDtag-0005Jl-1I
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Oct 2011 09:51:02 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so617268bke.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Oct 2011 00:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=GGJvwEo7eqv1h93IDDhGGdKCc2EBj8e2B6EumYYzds8=;
	b=ouD79jGnjRL5wDtaq/hYw60/szmPs07VRTvKH7916NVg3CQ2yNZee4JPbhCRmQmJ0m
	fHrnChdlLhsE3hLHpNUXUVG8nUNzFEgFEHgc8qE8gD8GpeYxOsD9jC46SqgC8lCcuVWh
	KwO0vytQS1vbeCHZU4vnxbAaftInAG20IdrrI=
Received: by 10.204.129.146 with SMTP id o18mr4087475bks.95.1318405521862;
	Wed, 12 Oct 2011 00:45:21 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm1066090bkn.7.2011.10.12.00.45.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Oct 2011 00:45:20 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Oct 2011 09:45:03 +0200
Message-Id: <040b38fbd0ab7c7a1275b2e688dba177a907c716.1318405370.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
References: <49a800f40bd08aa23d227dccafd34b3e59a7ccb5.1318405370.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318405370.git.Martin.Jansa@gmail.com>
References: <cover.1318405370.git.Martin.Jansa@gmail.com>
Subject: [oe-core 2/4] qt4-x11-free: bring back pkg-config fixups
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
X-List-Received-Date: Wed, 12 Oct 2011 07:51:02 -0000

From: Simon Busch <morphis@gravedo.de>

With b40b9c024be5e1ec81a31961158b3e6b529acfe0 some pkg-config fixups where removed from
qt4.inc which breaks the pkg-config files for qt4-embedded. Without that the pkg-config
files for qt4-x11-free are broken. So this patch puts the fixes into the qt4-x11-free.inc
file to be used by qt4-x11-free and not qt4-embedded.

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
1.7.7



