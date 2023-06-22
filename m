Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C095C3DA41
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 06:59:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web11.5883.1687417187737404524
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 23:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=KLPI9nvU;
 spf=pass (domain: siemens.com, ip: 40.107.22.56, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HW6Rlv7z4xMPunsoBG8MU29pZKHGGK7PSb6r8V9HQpY1PEezwD9ll72gLLmP2j2NgqOdBglF+FmCl9OAKitEcbmbm3AJ5WgnCWlqpOAE5cg/BTXg1VBb1U5rpIjwDuFh9q7YrF8xxFRrgeBJzUMJYKpGYEZW+GQsXp7B5WoPMISXHTAvZNoADAM1zb2Lk+ps13Ayr9ZIStFib52zxtEWG+foOkUqrAwCa35kwb4ym/Eg08tR6rMY/9ipYLgilVmw8d4o7oA466FehRpB01waXgcbGtjEzmZXCkXyOJFLdf6FwAWyYAZp+SAqjL5v/JNuWiaX9oMFee2VuaOsmgynKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r18IERUtEYnRNNh2xyp5KfJmWo1wcV16sXNf2BpCDYQ=;
 b=e/cFGtGvKuyNvfiERsKvHmBoVvz0g+6r7DFNQ2qzs2K+pX7rneijOH0XKmxM8wW8TnAG50B39/+dxsF1I6ccqdMDmDkrtmWWNNHiBGaEx+XEJv10y6bwWzwvREN3IOaUCjCKU/uJZszkpdvd2OcAKY184JN1uOav5p6Bthd9FQAo91jD+6yUWjy7vTgdWdOKkJYEis8++ZeWpB4NH/di2A8w97J9YaQo/nDF8h8YZH9iLLzel92fgHPJzroakPmZhd744201p4Skt6VPTQBPQdEwxzzfmlkdHGpnlM9EcGcBP7viezjTRwb69IjWiA8YH1jIY/vl8VIfal/hayjSqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r18IERUtEYnRNNh2xyp5KfJmWo1wcV16sXNf2BpCDYQ=;
 b=KLPI9nvUY+S1nlwlFDHxgoYCvD1BJ348e9fRsxsawqEj0jsiDb3J78MJxO6r1L8wtvH6IICiQwohog0oflOHRYRQSqfjKSSWs2lJMMO2qzp0TC/PolFWEtBMjxwM6ejx25mClf+l7cglLILHXptFbVVzK7W9AGk4mZBqzFzXeZK46XkkwcJOlyYQdk5yigrs8J9Vbf8vxobSdOUcEKpZMmZzDXB40rw78B4Ml6KlkvGBYKbbI7Awy1CStYulqBP8KJdCZW1Ox4VpKYQ6NGdWQXhWr48kgxb1MeoKGqKef8gWAab+kQbWrQi8TJSgp9YN0jCeNZjK2XLQlFxRn6U4BQ==
Received: from GV3P280CA0102.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:8::27) by
 VI1PR10MB3695.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:137::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Thu, 22 Jun
 2023 06:59:44 +0000
Received: from HE1EUR01FT024.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:150:8:cafe::20) by GV3P280CA0102.outlook.office365.com
 (2603:10a6:150:8::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24 via Frontend
 Transport; Thu, 22 Jun 2023 06:59:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 HE1EUR01FT024.mail.protection.outlook.com (10.152.0.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 06:59:43 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 08:59:42 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.106.9) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 08:59:42 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>, Peter Marko
	<peter.marko@siemens.com>
Subject: [OE-core][PATCH v7 1/3] cve-check: add option to add additional patched CVEs
Date: Thu, 22 Jun 2023 08:59:03 +0200
Message-ID: <20230622065914.37448-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.106.9]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HE1EUR01FT024:EE_|VI1PR10MB3695:EE_
X-MS-Office365-Filtering-Correlation-Id: 597cd30e-f8f3-4763-a090-08db72ee41d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	WzXUGfIFpABJsWv2v47XVgzootfxHTcBTXvXRxHiBPMvffL8cJ0/wbl4MUyZjbvIXPKiu9YfMygVxpo0ZCuVmlfYf3hr4Of1I5syz7f3uq8epTEweCxi+BXoTbDB8tBkeWJ6ll0bFgSTCWJ6vjBiKpobzYCym7RekvuJ5ylutrBdjromypB+ewz3WFsTHJJIHDQEC44lxHELfDRGuP8U6VLXMJ1ZcVhq2vu2Te6XnmUHJzSm3gVc2qlO82CJ99SV7ZrW3d5VZTzm/V0LGlDWQmPFPJILQT8Y+Qv7c6KX8SNNRWzyiyj9ka6WceJYxhCVgZibLWte0r1WejiD548lJyo6G583NpUX+RSJX/29NUdawbzEe/hCw3iqxmbLSKY4M7wbYej7L16NrgO2ifao12J5g4oFgSP+0/m3zGN9iecutK3yxuIGCVMVuhYUuq8+sxrxwblZreFhUL0k491NOgRY9LE74peZNAge8PGGLoXpNcKxnfqaivj0ogj0Hny11s/IUose/BrEJ4wHCdm6xdsl6jQNV6oFZ1WKB/HU/052rDIvn9EcI/3jqMsYpYD4sfv4WF8KmZ1gUbi7MIw3mUWIRNy6FTNeDUKyjUtEPlTd7I6Eu88DKffyr9cesJfMeMlz0WRjNa/FZ+1IASnlCsoIv867TL/iG5UyQSdcv1tcpU3TnfvNMpH1hfi3z/B3E4sFP4BDBSEVdogrF/wuLK8PR8t1uNPCW3cES4nf0UA8alnr8lGUkKQyossgMffzMvHPLMHb2WGGJnPAx4QJ5Q==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(396003)(376002)(136003)(39860400002)(451199021)(36840700001)(46966006)(40470700004)(16526019)(70206006)(36756003)(70586007)(54906003)(107886003)(6666004)(478600001)(1076003)(186003)(2906002)(41300700001)(8936002)(8676002)(40480700001)(6916009)(44832011)(81166007)(82740400003)(5660300002)(356005)(316002)(4326008)(82960400001)(26005)(47076005)(83380400001)(40460700003)(336012)(956004)(2616005)(36860700001)(82310400005)(86362001)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 06:59:43.4396
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 597cd30e-f8f3-4763-a090-08db72ee41d7
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	HE1EUR01FT024.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3695
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 06:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183225

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


