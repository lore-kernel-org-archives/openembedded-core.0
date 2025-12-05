Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B184DD2E036
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:10:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1137.1764922210382206056
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:10:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F3dIlcew;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56Tmhj2240488
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 00:10:10 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=4xaPTRHUL4oIaunN4jv1sloatTXDnzAZb2ofLykFgnY=; b=F3dIlcewrZOQ
	GLqu/6X2VlSxUHhEW5UNOWITnoIOzIR15N3d9RYojd3R/bRXibYWHEX3snm2Z6k0
	S6OZp4+LEzyS1aPd7N5Roob2cFgE0WXTULVtf3WWO4OXJvFFDSb3WflN1bNJVkuZ
	0ERmEPrZAetYyhv7QH6SXEyyg8su2ejctLSvhEA2II23ogGAwxf5CLr8pcHjESPP
	6jSOrWLAS6yghyIX+0bugO07A4Tyxe1U92GGfjekwr8iD7kv+67sh7Su08ndnxrj
	3ACWh9VIJR2uZq21rcPt8xSDwoH2WQkNiv4OQZLtu09nT9736XOS85dD2nO26Bzu
	4IhB+xA+Ew==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ar17my640-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 00:10:09 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 5 Dec 2025 00:10:09 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 5 Dec 2025 00:10:09 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 2/2] core-image-ptest.bb: use ?= for PTEST_EXPECT_FAILURE
Date: Fri, 5 Dec 2025 08:10:08 +0000
Message-ID: <20251205081008.320482-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205081008.320482-1-Qi.Chen@windriver.com>
References: <20251205081008.320482-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: rqlm_ZvdSp5__1RB3y30i7xzoRRmAbEG
X-Authority-Analysis: v=2.4 cv=Ws4m8Nfv c=1 sm=1 tr=0 ts=69329361 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=vwxY6jK1-XzPSyloJEMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: rqlm_ZvdSp5__1RB3y30i7xzoRRmAbEG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA1NiBTYWx0ZWRfXwZ7w5CbAUnET
 Yz42PNhk5OYGAnL1LE8CjY94UOM8NEVBC06ye3OzyIlvM7EQl7qVsTtl+hBlBpkvfjIez0GHkLp
 o+NdIrh/MuNslgeV1L7+mBh7Wj7j6Gw6YzJd0CiMjA5LpeO/zwJ/R6qu/0U+onUXD2z82WDZ6y0
 saapsyNUWUGXB8bC4/LWn2e8XztsOhJ3jrclFw36RJnQ3aWBt/jPLVMFetZuqCO2bycoDtwe7VM
 b2c6n2RmTD2TeFPabR9/aksxAW28UVOFNQqYPiAZX+B0TiNOYCH7PRmEzNAWtsh3nLwHkLig5oK
 MsJeDfddmCZEE+R/UnGysVWvVCwcEqhYD5yzcQDmH3aK7XILm4zRhW7ETDRpuF+NCBnALDN6gNo
 OeljACmyXBb/aIG+fPJ0OMRmQPGeJQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050056
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:10:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227337

From: Chen Qi <Qi.Chen@windriver.com>

We need to allow users to easily override this value in local.conf.
This has the benefit that 'bitbake core-image-ptest-xxx:do_testimage'
fails when expected.

As an example, I used 'bitbake core-image-ptest-util-linux:do_testimage'.
It succeeded with warning message. I didn't notice the warning message.
I saw the command succeeded and I tought util-linux ptest is OK. But
in actual fact, the ptest failed. It's the PTEST_EXPECT_FAILURE setting
in this core-image-ptest.bb that is not giving me error.

With this change, I can put PTEST_EXPECT_FAILURE = "1" in my local.conf,
and I can easily see if 'core-image-ptest-xxx:do_testimage' succeeds or
not.

The PTEST_EXPECT_FAILURE change should result in testdata regenerated
because ptest.py test case's behavior is affected by it.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/images/core-image-ptest.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-core/images/core-image-ptest.bb b/meta/recipes-core/images/core-image-ptest.bb
index 017f05f81b..b554964d20 100644
--- a/meta/recipes-core/images/core-image-ptest.bb
+++ b/meta/recipes-core/images/core-image-ptest.bb
@@ -42,7 +42,8 @@ QB_MEM:virtclass-mcextend-tcl = "-m 5100"
 TEST_SUITES = "ping ssh parselogs ptest"
 
 # Sadly at the moment the full set of ptests is not robust enough and sporadically fails in random places
-PTEST_EXPECT_FAILURE = "1"
+PTEST_EXPECT_FAILURE ?= "1"
+write_image_test_data[vardeps] += "PTEST_EXPECT_FAILURE"
 
 python () {
     if not d.getVar("MCNAME"):
-- 
2.43.0


