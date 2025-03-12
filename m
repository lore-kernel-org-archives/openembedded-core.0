Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4902DC28B28
	for <webhook@archiver.kernel.org>; Wed, 12 Mar 2025 05:58:17 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.30265.1741759089566058277
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Mar 2025 22:58:09 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51661f102f=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52C4ii9M030085;
	Tue, 11 Mar 2025 22:58:06 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45b0j4r6c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Tue, 11 Mar 2025 22:58:06 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 11 Mar 2025 22:58:05 -0700
Received: from pek-lpg-core5.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Tue, 11 Mar 2025 22:58:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <JPEWhacker@gmail.com>
CC: <richard.purdie@linuxfoundation.org>, <mikko.rapeli@linaro.org>
Subject: [PATCH] lib: spdx30_tasks: remove duplicated patched CVEs
Date: Wed, 12 Mar 2025 13:58:03 +0800
Message-ID: <20250312055803.801070-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=Cc0I5Krl c=1 sm=1 tr=0 ts=67d1226e cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=Vs1iUdzkB0EA:10 a=24AZYWMyAAAA:8 a=Q4-j1AaZAAAA:8 a=rorgr0BEAAAA:8 a=sMBj6sIwAAAA:8 a=8r2qhXULAAAA:8 a=t7CeM3EgAAAA:8
 a=dVSUmkUd2pwEVWt61fYA:9 a=bG88sKzkDEFeXWNnvthB:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FuUPMLReglAHmohU_o2S:22 a=8gvLZcY7Nlvl4CGD_6nf:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: wz_11HrpNUuEQgNT8iPILYJ7Ef9D56yM
X-Proofpoint-GUID: wz_11HrpNUuEQgNT8iPILYJ7Ef9D56yM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-12_02,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 clxscore=1011 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 mlxlogscore=999 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502280000 definitions=main-2503120039
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Mar 2025 05:58:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212638

Due to commit [lib: spdx30_tasks: Handle patched CVEs][1] applied,
duplicated CVE identifier for each CVE which increased +25% build
time (image task: do_create_image_sbom_spdx)

$ bitbake binutils-cross-x86_64
$ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.spdx.json | grep CVE-2023-25584
      "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-2023-25584",
          "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584"
          "identifier": "CVE-2023-25584",
            "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
            "https://www.cve.org/CVERecord?id=CVE-2023-25584"
      "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/962efd5da447b81b017db54d3077be796d2e5b6e770a6b050467b24339c0995f/vulnerability/CVE-2023-25584",
          "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584"
          "identifier": "CVE-2023-25584",
            "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
            "https://www.cve.org/CVERecord?id=CVE-2023-25584"

Since the commit [cve-check: annotate CVEs during analysis][2] improved
function get_patched_cves to:
- Check each patch file;
- Search for additional patched CVEs from CVE_STATUS;

And return dictionary patched_cve for each cve:
{
  "abbrev-status": "xxx",
  "status": "xxx",
  "justification": "xxx",
  "resource": "xxx",
  "affected-vendor": "xxx",
  "affected-product": "xxx",
}

But while adding CVE in meta/lib/oe/spdx30_tasks.py, the cve_by_status
requires decoded_status
{
  "mapping": "xxx",
  "detail": "xxx",
  "description": "xxx",
}

This commit converts patched_cve to decoded_status

  patched_cve["abbrev-status"] --> decoded_status["mapping"]
  patched_cve["status"] --> decoded_status["detail"]
  patched_cve["justification"] --> decoded_status["description"]

And remove duplicated search for additional patched CVEs from CVE_STATUS
(calling oe.cve_check.decode_cve_status)

After applying this commit
$ bitbake binutils-cross-x86_64
$ jq . tmp/deploy/spdx/3.0.1/x86_64/recipes/recipe-binutils-cross-x86_64.spdx.json | grep CVE-2023-25584
      "spdxId": "http://spdx.org/spdxdocs/binutils-cross-x86_64-5de92009-80e6-55c5-8b1f-cc37f04fbe09/381bf593d99c005ecd2c2e0815b86bca2b9ff4cc2db59587aaddd3db95c67470/vulnerability/CVE-2023-25584",
          "https://rdf.openembedded.org/spdx/3.0/alias": "http://spdxdocs.org/openembedded-alias/by-doc-hash/594f521fb7a3a4e9a2d3905303ffb04b016c3ce7693a775cca08be5af4d06658/binutils-cross-x86_64/UNIHASH/vulnerability/CVE-2023-25584"
          "identifier": "CVE-2023-25584",
            "https://cveawg.mitre.org/api/cve/CVE-2023-25584",
            "https://www.cve.org/CVERecord?id=CVE-2023-25584"

[1] https://git.openembedded.org/openembedded-core/commit/?id=1ff496546279d8a97df5ec475007cfb095c2a0bc
[2] https://git.openembedded.org/openembedded-core/commit/?id=452e605b55ad61c08f4af7089a5a9c576ca28f7d

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oe/spdx30_tasks.py | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e20bb0c86f3..3d80f05612f 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -498,18 +498,13 @@ def create_spdx(d):
     # Add CVEs
     cve_by_status = {}
     if include_vex != "none":
-        for cve in oe.cve_check.get_patched_cves(d):
-            spdx_cve = build_objset.new_cve_vuln(cve)
-            build_objset.set_element_alias(spdx_cve)
-
-            cve_by_status.setdefault("Patched", {})[cve] = (
-                spdx_cve,
-                "patched",
-                "",
-            )
-
-        for cve in d.getVarFlags("CVE_STATUS") or {}:
-            decoded_status = oe.cve_check.decode_cve_status(d, cve)
+        patched_cves = oe.cve_check.get_patched_cves(d)
+        for cve, patched_cve in patched_cves.items():
+            decoded_status = {
+                "mapping": patched_cve["abbrev-status"],
+                "detail": patched_cve["status"],
+                "description": patched_cve.get("justification", None)
+            }
 
             # If this CVE is fixed upstream, skip it unless all CVEs are
             # specified.
-- 
2.34.1


