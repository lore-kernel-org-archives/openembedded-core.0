Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E306C44532
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 14:48:55 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.14])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24645.1784645329341483806
 for <openembedded-core@lists.openembedded.org>;
 Tue, 21 Jul 2026 07:48:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=JlpBh930;
 spf=pass (domain: ericsson.com, ip: 52.101.69.14, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EVsApyhK2MyKlk3LDWKoBJB1DtS0gFeYBlY93fyBnTqmXjRrim0txSNk7LKVezHCsHh7uHP1sOreQWx1oEL+t8l8FM0YPf22O7VmgyZVvpVDNzuxsAZQ8gZYb1ZcgtGhGbEANf89yBtiIIuwN2WF8LwZU0Dpt7Wv9nwQ2xDJWmRFxAqBat+2/WWcrtyZ3SO/WYtU0PKVVZwvZRWQU0ji1AOdhHWQtfdA/GJXKsmsM82eyHwKKXDwnKDpodn/Jxhf8Mti6S7c5w6uNH3hIIHc1C0gIMUPNCc7PgCcaAEpZJq+m51CJdzitme9d0441KTtAfSRbtPRos8+XiYlLQWrNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iG5DWwZ55+AHF7/RaZro4AejrimKLZQwzBZrOk1QgI4=;
 b=JmjwJnySYNqqxZXNlCPqxGef4mOZf9z7i04Xk9p4mXb3j4y5aIlnk2JnWvYVuf9SK1lVeE8HeNXv8Nu51lvOkJWRYKC6dEFWpIOsvC6wmYiLQxXjR6IDN8Eva5NjoXHY5nmK9Ui1C41oMuks87D8MnFXRakfPIypeaXXbLgVtltHtBzg1FNyxb358Yy+qmi+e9+a23zqcs4DUOkkzTCXiL9V2G7JEjJZKtgg3iKyT1XBDovq6RweZdXU6kp7wJjGCHYY+/GFFwyWall/fY1XmN82gE2Ef/Fmy2flnC/IFrGZ+5GX+OUU727tMTE4BAqWPCYyQr/eQdy6e3vbw5HFiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=ericsson.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=ericsson.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iG5DWwZ55+AHF7/RaZro4AejrimKLZQwzBZrOk1QgI4=;
 b=JlpBh930h9YyI2T1eViQybXnAGc2QtBOXGneKW4T1zzXOiI0SXclAYzDZrDrJ2cfoeEHHoSLciH1CJlas0wzfUZjNbAp6Aeew8Fsk21ld8BOo64UYpgWGvMJAluLHlRqnSL3QTfA+f0xjV8L9Eh0zuXgeZTkC29ZFHaCj5TGnC1XWyM5Lwrw/jPaA3tecWLUbCBNJU8l5rTqfuAqJULkxrdFKl18TJAI2oO5FVQaNm26Vmvc59/2TRVkJNlqKMNjSJ1LdNZ1PqIWtLbK5ulSwxbvJXD4h/Xmp3OhUkVCXggZbxHiGUVeWYJnEpezJmQoSR/KhoDBKHvIafYZb51gJQ==
Received: from DB8P191CA0004.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:130::14)
 by VI1PR07MB6446.eurprd07.prod.outlook.com (2603:10a6:800:13f::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 14:48:42 +0000
Received: from DB1PEPF000509ED.eurprd03.prod.outlook.com
 (2603:10a6:10:130:cafe::a2) by DB8P191CA0004.outlook.office365.com
 (2603:10a6:10:130::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.18 via Frontend Transport; Tue,
 21 Jul 2026 14:48:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 DB1PEPF000509ED.mail.protection.outlook.com (10.167.242.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.223.9 via Frontend Transport; Tue, 21 Jul 2026 14:48:41 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 21 Jul 2026 16:48:41 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 78DD74020E5F;
	Tue, 21 Jul 2026 16:48:32 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 51D98700DBB0; Tue, 21 Jul 2026 16:48:32 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH 1/4] scripts/contrib: add helper to report and fix missing SRC_URI ;tag=
Date: Tue, 21 Jul 2026 16:48:05 +0200
Message-ID: <20260721144811.323786-2-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721144811.323786-1-daniel.turull@ericsson.com>
References: <20260721144811.323786-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509ED:EE_|VI1PR07MB6446:EE_
X-MS-Office365-Filtering-Correlation-Id: e906ab6a-5fa8-4776-2f07-08dee737286b
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|6133799003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	cxZwSRgqmfF8xPv/AEw308gcuND9yQzro/+MWmad16IKzUiTXHZRdNImcA4X/JfE5LU7xd61KIIhEK3/JsVIWdIhy6j+xw3APiazD9soK8SCX9Ogv7uISFno3KUwSgR2xgcbK0Kn3Fii6k1q3HVL/+1HqShWZ0xCki+5tcnLd8yYONfiGXbg3UY6Qm36vr87AdxRfVdFdX6RYgdjG9ldVam32OtEiybAcillYrJGmR+R5Nun6nhcLqSlR0r9JIi0xyc+ynhAYOUc18/Je6Eu2q/5c3lmWey3r33BVU9ORvudiTXt/cAGmoV1/azlCcBccdInRJrobTyMnYz2C/la/AwYLYVnx8Gedd8SBX8N/EdgKQMzEof+S5Pqf4KlRonmWnEjRFCYVF9goSz2e6ugUy/3LyVAzMJywwUZWTqNLVxq3piAXTYhiTkcHJ2CYef6/i0QJq/jny3B+hIvPQjRhIOM+NkNtCQlMxsnzqfPlJAY/v24i3prdHj6Jqjzvlf7WKpO2+iI6xlYbRNI53mhSI0v54Txpk7U+GmyhYnaozzz/hHoXGDgvggZY+a9TLjnEojK1nYB5WBNgfkBJjLxK7WPrMOJXGNpeM0pKonb3TeX3+OLZi5CYh9E2XQvaf8Yixh5Xz6RUKpKbQQqfg0va4M7OPwHy6sWlBGENkmSvMc76ED+pFrxnh5YQk6yMksIUiHXcPNs7z88SwojxR8tIw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(6133799003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	3mmR8dpJBaJXTJ126oCmE5cLqdDDi/igUYCZRSmwhj1lZrGUYQLRWmMF7M7JrHjqfZIiexVslZCmkE2pjqNQXenGcehahZfRgVhhRBZbYO4hgOINWvKxu9g2NXzESmemt2w+dA2Zot1Dyn99ty+hbu/TbQYagpS+UHNr5UDzfo/9x2IS5ujrP9hLyZoHLDdyykRm4uvz6A22eL9Dc8Le2NTx8XsvMYR9ZZhyVTj2ZAbehkHjxT1jEIrk06CpGFd+Uq1Rawu0pZMMaZew1kS+Y/XzKQY2O5BAcGQC3/N7ZgcV6p8mwtAvERNk/j7GbEeqIhspnvqmSm/GuG8VMrP5cXE6QdNjJaGg46ew5BYkBB3pcOMTYtRVVqq9lNBi+dMoNHxbAb3nozHVPn/gGlItDFeHih9vyH5ziaCLoF9kX1yD8lS1XUD82dyU0uuj5o77
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 14:48:41.9669
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e906ab6a-5fa8-4776-2f07-08dee737286b
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509ED.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR07MB6446
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Jul 2026 14:48:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241546

From: Daniel Turull <daniel.turull@ericsson.com>

Add a contrib helper which scans parsed recipes for git/gitsm SRC_URI
entries missing a ;tag=3D parameter.  By default it reports only and does
not construct the BitBake fetcher.  With --query-remote it queries
upstream tags and, when a well-known tag format resolves to the recipe's
SRCREV, suggests it as a ;tag=3D candidate.  With --write (which implies
--query-remote) the unambiguous candidate is written back to the recipe.

Tag candidate search uses TAG_FORMATS (v${PV}, ${PV}, ${BPN}-${PV})
followed by UPSTREAM_CHECK_GITTAGREGEX if defined in the recipe.  A
candidate is only accepted when it resolves to the recipe's literal
SRCREV on the remote, so floating revisions (AUTOREV) and non-release
PVs are skipped.

Writes are performed via oe.recipeutils.patch_recipe(), which also
localises the change to the .inc file when SRC_URI is defined there.
Only literal SRC_URI entries (no ${...} in the URL token) are modified;
the entry is edited with bb.fetch2.decodeurl()/encodeurl() so the
;tag=3D parameter is appended without disturbing the other parameters.

Every modified file is printed, with a reminder to review the result
with git diff and test it with bitbake -c fetch.  With --recipe and
--layer the scan can be restricted to a single recipe or layer, and
--fail-on-missing makes the exit status reflect URLs still missing after
any writes complete.

AI-Generated: Kiro with Claude-opus-4.8
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 scripts/contrib/check-srcuri-tag.py | 483 ++++++++++++++++++++++++++++
 1 file changed, 483 insertions(+)
 create mode 100755 scripts/contrib/check-srcuri-tag.py

diff --git a/scripts/contrib/check-srcuri-tag.py b/scripts/contrib/check-sr=
curi-tag.py
new file mode 100755
index 0000000000..33a2b781f7
--- /dev/null
+++ b/scripts/contrib/check-srcuri-tag.py
@@ -0,0 +1,483 @@
+#!/usr/bin/env python3
+# SPDX-FileCopyrightText: OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+
+# pylint: disable=3Dinvalid-name
+
+"""
+Scan parsed recipes for git/gitsm SRC_URI entries missing a ;tag=3D parame=
ter.
+
+Default mode reports only.  With --query-remote the script queries upstrea=
m
+tags and, when a well-known tag format (v${PV}, ${PV}, ${BPN}-${PV} or the
+recipe's UPSTREAM_CHECK_GITTAGREGEX) resolves to the recipe's SRCREV, sugg=
ests
+it as a ;tag=3D candidate.  With --write (which implies --query-remote) th=
e
+unambiguous candidate is written directly into the file that literally
+defines the SRC_URI entry (which may be a .inc file required by the
+recipe).  Only literal SRC_URI entries (no ${...} in the URL token) are
+modified.
+
+Must be run from an initialized build environment (oe-init-build-env).
+
+Usage examples:
+  check-srcuri-tag.py
+  check-srcuri-tag.py --query-remote
+  check-srcuri-tag.py --write
+  check-srcuri-tag.py --recipe busybox --write
+  check-srcuri-tag.py --layer /path/to/meta-foo
+  check-srcuri-tag.py --fail-on-missing
+"""
+
+import argparse
+import logging
+import os
+import re
+import sys
+from dataclasses import dataclass
+
+scripts_path =3D os.path.dirname(os.path.dirname(os.path.realpath(__file__=
)))
+sys.path.insert(0, os.path.join(scripts_path, 'lib'))
+
+import scriptpath  # pylint: disable=3Dimport-error,wrong-import-position
+if not scriptpath.add_bitbake_lib_path():
+    sys.exit("Unable to find bitbake libraries")
+scriptpath.add_oe_lib_path()
+
+import bb.cache        # pylint: disable=3Dwrong-import-position
+import bb.fetch2       # pylint: disable=3Dwrong-import-position
+import bb.tinfoil      # pylint: disable=3Dwrong-import-position
+import oe.recipeutils  # pylint: disable=3Dwrong-import-position
+
+# Well-known tag formats tried in order when --query-remote is active.
+TAG_FORMATS =3D ["v${PV}", "${PV}", "${BPN}-${PV}"]
+
+# Cache of remote tags keyed by upstream repository identity.
+_lsremote_cache =3D {}
+
+
+@dataclass(eq=3DFalse)
+class UrlResult:
+    """Outcome for a single git URL within a recipe."""
+    entry: str          # unexpanded SRC_URI token
+    base_url: str       # expanded scheme://host/path (no parameters)
+    name: str           # name=3D parameter, or ""
+    status: str         # tagged|missing|remote-error|parse-error
+    tag: str =3D ""       # existing ;tag=3D value (status =3D=3D tagged)
+    tag_fmt: str =3D ""   # suggested tag candidate (status =3D=3D missing=
)
+    detail: str =3D ""    # human-readable note
+
+
+def get_literal_srcrev(name, data):
+    """Return (sha, None) or (None, reason) for the named git URL.
+
+    SRCREV candidates are read unexpanded (to avoid triggering AUTOREV
+    resolution) in the same fallback order used by bb.fetch2, accepting on=
ly a
+    plain hex SHA (or the SHA embedded in a cached AUTOINC+<sha> value).
+    """
+    pn =3D data.getVar("PN") or ""
+    attempts =3D []
+    if name and name !=3D "default":
+        if pn:
+            attempts.append(f"SRCREV_{name}:pn-{pn}")
+        attempts.append(f"SRCREV_{name}")
+    if pn:
+        attempts.append(f"SRCREV:pn-{pn}")
+    attempts.append("SRCREV")
+
+    for key in attempts:
+        val =3D data.getVar(key, False)
+        if not val or val =3D=3D "INVALID":
+            continue
+        if val.startswith("AUTOINC+"):
+            val =3D val[len("AUTOINC+"):]
+        if "AUTOREV" in val or "AUTOINC" in val:
+            return None, "SRCREV is a floating revision"
+        if "${" in val:
+            return None, "SRCREV is not a literal value"
+        val =3D val.lower()
+        if re.fullmatch(r'[0-9a-f]{40}|[0-9a-f]{64}', val):
+            return val, None
+        return None, "SRCREV is not a literal SHA"
+    return None, "SRCREV is not set"
+
+
+def get_release_pv(data):
+    """Return (pv, None) for a plain release PV, or (None, reason).
+
+    The unexpanded PV is checked first so PV =3D "${SRCPV}" or "1.0+git" a=
re
+    rejected before any expansion side effects occur.
+    """
+    pv_raw =3D data.getVar("PV", False) or ""
+    if not pv_raw or "git" in pv_raw or "SRCPV" in pv_raw:
+        return None, f"PV '{pv_raw}' is not a plain release version"
+    return data.getVar("PV") or pv_raw, None
+
+
+def lsremote_tags(ud, data):
+    """Return ({tag_name: frozenset(shas)}, None) or (None, reason).
+
+    Uses the Git fetcher's _lsremote() so mirrors, credentials and
+    BB_NO_NETWORK are honoured.  Both the tag-object and peeled-commit SHA=
s of
+    annotated tags are collected under the same tag name.
+    """
+    key =3D (getattr(ud, 'user', ''), getattr(ud, 'proto', ''),
+           getattr(ud, 'host', ''), getattr(ud, 'path', ''))
+    if key in _lsremote_cache:
+        return _lsremote_cache[key]
+
+    try:
+        output =3D ud.method._lsremote(ud, data, "refs/tags/*")
+    except (bb.fetch2.NetworkAccess, bb.fetch2.FetchError) as exc:
+        result =3D (None, f"remote error: {exc}")
+        _lsremote_cache[key] =3D result
+        return result
+
+    tag_map =3D {}
+    for line in output.splitlines():
+        parts =3D line.split(None, 1)
+        if len(parts) !=3D 2:
+            continue
+        sha, ref =3D parts
+        tag =3D ref.removeprefix("refs/tags/").removesuffix("^{}")
+        tag_map.setdefault(tag, set()).add(sha)
+
+    result =3D ({k: frozenset(v) for k, v in tag_map.items()}, None)
+    _lsremote_cache[key] =3D result
+    return result
+
+
+def deduce_tag_format(ud, srcrev, pv, bpn, data):
+    """Return (tag_fmt, None) if a well-known format resolves to srcrev on=
 the
+    remote, else (None, reason).
+
+    Tries TAG_FORMATS first; if none match and the recipe defines
+    UPSTREAM_CHECK_GITTAGREGEX, that regex is used to find the tag whose
+    captured 'pver' group (normalized from '_' to '.') equals PV and whose=
 SHA
+    matches SRCREV.  A unique regex hit is returned as a literal tag name.
+    """
+    tag_map, err =3D lsremote_tags(ud, data)
+    if tag_map is None:
+        return None, err
+    if not tag_map:
+        return None, "remote has no tags"
+
+    matches =3D [fmt for fmt in TAG_FORMATS
+               if srcrev in tag_map.get(
+                   fmt.replace("${PV}", pv).replace("${BPN}", bpn), frozen=
set())]
+    if len(matches) =3D=3D 1:
+        return matches[0], None
+    if len(matches) > 1:
+        return None, f"ambiguous: multiple formats match ({', '.join(match=
es)})"
+
+    check_regex =3D data.getVar("UPSTREAM_CHECK_GITTAGREGEX", False)
+    if check_regex:
+        try:
+            compiled =3D re.compile(check_regex)
+        except re.error as exc:
+            return None, f"UPSTREAM_CHECK_GITTAGREGEX is invalid: {exc}"
+        regex_matches =3D []
+        for tag_name, shas in tag_map.items():
+            m =3D compiled.fullmatch(tag_name)
+            if (m and "pver" in m.groupdict()
+                    and m.group("pver").replace("_", ".") =3D=3D pv
+                    and srcrev in shas):
+                regex_matches.append(tag_name)
+        if len(regex_matches) =3D=3D 1:
+            return regex_matches[0], None
+        if len(regex_matches) > 1:
+            return None, ("ambiguous: UPSTREAM_CHECK_GITTAGREGEX matched "
+                          f"multiple tags ({', '.join(sorted(regex_matches=
))})")
+
+    return None, "no well-known tag format matched SRCREV on remote"
+
+
+def add_candidate(result, exp_url, name, data):
+    """Fill in result.tag_fmt/detail for a missing-tag URL under --query-r=
emote.
+
+    Sets result.status to 'remote-error' if the remote could not be querie=
d.
+    """
+    srcrev, reason =3D get_literal_srcrev(name or "default", data)
+    if not srcrev:
+        result.detail =3D f"no suggestion: {reason}"
+        return
+    pv, reason =3D get_release_pv(data)
+    if not pv:
+        result.detail =3D f"no suggestion: {reason}"
+        return
+
+    try:
+        ud =3D bb.fetch2.FetchData(exp_url, data)
+    except bb.fetch2.FetchError as exc:
+        result.status =3D "remote-error"
+        result.detail =3D str(exc)
+        return
+
+    fmt, reason =3D deduce_tag_format(ud, srcrev, pv, data.getVar("BPN") o=
r "", data)
+    if fmt:
+        result.tag_fmt =3D fmt
+        result.detail =3D f"candidate: ;tag=3D{fmt}"
+    elif reason.startswith("remote error"):
+        result.status =3D "remote-error"
+        result.detail =3D reason
+    else:
+        result.detail =3D f"no suggestion: {reason}"
+
+
+def check_url(entry, data, args):
+    """Process a single git/gitsm SRC_URI entry.  Returns a UrlResult."""
+    exp =3D data.expand(entry)
+    try:
+        scheme, host, path, _u, _p, parm =3D bb.fetch2.decodeurl(exp)
+    except bb.fetch2.MalformedUrl as exc:
+        return UrlResult(entry, exp, "", "parse-error", detail=3Dstr(exc))
+
+    base_url =3D f"{scheme}://{host}{path}"
+    name =3D parm.get("name", "")
+    # The git fetcher no longer supports comma-separated name=3D values.
+    if "," in name:
+        return UrlResult(entry, base_url, name, "parse-error",
+                         detail=3D"comma in name=3D parameter")
+    if parm.get("tag"):
+        return UrlResult(entry, base_url, name, "tagged", tag=3Dparm["tag"=
])
+
+    result =3D UrlResult(entry, base_url, name, "missing")
+    if args.query_remote:
+        add_candidate(result, exp, name, data)
+    return result
+
+
+def check_recipe(data, args):
+    """Return a list of UrlResult for every git/gitsm SRC_URI entry."""
+    entries =3D oe.recipeutils.split_var_value(
+        data.getVar("SRC_URI", False) or "", assignment=3DFalse)
+    return [check_url(e, data, args) for e in entries
+            if e.startswith(("git://", "gitsm://"))]
+
+
+def add_tag_to_entry(entry, tag_fmt):
+    """Return entry with ;tag=3D<tag_fmt> added (entry must be a literal U=
RL)."""
+    decoded =3D list(bb.fetch2.decodeurl(entry))
+    decoded[5]["tag"] =3D tag_fmt
+    return bb.fetch2.encodeurl(decoded)
+
+
+def find_source_file(entry, data):
+    """Return (filepath, None) for the one file whose SRC_URI fragment
+    literally contains entry, or (None, reason) if that can't be determine=
d
+    unambiguously.
+
+    entry must contain no variable references (checked by the caller).  On=
ly
+    files recorded in SRC_URI's variable history are considered, and entry
+    must appear as a whole space-separated token in exactly one of them (t=
his
+    also catches the case where the git URL is set in a .inc file that is
+    require'd by the .bb, which is common for git recipes).
+    """
+    matches =3D []
+    for event in data.varhistory.variable("SRC_URI") or []:
+        fn =3D event.get("file")
+        detail =3D event.get("detail")
+        if not fn or not detail:
+            continue
+        if entry in detail.split() and fn not in matches:
+            matches.append(fn)
+
+    if not matches:
+        return None, "URL not found literally in SRC_URI history"
+    if len(matches) > 1:
+        return None, f"URL set in multiple files: {', '.join(matches)}"
+    return matches[0], None
+
+
+def apply_tag(fn, entry, tag_fmt):
+    """Replace entry with entry;tag=3D<tag_fmt> in fn.  entry must appear =
as a
+    whole space/quote-delimited token exactly once.
+
+    Returns (True, None) on success, or (False, reason) on error.
+    """
+    try:
+        with open(fn, encoding=3D"utf-8") as f:
+            content =3D f.read()
+    except OSError as exc:
+        return False, f"read error: {exc}"
+
+    pattern =3D re.compile(r'(?<![^\s"])%s(?=3D[\s"\\]|$)' % re.escape(ent=
ry))
+    replacement =3D add_tag_to_entry(entry, tag_fmt)
+    new_content, count =3D pattern.subn(lambda _m: replacement, content)
+    if count !=3D 1:
+        return False, f"expected 1 occurrence of URL in {fn}, found {count=
}"
+
+    try:
+        with open(fn, "w", encoding=3D"utf-8") as f:
+            f.write(new_content)
+    except OSError as exc:
+        return False, f"write error: {exc}"
+    return True, None
+
+
+def write_candidates(data, results, layer_path):
+    """Write unambiguous ;tag=3D candidates directly into their source fil=
e(s).
+
+    Only literal SRC_URI entries (no ${...}) are touched.  Returns the lis=
t
+    of (UrlResult, filepath) pairs that were written.
+    """
+    written =3D []
+    for r in results:
+        if r.status !=3D "missing" or not r.tag_fmt:
+            continue
+        if "${" in r.entry:
+            r.detail =3D f"write skipped: URL contains variable references=
 ({r.entry})"
+            continue
+        fn, reason =3D find_source_file(r.entry, data)
+        if not fn:
+            r.detail =3D f"write skipped: {reason}"
+            continue
+        if layer_path and not under_layer(fn, layer_path):
+            r.detail =3D f"write skipped: {fn} is outside --layer"
+            continue
+        ok, reason =3D apply_tag(fn, r.entry, r.tag_fmt)
+        if ok:
+            written.append((r, fn))
+        else:
+            r.detail =3D f"write skipped: {reason}"
+    return written
+
+
+def under_layer(fn, layer_path):
+    """Return True if fn is under layer_path (already realpath'd)."""
+    try:
+        return os.path.commonpath([os.path.realpath(fn), layer_path]) =3D=
=3D layer_path
+    except ValueError:
+        return False
+
+
+def main():
+    """Main entry point."""
+    parser =3D argparse.ArgumentParser(
+        description=3D"Report (and optionally fix) git SRC_URI entries mis=
sing ;tag=3D",
+        formatter_class=3Dargparse.RawDescriptionHelpFormatter,
+        epilog=3D"NOTE: --query-remote (implied by --write) contacts upstr=
eam "
+               "git servers.")
+    parser.add_argument("--query-remote", action=3D"store_true",
+                        help=3D"Query upstream remotes to suggest a ;tag=
=3D for "
+                             "missing entries (requires network access)")
+    parser.add_argument("--write", action=3D"store_true",
+                        help=3D"Apply unambiguous tag candidates to their =
source "
+                             "recipe/.inc files; implies --query-remote.  =
Only "
+                             "literal SRC_URI entries (no ${...}) are modi=
fied.")
+    parser.add_argument("--recipe", metavar=3D"PN",
+                        help=3D"Check only this recipe name")
+    parser.add_argument("--layer", metavar=3D"PATH",
+                        help=3D"Check only recipes under this layer direct=
ory")
+    parser.add_argument("--fail-on-missing", action=3D"store_true",
+                        help=3D"Exit non-zero if any URLs are still missin=
g ;tag=3D "
+                             "after this run (remote errors are not counte=
d)")
+    parser.add_argument("--verbose", "-v", action=3D"store_true",
+                        help=3D"Show tagged and parse-error URLs as well")
+    args =3D parser.parse_args()
+
+    if args.write:
+        args.query_remote =3D True
+
+    layer_path =3D None
+    if args.layer:
+        layer_path =3D os.path.realpath(args.layer)
+        if not os.path.isdir(layer_path):
+            sys.exit(f"error: --layer is not a directory: {args.layer!r}")
+
+    logging.basicConfig(
+        format=3D"%(levelname)s: %(message)s",
+        level=3Dlogging.DEBUG if args.verbose else logging.WARNING)
+
+    stats =3D dict.fromkeys(
+        ("total", "tagged", "missing", "candidate", "written",
+         "remote_error", "parse_error"), 0)
+    modified_files =3D []
+
+    with bb.tinfoil.Tinfoil(tracking=3DTrue) as tinfoil:
+        tinfoil.prepare()
+        pkg_pn =3D tinfoil.cooker.recipecaches[''].pkg_pn
+        checked_files =3D set()
+
+        for pn in sorted(pkg_pn):
+            if args.recipe and pn !=3D args.recipe:
+                continue
+
+            for fn in pkg_pn[pn]:
+                realfn, _, _ =3D bb.cache.virtualfn2realfn(fn)
+                if realfn in checked_files:
+                    continue
+                checked_files.add(realfn)
+                if layer_path and not under_layer(realfn, layer_path):
+                    continue
+
+                data =3D tinfoil.parse_recipe_file(realfn)
+                results =3D check_recipe(data, args)
+                if not results:
+                    continue
+
+                if args.write:
+                    written =3D write_candidates(data, results, layer_path=
)
+                    for _r, wfn in written:
+                        if wfn not in modified_files:
+                            modified_files.append(wfn)
+                else:
+                    written =3D []
+                written_results =3D {r for r, _fn in written}
+
+                basename =3D os.path.basename(realfn)
+                for r in results:
+                    stats["total"] +=3D 1
+                    label =3D f"{pn}  {basename}"
+                    if r.name and r.name !=3D "default":
+                        label +=3D f"  name=3D{r.name}"
+                    else:
+                        label +=3D f"  {r.base_url}"
+
+                    if r.status =3D=3D "tagged":
+                        stats["tagged"] +=3D 1
+                        if args.verbose:
+                            print(f"OK:           {label}  tag=3D{r.tag}")
+                    elif r.status =3D=3D "missing":
+                        stats["missing"] +=3D 1
+                        if r.tag_fmt:
+                            stats["candidate"] +=3D 1
+                        if r in written_results:
+                            stats["written"] +=3D 1
+                            print(f"WRITTEN:      {label}  ;tag=3D{r.tag_f=
mt}")
+                        else:
+                            suffix =3D f"  {r.detail}" if r.detail else ""
+                            print(f"MISSING:      {label}{suffix}")
+                    elif r.status =3D=3D "remote-error":
+                        stats["remote_error"] +=3D 1
+                        print(f"REMOTE-ERROR: {label}  {r.detail}")
+                    elif r.status =3D=3D "parse-error":
+                        stats["parse_error"] +=3D 1
+                        if args.verbose:
+                            print(f"PARSE-ERROR:  {label}  {r.detail}")
+
+    print("\n--- Summary ---")
+    print(f"Git URLs checked : {stats['total']}")
+    print(f"  Tagged         : {stats['tagged']}")
+    print(f"  Missing tag    : {stats['missing']}")
+    if args.query_remote:
+        print(f"    candidate found: {stats['candidate']}")
+        print(f"  Remote error   : {stats['remote_error']}")
+    if args.write:
+        print(f"  Written        : {stats['written']}")
+    if stats["parse_error"]:
+        print(f"  Parse error    : {stats['parse_error']}")
+
+    if modified_files:
+        print("\nModified files:")
+        for fn in modified_files:
+            print(f"  {fn}")
+        print("\nReview changes with:  git diff")
+        print("Test affected recipes with:  bitbake -c fetch <recipe>")
+
+    if args.fail_on_missing and stats["missing"] - stats["written"] > 0:
+        return 1
+    return 0
+
+
+if __name__ =3D=3D "__main__":
+    sys.exit(main())
--=20
2.34.1


