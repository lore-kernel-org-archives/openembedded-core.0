Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBC9CA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:04:20 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.66568.1790622256385960592
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:04:16 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=c11exgAM;
 spf=pass (domain: ericsson.com, ip: 52.101.66.47, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U1y/QFVYSCk55aTiMhIR34cXUakS9fP9MQuNQ8ffpp6G0B132q5EmiltOCtqsER+iM7fU6PLhv6zBBfv6D33vYiG9aQps2ZI6WKmST/RKhaST9M+bZGjMAgqv1FupRpdWATgalxQfXxC++bGfqrHbx0G2trPOAgIRpTJHHa9xdjXfdMrpFkq3jTXzvJAaXEPXZ9fAQWduBV1mgZQorjSCAUGwsz2zOL15d+orrbtZpMIrEdr5cX2zxZPFSoU6QSMN9f8tYdiNiIJZZ084YQVsPlbzdtayAhze1HHh0WCb8y+iJ7S5ETrjRc64IawP7kc3VXttqp3Rwjq4RnfhN5wuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EpEIlpH0bU3FOZgnB11wItmBSujwMiWkbi9LyN+fNp4=;
 b=MdpxxMoXQ5E8z4gDXb82s8lIEzhgwkkm/v6jPbAj3dF1MrpK4A+T6iUxC67835t4OoinwlOSkQqncYPLxJ/VZrmu3YNvkb+ub8xhEO9lfCv6MbBqjokjhXKpXgNslCVgaIkrUddZLNuOQ5QUXOxgnITkqQROUSrSxJVgeonvwQDNW/ySPYVhpUUlAkyfuqHLH+7JdphGH3W541R4He+PBsAqEuFFRgBviluIjGMhR0J+hdHUQki5fVNshobX0jcPckyQHQrgFfpLuS/IfbNLRv1q/9vjzDZ8fRJt+QauxyaG5hxEwj6YpeVdZbX/pJOEKtkbUgq7ks6IORzL9G61hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EpEIlpH0bU3FOZgnB11wItmBSujwMiWkbi9LyN+fNp4=;
 b=c11exgAMnmiutHG6Is2qiepdpwC7LRUQc64dHH9i1Wo+2AxZ7hlIhZ+/SpE5SdtdatDMisVeKcPE48hvqMr3QlBASOu85clt4UTUuarTyFqmp6ufYLBpP2BYFp0xejupQjI635kFbDTkB4Cv6QyJS/BPcFKUx2eSdRiW6H/j76qeabL2H6exzfIRH0uI3dyE+gXYzgRbdtuOfEGGVJDFPyBNUYtM1GbGC3nrhSPxpe9oZNSxzsZUE4Ug76hwHremca3BkizlUGPshWhCGgHKBgvdYeHLrVJW7+DyLPSynO6/GTJF/h6tBca1LhLWUeoBXsd9bg2sFNA88F8kzZ9z7g==
Received: from DUZP191CA0050.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::23)
 by AMBPR07MB12326.eurprd07.prod.outlook.com (2603:10a6:20b:760::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:04:11 +0000
Received: from MAD0EPF000008BB.eurprd04.prod.outlook.com
 (2603:10a6:10:4fa:cafe::69) by DUZP191CA0050.outlook.office365.com
 (2603:10a6:10:4fa::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 19:04:10 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MAD0EPF000008BB.mail.protection.outlook.com (10.167.241.170) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 19:04:10 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 28 Sep 2026 21:04:09 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id E21F19975E;
	Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B5E6B700CF29; Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 3/3] scripts/contrib: add spdx-release-date-report.py
Date: Mon, 28 Sep 2026 21:04:00 +0200
Message-ID: <20260928190400.3908822-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928190400.3908822-1-daniel.turull@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BB:EE_|AMBPR07MB12326:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ffcfdfa-3674-4496-34cb-08df1d934766
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|18002099003|22082099003|3023799007|10067099003|260925021311599003|260925022911599003|260925021911599003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 
	//qLGyMN1/lR4/5F9+3+hdnfQ6yM7GjFZL9orkVDCeiKKPz5uiwni72/iHPWU0uRwTgt6Nv4AzgKtXPm362YuCuCnbduaVfpwBuzZQLreuAZjYqwzZRdwBDJTfKAzbvhU7s1RTIuvrzWLYOUNgLHtTi/u7TjF8quX2BsSF7wYzc+Q6nd/TDZTyvyUiiswHU4/5i3rBh2lGgM1HrF20Pdkj8WNlijA7nZzJeM6YwdsVt/gT9jHRID6QiAoLi/o4NUflB7lhNMHwTtcW/V+jp/UrOINeiAzTIaTQBFfJN3W2N8RSa6Csu5HiJxOftmh+sguScB+ERmmUJuE3FIznghi7Ekw+P9A822H/p8sTLXCI9ixAAKo7xp4/1HfT8RB53yL33I96P03B/yk3JnUGULNv0HCPwz3yx1G42l8jvEpWTvgmw8LEKf+AO/Muc2xvZyoNfB0/Cn8Vr++Q0LsKWYu4outff4mHJrGDPzczNzntNEHD08lio5/7lDtR64PwLgg6rUO3gZGg6E/hDnie6Gl3KDKc6qoHKQ+DEABMEQHF+GI96kttJoNGHm6ETqOwebwa0G+7uMDVL3T7Jn/T5Eu85hwpM+jvCY4IzAbHmeJBbIz5S62zROIWHBCyn92aR05NZ9SFHPU6zJnmHBPuVPhZxMpSRVrrhvkpT08cFrOgs=
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	4GLGmVwUjg4AfP7ToIaeCaJR5kvc+r2kuZ6edDuIDZvIk5reuRWUCZM3wreO2YIP5jLJsHPUhFSzOpVNIpqBmPt9pKyXiEgJ4uFNAAo/J0TAO88l1FB7lorts/O7d2LbC+41YchqR9UzRdnf8EGlBISN/OvvnWzJDSFGoME0lOVxGhkIkL9IUlEzcLo2SWD3Q14NMOrB6OwtaS5IWDeFgkEe3+YkQdWnRy4v4j2t3GExhCAmzwmMN8hLAlAHDrQQMDv3qWqdQmc6V7OExCPjV+NunRaxwX4z5Tj5sk8V5kFo0A4WIncW547ZeyJfRRpzU3LM7J0XHBJ3cJ0zrqeKPWNhqdeeuWt1h04iOohXPXf/RnMpa/P23c7MoZvjzBClBSuQzqJrVAIT/M75dRtUWrUkK4VpKjl03YWY4T0Z3OL9csy57UOiB77vQPGDdq3y
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:04:10.4053
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ffcfdfa-3674-4496-34cb-08df1d934766
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MAD0EPF000008BB.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB12326
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:04:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246789

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

