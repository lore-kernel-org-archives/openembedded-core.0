Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 009D0C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 09:10:19 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11319.1750842610748601135
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 02:10:10 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271113bc3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5dTM8016579
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 02:10:10 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dv8mkvqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 02:10:10 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 25 Jun 2025 02:10:07 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 25 Jun 2025 02:10:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] create-spdx-2.2.bbclass: support to override the version of a package in SBOM 2
Date: Wed, 25 Jun 2025 17:10:04 +0800
Message-ID: <20250625091004.3495889-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2NyBTYWx0ZWRfXxX912eGBuFxm KUciivFsCRDlmxSkBCqaKyOTon+Op1jbkYI0zT1GCm0xTaazW+2+bZRaUoNI40Z1Bzdike9LVJ5 6p63+JBumeJ81g0Wou5hL0u6kgqPSCsNKQpwfZj3P5mT1Atx9swxnZtIKjNv0C1xWXekjP5IEko
 /MNI9BXPSMiD8NSJ3VaPiDVaOOqtDNq+wZyGEpzNCKNgVwbz759EkrobFNwNonckwxbGR4kZE6D IOlnHpoYzgYVQ+dXdLZD92dSiQrBFSLyaltMeCQK/JAQhiOgIJ4sOeQlahT9khooEZQnBlPrL/w II551x5aETTCSIl2fLkXuba49NvxE7jIDaRA4khqX1iXq1nH4Ys5A5cH3g5YyPlcPUUZRR3s4cD
 ViwAG3rnAVrrun0/TmZJTtom5NpDlWYA+NBGOBa6k9TstfckWdR9qQV9WrGmI6s06r+CAgj1
X-Authority-Analysis: v=2.4 cv=MeNsu4/f c=1 sm=1 tr=0 ts=685bbcf2 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=ipKI2KyfRDNlsl7aNJ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: EeWB-XOnh9mS9b99UUQOc9mQMxWmTOX6
X-Proofpoint-ORIG-GUID: EeWB-XOnh9mS9b99UUQOc9mQMxWmTOX6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250067
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 09:10:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219307

By default, still use ${PV} as the the version of a package in SBOM 2

$ echo 'INHERIT:remove = "create-spdx"' >> conf/local.conf
$ echo 'INHERIT += "create-spdx-2.2"' >> conf/local.conf
$ bitbake acl
$ jq . tmp/deploy/spdx/2.2/core2-64/recipes/recipe-acl.spdx.json
...
      "name": "acl",
      "summary": "Utilities for managing POSIX Access Control Lists",
      "supplier": "Organization: OpenEmbedded ()",
      "versionInfo": "2.3.2"
    },
...

Support to override it by setting SPDX_PACKAGE_VERSION, such as
set SPDX_PACKAGE_VERSION = "${EXTENDPKGV}" in local.conf to append
PR to versionInfo in SBOM 2
$ echo 'SPDX_PACKAGE_VERSION = "${EXTENDPKGV}"' >> conf/local.conf
$ bitbake acl
$ jq . tmp/deploy/spdx/2.2/core2-64/recipes/recipe-acl.spdx.json
...
      "name": "acl",
      "summary": "Utilities for managing POSIX Access Control Lists",
      "supplier": "Organization: OpenEmbedded ()",
      "versionInfo": "2.3.2-r0"
    },
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/classes/create-spdx-2.2.bbclass | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 6fc60a1d979..2232528c1aa 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -23,6 +23,9 @@ def get_namespace(d, name):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), name, str(uuid.uuid5(namespace_uuid, name)))
 
+SPDX_PACKAGE_VERSION ??= "${PV}"
+SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
+    in software_Package"
 
 def create_annotation(d, comment):
     from datetime import datetime, timezone
@@ -447,7 +450,7 @@ python do_create_spdx() {
 
     recipe = oe.spdx.SPDXPackage()
     recipe.name = d.getVar("PN")
-    recipe.versionInfo = d.getVar("PV")
+    recipe.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
     recipe.supplier = d.getVar("SPDX_SUPPLIER")
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
@@ -556,7 +559,7 @@ python do_create_spdx() {
 
             spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name = pkg_name
-            spdx_package.versionInfo = d.getVar("PV")
+            spdx_package.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
             spdx_package.licenseDeclared = convert_license_to_spdx(package_license, license_data, package_doc, d, found_licenses)
             spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
 
@@ -832,7 +835,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     image = oe.spdx.SPDXPackage()
     image.name = d.getVar("PN")
-    image.versionInfo = d.getVar("PV")
+    image.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
     image.SPDXID = rootfs_spdxid
     image.supplier = d.getVar("SPDX_SUPPLIER")
 
-- 
2.34.1


