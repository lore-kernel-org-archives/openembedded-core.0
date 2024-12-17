Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F31CE77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 03:47:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.74370.1734407248639203384
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Dec 2024 19:47:28 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2081b295a1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH3e2G8007200;
	Tue, 17 Dec 2024 03:47:27 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43gy80jqa6-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 17 Dec 2024 03:47:26 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Mon, 16 Dec 2024 19:47:25 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Mon, 16 Dec 2024 19:47:25 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH 2/4] meta/lib/oe/spdx30_tasks.py: fix hash link conflict while multiconfig enabled
Date: Mon, 16 Dec 2024 19:47:22 -0800
Message-ID: <20241217034724.2737515-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217034724.2737515-1-hongxu.jia@windriver.com>
References: <20241217034724.2737515-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=I4ufRMgg c=1 sm=1 tr=0 ts=6760f44e cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0ATjMBP11K5Z_QgbH6oA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: hCwDqx2mEvY_0e2xpGfFE8ciN9LaqHOg
X-Proofpoint-ORIG-GUID: hCwDqx2mEvY_0e2xpGfFE8ciN9LaqHOg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-16_10,2024-12-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412170029
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Dec 2024 03:47:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208798

While enabling multiconfig, build recipe (such as linux-libc-headers) in
different arch directories but generating duplicated hash link, and these
directories are listed in ${SPDX_MULTILIB_SSTATE_ARCHS}

In the following case, build recipe linux-libc-headers in multiconfig to
generate duplicated hash link in core2-32 and core2-64
$ echo 'MACHINE = qemux86-64' >> conf/local.conf
$ mkdir conf/multiconfig
$ echo 'MACHINE = "qemux86"' >> conf/multiconfig/qemux86.conf
$ echo 'BBMULTICONFIG = qemux86' >> conf/local.conf
$ bitbake linux-libc-headers mc:qemux86:linux-libc-headers
$ ls -al tmp/deploy/spdx/3.0.1/*/by-spdxid-hash/*/*.spdx.json |grep recipe-linux-libc-headers.spdx.json
tmp/deploy/spdx/3.0.1/core2-32/by-spdxid-hash/c5/c57f1b9dbf27d2c83c77ca49f971b31d6d6c5830434104c88a12c6e2eb687094.spdx.json -> ../../recipes/recipe-linux-libc-headers.spdx.json
tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-hash/c5/c57f1b9dbf27d2c83c77ca49f971b31d6d6c5830434104c88a12c6e2eb687094.spdx.json -> ../../recipes/recipe-linux-libc-headers.spdx.json

According to [1], and after [spdx 3.0: Rework how SPDX aliases are linked]
applied, SPDX 3.0 have a loop on ${SPDX_MULTILIB_SSTATE_ARCHS} to search for
the hash link to find jsonld file, return on first match

If hash link duplicated, the first match may not be right. Add ${SSTATE_PKGARCH}
to link prefix which could distinguish arch directories in spdxId prefix.

After applying this commit, the hash link of linux-libc-headers differs

ls -al tmp/deploy/spdx/3.0.1/*/by-spdxid-hash/*/*.spdx.json |grep recipe-linux-libc-headers.spdx.json
tmp/deploy/spdx/3.0.1/core2-32/by-spdxid-hash/4f/4f80c220686f345bce561f6d745165ee803e6390ba5e047f54cb28f4e23c167f.spdx.json -> ../../recipes/recipe-linux-libc-headers.spdx.json
tmp/deploy/spdx/3.0.1/core2-64/by-spdxid-hash/22/22db6f7b9cf02bbd3e64ffe2b9bceb17bf6f2f1366db1e72d8d82c337954b112.spdx.json -> ../../recipes/recipe-linux-libc-headers.spdx.json

[1] https://github.com/openembedded/openembedded-core/commit/f1499c36c1054fc90f7b7268cc95285f2eca72f7#diff-253805ec3eaba58c6c3967711921d5a2748974ba533c6d864d86a8e5ad4df4c4L923

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 08fea2aca3..65603e69b7 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -786,7 +786,7 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
             OEIdAliasExtension(
                 alias=objset.new_alias_id(
                     document,
-                    OE_DOC_ALIAS_PREFIX + d.getVar("PN") + "/" + name + "/",
+                    OE_DOC_ALIAS_PREFIX + d.getVar("SSTATE_PKGARCH") + "/" + d.getVar("PN") + "/" + name + "/",
                 ),
             )
         )
-- 
2.25.1


