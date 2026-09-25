Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4CAC9830E
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 08:24:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.39])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3552.1790324660337025942
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 01:24:20 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=nov77Cl4;
 spf=pass (domain: ericsson.com, ip: 52.101.65.39, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DzECZJLsifVJrzWMm3XnfZ6TAMSvl2srhRaj9CBZWV9ycc802oc3w5L8D4BxoUt3uraw2ZXWgW/fGVfKdAG7vIgDs1PN5a/tclWzyiEfS9c+kEx1wOUOezYZ2qYQVei9Y1Nc7/14Z03f0CUNAqYlYDArIt7ehPPMyJwYq7D4uO6mIQkdfH8WUMb485JqkD+aYfR91vZ1st/1rJYEx8f1bzJgQcpdFsjEV/UyARdKDHS1x0ZxnhfiNJpc8XFGhEaAaCc7tju3WNIesV/Jqdyr8xFdfXwL/qz+7eWLh4YXj0rL3b6mJgJUFuAE2oSPsXB32TA2zOua+6IhMrN/APTwLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpEIlpH0bU3FOZgnB11wItmBSujwMiWkbi9LyN+fNp4=;
 b=NYqj5U48MeJuydgRQQrxl8a27U3TL233aQZW+E6kU3y7CXqdZVvZLdND0F4B7j/LB1L27XzYCxpxEtiW3s7MB52wZpR/tCEN8unij3Ul74mrAJXoexQlM5noQem5O0ZjEhoX3MsK0R0kQQGh1bIfkRLKpb+B3ywkjigF4DiweWs2fNWSRJ1srmUNeDgEgeuPtspJCRp8xbC2OtjPDDVbmXd3KSNo10deN0aME/2qTGz+nUo6r5a9D9qzxm6eb8J3yLBtB6LYVM9MU/rUUnQEOX4Yg1nBMSeh8vftvAvlTw/4CSN2eS/GDb3pvO/5+yDtplmq/2eie4onJstlDU4ysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpEIlpH0bU3FOZgnB11wItmBSujwMiWkbi9LyN+fNp4=;
 b=nov77Cl44JdWmYZh5AcNGvGc8iSVZOiMxwnB2dp1F6GzM3sR78WUo4tF858DB39chjDI6X+GKUv2peV/9YcStjcbNIGtNULZwheQv1oXBijse00FfTON/d9HG9HjeWOIXSNtvN9KvFD1RdsV60Na+zsdcjXthGmuohLgLOE6uG4gGTetPMV7/F81z53blh5asMT3qljpBN3bojxv+135PilIxN4ERcT9vJeGw0vgYIhuDQLOY8Mjf2zFmDRSCazx29ALRIEnxmzZCVzui4iKLObCKarUf6X1BNqKEotmjuLTb2KnUr7AR23r9Y4B1ms6nA6wXsfnjHAYOxMP3BKdog==
Received: from DUZPR01CA0060.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::18) by GV1PR07MB8383.eurprd07.prod.outlook.com
 (2603:10a6:150:22::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:24:15 +0000
Received: from DU2PEPF00028D11.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::4d) by DUZPR01CA0060.outlook.office365.com
 (2603:10a6:10:469::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 08:24:15 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DU2PEPF00028D11.mail.protection.outlook.com (10.167.242.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Fri, 25 Sep 2026 08:24:15 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 25 Sep 2026 10:24:14 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 4611995801;
	Fri, 25 Sep 2026 10:24:14 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 0EDF6700CF25; Fri, 25 Sep 2026 10:24:14 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 2/2] scripts/contrib: add spdx-release-date-report.py
Date: Fri, 25 Sep 2026 10:24:04 +0200
Message-ID: <20260925082404.1491266-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260925082404.1491266-1-daniel.turull@ericsson.com>
References: <20260925082404.1491266-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D11:EE_|GV1PR07MB8383:EE_
X-MS-Office365-Filtering-Correlation-Id: d23e27c3-c148-4a44-a692-08df1ade62cc
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	ezNMp/83oVsWPpiw9uBAt8GqzDY94xjhTrm2t8+W7nAg8dyECR89oUCN4UPa+xVe6Wb8I2M7SEaL+CBXK8CRCLUYltLzFk0lZmoyiYhvN6qY0WAx0463B4fgshIrTQHOvm6dErKd76tiNs8puwxjpDDgUFHBV/PP4WFb73wzNcs9h6fO2PqHwVrZsKryHp4tEx3OYPYA8F2l/G1O1S/v2O/QSrC0wOExtQQLC7JyMJhfFjO9wu1hdQk+EYM02eQPOsqf8w4OfxaUONnYKZ2cmHLI7Yy156Bn6WUN72O6qas2WlnycIVAiukNQ09BH9SCyP+rx2d+IyxCh2K3oyZgrFsazRzXrvefJ/aGDu2xYgR//3ec7AUfiNnaiSJPrC0CNh5PCZIcMgYi4j1Kn2h3Ynmvb035xqOpEW/QP5eHAs3FmNINZqon5GYDUsPhYLRKfM57p+93D54CnmSXjh7gBYAO7+mbyzZaXhouX1hUVEkhSYIiDG8rhu9e1sjInF7GcammpilUy4hdnbB5p3y6FAXPLwllB9rjIeM4E/t/kiKaoq6Sk2KjUUeB4abeBGNoof4m8/kedVyG/qR0W60uCxFYOFIxLYhDZbEfkc2iZJIqNWLxog+FquOzs9v5d80Yrf3EXgPWOjAIqCxtLbgpCA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PMtI0Mr8usoZ5SvoJwvh49bDmyy7CZr9mICcrn73un0seyvSBffJTKGHs4ZCzTS0xjiPqEi9rgusnIjVAaz5jwm5AzuI66ZFocB7M81oL/io7LTjqe2qSmUy+9O+pR9LrpLV50sA4ZE1y/isQpgn6hrxhrn4KTA3N9/zk3OU2cgN1BVt50HmDQPmWu8pRtety8X3Wo8t2znnyxLtF2GL6Aq/p8WoOID9qrIKXKlAmRC4sVmlEWYFEgHJ1keRQhBnZf66nsvwX35924TAjpZOwgDngaPguQtJwt8wUeEDNEGfFV3tl7lyJLiaC4s1QIt+rmb2ft2OMislo+3/0WfHJI2UnLSmRUE9kyIwQ5UoQ29NYFRTEP+JtkzMj9IpiVtW4kgH6YwqclOsoKSh7ipTiwHKU/Jeqj5VDBP6Y0jacRx1KTmldxeUqHVO0FZvQMe/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:24:15.1707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d23e27c3-c148-4a44-a692-08df1ade62cc
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D11.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR07MB8383
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 08:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246608

From: Daniel Turull <daniel.turull@ericsson.com>

Reports each recipe's releaseTime (added by the create-spdx-3.0 patch)
from either a DEPLOY_DIR_SPDX tree or a single merged image SBOM. Used
to spot-check release dates across a build and surface recipes missing
one; helped find the SOURCE_DATE_EPOCH_FALLBACK leak and archive-mtime
issues fixed by the two preceding patches.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/spdx-release-date-report.py | 193 ++++++++++++++++++++
 1 file changed, 193 insertions(+)
 create mode 100755 scripts/contrib/spdx-release-date-report.py

diff --git a/scripts/contrib/spdx-release-date-report.py b/scripts/contrib/=
spdx-release-date-report.py
new file mode 100755
index 0000000000..be429409fc
--- /dev/null
+++ b/scripts/contrib/spdx-release-date-report.py
@@ -0,0 +1,193 @@
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
+def collect_release_dates(deploy_dir):
+    """
+    Map recipe name -> releaseTime (or None) from all static/static-*.spdx=
.json
+    files found under deploy_dir.
+    """
+    release_dates =3D {}
+    pattern =3D os.path.join(deploy_dir, "**", "static", "static-*.spdx.js=
on")
+    for path in sorted(glob.glob(pattern, recursive=3DTrue)):
+        for element in load_jsonld_graph(path):
+            if element.get("type") !=3D "software_Package":
+                continue
+            name =3D element.get("name")
+            if not name:
+                continue
+            # First occurrence wins; the same recipe can appear for multip=
le
+            # arches (e.g. allarch vs machine-specific) with identical dat=
a.
+            release_dates.setdefault(name, element.get("releaseTime"))
+    return release_dates
+
+
+def _to_row(name, release_date):
+    return {
+        "recipe": name,
+        "release_date": release_date or "",
+        "valid_date": bool(release_date),
+    }
+
+
+def build_report(deploy_dir):
+    """
+    Build the report: [{"recipe": ..., "release_date": ..., "valid_date": =
bool}]
+    """
+    release_dates =3D collect_release_dates(deploy_dir)
+    return [_to_row(name, release_dates[name]) for name in sorted(release_=
dates)]
+
+
+# Per-recipe document namespace shared by all elements of that recipe in a
+# merged SBOM, e.g. http://spdx.org/spdxdocs/acl-<uuid>/<hash>/recipe/acl
+DOC_NAMESPACE_RE =3D re.compile(
+    r"^(https?://spdx\.org/spdxdocs/[^/]+-"
+    r"[0-9a-f]{8}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{4}-[0-9a-f]{12})/"
+)
+
+
+def doc_namespace(spdx_id):
+    """Extract the per-recipe document namespace from a SPDX ID, or None."=
""
+    match =3D DOC_NAMESPACE_RE.match(spdx_id or "")
+    return match.group(1) if match else None
+
+
+def build_report_from_file(spdx_file):
+    """
+    Build the same report as build_report(), but from a single merged SBOM
+    document (e.g. an image's *.rootfs.spdx.json) instead of a DEPLOY_DIR_=
SPDX
+    tree. Recipes are identified by their document namespace.
+    """
+    graph =3D load_jsonld_graph(spdx_file)
+
+    recipes =3D {}  # namespace -> {"name": ..., "release_date": ...}
+    for element in graph:
+        if element.get("type") !=3D "software_Package":
+            continue
+
+        namespace =3D doc_namespace(element.get("spdxId"))
+        if namespace is None:
+            continue
+
+        if element.get("software_primaryPurpose") =3D=3D "specification" a=
nd element.get("name"):
+            # The recipe itself, as opposed to its runtime package(s).
+            recipes[namespace] =3D {
+                "name": element["name"],
+                "release_date": element.get("releaseTime"),
+            }
+
+    report =3D [_to_row(info["name"], info["release_date"]) for info in re=
cipes.values()]
+    report.sort(key=3Dlambda r: r["recipe"])
+    return report
+
+
+def filter_rows(report, missing_only, sort_by_date=3DFalse):
+    rows =3D [r for r in report if not missing_only or not r["valid_date"]=
]
+    if sort_by_date:
+        rows.sort(key=3Dlambda r: (not r["valid_date"], r["release_date"],=
 r["recipe"]))
+    return rows
+
+
+def print_table(rows):
+    if not rows:
+        print("No matching recipes found.")
+        return
+
+    name_width =3D max(len("recipe"), *(len(r["recipe"]) for r in rows))
+    print(f"{'recipe':<{name_width}}  {'release_date':<21}  valid")
+    for r in rows:
+        print(f"{r['recipe']:<{name_width}}  {r['release_date']:<21}  {r['=
valid_date']}")
+
+
+def write_csv(rows, path):
+    with open(path, "w", newline=3D"", encoding=3D"utf-8") as f:
+        writer =3D csv.writer(f)
+        writer.writerow(["recipe", "release_date", "valid_date"])
+        for r in rows:
+            writer.writerow([r["recipe"], r["release_date"], r["valid_date=
"]])
+
+
+def main():
+    parser =3D argparse.ArgumentParser(
+        description=3D"Report recipe release dates from SPDX 3.0.1 output"
+    )
+    parser.add_argument(
+        "--deploy-dir",
+        required=3DTrue,
+        help=3D"Path to DEPLOY_DIR_SPDX (e.g. tmp/deploy/spdx/3.0.1) or to=
 a "
+             "single merged image SBOM file (e.g. "
+             "tmp/deploy/images/<machine>/<image>.rootfs.spdx.json)",
+    )
+    parser.add_argument(
+        "--missing-only",
+        action=3D"store_true",
+        help=3D"Only report recipes without a valid release date",
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
+    if os.path.isdir(args.deploy_dir):
+        report =3D build_report(args.deploy_dir)
+    elif os.path.isfile(args.deploy_dir):
+        report =3D build_report_from_file(args.deploy_dir)
+    else:
+        parser.error(f"--deploy-dir {args.deploy_dir} does not exist")
+
+    total =3D len(report)
+    valid =3D sum(1 for r in report if r["valid_date"])
+    logging.info("Recipes with SPDX static data: %d", total)
+    logging.info("Recipes with a valid release date: %d", valid)
+    logging.info("Recipes missing a release date: %d", total - valid)
+
+    rows =3D filter_rows(report, args.missing_only, args.sort_by_date)
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

