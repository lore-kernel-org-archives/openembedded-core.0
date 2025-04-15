Return-Path: <Haitao.Mi@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 943FBC369B4
	for <webhook@archiver.kernel.org>; Tue, 15 Apr 2025 09:03:12 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.15562.1744707787350171580
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Apr 2025 02:03:07 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=6200d9899d=haitao.mi@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F80Lsg009956
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:03:07 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45ykf3jws9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 02:03:06 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 15 Apr 2025 02:03:06 -0700
Received: from pek-lpd-ccm6.wrs.com (147.11.1.11) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 15 Apr 2025 02:03:05 -0700
From: <haitao.mi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] spdx30: Provide software_packageUrl field in SPDX 3.0 SBOM.
Date: Tue, 15 Apr 2025 17:03:04 +0800
Message-ID: <20250415090304.139447-1-haitao.mi@windriver.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: ktf9eyTi2BtGBvJI0nP3Q-wGbHo0LYGA
X-Authority-Analysis: v=2.4 cv=Wd0Ma1hX c=1 sm=1 tr=0 ts=67fe20ca cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=XR8D0OoHHMoA:10 a=t7CeM3EgAAAA:8 a=8PLvU82cITkvvn23-DMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: ktf9eyTi2BtGBvJI0nP3Q-wGbHo0LYGA
X-Sensitive_Customer_Information: Yes
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1011
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=686 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2504150062
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Apr 2025 09:03:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214832

From: Haitao Mi <haitao.mi@windriver.com>

A purl is composed with these fields:
scheme:type/namespace/name@version?qualifiers#subpath

Set 'namespace' field through SPDX_PURL_NAMESPACE variable, the default
value is ${DISTRO}.

Insert private project info into 'qualifiers' field through
PACKAGE_URL_QUALIFIERS_EXTEND variable, join the key=value format
with '&' symbol.

Set 'subpath' field through SPDX_PURL_SUBPATH variable, default is empty.

Signed-off-by: Haitao Mi <haitao.mi@windriver.com>
---
 meta/classes/create-spdx-3.0.bbclass |  8 ++++++++
 meta/lib/oe/spdx30_tasks.py          | 25 +++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spdx-3.0.bbclass
index 044517d9f7..c2499dde59 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -117,6 +117,14 @@ SPDX_PACKAGE_VERSION ??= "${PV}"
 SPDX_PACKAGE_VERSION[doc] = "The version of a package, software_packageVersion \
     in software_Package"
 
+SPDX_PURL_NAMESPACE ??= "${DISTRO}"
+SPDX_PURL_NAMESPACE[doc] = "The value of the namespace field in software_packageUrl"
+
+SPDX_PURL_QUALIFIERS_EXTEND[doc] = "The project private info in the qualifiers field \
+    of software_packageUrl"
+
+SPDX_PURL_SUBPATH[doc] = "The value of the subpath field in software_packageUrl"
+
 IMAGE_CLASSES:append = " create-spdx-image-3.0"
 SDK_CLASSES += "create-spdx-sdk-3.0"
 
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index ba965821f8..78593e917e 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -631,6 +631,31 @@ def create_spdx(d):
             set_var_field("SUMMARY", spdx_package, "summary", package=package)
             set_var_field("DESCRIPTION", spdx_package, "description", package=package)
 
+            purl_qualifiers = "distro=%s-%s&arch=%s" % (d.getVar("DISTRO"), \
+                                                        d.getVar("DISTRO_VERSION"), \
+                                                        d.getVar("MACHINE"), \
+                                                        )
+            purl_qualifiers_extend = d.getVar("SPDX_PURL_QUALIFIERS_EXTEND")
+            if purl_qualifiers_extend:
+                purl_qualifiers += "&%s" % purl_qualifiers_extend
+
+            purl_type = d.getVar("IMAGE_PKGTYPE")
+            if purl_type == "ipk":
+                purl_type = "generic"
+                purl_qualifiers = "file_extension=ipk&" + purl_qualifiers
+
+            purl_subpath = d.getVar("SPDX_PURL_SUBPATH")
+            purl_subpath = "#" + purl_subpath if purl_subpath else ""
+
+            purl = "pkg:%s/%s/%s@%s?%s%s" % (purl_type, \
+                                             d.getVar("SPDX_PURL_NAMESPACE"), \
+                                             pkg_name, \
+                                             d.getVar("EXTENDPKGV"), \
+                                             purl_qualifiers, \
+                                             purl_subpath \
+                                             )
+            setattr(spdx_package, "software_packageUrl", purl)
+
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
                 oe.spdx30.RelationshipType.hasOutput,

