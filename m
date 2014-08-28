Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 55AB86AC85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 09:44:19 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7S9iIbC007578
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Aug 2014 02:44:19 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 28 Aug 2014 02:44:18 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 28 Aug 2014 17:39:12 +0800
Message-ID: <611d224aec6510fc04e1102773c5d6a577d396b6.1409195325.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1409195325.git.Chong.Lu@windriver.com>
References: <cover.1409195325.git.Chong.Lu@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] lttng-tools: fix ptest execution failure
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
X-List-Received-Date: Thu, 28 Aug 2014 09:44:25 -0000
Content-Type: text/plain

Ptest will hang when execute "./run.sh fast_regression" and lttng background
daemon can't be killed normally. This patch fixes this issue and use ${PTEST_PATH}
instead of long path.

Signed-off-by: Chong Lu <Chong.Lu@windriver.com>
---
 meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
index 14e5f9e..00d0cbc 100644
--- a/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
+++ b/meta/recipes-kernel/lttng/lttng-tools_2.5.0.bb
@@ -40,8 +40,8 @@ do_configure_prepend () {
 }
 
 do_install_ptest () {
-	chmod +x ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
-	for i in `find ${D}/${libdir}/${PN}/ptest -perm /u+x -type f`; do
+	chmod +x ${D}${PTEST_PATH}/tests/utils/utils.sh
+	for i in `find ${D}${PTEST_PATH} -perm /u+x -type f`; do
 		sed -e "s:\$TESTDIR.*/src/bin/lttng/\$LTTNG_BIN:\$LTTNG_BIN:g" \
 		  -e "s:\$TESTDIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
 		  -e "s:\$DIR/../src/bin/lttng-sessiond/\$SESSIOND_BIN:\$SESSIOND_BIN:g" \
@@ -56,8 +56,9 @@ do_install_ptest () {
 
 	sed -e "s:src/bin/lttng-sessiond:$bindir:g" \
 	    -e "s:src/bin/lttng-consumerd:${libexecdir}/libexec/:g" \
-	-i ${D}/${libdir}/${PN}/ptest/tests/regression/run-report.py
-	sed -e "s:src/bin:bin:g" \
-	-i ${D}/${libdir}/${PN}/ptest/tests/utils/utils.sh
-
+	-i ${D}${PTEST_PATH}/tests/regression/run-report.py
+	sed -e "s:src/bin:bin:g" -e "s:lt-::g" \
+	-i ${D}${PTEST_PATH}/tests/utils/utils.sh
+	sed -e "s:ini_config:\.libs\/ini_config:" \
+	-i ${D}${PTEST_PATH}/tests/unit/ini_config/test_ini_config
 }
-- 
1.9.1


