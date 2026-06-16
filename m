Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A7ECD98DA
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 09:39:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.150638.1781602757161606726
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 02:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=JztChmWN;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0627f155f3=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G8046w2882050
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:39:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=L5nINFX43C8A87EBVhGa
	L32Vlv8H7iJkZHyk69We7y8=; b=JztChmWN7v6BDj12q8G367TPsIzJ+gRW/ZKm
	IegRYajWiMiRicxBiN9ClSh7bEb4/R6ccExhzpNVB3ALHN4FXzA/vqqR4Vt5Ajrw
	tF0vdY+LqnjXhZe+dMvHRHZMpJF36RLaxZ5zJdd/PuPyszyvp6nxQQUhsfQ59IkB
	ouFxOjTocuD3/iyVzKGoCQzGH4rkIclWyKOLRAj3bcUH2kNWz0KznU8B7YUtxG7P
	0VoqmvrfU/Rl5BB6W5yKEzer7aGDyo5pp6rQa7qu228SFtEVM2/hK55Xde8LLVxK
	4ke7XH3K0UhOqsiBzRVnm0I562xoNB+FVD0c9aqWjSkpHOg+Gw==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4eu0vs0832-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:39:15 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 16 Jun 2026 02:39:14 -0700
Received: from ala-lpggp9.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 16 Jun 2026 02:39:14 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: Correct the ppc64 setting in COMPATIBLE_HOST
Date: Tue, 16 Jun 2026 02:39:14 -0700
Message-ID: <20260616093914.1817650-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=IsIutr/g c=1 sm=1 tr=0 ts=6a3119c3 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=69wJf7TsAAAA:8 a=t7CeM3EgAAAA:8
 a=s5S4eW_e9MvfE85_1SoA:9 a=Fg1AiH1G6rFz08G2ETeA:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: RSTbNioWhEIUCJ4SfvsQK4OaADXU1-Dd
X-Proofpoint-ORIG-GUID: RSTbNioWhEIUCJ4SfvsQK4OaADXU1-Dd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfXzaoh3jMD9mUF
 pDSxaljVulNLvtzLGHOHOIIddJg1mtTwal07BiomYSioUc855iWKnUA9FJpIvC0NQcQRpnLhIYg
 2rVM0m1JlPcQlY91mWd0L8ZBZppWjg5hiAbGn1pJ5qUOhtHq37+wjvb1SD51UEELBhoQ30bME2/
 6kYQYpYyLdl97eox+hIFtH7ulxWqdKKbUs7yYG1pzlQZIsZn1MvixKiuzLY4ICa27Psm+TeyCeI
 T1ds745p9V/hIQ06Qx4LELoDAGlJAcoQkR6t8Qmvx1b3YOV/lFfZOD6qzxUEylTWcYaeOeSCvNH
 Hxu+QGdusmc3UtdcUEzCv8e1JxM//0sbo17KXmNHM6y1Gfxnqza+XGhjrk4gsqNx1BZxbGrDj4X
 J9N7+LJzc0LbIAOYWwCWl5UJWv/+o0E8Z8oIUjTP+sC0xPdBti+PV8+b0Pf3xApaxt6N7bpoUIO
 pP2cSOL5SYZeRIJq+rA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDA5NiBTYWx0ZWRfX9T4PqbhtoAVs
 ncNRxcyNADK3au4B2F44uVQrCgOWrdBvbMkqGQmr0ZrTGAOcqFXLvwlsCb5LBtLTkLUAdwYlBlq
 OJ4jsijYk0eLwRQoFXNHiWsJRCqKUJK4Pxn9AG78MvrSKDzPG8ub
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_02,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160096
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 09:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238884

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 3071f74650..5a475e51a2 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -63,8 +63,8 @@ COMPATIBLE_HOST:mipsarchn64 = "null"
 COMPATIBLE_HOST:riscv32 = "null"
 
 # QEMU 11.0.0+ requires a 64-bit host architecture for emulator builds
-COMPATIBLE_HOST:class-target = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
-COMPATIBLE_HOST:class-nativesdk = "(aarch64|x86_64|ppc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-target = "(aarch64|x86_64|powerpc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
+COMPATIBLE_HOST:class-nativesdk = "(aarch64|x86_64|powerpc64|riscv64|loongarch64|mips64|s390x|sparc64).*-linux"
 
 # Per https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html
 # upstream states qemu doesn't work without optimization
-- 
2.54.0


