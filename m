Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QFlEY-0004Rb-Fe
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Apr 2011 12:47:38 +0200
Received: by fxm19 with SMTP id 19so2800839fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Apr 2011 03:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=F4NtPPO/h8v0vElWZd/5u0LjgaVEetkOn+Iy+9QupL8=;
	b=ZhvzDiMPsLxzBAIwDqlVQbNn7ev1pMhxazCKnTkthT8aNMBoGZ7ome/DG1zMlBUgSQ
	kBHj49mPvmIZQDhJkVTsPFPNd4iDUgA0LqsfH1uxAZmt2iQIfwk+09ilcig2sCgUd8T1
	fIeHHSm6I9Rm+LtUnCtDi/szyu01bg+l253gQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uC/VIZ57TLcxOcFMx5JL8Sut7fFfVt8yd5t8iEjV3iglscULedRaaPmr3fSOAjllJy
	v3ynZcjO2lyiASTtZqBlqgEsLMyoRPyaaAbwKEuFM2wRwY25qjhCacRzSmswGB7c/zhE
	+3QDzANE5ZaB8qyqnCtS517gv3ML6AN7n14CQ=
Received: by 10.223.161.194 with SMTP id s2mr1163879fax.143.1304073903797;
	Fri, 29 Apr 2011 03:45:03 -0700 (PDT)
Received: from localhost.localdomain (85-127-58-140.dynamic.xdsl-line.inode.at
	[85.127.58.140])
	by mx.google.com with ESMTPS id c24sm858490fak.7.2011.04.29.03.45.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 29 Apr 2011 03:45:02 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Apr 2011 12:44:58 +0200
Message-Id: <1304073898-12204-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH]] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Fri, 29 Apr 2011 10:47:38 -0000

This fixes compilation/linking of Python 3rd party extensions.

${STAGING_LIBDIR}/python<pyver>/config/Makefile needs the correct
INCDIR and LIBDIR settings to be used in cross compilation for the
target. 3rd party module use distutils.sysconfig which uses this
Makefile to create compiler/linker flags.

Workflow:
1) compile needs the staged/sysroot Makefile since it is needed
   for compilation/linking
2) install needs the unmodified Makefile to install files (i.e.
   headers) into the right directores. (otherwise they would be
   installed in ${D}/${STAGING_...}
3) staging needs modified Makefile again
4) packaging needs unmodified to make compilation on the target
   possible

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
---
 meta/recipes-devtools/python/python_2.6.6.bb |   25 +++++++++++++++++++------
 1 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 2939df4..44ace13 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.1"
+PR = "${INC_PR}.2"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -41,11 +41,13 @@ do_compile_prepend() {
 	install -d ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
 	install -d ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 	install -m 0644 pyconfig.h ${STAGING_INCDIR}/python${PYTHON_MAJMIN}/
+
+	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
+	sed -i -e s,ccache,'$(CCACHE)', Makefile
+
 	install -m 0644 Makefile Makefile.orig
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${includedir},${STAGING_INCDIR},' < Makefile.backup > Makefile
-	install -m 0644 Makefile Makefile.backup
-	sed -e 's,${libdir},${STAGING_LIBDIR},' < Makefile.backup > Makefile
+	sed -i -e 's,${includedir},${STAGING_INCDIR},' Makefile
+	sed -i -e 's,${libdir},${STAGING_LIBDIR},' Makefile
 	install -m 0644 Makefile ${STAGING_LIBDIR}/python${PYTHON_MAJMIN}/config/
 }
 
@@ -68,14 +70,18 @@ do_compile() {
 }
 
 do_install() {
+	# make install needs the original Makefile, or otherwise the inclues would
+	# go to ${D}${STAGING...}/...
+	install -m 0644 Makefile Makefile.sysroot
 	install -m 0644 Makefile.orig Makefile
-	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
 		STAGING_INCDIR=${STAGING_INCDIR} \
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		DESTDIR=${D} LIBDIR=${libdir} install
+	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	rm Makefile.sysroot
 
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
@@ -85,6 +91,13 @@ do_install() {
 	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+	# copy back the old Makefile to fix target package
+	install -m 0644 Makefile.orig ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+}
+
 require python-${PYTHON_MAJMIN}-manifest.inc
 
 # manual dependency additions
-- 
1.7.3.4



