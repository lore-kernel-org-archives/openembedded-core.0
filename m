Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E72C7CA5FD9
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:54:29 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.28])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6367.1790927666054962728
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:54:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=hwzB4QUI;
 spf=none, err=SPF record not found (domain: ericsson.com, ip: 52.101.66.28, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVLNNdw1IHxlL7QIKHvT+qE8lR2Qt6zoXrg1uK44k2CQFh8xUKMTLq8I0mXEY1x6C82GhFN5hd9ezSmYCNxJ+sXhg8Z4YQRxwJFGwuip//YC1Rj57CdVSjH832KUPcruIl8expX3zatmG71TNGguBkS0Q5WummGQhfEpla86qJ2wR+8uiBk5rWtUV5hXd8lXaczA2pBRWm0P1SNrP+Lmm08Pc0c7FKKQUDQe1RYNDV49G3bOX+INMa2OuwmmGlHE0HlYUKooN+6Bp7WG92zqB7SWsUDQoYSiwJKl34rS2Oie4Zd99dOX+toZhp+uYD1hfs5UZNlejfPeKHtr6O/uHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=WqonG05k8HPZBRGLL3VBsr+sY3EatnRJdoYJ1jyfTq6QHLi9mXi11O2X1YmQdrSbXkLpLak2orojpnzlnO83cea7E/QbIBmgjwF9N55LYromtEbAuYLPfDwDdHFh9Y1vNKFCR+5n+f+NsinsTD0WfzfoqbD7ZW70ZRZwgk6ijvOCAcZa86fkP8NAcHd6boKevqVmfQrdxRo6l9NkO8ZgcoKenajOlwSHq5qTEjOgUcS02IJuq1cj5r1Q7GpKx6ZN60AKonkAXindRkqacSsY8DHcChqylIevQpAZORSJa66mfh6TNIJ/6s6wuroLamZr92OM4k5f+71BugidQ7+HIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=hwzB4QUIK4DcxjGi2BBMrN3KlS+ritRFGnIb7SQBggEkoDdNMTa13QryvZro7GkSwY1vD/XQjyd+YvFqNbHWREZL5yzEAwQnO8YHFPA8YScZCeorqbdpC0SjOq0I66r/UxuD1udXQ3IoSAjLB1X2zmXIFa9SYODWCJcpfk8J8+NrZBX5pWvJ0RG2pszfiJXcu6H7ukNcWwscr8HMrrJ92YC2bZv2m2/8Pr9WSP+NurJbLb22plumOCHvMGhYEpdy4fqPfaIXau+ow6A0zmNrF4z+5JqkW76Ec6VxBSjjhReWcgP9ACw/O4ZDVCgXPoXitZ+a4paneWRXDtaD5KJarA==
Received: from DU2PR04CA0228.eurprd04.prod.outlook.com (2603:10a6:10:2b1::23)
 by DU2PR07MB9436.eurprd07.prod.outlook.com (2603:10a6:10:497::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Fri, 2 Oct
 2026 07:54:19 +0000
Received: from MAD0EPF000008B4.eurprd04.prod.outlook.com
 (2603:10a6:10:2b1:cafe::8e) by DU2PR04CA0228.outlook.office365.com
 (2603:10a6:10:2b1::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.18 via Frontend Transport; Fri, 2
 Oct 2026 07:54:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MAD0EPF000008B4.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 07:54:19 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.63) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 2 Oct 2026 09:54:18 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 6FB1C4020C3B;
	Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 43FC3700CF29; Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v4 3/3] scripts/contrib: add spdx-release-date-report.py
Date: Fri, 2 Oct 2026 09:54:14 +0200
Message-ID: <20261002075414.2311840-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002075414.2311840-1-daniel.turull@ericsson.com>
References: <20261002075414.2311840-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B4:EE_|DU2PR07MB9436:EE_
X-MS-Office365-Filtering-Correlation-Id: 81774e75-66a3-47ff-d29a-08df205a5d7a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|82310400026|36860700016|376014|260925021911599003|3023799007|11063799006|6133799003|10067099003|260925022911599003|260925021311599003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	ptgsAaId/FvXKPu1XquILQQE1lHo+ikD2n8LlGJ4Lm3ruMvMwZdxGmwYEhwtqpFpz1w4qw3nr/3OatYzisSG/te6oIYj40UcwBhOjDEngfs5ug65FMGtl1kSeZNF9q664hePRmlBSYTnTLm2e2Lg5eO8b1NO6NU2mXTbSbdJ9QyZgS7HzM0gFegLe9HsxBrNLbVtySO2SJtMfBE3Rd3fKZXt2kKVSOLe5O/ubSV0CqkvPDbBcg9UnXmU5UsoHL2Zv5p/hn41V+6RPs4Ze3jlLVx0pJrivRBgDKf9XxKJR2DKNVX+fsrmSieARpRKuM0zqmYtQUnXLF7JcE3pn+9ZjDQ7MURpKuW/0oGWNjOt1QEdwZqnI4ZBjW1jRPu90VDI0nCsrReR9pM53O1MN9drgVSZa9bvSUErxZx6C9ZDfpSwZ6iRPbR4uFbujA/lR/KjHrPCa5kWE+drmfzFeR1akpOQ5eIziTF4r5WqSGgtalp1MjcGumwyrwb/S2jpYpRSXSSWPwnKH6MT4iXgM1S1Yecjeg1mDMKDPNUhWlK5WolYmH1C49D+CfNn5Dh4aFhSuTbRYV3jDYVVu0uNdfDsWEF1QFnTZsw4G1d1mQOlSfBYs+Nfc1cjiEWANDFzNdJY+KzMn3IJkcQUk2lsgwi5Sw5kwIfK3A7hepbdwCXhLY8ledpYgrRjFpvF1prdY2Ybo81vSsYYyBavGJ7vUqhMHA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(82310400026)(36860700016)(376014)(260925021911599003)(3023799007)(11063799006)(6133799003)(10067099003)(260925022911599003)(260925021311599003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	yrbVGAZNec3hUoC2cSp2kOu/eHTzm6ERwV22i2OTtiP4gduefKfeo2j4r6UL/Kjt1mFBiapc3gZ0ByyhH9/CsgGlQNzrV3vleZG/ihIOlo6J8xipDQt3bV5rSKHNybVh1yeDzMPFTuHN8Z+xj8ZWBVFwmIL/4HiBGcifpAoI+zjU3/8RFV3H18v2DljNcY8u3zAUNJMpLcgeai9sVpHwbeUXmyiwm6XeNqzj2lUWxqlx2FbOwUS8ubuEMVay9CJufs/95Dmmb+3LeSC+B2u4oondQr3gtJ2qWYLYO87fuUMoNu1gxyX+Gv47zMD/5+DYWsSeZIbvU3/+Ld0GRbhLkh7aEnQwzRu60X0XeZVzWIgpgU0jdRJXHq5j8FTvzF5hSI6tLJn24/BGuHley4+scV5rVgSRINijlXlsDFJBwuUrCMwnJKGQ92xiOqW0Y6Id
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:54:19.6111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81774e75-66a3-47ff-d29a-08df205a5d7a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008B4.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB9436
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247086

From: Daniel Turull <daniel.turull@ericsson.com>

Reports each recipe's releaseTime (added by the create-spdx-3.0 patch)
from either a DEPLOY_DIR_SPDX tree or a single merged image SBOM. Used
to spot-check release dates across a build and surface recipes missing
one; helped find the SOURCE_DATE_EPOCH_FALLBACK leak fixed by the
preceding patch.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
v4:
- Rework to match the new placement of the releaseTime.
---
 scripts/contrib/spdx-release-date-report.py | 191 ++++++++++++++++++++
 1 file changed, 191 insertions(+)
 create mode 100755 scripts/contrib/spdx-release-date-report.py

diff --git a/scripts/contrib/spdx-release-date-report.py b/scripts/contrib/=
spdx-release-date-report.py
new file mode 100755
index 0000000000..71420d0e24
--- /dev/null
+++ b/scripts/contrib/spdx-release-date-report.py
@@ -0,0 +1,191 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Author: Daniel Turull <daniel.turull@ericsson.com>
+#
+# Reports, per recipe, whether a valid releaseTime was recorded in SPDX
+# 3.0.1 output.
+#
+# AI-Generated: Uses Kiro (Claude)
+
+import argparse
+import csv
+import glob
+import json
+import logging
+import os
+import re
+import sys
+
+
+# Each do_create_spdx software_Package's spdxId is
+# "<SPDX_NAMESPACE_PREFIX>/<PN>-<uuid5>/<unihash>/...", so the recipe name
+# can be recovered directly from the id without walking relationships.
+RECIPE_FROM_SPDX_ID_RE =3D re.compile(
+    r"^.*/([^/]+)-[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]=
{12}/"
+)
+
+
+def recipe_name_from_spdx_id(spdx_id):
+    """Extract the PN that generated an element, from its spdxId, or None.=
"""
+    match =3D RECIPE_FROM_SPDX_ID_RE.match(spdx_id or "")
+    return match.group(1) if match else None
+
+
+def load_jsonld_graph(path):
+    """Return the @graph list of a SPDX 3.0.1 JSON-LD document, or [] on e=
rror."""
+    try:
+        with open(path, "r", encoding=3D"utf-8") as f:
+            data =3D json.load(f)
+    except (OSError, json.JSONDecodeError) as e:
+        logging.warning("Skipping %s: %s", path, e)
+        return []
+    return data.get("@graph", [])
+
+
+def extract_release_dates(elements):
+    """
+    Map recipe name -> releaseTime (or None), for each downloaded source
+    software_Package found in elements. The recipe name is recovered from
+    each package's own spdxId (see recipe_name_from_spdx_id). For a given
+    name, the first package with a releaseTime wins; if none have one, the
+    name still appears, mapped to None.
+    """
+    release_dates =3D {}
+    for element in elements:
+        if element.get("type") !=3D "software_Package":
+            continue
+        if not element.get("software_downloadLocation"):
+            continue
+        name =3D recipe_name_from_spdx_id(element.get("spdxId"))
+        if not name:
+            continue
+        release_dates.setdefault(name, None)
+        release_time =3D element.get("releaseTime")
+        if release_time and not release_dates[name]:
+            release_dates[name] =3D release_time
+    return release_dates
+
+
+def iter_spdx_elements(path):
+    """Yield @graph elements from path: every build-*.spdx.json under path
+    if it's a DEPLOY_DIR_SPDX tree, or path's own @graph if it's a single
+    SPDX JSON-LD file (e.g. a merged image SBOM).
+
+    Only build-*.spdx.json is read for a DEPLOY_DIR_SPDX tree: it's the
+    output of do_create_spdx, the only recipe task that calls
+    add_download_files and so the only one that can carry
+    software_downloadLocation/releaseTime. The other per-recipe documents
+    (static-*.spdx.json from the fetch-free do_create_recipe_spdx, and
+    package-*.spdx.json for binary packages) never have that data.
+    """
+    if os.path.isdir(path):
+        build_pattern =3D os.path.join(path, "**", "builds", "build-*.spdx=
.json")
+        for build_path in sorted(glob.glob(build_pattern, recursive=3DTrue=
)):
+            yield from load_jsonld_graph(build_path)
+    else:
+        yield from load_jsonld_graph(path)
+
+
+def _to_row(name, release_date):
+    return {
+        "recipe": name,
+        "release_date": release_date or "",
+    }
+
+
+def build_report(path):
+    """
+    Build the report: [{"recipe": ..., "release_date": ...}], from either =
a
+    DEPLOY_DIR_SPDX tree or a single merged image SBOM file.
+    """
+    release_dates =3D extract_release_dates(iter_spdx_elements(path))
+    return [_to_row(name, release_dates[name]) for name in sorted(release_=
dates)]
+
+
+def drop_redundant_native(report):
+    """Drop foo-native rows when foo is also present in the report."""
+    names =3D {r["recipe"] for r in report}
+    return [
+        r
+        for r in report
+        if not (r["recipe"].endswith("-native") and r["recipe"][:-len("-na=
tive")] in names)
+    ]
+
+
+def filter_rows(report, sort_by_date=3DFalse):
+    rows =3D list(report)
+    if sort_by_date:
+        rows.sort(key=3Dlambda r: (not r["release_date"], r["release_date"=
], r["recipe"]))
+    return rows
+
+
+def print_table(rows):
+    if not rows:
+        print("No matching recipes found.")
+        return
+
+    name_width =3D max(len("recipe"), *(len(r["recipe"]) for r in rows))
+    print(f"{'recipe':<{name_width}}  release_date")
+    for r in rows:
+        print(f"{r['recipe']:<{name_width}}  {r['release_date']}")
+
+
+def write_csv(rows, path):
+    with open(path, "w", newline=3D"", encoding=3D"utf-8") as f:
+        writer =3D csv.writer(f)
+        writer.writerow(["recipe", "release_date"])
+        for r in rows:
+            writer.writerow([r["recipe"], r["release_date"]])
+
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D"Report recipe release dates from SPDX 3.0.1 output"
+    )
+    parser.add_argument(
+        "path",
+        help=3D"Path to DEPLOY_DIR_SPDX (e.g. tmp/deploy/spdx/3.0.1) or to=
 a "
+             "single merged image SBOM file (e.g. "
+             "tmp/deploy/images/<machine>/<image>.rootfs.spdx.json)",
+    )
+    parser.add_argument(
+        "--csv",
+        help=3D"Write the report to a CSV file instead of only printing a =
table",
+    )
+    parser.add_argument(
+        "--sort-by-date",
+        action=3D"store_true",
+        help=3D"Sort output by release date instead of recipe name (missin=
g dates last)",
+    )
+    args =3D parser.parse_args()
+
+    logging.basicConfig(format=3D"[%(filename)s:%(lineno)d] %(message)s", =
level=3Dlogging.INFO)
+
+    if not os.path.isdir(args.path) and not os.path.isfile(args.path):
+        parser.error(f"{args.path} does not exist")
+
+    report =3D build_report(args.path)
+    report =3D drop_redundant_native(report)
+
+    total =3D len(report)
+    found =3D sum(1 for r in report if r["release_date"])
+    logging.info("Recipes with SPDX package data: %d", total)
+    logging.info("Recipes with a release date: %d", found)
+    logging.info("Recipes missing a release date: %d", total - found)
+
+    rows =3D filter_rows(report, args.sort_by_date)
+    print_table(rows)
+
+    if args.csv:
+        write_csv(rows, args.csv)
+        logging.info("CSV report written to %s", args.csv)
+
+    return 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())

