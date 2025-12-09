Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1EA9D3B7EA
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 02:00:49 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10131.1765245642536100410
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Dec 2025 18:00:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=b6Xmf3Qs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4438bd960f=qi.chen@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B8Ndp4H1299526
	for <openembedded-core@lists.openembedded.org>; Tue, 9 Dec 2025 02:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=fWxhmeidYesok0+YgyF+wbDgkNK8AA2wZers6grtXBg=; b=b6Xmf3QsM8gt
	nHwzPcuIU/tnTSoC6i/e4KOEfiNpreDeIysaorYbkVuLtBTHaeCs4F8mUoW1dDT6
	PZDCyRi7hNKEDJgrNRDUvIss8N5wc+gV5/iRdGzqzWhoFjZtPB/eG3pBnTaJ7oFI
	Nuat2orchdK4tSTvBzXS90zUooeh/aRtoMHscRCz+rjzTQELjsY8Kcr3LbxQN6aP
	FMQensLiS6+lKePfCNhCTbSw5d/UawBnV//dgx8Q04URXrZPJZuHT7YL7KaqwqiS
	HSNxEBoocV5m99PWexTzgW9A/N8U3/ihIZcV1XQPZE5dpDYKf/KqPxfFNKjk95nw
	o1GyLSgoeQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4avb742ddb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:00:41 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Mon, 8 Dec 2025 18:00:40 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Mon, 8 Dec 2025 18:00:40 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V3 2/2] core-image-ptest: drop PTEST_EXPECT_FAILURE
Date: Tue, 9 Dec 2025 02:00:39 +0000
Message-ID: <20251209020039.2341108-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251209020039.2341108-1-Qi.Chen@windriver.com>
References: <20251209020039.2341108-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PyoaW9jkbH8ItwCChFqUeu_lRJdo98KD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA5MDAxMiBTYWx0ZWRfX1foIGTcXgC+8
 0i/NlCbP/dTxSn2OUCuKEciJII1d4QDllTfAwuvpmLrO/5M+r4TfJKTcPOTpI7SsqEaJYZqbg1d
 rUnUf04hMo0fr/phUSjKxr3YkBrELofyzF0ZfM+kenTraFqFj0RFKbaRfoPPAguvcAuK2CPlq4/
 84naKwGaIhdHGAUqmAz1rptfKI6arc4EYryFjIDcnr/a30oUlctUHrI6DUOXCbrpwsnvrn8pNRj
 c30x4WcykMuhxyarZ0AEmFKN9EfbVVMhSdG5SPSRI1HYRimruDgG6LV3pTvvirogtNvQ9vtUxRG
 OWZrx3WGcPPo3CQv3tyCHuCps7OC5Z5+KAadfHRXMW48pRE9HKBB6N7wyDocLh19hWWohD2dDqi
 FFt8hqen4FqPklBV91UKomJRdpetGA==
X-Proofpoint-ORIG-GUID: PyoaW9jkbH8ItwCChFqUeu_lRJdo98KD
X-Authority-Analysis: v=2.4 cv=EpzfbCcA c=1 sm=1 tr=0 ts=693782c9 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=qbo2we-fD-MopMFE4kAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-08_07,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512090012
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:00:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227412

From: Chen Qi <Qi.Chen@windriver.com>

This variable setting is not helping people now. Because in practice,
ptest failure warnings on autobuilder are still catched and reported
back to developer.

In addition, setting this value to 1 is sometimes causing confusion for
developers.

As an example, I used 'bitbake core-image-ptest-util-linux:do_testimage'.
It succeeded with warning message. I didn't notice the warning message.
I saw the command succeeded and I tought util-linux ptest is OK. But
in actual fact, the ptest failed. It's the PTEST_EXPECT_FAILURE setting
in this core-image-ptest.bb that is not giving me error.

In summary, a simple erroring out action should be clearer.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 017f05f81b..0b1eeb1a58 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -41,9 +41,6 @@ QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 
 TEST_SUITES = "ping ssh parselogs ptest"
 
-# Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
-
 python () {
     if not d.getVar("MCNAME"):
         raise bb.parse.SkipRecipe("No class extension set")
-- 
2.43.0


