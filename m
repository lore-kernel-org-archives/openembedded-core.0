Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C62FCEB64D8
	for <webhook@archiver.kernel.org>; Tue, 20 Jun 2023 14:16:26 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.72])
 by mx.groups.io with SMTP id smtpd.web10.11555.1687270583237028949
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jun 2023 07:16:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=FG84bKFr;
 spf=pass (domain: siemens.com, ip: 40.107.241.72, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P6DEwIAqKmq4UH+V1WNPZYuHQZFItWT4GGglQfQqVjOC5mttmaeepHg8xKv7uiAk5tJrgeFhxmidy+oK49jFv0desQLxMS0Hj8bTicfn/oKBgPzlpDiQIUuGjyPw4qy3q0yhulSXfgoZ7qiy6lh50A0K1CdSrxJS/paDtSPY4MN+pDQshISH8ysKKpiXc/Xt3L0K4np4lyyV0d1RHQijrPGlyCiuCt84mR8LNjuQY9YwQ/9Kr8r0c/i8S2VdB3W59L/KbBNa8P92rCKWV13odTi4HAGn56koLAHrvAN8U5xJk6H//zcFQJlM7mJlCL9mjgyoqxPmyLkIZJGlPPvXlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tUcX8AIrVOB6ufUlme54K2E5AvuWEHbxYUxNLEZvHBQ=;
 b=j2D0x3Am7WDs01rn4WKmbSiKq5y+cG/elG2UeJzRWlsnwLfUnMuCj6AJkURPSDKl8IoiO9pehJG/69Ri9isAnfcslLsHmIPrmkm8Jd2G8k+H2g1I33iZ1XguKZDnmekosC41aMnngr7eDn8ipTQoT0erfhiYJCHRKXJE0MPEwsY0Lmb/JoGCFHXCGd9i1b3erUg1O/1RxifTYm2jwCQqHBTJoCOHuzzzxLzrJ7IpjN4pNByFGHBRvvYMxp+UzR7ihkru5uxuc73QwtzKAHlRJ+YzI/FaPk+0bVVE0tB0DAaGxMm3Ywbt31QUf3gAWEFuOtSvvMlFxapGDW4BPzswfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tUcX8AIrVOB6ufUlme54K2E5AvuWEHbxYUxNLEZvHBQ=;
 b=FG84bKFrTkCBBNjRJVZzE7GAjE1H32og0B0iU795R90AA4T51piOPIO0fLc6ZtAheXsiL+8YFVHcqT6n2nUdq/9B/tvHIpr4OGr3FnrCtsTDacGO59cmQYuWBgl598O3zlB9zs6w1R2WVIDFZVChwTmiZ+tzSNc0OZKPZSjUAkCpR1VsaLFOZFFV+lswYXG/ac8pdNKR9rpqmjUxlaMgbn4VfimBkFZEryLttOv/I/BCGGOyi0ZzGnnVVX2HgkyMkZPbNHEQYbL/Ge6VEhpMhGbw0TyUTIW48DjLp6Am+Maq2HljdNKhl/IN+whyXDY/7sunsZPW747j0g3UXhEwsw==
Received: from FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a4::11)
 by PAXPR10MB5205.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:287::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.35; Tue, 20 Jun
 2023 14:16:19 +0000
Received: from VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a4:cafe::7e) by FR3P281CA0183.outlook.office365.com
 (2603:10a6:d10:a4::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21 via Frontend
 Transport; Tue, 20 Jun 2023 14:16:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT021.mail.protection.outlook.com (10.152.2.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.21 via Frontend Transport; Tue, 20 Jun 2023 14:16:19 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:17 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 20 Jun 2023 16:16:17 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v6 1/2] RFC: cve-check: add option to add additional patched CVEs
Date: Tue, 20 Jun 2023 16:15:56 +0200
Message-ID: <20230620141557.54562-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT021:EE_|PAXPR10MB5205:EE_
X-MS-Office365-Filtering-Correlation-Id: a33154d0-65f8-47cd-4298-08db7198eaf3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	OU2ULNt0u3+K22MWn7Enmnk3iePQWGInJ608iSuMUs1tbF6pf/PhH1xYLfD8d1J7bK56fUCgUINccVF//PuHwMYeoiTOMXVFIWLLVXeRxgaG1176BG0FQUU+OoKNH75ZLH/J3SeJHQ6Bt//gYYQ5WVA+nSG1zZx6vDeQ0/dOfgp3u2HaVLY2zqixMdt7vr1kkN/5uL9MY1NSAyI0MiLhudOExSszZAMlFGZ1wiUYGEKZMT7Yfd5Sj5SJQTIeRGhXwuObly8HDh/qyqwcBBonmbr61HDEUuXUV1d4LGtG/Ji91uwDr7xmZ/kHNzwXrn1eN1bv50KcUhOX/6wPtzq0RXQrwX2CPwPp6kob4MhUErb1Uw/1VYo+Wm0mcnN+FkefrjVJVn9I1rns07bnUH4xndrqbY6FH1v1inmCCGueRsgSGUXEvZRwFQKuD46P/IhDnJzsdljy9nR8b2UcsSZcldOVS9SPw5BY+xGqvg51gLan+1knWVRo6MuHWgnv/HLpaq20D/BXXfCGklCfhZDt6ovGItNBnHG+XzW5zQC4HdgTsu3isH4wjN4NT/C6gVqSoaKRpcaFu4uIW2h5eOuhNOHrUw2rpFkaMDDcI85CEZal5/5r93VycrXgB9llUtw9FlD9gV6W5tiCe+TENZPdYQUf4dYZv/4ULH25Puc/g5nw9Vuyl/zwBamM19RVn4x5n2SAcmj9WNehPg2z3zyHkZSWOctfkDvXmulCcJLeGyDHAooh+1IVGU7o9maZ4phosCGfwFvp9+H+9t0GXkcFxQ==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(39860400002)(376002)(136003)(346002)(451199021)(36840700001)(46966006)(40470700004)(47076005)(36860700001)(83380400001)(336012)(70206006)(70586007)(6916009)(8676002)(41300700001)(8936002)(956004)(2616005)(81166007)(356005)(316002)(82740400003)(186003)(4326008)(26005)(82960400001)(16526019)(40460700003)(1076003)(82310400005)(6666004)(107886003)(478600001)(44832011)(40480700001)(54906003)(5660300002)(2906002)(36756003)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 14:16:19.3210
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a33154d0-65f8-47cd-4298-08db7198eaf3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT021.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR10MB5205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jun 2023 14:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183141

- Replace CVE_CHECK_IGNORE with CVE_STATUS to be more flexible.
The CVE_STATUS should contain an information about status wich
is decoded in 3 items:
- generic status: "Ignored", "Patched" or "Unpatched"
- more detailed status enum
- description: free text describing reason for status

Examples of usage:
CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only applies =
on Windows"
CVE_STATUS[CVE-1234-0002] =3D "fixed-version: Fixed externally"

CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 86 +++++++++++++++++++++++++++++-----
 meta/lib/oe/cve_check.py       | 25 ++++++++++
 2 files changed, 98 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445..6710c1d6bb 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,14 +70,35 @@ CVE_CHECK_COVERAGE ??=3D "1"
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
+# CVE_STATUS[CVE-1234-0001] =3D "not-applicable-platform: Issue only appli=
es on Windows"
+# CVE_STATUS[CVE-1234-0002] =3D "fixed-version: Fixed externally"
 #
+# CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
+# CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
+#
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
 CVE_CHECK_IGNORE ?=3D ""
=20
+# Possible options for CVE statuses
+CVE_CHECK_STATUSMAP[patched] =3D "Patched"
+CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
+CVE_CHECK_STATUSMAP[backported-patch] =3D "Patched"
+CVE_CHECK_STATUSMAP[cpe-stable-backport] =3D "Patched"
+
+CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
+CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
+
+CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
+CVE_CHECK_STATUSMAP[cpe-incorrect] =3D "Ignored"
+CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
+CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"
+CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
+CVE_CHECK_STATUSMAP[not-affected] =3D "Ignored"
+
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
=20
@@ -88,6 +109,24 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 # set to "alphabetical" for version using single alphabetical character as=
 increment release
 CVE_VERSION_SUFFIX ??=3D ""
=20
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE is deprecated in favor of CVE_STATUS")
+        for cve in (d.getVar("CVE_CHECK_IGNORE") or "").split():
+            d.setVarFlag("CVE_STATUS", cve, "ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional deta=
il or description at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        cve_group =3D d.getVar(cve_status_group)
+        if cve_group is not None:
+            for cve in cve_group.split():
+                d.setVarFlag("CVE_STATUS", cve, d.getVarFlag(cve_status_gr=
oup, "status"))
+        else:
+            bb.warn("CVE_STATUS_GROUPS contains undefined variable %s" % c=
ve_status_group)
+}
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -260,7 +299,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version, convert_cve_version
+    from oe.cve_check import Version, convert_cve_version, decode_cve_stat=
us
=20
     pn =3D d.getVar("PN")
     real_pv =3D d.getVar("PV")
@@ -282,7 +321,12 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been skipped by cve-check")
         return ([], [], [], [])
=20
-    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
+    # Convert CVE_STATUS into ignored CVEs and check validity
+    cve_ignore =3D []
+    for cve in (d.getVarFlags("CVE_STATUS") or {}):
+        decoded_status, _, _ =3D decode_cve_status(d, cve)
+        if decoded_status =3D=3D "Ignored":
+            cve_ignore.append(cve)
=20
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
@@ -413,6 +457,8 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
     CVE manifest if enabled.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     cve_file =3D d.getVar("CVE_CHECK_LOG")
     fdir_name  =3D d.getVar("FILE_DIRNAME")
     layer =3D fdir_name.split("/")[-3]
@@ -441,20 +487,27 @@ def cve_write_data_text(d, patched, unpatched, ignore=
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
+        _, detail, description =3D decode_cve_status(d, cve)
+        if detail:
+            write_string +=3D "CVE DETAIL: %s\n" % detail
+        if description:
+            write_string +=3D "CVE DESCRIPTION: %s\n" % description
         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
@@ -516,6 +569,8 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
     Prepare CVE data for the JSON format, then write it.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     output =3D {"version":"1", "package": []}
     nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
=20
@@ -576,6 +631,11 @@ def cve_write_data_json(d, patched, unpatched, ignored=
, cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
+        _, detail, description =3D decode_cve_status(d, cve)
+        if detail:
+            cve_item["detail"] =3D detail
+        if description:
+            cve_item["description"] =3D description
         cve_list.append(cve_item)
=20
     package_data["issue"] =3D cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a..5bf3caac47 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -130,6 +130,13 @@ def get_patched_cves(d):
         if not fname_match and not text_match:
             bb.debug(2, "Patch %s doesn't solve CVEs" % patch_file)
=20
+    # Search for additional patched CVEs
+    for cve in (d.getVarFlags("CVE_STATUS") or {}):
+        decoded_status, _, _ =3D decode_cve_status(d, cve)
+        if decoded_status =3D=3D "Patched":
+            bb.debug(2, "CVE %s is additionally patched" % cve)
+            patched_cves.add(cve)
+
     return patched_cves
=20
=20
@@ -218,3 +225,21 @@ def convert_cve_version(version):
=20
     return version + update
=20
+def decode_cve_status(d, cve):
+    """
+    Convert CVE_STATUS into status, detail and description.
+    """
+    status =3D d.getVarFlag("CVE_STATUS", cve)
+    if status is None:
+        return ("", "", "")
+
+    status_split =3D status.split(':', 1)
+    detail =3D status_split[0]
+    description =3D status_split[1].strip() if (len(status_split) > 1) els=
e ""
+
+    status_mapping =3D d.getVarFlag("CVE_CHECK_STATUSMAP", detail)
+    if status_mapping is None:
+        bb.warn('Invalid detail %s for CVE_STATUS[%s] =3D "%s", fallback t=
o Unpatched' % (detail, cve, status))
+        status_mapping =3D "Unpatched"
+
+    return (status_mapping, detail, description)
--=20
2.41.0


