Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A0DEB64DA
	for <webhook@archiver.kernel.org>; Tue, 18 Jul 2023 15:35:40 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11032.1689694535708090541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Jul 2023 08:35:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=pps06212021 header.b=n6SNTV05;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=65634f9655=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 36IDlTMr018167
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=H0rFI
	JMOPn1BM9SuVf8XNI3h2F1rF1ogRge94Dqmvvo=; b=n6SNTV0550anRia2BPG8O
	SbhHknOr6XviiLvqcjWeQ1G2XiKR7zPHpNdCNSCp4sspFTQn4eYBP2FPU5xYmPBr
	k16fBxdOdMZuL127kyZ+RIms4EKuO7XLXeq9qeMw6Q50e/CpteFqKMikpng99tJ+
	fwOjzgziwUiZnBxD1bZfZv0C61hhu2+sOWuYnfVMMvFA2vZu27NaKNbok8019Bu/
	GpYZNqB5rYzVVLwnpB2jCmcWbTAX6SCLQFWMw7X+AWROHn1l/mA9h+VfhvG7VqDo
	GnqdGLlliow/vBWNfdD10ICJtlXXSSPSj5f5aOEnq1/a5XwdBeAG43H96sC15a1l
	Q==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3run9jtrpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:35:34 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 08:35:32 -0700
From: Archana Polampalli <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
CC: <Hari.GPillai@windriver.com>
Subject: [oe-core][mickledore][PATCH 1/1] qemu: fix CVE-2023-0330
Date: Tue, 18 Jul 2023 15:35:14 +0000
Message-ID: <20230718153514.536611-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: M6skH7z2JY0rfSwRn3t1TZOHGgomRDNs
X-Proofpoint-ORIG-GUID: M6skH7z2JY0rfSwRn3t1TZOHGgomRDNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-18_11,2023-07-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2306200000 definitions=main-2307180143
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Jul 2023 15:35:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184534

A vulnerability in the lsi53c895a device affects the latest version
of qemu. A DMA-MMIO reentrancy problem may lead to memory corruption
bugs like stack overflow or use-after-free.

References:
https://nvd.nist.gov/vuln/detail/CVE-2023-0330

Upstream patches:
https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2023-0330.patch             | 75 +++++++++++++++++++
 2 files changed, 76 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 4c9be91cb0..15eba6163f 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -36,6 +36,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
            file://ppc.patch \
+	   file://CVE-2023-0330.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
new file mode 100644
index 0000000000..f609ea29b4
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/CVE-2023-0330.patch
@@ -0,0 +1,75 @@
+From b987718bbb1d0eabf95499b976212dd5f0120d75 Mon Sep 17 00:00:00 2001
+From: Thomas Huth <thuth@redhat.com>
+Date: Mon, 22 May 2023 11:10:11 +0200
+Subject: [PATCH] hw/scsi/lsi53c895a: Fix reentrancy issues in the LSI
+ controller (CVE-2023-0330)
+
+We cannot use the generic reentrancy guard in the LSI code, so
+we have to manually prevent endless reentrancy here. The problematic
+lsi_execute_script() function has already a way to detect whether
+too many instructions have been executed - we just have to slightly
+change the logic here that it also takes into account if the function
+has been called too often in a reentrant way.
+
+The code in fuzz-lsi53c895a-test.c has been taken from an earlier
+patch by Mauro Matteo Cascella.
+
+Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1563
+Message-Id: <20230522091011.1082574-1-thuth@redhat.com>
+Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
+Reviewed-by: Alexander Bulekov <alxndr@bu.edu>
+Signed-off-by: Thomas Huth <thuth@redhat.com>
+
+Upstream-Status: Backport [https://gitlab.com/qemu-project/qemu/-/commit/b987718bbb1d0eabf95499b976212dd5f0120d75]
+CVE: CVE-2023-0330
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ hw/scsi/lsi53c895a.c               | 23 +++++++++++++++------
+ tests/qtest/fuzz-lsi53c895a-test.c | 33 ++++++++++++++++++++++++++++++
+ 2 files changed, 50 insertions(+), 6 deletions(-)
+
+diff --git a/hw/scsi/lsi53c895a.c b/hw/scsi/lsi53c895a.c
+index 048436352b7a..f7d45b0b20fb 100644
+--- a/hw/scsi/lsi53c895a.c
++++ b/hw/scsi/lsi53c895a.c
+@@ -1134,15 +1134,24 @@ static void lsi_execute_script(LSIState *s)
+     uint32_t addr, addr_high;
+     int opcode;
+     int insn_processed = 0;
++    static int reentrancy_level;
++
++    reentrancy_level++;
+
+     s->istat1 |= LSI_ISTAT1_SRUN;
+ again:
+-    if (++insn_processed > LSI_MAX_INSN) {
+-        /* Some windows drivers make the device spin waiting for a memory
+-           location to change.  If we have been executed a lot of code then
+-           assume this is the case and force an unexpected device disconnect.
+-           This is apparently sufficient to beat the drivers into submission.
+-         */
++    /*
++     * Some windows drivers make the device spin waiting for a memory location
++     * to change. If we have executed more than LSI_MAX_INSN instructions then
++     * assume this is the case and force an unexpected device disconnect. This
++     * is apparently sufficient to beat the drivers into submission.
++     *
++     * Another issue (CVE-2023-0330) can occur if the script is programmed to
++     * trigger itself again and again. Avoid this problem by stopping after
++     * being called multiple times in a reentrant way (8 is an arbitrary value
++     * which should be enough for all valid use cases).
++     */
++    if (++insn_processed > LSI_MAX_INSN || reentrancy_level > 8) {
+         if (!(s->sien0 & LSI_SIST0_UDC)) {
+             qemu_log_mask(LOG_GUEST_ERROR,
+                           "lsi_scsi: inf. loop with UDC masked");
+@@ -1596,6 +1605,8 @@ static void lsi_execute_script(LSIState *s)
+         }
+     }
+     trace_lsi_execute_script_stop();
++
++    reentrancy_level--;
+ }
+
+ static uint8_t lsi_reg_readb(LSIState *s, int offset)
-- 
2.40.0


