Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01D36E77188
	for <webhook@archiver.kernel.org>; Wed, 25 Dec 2024 02:48:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.1816.1735094912462812420
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Dec 2024 18:48:32 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2089cb89f3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP1tUVc012892;
	Wed, 25 Dec 2024 02:48:29 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43nmn8bhpn-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 25 Dec 2024 02:48:28 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 24 Dec 2024 18:48:27 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 24 Dec 2024 18:48:27 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
        <mathieu.dubois-briand@bootlin.com>
Subject: [PATCH v4 2/2] meta/lib/oe/sbom30.py: fix alias in simplelicensing_customIdToUri not extracted
Date: Tue, 24 Dec 2024 18:48:26 -0800
Message-ID: <20241225024826.960533-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241225024826.960533-1-hongxu.jia@windriver.com>
References: <20241225024826.960533-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: OWKZZlDMhlpdhI9KXzlmtyPCjuW2Fap3
X-Proofpoint-ORIG-GUID: OWKZZlDMhlpdhI9KXzlmtyPCjuW2Fap3
X-Authority-Analysis: v=2.4 cv=CeHy5Krl c=1 sm=1 tr=0 ts=676b727c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=rorgr0BEAAAA:8 a=24AZYWMyAAAA:8 a=pGLkceISAAAA:8 a=t7CeM3EgAAAA:8 a=lOsQPi6cu_YlJ6I-9IEA:9
 a=FuUPMLReglAHmohU_o2S:22 a=bG88sKzkDEFeXWNnvthB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_09,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=894 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412250022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 Dec 2024 02:48:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209070

After commit [spdx 3.0: Rework how SPDX aliases are linked] applied, it set
license_text_map with SPDX alias other than actual ID

The property of simplelicensing_customIdToUri is ListProp(ObjectProp(DictionaryEntry))),
and class DictionaryEntry has key and value, the property of value is StringProp other
than ObjectProp in which could not support to decode/extract SPDX alias with actual ID
in image jsonld file
-----------
      "simplelicensing_customIdToUri": [
        {
          "type": "DictionaryEntry",
          "key": "LicenseRef-PD",
          "value": "http://spdxdocs.org/openembedded-alias/by-doc-hash/d53e90e23b12c4ad640809a74a810e86f31c76cdbdf36487712d22a33d53362a/sqlite3-native/UNIHASH/license-text/PD"
        }
      ],
-----------

Add special code in the linking to manually go through all of the
simplelicensing_customIdToUri DictionaryEntry items and resolve
any aliases to actual objects
-----------
      "simplelicensing_customIdToUri": [
        {
          "type": "DictionaryEntry",
          "key": "LicenseRef-PD",
          "value": "http://spdx.org/spdxdocs/sqlite3-native-e5cc0672-d8dd-57e8-a2df-fe4615831fda/162c62b5b011cd3f82f413b3dae4d6d1542201552c964d5ce69fe170e0720b85/license-text/PD"
        }
      ]
-----------

Suggested-by: Joshua Watt <jpewhacker@gmail.com>

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/sbom30.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/lib/oe/sbom30.py b/meta/lib/oe/sbom30.py
index 08fea2aca3..0004447066 100644
--- a/meta/lib/oe/sbom30.py
+++ b/meta/lib/oe/sbom30.py
@@ -855,6 +855,18 @@ class ObjectSet(oe.spdx30.SHACLObjectSet):
         self.doc.import_ = sorted(imports.values(), key=lambda e: e.externalSpdxId)
         bb.debug(1, "Linking...")
         self.link()
+
+        # Manually go through all of the simplelicensing_customIdToUri DictionaryEntry
+        # items and resolve any aliases to actual objects.
+        for lic in self.foreach_type(oe.spdx30.simplelicensing_LicenseExpression):
+            for d in lic.simplelicensing_customIdToUri:
+                if d.value.startswith(OE_ALIAS_PREFIX):
+                    obj = self.find_by_id(d.value)
+                    if obj is not None:
+                        d.value = obj._id
+                    else:
+                        self.missing_ids.add(d.value)
+
         self.missing_ids -= set(imports.keys())
         return self.missing_ids
 
-- 
2.25.1


