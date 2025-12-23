Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47307E6B271
	for <webhook@archiver.kernel.org>; Tue, 23 Dec 2025 04:15:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95043.1766463301524385567
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Dec 2025 20:15:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=CqA2Ipku;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4452e63bdb=changqing.li@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN3tRTN2830180
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:15:01 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=ZqpploqBmc2DpV+qrRDY
	MQiEdlFTkkkzEnEBTDnx0h4=; b=CqA2IpkuqfB9HEhKq6VWRh9NYumJMj/PYNFs
	tZiwac6js7QGDp91tVaPADyntNnrKXmb4b9L1V3TQZfDOlS3QsNsMKDQVDXQtFtC
	LR0H3xQXDnVuNB5h5E4DYTQq940W+BjX7M1tM/gyPDKbjDMIjz2ke7ZxFIq5pluE
	r9AXH9+76PlFfdzaUJ4dk3wG9AlB7iHtbfWA2zwHH2Rm/oYgm1VHmGOXYcGT6ouL
	ewIMATaNhFoGiVSFAzQAaPZL54g2em4PcoJma++HvFMZ3yLmDSembTh4RZoviWAF
	rai9kwUqK/B1jIG5JQMYrmXWTESrtRcc+lezzN0TmhC3fTMLmw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4b5v6haax2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 22 Dec 2025 20:15:00 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 22 Dec 2025 20:15:00 -0800
Received: from pek-lpg-core6.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 22 Dec 2025 20:14:59 -0800
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [V2][PATCH] qemu: disable libkeyutils
Date: Tue, 23 Dec 2025 12:14:53 +0800
Message-ID: <20251223041453.1544017-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDAzMiBTYWx0ZWRfXwbBkb5aZbNat
 mZ/nTIZxIvA5+PSyoEl4uIvOANX/zYyMtTMxDBE67hKs1XjPnAxP4TvoukS1qsgFNJJGqt/Echa
 qvjX+JNbkv33l02ecZ9joWquiaF90uDpRuh3kb4M1vH4MaVNX4XDKA/3hkPJi87aQatfA2TUnr4
 wO6ixFQU1Lc8TI2W/yiCHQA6UHkNr4TA3vxLxAhGousNIe7MfvJyOrmJ5VlBAbsAxY1hCqAodWb
 crlz1+ESYyQ6kDTFFv1ig4FNmQmIgzxLTAotDlG7aT15NHyYgasPDgXSHlhMyi7q4MpyFMHrkFr
 xv6Z01aKPIYwxXi6qV3ElQYtRbFJe+qjobNMIvSIN0uzOGTJPK+pjVCAmvg/BwxZiWzRRt3nOWn
 FOmrsLPJvvoY/QvkTYYqUvi4dZ59buK/b1IxVL9oImu9ymbtjKDa97WRa9SxfiMYygOuKopcEJt
 iOKINimA5sL9tpkiEoA==
X-Proofpoint-GUID: CwSK29zkvrvYm4TAZKJgNeHbcleorFwR
X-Proofpoint-ORIG-GUID: CwSK29zkvrvYm4TAZKJgNeHbcleorFwR
X-Authority-Analysis: v=2.4 cv=KYffcAYD c=1 sm=1 tr=0 ts=694a1744 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=6BdWctLmSbLh-zIFiisA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_01,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 23 Dec 2025 04:15:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228446

From: Changqing Li <changqing.li@windriver.com>

When package keyutils-devel is installed on host and gcc in extend buildtools
is used, qemu-system-native do_compile failed with error:
../qemu-9.2.0/backends/cryptodev-lkcf.c:36:10: fatal error: keyutils.h: No such file or directory*

 36    #include <keyutils.h>

                ^~~~~~~~~~~~

gcc in extend buildtools can find libkeyutil on the host, but it will not
search the headers on the host cause above issue. add PACKAGECONFIG
libkeyutils, and disable libkeyutils by default to fix the issue

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 63414196fa..908dca7d5d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -229,6 +229,7 @@ PACKAGECONFIG[jack] = "--enable-jack,--disable-jack,jack,"
 PACKAGECONFIG[debuginfo] = "--enable-libdw,--disable-libdw,elfutils"
 PACKAGECONFIG[pipewire] = "--enable-pipewire,--disable-pipewire,pipewire"
 PACKAGECONFIG[sndio] = "--enable-sndio,--disable-sndio,sndio"
+PACKAGECONFIG[libkeyutils] = "--enable-libkeyutils,--disable-libkeyutils,keyutils"
 
 INSANE_SKIP:${PN}-common = "arch"
 
-- 
2.34.1


