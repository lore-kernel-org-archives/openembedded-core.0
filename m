Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B44C7EE25
	for <webhook@archiver.kernel.org>; Mon, 12 Jun 2023 11:58:12 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.66])
 by mx.groups.io with SMTP id smtpd.web10.56867.1686571085072735915
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Jun 2023 04:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=VfzHipm7;
 spf=pass (domain: siemens.com, ip: 40.107.20.66, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Il4Ly0uSwssIUzBAvT2uG4HyxCg2KBnZH907sGnHI0HlDalv1zh+CvWD7PbEra40EdWXsowjIy5zda8CUzprkLuyv1+k4wwk7f1M8U5YOJXDKOyi48Z2V6GI8yiYV+3LUlzLom9yWk6rmKSmwrQg7sDAp5iZ+qEn7xkn78QeoqQHiV1LuUIHsiBoVmV7dkr7pLAn74NBDF1UPteyKqOu8b7g7KwFFaexUhF1/i6hfMhBLYZKjtM0CCn8GyH4kMxDvSWCdibGiWzdmEU5eBFIYuxOv4iEl2pbYtWdfWBINPw2EGFRr6PpK4dZWR5w2XLeXHm8qfzOL8t/4ZMmcQmjYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qNhpopUvULPC7XmBZdXiJnibwcIDL9SOkFqicXzRsNE=;
 b=mjLCLDhhImcdpPSauAkR5d9qZy4XwK5p7WYOVfr77Y/1CLLinTOUUjtnjUsW7IzszeFZpPL+WUeqTp0Tk5xu63O5IsbeQwj80xWu6/VWBiglQ5Ra5ZZgmTeE5+Ty7HwJbzjeOJi5cVSIhxWqc9Hk59L4TDEvfWMs3SowN8hGFpfC3Tf6Ba7LAevYHWn1YvNXMt1wRKyMQZXVKou0aZe6dKWWxm0edOFb8fJ54kGE2O6CrC75Ey3FBzds6WpT3iowuu7taXu9sXKkL2MaKS8LOSSyK9AKSz3Y3/pBTKNWiK/0TyHL9PMWO3NhaG5RChkiy9L5kVccRHWUl6n+H8mp2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qNhpopUvULPC7XmBZdXiJnibwcIDL9SOkFqicXzRsNE=;
 b=VfzHipm7yJhNviY6D53tvfpu2BbKvbE2RxxWDbR0fPdQX0P5c5uBcG1jB+tmPlMxH2Onis3RnIK/jZoH+o2uVUkBFmn4jitr1pidu3Gc4gTXdhtOF3TohTjJUxEfPIdkFTp3mExWvFOdUakUdHi7EX8dvnhoe5D43/UIE/AkSYDXG9VkEnnNdvQO9xFutoJ4SPsMWR1n24AOioXDop8xPeJySFdYEvwlCAWNNc8ef76vLJtO65FIY122U3EkyC+v6IOnKTDrcYQp6fY0OmVBtDBo18DHNw7f51321twrhADXIiUPd5XoThchFrqYncFWhq2I7cpb9dm/MSLgD1Uaxw==
Received: from GV3P280CA0109.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::12) by
 AS8PR10MB6604.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:565::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.44; Mon, 12 Jun 2023 11:58:02 +0000
Received: from HE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::83) by GV3P280CA0109.outlook.office365.com
 (2603:10a6:150:8::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.33 via Frontend
 Transport; Mon, 12 Jun 2023 11:58:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT029.mail.protection.outlook.com (10.152.0.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21 via Frontend Transport; Mon, 12 Jun 2023 11:58:01 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:58:00 +0200
Received: from md3hr6tc.ad001.siemens.net (167.87.37.146) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Mon, 12 Jun 2023 13:58:00 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v5 1/2] cve-check: add option to add additional patched CVEs
Date: Mon, 12 Jun 2023 13:57:42 +0200
Message-ID: <20230612115743.52686-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.37.146]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT029:EE_|AS8PR10MB6604:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e3a89d-d081-4c19-0dd6-08db6b3c45c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	8sGyyAZl1M0PvyvbL2Qz3Lbc9N498x1vQAibfmsdTKB/cl+tLwigdNiO4J4pQFs1F/oJi6ng7IFVmoNqTpA2NKgaOZ0EOPD8GbvruvPEzVIsXH4o+7H+eK9N16zEr5H7HVrHvZVnhaNw8/qcahRG9dLI9Lrqjly6BsDamLs3KbHXQ+u0DiJ8q6JUPs1BFEEy6ZSG5M+Ca9hWcJfJHECZV07+8cf6PEp8483j8fQ8Sb7pSJUkp6h4+EFSLFWciH/wi7AZCshiw+/4RRj28WPcjb6l4c5DCMpWwf37ruVmxrSV0JZCJZeURQX1LnyjwTGexLF7s41Ljt20v5wTTRQkH3k5d01SGUX5+2rnfdcaOJEvfS2fZSTSdjVqzoRw3nw4OQDrfVSKJLQjzkYY3urYsFNEEhjH/fsbEJ8jp7JMp54ITsd1dx3GHPM7FHB+ml9s/0ZOd878hO/Rv+BTrrbjBvqTdyWHimLMXQfnCKqJ3lQrRr6/VVhDOnUqbgIn2X/pAr0Kph2T7G6jsSnBuAD/HHgCv0521ELCOz1lFodzLOioh4ljNi/YguqvQW9SVnf0nezS5x6iDVQxaRehb3WNU8c3IlbelrJY08UMsZataUhH/zL3IVDX5ovxiVnsR1hA4EfWStBFybnwToXGFtrSCw+sv2LLGDNTFyEYxXrgDIi39ZTwlpBrcoEtS+gEIChMD7DXSTgqy+Uv/xI3YNtkxl+c3JfwsAHyVKauvQlhcPnlTLdSg0h2onC1COWSCNvYVKUNsn/6tc6qjT+X1MrMJw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199021)(40470700004)(46966006)(36840700001)(86362001)(36756003)(40480700001)(82310400005)(356005)(81166007)(82740400003)(82960400001)(40460700003)(478600001)(6666004)(54906003)(107886003)(8936002)(8676002)(44832011)(70586007)(5660300002)(4326008)(6916009)(316002)(41300700001)(2906002)(36860700001)(47076005)(2616005)(956004)(336012)(16526019)(1076003)(83380400001)(70206006)(26005)(186003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 11:58:01.4780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e3a89d-d081-4c19-0dd6-08db6b3c45c6
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT029.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6604
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Jun 2023 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182665

- Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_DETAIL] +
[CVE_STATUS_DESCRIPTION] to be more flexible. CVE_STATUS should
contain flag for each CVE with accepted values "Ignored", "Patched"
or "Unpatched". It allows to add a status for each CVEs.
- Optional CVE_STATUS_DEATAIL flag variable may contain a detailed
status. Possible options for each status:
- Patched
 - fixed-version, backported-patch, cpe-stable-backport or other
- Unpatched
 - vulnerable-investigating or other
- Ignored
 - cpe-incorrect, not-applicable-platform, upstream-wontfix
   not-applicable-config, not-affected or other
- Optional CVE_STATUS_DESCRIPTION flag variable may contain a reason
why the CVE status was used. Both optionals will be added in csv/json
report like a new "detail" an "description" entries
- Settings the same status and reason for multiple CVEs is possible
via CVE_STATUS_GROUPS variable.
- All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
value "Ignored" like a fallback.

Examples of usage:
CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Patched" or "Unpatched"
CVE_STATUS[CVE-1234-0002] =3D "Ignored"
CVE_STATUS_DETAIL[CVE-1234-0002] =3D "not-applicable-platform"
CVE_STATUS_DESCRIPTION[CVE-1234-0002] =3D "Issue only applies on Windows"

CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
CVE_STATUS_WIN[status] =3D "Ignored"
CVE_STATUS_DETAIL[detail] =3D "not-applicable-platform"
CVE_STATUS_WIN[description] =3D "Issue only applies on Windows"

CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
CVE_STATUS_PATCHED[status] =3D "Patched"
CVE_STATUS_DETAIL[detail] =3D "fixed-version"
CVE_STATUS_PATCHED[description] =3D "Fixed externally"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 89 +++++++++++++++++++++++++++++-----
 meta/lib/oe/cve_check.py       |  6 +++
 2 files changed, 83 insertions(+), 12 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445..62676ba5bc 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,12 +70,16 @@ CVE_CHECK_COVERAGE ??=3D "1"
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?=3D ""
=20
-# Ingore the check for a given list of CVEs. If a CVE is found,
-# then it is considered patched. The value is a string containing
-# space separated CVE values:
+# Replace NVD DB check status for a given CVE. Each of CVE has to be menti=
oned
+# separately with optional detail and description for this status.
 #
-# CVE_CHECK_IGNORE =3D 'CVE-2014-2524 CVE-2018-1234'
+# CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Patched" or "Unpatched"
+# CVE_STATUS[CVE-1234-0002] =3D "Ignored"
+# CVE_STATUS_DETAIL[CVE-1234-0002] =3D "not-applicable-platform"
+# CVE_STATUS_DESCRIPTION[CVE-1234-0002] =3D "Issue only applies on Windows=
"
 #
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
 CVE_CHECK_IGNORE ?=3D ""
=20
 # Layers to be excluded
@@ -88,6 +92,47 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 # set to "alphabetical" for version using single alphabetical character as=
 increment release
 CVE_VERSION_SUFFIX ??=3D ""
=20
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        set_cves_statuses(d, d.getVar("CVE_CHECK_IGNORE"), "Ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional deta=
il or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        cve_group =3D d.getVar(cve_status_group)
+        if cve_group is not None:
+            set_cves_statuses(d, cve_group,
+                              d.getVarFlag(cve_status_group, "status"),
+                              d.getVarFlag(cve_status_group, "detail"),
+                              d.getVarFlag(cve_status_group, "description"=
))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % c=
ve_status_group)
+}
+
+def set_cves_statuses(d, cves, status, detail=3D"", description=3D""):
+    for cve in cves.split():
+        d.setVarFlag("CVE_STATUS", cve, status)
+        d.setVarFlag("CVE_STATUS_DETAIL", cve, detail)
+        d.setVarFlag("CVE_STATUS_DESCRIPTION", cve, description)
+
+def get_cve_detail(d, cve, status):
+    detail =3D d.getVarFlag("CVE_STATUS_DETAIL", cve)
+    if detail is not None:
+        if status =3D=3D "Patched":
+            if detail in ["fixed-version", "backported-patch", "cpe-stable=
-backport", "other"]:
+                return detail
+        elif status =3D=3D "Unpatched":
+            if detail in ["vulnerable-investigating", "other"]:
+                return detail
+        else:
+            if detail in ["cpe-incorrect", "not-applicable-platform", "ups=
tream-wontfix",
+                        "not-applicable-config", "not-affected", "other"]:
+                return detail
+        bb.warn('Invalid detail %s for CVE_STATUS[%s] =3D "%s"' % (detail,=
 cve, status))
+    return ""
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -282,7 +327,13 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been skipped by cve-check")
         return ([], [], [], [])
=20
-    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
+    # Convert CVE_STATUS into ignored CVEs and check validity
+    cve_ignore =3D []
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status =3D=3D "Ignored":
+            cve_ignore.append(cve)
+        elif status not in ["Patched", "Unpatched"]:
+            bb.error("Unsupported status %s in CVE_STATUS[%s]" % (status, =
cve))
=20
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
@@ -441,20 +492,28 @@ def cve_write_data_text(d, patched, unpatched, ignore=
d, cve_data):
         is_patched =3D cve in patched
         is_ignored =3D cve in ignored
=20
+        status =3D "Unpatched"
         if (is_patched or is_ignored) and not report_all:
             continue
+        if is_ignored:
+            status =3D "Ignored"
+        elif is_patched:
+            status =3D "Patched"
+        else:
+            # default value of status is Unpatched
+            unpatched_cves.append(cve)
=20
         write_string +=3D "LAYER: %s\n" % layer
         write_string +=3D "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string +=3D "PACKAGE VERSION: %s%s\n" % (d.getVar("EXTENDPE"=
), d.getVar("PV"))
         write_string +=3D "CVE: %s\n" % cve
-        if is_ignored:
-            write_string +=3D "CVE STATUS: Ignored\n"
-        elif is_patched:
-            write_string +=3D "CVE STATUS: Patched\n"
-        else:
-            unpatched_cves.append(cve)
-            write_string +=3D "CVE STATUS: Unpatched\n"
+        write_string +=3D "CVE STATUS: %s\n" % status
+        detail =3D get_cve_detail(d, cve, status)
+        if detail:
+            write_string +=3D "CVE DETAIL: %s\n" % detail
+        description =3D d.getVarFlag("CVE_STATUS_DESCRIPTION", cve)
+        if description:
+            write_string +=3D "CVE DESCRIPTION: %s\n" % description
         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
@@ -576,6 +635,12 @@ def cve_write_data_json(d, patched, unpatched, ignored=
, cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
+        detail =3D get_cve_detail(d, cve, status)
+        if detail:
+            cve_item["detail"] =3D detail
+        description =3D d.getVarFlag("CVE_STATUS_DESCRIPTION", cve)
+        if description:
+            cve_item["description"] =3D description
         cve_list.append(cve_item)
=20
     package_data["issue"] =3D cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a..f47dd9920e 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -130,6 +130,12 @@ def get_patched_cves(d):
         if not fname_match and not text_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
=20
+    # Search for additional patched CVEs
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status =3D=3D "Patched":
+            bb.debug(2, "CVE %s is additionally patched" % cve)
+            patched_cves.add(cve)
+
     return patched_cves
=20
=20
--=20
2.40.1


