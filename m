Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7968CAC58E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 06:17:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.26093.1757917036818461557
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 Sep 2025 23:17:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=llQLuGq8;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=13531ce467=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58F4IjhI3579479;
	Mon, 15 Sep 2025 06:17:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=fSaQBtnVU
	KOzUGb3oFJtfCYEPVcyxv4czNAyHsOg4/U=; b=llQLuGq8pvDJy23YV6BTgDePZ
	d2sHuen5RVv3uFrEqUXOtdX9Xflzq94R3iAYRqiMppnwGOyCrR2a8Fk/L36QG5NE
	HjkA5HqVTPZgw7EYfEctUvyzpWgsfGMUjLSn+7T+Y9zD5fHUFrCiLGHJtsTvXvC7
	u6d1GIEShuf+OkJzkCn5g1BejuqAWyHO00A1ou5ZzQJKH6WNHfCw9nbyVLlsSbvI
	0d7cjjHee0m1tXMR/veHipp+IZWYAJuJJSVVHobVV7BJtR+0NTMQIxaUrgnnO2jA
	6WTG9J+VniHiktzdK8TpFPEKKhaXPnfhNnUGxKNoCtyGku+55VXiymWDd2iNg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 494wu11rw2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 15 Sep 2025 06:17:13 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Sun, 14 Sep 2025 23:17:45 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Sun, 14 Sep 2025 23:17:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <randy.macleod@windriver.com>, <peter.kjellerstedt@axis.com>
Subject: [PATCH 1/8] yocto-space-optimize.inc: move space optimize from recipe webkitgtk
Date: Mon, 15 Sep 2025 14:17:36 +0800
Message-ID: <20250915061743.313230-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ox9aPBbV30lqoX60DWzRbcM2L1qCH4yZ
X-Authority-Analysis: v=2.4 cv=EP8G00ZC c=1 sm=1 tr=0 ts=68c7af69 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aKHO_vvw91AVMdgStSYA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ox9aPBbV30lqoX60DWzRbcM2L1qCH4yZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA1NSBTYWx0ZWRfX4LxMTiV79oqi
 +rApm7IJGI3PKR/XNw7iFx5y6hYpdYHoRlhDsKXYkGOge8lTmsuQTgQQN3KoKN+/F599OdHXIwy
 nF2SJImVDdL92kknib2h4I6n/IseUaDStdUvuE+H/7i1HHcLtFN19XwEDHfeR466tUPVN4gAYsf
 6CtWiLulfwshBGF0Kj0L8Q7qaONMw83JcjwwOU17Fzk9nClwDskj16fEq5KDzlQoajdM+lz6sB5
 AeWP2d+IvhGMSHrCq9v1o/X3/JcekoQ5rl+IEe2EQx2ATj5AcFk51Z74K15mYBlB10F9j4Xuplp
 cj64fApWeNVXd8EAE3FD1RJxoD871a6vLTYzOmm065W9Si88m7soRKqPCCvg9Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 suspectscore=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 06:17:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223377

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


