Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 868B8E77188
	for <webhook@archiver.kernel.org>; Mon, 30 Dec 2024 07:40:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.58819.1735544448307745266
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Dec 2024 23:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=30946ffcbd=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU7TP4q015343;
	Sun, 29 Dec 2024 23:40:46 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43tdg79a3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 29 Dec 2024 23:40:46 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Sun, 29 Dec 2024 23:40:45 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Sun, 29 Dec 2024 23:40:45 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <jpewhacker@gmail.com>
Subject: [PATCH] meta/lib/oe/spdx30_tasks.py: add patched CVE to SPDX 3
Date: Sun, 29 Dec 2024 23:40:45 -0800
Message-ID: <20241230074045.213743-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: WA7Zih0ObTDH2Rv4df9KwnnvCwR1sjBB
X-Authority-Analysis: v=2.4 cv=AokU3P9P c=1 sm=1 tr=0 ts=67724e7e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=RZcAm9yDv7YA:10 a=24AZYWMyAAAA:8 a=Q4-j1AaZAAAA:8 a=rorgr0BEAAAA:8 a=wECf3xPYAAAA:8 a=t7CeM3EgAAAA:8
 a=Qdx_cvmabgLv2DRu0yAA:9 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FuUPMLReglAHmohU_o2S:22 a=ccNonjl4-tybilS9-zgM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: WA7Zih0ObTDH2Rv4df9KwnnvCwR1sjBB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-30_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2412300064
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Dec 2024 07:40:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209148

Some CVEs may be patched during the build process without incrementing
the version number, save the CVEs fixed by patches to cve_by_status
which was parsed as "Patched" status to add new_vex_patched_relationship
to pkg_objset

Take recipe unzip for example, CVE-2015-1315 is patched in oe-core and
is available in package SPDX

oe-core$ grep "CVE-2015-1315" -rn meta
meta/recipes-extended/unzip/unzip_6.0.bb:12:    file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch:6:CVE: CVE-2015-1315

$ bitbake unzip
$ vim tmp/deploy/spdx/3.0.1/corei7-64/packages/package-unzip.spdx.json [1]
...
    {
      "type": "security_VexFixedVulnAssessmentRelationship",
      "spdxId": "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bdaaa/6e57f2cbf8f80a80ee21628b8a35cdddaa8ee800cc9e42367d866eb8daa41bb0/vex-fixed/c8d7748f0d64a2a46a3a2545c891ad39"
      "creationInfo": "_:CreationInfo1",
      "extension": [
        {
          "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
          "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs.org/openembedded-alias/by-doc-hash/22ab8d6eced4525f57bb861acc0fe983d8af5805dd97e702c22c1ffe04621cb2/unzip/UNIHASH/vex-fixed/c8d7748f0d64a2a46a3a2545c891ad39"
        }
      ],
      "from": "http://spdxdocs.org/openembedded-alias/by-doc-hash/539e1deec075c3a51b8c6975352b0a9ad320a130a4d7d516316b35994a830f93/unzip/UNIHASH/vulnerability/CVE-2015-1315",
      "relationshipType": "fixedIn",
      "to": [
        "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bdaaa/6e57f2cbf8f80a80ee21628b8a35cdddaa8ee800cc9e42367d866eb8daa41bb0/package/unzip"
      ],
      "security_vexVersion": "1.0.0"
    },
...

[1] https://spdx.github.io/spdx-spec/v3.0.1/model/Security/Classes/VexFixedVulnAssessmentRelationship/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 036c58bf4b..842962f609 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -515,6 +515,21 @@ def create_spdx(d):
 
     cpe_ids = oe.cve_check.get_cpe_ids(d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION"))
 
+    # Some CVEs may be patched during the build process without incrementing the version number,
+    # so querying for CVEs based on the CPE id can lead to false positives. To account for this,
+    # save the CVEs fixed by patches to cve_by_status.
+    patched_cves = oe.cve_check.get_patched_cves(d)
+    for cve, patched_cve in patched_cves.items():
+        if patched_cve["abbrev-status"] != "Patched":
+            continue
+        spdx_cve = build_objset.new_cve_vuln(cve)
+        build_objset.set_element_alias(spdx_cve)
+        cve_by_status.setdefault("Patched", {})[cve] = (
+            spdx_cve,
+            None,
+            None,
+        )
+
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
-- 
2.25.1


