Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F2FE77188
	for <webhook@archiver.kernel.org>; Thu, 26 Dec 2024 05:43:29 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17824.1735191804349110799
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Dec 2024 21:43:24 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2090a34e30=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BQ59W8i030489;
	Wed, 25 Dec 2024 21:43:22 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nsub401s-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Dec 2024 21:43:22 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 25 Dec 2024 21:43:21 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 25 Dec 2024 21:43:21 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH 2/2] meta/lib/oe/sbom30.py: set alias for scan declared licenses
Date: Wed, 25 Dec 2024 21:43:21 -0800
Message-ID: <20241226054321.143382-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241226054321.143382-1-hongxu.jia@windriver.com>
References: <20241226054321.143382-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Ns8rc9dJ c=1 sm=1 tr=0 ts=676cecfa cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=RZcAm9yDv7YA:10 a=24AZYWMyAAAA:8 a=rorgr0BEAAAA:8 a=t7CeM3EgAAAA:8 a=rj2sf60npdQgStt7PM0A:9 a=bG88sKzkDEFeXWNnvthB:22
 a=FuUPMLReglAHmohU_o2S:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: toog1dizk4eV8SJYjwznl7gyHy6FIi3b
X-Proofpoint-ORIG-GUID: toog1dizk4eV8SJYjwznl7gyHy6FIi3b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-26_02,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412260048
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Dec 2024 05:43:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209084

when using SPDX_INCLUDE_SOURCES, it calls scan_declared_licenses
to scan licenses from source file, set alias for the newly added
license and and license alias to hasDeclaredLicense relationship

$ echo 'MACHINE = "qemux86-64"' >> conf/local.conf
$ echo 'SPDX_INCLUDE_SOURCES = "1"' >> conf/local.conf
$ bitbake shadow
$ vim tmp/deploy/spdx/3.0.1/corei7-64/recipes/recipe-shadow.spdx.json
Before this commit
...
    {
      "type": "Relationship",
      ...
      "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf/sourcefile/11048",
      "relationshipType": "hasDeclaredLicense",
      "to": [
        "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf/license/3_24_0/BSD-3-Clause",
      ]
    },
...

After this commit
...
    {
      "type": "Relationship",
      ...
      "from": "http://spdx.org/spdxdocs/shadow-10e66933-65cf-5a2d-9a1d-99b12a405441/d0cdb0d02e54d55e52fccf8631f8290b161ad43fe31fffe09e8e25041d2280cf/sourcefile/11048",
      "relationshipType": "hasDeclaredLicense",
      "to": [
        "http://spdxdocs.org/openembedded-alias/by-doc-hash/cc72db638e3f8e283e722af0ecc77d19f93cc6736700ee76477e3773b6b07b05/shadow/UNIHASH/license/3_24_0/BSD-3-Clause"
      ]
    },
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 0004447066..7993e1fbef 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -589,12 +589,14 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
 
         file_licenses = set()
         for extracted_lic in oe.spdx_common.extract_licenses(filepath):
-            file_licenses.add(self.new_license_expression(extracted_lic, license_data))
+            lic = self.new_license_expression(extracted_lic, license_data)
+            self.set_element_alias(lic)
+            file_licenses.add(lic)
 
         self.new_relationship(
             [spdx_file],
             oe.spdx30.RelationshipType.hasDeclaredLicense,
-            file_licenses,
+            [oe.sbom30.get_element_link_id(lic_alias) for lic_alias in file_licenses],
         )
         spdx_file.extension.append(OELicenseScannedExtension())
 
-- 
2.34.1


