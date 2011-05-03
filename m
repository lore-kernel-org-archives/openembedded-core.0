Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <michael.lippautz@gmail.com>) id 1QHIhK-0000Zj-97
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 18:43:43 +0200
Received: by fxm19 with SMTP id 19so262380fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2011 09:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer;
	bh=5HW4Wt43hyeyCmQppHlPRyAEUypUJluOhTcXlDhfO/w=;
	b=jZWMBAOIU1ou/O767Z+Ub3OH9ikUAYilYyYy6xV6tgZHZ0cOqBkvJKcnpZdQEMjsIT
	cDa72H4I/Fheo+2D3VMQkfQN9UfP2ry+gJIal6aOMyOvLbek4NyQFlL8F8Lnr8r0EKmF
	EL1K+YiDoRoD7hQhbxz3QwKOUPRMPsfoonGM0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=XtvKckBUnBTP5kB6TDi+4u0jEwPCpCNC1C8cNXebhBwcGelMh5olNvWYGdp/LVJ4Lo
	w8E7snn9GPLkCoYHSlZYTGDf/PG5XqTLAYJkpxdyIoGJS6Iu6izeG+b1K7Y9bhWdIJzP
	1aw18Uet+W0LUdR4OtCVYk5rcfIRncQvFbeks=
Received: by 10.223.68.193 with SMTP id w1mr71662fai.42.1304440864799;
	Tue, 03 May 2011 09:41:04 -0700 (PDT)
Received: from localhost.localdomain ([62.218.44.194])
	by mx.google.com with ESMTPS id p16sm81414fax.45.2011.05.03.09.41.04
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 09:41:04 -0700 (PDT)
From: Michael Lippautz <michael.lippautz@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2011 18:40:34 +0200
Message-Id: <1304440834-4253-1-git-send-email-michael.lippautz@gmail.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCHv2] python: Unbreak Python third-party extensions
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
X-List-Received-Date: Tue, 03 May 2011 16:43:43 -0000

This patch fixes compilation/linking of python third-party extensions, i.e.
Extensions that ship with C code.

Problem:
Python uses distutils(-native) to compile third-party extensions. distutils
uses its own sysconfig module to get the options for compiling and linking.
Since third-party extensions have to be linked against this libpython it
important that -L points into staging. This is not the case because
distutils.sysconfig uses a special Makefile that is shipped with python
determine the paths. The Makefile is the same that would be used on the
target to build third-party extensions. It therefore points into /usr/lib
instead of staging.

Solution:
Stage a modified version of the Makefile where the paths (incdir, libdir) have
been replaced by ones that point into staging.

Side-problem:
The recipe actually should not stage files itself in do_compile, but rather
handle everything that needs to be staged in do_install. This is currently not
possible because python compiles itself using distutils-native. Distutils on
the other hand does only allow to add a path, but not to substitute it,
requiring a staged Makefile and libpython.so before the actual python
compilation is triggered.

The second step to solve this would be to either patch distutils, or split
python into python-initial and python. The -initial part could create the
Makefile and the library, while the main part focuses on the target.

For further references see:
 http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/001752.html

Signed-off-by: Michael Lippautz <michael.lippautz@gmail.com>
Acked-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/python/python_2.6.6.bb |   41 +++++++++++++++++---------
 1 files changed, 27 insertions(+), 14 deletions(-)

diff --git a/meta/recipes-devtools/python/python_2.6.6.bb b/meta/recipes-devtools/python/python_2.6.6.bb
index 3a0a056..f438286 100644
--- a/meta/recipes-devtools/python/python_2.6.6.bb
+++ b/meta/recipes-devtools/python/python_2.6.6.bb
@@ -1,7 +1,7 @@
 require python.inc
 DEPENDS = "python-native db gdbm openssl readline sqlite3 zlib"
 DEPENDS_sharprom = "python-native db readline zlib gdbm openssl"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=38fdd546420fab09ac6bd3d8a1c83eb6"
 
 DISTRO_SRC_URI ?= "file://sitecustomize.py"
@@ -34,23 +34,26 @@ do_configure_prepend() {
 	autoreconf -Wcross --verbose --install --force --exclude=autopoint Modules/_ctypes/libffi || oenote "_ctypes failed to autoreconf"
 }
 
-#
-# Copy config.h and an appropriate Makefile for distutils.sysconfig,
-# which laters uses the information out of these to compile extensions
-#
-do_compile_prepend() {
+do_compile() {
+	#
+	# Copy config.h and an appropriate Makefile for distutils.sysconfig,
+	# which laters uses the information out of these to compile extensions
+	#
+	# The following part (until python compilation) should probably moved to an
+	# -initial recipe to handle staging better
+	#
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
-}
 
-do_compile() {
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
 		HOSTPYTHON=${STAGING_BINDIR_NATIVE}/python \
 		STAGING_LIBDIR=${STAGING_LIBDIR} \
@@ -69,6 +72,9 @@ do_compile() {
 }
 
 do_install() {
+	# make install needs the original Makefile, or otherwise the inclues would
+	# go to ${D}${STAGING...}/...
+	install -m 0644 Makefile Makefile.sysroot
 	install -m 0644 Makefile.orig Makefile
 	
 	oe_runmake HOSTPGEN=${STAGING_BINDIR_NATIVE}/pgen \
@@ -78,12 +84,19 @@ do_install() {
 		BUILD_SYS=${BUILD_SYS} HOST_SYS=${HOST_SYS} \
 		DESTDIR=${D} LIBDIR=${libdir} install
 
+	install -m 0644 Makefile.sysroot ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+	rm Makefile.sysroot
+
 	if [ -e ${WORKDIR}/sitecustomize.py ]; then
 		install -m 0644 ${WORKDIR}/sitecustomize.py ${D}/${libdir}/python${PYTHON_MAJMIN}
 	fi
+}
 
-	# remove hardcoded ccache, see http://bugs.openembedded.net/show_bug.cgi?id=4144
-	sed -i -e s,ccache,'$(CCACHE)', ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+	# copy back the old Makefile to fix target package
+	install -m 0644 Makefile.orig ${D}/${libdir}/python${PYTHON_MAJMIN}/config/Makefile
 }
 
 require python-${PYTHON_MAJMIN}-manifest.inc
-- 
1.7.3.4



