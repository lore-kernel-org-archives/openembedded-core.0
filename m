Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FAECC3DA4B
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 03:24:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.2668.1721100275390854021
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 20:24:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=79271bf3b2=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46G36UWO025161
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 20:24:35 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40bmv0ae4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 20:24:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 15 Jul 2024 20:24:34 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Mon, 15 Jul 2024 20:24:33 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][master][PATCH] rt_bmark.py: fix TypeError
Date: Tue, 16 Jul 2024 11:24:32 +0800
Message-ID: <20240716032432.3878766-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: LtDWWDhZnF70QLImbgGipQJZe2MsGfIb
X-Proofpoint-GUID: LtDWWDhZnF70QLImbgGipQJZe2MsGfIb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-15_19,2024-07-11_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 mlxscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 mlxlogscore=774
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2406140001 definitions=main-2407160024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jul 2024 03:24:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202079

From: Changqing Li <changqing.li@windriver.com>

Fix following error:
  File "/usr/lib64/rt-tests/ptest/./rt_bmark.py", line 287, in run_cyclictest_once
    m = rex.search(line)
        ^^^^^^^^^^^^^^^^
TypeError: cannot use a string pattern on a bytes-like object

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 meta/recipes-rt/rt-tests/files/rt_bmark.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-rt/rt-tests/files/rt_bmark.py b/meta/recipes-rt/rt-tests/files/rt_bmark.py
index 2a4eed412f..5d22623656 100755
--- a/meta/recipes-rt/rt-tests/files/rt_bmark.py
+++ b/meta/recipes-rt/rt-tests/files/rt_bmark.py
@@ -284,7 +284,7 @@ def run_cyclictest_once():
         avg_cnt = 0
 
         for line in res.splitlines():
-                m = rex.search(line)
+                m = rex.search(line.decode('utf-8'))
                 if m is not None:
                         minlist.append(int(m.group(2)))
                         maxlist.append(int(m.group(4)))
-- 
2.25.1


