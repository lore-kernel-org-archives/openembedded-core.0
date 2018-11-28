Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id E99826D4C2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 23:43:53 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id E1F5B2205F7;
	Thu, 29 Nov 2018 12:43:49 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 12:43:44 +1300
Message-Id: <20181128234345.19191-8-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20181128234345.19191-1-douglas.royds@taitradio.com>
References: <20181128045316.24102-1-douglas.royds@taitradio.com>
	<20181128234345.19191-1-douglas.royds@taitradio.com>
Subject: [PATCH v4 7/8] acl: Strip build host tool details from installed ptest file
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
X-List-Received-Date: Wed, 28 Nov 2018 23:43:55 -0000

Adopt the PTEST_BUILD_HOST_FILES mechanism to strip build host paths from the
installed builddefs file. Also strip the record of the build host rpm version.

Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 meta/recipes-support/attr/acl_2.2.52.bb | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-support/attr/acl_2.2.52.bb b/meta/recipes-support/attr/acl_2.2.52.bb
index 318308a009..6bc77d868d 100644
--- a/meta/recipes-support/attr/acl_2.2.52.bb
+++ b/meta/recipes-support/attr/acl_2.2.52.bb
@@ -39,15 +39,12 @@ do_install_append() {
 
 inherit ptest
 
+PTEST_BUILD_HOST_FILES = "builddefs"
+PTEST_BUILD_HOST_PATTERN = "^RPM"
 do_install_ptest() {
 	tar -c --exclude=nfs test/ | ( cd ${D}${PTEST_PATH} && tar -xf - )
 	install -d ${D}${PTEST_PATH}/include
 	install -m 644 ${S}/include/builddefs ${S}/include/buildmacros ${S}/include/buildrules ${D}${PTEST_PATH}/include/
-	# Remove any build host references
-	sed -e "s:--sysroot=${STAGING_DIR_TARGET}::g" \
-	    -e 's:${HOSTTOOLS_DIR}/::g' \
-	    -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
-	    -i ${D}${PTEST_PATH}/include/builddefs
 }
 
 RDEPENDS_${PN}-ptest = "acl bash coreutils perl perl-module-filehandle perl-module-getopt-std perl-module-posix shadow"
-- 
2.17.1


