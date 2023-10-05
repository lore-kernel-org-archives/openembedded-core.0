Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95E28E9370A
	for <webhook@archiver.kernel.org>; Thu,  5 Oct 2023 11:13:17 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12663.1696504395832676162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Oct 2023 04:13:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=mvbUS+mc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=864233cdcb=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3959vEaC022589
	for <openembedded-core@lists.openembedded.org>; Thu, 5 Oct 2023 11:13:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=wAk/Y
	vrlT/mPZSm154RIrXE5g+/4tPZM9gtn2zXl8sI=; b=mvbUS+mcpvaq8UccX1yr/
	jjVOcrW3r2USvMYgNc2CU1FL8t6+XatURacCtuBV/5yNwfB9YDHzYvMj5Fffe2Aj
	PSZQ0AnG5Um3ZH3duAd6l+3dEw94OqSMn3FU/PbCBgjf31bv39dtEcBNJ18PUnLe
	5Ki8p9wsioulawvzGYfKXTbW4CpCqbuwo70AXhJnm8hKjkQNy+Ev1/CQQPFtrzCC
	KiaBIuBNfxh4pGrt/pz7TkEwu9e6b3DOc8AuyjH4i1RO72FfDRv8vZBelpfmu2kx
	fvvhZvBVx7Uv800OQjSELGXLkTHgkW7gk4zT3a0WyuyKGp76sz0f1+jaLi4udPGx
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3thtya01nn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:13:14 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 5 Oct 2023 04:13:11 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] qemu: fix CVE-2023-42467
Date: Thu, 5 Oct 2023 11:12:52 +0000
Message-ID: <20231005111252.957163-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: Q6HaVx09IMtYhnyewvALCg99iVaRnhY8
X-Proofpoint-ORIG-GUID: Q6HaVx09IMtYhnyewvALCg99iVaRnhY8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-05_08,2023-10-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2309180000 definitions=main-2310050087
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Oct 2023 11:13:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188719

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
index 9664b747b3..b331f87c0d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://fixmips.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+	   file://CVE-2023-42467.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
new file mode 100644
index 0000000000..86ab7cf81a
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-42467.patch
@@ -0,0 +1,49 @@
+From 7cfcc79b0ab800959716738aff9419f53fc68c9c Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Thu, 5 Oct 2023 06:01:10 +0000
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
+index e0d79c796..477ee2bcd 100644
+--- a/hw/scsi/scsi-disk.c
++++ b/hw/scsi/scsi-disk.c
+@@ -1628,9 +1628,10 @@ static void scsi_disk_emulate_mode_select(SCSIDiskReq *r, uint8_t *inbuf)
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


