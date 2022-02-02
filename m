Return-Path: <sakib.sajal@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB38C4321E
	for <webhook@archiver.kernel.org>; Wed,  2 Feb 2022 15:47:35 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web11.66128.1643816854011578685
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Feb 2022 07:47:34 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=permerror,
 err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid
 domain name (domain: windriver.com, ip: 147.11.3.146,
 mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 212FlWCt024557
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:33 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 212FlQXj023439
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
 Wed, 2 Feb 2022 07:47:32 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Wed, 2 Feb 2022 07:47:28 -0800
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Wed, 2 Feb 2022 07:47:28 -0800
From: Sakib Sajal <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 7/8] qemu: fix CVE-2021-3930
Date: Wed, 2 Feb 2022 10:47:19 -0500
Message-ID: <20220202154720.18976-7-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220202154720.18976-1-sakib.sajal@windriver.com>
References: <20220202154720.18976-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Feb 2022 15:47:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161211

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
index 0000000000..bfbe5cee33
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
+Upstream-Status: Backport [b3af7fdf9cc537f8f0dd3e2423d83f5c99a457e8]
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


