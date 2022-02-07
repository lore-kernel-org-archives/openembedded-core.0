Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5A41C433FE
	for <webhook@archiver.kernel.org>; Mon,  7 Feb 2022 09:07:15 +0000 (UTC)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web11.19860.1644224834864333556
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Feb 2022 01:07:15 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=S/5f1QDJ;
 spf=pass (domain: intel.com, ip: 134.134.136.31,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1644224834; x=1675760834;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=ayrlJBLzg3Nz7PXQNjfNPCFDA8ZOlZ4AmEHx+Q2RDxE=;
  b=S/5f1QDJaHSpBMREE/wceUXbz+1tuDpwOHpMfaQZcpl+ya9zJGr6/GJ4
   ZeE6OUZ80viozMSo9scTY/W5+wP47Oei61LOo4EqRp7Zih61/GrwKDZ9n
   5tPT4sWV0VbGBASlHtdpaVbPeP76yMKXl2pQi0NJHfi9u5y9p8lsVsszD
   J4Iir/Sf9KEfUqs6RjIoy9qpnYDJGM4YnRxo/WgzoPhctez2Iev7qP+CU
   PwbCpR2B5RfpDty/elbr9A33EyVX9PxXVOGD+Iw6Sc6YHdPLMDLdp727U
   FvvIT+SmKEQo0kJX+UQXvcl8SH3bIKMmY/+YMF+rRoAygrkMeKKR/RSfT
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10250"; a="309420787"
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="309420787"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:13 -0800
X-IronPort-AV: E=Sophos;i="5.88,349,1635231600";
   d="scan'208";a="499140398"
Received: from xgoh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.138.138])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 01:07:11 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/12] qemu: fix CVE-2021-3930
Date: Mon,  7 Feb 2022 17:06:53 +0800
Message-Id: 
 <f0504578174f77ba231c72801fb5a295869a40d1.1644224643.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1644224643.git.anuj.mittal@intel.com>
References: <cover.1644224643.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Feb 2022 09:07:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161444

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2021-3930.patch             | 53 +++++++++++++++++++
 2 files changed, 54 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3930.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 5c1c88db25..35aa3e1d7e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -72,6 +72,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2021-3682.patch \
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
2.34.1


