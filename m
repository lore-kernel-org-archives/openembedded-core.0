Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A40BBF436A1
	for <webhook@archiver.kernel.org>; Fri, 17 Apr 2026 13:24:21 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44942.1776432259588381154
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Apr 2026 06:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector1 header.b=zEUfYtz+;
 spf=pass (domain: ericsson.com, ip: 52.101.70.68, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CBai93GFQAAtRA/cVtGH7g3iWKincTbeNtKiue3y33QuxA9QnoR9M1BFIPOy/b19YslIG+4zUwVPpHDHBI1HoOnhoffrlQtmovOTDjGLavGatxlXPeofJVYdxX04BZBXJHSudHAQ9tuItxT214SpFBIVs7LDgIJElr4GMfVkZqtE/kC154alvdjE49gcwx0LGWW/Ogx6in060tPpYjl4N5q8tl1G12N2wSTSKOdMHurHgGcL8FDt20i6JZh4FqnCZjicZ2jywgYBkm8103QwYXxRTIvWrv9iqedMLrLraMZGvgsB/iKuyfx7Y7brPWvYkIYOLlOWPOYJnuV2SSLNGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gpFjwPXWXb+xtAP69Q63W/OgLI2FVYALr9Bah+HfGRs=;
 b=mxIrOFtxBOBZkz5K+Bsd9SMl68sZKQgU8z5aHQ9jFmucjmKh//DimyHBtII/5ZQgl2QbEKJNvrIvbWQeh/1f1LqYe7R6iJRcGsFJWRuo7w0zwctI/xeT6VmVQdNPOiNPtAHf3UBbsbhUOir1B1XVe59DALpR3OYDmTTHbo49bS7uAGh3nxIdfdKl5OoHVq6zgGMj1AW+cPkZPGzwnvG3oCvnfU2JgNVj2b7Z4E2isw9KUU5axU94VYeZqS5T7LCZfcaKgnJUvjmERiOxSwiPylpXxBCmGJSleOhaBso+Il+uNINsFIt5tILiG0yHT6POyrx+l38fOGUrhgQ6j3HUZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gpFjwPXWXb+xtAP69Q63W/OgLI2FVYALr9Bah+HfGRs=;
 b=zEUfYtz+dlGWOhuoiOEymhYZMDDLqv25GswX6V7t1TcdRTe8hleTrB1CNzMCnVt5zz9vgl0zm4axIWDzusMjvcpngjlIEUq5BR5L8oHabhiiSdp4FWhupI/LSm8O3VDE+0qGIHNDVdZIW9jop9xm9mBMo0jejuB7rRy93aIImGt7JvzBV5rWW4RXpKFIZM4PnzrQUkzyRVi0c4G1/t4LKY29Lnoen5qm6DDW7janhy6/BhXq3nPzk86hHa1fCPdGY8JSZYnRp60MOTXfEjL15HLDaCpCVm+phfLK7f84EUXufahaLEIl7eqnS9kyxn0u9rjvxmoF9HTrG5CViXKQVw==
Received: from DU7P251CA0012.EURP251.PROD.OUTLOOK.COM (2603:10a6:10:551::18)
 by AMVPR07MB12305.eurprd07.prod.outlook.com (2603:10a6:20b:775::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.21; Fri, 17 Apr
 2026 13:24:14 +0000
Received: from DB5PEPF00014B8D.eurprd02.prod.outlook.com
 (2603:10a6:10:551:cafe::d1) by DU7P251CA0012.outlook.office365.com
 (2603:10a6:10:551::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.52 via Frontend Transport; Fri,
 17 Apr 2026 13:24:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB5PEPF00014B8D.mail.protection.outlook.com (10.167.8.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Fri, 17 Apr 2026 13:24:13 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Fri, 17 Apr 2026 15:24:13 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 393A44020B70;
	Fri, 17 Apr 2026 15:24:13 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 22E30700CF09; Fri, 17 Apr 2026 15:24:13 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <benjamin.robin@bootlin.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] improve_kernel_cve_report: use numeric versions instead of cpeApplicability
Date: Fri, 17 Apr 2026 15:24:09 +0200
Message-ID: <20260417132409.1638132-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8D:EE_|AMVPR07MB12305:EE_
X-MS-Office365-Filtering-Correlation-Id: dc4a263f-2ca1-4a93-7fde-08de9c849e61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	OswJqFWRBf58Zbuk27Qgs9Fd4TUr6mszpnl1ENUCRqwDaEtd0TlTIyiHLtE+YWu8c456YrGP4Tz0mkIRuFVQYI8bJaO4uPtaZfNkEC4ma4W4d5DyZFRrEx2JDbvMn9rwKP9Isa3RuAW60NdSDILeUDiNGKdY85fXiwX8Qm1HXG1rZHBNZiBhCbBPjkF2eh8Yo2ePfBlI1MdHU7QdHDuGKClf9Gz0dEUQSs+dKiOE7+p4GBDmv1qqIWAJ7wyaEg7JY9MEpcr+M0xYKtpuUDG+bZIdJKuSmgD5uFYRt2fuBGwq/qGjsV+VwbzVQt7p5zc48NLVUtInHBCd6Q+c7rrZnW08Y1cUzJ3Ei3O9qvHppl6QpwR4y1KU372to4pVhy67L6gfr65KA7J9NVw00rNmtBBrBuFozoCca4cWMr8xaoQSh5+gdyuVr5ujZClZZ8/MGRtgIKK5M0cjCcqzHgGWLAWq44YB6l31jxy4W3ZdUv5X6uvPMOcImKpKdvA3qSOEaMaXw+tv5HD5EiwTeR7Z2dB4G81f7z+W6Ef+PpZnS5Dk+DZCx7yXDQbv87blHgtnarHFnK9Pkfm4lRt3lWRA2UlGKblDB/wh3tOwghgZbchptXxoR24DCLqqfom9FyaQtP8R14JB6BJd+P9JYUaq8VGmptsVDrg4wuR0eYYevfQjZaQz1V86bdc71ogPW5gr3iP1TUc7WpxeFFz1aT4Rg03OYNwnF59Rzcl6Sj72iClcKO8WDIASIEPZ6h1R3WH8fKT/JrIW1kGZBmt4YHsSvw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	iD8U1T2GCmY60/x1L1X42pmLxbFLbiSkcKH0mV9Mf1muVs5C5z0mPSmae2pQ+K5zvIhhn/r6SIaB92fKVDDTCJz6B6UrUQzvpr9J1YwoJtB2SE+xWJtCpHDecgryJ9/5Kcm02BGfMWvVeovfFoeURigdoD6jA0k/ItLD9bWibV+DgZqoxMKtG1bebIFVGvV7zawMI9BMTDiutuy+HZ21X6DkOFzOg7lijgYJD+Y1egUjqrzC7IUv4K7Ya0h1RZxUyUi3NilIVRHvE8ug5kbwRG1lzwqF8sbrFmVBjDxHD2JDttgt7LhWzh/E9SwO7bUUfe4f8vRUHc5VKqw0+peDttm9vUfQR9eAjg8L6pn4K0+Rt5+gDO8yfZTv58U/+hzZ8GDx8b8dEKqK99v+UFfmJhNWf+2DU/KgZka6I38zXd/hijYT2Fqe6hSUtkIFmBDS
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 13:24:13.9181
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc4a263f-2ca1-4a93-7fde-08de9c849e61
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5PEPF00014B8D.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMVPR07MB12305
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Apr 2026 13:24:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/235499

From: Daniel Turull <daniel.turull@ericsson.com>

git shas or versions should be use instead of cpeApplicability.
Reuse the same logic as generate-cve-exclusions, so outputs are consistent.

cpeApplicability does not provide accurate version information and for some
 CVEs the information is not the same. This came from a discussion that
we had with Greg Kroah-Hartma, member of the Linux security team.

Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/improve_kernel_cve_report.py | 247 ++++++++-----------
 1 file changed, 104 insertions(+), 143 deletions(-)

diff --git a/scripts/contrib/improve_kernel_cve_report.py b/scripts/contrib=
/improve_kernel_cve_report.py
index b386c9383a..a5458f8dd3 100755
--- a/scripts/contrib/improve_kernel_cve_report.py
+++ b/scripts/contrib/improve_kernel_cve_report.py
@@ -82,16 +82,59 @@ def get_kernel_cves(datadir, compiled_files, version):
                 "description": f"Rejected by CNA"
             }
             continue
-        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g"]):
+        if any(elem in cve_file for elem in ["review", "reverved", "testin=
g", "tmp"]):
             continue
=20
-        is_vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected_versions =3D get_cpe_applicability(cve_info, ve=
rsion)
+        first_affected, fixed, backport_ver =3D get_fixed_versions(cve_inf=
o, base_version)
=20
-        logging.debug("%s: %s (%s - %s) (%s - %s)", cve_id, is_vulnerable,=
 better_match_first, better_match_last, first_affected, last_affected)
+        logging.debug("%s: first_affected=3D%s fixed=3D%s backport=3D%s", =
cve_id, first_affected, fixed, backport_ver)
=20
-        if is_vulnerable is None:
-            logging.warning("%s doesn't have good metadata", cve_id)
-        if is_vulnerable:
+        if not fixed:
+            logging.warning("%s has no known resolution", cve_id)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Unpatched",
+                "detail": "known-affected",
+                "summary": description,
+                "description": "No known resolution"
+            }
+            vulnerable +=3D 1
+            continue
+        elif first_affected and version < first_affected:
+            logging.debug('%s - fixed-version: only affects %s onwards',
+                          cve_id, first_affected)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Patched",
+                "detail": "fixed-version",
+                "summary": description,
+                "description": f"only affects {first_affected} onwards"
+            }
+            not_vulnerable +=3D 1
+        elif fixed <=3D version:
+            logging.debug("%s - fixed-version: Fixed from version %s",
+                          cve_id, fixed)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Patched",
+                "detail": "fixed-version",
+                "summary": description,
+                "description": f"Fixed from version {fixed}"
+            }
+            not_vulnerable +=3D 1
+        elif backport_ver and backport_ver <=3D version:
+            logging.debug("%s - cpe-stable-backport: Backported in %s",
+                          cve_id, backport_ver)
+            cves[cve_id] =3D {
+                "id": cve_id,
+                "status": "Patched",
+                "detail": "cpe-stable-backport",
+                "summary": description,
+                "description": f"Backported in {backport_ver}"
+            }
+            not_vulnerable +=3D 1
+        else:
+            # Vulnerable - may need backporting
             is_affected =3D True
             affected_files =3D []
             if check_config:
@@ -108,87 +151,21 @@ def get_kernel_cves(datadir, compiled_files, version)=
:
                     "summary": description,
                     "description": f"Source code not compiled by config. {=
sorted(affected_files)}"
                 }
-                not_applicable_config +=3D1
-            # Check if we have backport
+                not_applicable_config +=3D 1
             else:
-                if not better_match_last:
-                    fixed_in =3D last_affected
-                else:
-                    fixed_in =3D better_match_last
+                fixed_in =3D backport_ver if backport_ver else fixed
                 logging.debug("%s needs backporting (fixed from %s)", cve_=
id, fixed_in)
-                cves[cve_id] =3D {
-                        "id": cve_id,
-                        "status": "Unpatched",
-                        "detail": "version-in-range",
-                        "summary": description,
-                        "description": f"Needs backporting (fixed from {fi=
xed_in})"
-                }
-                vulnerable +=3D 1
-                if (better_match_last and
-                    Version(f"{better_match_last.major}.{better_match_last=
.minor}") =3D=3D base_version):
-                    fixed_as_later_backport +=3D 1
-        # Not vulnerable
-        else:
-            if not first_affected:
-                logging.debug("%s - not known affected %s",
-                              cve_id,
-                              better_match_last)
                 cves[cve_id] =3D {
                     "id": cve_id,
-                    "status": "Patched",
-                    "detail": "version-not-in-range",
+                    "status": "Unpatched",
+                    "detail": "version-in-range",
                     "summary": description,
-                    "description": "No CPE match"
+                    "description": f"Needs backporting (fixed from {fixed_=
in})"
                 }
-                not_vulnerable +=3D 1
-                continue
-            backport_base =3D Version(f"{better_match_last.major}.{better_=
match_last.minor}")
-            if version < first_affected:
-                logging.debug('%s - fixed-version: only affects %s onwards=
',
-                              cve_id,
-                              first_affected)
-                cves[cve_id] =3D {
-                    "id": cve_id,
-                    "status": "Patched",
-                    "detail": "fixed-version",
-                    "summary": description,
-                    "description": f"only affects {first_affected} onwards=
"
-                }
-                not_vulnerable +=3D 1
-            elif last_affected <=3D version:
-                logging.debug("%s - fixed-version: Fixed from version %s",
-                              cve_id,
-                              last_affected)
-                cves[cve_id] =3D {
-                    "id": cve_id,
-                    "status": "Patched",
-                    "detail": "fixed-version",
-                    "summary": description,
-                    "description": f"Fixed from version {last_affected}"
-                }
-                not_vulnerable +=3D 1
-            elif backport_base =3D=3D base_version:
-                logging.debug("%s - cpe-stable-backport: Backported in %s"=
,
-                              cve_id,
-                              better_match_last)
-                cves[cve_id] =3D {
-                    "id": cve_id,
-                    "status": "Patched",
-                    "detail": "cpe-stable-backport",
-                    "summary": description,
-                    "description": f"Backported in {better_match_last}"
-                }
-                not_vulnerable +=3D 1
-            else:
-                logging.debug("%s - version not affected %s", cve_id, str(=
affected_versions))
-                cves[cve_id] =3D {
-                    "id": cve_id,
-                    "status": "Patched",
-                    "detail": "version-not-in-range",
-                    "summary": description,
-                    "description": f"Range {affected_versions}"
-                }
-                not_vulnerable +=3D 1
+                vulnerable +=3D 1
+                if (backport_ver and
+                    Version(f"{backport_ver.major}.{backport_ver.minor}") =
=3D=3D base_version):
+                    fixed_as_later_backport +=3D 1
=20
     logging.info("Total CVEs ignored due to not applicable config: %d", no=
t_applicable_config)
     logging.info("Total CVEs not vulnerable due version-not-in-range: %d",=
 not_vulnerable)
@@ -276,70 +253,54 @@ def check_kernel_compiled_files(compiled_files, cve_i=
nfo):
                 is_affected =3D True
     return is_affected, files_affected
=20
-def get_cpe_applicability(cve_info, v):
+def get_fixed_versions(cve_info, base_version):
     '''
-    Check if version is affected and return affected versions
+    Get fixed versionss
     '''
-    base_branch =3D Version(f"{v.major}.{v.minor}")
-    affected =3D []
-    if not 'cpeApplicability' in cve_info["containers"]["cna"]:
-        return None, None, None, None, None, None
-
-    for nodes in cve_info["containers"]["cna"]["cpeApplicability"]:
-        for node in nodes.values():
-            vulnerable =3D False
-            matched_branch =3D False
-            first_affected =3D Version("5000")
-            last_affected =3D Version("0")
-            better_match_first =3D Version("0")
-            better_match_last =3D Version("5000")
-
-            if len(node[0]['cpeMatch']) =3D=3D 0:
-                first_affected =3D None
-                last_affected =3D None
-                better_match_first =3D None
-                better_match_last =3D None
-
-            for cpe_match in node[0]['cpeMatch']:
-                version_start_including =3D Version("0")
-                version_end_excluding =3D Version("0")
-                if 'versionStartIncluding' in cpe_match:
-                    version_start_including =3D Version(cpe_match['version=
StartIncluding'])
-                else:
-                    version_start_including =3D Version("0")
-                # if versionEndExcluding is missing we are in a branch, wh=
ich is not fixed.
-                if "versionEndExcluding" in cpe_match:
-                    version_end_excluding =3D Version(cpe_match["versionEn=
dExcluding"])
-                else:
-                    # if versionEndExcluding is missing we are in a branch=
, which is not fixed.
-                    version_end_excluding =3D Version(
-                        f"{version_start_including.major}.{version_start_i=
ncluding.minor}.5000"
-                    )
-                affected.append(f" {version_start_including}-{version_end_=
excluding}")
-                # Detect if versionEnd is in fixed in base branch. It has =
precedence over the rest
-                branch_end =3D Version(f"{version_end_excluding.major}.{ve=
rsion_end_excluding.minor}")
-                if branch_end =3D=3D base_branch:
-                    if version_start_including <=3D v < version_end_exclud=
ing:
-                        vulnerable =3D cpe_match['vulnerable']
-                    # If we don't match in our branch, we are not vulnerab=
le,
-                    # since we have a backport
-                    matched_branch =3D True
-                    better_match_first =3D version_start_including
-                    better_match_last =3D version_end_excluding
-                if version_start_including <=3D v < version_end_excluding =
and not matched_branch:
-                    if version_end_excluding < better_match_last:
-                        better_match_first =3D max(version_start_including=
, better_match_first)
-                        better_match_last =3D min(better_match_last, versi=
on_end_excluding)
-                        vulnerable =3D cpe_match['vulnerable']
-                        matched_branch =3D True
-
-                first_affected =3D min(version_start_including, first_affe=
cted)
-                last_affected =3D max(version_end_excluding, last_affected=
)
-            # Not a better match, we use the first and last affected inste=
ad of the fake .5000
-            if vulnerable and better_match_last =3D=3D Version(f"{base_bra=
nch}.5000"):
-                better_match_last =3D last_affected
-                better_match_first =3D first_affected
-    return vulnerable, first_affected, last_affected, better_match_first, =
better_match_last, affected
+    first_affected =3D None
+    fixed =3D None
+    fixed_backport =3D None
+    next_version =3D Version(str(base_version) + ".5000")
+    for affected in cve_info["containers"]["cna"]["affected"]:
+        # In case the CVE info is not complete, it might not have default =
status and therefore
+        # we don't know the status of this CVE.
+        if not "defaultStatus" in affected:
+            return first_affected, fixed, fixed_backport
+        if affected["defaultStatus"] =3D=3D "affected":
+            for version in affected["versions"]:
+                v =3D Version(version["version"])
+                if v =3D=3D Version('0'):
+                    #Skiping non-affected
+                    continue
+                if version["status"] =3D=3D "unaffected" and first_affecte=
d and v < first_affected:
+                    first_affected =3D Version(f"{v.major}.{v.minor}")
+                if version["status"] =3D=3D "affected" and not first_affec=
ted:
+                    first_affected =3D v
+                elif (version["status"] =3D=3D "unaffected" and
+                    version['versionType'] =3D=3D "original_commit_for_fix=
"):
+                    fixed =3D v
+                elif base_version < v and v < next_version:
+                    fixed_backport =3D v
+        elif affected["defaultStatus"] =3D=3D "unaffected":
+            # Only specific versions are affected. We care only about our =
base version
+            if "versions" not in affected:
+                continue
+            for version in affected["versions"]:
+                if "versionType" not in version:
+                    continue
+                if version["versionType"] =3D=3D "git":
+                    continue
+                v =3D Version(version["version"])
+                # in case it is not in our base version
+                less_than =3D Version(version["lessThan"])
+
+                if not first_affected:
+                    first_affected =3D v
+                fixed =3D less_than
+                if base_version < v and v < next_version:
+                    fixed_backport =3D less_than
+
+    return first_affected, fixed, fixed_backport
=20
 def copy_data(old, new):
     '''Update dictionary with new entries, while keeping the old ones'''
--=20
2.43.0


