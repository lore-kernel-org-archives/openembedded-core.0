Return-Path: <peter.kjellerstedt@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4734F719AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 21:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B26B118231
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:04 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id OmNFZZtyPp5J
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from boulder02.se.axis.com (boulder02.se.axis.com [10.0.8.16])
	by bastet.se.axis.com (Postfix) with ESMTPS id 3B2A718149
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 265AB1A086
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from boulder02.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B5D01A072
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder02.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 0FA9E17C9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 23:34:03 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v3JGvBj1015395
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Apr 2017 18:57:11 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v3JGvBjG015394
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Apr 2017 18:57:11 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Apr 2017 18:57:09 +0200
Message-Id: <20170419165709.15354-1-pkj@axis.com>
X-Mailer: git-send-email 2.12.0
X-TM-AS-GCONF: 00
Subject: [PATCH] cmake.bbclass: Do not use bitbake variable syntax for shell variables
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
X-List-Received-Date: Wed, 19 Apr 2017 21:34:07 -0000

Using bitbake variable syntax (i.e., ${FOO}) for shell variables is
bad practice. First of all it is confusing, but more importantly it
can lead to weird problems if someone actually defines a bitbake
variable with the same name as the shell variable.

Also use lower case for local shell variables.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/classes/cmake.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cmake.bbclass b/meta/classes/cmake.bbclass
index 3f670919a8..20d8a61069 100644
--- a/meta/classes/cmake.bbclass
+++ b/meta/classes/cmake.bbclass
@@ -43,12 +43,12 @@ def map_target_arch_to_uname_arch(target_arch):
 
 cmake_do_generate_toolchain_file() {
 	if [ "${BUILD_SYS}" = "${HOST_SYS}" ]; then
-	    CMAKE_CROSSCOMPILING="set( CMAKE_CROSSCOMPILING FALSE )"
+		cmake_crosscompiling="set( CMAKE_CROSSCOMPILING FALSE )"
 	fi
 	cat > ${WORKDIR}/toolchain.cmake <<EOF
 # CMake system name must be something like "Linux".
 # This is important for cross-compiling.
-${CMAKE_CROSSCOMPILING}
+$cmake_crosscompiling
 set( CMAKE_SYSTEM_NAME `echo ${TARGET_OS} | sed -e 's/^./\u&/' -e 's/^\(Linux\).*/\1/'` )
 set( CMAKE_SYSTEM_PROCESSOR ${@map_target_arch_to_uname_arch(d.getVar('TARGET_ARCH'))} )
 set( CMAKE_C_COMPILER ${OECMAKE_C_COMPILER} )
@@ -107,13 +107,13 @@ cmake_do_configure() {
 
 	# Just like autotools cmake can use a site file to cache result that need generated binaries to run
 	if [ -e ${WORKDIR}/site-file.cmake ] ; then
-		OECMAKE_SITEFILE=" -C ${WORKDIR}/site-file.cmake"
+		oecmake_sitefile="-C ${WORKDIR}/site-file.cmake"
 	else
-		OECMAKE_SITEFILE=""
+		oecmake_sitefile=
 	fi
 
 	cmake \
-	  ${OECMAKE_SITEFILE} \
+	  $oecmake_sitefile \
 	  ${OECMAKE_SOURCEPATH} \
 	  -DCMAKE_INSTALL_PREFIX:PATH=${prefix} \
 	  -DCMAKE_INSTALL_BINDIR:PATH=${@os.path.relpath(d.getVar('bindir'), d.getVar('prefix'))} \
-- 
2.12.0


