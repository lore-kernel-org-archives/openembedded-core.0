Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6DDD1266D
	for <webhook@archiver.kernel.org>; Wed,  3 Dec 2025 05:33:44 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8291.1764740018707829298
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Dec 2025 21:33:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=B3szN3La;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=443295ddc8=changqing.li@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B35Kc8t3893570
	for <openembedded-core@lists.openembedded.org>; Wed, 3 Dec 2025 05:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=+XYQx4Njg68UMoM3S30o
	C5kaReV3OZkiv+Mk8WYi6m0=; b=B3szN3Lal8gn8qJFDw17VwKBNg0mNRt5kaSz
	JemmtBvcziZSElupvFJSxWKQQT4w1EeyGnzkktDYDSna/0+6NuIHZmndrmB7SJnS
	l2VTBUJT/0BO5Qx1A5+4uUtMoTZXTFxpBcWXlyVj76jkV+GYZy2OMJF61EPrJg+m
	SwXXQtw6Mth84l2gY1onZvgr09okIgwxA73x2cWaxM2AfXIboMBDPO14GYdIoGsv
	Ux6dXuRosXDJckoubYNpwz3+zxkMFVePIkaPTBzNiTdrUWcS9Mwp5LfX/v00lI9c
	sJBTw/oWe1CzF8ODetEhAebbAzOTJFqOjlMfcMRyBsEtr+uBow==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aqp21vexv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 05:33:37 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 2 Dec 2025 21:33:36 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 2 Dec 2025 21:33:35 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] python3-numpy: fix run-ptest
Date: Wed, 3 Dec 2025 13:33:34 +0800
Message-ID: <20251203053334.16868-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: Gd4hIZ-X5GsFESprFetaulOcXeM1vSZo
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=692fcbb1 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8
 a=x3nMLszsYbc4uoSlh2QA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDA0MSBTYWx0ZWRfXzHFnacO4cqyF
 1qLxPF9SyW9kbgtczfJ0hAGaVO2Mc5B0GEgHu/myu35P3yTm77N2/z6DVvhGn6jSjodl3+PuY8g
 i6XHtEABnXIRCI2zDEZddj8J1Y3POUBcg8m9hwczUxGo9IU/PcnbgSDJ86lzPlACSEDgdgCkkoz
 oDmdSiZIlyoZdvyJ3OFki2bmkjpbHr1dt+LcvNKEifHCj3lrZLLpLbmK20GEaIVB9tfYv8ZbUoc
 NuWMtxC3yLuPJQ2hpqYyTs+5fCL5XrGhzhFA/4p/7PIIp0qHGg82/EVUDDkXYBhDC+0LkFWEwLE
 ihHjUEOlUOir8Yi0TGOGzjuSMxIzL31gN3hmy+ixabdfpkXHph7ah9ZSDyGjCpk1ocDo6eAxwHR
 7NEbK8sVHzBHvz7Q52zD6qHWr8hjtQ==
X-Proofpoint-ORIG-GUID: Gd4hIZ-X5GsFESprFetaulOcXeM1vSZo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512030041
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Dec 2025 05:33:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227200

From: Changqing Li <changqing.li@windriver.com>

Hardcode path will make run-ptest not work when package is installed
under /usr/lib64, error like:
ERROR: file or directory not found: /usr/lib/python3.*/site-packages/numpy

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/python/python3-numpy/run-ptest | 4 ++--
 meta/recipes-devtools/python/python3-numpy_2.3.4.bb  | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-numpy/run-ptest b/meta/recipes-devtools/python/python3-numpy/run-ptest
index a1c80323d6..b5edc5cf48 100644
--- a/meta/recipes-devtools/python/python3-numpy/run-ptest
+++ b/meta/recipes-devtools/python/python3-numpy/run-ptest
@@ -5,7 +5,7 @@
 # the tests to report "no space left on device" errors. Create a custom
 # directory for these and point pytest at it so we can take advantage of the
 # storage provided in the rootfs.
-export PYTEST_DEBUG_TEMPROOT="/usr/lib/python3-numpy/ptest/tmp"
+export PYTEST_DEBUG_TEMPROOT="@PTEST_PATH@/tmp"
 mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 
 # test_mem_policy fails if there's no C compiler present, but we don't want to
@@ -13,5 +13,5 @@ mkdir -p "$PYTEST_DEBUG_TEMPROOT"
 # large amount of storage, so skip that too.
 # remove test_validate_transcendentals if
 # https://github.com/numpy/numpy/issues/27460 is resolved
-pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" /usr/lib/python3.*/site-packages/numpy
+pytest --automake -m "not slow" -k "not test_mem_policy and not test_big_arrays and not test_validate_transcendentals" @PYTHON_SITEPACKAGES_DIR@/numpy
 rm -rf "$PYTEST_DEBUG_TEMPROOT"
diff --git a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
index 7f82ca87a7..520c567bd4 100644
--- a/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
+++ b/meta/recipes-devtools/python/python3-numpy_2.3.4.bb
@@ -39,6 +39,12 @@ do_install:append() {
     nativepython3 -mcompileall -s ${D} ${D}${PYTHON_SITEPACKAGES_DIR}/numpy/__config__.py
 }
 
+do_install_ptest:append() {
+    sed -i \
+        -e 's|@PYTHON_SITEPACKAGES_DIR@|${PYTHON_SITEPACKAGES_DIR}|g' \
+        -e 's|@PTEST_PATH@|${PTEST_PATH}|g' ${D}${PTEST_PATH}/run-ptest
+}
+
 FILES:${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/_core/lib/*.a \
                           ${PYTHON_SITEPACKAGES_DIR}/numpy/random/lib/*.a \
 "
-- 
2.34.1


