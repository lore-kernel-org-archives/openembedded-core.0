Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86CCEC5CFDB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:35:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4712.1786566899377477740
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=aWFh9Vbx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684cb9286=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK2GhB3165167;
	Wed, 12 Aug 2026 20:34:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=1yTBg0Q1cp58uAC92S2AqeAOpGlUVVso3Bf3IQiSV8c=; b=
	aWFh9VbxK1T7/hW6gxWZhowPY2Ugj3aF7i2lkLVPS5jAGdVjjhYKCQbYRbZWL+jV
	q+NqB0AidK63U8m13hnaVDJqnNyyjTiiBLgDOhn7DDvNnahKVhMAJel+fGsIbYLS
	oYEt/BUA2ZSD80WaNhO2QVFCoxioNDmJR8u8Tlhc7dkcl/2Ivwnvl90wzB1nVEQ/
	Y1vh94gBwUVDUYb854SSIK68CRJaF+6lFqglEKV/zcH24IxL3IqEQkG32UksaPWS
	DceFk3Ijx+k9v05ptVTEp33iNkkJv5j8ejk5W0IQU/m/rVBSI7QOcsVBYEG3l6ul
	sOI+F8NOKzsXNrJ7shFPNQ==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysguuv5b-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Aug 2026 20:34:57 +0000 (GMT)
Received: from ala-p2exch01.corp.ad.wrs.com (10.11.226.101) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 12 Aug 2026 13:34:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch01.corp.ad.wrs.com (10.11.226.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 13:34:55 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 12 Aug 2026 13:34:56 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Wed, 12 Aug 2026 13:34:33 -0700
Subject: [PATCH v2 3/3] boost: Add support for Boost.Python NumPy extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260812-fix-boost-v2-3-cbcb65f5e186@windriver.com>
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
In-Reply-To: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: roQbdVt3c9kA0doNFO9lrkZupoAIpCjc
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX+GhegoyRdQOv
 cGSXlAnVzoYHPbN3pC6EpndGXaUr1n3TSLs3w1Tk/6RctflVaFVbX1GYLSWxf/Rs5odRAPJkzcS
 T/bxu01nvaGG1r79PtxKQ3jRJZaYsmALwQpKs6vWihwLpSl53Ir4
X-Authority-Analysis: v=2.4 cv=BYroFLt2 c=1 sm=1 tr=0 ts=6a7cd8f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=Hm44SGKBWFUMy9nAVjsA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX9auCK5Wx6nKj
 5vciWwJwxR4ywW+LutbzLvM6v8KGsFqAdPIffZYn3/A1veZhM2LjkJPu9Rdl6zANgCXu88jcUD5
 Dm4ng7EzaqTue1jfO1faB6brNhPAf1D+j9nIcJhJNHqibMrjQqVNHFqETxbNxlHB0d1WhLNkj8G
 KFa+ntV+ekPtAHJbxdaf1CIje+autnyw1ucYDg+o79qyoJky+8mWB8ASniEWsiKRRScLkNusUn6
 X7jmjFDNNBDoAzSEkR/DPAVViSDfCC0i1Sxunt9o+P7+3VJkYd3tpZfBlty8CA/DyUAdwPu3FVW
 KHNBT0q7kXRq3FiH1Y9LwClpbjTbR3vzU8Ql69aJIbuMg/VNdL/UASn9DXvfbiSz7zhgI/MbN7b
 ac7nEXOlE3D958UQmR/YMH0eIB641h64py0xrlkUxUne31+M/wLvqJlmDPGXGA66ZlCs1uxIci0
 KPrvE/oZTR7oRzgM6dQ==
X-Proofpoint-ORIG-GUID: roQbdVt3c9kA0doNFO9lrkZupoAIpCjc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Aug 2026 20:35:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243303

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


