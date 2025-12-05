Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD302D2E03F
	for <webhook@archiver.kernel.org>; Fri,  5 Dec 2025 08:32:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1334.1764923525923411719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 Dec 2025 00:32:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=M99wuPCq;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4434d54add=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B56sGqq3789647
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Dec 2025 08:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=ZFzWvZr/DGwhRNTW4RlH9G9GoJUP5lvuw714lDFVxdA=; b=M99wuPCqUNsn
	gjEYZFy5Q+wR5dPTULsHJo354n6pAIGCZq6xy4UOE9yv/QLJWdeagP8Splvsz+WF
	7H/CvvKgxQV0sJ6MYwpp+owDAd0laKZdIm5jYFCQLm1OvQ31GxcHZ10Mcn5nfQeV
	SDQW3TWX5KfJqbgdKGr6IxPmOqbgzmlgEE7hLdYimUAr9KRH3Zs+yqvw67XPQq4a
	/zX8T4FmHfzfLiO4SaDlFGKNURoPqguIqqJ6XwIc8eBN13x2JFhHGzlgFch5i1Qr
	oKMY7utdX2nOfoFsh687bPO75EUCfblWmm9k3u+CuLWKZSr1NuZRdWkcQgiph2vA
	FtHHrN/3/g==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4auqv105y7-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:32:04 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Fri, 5 Dec 2025 00:32:03 -0800
Received: from oak-lpgbuild14.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Fri, 5 Dec 2025 00:32:03 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH V2 2/2] core-image-ptest.bb: use ?= for PTEST_EXPECT_FAILURE
Date: Fri, 5 Dec 2025 08:32:02 +0000
Message-ID: <20251205083202.330982-2-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205083202.330982-1-Qi.Chen@windriver.com>
References: <20251205083202.330982-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA2MCBTYWx0ZWRfXxIglYWuebnWg
 lHyyIXQpJHiXNY1GrFWqTKA8pQY5bV7xW/AGDAEg8VBhGEsfM7Mw9WegasasJAkhWTzK40yBh/f
 zYRKQtACDIIXhKTkzQTqvQl8MvNS6NLSoCMyN9euOgGsTUKMAUfsWEV9Rm7Pu2yecYOLqfrwOGO
 c8KeU8Rj/i3kppkFhlnW8FGj2VpN0OqLbr2SQSRYX6SSRYpozg0iA4qWfYAYg7sPfeqXBjKNkq1
 YGkLOUciEJIWCCdLcjoNNAxfImZLfYDia3PRPpOeme1PNv843a0RrXOUfAQiIbenef0PUPD3kN0
 nm0koauhJfgWgOjSBBv4JS2av3NQV9Y/WWpmFxCUNFpUB/Hq2Q0FqeoHF3jzGupGVIxwORnZgV/
 AluiPCXPVSBqPOlYbR8ilgdwZO5utg==
X-Proofpoint-ORIG-GUID: NPfw3-kHS8t3pHc7V5LQlHYaVGyf6NQo
X-Proofpoint-GUID: NPfw3-kHS8t3pHc7V5LQlHYaVGyf6NQo
X-Authority-Analysis: v=2.4 cv=dqfWylg4 c=1 sm=1 tr=0 ts=69329884 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=t7CeM3EgAAAA:8
 a=vwxY6jK1-XzPSyloJEMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050060
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Dec 2025 08:32:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227342

From: Chen Qi <Qi.Chen@windriver.com>

We need to allow users to easily override this value in local.conf.
This has the benefit that 'bitbake core-image-ptest-xxx:do_testimage'
fails when expected.

As an example, I used 'bitbake core-image-ptest-util-linux:do_testimage'.
It succeeded with warning message. I didn't notice the warning message.
I saw the command succeeded and I tought util-linux ptest is OK. But
in actual fact, the ptest failed. It's the PTEST_EXPECT_FAILURE setting
in this core-image-ptest.bb that is not giving me error.

With this change, I can put PTEST_EXPECT_FAILURE = "0" in my local.conf,
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


