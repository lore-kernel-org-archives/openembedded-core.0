Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 111A5C5B567
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:36:14 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35589.1786383370520156709
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:36:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AQPS4pOe;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2682d034ff=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGDFku1982807
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Bh6HBZlcCu3dWsfNWFl3ixOaKXtmX3f695f8DunO70I=; b=
	AQPS4pOet+PQoYLUiTj5yQ47bGpdmN0w5JOwwRDWVaLD0KQEd/mnPh5/NswnXKZO
	h/TCgkZ8sQaFBMr4JD1KdO8UOo8HVsY5mIJY2m7SwvG0u0+YqKChvQAmrEF7M393
	Kca0NXveBP/COUfAl/LAgWGoWSbXVP3MF2alSSK/hdAbnz93ZvNosDTYiGBpY2ZW
	BPD/pzIbE1P7mZEofQJj/f4NvlKdQ4E+mV/4xqZXrBAyJXYYeo4R+zFuV6mNrtyh
	tfTL4H2SxH6zsteDqx3I1GmdXQ8CcuPMf7CHw6/HVopFQ7dMf+AMcAwI8QBe+pWF
	lBdr+8U7oVmYpQgkVVFfVA==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue82wkr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 10 Aug 2026 10:36:08 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 10 Aug 2026 10:36:08 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Mon, 10 Aug 2026 10:35:51 -0700
Subject: [PATCH 2/2] boost: Add support for Boost.Python NumPy extension
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260810-fix-boost-v1-2-4e838b3d43b4@windriver.com>
References: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com>
In-Reply-To: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a7a0c09 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=Qq5IoJueWWSG_8e1w7YA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfXy6F1c5fn12L6
 VTtS27L4VxAKb8lBQ4J8GaZAo1cV9rU5WOeCz4MRa2XiEJWh+Gm1A6DrRa0+Bx0PaMON/8EPDiQ
 vANSihobu5VRw1Puiid0B+Muk4kfY3tNQqXzsJKrCDs/LFudPC+y
X-Proofpoint-GUID: qz_C58VGLu5RfHRaHm62OqW7-JmjRXRP
X-Proofpoint-ORIG-GUID: qz_C58VGLu5RfHRaHm62OqW7-JmjRXRP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfXxGe85/geeEaj
 aPa7Pz4GeYA5s+Clb6yDlx/BEqzDpCvDvSyH6hKf4MFG4rI8pTvPP04M/u++0mH2t7xJdrt81la
 iQbWhVjKfAkN5IL8eoP16JAznBsMyxtcZ/Kim7uwTu6vOsKGIOtXE42NxYGlkgKvOV1AbQBbKND
 mQP5oL1LfbwT+JwJJ0Fz2d3EtkWuLQzCugbcOYqBEGEEzcmwvgE0u6vPu+iyrWkThBIXKf4FquP
 NAhNSfMkeKb4PwFxDc82nutLAB4G2sJn711lf6s12XUuJKc1h0K9up/Dgw0woZc2AVqbo5OElHG
 wRd++igsmcYdZXJdOQ1e4d3JN0x3rOPGiF3vWjqnp0brcZTPpwNl3vIcBhecd/QzB5mR5xmLwhS
 cJb9RytxvOUZZp2DzMOOfDhfz/YQwimO7VsNGQ3CsNZhO693jYTdUdDYZCOjIUFxDpmI+EXi39n
 7gUssTAyb+vRRlx8i2A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_04,2026-08-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608100150
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243138

Support for NumPy was added to Boost release 1.63.

This additional numpy PACKAGECONFIG ensures that python3-numpy
is added as build-time and run-time dependencies.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index a718a735dd..9b1f717441 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -53,6 +53,7 @@ PACKAGECONFIG ??= "locale python"
 PACKAGECONFIG[locale] = ",,icu"
 PACKAGECONFIG[graph_parallel] = ",,,boost-mpi mpich"
 PACKAGECONFIG[mpi] = ",,mpich"
+PACKAGECONFIG[numpy] = ",,python3-numpy python3-numpy-native"
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

-- 
2.49.0


