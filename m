Received: from mga06.intel.com (mga06.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.917.1619398513291207353
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:55:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6vEJiGNpjtpi4v1Av2iu5Clnxaao2v7AGYpCUNJh4Rpwu+EX54QWCVi4OJiRZObXeroyAffmaQ
 J87mJOtyFEPg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="257568901"
X-IronPort-AV: E=Sophos;i="5.82,250,1613462400"; 
   d="scan'208";a="257568901"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:16 -0700
IronPort-SDR: jyxaT3P+NlA1YowXW/1NBmb+HfOtx1/PiaUQJoJ/9ddHYzgmPKCdeTOcAHORu79gPXtQCsDHqy
 NrHaTFoBMs9Q==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067600"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:55:15 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 59/64] qemu: fix CVE-2020-29443
Date: Mon, 26 Apr 2021 08:53:30 +0800
Message-Id: <27cc6761ecd7dbe5b7972706f2a21cb3ee5eef3f.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Sakib Sajal <sakib.sajal@windriver.com>

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 481e012de865ee232fa5a233e9f1d4fc7a2232ab)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |   1 +
 .../qemu/qemu/CVE-2020-29443.patch            | 107 ++++++++++++++++++
 2 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 65e0489a97..fc9c9e15f9 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://CVE-2020-35517_2.patch \
            file://CVE-2020-35517_3.patch \
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
2.30.2

