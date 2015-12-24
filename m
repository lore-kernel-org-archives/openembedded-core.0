Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85E51731A5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 10:00:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tBOA0vfm022304
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Dec 2015 02:00:57 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 24 Dec 2015 02:00:56 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Dec 2015 17:47:53 +0800
Message-ID: <f2632b42f6ee238729a9e4c040bf7a66c6229096.1450950403.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
In-Reply-To: <cover.1450950403.git.kai.kang@windriver.com>
References: <cover.1450950403.git.kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] bash: fix buildpaths qa check error
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
X-List-Received-Date: Thu, 24 Dec 2015 10:00:58 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Script bashbug and Makefile for ptest contain build related paths
which cause fail to pass buldpaths QA check.

Remove such paths from these 2 files.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta/recipes-extended/bash/bash.inc | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/bash/bash.inc b/meta/recipes-extended/bash/bash.inc
index 85639d3..93ca00b 100644
--- a/meta/recipes-extended/bash/bash.inc
+++ b/meta/recipes-extended/bash/bash.inc
@@ -45,13 +45,15 @@ do_install_append () {
 }
 do_install_append_class-target () {
 	# Clean host path in bashbug
-	sed -i -e "s,${STAGING_DIR_TARGET},,g" ${D}${bindir}/bashbug
+	sed -i -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+		-e "s,-I${WORKDIR}/\S* ,,g" ${D}${bindir}/bashbug
 }
 
 do_install_ptest () {
 	make INSTALL_TEST_DIR=${D}${PTEST_PATH}/tests install-test
 	cp ${B}/Makefile ${D}${PTEST_PATH}
-        sed -i 's/^Makefile/_Makefile/' ${D}${PTEST_PATH}/Makefile
+        sed -i -e 's/^Makefile/_Makefile/' -e "s,--sysroot=${STAGING_DIR_TARGET},,g" \
+	    -e "s,${S},,g" -e "s,${B},,g" -e "s,${STAGING_DIR_NATIVE},,g" ${D}${PTEST_PATH}/Makefile
 }
 
 pkg_postinst_${PN} () {
-- 
2.6.1


