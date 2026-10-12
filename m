Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FD29CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:33 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.24])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11538.1791806012376605880
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:53:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=He/Y1LK7;
 spf=pass (domain: ericsson.com, ip: 52.101.84.24, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A8q72DbhfN9Sag8ubk0t3nNWOTN4FWfsztObbdr16q139D77N8XJ47ZVlrHLdEiywXu4ukwzVNBCvn+vcKnd9SzIps88ZDkc72NG1nYlBXRV8G+1R2Qbh99A5hsqrkUmQrtEQkkAgTHoZdB9CW3iZxPoqkth9ACXrZytOvSomXU6o8Q9Fli5tQiFQXOONgm9fNqQ8ykFSIj0SMG6RcPlU500yu4+mQURpWbT0Nf/IW4gX8iMk4rWDx97umSC/0jwJOgfLa5lKSZkafTe7WUfT56MHo+/f5FG+jv1Q+WOCzdWBztQqxw7pBp/2MIqJqhJPFrEAbUo4gsFow6hftIVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=KldMJ3my+OMj30vM3v6MVCfiWYBfzwdnmI3qgv63/CPsh8bO6QXbrpRk+rBcf0sNFMrZ9va5+gGMJoalpYKtN+dfRGApn6uj4Q6YpPHa39DTey+kTbU3Zn1rWJ/p1PZDp4gCP/Kfy72ruCk5V3DstZta3Ru7jA9pOYiox0rLjtd5gENhENTqyv787RqWzi/splxp2AS5qUPsmdvyZLvJCRekKvFHe6q18223uq6rAWDxRV3ctagGfqvWDkMeKKvdVuRngh2Q/6Zgh5hpeyx/P0cm5VCFaQqWragvXWx/x7Vd5MHHaHYAf0Iw6xx8u9uf2mqkiQis4bgLU/+rF4n7BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0dRw32rwVf2K8zq99Lnbhy/OTsa5ckPlkxubwXZqHA=;
 b=He/Y1LK7Xyuq89fDaFL9KAoNX/3nbMQBomFunuloffuOzWbNVNA01Mlz6G+OvOaLQ7shn9WiBYM5/Hr3G0scNs9XRKzOlJyJRhc9KNla2TM6AVpCG1Zo+uZeKMoByiY6F3upMoAZ4bBnWFSfKxB/EuhnKA3VFtO3wMIhcIXE6oxjGwmBy/GUcRkbaXhriY70Rl51LiXeiCGcAHThxPTzPiQ1ZHn74EIxwWRR4UPnVKz5dhj6GtrlRijA38CmeOtfNiQjG7RXY4nYo+r/HFOOJm74oMUhk8UwYev3SpICSNEbcTPAt/dFvrMRSFDOfmkd/1g7dVleU+kJwveu2zTGcw==
Received: from AM0PR02CA0156.eurprd02.prod.outlook.com (2603:10a6:20b:28d::23)
 by PA1PR07MB11903.eurprd07.prod.outlook.com (2603:10a6:102:562::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.21; Mon, 12 Oct
 2026 11:53:27 +0000
Received: from AMS1EPF0000008F.eurprd05.prod.outlook.com
 (2603:10a6:20b:28d:cafe::89) by AM0PR02CA0156.outlook.office365.com
 (2603:10a6:20b:28d::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 11:53:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF0000008F.mail.protection.outlook.com (10.167.242.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 11:53:26 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 12 Oct 2026 13:53:26 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 4813C95808;
	Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 1BC73700396D; Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v5 3/3] scripts/contrib: add spdx-release-date-report.py
Date: Mon, 12 Oct 2026 13:53:19 +0200
Message-ID: <20261012115319.1704048-4-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115319.1704048-1-daniel.turull@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000008F:EE_|PA1PR07MB11903:EE_
X-MS-Office365-Filtering-Correlation-Id: 26421375-e9c6-4ad9-f86d-08df28576d2f
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700016|23010399003|56012099006|11063799006|261009223027099003|260925021311599003|260925021911599003|260925022911599003|10067099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	e7icZLewdSd89rgIA6kb/lOkhp625+ikf6LkhXnwK0UykCWu36jE/c83JBZ6V22VbPT/gBydOv2ynzVDWnPdxAGn1LcqQcZAtsZoBdf5mPx8CnUGXNImyoBGh1bCdnYsoYWSy4MZrohIZoxi1A2JrHR+tHTmdtCvQaNYCKXLWi+zlFQBjF6++rxGnamXIsPhIB2lYV7UsPJeqoOgV38qappUDeaLVnOdl83OqYkvWmebbN/iGFaMX/3I8B+3zzCV/DJfwA+aLm9YHXDgmsX/McNyroEV6E/TPoQbtMMWu2Usyy/hUl2d9nSIohxGfoVhOZSeNrOkIIB+yEK7a9Y5O/cXqPkCBisEqbTMDOJilMh/fljzaIXH8foXKopal+BaD34WaXbihCDZDZdDY103hZvi0uJgdxjsoV5zt5AfOFOkyppPslVFmJIYgyocD9RL5xQX8kwRjH9wKN9TJL8shtRqgX08m5yTuAQipFWejU6mUe0/YuZQsnFKRm1W29qXMj6k+AiySqRRn1WJkdtL63gWmbbmPHLbTL3jQ/JAx/qdmZXn7pzXAOausDkl3iRWdEfEL4bdV5yBILcb2/4VZT7PPF9oDHld+OJQgKLxHxCrDkrph+0iqUodTjmFdEp3zOzUXb/WkPOmEZhIkO1Yuc+cnRFigulohu9W86+KEINl4cg5ijlC13sCNsvsNlJmyryLUjFwv+rC8YGJaV8zBQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700016)(23010399003)(56012099006)(11063799006)(261009223027099003)(260925021311599003)(260925021911599003)(260925022911599003)(10067099003)(18002099003)(22082099003)(6133799003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Z+39owJIf31Wpj2fYwS2v225CM5riaL+VNoTCNEvvoMdHT766FLt9I6X8I2FKJBB3i5Elm9s3cXwNS8B9Z62i5EYQuvs+DHliJcHWVP80pO4YC7P4V7qA3kiaNG9JtTP4PXbnpsCoU5zRqHXsxRwtMo2W8m26Fuw0OUB8oCzYBLwZj3z07EPkT6IatJMLBD4+bNUiTZ7d2CpiB7h5rYexQrZ5rvVasQp6eVggaFh6+aPcNNZrdoSjZlbjAvlof+0Hq6/p55x0moA22X6U3qZgOv1QmzIsXSFDQ90OxeLQcSlYacSmfmHYrb8s9NJMJBQqDjc8DnowQIfX+tLZAUVJJZqPp8KhIPrg7v5ASU+47HOlRg7JefjbvWZXtBPIJZsgtNqJRrCATvEGwIDxS8ohsgoWnfukrpup4aLu0MoxIev/6XtJ3SLv8q7hNVasmPw
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:53:26.8412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 26421375-e9c6-4ad9-f86d-08df28576d2f
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000008F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR07MB11903
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:53:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247639

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

