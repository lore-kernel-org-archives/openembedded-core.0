Return-Path: <Jiaying.Song.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFF4BE7718B
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 02:52:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.27093.1735008744966907631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Dec 2024 18:52:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2088794d16=jiaying.song.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BO2A96t000936
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:52:24 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub26m0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 23 Dec 2024 18:52:24 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 23 Dec 2024 18:52:23 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 23 Dec 2024 18:52:22 -0800
From: <jiaying.song.cn@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Liezhi.Yang@windriver.com>, <changqing.li@windriver.com>
Subject: [PATCH v2] tcl: Resolve tcl-ptest run failure
Date: Tue, 24 Dec 2024 10:52:21 +0800
Message-ID: <20241224025221.749703-1-jiaying.song.cn@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676a21e8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=o9Yu4ERPxXS5YcBS5nAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Zfyb3s4ptyivD6y4u0ZaSOoa0yBVtxoQ
X-Proofpoint-ORIG-GUID: Zfyb3s4ptyivD6y4u0ZaSOoa0yBVtxoQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-23_10,2024-12-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=649
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412240021
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Dec 2024 02:52:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209055

From: Jiaying Song <jiaying.song.cn@windriver.com>

Modify the TCL_LIBRARY to the correct value to resolve the following errors caused by multilib:

application-specific initialization failed: Cannot find a usable init.tcl in the following directories:
    /usr/lib/tcl/ptest/library {} /usr/lib64/tcl9.0 /usr/lib64/tcl/lib/tcl9.0 /usr/lib64/lib/tcl9.0 /usr/lib64/tcl/library /usr/lib64/library /usr/lib64/tcl9.0/library /usr/lib64/tcl9.0.0/library /usr/tcl9.0.0/library

Signed-off-by: Jiaying Song <jiaying.song.cn@windriver.com>
---
 meta/recipes-devtools/tcltk/tcl/run-ptest | 2 +-
 meta/recipes-devtools/tcltk/tcl_9.0.0.bb  | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/run-ptest b/meta/recipes-devtools/tcltk/tcl/run-ptest
index 8a9f611b0f..be067f13ea 100644
--- a/meta/recipes-devtools/tcltk/tcl/run-ptest
+++ b/meta/recipes-devtools/tcltk/tcl/run-ptest
@@ -1,6 +1,6 @@
 #!/bin/sh
 
-export TCL_LIBRARY=/usr/lib/tcl/ptest/library
+export TCL_LIBRARY=@libdir@/tcl/ptest/library
 export ERROR_ON_FAILURES=1
 export LANG=en-US.UTF-8
 
diff --git a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
index b67847c526..0d2efa44aa 100644
--- a/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
+++ b/meta/recipes-devtools/tcltk/tcl_9.0.0.bb
@@ -82,6 +82,8 @@ do_install_ptest() {
 	cp ${B}/tcltest ${D}${PTEST_PATH}
 	cp -r ${S}/library ${D}${PTEST_PATH}
 	cp -r ${S}/tests ${D}${PTEST_PATH}
+        # handle multilib
+        sed -i s:@libdir@:${libdir}:g ${D}${PTEST_PATH}/run-ptest
 }
 
 do_install_ptest:append:libc-musl () {
-- 
2.25.1


