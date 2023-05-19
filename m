Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 545B7C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 08:19:17 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.52])
 by mx.groups.io with SMTP id smtpd.web10.20895.1684484355147116015
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 May 2023 01:19:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=CcLDtR+B;
 spf=pass (domain: siemens.com, ip: 40.107.6.52, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R0RRoEoOr6EJj7EEBQu1hCzRrhPuAXgLRF94KAwLKk/dNEcpAdRIweng7vNLnskUkcNf+wpsjH3PseHqLegjin/XJ3bOEKerMd9W9GymTyru9fGdTKn/jRRMXw2QGMLsNMfoiDDdW8vypj36sRu+qpItJ7sMQUQwctle3OQ9AVBu6ZxNQxEt9J4TdNM4FKHoMoQ2HRfXT7/F06zC9lVGrei60G7USG9L8Hf4agEKsd6MuZMTzr6W5jUIG9BCuFMqRIVM+p+QmM1TF7CKeX+T9LKiUhx9niv7panH3Pvb4HPlVKgCB9/YAqwqF4PJYML2Ik3KteP9ljO5CTURR8zEbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzWasuYtOGYnvTSdjle19ihmpYsqTPdiMqSUkz1vads=;
 b=FCf02HRaA3g7SQbhqXa85SfyZknQLXZ3t4piv0NfRuPHYYH9fwT8TCqoBNmoaWVlywI4pf+dK/4oEe6kYfQ5U4Da/LPfyeKbvJXfFFW9noEXyQWrbep4K5xZ4zepY95F7KcBTDCNT7JWa/gCyGwKi7pbB5ksiUAwj87h8rzL8HgIstB/yXkhUEtIWtEX/D2uc4z5vG3m2ZL6MW5wK1PQ0u9GY1iTFlBkcrrj5zh2ZvjEdkW0BCH9+FVmueEEm73BISpFAhcpyMJak/9Nas0U/naa6VbVtPLjSHHptoyVB7Qo4AtvtWzDVwEij0KeOOh9R763rYX/lXQ+jiFdp2jfnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzWasuYtOGYnvTSdjle19ihmpYsqTPdiMqSUkz1vads=;
 b=CcLDtR+B30OCv/s2lJnnhuA70L17bjtEFUgha8cdRXrz2nYwrgW2D1J8NWyRFrFbdR9SrByrs4P5PNDzmFarMGXehK+pSJV2LjYZsKXW9OWwpFJZknmmB66RSy9MYAsI71gkowZKihhh1fx8zbuI+CbAvJF4dxDY3izEKpBpuH2RPxGFwyq/4GP6oJQi1I6uhKM20khMhcyVWplpL1hsBvT5Za0N1eKNzkw2eWIKSYfb2rZEblaAAXwMA+IPWi8O9v14Eq5kWmRKNGdSoC6kHh34zznIuC8cWwZnBDRAA7ZL4VEM0HbFH3GraExh2lOHNRUSf0sfejxKpjvQ+DFh1g==
Received: from OS6P279CA0176.NORP279.PROD.OUTLOOK.COM (2603:10a6:e10:38::15)
 by DU0PR10MB8022.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:406::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Fri, 19 May
 2023 08:19:11 +0000
Received: from HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:e10:38:cafe::e9) by OS6P279CA0176.outlook.office365.com
 (2603:10a6:e10:38::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.21 via Frontend
 Transport; Fri, 19 May 2023 08:19:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT005.mail.protection.outlook.com (10.152.1.229) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.7 via Frontend Transport; Fri, 19 May 2023 08:19:10 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:19:09 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.107.140) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 19 May 2023 10:19:09 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v4 1/3] cve-check: add option to add additional patched CVEs
Date: Fri, 19 May 2023 10:18:48 +0200
Message-ID: <20230519081850.82586-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230505111814.491483-1-andrej.valek@siemens.com>
References: <20230505111814.491483-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.107.140]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT005:EE_|DU0PR10MB8022:EE_
X-MS-Office365-Filtering-Correlation-Id: 008785b5-af06-45cd-c695-08db5841b92b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	GyzD0BfwlBN6KdDvcIwXVp6/UhYiEI0dc6laB4O6WFM6JjRC6UrcknwLryEwkgcs6iqbfYHpEQrFtBpqlVXWR44gxkCN2uwkqsItV+p8LBS9bUNbAesH0wSlIFvh/2B0WXBsW8O7mqhbLTL2rsRWm8FZ/upqd64KsLfnhBKzpCm9aZZhr5IKNwZU2gNtU58Zzd62g9jz+jlSS9x7RMOP7GJo8QScCr3rIfZn8cCGutxvB485b+jDIPKvpXoyhnuCT6zYRF77qFDPgy0X660kxOhX0DNDhD5uuHPFqMhsPP2s1jq4MAb5vPd4WR4tO41WUhqQDP1fzHq6PCjFi6A0zxBxObzHYCtxFJ4H8U1FaiyHiVk/JQLNbYSErRwtFkD1WeMsdSjM78Cgh+R84hdo60AHUdonzZQLNTwvfPWvxhhVqBMKgfE7xr7u0viOY3OTKX5WnbOKG4Y733m2UsHswJLgeUGSRUDNOB1onFCtNXRHSR9vv7fGovkStCXJNxMX05VCik55Q5FrIqWM9xHIx1HnNN2duLBzp8HeV2ecLs8dYd5hlJbx9WVPA0XpZUaPvRkLxdZJ4XvmST0XUFzkX6nrrhBHYlOzKYT/FeCyO4aftoBYtteHDpmt/0O8buUxkr21lb42sVRrMoRpabv5R4r9o/9hGYRp5PlMqeJtwiQ0XqwLuY69aI+BuHqSr6hIW6rgx7fyWzMFOubQuTTQ+waCqJNBrjQLp5Bex8fF4Of90mWRYkwoFBynIOzSaqrfY7CeJBZNmG7qFYmSC5oFOw==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199021)(36840700001)(40470700004)(46966006)(6666004)(5660300002)(54906003)(478600001)(47076005)(356005)(40480700001)(4326008)(36756003)(6916009)(316002)(2906002)(41300700001)(44832011)(70206006)(8936002)(8676002)(70586007)(86362001)(107886003)(186003)(82960400001)(82740400003)(40460700003)(26005)(1076003)(16526019)(83380400001)(81166007)(82310400005)(336012)(2616005)(956004)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2023 08:19:10.4892
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 008785b5-af06-45cd-c695-08db5841b92b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT005.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB8022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 May 2023 08:19:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181537

- Replace CVE_CHECK_IGNORE with CVE_STATUS + [CVE_STATUS_REASONING] to be
more flexible. CVE_STATUS should contain flag for each CVE with accepted
values "Ignored", "Not applicable" or "Patched". It allows to add
a status for each CVEs.
- Optional CVE_STATUS_REASONING flag variable may contain a reason
why the CVE status was used. It will be added in csv/json report like
a new "reason" entry.
- Settings the same status and reason for multiple CVEs is possible
via CVE_STATUS_GROUPS variable.
- All listed CVEs in CVE_CHECK_IGNORE are copied to CVE_STATUS with
value "Ignored" like a fallback.

Examples of usage:
CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Not applicable" or "Patched"
CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on Windows"

CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0002"
CVE_STATUS_WIN[status] =3D "Not applicable"
CVE_STATUS_WIN[reason] =3D "Issue only applies on Windows"

CVE_STATUS_PATCHED =3D "CVE-1234-0003 CVE-1234-0004"
CVE_STATUS_PATCHED[status] =3D "Patched"
CVE_STATUS_PATCHED[reason] =3D "Fixed externally"

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 meta/classes/cve-check.bbclass | 44 ++++++++++++++++++++++++++++++----
 meta/lib/oe/cve_check.py       |  6 +++++
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445c..44462de7445 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,12 +70,15 @@ CVE_CHECK_COVERAGE ??=3D "1"
 # Skip CVE Check for packages (PN)
 CVE_CHECK_SKIP_RECIPE ?=3D ""
=20
-# Ingore the check for a given list of CVEs. If a CVE is found,
-# then it is considered patched. The value is a string containing
-# space separated CVE values:
+# Replace NVD DB check status for a given CVE. Each of CVE has to be menti=
oned
+# separately with optional reason for this status.
 #
-# CVE_CHECK_IGNORE =3D 'CVE-2014-2524 CVE-2018-1234'
+# CVE_STATUS[CVE-1234-0001] =3D "Ignored" # or "Not applicable" or "Patche=
d"
+# CVE_STATUS[CVE-1234-0002] =3D "Not applicable"
+# CVE_STATUS_REASONING[CVE-1234-0002] =3D "Issue only applies on Windows"
 #
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
 CVE_CHECK_IGNORE ?=3D ""
=20
 # Layers to be excluded
@@ -88,6 +91,25 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
 # set to "alphabetical" for version using single alphabetical character as=
 increment release
 CVE_VERSION_SUFFIX ??=3D ""
=20
+python () {
+    # Fallback all CVEs from CVE_CHECK_IGNORE to CVE_STATUS
+    cve_check_ignore =3D d.getVar("CVE_CHECK_IGNORE")
+    if cve_check_ignore:
+        bb.warn("CVE_CHECK_IGNORE has been deprecated, use CVE_STATUS inst=
ead")
+        set_cves_statuses(d, d.getVar("CVE_CHECK_IGNORE"), "Ignored")
+
+    # Process CVE_STATUS_GROUPS to set multiple statuses and optional reas=
ons at once
+    for cve_status_group in (d.getVar("CVE_STATUS_GROUPS") or "").split():
+        set_cves_statuses(d, d.getVar(cve_status_group) or "",
+                          d.getVarFlag(cve_status_group, "status"),
+                          d.getVarFlag(cve_status_group, "reason"))
+}
+
+def set_cves_statuses(d, cves, status, reason=3D""):
+    for cve in cves.split():
+        d.setVarFlag("CVE_STATUS", cve, status)
+        d.setVarFlag("CVE_STATUS_REASONING", cve, reason)
+
 def generate_json_report(d, out_path, link_path):
     if os.path.exists(d.getVar("CVE_CHECK_SUMMARY_INDEX_PATH")):
         import json
@@ -282,7 +304,13 @@ def check_cves(d, patched_cves):
         bb.note("Recipe has been skipped by cve-check")
         return ([], [], [], [])
=20
-    cve_ignore =3D d.getVar("CVE_CHECK_IGNORE").split()
+    # Convert CVE_STATUS into ignored CVEs and check validity
+    cve_ignore =3D []
+    for cve, status in (d.getVarFlags("CVE_STATUS") or {}).items():
+        if status in ["Not applicable", "Ignored"]:
+            cve_ignore.append(cve)
+        elif status not in ["Patched"]:
+            bb.error("Unsupported status %s in CVE_STATUS[%s]" % (status, =
cve))
=20
     import sqlite3
     db_file =3D d.expand("file:${CVE_CHECK_DB_FILE}?mode=3Dro")
@@ -455,6 +483,9 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
         else:
             unpatched_cves.append(cve)
             write_string +=3D "CVE STATUS: Unpatched\n"
+        reasoning =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if reasoning:
+            write_string +=3D "CVE REASON: %s\n" % reasoning
         write_string +=3D "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
         write_string +=3D "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev2"]
         write_string +=3D "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scor=
ev3"]
@@ -576,6 +607,9 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
             "status" : status,
             "link": issue_link
         }
+        reasoning =3D d.getVarFlag("CVE_STATUS_REASONING", cve)
+        if reasoning:
+            cve_item["reason"] =3D reasoning
         cve_list.append(cve_item)
=20
     package_data["issue"] =3D cve_list
diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index dbaa0b373a3..f47dd9920ef 100644
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


