Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA3E1C001DC
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:16:24 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.39471.1687518976713631479
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=C1+2MlYe;
 spf=pass (domain: siemens.com, ip: 40.107.20.85, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I7aTQZxDwJlSz4/AUKDDGsGjM1GZw1J0e9YthNoD4R9O0RZCaqz4N6LwqQlIXrkJxuK/XwWbPRvdfIa5CVQpOHJ5ZEypi8GBt47zOCLnjBJGo6M7y2El0m4fLkv6yXem77FT+hcC44+VX3HNnEIFGKgb8PcCQef1TDMWtc/itjLiXqSOD47wetR9FTeUWNXmhUqLbKwhVi80y/T06cdBnLsDOwfiztnSkRujYCITKI4CuSnuqMW2wOvQP4ttecK9zGZtjO3ZxTJexAmDRsvHm5NVloPgz2jtzC3/r8lqRoKjMWGF7rF2fqBJYH0BRgmquAfu47G4jzzAF07jOPz2Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mprH8CBs6kJotFYc4l8bEcsMgHQDFthgitTxTdlPGFQ=;
 b=epzmFKpNTixvcSWpzb9V8EDq4SluSUNMY9gSQ9yyoq+bReqfq34sSN+aQh9A/mJSfFW6TTp9oBArZgocfLRmHeefr4+qCIpVx4HiiYa02czT/v+HpAqeqMjEc6jJpMh6wjWyBEUbzq1lMyFqJNM76TXFILoRWjfN3p2MA4yqwVUAFLd6srHD6ucT9SwVOAHjYQ8leU4KY5VWUbby40+olt7Pb6aw48c600Ml0cF1ZjLsmroqNqgUtm2fj4VdUxT0aB7b+/Az1rFP6dUPl/dcK3atxvfe5Z4GRSTnVOZCeoNvnAnRx9MGy1o1Co1uGJIyloqR6q5Y6nFW7RuTffvkdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mprH8CBs6kJotFYc4l8bEcsMgHQDFthgitTxTdlPGFQ=;
 b=C1+2MlYecGYeAQ9LD3ZvA5mACfI1xuRXlwHWLKMSUWkt94UYA17OaeJoTFlIsUkaSSrzhOF/u7yRDMsTZyz+yvFLWkviKpdYD/GFJAOjETT9ves1pwzPwjdndzt9iLqUwcspMsoFiAFOabo/OUFYmQqWAkBOHCOG5Gt/JfvYrtNecMQMeK+IkGcriQ9KmqurAHk+GY5I5e3dlK+G8P9Genzf4xZeBf/B+P64fd4g15hDamccmFB1m6GG0EziEFSjfmTOIm0+vMghd9ke454AksM+A5UKa42eIN/2soRJ18jnBY+aQcUVUpYrhEQqOuxixWuTT6v5XW9a4bncc6sFzA==
Received: from DB7PR03CA0101.eurprd03.prod.outlook.com (2603:10a6:10:72::42)
 by PAWPR10MB8066.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:384::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 11:16:13 +0000
Received: from DB5EUR01FT093.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::c8) by DB7PR03CA0101.outlook.office365.com
 (2603:10a6:10:72::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 11:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT093.mail.protection.outlook.com (10.152.4.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.10 via Frontend Transport; Fri, 23 Jun 2023 11:16:13 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 23 Jun 2023 13:16:12 +0200
Received: from md3hr6tc.ad001.com (167.87.2.72) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 23 Jun 2023 13:16:12 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <luca.ceresoli@bootlin.com>, Andrej Valek <andrej.valek@siemens.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH v9 1/3] cve-check: add option to add additional patched CVEs
Date: Fri, 23 Jun 2023 13:14:56 +0200
Message-ID: <20230623111459.97933-3-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.2.72]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT093:EE_|PAWPR10MB8066:EE_
X-MS-Office365-Filtering-Correlation-Id: 57a0eb46-d6e9-4c1e-70e9-08db73db4178
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	mobbUSp6mrk/gkMkKyuqv4fkRFPcptQWIT/Nm1utvyJr+OevVLcGcpe6YED0No7smLIz+k9KPC8q4FRm8t7IoKMUOUOxT64iD+6tKFZRPPDbMnw0vZ3RK203V+ugGz2rIK6FO6Xb6efYu/gBUOxSn6vwDjawlrAjvWefMw73ANrPDpEjfe2hWtFutHTrDm6Kg7u342cuj8KqegpT5S5ZLQ8QTIxH58UmcbjNYaBaUtKNFdeFQ/PPamQ9Kp7gvnK9UUFbysHfm2ARNi/i6l8KvqSkEMRc7D+LscpmRaxDSMAwrGCHv1dX9d+Pwqi1xIui8O2EQr1A2ruaKBNi0JJum0r+V7EMZQ9TDdlVQ3VHqxzs4DRO6nwQs+L1KIst8D6TH6M89AFZC0+qoQdYAHilVzOPPBWJ21Xu47TG4kcEmewBqFk9pG4fr8A7GN6GfxxapGEAScAxDqyeufSrUgZQrNM1t0wn5M5si/zGSrpPkN73pg+fvVXpmU3x2N0QGi2jALwsj2AmPs9BLxZDvBC9z+oQOwMGqc5R9Cd365oZAWzVf7lfz/9pgf1Fz7ju5JgOoSXTsIlLcHvxUNCWUo5nmwdKSt5K6a56c6lc4bZIhjZq5wuM4CmU8LQPyV01v9fz75CY1EDnbCHprldTTIHeSc3Ds/hCbxwGqtlX6tNegqbv5rdj5NdA16DYhy2Dnb8pFkQQ8lRffUzpecO533zhygoAbEtMtX7CF3LWDATsOOj3O0YgB3YYp6fSmrqgVKc/I7VAghMyzr5EhrEueJEdWg==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(376002)(136003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(6666004)(54906003)(478600001)(47076005)(2616005)(36860700001)(336012)(83380400001)(956004)(40460700003)(82960400001)(40480700001)(86362001)(82740400003)(356005)(82310400005)(1076003)(2906002)(30864003)(107886003)(186003)(26005)(16526019)(36756003)(81166007)(5660300002)(4326008)(6916009)(70206006)(8676002)(316002)(70586007)(41300700001)(8936002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 11:16:13.5564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 57a0eb46-d6e9-4c1e-70e9-08db73db4178
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT093.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB8066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 11:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183322

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
 meta/classes/cve-check.bbclass | 81 ++++++++++++++++++++++++++++------
 meta/conf/bitbake.conf         |  1 +
 meta/conf/cve-check-map.conf   | 28 ++++++++++++
 meta/lib/oe/cve_check.py       | 25 +++++++++++
 4 files changed, 122 insertions(+), 13 deletions(-)
 create mode 100644 meta/conf/cve-check-map.conf

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclas=
s
index bd9e7e7445..55e3baf1ed 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -70,12 +70,28 @@ CVE_CHECK_COVERAGE ??=3D "1"
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
+# Settings the same status and reason for multiple CVEs is possible
+# via CVE_STATUS_GROUPS variable.
+#
+# CVE_STATUS_GROUPS =3D "CVE_STATUS_WIN CVE_STATUS_PATCHED"
+#
+# CVE_STATUS_WIN =3D "CVE-1234-0001 CVE-1234-0003"
+# CVE_STATUS_WIN[status] =3D "not-applicable-platform: Issue only applies =
on Windows"
+# CVE_STATUS_PATCHED =3D "CVE-1234-0002 CVE-1234-0004"
+# CVE_STATUS_PATCHED[status] =3D "fixed-version: Fixed externally"
+#
+# All possible CVE statuses could be found in cve-check-map.conf
+# CVE_CHECK_STATUSMAP[not-applicable-platform] =3D "Ignored"
+# CVE_CHECK_STATUSMAP[fixed-version] =3D "Patched"
+#
+# CVE_CHECK_IGNORE is deprecated and CVE_STATUS has to be used instead.
+# Keep CVE_CHECK_IGNORE until other layers migrate to new variables
 CVE_CHECK_IGNORE ?=3D ""
=20
 # Layers to be excluded
@@ -88,6 +104,24 @@ CVE_CHECK_LAYER_INCLUDELIST ??=3D ""
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
@@ -260,7 +294,7 @@ def check_cves(d, patched_cves):
     """
     Connect to the NVD database and find unpatched cves.
     """
-    from oe.cve_check import Version, convert_cve_version
+    from oe.cve_check import Version, convert_cve_version, decode_cve_stat=
us
=20
     pn =3D d.getVar("PN")
     real_pv =3D d.getVar("PV")
@@ -282,7 +316,12 @@ def check_cves(d, patched_cves):
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
@@ -413,6 +452,8 @@ def cve_write_data_text(d, patched, unpatched, ignored,=
 cve_data):
     CVE manifest if enabled.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     cve_file =3D d.getVar("CVE_CHECK_LOG")
     fdir_name  =3D d.getVar("FILE_DIRNAME")
     layer =3D fdir_name.split("/")[-3]
@@ -441,20 +482,27 @@ def cve_write_data_text(d, patched, unpatched, ignore=
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
@@ -516,6 +564,8 @@ def cve_write_data_json(d, patched, unpatched, ignored,=
 cve_data, cve_status):
     Prepare CVE data for the JSON format, then write it.
     """
=20
+    from oe.cve_check import decode_cve_status
+
     output =3D {"version":"1", "package": []}
     nvd_link =3D "https://nvd.nist.gov/vuln/detail/"
=20
@@ -576,6 +626,11 @@ def cve_write_data_json(d, patched, unpatched, ignored=
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
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9625a6fef4..30c813457e 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -831,6 +831,7 @@ include conf/distro/defaultsetup.conf
 include conf/documentation.conf
 include conf/licenses.conf
 require conf/sanity.conf
+require conf/cve-check-map.conf
=20
 ##################################################################
 # Weak variables (usually to retain backwards compatibility)
diff --git a/meta/conf/cve-check-map.conf b/meta/conf/cve-check-map.conf
new file mode 100644
index 0000000000..17b0f15571
--- /dev/null
+++ b/meta/conf/cve-check-map.conf
@@ -0,0 +1,28 @@
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


