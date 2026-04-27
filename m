Return-Path: <hongxu.jia@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2E27FF8865
	for <webhook@archiver.kernel.org>; Mon, 27 Apr 2026 04:57:05 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.35637.1777265814147285785
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Apr 2026 21:56:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=i0xYM0U3;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=857747364e=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R4aZGq2781991;
	Mon, 27 Apr 2026 04:56:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=vE8MbGKCE/ObxiUkYtcH
	94fIgpz8mypVmFWnDqmr44w=; b=i0xYM0U3OZZrckBwHGOkOCUSA5/hiyzjVmsb
	XsKr1FLwa1fP4PKaaBYoLlnskvFhQ5udTNgsud870jeDsNHgwz6nZmeRDztCokgb
	7j1gfLnZLAQzAIwndEaHUhzqaYM354gBA2yAQe6vuEijvYAaNYrp737DYw9LuBYT
	zUoqs9UeCX/XUhYeIV4MfYeYMi58+G3FvvFoNB4NIJ7rcEEotMPQxpqjudvhlCTR
	0uWR1XGBor7Oocmoe2UqKGAx1adL6TigB6DB73zm5J1+AYY8SHgJKf5iKYEC9mqd
	P2qRi1jmUHVhyQ+W/2TubKaE8eR2pyY7XTN0J8YdpIWlZBt8tw==
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4drju09kwt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 27 Apr 2026 04:56:52 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (10.11.224.121) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Sun, 26 Apr 2026 21:56:51 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Sun, 26 Apr 2026 21:56:50 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <yoann.congal@smile.fr>
Subject: [scarthgap][PATCH 1/3] u-boot: fix CVE-2025-24857
Date: Mon, 27 Apr 2026 12:56:48 +0800
Message-ID: <20260427045650.2365793-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=J+SaKgnS c=1 sm=1 tr=0 ts=69eeec94 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22
 a=klDOsUkWDRETUCZYPvoE:22 a=PYnjg3YJAAAA:8 a=YfCOm-DyAAAA:8 a=t7CeM3EgAAAA:8
 a=k-42gJp3AAAA:8 a=74-8NBBHaaayuivBuCkA:9 a=zQLMK8awuJ6_Hvp-_9Ux:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=uCSXFHLys93vLW5PjgO_:22
X-Proofpoint-GUID: 7oFLzBJVC1qWUimmkJ8DukUCT6uc6xIb
X-Proofpoint-ORIG-GUID: 7oFLzBJVC1qWUimmkJ8DukUCT6uc6xIb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDA1MCBTYWx0ZWRfX6CUrSk4OnmYw
 w5eJxN30Zm49qhd4JeTCRAiDq5v0TlpjDLcu+hY9jQuy34BFCInxFHpt8muNZgnop8eYpH0eEpw
 UCw0cXJLSaImg8UvYAeTACNW0LRYVfkUpfE5aAUI/WR2g73TfTRsLSiBw3wuZYrOyE3vX02BvMB
 +Zpg89SzVDbDuWOe6WFWFeab45AsUXKY3OsQttzMhuV0GQLK6MIsQt8tjChqGA/Mz/gZstrtpnf
 9vgY5e32GpnChCUc0bdzNhf5Xrn4/F/6A8qChcFTg6EJwekdHtbqU17QFbNZeQCpVlx80WY1/gk
 XJMicCO9NPSqcOApBXTIiSj3DDnSCuMrp2YBN0qJtubtjbAUMzfXzaHqtohws/1/Py5HEoto1yr
 r/3wzPO5Jq0ticW9llO2GAyE5yfyT+ClAMamTiPQNF2EJklg9/ACvyt050uCjS0uYlftspi/6lX
 YJLH5Pv5SGb5p8MnGzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0
 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Apr 2026 04:57:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235975

According to [1], Improper access control for volatile memory containing boot
code in Universal Boot Loader (U-Boot) before 2017.11 and Qualcomm chips IPQ4019,
IPQ5018, IPQ5322, IPQ6018, IPQ8064, IPQ8074, and IPQ9574 could allow an attacker
to execute arbitrary code.

Backport a patch [2] from upstream to fix CVE-2025-24857

[1] https://nvd.nist.gov/vuln/detail/CVE-2025-24857
[2] https://source.denx.de/u-boot/u-boot/-/commit/87d85139a96a39429120cca838e739408ef971a2

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2025-24857.patch         | 42 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch b/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
new file mode 100644
index 0000000000..99acd5bab1
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2025-24857.patch
@@ -0,0 +1,42 @@
+From 15a46d72515c04d0eeaca19bf0356a39efc9cf93 Mon Sep 17 00:00:00 2001
+From: Tom Rini <trini@konsulko.com>
+Date: Tue, 9 Dec 2025 15:23:01 -0600
+Subject: [PATCH] fs: fat: Perform sanity checks on getsize in get_fatent()
+
+We do not perform a check on the value of getsize in get_fatent to
+ensure that it will fit within the allocated buffer. For safety sake,
+add a check now and if the value exceeds FATBUFBLOCKS use that value
+instead. While not currently actively exploitable, it was in the past so
+adding this check is worthwhile.
+
+This addresses CVE-2025-24857 and was originally reported by Harvey
+Phillips of Amazon Element55.
+
+Signed-off-by: Tom Rini <trini@konsulko.com>
+
+CVE: CVE-2025-24857
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/87d85139a96a39429120cca838e739408ef971a2]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ fs/fat/fat.c | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/fs/fat/fat.c b/fs/fat/fat.c
+index e2570e81676..f6dc7ed15fe 100644
+--- a/fs/fat/fat.c
++++ b/fs/fat/fat.c
+@@ -215,6 +215,11 @@ static __u32 get_fatent(fsdata *mydata, __u32 entry)
+ 		if (flush_dirty_fat_buffer(mydata) < 0)
+ 			return -1;
+ 
++		if (getsize > FATBUFBLOCKS) {
++			debug("getsize is too large for bufptr\n");
++			getsize = FATBUFBLOCKS;
++		}
++
+ 		if (disk_read(startblock, getsize, bufptr) < 0) {
+ 			debug("Error reading FAT blocks\n");
+ 			return ret;
+-- 
+2.49.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index 1f17bd7d0a..5f6bd44ab7 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2025-24857.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.34.1


