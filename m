Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70171CD6E68
	for <webhook@archiver.kernel.org>; Thu,  4 Jun 2026 05:18:45 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3372.1780542661903880984
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Jun 2026 20:11:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=iZLRCzNs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06156ed005=haiqing.bai@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6541YFfJ1430497
	for <openembedded-core@lists.openembedded.org>; Thu, 4 Jun 2026 03:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=SGvheZtBeFv+v4rWAAXp
	SKKdvQDMBdvGZ9r1bvRjOTs=; b=iZLRCzNsmP0xVyueQX1OSfLkJSfETk8R1iyt
	RMGoGmuythYMq+wThUxpzRmUuwcxemzIVLZIQuH+/bT30jetQZUDd/4JiXq3uYF3
	eweYmTOvxHkr50pIBVhnoIB4AbScWBRrp73KNy9I+ryxcVJX2tf9vkfivV5Q5L5/
	OdgcTMpvqXTuLEdryO97FONGg1iRaSe8FaljBDxNIt41u26ha5amlag4Wt4t74kF
	g+bLBT/XHLZHGsnh7zcnc+V4+pTKRNq5mhlCmEAF8OoBAJAf/wkvkWfPAstSTdyZ
	QhFfeLpSYEc+Jsxw0bUp0Ty6LGOTSj2CS3DBD2JvsZ96/uT96Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn40808e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 03:00:39 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Wed, 3 Jun 2026 20:00:37 -0700
Received: from ala-lpd-susbld.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Wed, 3 Jun 2026 20:00:37 -0700
From: <haiqing.bai@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <haiqing.bai@windriver.com>
Subject: [OE-core][PATCH] python3-pyelftools: upgrade 0.32 -> 0.33
Date: Thu, 4 Jun 2026 03:00:37 +0000
Message-ID: <20260604030037.1890817-1-haiqing.bai@windriver.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: C24eo9ihwUcgkG8jIEw6oWB3-v9OmWVU
X-Proofpoint-GUID: C24eo9ihwUcgkG8jIEw6oWB3-v9OmWVU
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a20ea57 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8 a=Sig2_LplLtoQ1QJjY5YA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA0MDAyNyBTYWx0ZWRfX3UJNIfHw6zag
 dJNyrvuZN4Jtzo3eUZq9mkCIPjhf6CrhEnv9WGOdd82HW7Vob/P4CajPYsZT3DqCCYZPUEcf9gf
 WX40PWPWdk97iJd+MQfy+uJ0nni96O5o5Rh0H6k3juu7YynYMBXOwvHt4DQaBNgdDR0JsUOAdD+
 Rc/chrjLUEzbqj1sYedv8LQoZKmaGjRFrQ+by23d1xTU80ty6hvKGvm2t6yVrBuNUqAwGnWV8g7
 fk7DSXNQcomYnGTgXmxOoZJELFH+JXU55PIjB3vY7/ZSqnP/b/q/8+5hoBSBvQO1sI45j6PBZEE
 ZGF/cIsNFphKLkjDfc40jTypYalp32HzwZ5KpLADT3Y8UPH1Etm1tngRsQMCBoz+EegWzZqOBjX
 +9T2sOlNGzu6+/FjxiJgFozliPqQSzRZ8KBDWSzipZyfk4HvN9u6i7rLpL48H8EpGBx6VIcQLoi
 v573D8EmjbjiUBxevrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606040027
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 05:18:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238115

From: Haiqing Bai <haiqing.bai@windriver.com>

Signed-off-by: Haiqing Bai <haiqing.bai@windriver.com>
---
 .../{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pyelftools_0.32.bb => python3-pyelftools_0.33.bb} (83%)

diff --git a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
similarity index 83%
rename from meta/recipes-devtools/python/python3-pyelftools_0.32.bb
rename to meta/recipes-devtools/python/python3-pyelftools_0.33.bb
index 447c8ad6af..5de2812813 100644
--- a/meta/recipes-devtools/python/python3-pyelftools_0.32.bb
+++ b/meta/recipes-devtools/python/python3-pyelftools_0.33.bb
@@ -4,7 +4,7 @@ SECTION = "devel/python"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5ce2a2b07fca326bc7c146d10105ccfc"
 
-SRC_URI[sha256sum] = "6de90ee7b8263e740c8715a925382d4099b354f29ac48ea40d840cf7aa14ace5"
+SRC_URI[sha256sum] = "660d82dcbeb8e83d1702bd97f223f761625da06111c0cc988eac6b8ab0c1b61f"
 
 PYPI_PACKAGE = "pyelftools"
 
-- 
2.53.0


