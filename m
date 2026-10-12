Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A741CA9EC5
	for <webhook@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:43 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11390.1791806015376689585
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2026 04:53:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=YiioSMOm;
 spf=pass (domain: ericsson.com, ip: 52.101.65.49, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gOC02f37a1yrA5PQ7OeBLNXEDX8HOssEcQXRyzWqIH6SSlaNOZapIF8+BTkhYkcDvTaD3DIMl/eGzGUn7QY8PTEqmLRI1XtbAaWQSvXVva5ShsOPn5rldE/0VNzQ//ESzJzI0VlIJD2l7KJtCSNNma6omfLgg6/6aDWieC8EST91FEAiHMt6RDMxqKgUFN2kTOBIvYr6H0veZ8BUan7s+2VwPwjj9QGcMXbzRkdbyQTXpLmWqsdBx4eV5Ye9PWEo51Ejnk/h+nndh5me0YvXN9XlDr7tyRU5jQLixwB4f0Sn+/dlIlRbkm8ACMWcmOzk3j7cNAUqsFjgyXCd0VN/wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rgGr3sE/EbwLWVvrRfehVlTsRBpiC4pkm7uYxNlTp9o=;
 b=n5rX1FaTOpS03B5Dml5ZpfCVjNLXYd/92zPUA3dUX406lhrbJDGAZ7F3Cu9HqlBywI91UqWnHvZBxR5FhGlR3SMyRFR9mxjD6S2JCrgMVBC4ohUSvBR21+3gEB0TaU+a5DhfcPDYof2LwyrfjpIvNZnq5Th9aONK/DID66cxtZhITg3i9mDWZuDJ9CThZO4TaZK347dnBIePcKCH9rwLl9P2Y8XDXnbE8gm5Bq/ALfEy8xDu33ZOGHWZHVqGU9GJCrAZo+u91VP4SBrgDtjh1Y8BXP8X/DVrNlPPGSgiNZm/3WOr962520n59McJ2OMHfFGii+u29r91GyZUfB/9rQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rgGr3sE/EbwLWVvrRfehVlTsRBpiC4pkm7uYxNlTp9o=;
 b=YiioSMOmfl3FnpHpx1ONsZ+CXqVvVLmLl5O2NzwBKGyHH+ELWXthVHiXuVLPcCKVArpbnZOhm6anOkEAiFXzVfTxOy6Cs3Aldq6Ldsk2vyQ2yKdw5kL9p/eKqeeaAR97ZKEQPaQUENVTOCVg+uw/OSnS316+KD84EpArLpIGHHvEHVkd2AIluvLDnq5x/iUE1/W0Av8kC/8xxAMAAXkXsTihiLdmTwhfShxFvok2MlDlbfITvFJWGR6xNyZk+B/SeyXmiFc4kVv7HnlHN8m3i9KI8+g6gvULO/qPusGgE5WGQkyUVD9s5i2vJTeS377FSkIZ6xEJXjXgrjlOomMiBQ==
Received: from AM0PR10CA0010.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:17c::20)
 by PA4PR07MB7327.eurprd07.prod.outlook.com (2603:10a6:102:f6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Mon, 12 Oct
 2026 11:53:30 +0000
Received: from AMS1EPF00000094.eurprd05.prod.outlook.com
 (2603:10a6:208:17c:cafe::4) by AM0PR10CA0010.outlook.office365.com
 (2603:10a6:208:17c::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Mon, 12
 Oct 2026 11:53:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AMS1EPF00000094.mail.protection.outlook.com (10.167.242.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Mon, 12 Oct 2026 11:53:29 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.69) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 12 Oct 2026 13:53:29 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 4739D4020C1E;
	Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 1803A7003EA9; Mon, 12 Oct 2026 13:53:24 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v5 2/3] create-spdx-3.0: record component release date in SPDX output
Date: Mon, 12 Oct 2026 13:53:18 +0200
Message-ID: <20261012115319.1704048-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261012115319.1704048-1-daniel.turull@ericsson.com>
References: <20261012115319.1704048-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000094:EE_|PA4PR07MB7327:EE_
X-MS-Office365-Filtering-Correlation-Id: 99f3a2a1-c931-43d1-c4ca-08df28576eea
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700016|1800799024|23010399003|11063799006|56012099006|18002099003|22082099003|260925022911599003|260925021311599003|260925021911599003|261009223027099003|3023799007|10067099003;
X-Microsoft-Antispam-Message-Info: 
	2OmTndjDJmATyWSisKIA9k5kJ8w//IYXK8kpEgsUsGshd1UDWwC5U34ifhWl7R9PLwoP0D+5B/ReIhbSSKGejjtjCTjOwRiXGtztCicrOrdew25BLLjLjJeJn3vwnIuKXV/eEhne5eiyw7P/EXpjUopWmKRPZnc5AXB6MDPirTZdTV2zQYFBdYBuvuhiZfZbjG1MOe27y9myZaqzsafGRp25sBG0FhYHj/uRs0NYyYkY1AFCpXPCSeMXcysf9KDtJLEQ0ixCkeC4XcgRDwIioeo3HzrM28Pp8T2vszLjmpOxZ4I+AVFqkjtxVYozcInPVrW0MzW2uUVVFESIh6AxJRoXPEemDtg2W0EBEjBtC6kcKXRteCOHyhCFb09pZVhXYJ2yEPqmdYJCqb8R+xVHIf++QgCr9eLQUK7hHvx0WZyO05bDTmR7QCY/7TlM0MNwAqXh+tm+1XCb3/5aidPncv1z2nheIKwXKxwVv4ZJMO6UHd+/j9vI0YJtNPROe+abQ3kpMkqDs/1PIMq3aWc7MQnESh4IuGOgPNSYPN2IhHi70fAdo8js+mvlrmSx6QjNJqUHbHvp8160FPXurUFy9ZeLIN4aa86hOwoHXaaZgfqcXi+tVeEPA6iV4Reip4c+rtirfdg8Nn9bjANCTo8zuPUylEVmPZlGXVtX/PnwKMnnls6Pv+mPJzv+W2EG3zzy5ymkSULoxsG5qjZzeLr9DA==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(22082099003)(260925022911599003)(260925021311599003)(260925021911599003)(261009223027099003)(3023799007)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	PnbFgbwHWzYnk9qdMq5dJGSNs+u/fYbgWFAVLDc+67VJ+H2b8Wb4kkCbVx5jvvE38A7YL/fhs8gEIeyK07bUux2g4+lUdnGwE6+M1GD9ODLzvzfNh7yJR7K1/aUUNVpGb5H2P3WQqqFzMeJHIwVEJb4Rfi6YGV+E4ioUCp0Lrz/IgjOYHMp5GeAsNG7q8nwsPWyvWBQaxn7PLM2ROhNOoY/fVIvY1c5TP5/iAISygmGV7XkorKa2CIMM/nfCHwmPbeUBz0LWHjKZFcvAk4dSotYf5O8S+waggoQfVkt5BL7c1WykaEEWDnUIhTa1SWfIMu2QrwFn/E17xgjDOM6QEHIMGMSo1+zAxIz+Xxtoq0OHtuPAt1mSP1H/d/xcOTJUL5B/6KL3fhV0dPRvsHYF2z3WjYNu7Odh3k9zS4xxNaN3qNgI9gWNutvxVVIpZaX1
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2026 11:53:29.7439
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99f3a2a1-c931-43d1-c4ca-08df28576eea
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000094.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7327
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2026 11:53:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247641

From: Daniel Turull <daniel.turull@ericsson.com>

Record each package's release date in the releaseTime property of its
software_Package object, using the SOURCE_DATE_EPOCH already computed
for reproducible builds.

Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
git-tagged recipes, best-effort for tarball/http(s) sources. Some
Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
file mtimes to a fixed placeholder, so their releaseTime reflects
packaging-tool behavior, not the real release date.

Reported-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
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
---
 meta/lib/oe/spdx30_tasks.py          | 22 ++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 44 ++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6456a214a..dc82f21fb0 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -36,6 +36,24 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
=20
=20
+def get_release_date(d):
+    """Resolve the release date to record in a package's releaseTime prope=
rty.
+
+    Uses SOURCE_DATE_EPOCH, which by this point (do_create_spdx runs after
+    do_unpack and do_deploy_source_date_epoch) reflects the source mtimes.
+    Omits the fallback value since it is not a meaningful release date.
+
+    Returns a datetime, or None if no release date should be recorded.
+    """
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
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
@@ -441,6 +459,7 @@ def _enrich_source_package(d, dl, fd, file_name, primar=
y_purpose):
=20
 def add_download_files(d, objset):
     inputs =3D set()
+    release_date =3D get_release_date(d)
=20
     urls =3D d.getVar("SRC_URI").split()
     fetch =3D bb.fetch.Fetch(urls, d)
@@ -504,6 +523,9 @@ def add_download_files(d, objset):
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
index 8285189382..fb1176fe66 100644
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
@@ -443,3 +444,46 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain =
digits"
             )
+
+    def test_release_date_source_date_epoch(self):
+        """releaseTime should be derived from SOURCE_DATE_EPOCH.
+
+        This is recorded on the downloaded source software_Package objects
+        produced by do_create_spdx (not the recipe-only do_create_recipe_s=
pdx
+        task), since the release date can only be known once sources are
+        available and SOURCE_DATE_EPOCH has been computed.
+        """
+        # base-files has S =3D=3D UNPACKDIR and never gets a real
+        # SOURCE_DATE_EPOCH, so use tar, which unpacks a real tarball.
+        objset =3D self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-tar.spdx.json=
",
+        )
+
+        # With all tasks restored from sstate do_unpack never runs, leavin=
g
+        # SDE_FILE missing and SOURCE_DATE_EPOCH at its fallback value.
+        bitbake("tar -c unpack -f")
+        source_date_epoch =3D get_bb_var("SOURCE_DATE_EPOCH", "tar")
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

