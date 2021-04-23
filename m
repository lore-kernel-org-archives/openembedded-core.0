Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web08.5556.1619154714452031819
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Apr 2021 22:11:54 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: sakib.sajal@windriver.com)
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 13N5BrG2024580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Apr 2021 22:11:53 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.4; Thu, 22 Apr 2021 22:11:52 -0700
Received: from localhost.localdomain (128.224.72.54) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.4 via Frontend Transport; Thu, 22 Apr 2021 22:11:52 -0700
From: "Sakib Sajal" <sakib.sajal@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 2/6] qemu: fix CVE-2020-29443
Date: Fri, 23 Apr 2021 01:11:36 -0400
Message-ID: <20210423051140.106348-2-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210423051140.106348-1-sakib.sajal@windriver.com>
References: <20210423051140.106348-1-sakib.sajal@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-29443.patch            | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index d9fa845ddb..be86379c1e 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -32,6 +32,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-tests-meson.build-use-relative-path-to-refer-to-file.patch \
 	   file://CVE-2021-20203.patch \
            file://CVE-2021-20181.patch \
+           file://CVE-2020-29443.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
new file mode 100644
index 0000000000..c72324fce6
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
@@ -0,0 +1,107 @@
+From c9a71afe182be5b62bd2ccdaf861695e0ec0731a Mon Sep 17 00:00:00 2001
+From: Prasad J Pandit <pjp@fedoraproject.org>
+Date: Mon, 18 Jan 2021 17:21:30 +0530
+Subject: [PATCH] ide: atapi: check logical block address and read size
+ (CVE-2020-29443)
+
+While processing ATAPI cmd_read/cmd_read_cd commands,
+Logical Block Address (LBA) maybe invalid OR closer to the last block,
+leading to an OOB access issues. Add range check to avoid it.
+
+Fixes: CVE-2020-29443
+Reported-by: Wenxiang Qian <leonwxqian@gmail.com>
+Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
+Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
+Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
+Message-Id: <20210118115130.457044-1-ppandit@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+Upstream-Status: Backport [b8d7f1bc59276fec85e4d09f1567613a3e14d31e]
+CVE: CVE-2020-29443
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+---
+ hw/ide/atapi.c | 30 ++++++++++++++++++++++++------
+ 1 file changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
+index e79157863..b626199e3 100644
+--- a/hw/ide/atapi.c
++++ b/hw/ide/atapi.c
+@@ -322,6 +322,8 @@ static void ide_atapi_cmd_reply(IDEState *s, int size, int max_size)
+ static void ide_atapi_cmd_read_pio(IDEState *s, int lba, int nb_sectors,
+                                    int sector_size)
+ {
++    assert(0 <= lba && lba < (s->nb_sectors >> 2));
++
+     s->lba = lba;
+     s->packet_transfer_size = nb_sectors * sector_size;
+     s->elementary_transfer_size = 0;
+@@ -420,6 +422,8 @@ eot:
+ static void ide_atapi_cmd_read_dma(IDEState *s, int lba, int nb_sectors,
+                                    int sector_size)
+ {
++    assert(0 <= lba && lba < (s->nb_sectors >> 2));
++
+     s->lba = lba;
+     s->packet_transfer_size = nb_sectors * sector_size;
+     s->io_buffer_size = 0;
+@@ -973,35 +977,49 @@ static void cmd_prevent_allow_medium_removal(IDEState *s, uint8_t* buf)
+ 
+ static void cmd_read(IDEState *s, uint8_t* buf)
+ {
+-    int nb_sectors, lba;
++    unsigned int nb_sectors, lba;
++
++    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
++    uint64_t total_sectors = s->nb_sectors >> 2;
+ 
+     if (buf[0] == GPCMD_READ_10) {
+         nb_sectors = lduw_be_p(buf + 7);
+     } else {
+         nb_sectors = ldl_be_p(buf + 6);
+     }
+-
+-    lba = ldl_be_p(buf + 2);
+     if (nb_sectors == 0) {
+         ide_atapi_cmd_ok(s);
+         return;
+     }
+ 
++    lba = ldl_be_p(buf + 2);
++    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
++        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
++        return;
++    }
++
+     ide_atapi_cmd_read(s, lba, nb_sectors, 2048);
+ }
+ 
+ static void cmd_read_cd(IDEState *s, uint8_t* buf)
+ {
+-    int nb_sectors, lba, transfer_request;
++    unsigned int nb_sectors, lba, transfer_request;
+ 
+-    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
+-    lba = ldl_be_p(buf + 2);
++    /* Total logical sectors of ATAPI_SECTOR_SIZE(=2048) bytes */
++    uint64_t total_sectors = s->nb_sectors >> 2;
+ 
++    nb_sectors = (buf[6] << 16) | (buf[7] << 8) | buf[8];
+     if (nb_sectors == 0) {
+         ide_atapi_cmd_ok(s);
+         return;
+     }
+ 
++    lba = ldl_be_p(buf + 2);
++    if (lba >= total_sectors || lba + nb_sectors - 1 >= total_sectors) {
++        ide_atapi_cmd_error(s, ILLEGAL_REQUEST, ASC_LOGICAL_BLOCK_OOR);
++        return;
++    }
++
+     transfer_request = buf[9] & 0xf8;
+     if (transfer_request == 0x00) {
+         /* nothing */
+-- 
+2.29.2
+
-- 
2.25.1

