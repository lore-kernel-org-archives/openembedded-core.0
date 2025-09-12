Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1F6CA101F
	for <webhook@archiver.kernel.org>; Fri, 12 Sep 2025 16:07:57 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.20672.1757693268915786910
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Sep 2025 09:07:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=DpM52bVD;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13506f3714=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58CEuERl1827269
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fSaQBtnVU
	KOzUGb3oFJtfCYEPVcyxv4czNAyHsOg4/U=; b=DpM52bVDeCQj44xanhv2CGA5c
	BfIvtZn9hDRnU48kcBx7gP9+nNZ1yvcBfquzFAeyyvtpjIiE7uKz27pvhk9zfSmw
	S7tMUnI8lI0D8/BwqaWIMWETVt74BnHXoJewejkQ8XWWbP+EO2sl9Z+d+HEX2JH0
	CDx6qPSZu8UD5vU3HOB3yT+XFn6DCElw4ZGQyIR8zl4EgTxw2mscQqFzOQNYNiN8
	mrDcxZclBraj7pUAJ9Bsw2l8hkjM/iaCYr5U8GG2FdiCf5nTdC1lTS1zXgucJgAq
	Ujitpy5dzqUX8g7XOOfh1mJlF4EFsVfZtLDzPxWj46AibqXKNzvN5BBG+Q3UQ==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494nqg037r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:47 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 12 Sep 2025 09:07:43 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 12 Sep 2025 09:07:42 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>
Subject: [PATCH 1/5] yocto-space-optimize.inc: move space optimize from recipe webkitgtk
Date: Sat, 13 Sep 2025 00:07:37 +0800
Message-ID: <20250912160741.346809-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: QTowIeHwLLbMQM9IwRKm0yXaFgCb5GaV
X-Proofpoint-GUID: QTowIeHwLLbMQM9IwRKm0yXaFgCb5GaV
X-Authority-Analysis: v=2.4 cv=VuIjA/2n c=1 sm=1 tr=0 ts=68c44553 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aKHO_vvw91AVMdgStSYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEyMDE1MCBTYWx0ZWRfXzwThOBtFTKKp
 EPUGs7vmFC4WD2ndN8oz3hACAMY7MAb5qc7GVmW3lU4Qq5WkDzk76zRztWnImCp6mAMVTzOVxV8
 YbsfskMYUZrdZ2VZ8nQhgZOP+Xm6y+Oz+YY8wDflMRybBycDv0eXFTmaa5kCfipzLsMoeFgHUcE
 3zTiITe9+Co7cYFtGaNbpl9kDgik+idYeecBhxWoEyTTwJPpfEg5PTdbZ0bMdANiSwGBwf4IPHF
 z6uouxQnI2wTGayzJ1Rw3AyAIZrEOBHKvd3Q7liu3mzcZpYYd9oUXTEkI6qIvj4+v6a4CQKzLrL
 RQlNGgVHAZMnbqxQlN3/SHGKf2/A9yUA3fhqW3y8uLRKixTmFcMM5vGlY7irGo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 adultscore=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Sep 2025 16:07:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223328

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
index b83ba426e78..9e092df32ac 100644
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
index 35b8ee2a901..46031322b92 100644
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


