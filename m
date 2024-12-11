Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0C3EE7717D
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 12:07:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9287.1733918852226389595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 04:07:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207545b38d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBB531a001323;
	Wed, 11 Dec 2024 12:07:31 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3m48g-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Dec 2024 12:07:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Dec 2024 04:07:29 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Dec 2024 04:07:29 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH 3/3] gcc-cross.inc: add var-SSTATE_ARCHS_TUNEPKG to vardeps of do_create_spdx
Date: Wed, 11 Dec 2024 04:07:28 -0800
Message-ID: <20241211120728.3737604-3-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211120728.3737604-1-hongxu.jia@windriver.com>
References: <20241211120728.3737604-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: F3H-ijKh2cnEMmY1gu8-tXE4p1ooOlZB
X-Proofpoint-ORIG-GUID: F3H-ijKh2cnEMmY1gu8-tXE4p1ooOlZB
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=67598082 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=rorgr0BEAAAA:8 a=t7CeM3EgAAAA:8 a=vgRLZewN3jo-IRc2FAwA:9 a=FuUPMLReglAHmohU_o2S:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-11_10,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412110088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Dec 2024 12:07:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208578

The recipe gcc-cross inherited cross.bbclass which had class-native
recipe behavior, but depends on class-target recipe linux-libc-headers.
It caused the tweaking of ${TUNE_PKGARCH} for 32bit arm did not trigger
rebuild of do_create_spdx in gcc-cross-arm

Due to commit [meta/lib/oe/spdx30_tasks.py: fix hash link conflict while
multiconfig enabled] applied, it added ${SSTATE_PKGARCH} to link prefix.
While tweaking ${TUNE_PKGARCH} for 32bit arm, use do_create_spdx from
sstate cache will caused ${SSTATE_PKGARCH} did not match

In the following case, the link hash has no change while machine was changed
$ echo 'MACHINE = "qemuarmv5"' >> conf/local.conf
$ bitbake gcc-cross-arm
$ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc-cross-arm.spdx.json
        "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6fe1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIHASH/build/recipe",
$ echo 'MACHINE = "qemuarm"' >> conf/local.conf
$ bitbake gcc-cross-arm
$ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc-cross-arm.spdx.json
        "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6fe1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIHASH/build/recipe",

Explicitly add var-SSTATE_ARCHS_TUNEPKG to vardeps of do_create_spdx to
trigger rebuild in this situation. Add the code along with adding
linux-libc-headers to gcc-cross's depends

After applying this commit, the link hash has changed along with machine changed

$ echo 'MACHINE = "qemuarmv5"' >> conf/local.conf
$ bitbake gcc-cross-arm
$ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc-cross-arm.spdx.json
        "http://spdxdocs.org/openembedded-alias/by-doc-hash/09523e44e7b6fe1aed03347e30191c00d93500ce6e1f453e8dfdfae98d325f3e/linux-libc-headers/UNIHASH/build/recipe",
$ echo 'MACHINE = "qemuarm"' >> conf/local.conf
$ bitbake gcc-cross-arm
$ grep linux-libc-headers tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-gcc-cross-arm.spdx.json
        "http://spdxdocs.org/openembedded-alias/by-doc-hash/087e29d3627a06f5377effa627b99907607f5af0fe8f6d116b4490650c404a55/linux-libc-headers/UNIHASH/build/recipe",

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-cross.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/gcc/gcc-cross.inc b/meta/recipes-devtools/gcc/gcc-cross.inc
index f85ccd5c23..d6936d063a 100644
--- a/meta/recipes-devtools/gcc/gcc-cross.inc
+++ b/meta/recipes-devtools/gcc/gcc-cross.inc
@@ -7,6 +7,7 @@ PROVIDES = "virtual/${TARGET_PREFIX}gcc virtual/${TARGET_PREFIX}g++"
 python () {
     if d.getVar("TARGET_OS").startswith("linux"):
         d.setVar("EXTRADEPENDS", "linux-libc-headers")
+        d.appendVarFlag("do_create_spdx", "vardeps", " SSTATE_ARCHS_TUNEPKG")
 }
 
 PN = "gcc-cross-${TARGET_ARCH}"
-- 
2.25.1


