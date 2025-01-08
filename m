Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4ABC7E7719A
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:47:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.22371.1736351240516637282
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Jan 2025 07:47:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=310345b2cc=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5088Foe0011901;
	Wed, 8 Jan 2025 07:47:19 -0800
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 441fphrqjb-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Wed, 08 Jan 2025 07:47:19 -0800 (PST)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Wed, 8 Jan 2025 07:47:18 -0800
Received: from ala-lpggp7.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Wed, 8 Jan 2025 07:47:18 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <colinmca242@gmail.com>,
        <JPEWhacker@gmail.com>
Subject: [PATCH V2 2/3] meta/lib/oe/spdx30_tasks.py: add patched CVE to SPDX 3
Date: Wed, 8 Jan 2025 07:47:17 -0800
Message-ID: <20250108154718.3031653-2-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250108154718.3031653-1-hongxu.jia@windriver.com>
References: <20250108154718.3031653-1-hongxu.jia@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: Z4-e7Rn4e3uHm2MfBtqDzH2Fg8qdn4KM
X-Authority-Analysis: v=2.4 cv=Oa1iDgTY c=1 sm=1 tr=0 ts=677e9e07 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=VdSt8ZQiCzkA:10 a=24AZYWMyAAAA:8 a=Q4-j1AaZAAAA:8 a=rorgr0BEAAAA:8 a=wECf3xPYAAAA:8 a=t7CeM3EgAAAA:8
 a=Y2Y933mBZx8stCiJLtwA:9 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FuUPMLReglAHmohU_o2S:22 a=ccNonjl4-tybilS9-zgM:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Z4-e7Rn4e3uHm2MfBtqDzH2Fg8qdn4KM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-08_04,2025-01-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 mlxscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015
 mlxlogscore=999 suspectscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501080131
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Jan 2025 15:47:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209574

Due to commit [cve-check: annotate CVEs during analysis][1] improved
get_patched_cves to search for additional CVEs from CVE_STATUS which
means the funciton get_patched_cves contains both of patched CVE and
decoded_status

This commit add function get_cves to use get_patched_cves in one place
to add CVEs, and convert patched_cve to decoded_status:

  patched_cve["abbrev-status"] --> decoded_status["mapping"]
  patched_cve["status"] --> decoded_status["detail"]
  patched_cve["justification"] --> decoded_status["description"]

Take recipe unzip for example, CVE-2015-1315 is patched in oe-core and
is available in package SPDX

oe-core$ grep "CVE-2015-1315" -rn meta
meta/recipes-extended/unzip/unzip_6.0.bb:12:    file://06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch \
meta/recipes-extended/unzip/unzip/06-unzip60-alt-iconv-utf8_CVE-2015-1315.patch:6:CVE: CVE-2015-1315

$ bitbake unzip
$ vim tmp/deploy/spdx/3.0.1/core2-64/packages/package-unzip.spdx.json [1]
...
    {
      "type": "security_VexFixedVulnAssessmentRelationship",
      "spdxId": "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bdaaa/47a621ef0550c7a6a1ed0507b0b8a7b7822447c2ff0995acc4b688eed1e1f1d0/vex-fixed/1aeb76ce6ca8dd91b12c18a11eeb964b",
      "creationInfo": "_:CreationInfo1",
      "extension": [
        {
          "type": "https://rdf.openembedded.org/spdx/3.0/id-alias",
          "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs.org/openembedded-alias/by-doc-hash/22ab8d6eced4525f57bb861acc0fe983d8af5805dd97e702c22c1ffe04621cb2/unzip/UNIHASH/vex-fixed/1aeb76ce6ca8dd91b12c18a11eeb964b"
        }
      ],
      "from": "http://spdxdocs.org/openembedded-alias/by-doc-hash/539e1deec075c3a51b8c6975352b0a9ad320a130a4d7d516316b35994a830f93/unzip/UNIHASH/vulnerability/CVE-2015-1315",
      "relationshipType": "fixedIn",
      "to": [
        "http://spdx.org/spdxdocs/unzip-d5d383ad-de07-5ac4-8814-3c95ed6bdaaa/47a621ef0550c7a6a1ed0507b0b8a7b7822447c2ff0995acc4b688eed1e1f1d0/package/unzip"
      ],
      "security_vexVersion": "1.0.0"
    },
...

[1] https://spdx.github.io/spdx-spec/v3.0.1/model/Security/Classes/VexFixedVulnAssessmentRelationship/

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index c60c97896c..9baa40887b 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -437,6 +437,17 @@ def set_purposes(d, element, *var_names, force_purposes=[]):
         getattr(oe.spdx30.software_SoftwarePurpose, p) for p in purposes[1:]
     ]
 
+def get_cves(d):
+    cve_status = {}
+    patched_cves = oe.cve_check.get_patched_cves(d)
+    for cve, patched_cve in patched_cves.items():
+        cve_status[cve] = {
+            "mapping": patched_cve["abbrev-status"],
+            "detail": patched_cve["status"],
+            "description": patched_cve.get("justification", None)
+        }
+
+    return cve_status
 
 def create_spdx(d):
     def set_var_field(var, obj, name, package=None):
@@ -487,8 +498,8 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
-        for cve in d.getVarFlags("CVE_STATUS") or {}:
-            decoded_status = oe.cve_check.decode_cve_status(d, cve)
+        cve_data = get_cves(d)
+        for cve, decoded_status in cve_data.items():
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-- 
2.34.1


