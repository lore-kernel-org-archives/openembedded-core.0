Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FDADD68BD5
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 03:25:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.73784.1766373902360595203
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Dec 2025 19:25:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ApuLkEGu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4451a15d49=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM2q2ho840300
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 19:25:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=sy1D6oOMQZVGrRFIxZUy
	tSPXzWyeArdJYpgAqcPJr4Q=; b=ApuLkEGux0Qp0NbAv2txHiKa4TWap+PuUek/
	DtkVYuo+7XbQUkCTvAgJd8XEpsEAjCZrFAaQg/wC9gp063wE5EdXnfJbOLvArgeo
	j093j9JgTo2h45WbZnfAmz3PuUkNVYLWbCG73NMVfOrVFqTNKGBgiMRMccLcCCh0
	FJ13oXc0DoPvcM/zxSFWBhmlEAh9zn1eTxLMOudJxfVA+7iTNLmTZAM9fhieZ7zV
	861sbcTLpoyl3YZxDuFsGVpxG6AP47X3ShTlFPred5QbDpN+uKSWAez2nuOrbQ17
	X+ljIFTW8rvJhELiEPlym7rG0Kzfv9eh4BKQ7ed10Mxz0Ui+BQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5qy4s6fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 21 Dec 2025 19:25:01 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 21 Dec 2025 19:25:01 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 21 Dec 2025 19:25:00 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: fix multilib file conflicts
Date: Mon, 22 Dec 2025 11:24:55 +0800
Message-ID: <20251222032455.2683666-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 7cDvqGuZfWk6aRgikeFhMif9I3Mwnf-D
X-Authority-Analysis: v=2.4 cv=Q+vfIo2a c=1 sm=1 tr=0 ts=6948ba0d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=LEaydxAqHRweoTFkjBQA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDAyOCBTYWx0ZWRfX322/VEhEipq3
 6c/vqdWkY5rmePBgU6423eg3PSxW31qLt7rml01D1xPMkhfNvgRQVhUS8Qy8zoNbsrDuyj50Kh+
 m31rrWbAPoAHA21+gyubJZY70UXTTn9CfNv+V5NoWokwJmYRKSfIPMh3TAcPsHcpwzBCzwSTP3S
 9iFJSqb7ewgM1CtSTtR9M6fHTLJbLPa7YN9tRREp1Ked/su/jZWJjlmm+m1WYuO/VzNXEzF6afO
 F11JmlT5fT8lmFM8ZsG1xZU2oiSb1/2yLymN0OAUjTZjZHr/RrOrLdAJWACJOrN8ZEzWgGgq9OW
 3u/mZtJfl6ibpR+I8vjzS9IAGIhDqZbP3dW+noNjuKtX4IAQGusnKolC9rNiLU9++PIJCXIkhJg
 GuZz9Lgsl8Ng+eXvFAZn+4b2tCGHGmPQPXD3m51HsiywQmDJ7LJPWfLtzdbSNIy/KkxFFyC5WrX
 EvpPdxFU6MTJI6IqDtA==
X-Proofpoint-ORIG-GUID: 7cDvqGuZfWk6aRgikeFhMif9I3Mwnf-D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220028
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 03:25:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228279

From: Changqing Li <changqing.li@windriver.com>

This is for fixing the following error of 'bitbake meta-go-toolchain'
when multilib is enabled:
Error: Transaction test error:
   file /usr/bin/go conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32
   file /usr/bin/gofmt conflicts between attempted installs of go-1.25.4-r0.x86_64_v3 and lib32-go-1.25.4-r0.core2_32

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/go/go_1.25.4.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/go/go_1.25.4.bb b/meta/recipes-devtools/go/go_1.25.4.bb
index 46f5fbc6be..372aa9538c 100644
--- a/meta/recipes-devtools/go/go_1.25.4.bb
+++ b/meta/recipes-devtools/go/go_1.25.4.bb
@@ -1,7 +1,7 @@
 require go-${PV}.inc
 require go-target.inc
 
-inherit linuxloader
+inherit linuxloader multilib_script
 
 CGO_LDFLAGS:append = " -no-pie"
 
@@ -9,6 +9,8 @@ export GO_LDSO = "${@get_linuxloader(d)}"
 export CC_FOR_TARGET = "gcc"
 export CXX_FOR_TARGET = "g++"
 
+MULTILIB_SCRIPTS = "${PN}:${bindir}/go ${PN}:${bindir}/gofmt"
+
 # mips/rv64 doesn't support -buildmode=pie, so skip the QA checking for mips/riscv32 and its
 # variants.
 python() {
-- 
2.34.1


