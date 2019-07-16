Return-Path: <Changqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 454867C79F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2019 03:49:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x6G3mvJe003000
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2019 20:49:07 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 15 Jul 2019 20:48:46 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jul 2019 11:48:42 +0800
Message-ID: <1563248922-209236-3-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1563248922-209236-1-git-send-email-changqing.li@windriver.com>
References: <1563248922-209236-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] mdadm: make ptest output format align with common style
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
X-List-Received-Date: Tue, 16 Jul 2019 03:49:16 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-extended/mdadm/files/run-ptest | 17 +----------------
 meta/recipes-extended/mdadm/mdadm_4.1.bb    |  8 ++++++++
 2 files changed, 9 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-extended/mdadm/files/run-ptest b/meta/recipes-extended/mdadm/files/run-ptest
index 234f973..e4a9c2b 100644
--- a/meta/recipes-extended/mdadm/files/run-ptest
+++ b/meta/recipes-extended/mdadm/files/run-ptest
@@ -1,19 +1,4 @@
 #!/bin/sh
 
-LOG="$(pwd)/test.log"
 # make the test continue to execute even one fail
-./test --keep-going 2>&1|tee ${LOG}
-# translate the test report
-# "tests/18imsm-r10_4d-takeover-r0_2d... succeeded" -> "PASS: tests/18imsm-r10_4d-takeover-r0_2d"
-# "tests/19raid6repair... FAILED - see //log for details" -> "FAIL: tests/19raid6repair"
-sed -i -e '/succeeded/ s/^/PASS: /' -e '/FAILED/ s/^/FAIL: /' ${LOG}
-sed -i -e 's/... FAILED//g' -e 's/... succeeded//g' ${LOG}
-passed=`grep PASS: ${LOG}|wc -l`
-failed=`grep FAIL: ${LOG}|wc -l`
-all=$((passed + failed))
-
-( echo "=== Test Summary ==="
-  echo "TOTAL: ${all}"
-  echo "PASSED: ${passed}"
-  echo "FAILED: ${failed}"
-) | tee -a /${LOG}
+./test --keep-going
diff --git a/meta/recipes-extended/mdadm/mdadm_4.1.bb b/meta/recipes-extended/mdadm/mdadm_4.1.bb
index 766004f..4978da7 100644
--- a/meta/recipes-extended/mdadm/mdadm_4.1.bb
+++ b/meta/recipes-extended/mdadm/mdadm_4.1.bb
@@ -73,6 +73,14 @@ do_install_ptest() {
 	cp -R --no-dereference --preserve=mode,links -v ${S}/tests ${D}${PTEST_PATH}/tests
 	cp ${S}/test ${D}${PTEST_PATH}
 	sed -e 's!sleep 0.*!sleep 1!g; s!/var/tmp!/!g' -i ${D}${PTEST_PATH}/test
+        sed -i -e '/echo -ne "$_script... "/d' \
+               -e 's/echo "succeeded"/echo -e "PASS: $_script"/g' \
+               -e '/save_log fail/N; /_fail=1/i\\t\t\techo -ne "FAIL: $_script"' \
+               -e '/die "dmesg prints errors when testing $_basename!"/i\\t\t\t\techo -ne "FAIL: $_script" &&' \
+               ${D}${PTEST_PATH}/test
+
+        chmod +x ${D}${PTEST_PATH}/test
+
 	ln -s ${base_sbindir}/mdadm ${D}${PTEST_PATH}/mdadm
 	for prg in test_stripe swap_super raid6check
 	do
-- 
2.7.4


