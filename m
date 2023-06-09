Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F49DC7EE23
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 03:04:26 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.5253.1686279860631909080
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Jun 2023 20:04:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=552455cca2=mingli.yu@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35930UPp007505
	for <openembedded-core@lists.openembedded.org>; Thu, 8 Jun 2023 20:04:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3r2av7aa61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 08 Jun 2023 20:04:20 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 8 Jun 2023 20:04:19 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Thu, 8 Jun 2023 20:04:18 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v6] qemu: Split the qemu package
Date: Fri, 9 Jun 2023 11:04:18 +0800
Message-ID: <20230609030418.540053-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <1766DB271C48CF77.6460@lists.openembedded.org>
References: <1766DB271C48CF77.6460@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: NJ_bBm5mZvSMgt6uYxFTtGWU0Nq0oWsj
X-Proofpoint-GUID: NJ_bBm5mZvSMgt6uYxFTtGWU0Nq0oWsj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-08_18,2023-06-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 phishscore=0 mlxlogscore=826
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306090026
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 03:04:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182526

From: Mingli Yu <mingli.yu@windriver.com>

Currently all files as below packaged into one package such as
qemu-7.2.0-*.rpm. After the qemu package installed on the target,
it will take up about 464M which includes not only the one matches
the arch of the target but aslo all available built qemu targets
which set by QEMU_TARGETS.

 # ls tmp-glibc/work/core2-64-wrs-linux/qemu/7.2.0-r0/image/usr/bin/
 qemu-aarch64  qemu-img          qemu-mips64el   qemu-ppc64
 qemu-sh4    qemu-system-loongarch64  qemu-system-ppc      qemu-system-x86_64
 qemu-arm      qemu-io           qemu-mipsel     qemu-ppc64le
 qemu-storage-daemon  qemu-system-mips         qemu-system-ppc64
 qemu-x86_64 qemu-edid     qemu-loongarch64  qemu-mips.real
 qemu-pr-helper  qemu-system-aarch64  qemu-system-mips64
 qemu-system-riscv32 qemu-ga       qemu-mips         qemu-nbd
 qemu-riscv32    qemu-system-arm      qemu-system-mips64el
 qemu-system-riscv64 qemu-i386     qemu-mips64       qemu-ppc
 qemu-riscv64    qemu-system-i386     qemu-system-mipsel qemu-system-sh4

Split the qemu package into qemu-7.2.0-*.rpm, qemu-system-*.rpm,
qemu-user-*.rpm and etc. And let user can only choose the corresponding
qemu arch package they want to install should ease the concerns who
cares much about the size in embedded device as it decreases the qemu rpm
(qemu-7.2.0*.rpm) size from about 65M to about 19M and the size of the
extracted qemu RPM decreased from about 464M to about 248M.

For the users who want to install all arch packages, they can install
qemu-system-all and qemu-user-all to meet their need.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu.inc | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a87dee5c99..6acda61425 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -230,6 +230,28 @@ INSANE_SKIP:${PN} = "arch"
 
 FILES:${PN} += "${datadir}/icons"
 
+# For user who want to install all arch packages
+PACKAGES =+ "${PN}-system-all ${PN}-user-all"
+
+ALLOW_EMPTY:${PN}-system-all = "1"
+ALLOW_EMPTY:${PN}-user-all = "1"
+
+PACKAGESPLITFUNCS =+ "split_qemu_packages"
+
+python split_qemu_packages () {
+    archdir = d.expand('${bindir}/')
+    syspackages = do_split_packages(d, archdir, r'^qemu-system-(.*)$', '${PN}-system-%s', 'QEMU full system emulation binaries(%s)' , prepend=True)
+    if syspackages:
+        d.setVar('RDEPENDS:' + d.getVar('PN') + '-system-all', ' '.join(syspackages))
+
+    userpackages = do_split_packages(d, archdir, r'^qemu-((?!system|edid|ga|img|io|nbd|pr-helper|storage-daemon).*)$', '${PN}-user-%s', 'QEMU full user emulation binaries(%s)' , prepend=True)
+    if userpackages:
+        d.setVar('RDEPENDS:' + d.getVar('PN') + '-user-all', ' '.join(userpackages))
+    mipspackage = d.getVar('PN') + "-user-mips"
+    if mipspackage in ' '.join(userpackages):
+        d.appendVar('RDEPENDS:' + mipspackage, ' ' + d.getVar("MLPREFIX") + 'bash')
+}
+
 # Put the guest agent in a separate package
 PACKAGES =+ "${PN}-guest-agent"
 SUMMARY:${PN}-guest-agent = "QEMU guest agent"
-- 
2.25.1


