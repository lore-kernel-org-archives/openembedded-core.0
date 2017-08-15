Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 14E5B78253
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Aug 2017 21:43:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7FLhaVW021452
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Aug 2017 14:43:36 -0700 (PDT)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 15 Aug 2017 14:43:36 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 Aug 2017 16:41:52 -0500
Message-ID: <1502833317-48183-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
References: <1502833317-48183-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
Cc: peter.kjellerstedt@axis.com
Subject: [PATCH 1/6 v2] rpm: Add dependencies on bash, perl and python3-core
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
X-List-Received-Date: Tue, 15 Aug 2017 21:43:38 -0000
Content-Type: text/plain

From: Peter Kjellerstedt <pkj@axis.com>

Also modify a Python script (pythondistdeps.py) to use Python 3.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/rpm/rpm_git.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/rpm/rpm_git.bb b/meta/recipes-devtools/rpm/rpm_git.bb
index d9ff2c7..513b569 100644
--- a/meta/recipes-devtools/rpm/rpm_git.bb
+++ b/meta/recipes-devtools/rpm/rpm_git.bb
@@ -106,6 +106,9 @@ do_install_append_class-target() {
 
 do_install_append () {
 	sed -i -e 's:${HOSTTOOLS_DIR}/::g' ${D}/${libdir}/rpm/macros
+
+	sed -i -e 's|/usr/bin/python|${USRBINPATH}/env ${PYTHON_PN}|' \
+	    ${D}${libdir}/rpm/pythondistdeps.py
 }
 
 FILES_${PN} += "${libdir}/rpm-plugins/*.so \
@@ -120,3 +123,5 @@ FILES_python3-rpm = "${PYTHON_SITEPACKAGES_DIR}/rpm/*"
 
 # rpm 5.x was packaging the rpm build tools separately
 RPROVIDES_${PN} += "rpm-build"
+
+RDEPENDS_${PN} = "bash perl python3-core"
-- 
1.8.3.1


