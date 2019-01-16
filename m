Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id F10936BC7D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jan 2019 22:51:59 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id D98171C0036;
	Thu, 17 Jan 2019 11:51:58 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jan 2019 11:51:54 +1300
Message-Id: <20190116225154.12180-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] cmake.bbclass: make cleaning of build directory on configure optional
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
X-List-Received-Date: Wed, 16 Jan 2019 22:52:00 -0000

From: Sam Nobs <samuel.nobs@taitradio.com>

The do_configure task is sensitive to changes in recipes and configuration files.
This can be time consuming because cmake.bbclass deletes the ${B} directory
at the beginning of the do_configure task. CMake figures
out what to do when it's run again, so unless your cmake files are buggy, there shouldn't
be any need to erase the build directory and start afresh.

This change allows you to turn this behaviour off, either globally or on a per-recipe basis, e.g.

OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE_pn-yourrecipe = ""

Signed-off-by: Sam Nobs <samuel.nobs@taitradio.com>
---
 meta/classes/cmake.bbclass | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index fa7f68c99b..b9ec68ac9a 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -63,6 +63,11 @@ EXTRA_OECMAKE_BUILD_prepend_task-install = "${PARALLEL_MAKEINST} "
 OECMAKE_TARGET_COMPILE ?= "all"
 OECMAKE_TARGET_INSTALL ?= "install"
 
+# Clean the build directory before configuring.
+# Some recipes don't want/need this as cmake is perfectly
+# capable of figuring out what to do, so we allow it to be turned off
+OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE ??= "true"
+
 # CMake expects target architectures in the format of uname(2),
 # which do not always match TARGET_ARCH, so all the necessary
 # conversions should happen here.
@@ -133,12 +138,20 @@ cmake_do_configure() {
 		bbnote "cmake.bbclass no longer uses OECMAKE_BUILDPATH.  The default behaviour is now out-of-tree builds with B=WORKDIR/build."
 	fi
 
-	if [ "${S}" != "${B}" ]; then
-		rm -rf ${B}
-		mkdir -p ${B}
-		cd ${B}
+	if [ ${@oe.types.boolean('${OECMAKE_CLEAN_BUILDDIR_ON_CONFIGURE}')} = True ]; then
+		if [ "${S}" != "${B}" ]; then
+			rm -rf ${B}
+			mkdir -p ${B}
+			cd ${B}
+		else
+			# For an in-tree build, delete all object files and CMake artefacts
+			find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
+		fi
 	else
-		find ${B} -name CMakeFiles -or -name Makefile -or -name cmake_install.cmake -or -name CMakeCache.txt -delete
+		# Selectively delete CMake artefacts to ensure that -c configure has a consistent result
+		rm -f CMakeCache.txt
+		cmake_version=$(cmake --version | head -1 | sed 's#^[^0-9]*\([0-9.]*\).*$#\1#' )
+		rm -fr CMakeFiles/$cmake_version/
 	fi
 
 	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
-- 
2.17.1


