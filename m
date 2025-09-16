Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C01CAC587
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 04:09:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11301.1757995776658781551
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 21:09:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=h5xYwYir;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=135445e4e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58G3xO7F1733066;
	Tue, 16 Sep 2025 04:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=MIRlj9tKQ
	uGXWMj840MlAcOSsVhYN0D4sOn8GM6AiIQ=; b=h5xYwYir2uJaGjo2tLMMt07RT
	9GRLjK8KImoHFLB3PfMxMnioP5UWIiJ8oTbvgKQfz7k3NIZ1t/ygnmr0N+KAiyBH
	TDMp4/zz9orX6cqQj6SPxE06WhQWCOaPQZiD8fRSLd3v/INrUN579hyaV5w7xkZY
	OlN8HNxkPWeW0fHMa6wN6KT6G+SBL/e+MWpnc/59RIfoEE44icxh+HddkCoClxjd
	xgvFZB2dQviUJAfgT7m2zLybuDo9BAMkoEqNxxXcCIij5weulElgr0cE38kc5IPd
	WOLORQwT20gqkIS43kYZiU0rWIDXMpvJBB5qzzVgJ9i4CIy8jK7CMNaylOboA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu130yq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 16 Sep 2025 04:09:30 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 15 Sep 2025 21:09:29 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 15 Sep 2025 21:09:28 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 1/8] yocto-space-optimize.inc: move space optimize from recipe webkitgtk
Date: Tue, 16 Sep 2025 12:09:20 +0800
Message-ID: <20250916040927.103722-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NSIUSS36poL1iTUOEk3y7nQvVVLcUJ3q
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c8e2fa cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aKHO_vvw91AVMdgStSYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: NSIUSS36poL1iTUOEk3y7nQvVVLcUJ3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDAzOCBTYWx0ZWRfX0pOO2Zlx3MtX
 1sn4CiLiMQU+P6VQwc/RMJZFrX07q0Q69hKnAh9x422FOWlV45yYIK3CiN0T0g7fRI57ZhJv8zM
 ZcAo8wB9v0D88mVb1FGs1w+SciOQb8e+a44BkNYHZft7+SKvbU/DONOJr7SiFwDgKunGnOHH7Fj
 kuAlmxo8FPn8+/cNZSN3G7ORxtNtkgnOW3us9wGSWf9QTPlENzpYF4M4HwICIPgEGVi12iyiyS+
 csHLBmGMqnxAOCU5Msx2qLVswdGmcOEdlkLYAQgnN9luMBZ7YAdLMGatTnW5TD2nY/rrYx3y3at
 g61fygoVvhPuoBwagxLTJWmRmm6/UlZfWujWhl0K3A7VstkXhFXuhf5p/8nJ2Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_01,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 04:09:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223517

The yocto-space-optimize.inc is used to allow turning off the debug compiler
options for a small set of recipes to reduce build on disk footprint
and package/sstate sizes [1]. Move space optimize from recipe webkitgtk
to it.

Due to commit [2], update comments to remove `Unless DEBUG_BUILD is enabled'

[1] https://github.com/openembedded/openembedded-core/commit/a0483b962dfbba051de2c0b1acbe268579a81f22
[2] https://github.com/openembedded/openembedded-core/commit/9badf68d78d995f7d5d4cf27e045f029fc6d4044

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/conf/distro/include/yocto-space-optimize.inc | 3 +++
 meta/recipes-sato/webkit/webkitgtk_2.48.5.bb      | 4 ----
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/conf/distro/include/yocto-space-optimize.inc b/meta/conf/distro/include/yocto-space-optimize.inc
index b83ba426e7..9e092df32a 100644
--- a/meta/conf/distro/include/yocto-space-optimize.inc
+++ b/meta/conf/distro/include/yocto-space-optimize.inc
@@ -8,3 +8,6 @@ DEBUG_LEVELFLAG:pn-clang-native = ""
 DEBUG_LEVELFLAG:pn-nativesdk-clang = ""
 # With -g, qemu workdir is 10GB, qemu-dbg is 363MB
 DEBUG_LEVELFLAG:pn-qemu = ""
+# Pass -g1 to massively reduce the size of the
+# debug symbols (4.3GB to 700M at time of writing)
+DEBUG_LEVELFLAG:pn-webkitgtk = "-g1"
diff --git a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
index 35b8ee2a90..46031322b9 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.48.5.bb
@@ -98,10 +98,6 @@ EXTRA_OECMAKE = " \
                  -DENABLE_RELEASE_LOG=ON \
                  "
 
-# Unless DEBUG_BUILD is enabled, pass -g1 to massively reduce the size of the
-# debug symbols (4.3GB to 700M at time of writing)
-DEBUG_LEVELFLAG = "-g1"
-
 # Javascript JIT is not supported on ARC
 EXTRA_OECMAKE:append:arc = " -DENABLE_JIT=OFF "
 # By default 25-bit "medium" calls are used on ARC
-- 
2.34.1


