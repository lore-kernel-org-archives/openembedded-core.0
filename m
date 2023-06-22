Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A053CEB64DB
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:00:36 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.59])
 by mx.groups.io with SMTP id smtpd.web11.9390.1687435234730463162
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 05:00:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=TZr5vCQ0;
 spf=pass (domain: siemens.com, ip: 40.107.6.59, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XT/pCKWWtUHH05gI6DLSTL0uKo116LZIlRcKdZVtLQwJCqfhzo6oq5IRi85ZMXGLoEPX1oOPMbwHIvc3sfq5wS2uGjGK5YSu8R8f1C9Txuzfefe06KAlQaqFN3ajiv2TbyK+7TAeyUrLjhQ04BmOMnKsTJS07Uf51GaDlfHbwupKgw1FjZb35hm2f6Ht79+YQ13zcnYGdJlYhefWK8yOxqITOMyCl186avO/ND+PefWgVHGGB3j9XPYvo8rIur4NFeYS1wLvJbuls6Rilq4rK5WCMOwXOkyCWlqTIT0cxtCgHSlf9+4mkFdCe8t0r783TPJEGopgYpCquaCihe290g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r18IERUtEYnRNNh2xyp5KfJmWo1wcV16sXNf2BpCDYQ=;
 b=nzaPJtkr/N/5teLbIyKCCvTCmuae664ymp49FFF72mki8XCL5zI2x9uvb4GMWXuXzfokpR8F/eORJQ/yztdnadGmPlL4Gfum+Tc1u8SgjNYD6Xi9BvKrWbAo5VlMBRaE4H/RIJG+cIgVqp56kpzYd1bexP1FZkA35kdOgcDEXmAzcm5MOVMj1xnoCGzcckqRN/x1SstngirSg8I2WXKAN3/fmJoZOZuUfPNzo67foB5nda5MqikakxaqXvj6oD7qOHXHya3SPmUG15l98Oi/x0kl8xxcBIJqIwjGZkLfKBzeFRCyCMolr3fBJVzDPpoe8AhsymCIUtu+nDvLCf8xJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r18IERUtEYnRNNh2xyp5KfJmWo1wcV16sXNf2BpCDYQ=;
 b=TZr5vCQ0EGJqU3oO0ulBS5V7jTb4dS29T7Hrx+ahba7byseRwbr6Lsy2/rtu69lH5d3n70Hm3cBgoh64F2eCLw+8Pdg4ZYHYE9zsklQwfCU4NO5wpMr/wpxg/Ldv74fJrfhbc8OxWxEHOh4f7WnntCXj3+sW50DOSwMEsdEPgtGG0Q4nARhGh3ZHiPrP24+PpowjgADzMZDbxEeaH7BtNmLZmFjaMHY+eXWEAKhY9AKmoxUYMXlxTrDcRvEF+rrfI725J/LUeblha77irEynT3YkhIm9q+3VjJHffoJ1ltxu4WMpwLdj+gbUjFaP2I0kkgOq3QvtyjnjQR98wKDs1A==
Received: from DUZPR01CA0337.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::10) by DUZPR10MB8228.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4b2::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 12:00:31 +0000
Received: from DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:4b8:cafe::9d) by DUZPR01CA0337.outlook.office365.com
 (2603:10a6:10:4b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 12:00:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT043.mail.protection.outlook.com (10.152.5.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 12:00:31 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 14:00:30 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 14:00:30 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v8 1/3] cve-check: add option to add additional patched CVEs
Date: Thu, 22 Jun 2023 14:00:01 +0200
Message-ID: <20230622120009.28939-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT043:EE_|DUZPR10MB8228:EE_
X-MS-Office365-Filtering-Correlation-Id: 1219f35b-0581-4831-516b-08db7318472e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	KfHQRPY6C8w4PlW4eGeCA6LTSXMVNxHcrDOKW/NpYhlZrMCdy4E7LJuDhmLzv8P4I7Ls+uZqIy4dTQrTSQh9nfk4v7gFqzlTjxltPG/X9zXT3kBxe6A/VN/xyzCe00UjDYB3F3yMIGX966rkYr3dzimoeZoVX0PsoLZuyrITpQEohQTMlB3m+Tmgup8WB2agiZU5A0EynJ2ajvcfRXytLOpDXzue++7/y/Lv6jKEWHSvhJDRzk9kWl+RPBCxp+7VXQu7lnwO0aIMgSW2rTTH8/IsoCBZxumhUTjf9XiVY+Z0UiZtrwiZUH9NGCfpdGPDHnQEJ82j1i/tYfYXr5yCg7/fUKxc+9065FxwGb73NZlmDcMiI1MBnODOmRYGwOH1Tg9oBdTOsiGKHtzKgQDiSFHiWac2etyvIuyxuvCeg86wEHEMsGP0F0REEzTM79bnALONL54rEc0RyJWt8X/LMC+QFrcdozUyEINVwArvccdOfpo7CUbmyf3NG+nZORkt/4NZc+xwqQNKtZfsVtoUulTtjpyv/gDg7hdYHY55vIRm5HBvhQYiNVWOg6Qyz3QJ6QM3nwwVK833GsC5d6CWREUbsGTn7OPdb1m6nf1iBH60aCuepci7bMOC8yiK2TXD/QeyBdb6wsnXW9hsQP+PmmY2mdBky72KIOhjWh4XthD2mikx1aUN+82iWEuFBNFLjkZVWSOy9P+mKHXW8aWlfJdYetvu0pOpLXkiORHEZDMBIWdBPkBjyPAjWbu1/w61b4N/IT/P2van6NoMvKqu0w==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(376002)(396003)(136003)(39860400002)(346002)(451199021)(40470700004)(46966006)(36840700001)(82310400005)(36756003)(36860700001)(47076005)(26005)(107886003)(336012)(478600001)(186003)(54906003)(6666004)(956004)(83380400001)(2616005)(16526019)(1076003)(2906002)(44832011)(5660300002)(40460700003)(81166007)(356005)(70206006)(6916009)(70586007)(82740400003)(40480700001)(316002)(8676002)(41300700001)(4326008)(86362001)(82960400001)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:00:31.2746
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1219f35b-0581-4831-516b-08db7318472e
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8228
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 12:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183238

From: Andrej Valek <andrej.valek@siemens.com>

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
 meta/classes/cve-check.bbclass | 99 +++++++++++++++++++++++++++++-----
 meta/lib/oe/cve_check.py       | 25 +++++++++
 2 files changed, 111 insertions(+), 13 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445..4eb6dff7de 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,14 +70,48 @@ CVE_CHECK_COVERAGE ??=3D "1"
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
+
+# used by this class internally when fix is detected (NVD DB version check=
 or CVE patch file)
+CVE_CHECK_STATUSMAP[patched] =3D "Patched"
+# use when this class does not detect backported patch (e.g. vendor kernel=
 repo with cherry-picked CVE patch)
+CVE_CHECK_STATUSMAP[backported-patch] =3D "Patched"
+# use when NVD DB does not mention patched versions of stable/LTS branches=
 which have upstream CVE backports
+CVE_CHECK_STATUSMAP[cpe-stable-backport] =3D "Patched"
+# use when NVD DB does not mention correct version or does not mention any=
 verion at all
+CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
+
+# used internally by this class if CVE vulnerability is detected which is =
not marked as fixed or ignored
+CVE_CHECK_STATUSMAP[unpatched] =3D "Unpatched"
+# use when CVE is confirmed by upstream but fix is still not available
+CVE_CHECK_STATUSMAP[vulnerable-investigating] =3D "Unpatched"
+
+# used for migration from old concept, do not use for new vulnerabilities
+CVE_CHECK_STATUSMAP[ignored] =3D "Ignored"
+# use when NVD DB wrongly indicates vulnerability which is actually for a =
different component
+CVE_CHECK_STATUSMAP[cpe-incorrect] =3D "Ignored"
+# use when upstream does not accept the report as a vulnerability (e.g. wo=
rks as designed)
+CVE_CHECK_STATUSMAP[disputed] =3D "Ignored"
+# use when vulnerability depends on build or runtime configuration which i=
s not used
+CVE_CHECK_STATUSMAP[not-applicable-config] =3D "Ignored"
+# use when vulnerability affects other platform (e.g. Windows or Debian)
+CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
+# use when upstream acknowledged the vulnerability but does not plan to fi=
x it
+CVE_CHECK_STATUSMAP[upstream-wontfix] =3D "Ignored"
+
 # Layers to be excluded
 CVE_CHECK_LAYER_EXCLUDELIST ??=3D ""
=20
@@ -88,6 +122,24 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
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
@@ -260,7 +312,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version, convert_cve_version
+    from oe.cve_check import Version, convert_cve_version, decode_cve_stat=
us
=20
     pn =3D d.getVar("PN")
     real_pv =3D d.getVar("PV")
@@ -282,7 +334,12 @@ def check_cves(d, patched_cves):
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
@@ -413,6 +470,8 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
     CVE manifest if enabled.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     cve_file =3D d.getVar("CVE_CHECK_LOG")
     fdir_name  =3D d.getVar("FILE_DIRNAME")
     layer =3D fdir_name.split("/")[-3]
@@ -441,20 +500,27 @@ def cve_write_data_text(d, patched, unpatched, ignore=
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
@@ -516,6 +582,8 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
     Prepare CVE data for the JSON format, then write it.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     output =3D {"version":"1", "package": []}
     nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
=20
@@ -576,6 +644,11 @@ def cve_write_data_json(d, patched, unpatched, ignored=
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


