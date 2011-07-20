Received: from mail-fx0-f51.google.com ([209.85.161.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Qje3T-000446-Sv
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 23:11:43 +0200
Received: by mail-fx0-f51.google.com with SMTP id 10so2396807fxh.10
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2011 14:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=cKRxlLsqIjCwt6Shn/Z0qjSPUVffUcX4H9EC/yVWsis=;
	b=QsGqZxSySa9S11jVX24nnPAWyAm5GoZh4Q/PXusZXfQLDwVWwci45QGOtxAsSiFvXj
	bmyQtn5ed+OjJKwhfeulRki9OMwJZ0F1OhWgB8pWow5y7yH7/R/N0XZrdTYYIAXp/iGr
	iM8ALsyD7cBCze4qZKbW+uvNbslLa7E2wmK0g=
Received: by 10.223.158.72 with SMTP id e8mr646962fax.39.1311196059549;
	Wed, 20 Jul 2011 14:07:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id 21sm936482fay.21.2011.07.20.14.07.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 20 Jul 2011 14:07:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 23:06:26 +0200
Message-Id: <b894d6fe17e750aa9ae5b0c4c9fc4c2fe64f66d0.1311195893.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
References: <7ac4de095ea2d0543c8c665e2cfd1be131781e8c.1311195893.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1311195893.git.Martin.Jansa@gmail.com>
References: <cover.1311195893.git.Martin.Jansa@gmail.com>
Subject: [PATCH 09/10] python: save Makefile.sysroot in do_compile
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
X-List-Received-Date: Wed, 20 Jul 2011 21:11:44 -0000

* otherwise calling do_install twice results in Makefile.sysroot == Makefile.orig and distutils using wrong LIBDIR (from host)

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.6.6.bb |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 800ba04..76f32f2 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.8"
+PR = "${INC_PR}.9"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -54,6 +54,9 @@ do_compile() {
 	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
 	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
+	# save copy of it now, because if we do it in do_install and 
+	# then call do_install twice we get Makefile.orig == Makefile.sysroot
+	install -m 0644 Makefile Makefile.sysroot
 
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
@@ -75,7 +78,6 @@ do_compile() {
 do_install() {
 	# make install needs the original Makefile, or otherwise the inclues would
 	# go to ${D}${STAGING...}/...
-	install -m 0644 Makefile Makefile.sysroot
 	install -m 0644 Makefile.orig Makefile
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
@@ -86,7 +88,6 @@ do_install() {
 		DESTDIR=${D} LIBDIR=${libdir} install
 
 	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
-	rm Makefile.sysroot
 
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
-- 
1.7.6



