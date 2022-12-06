Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3BD3C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 22:16:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1880.1670364962485176644
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 14:16:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=k5Ez9Vvf;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=9339fa81fe=joe.slater@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6DwgMN031192
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 22:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=sFJxuYSHPmhXOHKFqGIHv/vuFbbv9tfPYuJuiG0YRPA=;
 b=k5Ez9VvfIrGV9N5t4kX9R2htKrbHbt7lgRB4HOD9iMxzdqhL7IUoHmo3Ol4bHz7er4iC
 /+TkXufmiRj9PuhU6dhiTw+3NiELjukEpq5G5LIM6GgGBVRgQMtxCn3qVNDDp3FBbKKD
 XxAKGGBdLxKv1GDC6lAzx0tUgyd67Hp/Cu2qWtmW3dRvPpIGM6vSRpg8GHv4+Xl5tOW/
 odQdE4W38cmWsLgk+mPBFI/AXoH+cOqEnveb9D120uCS3KeiMIrNPxEQ+KcajfHdUtJ3
 Euhi5ZgHIFQtmKGYikGFxXJp0XPzF2GN4EpsQoE8QZOG83322N81Q+rhfbHc42/JfA7I Sw== 
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m7up0ayb0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 22:16:01 +0000
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 6 Dec 2022 14:16:00 -0800
Received: from ala-lpggp5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2308.27 via Frontend Transport; Tue, 6 Dec 2022 14:16:00 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [kirkstone][oe-core][PATCH 1/1] libarchive: fix CVE-2022-36227
Date: Tue, 6 Dec 2022 14:16:00 -0800
Message-ID: <20221206221600.28214-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FT50hEDeiACM3T2dTSGQ5YvExF3l4SoV
X-Proofpoint-GUID: FT50hEDeiACM3T2dTSGQ5YvExF3l4SoV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_12,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 mlxlogscore=679 priorityscore=1501 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2212060187
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 22:16:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174333

Import a patch from libarchive applied after release 3.6.1.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libarchive/cve-2022-36227.patch           | 48 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  4 +-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch

diff --git a/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
new file mode 100644
index 0000000000..4d13bf6492
--- /dev/null
+++ b/meta/recipes-extended/libarchive/libarchive/cve-2022-36227.patch
@@ -0,0 +1,48 @@
+From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
+From: obiwac <obiwac@gmail.com>
+Date: Fri, 22 Jul 2022 22:41:10 +0200
+Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
+
+---
+ libarchive/archive_write.c | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+---
+CVE: CVE-2022-36227
+
+Source-Repo: https://github.com/libarchive/libarchive.git
+
+Upstream-Status: Backport [bff38efe8c... unmodified]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+diff --git a/libarchive/archive_write.c b/libarchive/archive_write.c
+index 66592e82..27626b54 100644
+--- a/libarchive/archive_write.c
++++ b/libarchive/archive_write.c
+@@ -201,6 +201,10 @@ __archive_write_allocate_filter(struct archive *_a)
+ 	struct archive_write_filter *f;
+ 
+ 	f = calloc(1, sizeof(*f));
++
++	if (f == NULL)
++		return (NULL);
++
+ 	f->archive = _a;
+ 	f->state = ARCHIVE_WRITE_FILTER_STATE_NEW;
+ 	if (a->filter_first == NULL)
+@@ -548,6 +552,10 @@ archive_write_open2(struct archive *_a, void *client_data,
+ 	a->client_data = client_data;
+ 
+ 	client_filter = __archive_write_allocate_filter(_a);
++
++	if (client_filter == NULL)
++		return (ARCHIVE_FATAL);
++
+ 	client_filter->open = archive_write_client_open;
+ 	client_filter->write = archive_write_client_write;
+ 	client_filter->close = archive_write_client_close;
+-- 
+2.38.1
+
diff --git a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
index c795b41628..8213940ad3 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -32,7 +32,9 @@ PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd,"
 
 EXTRA_OECONF += "--enable-largefile"
 
-SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz"
+SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
+           file://cve-2022-36227.patch"
+
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
 SRC_URI[sha256sum] = "c676146577d989189940f1959d9e3980d28513d74eedfbc6b7f15ea45fe54ee2"
-- 
2.38.1


