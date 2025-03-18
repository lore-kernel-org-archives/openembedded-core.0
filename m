Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98580C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 11:33:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.9525.1742297578499095652
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Mar 2025 04:32:58 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5172ccc31b=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52IA6GOX027942;
	Tue, 18 Mar 2025 04:32:57 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45d92jtx7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 18 Mar 2025 04:32:56 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 18 Mar 2025 04:32:56 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 18 Mar 2025 04:32:55 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH] spdx30: test the existence of directory before walking
Date: Tue, 18 Mar 2025 19:32:54 +0800
Message-ID: <20250318113254.3556987-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=QdRmvtbv c=1 sm=1 tr=0 ts=67d959e8 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=fKX6JA6z7F1ISKg_M8sA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: PF_T5QzTcJttGdiGzkYYuZZhAEUQEdcr
X-Proofpoint-GUID: PF_T5QzTcJttGdiGzkYYuZZhAEUQEdcr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 impostorscore=0
 mlxscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503180085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 11:33:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213207

Due to commit [spdx30: Improve os.walk() handling][1] applied,
it reported an error if walk directory failed

While SPDX_INCLUDE_SOURCES = "1", if recipe does not provide sysroots,
the walk in function add_package_files is broken

$ echo 'SPDX_INCLUDE_SOURCES = "1"' >> conf/local.conf
$ bitbake packagegroup-core-boot
|DEBUG: Adding sysroot files to SPDX
|ERROR: packagegroup-core-boot-1.0-r0 do_create_spdx: ERROR walking tmp/sysroots-components/intel_x86_64/packagegroup-core-boot: [Errno 2]
| No such file or directory: 'tmp/sysroots-components/intel_x86_64/packagegroup-core-boot'

Test the existence of directory before walking

[1] https://git.openembedded.org/openembedded-core/commit/?id=86b581e80637cd8136ce7a7e95db94d9553d2f60

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 3d80f05612f..0618f2f139d 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -152,6 +152,10 @@ def add_package_files(
     spdx_files = set()
 
     file_counter = 1
+    if not os.path.exists(topdir):
+        bb.note(f"Skip {topdir}")
+        return spdx_files
+
     for subdir, dirs, files in os.walk(topdir, onerror=walk_error):
         dirs[:] = [d for d in dirs if d not in ignore_dirs]
         if subdir == str(topdir):
-- 
2.34.1


