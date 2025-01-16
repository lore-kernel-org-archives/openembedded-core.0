Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5633FC02187
	for <webhook@archiver.kernel.org>; Thu, 16 Jan 2025 15:51:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.52743.1737042688613371602
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Jan 2025 07:51:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=311110a243=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GDe2kP023856
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:28 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pncwk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 07:51:28 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 16 Jan 2025 07:51:27 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 16 Jan 2025 07:51:26 -0800
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 4/8] rsync: fix CVE-2024-12085
Date: Thu, 16 Jan 2025 15:51:15 +0000
Message-ID: <20250116155119.3867588-4-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250116155119.3867588-1-archana.polampalli@windriver.com>
References: <20250116155119.3867588-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67892b00 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=VdSt8ZQiCzkA:10 a=hGzw-44bAAAA:8 a=t7CeM3EgAAAA:8 a=oq-7gxcSAAAA:8 a=Fms5A6R0EmdmoJfQNSMA:9 a=HvKuF1_PTVFglORKqfwH:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=UIhn0zqP03opOuWSx-ON:22
X-Proofpoint-GUID: -VPJTLYS9jTwLpDTgwTNf6YGTE5RaBSb
X-Proofpoint-ORIG-GUID: -VPJTLYS9jTwLpDTgwTNf6YGTE5RaBSb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501160119
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jan 2025 15:51:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209962

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in the rsync daemon which could be triggered when rsync compares
file checksums. This flaw allows an attacker to manipulate the checksum length
(s2length) to cause a comparison between a checksum and uninitialized memory and
leak one byte of uninitialized stack data at a time.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../rsync/files/CVE-2024-12085.patch          | 32 +++++++++++++++++++
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-devtools/rsync/files/CVE-2024-12085.patch

diff --git a/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
new file mode 100644
index 0000000000..165d5a62f9
--- /dev/null
+++ b/meta/recipes-devtools/rsync/files/CVE-2024-12085.patch
@@ -0,0 +1,32 @@
+From 589b0691e59f761ccb05ddb8e1124991440db2c7 Mon Sep 17 00:00:00 2001
+From: Andrew Tridgell <andrew@tridgell.net>
+Date: Thu, 14 Nov 2024 09:57:08 +1100
+Subject: [PATCH] prevent information leak off the stack
+
+prevent leak of uninitialised stack data in hash_search
+
+CVE: CVE-2024-12085
+
+Upstream-Status: Backport [https://git.samba.org/?p=rsync.git;a=commit;h=589b0691e59f761ccb05ddb8e1124991440db2c7]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ match.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/match.c b/match.c
+index 36e78ed2..dfd6af2c 100644
+--- a/match.c
++++ b/match.c
+@@ -147,6 +147,9 @@ static void hash_search(int f,struct sum_struct *s,
+	int more;
+	schar *map;
+
++	// prevent possible memory leaks
++	memset(sum2, 0, sizeof sum2);
++
+	/* want_i is used to encourage adjacent matches, allowing the RLL
+	 * coding of the output to work more efficiently. */
+	want_i = 0;
+--
+2.40.0
diff --git a/meta/recipes-devtools/rsync/rsync_3.2.7.bb b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
index 749d44948d..6f4d539e4a 100644
--- a/meta/recipes-devtools/rsync/rsync_3.2.7.bb
+++ b/meta/recipes-devtools/rsync/rsync_3.2.7.bb
@@ -17,6 +17,7 @@ SRC_URI = "https://download.samba.org/pub/${BPN}/src/${BP}.tar.gz \
            file://0001-Add-missing-prototypes-to-function-declarations.patch \
            file://CVE-2024-12084-0001.patch \
            file://CVE-2024-12084-0002.patch \
+           file://CVE-2024-12085.patch \
            "
 
 SRC_URI[sha256sum] = "4e7d9d3f6ed10878c58c5fb724a67dacf4b6aac7340b13e488fb2dc41346f2bb"
-- 
2.40.0


