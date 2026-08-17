Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 572A6C5B572
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 18:06:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1149.1786989959100467145
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 11:05:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IeCaDLfj;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=26897b1a80=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFU1482456684;
	Mon, 17 Aug 2026 18:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1yTBg0Q1cp58uAC92S2AqeAOpGlUVVso3Bf3IQiSV8c=; b=
	IeCaDLfjCp3NWKzeZGpmWO/SrI3bw9vUwfpN1ba4F0cZB67U996s3Fszc89MGd/J
	wN0pktksn1I0IOQheukAerNRJpe6RcyPDJul2FdqM/g2JCsDNC+n858864WKHWQv
	6MzxWc1Nq4RDRgsubYnQHnmj9YTdu3NL++DiarmHJO+8hK2psKTYdOAew4KV+Bx2
	3KyeFaCvaxsIdGKmuhx2by5JcDbrP3h2WwRJ3yxAn/mZTpQhW4iJH0wVd9lFA2k0
	fjuv438NXKDesNoaHg7I88U1J7ZOVctUuACWg4r9tK2c/Trl7r127HQRZ752zrlt
	Fkd6CSCw9Q8NkUdujhj5MQ==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2f33ud14-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2026 18:05:49 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Aug 2026 11:05:48 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 17 Aug 2026 11:05:48 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Mon, 17 Aug 2026 11:05:46 -0700
Subject: [PATCH v3 3/3] boost: Add support for Boost.Python NumPy extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260817-fix-boost-v3-3-499c48e4fa56@windriver.com>
References: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
In-Reply-To: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfX6EspcaTSfJ/3
 yno9l5bgxFVtwQjv4sR+R8aV8EbPqjCBCrBdgyrmnAIqmBsFV5zaBggv595s81X9CciNeQeOeok
 ezgOTNWgIkw1IZ4J/IBRowXMUXqY9Rly8kKklsP6imxdEI11waChYOLKow3mmeEAJYmlbQ2D67p
 p2ExE18Jgy42MXXCgOs9OQl9xpsQAbO1Bjn4QvFuZ9RGkvQoOO46zcuRs8T2UQ3B2BiiHPvrRe6
 yiXqUOvFsBQSfLxRNThj9RMcjeJpZYDw6JH+A3uFohEKuX/7FvYOvv5TiwP4J3wz7yOpfyQ5rtp
 ug4YMn/QjDmFNRT5ceuRr6OqPFChiMwJdXAQwGwbQPiWE381dT6erq1aWu8DHYz8eiAxciDJznT
 nTMmNuMPUgSwBR8I34PBt+P1eXZEBtdPszzuIawe22xTG8wfFixsh8jWYjUPQRk/k6ihxpfzEbK
 HDLRGfhs2+FY8PX67kQ==
X-Authority-Analysis: v=2.4 cv=JYuMa0KV c=1 sm=1 tr=0 ts=6a834d7d cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=Hm44SGKBWFUMy9nAVjsA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: lq8rliLpA7E6f-9qfOenrHlM-C9mbRE4
X-Proofpoint-GUID: lq8rliLpA7E6f-9qfOenrHlM-C9mbRE4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfXxTIWHfw45uBI
 d+czVP4WrSnmFpUr2Ih2KGv3ICXrwDZ4m4O7X1+d5zTSDg6gEFU7yHqjYxytnrCDSH9jQThsAHF
 Hz7fpeJmRz22SQO6o73BZHwR3kT7dAPwqmYG+D0ME8Xs0m5bO6Bc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 18:06:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243632

Support for NumPy was added to Boost release 1.63.

This additional numpy PACKAGECONFIG ensures that python3-numpy
is added as build-time and run-time dependencies. It uses the
custom-made python-numpy-include feature to supply the directory
for the numpy module headers to the b2 build system.

If numpy is not added the PACKAGECONFIG it will still attempt the
probe and fail gracefully like before.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index a718a735dd..e0ffc20447 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG ??= "locale python"
 PACKAGECONFIG[locale] = ",,icu"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
+PACKAGECONFIG[numpy] = ",,python3-numpy"
 PACKAGECONFIG[python] = ",,python3"
 
 inherit python3-dir
@@ -86,6 +87,8 @@ FILES:${PN}-serialization = "${libdir}/libboost_serialization*.so.* \
 	${libdir}/libboost_wserialization*.so.*"
 FILES:${PN}-test = "${libdir}/libboost_prg_exec_monitor*.so.* \
 	${libdir}/libboost_unit_test_framework*.so.*"
+FILES:${PN}-python = "${libdir}/libboost_python*.so.* \
+        ${libdir}/libboost_numpy*.so.*"
 
 # -dev last to pick up the remaining stuff
 PACKAGES += "${PN}-dev ${PN}-staticdev"
@@ -173,7 +176,11 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_NATIVE}${bindir}/python3-native/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		if ${@bb.utils.contains('PACKAGECONFIG', 'numpy', 'true', 'false', d)}; then
+                        # Use the python-numpy-include feature patched in to boost-build-native
+			ENABLE_NUMPY="<python-numpy-include>${STAGING_LIBDIR}/${PYTHON_DIR}/site-packages/numpy/_core/include"
+		fi
+		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_NATIVE}${bindir}/python3-native/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} : ${ENABLE_NUMPY} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then

-- 
2.49.0


