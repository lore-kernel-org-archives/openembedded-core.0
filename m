Return-Path: <joe.slater@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F34671A15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 22:40:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9DMeQeh024989
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 15:40:26 -0700
Received: from ala-lpggp5.wrs.com (147.11.105.121) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Oct 2017 15:40:25 -0700
From: Joe Slater <jslater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Oct 2017 15:40:25 -0700
Message-ID: <20171013224025.138179-1-jslater@windriver.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
Subject: [PATCH 1/1] rpm: remove --sysroot from macros on target
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
X-List-Received-Date: Fri, 13 Oct 2017 22:40:27 -0000
Content-Type: text/plain

We do not want to specify --sysroot when defining __cc
used on a target.

Signed-off-by: Joe Slater <jslater@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index ea894a3..7866314 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -107,7 +107,8 @@ do_install_append_class-target() {
 }
 
 do_install_append () {
-	sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}/${libdir}/rpm/macros
+	sed -i -e 's:${HOSTTOOLS_DIR}/::g' \
+	    ${D}/${libdir}/rpm/macros
 
 	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
 	    ${D}${libdir}/rpm/pythondistdeps.py
@@ -127,3 +128,11 @@ FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 RPROVIDES_${PN} += "rpm-build"
 
 RDEPENDS_${PN} = "bash perl python3-core"
+
+PACKAGE_PREPROCESS_FUNCS += "rpm_package_preprocess"
+
+# Do not specify a sysroot when compiling on a target.
+rpm_package_preprocess () {
+	sed -i -e 's:--sysroot[^ ]*::g' \
+	    ${PKGD}/${libdir}/rpm/macros
+}
-- 
2.7.4


