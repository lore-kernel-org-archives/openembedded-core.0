Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3A6DCFA475
	for <webhook@archiver.kernel.org>; Fri, 21 Nov 2025 05:40:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5553.1763703598265287668
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Nov 2025 21:39:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F66t8t70;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=34202e1edb=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AL5ctAF256822
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=wGEJosiK/
	r0VzykxyK97kBgVvC2roq+iQ9D2A2mtn88=; b=F66t8t70/BJBlHOKmvLI8ZJct
	ouYCWexTrseff556L1HjaiR63tA4Z3F/InXx8yct21ZlayCafNwkOZ6AmXVUhQ6D
	7NcHRo3BaeiGGN+A4KneH0u3UT3h++7z0Z5IkyeoLikSowVrlmxKVTMMoO+HH4TQ
	Mxl29jonlux7F2yppMN6nTjtO0+fryQ9uKUrbznvBghiqtTDE5gI6S+4d2kPb4q4
	GeTaOfINcMhoPdRNtcNla4X27gwhxpKbxHHhXkCc+KCfNtETk4WnkpPnup6FzOR8
	6grhE7/Jp6fyqu7PjL28UZUz3DzQaV+Ni9RzAZL7Z6Zb76hbkOBg8BohYuISw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ajehqg58h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:39:57 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 20 Nov 2025 21:39:56 -0800
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 20 Nov 2025 21:39:55 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH] jquery: fix reproducible build issue for PREMIRRORS downloads
Date: Fri, 21 Nov 2025 13:39:54 +0800
Message-ID: <20251121053954.667583-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDA0MyBTYWx0ZWRfXwlMZxcLJLjXh
 t60FybWJvwMa0giqPpXw3zKYQmaJ8PzB6+CFDjFOMEvbMzxm+FmvBVQrlxuxbSk6hTTl5DRiyaq
 7GhRVgRDDCIAZPRd3gUYhgaJ/fPBPWRuDoxVXbkBinX4VgumhSrb9aZXUR34X1kT7zJriSuP87M
 TH9c98/vHGEZhtOPFNHzpr+o8WTA1iyGKM/6GndCJP31T81/pvAcgv1tlUfwEuABcw1PS39S5KX
 bKSQqerPCpwI94bDuqTU/IV0m/WiZdoYXsmNz1K4ZFWwb9npqGMmhW5dOOX9D+gJnivtoZ6SyhQ
 cy9kecXKzZfxwEdWZxAcXP5qzWyd0rkYPm/UlVlAmo+YSVnHwbLHKa5yeZXsfqHG5/34tEg5exX
 YNtLHwfQ3wKofjYveIxks9fvqNVTLw==
X-Authority-Analysis: v=2.4 cv=EKQLElZC c=1 sm=1 tr=0 ts=691ffb2d cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=JQSNpBNHAAAA:8 a=t7CeM3EgAAAA:8
 a=woWCeTqRSQufGE2825MA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: db8gY9IqqJ6ZRlUVN189kU-8YRd-4CQr
X-Proofpoint-GUID: db8gY9IqqJ6ZRlUVN189kU-8YRd-4CQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_02,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210043
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Nov 2025 05:40:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226647

The sources of jquery are pure text files:
...
SRC_URI = "\
    https://code.jquery.com/${BP}.js;name=js;subdir=${BP} \
    https://code.jquery.com/${BP}.min.js;name=min;subdir=${BP} \
    https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
    "
...

When use git repo to save them and clone locally as PREMIRRORS for
bitbake. In this case, mtime of these files will be current time
when checking out. For this recipe, source_date_epoch will get by
function get_source_date_epoch_from_youngest_file, mtime of the
source files are not stable, so cause the generated package not
reproducible.

Due to the mtime of source files in upstream is always 1991-10-18,
even for the new version
$ wget https://code.jquery.com/jquery-3.0.0.js
$ ls --full-time jquery-3.0.0.js
-rw-r--r-- 1 hjia users 263268 1991-10-18 20:00:00.000000000 +0800 jquery-3.0.0.js

$ wget https://code.jquery.com/jquery-3.7.1.js
$ ls --full-time jquery-3.7.1.js
-rw-r--r-- 1 hjia users 285314 1991-10-18 20:00:00.000000000 +0800 jquery-3.7.1.js

Then explicitly set above timestamp to SOURCE_DATE_EPOCH

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/jquery/jquery_3.7.1.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/jquery/jquery_3.7.1.bb b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
index 33147b493c..0de92e041e 100644
--- a/meta/recipes-devtools/jquery/jquery_3.7.1.bb
+++ b/meta/recipes-devtools/jquery/jquery_3.7.1.bb
@@ -13,6 +13,9 @@ SRC_URI = "\
     https://code.jquery.com/${BP}.min.map;name=map;subdir=${BP} \
     "
 
+# Explicitly set to 1991-10-18 20:00:00.000000000
+SOURCE_DATE_EPOCH = "687787200"
+
 SRC_URI[js.sha256sum] = "78a85aca2f0b110c29e0d2b137e09f0a1fb7a8e554b499f740d6744dc8962cfe"
 SRC_URI[min.sha256sum] = "fc9a93dd241f6b045cbff0481cf4e1901becd0e12fb45166a8f17f95823f0b1a"
 SRC_URI[map.sha256sum] = "5e7d6d9c28b7f21006535e8875eb47e9667852a14c4624eed301c6cea19ae62b"
-- 
2.34.1


