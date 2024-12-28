Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6025E7718F
	for <webhook@archiver.kernel.org>; Sat, 28 Dec 2024 09:31:36 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.26845.1735378296342129626
 for <openembedded-core@lists.openembedded.org>;
 Sat, 28 Dec 2024 01:31:36 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=209293c779=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BS9HPel005031
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 01:31:36 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg781bf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 01:31:35 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sat, 28 Dec 2024 01:31:35 -0800
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sat, 28 Dec 2024 01:31:34 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2 3/3] packagegroup-core-tools-profile: skip VALGRIND for loongarch64
Date: Sat, 28 Dec 2024 17:31:31 +0800
Message-ID: <20241228093131.733021-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241228093131.733021-1-hongxu.jia@windriver.com>
References: <20241228093131.733021-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: b3S3OVfmBLqAIJgjC_eJIpfD0ejywhW-
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=676fc577 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=t7CeM3EgAAAA:8 a=CVYY37SPyIgRTD1xKwIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: b3S3OVfmBLqAIJgjC_eJIpfD0ejywhW-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-28_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412280078
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 28 Dec 2024 09:31:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209119

Due to packagegroup-core-tools-profile run time depend
on package valgrind and recipe valgrind does not support
loongarch64, then skip VALGRIND for loongarch64

$ echo "MACHINE = 'qemuloongarch64'" >> conf/local.conf
$ bitbake world
|ERROR: Nothing RPROVIDES 'valgrind' (but oe-core/meta/recipes-core/
packagegroups/packagegroup-core-tools-profile.bb RDEPENDS on or
otherwise requires it)
|valgrind was skipped: incompatible with host loongarch64-wrs-linux
(not in COMPATIBLE_HOST)
|NOTE: Runtime target 'valgrind' is unbuildable, removing...
|Missing or unbuildable dependency chain was: ['valgrind']
|ERROR: Required build target 'meta-world-pkgdata' has no buildable providers.
|Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
'packagegroup-core-tools-profile', 'valgrind']

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../packagegroups/packagegroup-core-tools-profile.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
index f471cf977c..4e324caa96 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-profile.bb
@@ -55,6 +55,7 @@ VALGRIND:riscv32 = ""
 VALGRIND:powerpc = "${@bb.utils.contains('TARGET_FPU', 'soft', '', 'valgrind', d)}"
 VALGRIND:linux-gnux32 = ""
 VALGRIND:linux-gnun32 = ""
+VALGRIND:loongarch64 = ""
 
 RDEPENDS:${PN} = "\
     ${PROFILETOOLS} \
-- 
2.34.1


