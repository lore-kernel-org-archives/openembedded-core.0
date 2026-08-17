Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71ACDC5DF66
	for <webhook@archiver.kernel.org>; Mon, 17 Aug 2026 18:05:58 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1248.1786989950323865466
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2026 11:05:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mXNEgfao;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26897b1a80=rob.woolley@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HFTbJx2855610;
	Mon, 17 Aug 2026 11:05:49 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xrJmixcKOaGBDUhYfS9jIPQXgzf5g3LvvdQvpvDShzE=; b=
	mXNEgfao5Au9uSTpxpnWWfg/oDtp4s5JCYzzbJRE523Ebzvb8oKYz6asEqSA2DUe
	iWTqj5OIZ0FAWMdELqUkuybhjCFCV11xFZv4Kymw9e/0RcUbtNHamO84osURAdqP
	3zvzM1ZY/8UyoFR2drj3MwYEF6Mja9lADirNRVwx3odDx2OSZehCOAiQ58VVfWTV
	pT4PhzyYtWFkGejeIL9ghPzF/eqMZwiUAJHZharkXCYcseDw4FECcjmjcx+yNXt4
	iWz19ptcznXsz7nERljIvTEz+622+S3eKwD7NsrxnSXcpVd6pnWICABVn6Ntupas
	htCfatLfIPUecH2u8ZCl9A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4g2qmgu399-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 17 Aug 2026 11:05:48 -0700 (PDT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 17 Aug 2026 11:05:48 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 17 Aug 2026 11:05:47 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 17 Aug 2026 11:05:47 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Mon, 17 Aug 2026 11:05:44 -0700
Subject: [PATCH v3 1/3] boost: Use python3-native executable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260817-fix-boost-v3-1-499c48e4fa56@windriver.com>
References: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
In-Reply-To: <20260817-fix-boost-v3-0-499c48e4fa56@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>, <alex.kanavin@gmail.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=br98wkai c=1 sm=1 tr=0 ts=6a834d7c cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=hyE9ILhoWbok2qi314UA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 6iYWQt0pEk4vhfuAqlbxp0LBl7xjgVbx
X-Proofpoint-ORIG-GUID: 6iYWQt0pEk4vhfuAqlbxp0LBl7xjgVbx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfX5KB6VwYDWYNr
 q/PV0N1GVNusCwuRn8HKTEfn92VjoSW+bropdy7z5bKQzKKFwtjyx7PkM1k+Yv0F4WjpwugzRE+
 0zeLD57akE4HeqEknp0bjpkEal1c5z+xWPsMz31jfCo7bSNXjqhKxle7WYjEHmpe9GADcAMyeuj
 woFR1t13L84Dh0LjDYXTqYby1PxKWfymzxPNEZq1BKcclEn9lMNSKxCJ7FF4JMHO3FHwiF1llFk
 evSgEE6XZOjQZkrOmqZzhN3X+S/XnkCzh8J1DOXCfqp9HmRu01G7HgyjaQvu0kwqWM0RJmG2JTt
 FsKdU+B5IMG+4ugVEPQ7zrmq2/Rv6S6BrnbQ8MO1aO0KdfWjJeX1DJ6XqPT7NmZupfYozeW4QZo
 tcJMqlK6Tr4HXEr56Sc9dh72UeoUdcHO7GMsYtb51XY7IxkPMwch2aBKMukqeIsuzEqkPSCX1xF
 PB1s/Q6bGwFW5S3GZTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDEzOCBTYWx0ZWRfX8mDCbZHjWgYx
 pTf8PuLwz0lhacH8aMLTSUnC6eO6CH9wQ0TqNoEpt3GHMF0mO5d7FMbgi2SW2SomHFWPVbhFToH
 0cnN2e2eDSGi+7iYs92urUqaF5kUOCigYN62z+vvMPS/ZB6Klatx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2026 18:05:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243629

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


