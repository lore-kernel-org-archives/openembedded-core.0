Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6445E7108C
	for <webhook@archiver.kernel.org>; Thu, 21 Sep 2023 15:26:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.20987.1695309977456485170
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Sep 2023 08:26:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ThFYXPjs;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=7628c7285b=sakib.sajal@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38LCJkxh016819
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:26:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=W0wLu
	0cCIiBUzKPhDN2SEpihg8vEmcs9OFO1srV6thI=; b=ThFYXPjs79u8Tf04y29PO
	01fOYdiHD5YjFJrXRRc0wo2AFLfP8hkmfvU16ocGwfX/EwzWIPV1UouHiYQvCiC5
	N80UcE/vS9jMpQAOR/HsCAmBAPX92uEkOHsIOi5Wn8F+fG9BFAtHjo+XvTfYXeQ1
	yUg9BPxrZTGB/hZhfWRx6dUIQTS/ggNboIGxZRilUgvBRXUlAHx7SBpgx3RZ+1o/
	IALqyqLbEqDRFdV/r2okjI78ol3Zxsg9d/YoHEWCoFti2ndJDjlUBTYp1IA1C9wP
	wpPnqyz0ec1m0xEx3zuA4LYEieztHqgiPXsQBK2djBYnRjvSLO/0z6evyi7h+uON
	Q==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3t53b5vnq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:26:16 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 21 Sep 2023 08:26:15 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.32 via Frontend Transport; Thu, 21 Sep 2023 08:26:15 -0700
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] go: ignore CVE-2023-24532
Date: Thu, 21 Sep 2023 11:26:11 -0400
Message-ID: <20230921152611.400230-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 9SX6ADmRaEL3siKQ2292Mn_ttXQqRbXI
X-Proofpoint-ORIG-GUID: 9SX6ADmRaEL3siKQ2292Mn_ttXQqRbXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-21_13,2023-09-21_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=662
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1011 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2309210132
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Sep 2023 15:26:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188015

Fix for the CVE introduces new data structures which
are defined in newer versions of go. Also, from upstream
maintainer, "...it only affects niche configurations, namely
very specific direct uses of crypto/elliptic. We found no
real world protocol that could be attacked due to this."

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/go/go-1.17.13.inc | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/recipes-devtools/go/go-1.17.13.inc b/meta/recipes-devtools/go/go-1.17.13.inc
index 91dd886cd0..480e6caa2c 100644
--- a/meta/recipes-devtools/go/go-1.17.13.inc
+++ b/meta/recipes-devtools/go/go-1.17.13.inc
@@ -53,3 +53,10 @@ CVE_CHECK_IGNORE += "CVE-2021-29923"
 
 # This is specific to Microsoft Windows
 CVE_CHECK_IGNORE += "CVE-2022-41716"
+
+# Fix introduces new data structures defined in newer version of go.
+# Also, from go maintainer, "it only affects niche configurations,
+# namely very specific direct uses of crypto/elliptic. We found
+# no real world protocol that could be attacked due to this."
+# https://github.com/golang/go/issues/58647
+CVE_CHECK_IGNORE += "CVE-2023-24532"
-- 
2.25.1


