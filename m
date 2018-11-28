Return-Path: <douglas.royds@taitradio.com>
Received: from smtp1.taitradio.net (unknown [202.37.96.23])
	by mail.openembedded.org (Postfix) with SMTP id 6A8796C485
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 20:52:57 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp1.taitradio.net (Postfix) with ESMTP id 7ED051C0681;
	Thu, 29 Nov 2018 09:52:57 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 09:52:50 +1300
Message-Id: <20181128205250.15333-4-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128205250.15333-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128205250.15333-1-douglas.royds@taitradio.com>
Subject: [PATCH v2 3/3] attr: Strip build host paths and tool versions from ptest files
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
X-List-Received-Date: Wed, 28 Nov 2018 20:52:58 -0000

Using the new PTEST_BUILD_HOST_FILES mechanism.
Specifically remove reference to build host rpm version, if any.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/attr.inc | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-support/attr/attr.inc b/meta/recipes-support/attr/attr.inc
index 9fc0f33cce..cfa38a7196 100644
--- a/meta/recipes-support/attr/attr.inc
+++ b/meta/recipes-support/attr/attr.inc
@@ -29,6 +29,9 @@ ALTERNATIVE_PRIORITY = "100"
 ALTERNATIVE_${PN} = "setfattr"
 ALTERNATIVE_TARGET[setfattr] = "${bindir}/setfattr"
 
+PTEST_BUILD_HOST_FILES = "builddefs"
+PTEST_BUILD_HOST_PATTERN = "^RPM"
+
 do_install_ptest() {
 	tar -c --exclude=ext test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	mkdir ${D}${PTEST_PATH}/include
@@ -36,12 +39,6 @@ do_install_ptest() {
 	  do cp ${S}/include/$i ${D}${PTEST_PATH}/include/; \
 	done
 	sed -e 's|; @echo|; echo|' -i ${D}${PTEST_PATH}/test/Makefile
-    
-	# Remove any build host references
-	sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -i ${D}${PTEST_PATH}/include/builddefs
 }
 
 RDEPENDS_${PN}-ptest = "attr coreutils perl-module-filehandle perl-module-getopt-std perl-module-posix"
-- 
2.17.1


