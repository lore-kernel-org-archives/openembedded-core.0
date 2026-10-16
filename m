Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B8BCCA48B
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:56:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19193.1792148185908075141
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 03:56:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YyI+s1SJ;
 spf=pass (domain: ericsson.com, ip: 40.107.130.66, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7e3pFFdkGrv95xDrrpV/T3TMAZFZmjySk4WfE4ErmubA2y9zCL3q73IV1Yv0oCQtSxC/vq8E9rLDJAxqnlLiZxviE/N9EQSDpGSsES1N2FB3yz8JQ/n48cpEHYwxJ6d1N0G5/w4ICxtttASTg7kA1rmDTYunz4/mXQslBqmGvEvZtSUSrBYntUANyZ+2bqC257Z6IWBEmS7mRVakakBiudy9bBp+VJjYgNMyZ11oOunSaWG6HqoOsMkU0i8pjM+n9F83XYH6btXWFspWadpALiKQMViFVv9H33Z9d82SFV/EwJa9YpBWwmRyRcjO7FDa/J9s2b2CCzDPl6vBXhOyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=HxjRBDW/VyjNqQ3XMGoW/vyUayauPzJ8c5cXMSNUS2YdrGRYe85qpRp7XgmKqoHpcPr8P819UETQ6XHdpednLMHXYPkTg8o5jX3XwVlJrehfqlU7LkaguSCqu+0qri8AriF6aqxiJnA+RXsqxo/X3s5ItxPdIJHe3RuaX1ifJPSyitWI1QO1tkoIUYm820Ktbt83R3OAHtacv/3Smz6SCNrOfr9XFhmfG0UxDWpy+87aGDqaeDwJVGgmiwBy4BlsFWJXkv5QL18st7PK2O+edT2r29Hha828B6JX81JAKyRqdSCLllZOPXJ/hWHWD3PT8tpyLr82KpQdnor2EuTO9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=YyI+s1SJROT0TuI6bTeb/875ClUHzR8/O2sjiXXRqLwo6C27f7jAULk7Bz/F8AhrL+vbG0GO+mfOCRSWUGN3WnqAsh++GxSUdTvLDENVOszP4sXjU2FEVJbaZCvnmhldxg9WtBcGT62gEUkGFwi6e8HGh6+mnW3B6YJRlKraF+kEbsW1/L60MJNaTpzo+s1KKIfpMVh90te42NpeoraS6geFqQtmZUh/g8T9/XS6NH7s/eTtHu1hk/o7SS34DXzfYHBTb5CMarAs403PgzUCWo+jbHIyjGWlrKXV8KiqwypZ9SEeUA424af+11AjaiXCs+ivvQD+fYDUYC8kdxxssg==
Received: from AS4P192CA0024.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:5e1::16)
 by DB9PR07MB9342.eurprd07.prod.outlook.com (2603:10a6:10:454::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:56:17 +0000
Received: from CPH1EPF00000530.eurprd05.prod.outlook.com
 (2603:10a6:20b:5e1:cafe::a5) by AS4P192CA0024.outlook.office365.com
 (2603:10a6:20b:5e1::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 10:56:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 CPH1EPF00000530.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 10:56:17 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 16 Oct 2026 12:56:16 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 43F584020B44;
	Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 1AD71700396D; Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v6 3/3] scripts/contrib: add spdx-release-date-report.py
Date: Fri, 16 Oct 2026 12:56:11 +0200
Message-ID: <20261016105611.330514-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016105611.330514-1-daniel.turull@ericsson.com>
References: <20261016105611.330514-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CPH1EPF00000530:EE_|DB9PR07MB9342:EE_
X-MS-Office365-Filtering-Correlation-Id: 25c6de11-d3ed-493c-6c07-08df2b741ade
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|56012099006|260925021911599003|260925022911599003|260925021311599003|11063799006|261009223027099003|10067099003|22082099003|18002099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	QflSHq1PIcDqTpE2BYcwac+OgIebfVihcQlpBY7NBX/KaAp3dddHs57t/4lZIx4PkZSESIN548JE0kab6Nowxac/RSUFoOeYI6kycfUwZJgJuOx1v3+0qJJ3NDF7vwn2M/qXxkQpuP8NlT+8bJ380iGEc/bBwf76BJhwXP+pcmy+468eLgOo3mUmurB4TSP2ISCZDd/wrPI/45ccm0Py8CSZID50VgOeffRHOpMQCUfsZIFn7SeRsFzwevhlOeYH5OhUT/xrdB6lOVE5QGz2U5F9Sk+hEe3xQBnInzMFt06bdoa9qhddyuxhboyRzxXFhF+Az0F+dgfns6rZO5pyOqyjXfDCeJM8bpEAQ2HIJxwn3qtpKRW6PpjmRhqc/y4Si9p8PElkcDbu8r31SN0QHkiUROjkCCNVRSAhEumUXIRS6OBGC/3FCYlKpo1CFQ7As/CjQANsa6o25r98zt+ngrC/oaosk6eT0kivFePn1txTOLqGRpQ4I+kSL15qx8XgnClGNTC6DHafENwGR+5jHrs24y+uUPq/UI2ZHxDsMva/xcW/gJDD+A0xLh1oS8xndguuhsEAseDdrEm3Y3EsU9lfFjT4igJbxeIJz2rxElsGxChR7oP0tJ1LMFh5PrNPGbScHHbcIquvJnduHskl2w1t5OOnzOAVn4xQT8twR/2fyDdU7VbhMhE8Qczo2S/dZK8CMFUoO79KxkKmEwTJCg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(56012099006)(260925021911599003)(260925022911599003)(260925021311599003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	aVWizeDOdx6R/KTSuImopFbujSC48Pg3gQXhWf8bFI/BQD5aX/Ix0wagBFMpBGLe+/cbD1F9YVdBieSRWgc/PfkUaNeEcflTGA0mPX5yY1IKPbqFrwFZ+fde+VUSUQLra+hO73+ietm9AgnT2nhE9Akx8ymLOdBJIpbIh9uFBQ4lU1o/AFsc/R1RWKS5INxNVEc3l5tI5ot6MqPpCFAM/4VtjaCBTM2XWQk9tGb19D8SXBIrntva1hNtHtE2mOjKHyJILE7pWU7hdLk5ltt8zgz2f1W0abmlWGLT9Dok1/1dykgzHFptjBSCBthB7kfEtd5B/kLp3fRIVG/EOJJC6MWNcGtRCJzq3lfJEtiisTWKEEaBwXWTLybewSi+b+owdt6jb2Gou3uzJiX3o8ALKVuqO8CwDHl7wxASCItHTtr2D0Z++jXDtTtgZzj3kwA9
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:56:17.6437
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25c6de11-d3ed-493c-6c07-08df2b741ade
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CPH1EPF00000530.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR07MB9342
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 10:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248011

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

