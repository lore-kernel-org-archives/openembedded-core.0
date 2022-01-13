Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0BE3C433F5
	for <webhook@archiver.kernel.org>; Thu, 13 Jan 2022 23:36:18 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.309.1642116977438612583
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 15:36:18 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 20DNaFfR003716
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 15:36:15 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 20DNa6vo003925
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Jan 2022 15:36:15 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 13 Jan 2022 15:36:10 -0800
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 13 Jan 2022 15:36:10 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 13 Jan 2022 15:36:10 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 7/8] qemu: CVE-2021-3930
Date: Thu, 13 Jan 2022 18:35:50 -0500
Message-ID: <20220113233551.36855-7-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220113233551.36855-1-sakib.sajal@windriver.com>
References: <20220113233551.36855-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Jan 2022 23:36:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160543

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3930.patch             | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 7648ce9a38..4a5379893c 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -79,6 +79,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3594.patch \
            file://CVE-2021-3713.patch \
            file://CVE-2021-3748.patch \
+           file://CVE-2021-3930.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch b/meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch
new file mode 100644
index 0000000000..368bd12704
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch
@@ -0,0 +1,53 @@
+From cdca50eff9c38367be54f92839734ab490c8b0f7 Mon Sep 17 00:00:00 2001
+From: Mauro Matteo Cascella <mcascell@redhat.com>
+Date: Thu, 4 Nov 2021 17:31:38 +0100
+Subject: [PATCH 10/12] hw/scsi/scsi-disk: MODE_PAGE_ALLS not allowed in MODE
+ SELECT commands
+
+This avoids an off-by-one read of 'mode_sense_valid' buffer in
+hw/scsi/scsi-disk.c:mode_sense_page().
+
+Fixes: CVE-2021-3930
+Cc: qemu-stable@nongnu.org
+Reported-by: Alexander Bulekov <alxndr@bu.edu>
+Fixes: a8f4bbe2900 ("scsi-disk: store valid mode pages in a table")
+Fixes: #546
+Reported-by: Qiuhao Li <Qiuhao.Li@outlook.com>
+Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-3930
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/scsi/scsi-disk.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index 90841ad79..5b44ed7d8 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1100,6 +1100,7 @@ static int mode_sense_page(SCSIDiskState *s, int page, uint8_t **p_outbuf,
+     uint8_t *p = *p_outbuf + 2;
+     int length;
+ 
++    assert(page < ARRAY_SIZE(mode_sense_valid));
+     if ((mode_sense_valid[page] & (1 << s->qdev.type)) == 0) {
+         return -1;
+     }
+@@ -1441,6 +1442,11 @@ static int scsi_disk_check_mode_select(SCSIDiskState *s, int page,
+         return -1;
+     }
+ 
++    /* MODE_PAGE_ALLS is only valid for MODE SENSE commands */
++    if (page == MODE_PAGE_ALLS) {
++        return -1;
++    }
++
+     p = mode_current;
+     memset(mode_current, 0, inlen + 2);
+     len = mode_sense_page(s, page, &p, 0);
+-- 
+2.31.1
+
-- 
2.33.0


