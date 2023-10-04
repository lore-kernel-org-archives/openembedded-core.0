Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93ADE7B5F3
	for <webhook@archiver.kernel.org>; Wed,  4 Oct 2023 11:19:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15807.1696418394694760503
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Oct 2023 04:19:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=HBbUPi2u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8641f761f7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 394AvajA024378
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Oct 2023 04:19:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=5Luzy
	SkLWoyURxZuvssUvYBNthg62nL5z26cvKOZ33U=; b=HBbUPi2uui8+IbHjaUIgB
	BYuJ3wVlW3PaMXM2LyyZA6tj0fbsZi1XyKxq/kDYR5dzCwxaP/a79pNSLBjB6r9X
	e7zs/+jvYHKnLQX97cEeC7mNiK3qhrLSt0mbLZLpD1YNHn0eoZybAW/Xi2JZDeei
	4IBi01Pe+AtpdrhuFDVE9Sshd+6o8HtKSCFMOlNzaUj0opvRpvPRvjDH1RlLondo
	Lzi607P/ecYY7D0AkF7yoqOaZ6iMK97d8E071shdYBpmnJcYftAC8nJR0sX3QDCm
	5eGYBtdQsPLvdCgBSVWNRBRYfT+izv3dYb11z+DMmOO2F5DHBIGF+XBS+Bw6cmkn
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tek6g3hb6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 04:19:53 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 4 Oct 2023 04:19:51 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][mickledore][PATCH 1/1] qemu: fix CVE-2023-42467
Date: Wed, 4 Oct 2023 11:19:31 +0000
Message-ID: <20231004111931.2845914-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: K4IxodNm9fkJkWBBgLBNEm2_lhG07J2B
X-Proofpoint-GUID: K4IxodNm9fkJkWBBgLBNEm2_lhG07J2B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-04_03,2023-10-02_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1011 malwarescore=0 mlxlogscore=963 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310040082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 Oct 2023 11:19:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188674

From: Yogita Urade <yogita.urade@windriver.com>

QEMU through 8.0.0 could trigger a division by zero in scsi_disk_reset
in hw/scsi/scsi-disk.c because scsi_disk_emulate_mode_select does not
prevent s->qdev.blocksize from being 256. This stops QEMU and the guest
immediately.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-42467
https://gitlab.com/qemu-project/qemu/-/issues/1813

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-42467.patch            | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index c8e1d28654..33f5516fa3 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -41,6 +41,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 	   file://CVE-2023-3255.patch \
 	   file://CVE-2023-2861.patch \
 	   file://CVE-2023-3354.patch \
+	   file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
new file mode 100644
index 0000000000..0ca93494f0
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
@@ -0,0 +1,49 @@
+From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Wed, 4 Oct 2023 08:54:13 +0000
+Subject: [PATCH] hw/scsi/scsi-disk: Disallow block sizes smaller than 512
+ [CVE-2023-42467]
+
+We are doing things like
+
+    nb_sectors /= (s->qdev.blocksize / BDRV_SECTOR_SIZE);
+
+in the code here (e.g. in scsi_disk_emulate_mode_sense()), so if
+the blocksize is smaller than BDRV_SECTOR_SIZE (=512), this crashes
+with a division by 0 exception. Thus disallow block sizes of 256
+bytes to avoid this situation.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1813
+CVE: 2023-42467
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+Message-ID: <20230925091854.49198-1-thuth@redhat.com>
+Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
+
+CVE: CVE-2023-42467
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/7cfcc79b0ab800959716738aff9419f53fc68c9c]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ hw/scsi/scsi-disk.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/hw/scsi/scsi-disk.c b/hw/scsi/scsi-disk.c
+index e493c2881..915e0369c 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1624,9 +1624,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
+          * Since the existing code only checks/updates bits 8-15 of the block
+          * size, restrict ourselves to the same requirement for now to ensure
+          * that a block size set by a block descriptor and then read back by
+-         * a subsequent SCSI command will be the same
++         * a subsequent SCSI command will be the same. Also disallow a block
++         * size of 256 since we cannot handle anything below BDRV_SECTOR_SIZE.
+          */
+-        if (bs && !(bs & ~0xff00) && bs != s->qdev.blocksize) {
++        if (bs && !(bs & ~0xfe00) && bs != s->qdev.blocksize) {
+             s->qdev.blocksize = bs;
+             trace_scsi_disk_mode_select_set_blocksize(s->qdev.blocksize);
+         }
+--
+2.40.0
-- 
2.40.0


