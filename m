Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFEA2C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 04:06:09 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.6608.1715745968473943271
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 May 2024 21:06:08 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5865270e69=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F1MPiV023423
	for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:06:07 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3y1yc4bq04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:06:07 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 14 May 2024 21:06:04 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 1/1] libarchive: fix CVE-2024-26256
Date: Wed, 15 May 2024 04:05:47 +0000
Message-ID: <20240515040547.3693075-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: _rc2N3eRgeCizAEFLCcP4eRofMTXyE1Q
X-Proofpoint-ORIG-GUID: _rc2N3eRgeCizAEFLCcP4eRofMTXyE1Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-14_16,2024-05-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=915
 priorityscore=1501 adultscore=0 malwarescore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1011 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150027
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 04:06:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199269

From: Yogita Urade <yogita.urade@windriver.com>

libarchive Remote Code Execution Vulnerability

References:
https://nvd.nist.gov/vuln/detail/CVE-2024-26256
https://bugzilla.suse.com/show_bug.cgi?id=CVE-2024-26256

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../libarchive/CVE-2024-26256.patch           | 29 +++++++++++++++++++
 .../libarchive/libarchive_3.6.2.bb            |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
new file mode 100644
index 0000000000..717a31f0e1
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/CVE-2024-26256.patch
@@ -0,0 +1,29 @@
+From eb7939b24a681a04648a59cdebd386b1e9dc9237 Mon Sep 17 00:00:00 2001
+From: Wei-Cheng Pan <legnaleurc@gmail.com>
+Date: Tue, 14 May 2024 08:50:44 +0000
+Subject: [PATCH] fix: OOB in rar e8 filter (#2135) This patch fixes an
+ out-of-bound error in rar e8 filter.
+
+CVE: CVE-2024-26256
+Upstream-Status: Backport [https://github.com/libarchive/libarchive/commit/eb7939b24a681a04648a59cdebd386b1e9dc9237]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ libarchive/archive_read_support_format_rar.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libarchive/archive_read_support_format_rar.c b/libarchive/archive_read_support_format_rar.c
+index 793e8e9..b8397d0 100644
+--- a/libarchive/archive_read_support_format_rar.c
++++ b/libarchive/archive_read_support_format_rar.c
+@@ -3624,7 +3624,7 @@ execute_filter_e8(struct rar_filter *filter, struct rar_virtual_machine *vm, siz
+   uint32_t filesize = 0x1000000;
+   uint32_t i;
+
+-  if (length > PROGRAM_WORK_SIZE || length < 4)
++  if (length > PROGRAM_WORK_SIZE || length <= 4)
+     return 0;
+
+   for (i = 0; i <= length - 5; i++)
+--
+2.40.0
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
index 0219ffa720..e091646e16 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.2.bb
@@ -28,7 +28,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile --without-iconv"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://CVE-2024-26256.patch \
+           "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "ba6d02f15ba04aba9c23fd5f236bb234eab9d5209e95d1c4df85c44d5f19b9b3"
-- 
2.40.0


