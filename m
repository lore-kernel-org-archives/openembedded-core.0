Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AA0C36008
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 06:54:20 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.33318.1742799250968117680
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 23:54:11 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5178be11e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O5dDAT012498;
	Sun, 23 Mar 2025 23:54:09 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hvqk9euk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 23 Mar 2025 23:54:09 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 23 Mar 2025 23:54:08 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 23 Mar 2025 23:54:08 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH 1/2] create-spdx-2.2: fix collect dep recipes failed
Date: Mon, 24 Mar 2025 14:54:06 +0800
Message-ID: <20250324065407.1055382-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=XNkwSRhE c=1 sm=1 tr=0 ts=67e10191 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=udLj9sOB4u7sJd5HIYcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: kXYYdqHSk_tRAFeC1l5Hnvxr9P98nkGF
X-Proofpoint-ORIG-GUID: kXYYdqHSk_tRAFeC1l5Hnvxr9P98nkGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 spamscore=0 phishscore=0
 mlxlogscore=962 malwarescore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503240049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 06:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213509

$ echo 'INHERIT:remove = "create-spdx"' >> conf/local.conf
$ echo 'INHERIT += "create-spdx-2.2"' >> conf/local.conf
$ bitbake pigz-native -ccreate_spdx -f
...
 *** 0282:    for dep_pn, dep_hashfn, in_taskhash in deps:
     0283:        # If this dependency is not calculated in the taskhash skip it.
     0284:        # Otherwise, it can result in broken links since this task won't
     0285:        # rebuild and see the new SPDX ID if the dependency changes
     0286:        if not in_taskhash:
Exception: TypeError: cannot unpack non-iterable Dep object
...

Due to commit [classes/spdx-common: Move to library] applied, function
oe.spdx_common.get_spdx_deps returns a list of class Dep, other than
original a list of (pn, hashfn, in_taskhash)

[1] https://github.com/openembedded/openembedded-core/commit/3f9b7c7f6b15493b6890031190ca8d1a10f2f384

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 8f988de8681..de62379c503 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -279,21 +279,21 @@ def collect_dep_recipes(d, doc, spdx_recipe):
 
     deps = oe.spdx_common.get_spdx_deps(d)
 
-    for dep_pn, dep_hashfn, in_taskhash in deps:
+    for dep in deps:
         # If this dependency is not calculated in the taskhash skip it.
         # Otherwise, it can result in broken links since this task won't
         # rebuild and see the new SPDX ID if the dependency changes
-        if not in_taskhash:
+        if not dep.in_taskhash:
             continue
 
-        dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep_pn, dep_hashfn)
+        dep_recipe_path = oe.sbom.doc_find_by_hashfn(deploy_dir_spdx, package_archs, "recipe-" + dep.pn, dep.hashfn)
         if not dep_recipe_path:
-            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep_pn, dep_hashfn))
+            bb.fatal("Cannot find any SPDX file for recipe %s, %s" % (dep.pn, dep.hashfn))
 
         spdx_dep_doc, spdx_dep_sha1 = oe.sbom.read_doc(dep_recipe_path)
 
         for pkg in spdx_dep_doc.packages:
-            if pkg.name == dep_pn:
+            if pkg.name == dep.pn:
                 spdx_dep_recipe = pkg
                 break
         else:
-- 
2.34.1


