Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 391D5E7717F
	for <webhook@archiver.kernel.org>; Thu, 12 Dec 2024 11:09:40 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.17463.1734001775497787525
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Dec 2024 03:09:35 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2076b4a328=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCALc7D018304;
	Thu, 12 Dec 2024 03:09:34 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43cwy1wfs7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 12 Dec 2024 03:09:33 -0800 (PST)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 12 Dec 2024 03:09:32 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 12 Dec 2024 03:09:32 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH] meta/lib/oe/spdx30_tasks.py: fix alias in simplelicensing_customIdToUri not extracted
Date: Thu, 12 Dec 2024 03:09:32 -0800
Message-ID: <20241212110932.2063844-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: M6oOOlcLdzx6SwdAqQTcG5Y2mbGmLTy2
X-Authority-Analysis: v=2.4 cv=eePHf6EH c=1 sm=1 tr=0 ts=675ac46d cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=rorgr0BEAAAA:8 a=24AZYWMyAAAA:8 a=t7CeM3EgAAAA:8 a=lOsQPi6cu_YlJ6I-9IEA:9 a=FuUPMLReglAHmohU_o2S:22
 a=bG88sKzkDEFeXWNnvthB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: M6oOOlcLdzx6SwdAqQTcG5Y2mbGmLTy2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-12_05,2024-12-12_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 spamscore=0 phishscore=0 malwarescore=0 mlxscore=0 adultscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412120079
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Dec 2024 11:09:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208630

After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it set
license_text_map with alias other than actual spdxId

The property of simplelicensing_customIdToUri is ListProp(ObjectProp(DictionaryEntry))),
and class DictionaryEntry has key and value, the property of value is StringProp other
than ObjectProp in which could not support to decode/extract alias with actual spdxId in
image jsonld file

$ bitbake core-image-minimal
$ vim tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.rootfs.spdx.json
...
      "simplelicensing_customIdToUri": [
        {
          "type": "DictionaryEntry",
          "key": "LicenseRef-PD",
          "value": "http://spdxdocs.org/openembedded-alias/by-doc-hash/d53e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-native/UNIHASH/license-text/PD"
        }
      ],
...

After applying this commit, revert [spdx 3.0: Rework how SPDX aliases are linked]
to set actual spdxId other than alias to dictionary license_text_map
...
      "simplelicensing_customIdToUri": [
        {
          "type": "DictionaryEntry",
          "key": "LicenseRef-PD",
          "value": "http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69fe170e0720b85/license-text/PD"
        }
      ]
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 036c58bf4b..82fcfe7a63 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -107,9 +107,7 @@ def add_license_expression(d, objset, license_expression, license_data):
 
         spdx_license = "LicenseRef-" + l
         if spdx_license not in license_text_map:
-            license_text_map[spdx_license] = oe.sbom30.get_element_link_id(
-                add_license_text(l)
-            )
+            license_text_map[spdx_license] = add_license_text(l)._id
 
         return spdx_license
 
-- 
2.25.1


