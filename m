Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B98C7EE30
	for <webhook@archiver.kernel.org>; Wed, 25 Jun 2025 09:20:49 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.11465.1750843244435966044
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Jun 2025 02:20:44 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8271113bc3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P5U9KW008046
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 02:20:44 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47dr14v22v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 02:20:43 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Wed, 25 Jun 2025 02:20:41 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 25 Jun 2025 02:20:40 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH V2] create-spdx-2.2.bbclass: support to override the version of a package in SBOM 2
Date: Wed, 25 Jun 2025 17:20:39 +0800
Message-ID: <20250625092039.3519104-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <meta/classes/create-spdx-2.2.bbclass>
References: <meta/classes/create-spdx-2.2.bbclass>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: c9_G7zCFWxfg8JkiFj45yNBW-20OAWu6
X-Proofpoint-GUID: c9_G7zCFWxfg8JkiFj45yNBW-20OAWu6
X-Authority-Analysis: v=2.4 cv=XYKJzJ55 c=1 sm=1 tr=0 ts=685bbf6b cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=6IFa9wvqVegA:10 a=t7CeM3EgAAAA:8 a=ipKI2KyfRDNlsl7aNJ0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA2OSBTYWx0ZWRfX0Qqzt15C3Cnp fKJLx8URKU1i75xvimjnrrubPB02SNLZ2sKdPOw7w3QzA8IfeJT6KzXkaGY17921TDgKyBKgOka Vjn6nVUq2HPJqAwNUTzKMEJWCxGDBCdE1YMiKnGgedJb/ae+VCaN0XkK0QcZ9pcFDrPnNjyEX7x
 PcqJ8s2kEwYHpNO7h1sE6EKsbt3cHvxy2hGWjH7yZ/50miSlmfnQatDWKIag7We/mXfPZ4L0uPs wsawi09HuFhG7G2UxL22s60mHWdNIEvQt6fEbLhs7+7XuEZnH/rwVcdELu75ifANb/sAqO8kXJT bMdeJaP6zrssrVq8IcLEEU3sbUvxyMHIq4z6VbjNJMaquEGPGiXedbt6K45C/gu6+Oz64h7G6vH
 L838XStOWOACkp8aji8ZbsNpIQMYjJkPUMD2whSs+uIGpPvqzyQdS351lwUlM+O/8Tf8O+cC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 mlxscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506250069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Jun 2025 09:20:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219308

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
 meta/classes/create-spdx-2.2.bbclass | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/classes/create-spdx-2.2.bbclass b/meta/classes/create-spdx-2.2.bbclass
index 6fc60a1d979..94e01088150 100644
--- a/meta/classes/create-spdx-2.2.bbclass
+++ b/meta/classes/create-spdx-2.2.bbclass
@@ -23,6 +23,8 @@ def get_namespace(d, name):
     namespace_uuid = uuid.uuid5(uuid.NAMESPACE_DNS, d.getVar("SPDX_UUID_NAMESPACE"))
     return "%s/%s-%s" % (d.getVar("SPDX_NAMESPACE_PREFIX"), name, str(uuid.uuid5(namespace_uuid, name)))
 
+SPDX_PACKAGE_VERSION ??= "${PV}"
+SPDX_PACKAGE_VERSION[doc] = "The version of a package, versionInfo in recipe, package and image"
 
 def create_annotation(d, comment):
     from datetime import datetime, timezone
@@ -447,7 +449,7 @@ python do_create_spdx() {
 
     recipe = oe.spdx.SPDXPackage()
     recipe.name = d.getVar("PN")
-    recipe.versionInfo = d.getVar("PV")
+    recipe.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
     recipe.SPDXID = oe.sbom.get_recipe_spdxid(d)
     recipe.supplier = d.getVar("SPDX_SUPPLIER")
     if bb.data.inherits_class("native", d) or bb.data.inherits_class("cross", d):
@@ -556,7 +558,7 @@ python do_create_spdx() {
 
             spdx_package.SPDXID = oe.sbom.get_package_spdxid(pkg_name)
             spdx_package.name = pkg_name
-            spdx_package.versionInfo = d.getVar("PV")
+            spdx_package.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
             spdx_package.licenseDeclared = convert_license_to_spdx(package_license, license_data, package_doc, d, found_licenses)
             spdx_package.supplier = d.getVar("SPDX_SUPPLIER")
 
@@ -832,7 +834,7 @@ def combine_spdx(d, rootfs_name, rootfs_deploydir, rootfs_spdxid, packages, spdx
 
     image = oe.spdx.SPDXPackage()
     image.name = d.getVar("PN")
-    image.versionInfo = d.getVar("PV")
+    image.versionInfo = d.getVar("SPDX_PACKAGE_VERSION")
     image.SPDXID = rootfs_spdxid
     image.supplier = d.getVar("SPDX_SUPPLIER")
 
-- 
2.34.1


