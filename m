Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB7A1E7718B
	for <webhook@archiver.kernel.org>; Mon, 23 Dec 2024 09:06:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.10404.1734944806445416633
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 01:06:46 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2087139da4=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN8E9JM002525
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:06:45 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn89kn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:06:45 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 01:06:44 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Dec 2024 01:06:43 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <changqing.li@windriver.com>
Subject: [PATCH] tcl: Fix issue causing tcl-ptest to fail
Date: Mon, 23 Dec 2024 17:06:42 +0800
Message-ID: <20241223090642.959439-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lJoMEfz8UAI5WXjvusKqLCaLqVnLTWKW
X-Proofpoint-ORIG-GUID: lJoMEfz8UAI5WXjvusKqLCaLqVnLTWKW
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=67692825 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=SsplK3h1hCQJQcUdx6YA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_03,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=862 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412230081
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 09:06:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209015

From: Jiaying Song <jiaying.song.cn@windriver.com>

Modify the TCL_LIBRARY to the correct value to resolve the following error:

application-specific initialization failed: Cannot find a usable init.tcl in the following directories:
    /usr/lib/tcl/ptest/library {} /usr/lib64/tcl9.0 /usr/lib64/tcl/lib/tcl9.0 /usr/lib64/lib/tcl9.0 /usr/lib64/tcl/library /usr/lib64/library /usr/lib64/tcl9.0/library /usr/lib64/tcl9.0.0/library /usr/tcl9.0.0/library

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 8a9f611b0f..0842ca320d 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-export TCL_LIBRARY=/usr/lib/tcl/ptest/library
+export TCL_LIBRARY=/usr/lib64/tcl/ptest/library
 export ERROR_ON_FAILURES=1
 export LANG=en-US.UTF-8
 
-- 
2.25.1


