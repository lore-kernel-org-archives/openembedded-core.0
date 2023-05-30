Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15E99C77B7A
	for <webhook@archiver.kernel.org>; Tue, 30 May 2023 13:17:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.9721.1685452631753451814
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 May 2023 06:17:11 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5514820b90=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34UBpei6012308
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:17:11 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3quhcja96b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 06:17:10 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Tue, 30 May 2023 06:17:10 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Tue, 30 May 2023 06:17:09 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: Split the qemu package
Date: Tue, 30 May 2023 21:17:08 +0800
Message-ID: <20230530131708.1916975-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: s7uV6_2QLlVll0ow8g8Xb4lUAmRxG4NS
X-Proofpoint-ORIG-GUID: s7uV6_2QLlVll0ow8g8Xb4lUAmRxG4NS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-30_10,2023-05-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=907
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305300108
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 May 2023 13:17:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181922

From: Mingli Yu <mingli.yu@windriver.com>

Currently all files packaged into one package such as qemu-7.2.0-*.rpm.
After the qemu package installed on the target, it will take up 464M
which includes not only the one matches the arch of the target but aslo
all available built qemu targets which set by QEMU_TARGETS.

Split the qemu package into qemu-7.2.0-*.rpm, qemu-aarch64-7.2.0*.rpm,
qemu-arm-7.2.0*.rpm, qemu-x86_64-7.2.0*.rpm and etc. And let user can only
choose the corresponding qemu arch package they want to install should ease
the concerns who cares much about the size in embedded device as it
decreases the qemu rpm(qemu-7.2.0*.rpm) size from about 65M to about 17M
and the size of the extracted qemu RPM decreased from about 464M to about
248M.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a87dee5c99..7302d63747 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -230,6 +230,25 @@ INSANE_SKIP:${PN} = "arch"
 
 FILES:${PN} += "${datadir}/icons"
 
+python(){
+    allarchs = d.getVar('QEMU_TARGETS').split()
+    packages = d.getVar('PACKAGES').split()
+    pn = d.getVar('PN')
+
+    newpackages=[]
+    for arch in allarchs:
+        archpackage = 'qemu-' + arch
+        if archpackage not in packages:
+            newpackages.append(archpackage)
+        d.setVar('FILES:' + pn + "-" + arch, '${bindir}/qemu-' + arch)
+        d.appendVar('FILES:' + pn + "-" + arch, ' ' + '${bindir}/qemu-system-' + arch)
+        if arch == "mips":
+            d.appendVar('RDEPENDS:' + pn + '-' + arch, ' ' + 'bash')
+    packages = newpackages + packages
+    d.setVar('PACKAGES', ' '.join(packages))
+}
+
+
 # Put the guest agent in a separate package
 PACKAGES =+ "${PN}-guest-agent"
 SUMMARY:${PN}-guest-agent = "QEMU guest agent"
-- 
2.25.1


