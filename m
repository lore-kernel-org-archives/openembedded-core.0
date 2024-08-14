Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B2AC52D7C
	for <webhook@archiver.kernel.org>; Wed, 14 Aug 2024 02:44:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.89217.1723603442105858871
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 19:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8956c0cd7f=mingli.yu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E00KiI025070
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 02:44:01 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40wy653pg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 02:44:00 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 13 Aug 2024 19:43:59 -0700
Received: from pek-lpg-core4.wrs.com (128.224.153.44) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.39 via Frontend Transport; Tue, 13 Aug 2024 19:43:58 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] llvm: Enable libllvm for native build
Date: Wed, 14 Aug 2024 10:43:58 +0800
Message-ID: <20240814024358.1201327-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: tW3BaCE2G9n1n4fQCuZf1J6UqklFBn1r
X-Proofpoint-GUID: tW3BaCE2G9n1n4fQCuZf1J6UqklFBn1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_02,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=770 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2408140019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Aug 2024 02:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203299

From: Mingli Yu <mingli.yu@windriver.com>

The bpftrace recipe under meta-clang[1] needs llvm-objcopy [2] during
do_confgure phase otherwise there comes below error:
  | CMake Error at tests/data/CMakeLists.txt:6 (find_program):
  |   Could not find LLVM_OBJCOPY using the following names: llvm-objcopy,
  |   llvm-objcopy-18, llvm18-objcopy

The commit ec22bfa67f llvm: allow building libllvm in native builds, subject to PACKAGECONFIG [3]
introduces libllvm to manage the llvm function for native build
maybe because there is only mesa-native to use llvm-native.

Considering there are other recipes such as bpftrace needs llvm-native,
so enable libllvm for native build.

[1] https://github.com/kraj/meta-clang
[2] https://github.com/bpftrace/bpftrace/blob/master/tests/data/CMakeLists.txt
[3] https://git.openembedded.org/openembedded-core/commit/?id=ec22bfa67f6f1766102501d4593ce29aafe8c166

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/llvm/llvm_18.1.6.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/llvm/llvm_18.1.6.bb b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
index b2df5b60e3..0496b8ed14 100644
--- a/meta/recipes-devtools/llvm/llvm_18.1.6.bb
+++ b/meta/recipes-devtools/llvm/llvm_18.1.6.bb
@@ -55,7 +55,6 @@ def get_llvm_host_arch(bb, d):
     return get_llvm_arch(bb, d, 'HOST_ARCH')
 
 PACKAGECONFIG ??= "libllvm"
-PACKAGECONFIG:class-native = "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'libllvm', '', d)}"
 # if optviewer OFF, force the modules to be not found or the ones on the host would be found
 PACKAGECONFIG[optviewer] = ",-DPY_PYGMENTS_FOUND=OFF -DPY_PYGMENTS_LEXERS_C_CPP_FOUND=OFF -DPY_YAML_FOUND=OFF,python3-pygments python3-pyyaml,python3-pygments python3-pyyaml"
 PACKAGECONFIG[libllvm] = ""
-- 
2.34.1


