Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81D5C3600C
	for <webhook@archiver.kernel.org>; Mon, 24 Mar 2025 06:54:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.33068.1742799252641914727
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 Mar 2025 23:54:12 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5178be11e1=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O5jeaw006903;
	Mon, 24 Mar 2025 06:54:11 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45hje1htht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 24 Mar 2025 06:54:11 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 23 Mar 2025 23:54:10 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 23 Mar 2025 23:54:09 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
Subject: [PATCH 2/2] spdx3: support to override the version of a package in SBOM 3
Date: Mon, 24 Mar 2025 14:54:07 +0800
Message-ID: <20250324065407.1055382-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250324065407.1055382-1-hongxu.jia@windriver.com>
References: <20250324065407.1055382-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=KPVaDEFo c=1 sm=1 tr=0 ts=67e10193 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=t7CeM3EgAAAA:8 a=VM7gEWWUIECbFAOj3ycA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 5W6ZrGfQ45BFQ0NiUC8ozZCOFkGliMGc
X-Proofpoint-ORIG-GUID: 5W6ZrGfQ45BFQ0NiUC8ozZCOFkGliMGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 adultscore=0 impostorscore=0 mlxlogscore=887 malwarescore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503240049
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Mar 2025 06:54:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213510

By default, still use ${PV} as the the version of a package in SBOM 3
$ bitbake acl
$ jq . tmp/deploy/spdx/3.0.1/core2-64/packages/package-acl.spdx.json
...
    {
      "type": "software_Package",
       ...
      "name": "acl",
      "software_packageVersion": "2.3.2"
    },
...

Support to override it by setting SPDX_PACKAGE_VERSION, such as
set SPDX_PACKAGE_VERSION = "${EXTENDPKGV}" in local.conf to append
PR to software_packageVersion in SBOM 3
$ echo 'SPDX_PACKAGE_VERSION = "${EXTENDPKGV}"' >> conf/local.conf
$ bitbake acl
$ jq . tmp/deploy/spdx/3.0.1/core2-64/packages/package-acl.spdx.json
...
    {
      "type": "software_Package",
       ...
      "name": "acl",
      "software_packageVersion": "2.3.2-r0"
    },
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-3.0.bbclass | 3 +++
 meta/lib/oe/spdx30_tasks.py          | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index b4a5156e709..044517d9f72 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -113,6 +113,9 @@ SPDX_ON_BEHALF_OF[doc] = "The base variable name to describe the Agent on who's
 SPDX_PACKAGE_SUPPLIER[doc] = "The base variable name to describe the Agent who \
     is supplying artifacts produced by the build"
 
+SPDX_PACKAGE_VERSION ??= "${PV}"
+SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
+    in software_Package"
 
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 1629ed69cee..52329760b6a 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -606,7 +606,7 @@ def create_spdx(d):
                     _id=pkg_objset.new_spdxid("package", pkg_name),
                     creationInfo=pkg_objset.doc.creationInfo,
                     name=pkg_name,
-                    software_packageVersion=d.getVar("PV"),
+                    software_packageVersion=d.getVar("SPDX_PACKAGE_VERSION"),
                 )
             )
             set_timestamp_now(d, spdx_package, "builtTime")
-- 
2.34.1


