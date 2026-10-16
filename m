Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F32DCCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:56:27 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19191.1792148183745458024
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 03:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=UzqneQfS;
 spf=pass (domain: ericsson.com, ip: 40.107.130.30, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ndsA2Vz/X8p873YVVjKEz4qyhZ0zXgkUPW0fb+ROhEl0G04rszYJiGC7XcvGn+V/bV5W0BP4QfrzL2qbYKYq7bo/XSZRwJNHMVlmkLjNCkiljkpcJDedfki4fKPX0OL2MfFI3jysjzzjf1voD/xppzxeuOFReyL0VsaU+RD4dP3aTuqLSaRMtpEMRr+9mcaQvCq59SMYsEmsGokSIcgwpLmrvT2f8q/vknrBUt/DtXUSAvlIb17pFSt2xNa18oZ7UQbIL0xQNo6FVfPOSHtvGtNfgfd48uB6mr0gwk3hfX0q3cxoQ9NCbKsn8XwelKUFypk11zrFMKgxO1zCqX7lVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wREE2g1P4uzfVjWIIT65ojGfwAbwVeclf7w1jNkjytg=;
 b=RBQPzGvJkjO0K0MjlJ2cTHc6ZKKWPtstZhW7WRLTwBGwwNHdkagLTunEeU3Ni0vBGR2DNy+HZlvvB+r2WC1qiOTKd4kswsR6MAjbC0k5Q5S54SfcrPh80PsfQ9vDweVfRx/9s81rw3hRqVjDeAEriLXNu/m2i/Oo9ch1vTsz6VTem1Qa7E1czvneRmWbmzHywj+1vYAOXTBkFXcv3MAjJKnm35d3EDYmFODQpU3vi89gIZEfsSERVddVweDLxs33phYMN80lmYEAUzcYfoBOZIZZDy+9UCoQ4kvd/xRX9d/OixaDksBFhfe6pxpFZy1Y+kgGm8yoawODCqWOJOENWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wREE2g1P4uzfVjWIIT65ojGfwAbwVeclf7w1jNkjytg=;
 b=UzqneQfSocCqtaQUS080c2owdVkoIW71zXsOu2fYHc5luc+QrfG9ReRf4nsx/QDOywt8L0CozF44YOpK3EsLq5WD+9kk7qghcHR+4mIysVzEtxDhx/e7+53IkCxvDhWw8SwyJt0oePsGEThTP/tt2eQd1cvr0jCTkAoLipAN7rp/m/Ql/5pvaxVhKC54eqh0eCGbczMOf6+yaO5IqD9hH5e0lT2Cl4gU/eLpAVWZ50+RWAYx8lFExJriq1UNARmnyAAerZY2G/xUIrv18nhQCepfLR9X+RrlDL9vMjPIV8N5MxmTkaDhQJXb0giOChfDDsi7ar7fvgohKWy+tSFn0w==
Received: from PA7P264CA0384.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:399::9)
 by AMBPR07MB196320.eurprd07.prod.outlook.com (2603:10a6:20b:7b1::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Fri, 16 Oct
 2026 10:56:17 +0000
Received: from ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
 (2603:10a6:102:399:cafe::7d) by PA7P264CA0384.outlook.office365.com
 (2603:10a6:102:399::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 16
 Oct 2026 10:56:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 ZR1PEPF0000E6AF.mail.protection.outlook.com (10.167.241.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 16 Oct 2026 10:56:17 +0000
Received: from seroius18813.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 16 Oct 2026 12:56:17 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18813.sero.gic.ericsson.se (Postfix) with ESMTP id 43ED99581C;
	Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 16CD87003EA9; Fri, 16 Oct 2026 12:56:16 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v6 2/3] create-spdx-3.0: record component release date in SPDX output
Date: Fri, 16 Oct 2026 12:56:10 +0200
Message-ID: <20261016105611.330514-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261016105611.330514-1-daniel.turull@ericsson.com>
References: <20261016105611.330514-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6AF:EE_|AMBPR07MB196320:EE_
X-MS-Office365-Filtering-Correlation-Id: 184e3ff5-7edd-486d-ce7c-08df2b741ac8
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|23010399003|1800799024|82310400026|56012099006|11063799006|261009223027099003|260925021911599003|10067099003|18002099003|22082099003|260925022911599003|260925021311599003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	c9I2Uz3feDIMK0RKAljo3UyUmv6M2ycYZHCiV/+hzxyfmaK5k/KaLj3w+OoOzeWWPIkTzio9GW9vORsuCI0MxYAfQp5JrL2cfjcTtWY9iDiUHdsis/dvc89W23lkR1q3hpZXYQ7qH0bXWtpVyxvzFTEvLuBw6A9ziwZP1u5oUuTiRJ3owgdrA0Jfxr1/s3bJ8nbzSyfEf/bl5LOvf6TBLBNLfk63bR/4k6rhytOLB4j4XOoszlmWN1oQh/vCJCvBZGqf6uzJqzvBRJQ1ok4WN4YYaATPTB0ixkjHr6dSD3q+rIlsWIQKD8ggUPlw2KIrsaocT3dhQeIhlczY9xAxeXIYLGMik1cc+1+CCIHTjnQcuLeEVgMrMlN6Q+OFhjreM0xmqP3cxZ+MzZf5KTqObSY22+Vy+l1SPspjT4MF5EKfvg5aZ7tqmcPw9ttRqqzGVUenYOZ+4cSeZTosW9sowTTaBkff2ljSUaQVkDct7S8jmEvz38gv1NsBDUUZbfc6XAbZv2zLCbxKpHEC2d94kE4GHLypmZczUU10HuHmVEbucb6kVE9auLM8ffRztwj+ydegRQMVnCctGZXarti+oKoEXIEnAJP6WNkXIN6qXRhYkrkSr2S+qqoTyOHcR9t/7QJyMvs1fO5iXlIYLEZmtE6emydFIwz08f8560Uzp9Vaxfzyv6Dn9ojr7qrawzSSUTJUIrUYD+oqxqzuGo+6cw==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(23010399003)(1800799024)(82310400026)(56012099006)(11063799006)(261009223027099003)(260925021911599003)(10067099003)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	f3FAZkBMVJLcI+cqWwT5UGe25useclmjBI6Q2XM3qCrexFfGdO+zyySWF0SaTAtEFJ6SSVIWYzzSWULHpWvPSj0zhri2YDESW7997H+fU0f7S97biSM4x48Lq13nG/XwruURaasDoFd+C1IPYFBN48fwzhAbqLh8uJlW8+H3FkWusrJeNfDeHd9D0N5wDW0I4PNc3LJOr45Vgh+ohf+SNsZ9c619/tTUlGQaTssrHQtRLj1DC4me/WdDxjx351u4cfcN4AB7UEl5NPUG+0JjogHuXpS+sG7JrKsI1atUidz7q/BCiqC1A9c4YfSItcLybcPBU++VT3gbdU8zOMuTp7RsFey41l2X+GxFI56SJptDrXkGkWX7K9FMA5c3cxPhVsB26e6TjNC65lVulcL8+8KTeh3yBjQDMdW0O71HGbfa5pDXj4L5KH+oC+UShFdq
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 10:56:17.4738
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 184e3ff5-7edd-486d-ce7c-08df2b741ac8
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	ZR1PEPF0000E6AF.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR07MB196320
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 10:56:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248010

From: Daniel Turull <daniel.turull@ericsson.com>

Record each package's release date in the releaseTime property of its
software_Package object, using the source date epoch already computed
for reproducible builds.

Accuracy depends on how the source date epoch was derived: exact for
git-tagged recipes, best-effort for tarball/http(s) sources. Some
Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
file mtimes to a fixed placeholder, so their releaseTime reflects
packaging-tool behavior, not the real release date.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
v2:
- Dropped all options per Joshua's feedback; read SDE_FILE directly.
- Dropped the redundant else: delattr(recipe, "releaseTime") branch.
- Selftest compares against SDE_FILE content directly instead of
  SOURCE_DATE_EPOCH, which can diverge from it.
- Fixed a leak: recipes with no git checkout and no fetched source
  had SDE_FILE holding only SOURCE_DATE_EPOCH_FALLBACK, showing a
  bogus 2011-04-05T23:00:00Z releaseTime instead of none.
v3:
- Also run after do_unpack: do_deploy_source_date_epoch's setscene
  shortcut can skip it, leaving SOURCE_DATE_EPOCH unset.
- get_release_date() reads SOURCE_DATE_EPOCH again instead of
  SDE_FILE, now that they're guaranteed equivalent.
- test_release_date_source_date_epoch: switched to tar (base-files
  has S =3D=3D UNPACKDIR and never gets a real SOURCE_DATE_EPOCH).
- Added test_release_date_omitted_for_fallback_value.
v4:
- Per Richard's feedback, moved releaseTime from do_create_recipe_spdx
  to do_create_spdx to keep the recipe-only task fetch-free.
- Per Joshua's suggestion added into each downloaded source software_Packag=
e
- Updated selftests accordingly.
v5:
- test_release_date_source_date_epoch: force do_unpack before reading
  SOURCE_DATE_EPOCH. Mathieu hit this on the autobuilder: with all tasks
  restored from sstate do_unpack never runs, so SDE_FILE is missing and
  SOURCE_DATE_EPOCH falls back, making the test compare the correct
  releaseTime against the fallback date.
v6:
- Per Joshua's feedback, get_release_date() now reads SDE_FILE via
  oe.reproducible.epochfile_read() instead of SOURCE_DATE_EPOCH, since
  a recipe can set SOURCE_DATE_EPOCH itself to override the computed
  value, and that override is not a release date.
- Added test_release_date_ignores_source_date_epoch_override.
---
 meta/lib/oe/spdx30_tasks.py          | 25 +++++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 42 ++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6456a214a..1d11d8d1d2 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -9,6 +9,7 @@ import oe.cve_check
 import oe.license
 import oe.packagedata
 import oe.patch
+import oe.reproducible
 import oe.sbom30
 import oe.sdk
 import oe.spdx30
@@ -36,6 +37,26 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
=20
=20
+def get_release_date(d):
+    """Resolve the release date to record in a package's releaseTime prope=
rty.
+
+    Reads SDE_FILE via oe.reproducible.epochfile_read() directly, rather t=
han
+    SOURCE_DATE_EPOCH, since a recipe may set SOURCE_DATE_EPOCH itself to
+    override the computed value, and that override is not a release date.
+
+    Omits the fallback value since it is not a meaningful release date.
+
+    Returns a datetime, or None if no release date should be recorded.
+    """
+    source_date_epoch =3D oe.reproducible.epochfile_read(d.getVar("SDE_FIL=
E"), d)
+    if not source_date_epoch or source_date_epoch =3D=3D d.getVar(
+        "SOURCE_DATE_EPOCH_FALLBACK"
+    ):
+        return None
+
+    return datetime.fromtimestamp(int(source_date_epoch), tz=3Dtimezone.ut=
c)
+
+
 def add_license_expression(
     d, objset, license_expression, license_data, search_objsets=3D[]
 ):
@@ -441,6 +462,7 @@ def _enrich_source_package(d, dl, fd, file_name, primar=
y_purpose):
=20
 def add_download_files(d, objset):
     inputs =3D set()
+    release_date =3D get_release_date(d)
=20
     urls =3D d.getVar("SRC_URI").split()
     fetch =3D bb.fetch.Fetch(urls, d)
@@ -504,6 +526,9 @@ def add_download_files(d, objset):
=20
             _enrich_source_package(d, dl, fd, file_name, primary_purpose)
=20
+            if release_date is not None:
+                dl.releaseTime =3D release_date
+
             if fd.method.supports_checksum(fd):
                 for checksum_id in bb.fetch.CHECKSUM_LIST:
                     if checksum_id not in oe.spdx30.HashAlgorithm.NAMED_IN=
DIVIDUALS:
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py
index 8285189382..c900558b44 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -6,6 +6,7 @@
=20
 import textwrap
 import hashlib
+from datetime import datetime, timezone
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
 import oe.spdx30
@@ -443,3 +444,44 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain =
digits"
             )
+
+    def test_release_date_source_date_epoch(self):
+        """releaseTime should be derived from SDE_FILE via epochfile_read(=
).
+
+        This is recorded on the downloaded source software_Package objects
+        produced by do_create_spdx (not the recipe-only do_create_recipe_s=
pdx
+        task), since the release date can only be known once sources are
+        available and SOURCE_DATE_EPOCH has been computed.
+        """
+        objset =3D self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-tar.spdx.json=
",
+        )
+
+        bitbake("tar -c unpack -f")
+        sde_file =3D get_bb_var("SDE_FILE", "tar")
+        with open(sde_file) as f:
+            source_date_epoch =3D f.read()
+        expected =3D datetime.fromtimestamp(int(source_date_epoch), tz=3Dt=
imezone.utc)
+
+        pkg =3D None
+        for candidate in objset.foreach_type(oe.spdx30.software_Package):
+            if candidate.software_downloadLocation:
+                pkg =3D candidate
+                break
+
+        self.assertIsNotNone(pkg, "Unable to find downloaded source softwa=
re_Package")
+        self.assertEqual(pkg.releaseTime, expected)
+
+    def test_release_date_omitted_without_downloaded_source(self):
+        """releaseTime only applies to downloaded source packages; recipes
+        with only local file:// sources have none, and get no releaseTime.=
"""
+        # base-files only has file:// sources, so it has no downloaded
+        # source software_Package and thus no releaseTime anywhere.
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/builds/build-base-files.spdx=
.json",
+        )
+
+        for candidate in objset.foreach_type(oe.spdx30.software_Package):
+            self.assertIsNone(candidate.releaseTime)

