Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96397C5CFEB
	for <webhook@archiver.kernel.org>; Wed, 12 Aug 2026 20:35:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4692.1786566898962303490
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Aug 2026 13:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kAeXizKT;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2684cb9286=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CK2GhA3165167;
	Wed, 12 Aug 2026 20:34:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xrJmixcKOaGBDUhYfS9jIPQXgzf5g3LvvdQvpvDShzE=; b=
	kAeXizKTzw/PLNYjrcdNCa2ElMwZbxrGekaqvzgCj0QByfACnwARlrzm6o/1VWtB
	g81dOgdiSpl5vUkGioXZhaLrbQlF5siNwY5lf9OiAFaMUMa8NMp48T1QPA2cqt69
	LhJfuruOPhi0Z6nVatDTCxIEoKYyrqFmISbeyivA1JAooMWhVsxTbYlEHk3trFLP
	ihuCbErkSRlDXdmeUJmQI7VDJdcTVdUDNVGrzUPPIwNpFfvGyY10wo0tWefBIFER
	F8uFMbSuX8lCcf50c/8KGO0CXcJmaFpJYaBMXSfN94yud8dOUbPE7GEisx1njcJP
	vxa1vNt0UEzzvRwXWM7d0Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fysguuv5b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 12 Aug 2026 20:34:57 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 12 Aug 2026 13:34:56 -0700
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Wed, 12 Aug 2026 13:34:55 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 12 Aug 2026 13:34:55 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Wed, 12 Aug 2026 13:34:31 -0700
Subject: [PATCH v2 1/3] boost: Use python3-native executable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260812-fix-boost-v2-1-cbcb65f5e186@windriver.com>
References: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
In-Reply-To: <20260812-fix-boost-v2-0-cbcb65f5e186@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Proofpoint-GUID: zszbhNdvZiuKR0rzEIVDTdTgUPBp0i5t
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX2g1LuQBoxeJl
 P3f5BgsdY2OPq/W4CNClw4cabikgWSC23nbxCvRqASKVB/7yvJuoXReGYKvmoUse2ZkWkfQT6Xl
 kShPSI1CpatEjlH3YVPSEKTegpDOb3W5prbrGQT3A9SHceXDuHJ7
X-Authority-Analysis: v=2.4 cv=BYroFLt2 c=1 sm=1 tr=0 ts=6a7cd8f1 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=hyE9ILhoWbok2qi314UA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2NSBTYWx0ZWRfX3yADo/n34rB1
 or8tqhGF5Me8C/0B+b5d4OWlplkxEKi9FSqNY2BccJ2rKAeuBamMLLZM1dkDtXwgmgMW5gHsISJ
 ffYld9BmkW/BSwQcv+t12ka3SXlrFKs3okXLgUwpKjZPYLvFs8JInAJflkKf1ljBMJOGKlUKDua
 qtjuFFslzwM1BwQ4r09xGLZTpmdD5znt5cPCwSEROQEt3TFII07OipFI5RR8w7fiXfNN6mjXvk5
 IpHlFugJk6wvO3YpyKGcq1wthuQWon2f+PJbl1pD1O6h6ZzayJEYa2k3rmX38GpJjzoWuoXcDNM
 mfwHOSlriyINFkCdZroFBRm1fPVB2svPMy1GqQgXQTAslGn75pLNsZkHwJGJwqrhGyEoDxtDt3Y
 8QVZa1kZm3HQVjx5sMlrs1tNrsyhfUmu6w57pq7+H6O17snfxqXtjcua4TEjlACePWGObXZoYdF
 bkEYcY9DD7Y5q2BicTQ==
X-Proofpoint-ORIG-GUID: zszbhNdvZiuKR0rzEIVDTdTgUPBp0i5t
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243300

The Boost build system executes Python in the compile task to
import the Numpy module and print the include directory.

We must specify the python3-native executable in the user-config.jam
so that the python.jam can execute it properly.

Without this change, it specifies a non-existant python executable
and reports "No such file or directory" in log.do_compile.

Signed-off-by: Rob Woolley <rob.woolley@windriver.com>
---
 meta/recipes-support/boost/boost.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/boost/boost.inc b/meta/recipes-support/boost/boost.inc
index 7a343e54f6..a718a735dd 100644
--- a/meta/recipes-support/boost/boost.inc
+++ b/meta/recipes-support/boost/boost.inc
@@ -173,7 +173,7 @@ do_configure() {
 
 	# If we want Python then we need to tell Boost *exactly* where to find it
 	if ${@bb.utils.contains('BOOST_LIBS', 'python', 'true', 'false', d)}; then
-		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_HOST}${bindir}/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
+		echo "using python : ${PYTHON_BASEVERSION} : ${STAGING_DIR_NATIVE}${bindir}/python3-native/python3 : ${STAGING_DIR_HOST}${includedir}/${PYTHON_DIR}${PYTHON_ABI} : ${STAGING_DIR_HOST}${libdir}/${PYTHON_DIR} ;" >> ${WORKDIR}/user-config.jam
 	fi
 
 	if ${@bb.utils.contains('BOOST_LIBS', 'mpi', 'true', 'false', d)}; then

-- 
2.49.0


