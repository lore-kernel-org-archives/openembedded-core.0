Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3CD5E77180
	for <webhook@archiver.kernel.org>; Wed, 11 Dec 2024 12:07:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.9241.1733918851573790891
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Dec 2024 04:07:31 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=207545b38d=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BBB531Z001323;
	Wed, 11 Dec 2024 12:07:30 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy3m48g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 11 Dec 2024 12:07:30 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 11 Dec 2024 04:07:28 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 11 Dec 2024 04:07:28 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH 2/3] meta/lib/oe/spdx30_tasks.py: fix hash link conflict while multiconfig enabled
Date: Wed, 11 Dec 2024 04:07:27 -0800
Message-ID: <20241211120728.3737604-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211120728.3737604-1-hongxu.jia@windriver.com>
References: <20241211120728.3737604-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: AKaTjDfYw0koi2NpEfMR9GvFYkcIaLJx
X-Proofpoint-ORIG-GUID: AKaTjDfYw0koi2NpEfMR9GvFYkcIaLJx
X-Authority-Analysis: v=2.4 cv=D7O9KuRj c=1 sm=1 tr=0 ts=67598082 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=0ATjMBP11K5Z_QgbH6oA:9 a=FdTzh2GWekK77mhwV6Dw:22
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
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208577

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


