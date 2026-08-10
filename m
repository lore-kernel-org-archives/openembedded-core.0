Return-Path: <rob.woolley@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7FB3C5AD7B
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 17:36:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.35158.1786383370895483839
 for <openembedded-core@lists.openembedded.org>;
 Mon, 10 Aug 2026 10:36:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=AIH/HW9P;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2682d034ff=rob.woolley@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67AGDFkv1982807
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=xrJmixcKOaGBDUhYfS9jIPQXgzf5g3LvvdQvpvDShzE=; b=
	AIH/HW9P8BgENT/0m6rmFuqQ5Bl9zzDGkt3NYmocsyr1/XQO3o9ddgz/LJ3WWNLa
	WGx+Wrg8k9lfNWIZNdegL5xDI4+Mo9W8QQHSx/v6svbKapLboacATn3ww7EdCXQs
	Dn5Ck3f4jwJ7By5nYZbjO1I6XInz6oScCFOOMjJfyCA46DD2WywnO7+HvjbYMQB8
	gS/9fP9RHFeVXKBTLqnpEQy9ypsY3cdBkUNk243qLtmvw4gVNAyzRbcR1hSOZ8N/
	cn0Z2W49/fLld7Syd7ry+L0qMLGht7et7+1oreE7nmq34DWxojePKDMAc9ZeZca/
	4lkehX6Gy+D//TNTLN3a4g==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwue82wkr-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:09 +0000 (GMT)
Received: from ala-p2exch02.corp.ad.wrs.com (10.11.226.102) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 10 Aug 2026 10:36:08 -0700
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-p2exch02.corp.ad.wrs.com (10.11.226.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Mon, 10 Aug 2026 10:36:08 -0700
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 10 Aug 2026 10:36:08 -0700
From: Rob Woolley <rob.woolley@windriver.com>
Date: Mon, 10 Aug 2026 10:35:50 -0700
Subject: [PATCH 1/2] boost: Use python3-native executable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260810-fix-boost-v1-1-4e838b3d43b4@windriver.com>
References: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com>
In-Reply-To: <20260810-fix-boost-v1-0-4e838b3d43b4@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: Rob Woolley <rob.woolley@windriver.com>
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=A6tc+aWG c=1 sm=1 tr=0 ts=6a7a0c09 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=t7CeM3EgAAAA:8
 a=hyE9ILhoWbok2qi314UA:9 a=QEXdDO2ut3YA:10 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfXyGZZEKVkaRVI
 ag/778jRpnWfGxJZ7QcvasbwtXv/cPN5jkr1LP/kwgZ+ECFJ3B6/mInGlnWLuuMw/Lq+knWgALV
 oJ6/yXcr+pq0qmSlPTZDyPfb13toxPDz32diA8JUNQ3Eeac6ceO4
X-Proofpoint-GUID: aylfqKz-Hgpudig4C_hdzRekK8XmbhAI
X-Proofpoint-ORIG-GUID: aylfqKz-Hgpudig4C_hdzRekK8XmbhAI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDE1MCBTYWx0ZWRfX/obwdhNTYLK6
 sJooGnPtRxVyMhhSW1OnGDED64qcdbvk6Fp7rJ105M1RpiRv+qoLqgg6StorjczsNiA1kFhncUC
 ZGDWu2T7F2RYOe0SH9L+x/jexA26LuTi+uqZ4Xb4AWz3WF48RT0Fqf6fodA6QOGMt3QCKMbPUDh
 9stFerhAzdsVg4YRoaQTBA/eeJKbzsPS99fn5bLgmFVFsDPWERS6Qiv5B/l8seGuy3f06zrzs6M
 I2+HZ9+/Dlmth8ZvzCyPnzLvXpYtK9f/xVslg8bJp5+o7o9AtMx71RlEuTMesDoqTFix8LS1yiL
 PK/tRwKxeIZKNxzgajzsiXQi/RiZSB43UFCQakniy/wkDkvH1/Le7Ya+NCJ5wIE4RjkTlMIgQtC
 AhWq9dc5Jb+/AXJlsSm7PlPjRDatES0xlI7247LpwvNEIhP/dcSYuwd9F+Nv6PRuDxdz2tDoNSG
 OhkrRrca3pCxghnfksA==
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
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 17:36:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243140

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


