Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id 1C0B1783B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 13:53:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id D34CD2E1A1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:19 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id MPA2vlghkD3k
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (boulder03.se.axis.com [10.0.8.17])
	by bes.se.axis.com (Postfix) with ESMTPS id ACB7E2E1C5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95D641E056
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from boulder03.se.axis.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B0881E076
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from seth.se.axis.com (unknown [10.0.2.172])
	by boulder03.se.axis.com (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by seth.se.axis.com (Postfix) with ESMTP id 7F657DDF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id v5FDrFGX010377
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 15:53:15 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id v5FDrFnR010376
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Jun 2017 15:53:15 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 15:53:05 +0200
Message-Id: <51edd9ddac23497337640c4e63dee744338b095b.1497534748.git.pkj@axis.com>
X-Mailer: git-send-email 2.12.0
In-Reply-To: <cover.1497534748.git.pkj@axis.com>
References: <cover.1497534748.git.pkj@axis.com>
X-TM-AS-GCONF: 00
Subject: [PATCH 03/11] rpm: Add dependencies on bash, perl and python3-core
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
X-List-Received-Date: Thu, 15 Jun 2017 13:53:21 -0000

Also modify a Python script (pythondistdeps.py) to use Python 3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index 2a0dcafac7..30702a7507 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -103,6 +103,9 @@ do_install_append_class-target() {
 
 do_install_append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}/${libdir}/rpm/macros
+
+	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
+	    ${D}${libdir}/rpm/pythondistdeps.py
 }
 
 FILES_${PN} += "${libdir}/rpm-plugins/*.so \
@@ -117,3 +120,5 @@ FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
 # rpm 5.x was packaging the rpm build tools separately
 RPROVIDES_${PN} += "rpm-build"
+
+RDEPENDS_${PN} = "bash perl python3-core"
-- 
2.12.0


