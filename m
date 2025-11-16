Return-Path: <liezhi.yang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6164CEBF61
	for <webhook@archiver.kernel.org>; Sun, 16 Nov 2025 12:18:54 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7345.1763295530998930795
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Nov 2025 04:18:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LF1w5pcH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=341579856b=liezhi.yang@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AGCIo7B3171004
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 04:18:50 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ctSLVGihX7x5ntiiLfBmiH5s+wKtVvlSNinR6qoh+D0=; b=LF1w5pcHDlDf
	sOTxmbABOuUPm2qDpxuAzioF5k+cCSuyqUAH50EWF24tgnhG5uocbDTqpbXHbMke
	o4ZIoLx8mzijfU36PL0SUp9nMyJQ69wSDozHgSFIbbH3P/U8aFT4g+4V6n6tysob
	g3avM/bBm+K2ElnTB9O63+NkyBHpu6Zk+yeg47Lb/cw5bhRuLn7eAcOCpVjQ/9ZX
	luHuhPXzaQzz2pbjO0oNWQaHV8BEfcczVzYy2YPzonwMD296KDKcsNsH2shMS5qZ
	wK/8TppT4jHLDhNDcK8MKXrzC3olh3zFa9MNsar/rEgdUwKMBdYY30xUPXoCou5R
	fEGwvuYy1w==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeswj8t0n-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 04:18:50 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 16 Nov 2025 04:18:50 -0800
Received: from ala-lpggp3.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 16 Nov 2025 04:18:50 -0800
From: <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/1] buildhistory.bbclass: Warn when PRSERV_HOST is not enabled
Date: Sun, 16 Nov 2025 04:18:49 -0800
Message-ID: <0468feeac5c3c42078b6cf9085f7707de5f09cc9.1763295498.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1763295498.git.liezhi.yang@windriver.com>
References: <cover.1763295498.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=BqiQAIX5 c=1 sm=1 tr=0 ts=6919c12a cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=XpoIkthIeTa-b61LbZYA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: et8J18QH_jplAVJlmU0e4EGbclhHAItQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE2MDEwMSBTYWx0ZWRfX8uHL1CITqiN2
 Sy8cO4GsPbCwoOjJAw7Mx5VwAHNSXLxUR3Of1VISFUiDloIOOepiv7BqYbIgVJJuBMPtuN7PnsP
 ASSObnD5Oc5oCmvVMNH6h6+cmrjnDj5vjDOZrIirSWRcDeC9VDhFGbnt7hLl1EWZocBmnFtxCL0
 VdhJoovfzDiiRNXdqB1pdqy04yAL+9FXrhyXUyhMTQknTQXkJN6CCm2ZclGLdBvCqkFQa2nipF0
 oqJuQjKlwSCiE2Kjf82f4kbs+pUnk8Ih9bhU85gnE3iOgtLuqxHsIqvuovPnEwRmiKeS/9+GJWg
 g3F9Uj66MvfT1EWmt9eVC/VvISgCNtqs6qmV8dd/vJI7bq4tqrlzRdGhrFQDPb0rChJr+KGBPHM
 HudxvjtG2qLyMtFMiIvJO2ZygPriTA==
X-Proofpoint-ORIG-GUID: et8J18QH_jplAVJlmU0e4EGbclhHAItQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-16_05,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511160101
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Nov 2025 12:18:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226474

From: Robert Yang <liezhi.yang@windriver.com>

The version-going-backwards check may fail without PRServer, and it's not easy
to debug, so warn for that.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/classes/buildhistory.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index 4a380c10c6..859fded472 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -57,6 +57,11 @@ BUILDHISTORY_PRESERVE = "latest latest_srcrev sysroot"
 PATCH_GIT_USER_EMAIL ?= "buildhistory@oe"
 PATCH_GIT_USER_NAME ?= "OpenEmbedded"
 
+python() {
+    if not d.getVar('PRSERV_HOST'):
+        bb.warn('PRServer is not enabled, version-going-backwards check may fail!')
+}
+
 #
 # Write out the contents of the sysroot
 #
-- 
2.49.0


