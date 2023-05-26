Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919C9C77B73
	for <webhook@archiver.kernel.org>; Fri, 26 May 2023 14:27:54 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9375.1685111269879489932
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 May 2023 07:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4510ebf574=mingli.yu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34QAnuNR029628
	for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 14:27:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (unknown-82-252.windriver.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qpkn1pam4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 14:27:48 +0000
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 26 May 2023 07:27:47 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Fri, 26 May 2023 07:27:47 -0700
From: <mingli.yu@eng.windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] qemu: Restrict the built qemu targets
Date: Fri, 26 May 2023 22:27:46 +0800
Message-ID: <20230526142746.3220960-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: I4C9FAbGjWzQjHNaQhkjS_GsEXbfYtGo
X-Proofpoint-GUID: I4C9FAbGjWzQjHNaQhkjS_GsEXbfYtGo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-26_05,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=755 priorityscore=1501 adultscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 bulkscore=0 clxscore=1011 spamscore=0
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305260121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 May 2023 14:27:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181773

From: Mingli Yu <mingli.yu@windriver.com>

Now the QEMU_TARGETS used to set the supported built qemu targets
both for "bitbake qemu-native" and "bitbake qemu".

After the qemu package installed on the target, it will take up
464M which includes not only the one matches the arch of the target
but aslo all available built qemu targets which set by QEMU_TARGETS.

Making "bitbake qemu" to only build the arch matches the target should
satisfy our usual need and ease the concerns who cares much about the
size in embedded device as it decreases the qemu rpm size from about 65M
to about 17M and the size of the extracted qemu RPM decreased from
about 464M to about 248M.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 meta/recipes-devtools/qemu/qemu-targets.inc | 15 +++++++++++++--
 meta/recipes-devtools/qemu/qemu_8.0.0.bb    |  2 +-
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu-targets.inc b/meta/recipes-devtools/qemu/qemu-targets.inc
index 24f9a03948..bd0b47a4e7 100644
--- a/meta/recipes-devtools/qemu/qemu-targets.inc
+++ b/meta/recipes-devtools/qemu/qemu-targets.inc
@@ -3,9 +3,20 @@
 #    mips mipsel mips64 mips64el ppc ppc64 ppc64abi32 ppcemb
 #    riscv32 riscv64 sparc sparc32 sparc32plus
 
-def get_qemu_target_list(d):
+def get_qemu_target_list(d, target=False):
     import bb
-    archs = d.getVar('QEMU_TARGETS').split()
+    if target:
+        archs = []
+        allarchs = d.getVar('QEMU_TARGETS').split()
+        if d.getVar("TARGET_ARCH") in ["x86", "i486", "i586", "i686"]:
+            machine_arch = "i386"
+        else:
+            machine_arch = d.getVar("TARGET_ARCH")
+        for arch in allarchs:
+            if arch in machine_arch:
+                archs.append(arch)
+    else:
+        archs = d.getVar('QEMU_TARGETS').split()
     tos = d.getVar('HOST_OS')
     softmmuonly = ""
     for arch in ['ppcemb', 'lm32']:
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
index 42e133967e..6c25d99ade 100644
--- a/meta/recipes-devtools/qemu/qemu_8.0.0.bb
+++ b/meta/recipes-devtools/qemu/qemu_8.0.0.bb
@@ -10,7 +10,7 @@ CFLAGS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '', '-DEGL_NO_X11=1',
 
 RDEPENDS:${PN}:class-target += "bash"
 
-EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d)}"
+EXTRA_OECONF:append:class-target = " --target-list=${@get_qemu_target_list(d, target=True)}"
 EXTRA_OECONF:append:class-target:mipsarcho32 = "${@bb.utils.contains('BBEXTENDCURR', 'multilib', ' --disable-capstone', '', d)}"
 EXTRA_OECONF:append:class-nativesdk = " --target-list=${@get_qemu_target_list(d)}"
 
-- 
2.25.1


