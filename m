Return-Path: <joe.slater@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E28A4C352A1
	for <webhook@archiver.kernel.org>; Tue,  6 Dec 2022 19:49:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.1298.1670356147437731536
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Dec 2022 11:49:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=TbO5UiAx;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9339fa81fe=joe.slater@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B6HvhkT016581
	for <openembedded-core@lists.openembedded.org>; Tue, 6 Dec 2022 11:49:07 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PPS06212021;
 bh=DNmHgWp1OH0l8VsIjxiXNMpoSPx5nZM6nEr2YopWqZE=;
 b=TbO5UiAxHl9D++aGvnpQyeyTW3C71MwUN02zgzX63KK4+UVdZAsZbO3+mUhALZuY/2Jd
 tO7xgCY3il3zPXjYtGKYk4sk7J/4VH0ExUCQSddpz0q4mXP5jlm/J0YV7laTwuCQrK6B
 xtL7ZfwgubaFVXHia+SR9fjQ+nZL+afAqo5WDMdlmaXqqn736Fl+XR39ypydrIA+JOHw
 ZIKe7S/2HRQdTSO5HXDScnJBcMRIszNKbDE35oeeQUVPOJomsuQ5ZDSh7bP8NGymWg67
 odA+0c7yw4VrJrRGvIGr5JXKW41wvjakv/txHoDmw5JP6MAPrekQkuLLz9LDaA1J7lke fA== 
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3m82m6tp6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 11:49:07 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 6 Dec 2022 11:49:06 -0800
Received: from ala-lpggp5.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 6 Dec 2022 11:49:06 -0800
From: Joe Slater <joe.slater@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <joe.slater@windriver.com>, <randy.macleod@windriver.com>
Subject: [oe-core][PATCH 1/1] libarchive: fix CVE-2022-36227
Date: Tue, 6 Dec 2022 11:49:06 -0800
Message-ID: <20221206194906.8129-1-joe.slater@windriver.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: FfwXWAd0nIIEESL7-WCAPu_TWgrZo0U9
X-Proofpoint-GUID: FfwXWAd0nIIEESL7-WCAPu_TWgrZo0U9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-06_11,2022-12-06_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 adultscore=0
 phishscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 mlxscore=0
 bulkscore=0 mlxlogscore=813 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2212060165
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 06 Dec 2022 19:49:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174330

Import patch applied to libarchive after the 3.6.1 release.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
---
 .../libarchive/cve-2022-36227.patch           | 48 +++++++++++++++++++
 .../libarchive/libarchive_3.6.1.bb            |  1 +
 2 files changed, 49 insertions(+)
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
index 24d7918bf9..c812038352 100644
--- a/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
+++ b/meta/recipes-extended/libarchive/libarchive_3.6.1.bb
@@ -34,6 +34,7 @@ EXTRA_OECONF += "--enable-largefile"
 
 SRC_URI = "http://libarchive.org/downloads/libarchive-${PV}.tar.gz \
            file://0001-libarchive-Do-not-include-sys-mount.h-when-linux-fs..patch \
+           file://cve-2022-36227.patch \
            "
 UPSTREAM_CHECK_URI = "http://libarchive.org/"
 
-- 
2.38.1


