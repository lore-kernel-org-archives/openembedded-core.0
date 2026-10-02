Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2845CA5FE2
	for <webhook@archiver.kernel.org>; Fri,  2 Oct 2026 07:54:29 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.33])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6380.1790927667504991524
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Oct 2026 00:54:27 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=EsJVrl0m;
 spf=pass (domain: ericsson.com, ip: 40.107.130.33, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPUjUZdKxm1Ts/tjtIKCe2Bm+LhpeDILr9VEX0Jih2FMkIzPfB1ALehH9iegP9FElmFO1hRA59BUbhXBwfGO0r7zUkbuReoBfPCn7aLkz6rcyK5ZhLNqEmN8wBgnB9Gn0sbsqCbLDaX/P3DwzJcNSXZVQmRLgtuG2iEEem7+xugEho7eTDCU/OpYLJnKiykjGHoYAqccHbMFidtFVj7Eu/cUxiigrXwjNxNXrjp7B1BaliazqKn/LajStQziL91R5gEVSJ2+v6xuqhhqUdaGBsc7f1aBqQlbmoG2K3fwyJRUQjbUk7+Au83U2Ki9QLfc3cK15E2G84HJiqM2a8Tfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pDiEzGmtUMnxd5YcH54BXLbcZLTPIq1az+b02OWveE8=;
 b=sXMTH/Y+pTI3x7iXOiV7o9FaRaz+Fpnc4fNGTbnLjC8AucyjcrVUNn7zfCNUc5Op/VTZNeL8Ob9DkrC+AHmbXpd5oxgppeUwkBdSLnOACtqyRz8cPKil785ugY9juoqh6pAVutHDY2vKZavLyQ9lEEOUZLIbCt/wfByESN3dviOSEMp/ssUnHSsQi3zkXpFqHgI1ToLhYPArH+9fw+MXdYtHvxPHSO4mBGK3GKUc40Ade6Qig+g+FZy610Dsk1Y/dgaXXiNPURH/vc/sB/bnH5sAXt5SgQ7LA06wx/mvlx6ofGiX7gQjCFQTjyPsEPQfyIl53LhlgQSo9Ouz9ZFwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pDiEzGmtUMnxd5YcH54BXLbcZLTPIq1az+b02OWveE8=;
 b=EsJVrl0mOaktBmzM3EWZFvXSfvxy970yuzeBhBKoX6bdHaZkRmfSJCmGW62YaeKYmcI6oieZWVeKhU8/5v5gaScWUNHwYzuJA9bUJVOpOkJimvpCXihKLWWbvRA1enQg7GHlyHr2IQfwWqNz38I+dmUOYXIgJd8XuuvJ3FVYq06sPe6AcgK97ORLa/aZHccygRn/uYWP/gG+zH9ln3Zj18B86NHa6OAdXAbEcIJ72K1LqleH6MvBXfK/i1jSVp9cjmqoBanxLVWxkvi9BP4WZcp85z9WVmRAhqTuteMsVQJB3ISGUvUvjSnnjf1buiixgKfcX5yOQNnE0zTt2O0NoQ==
Received: from ZRAP278CA0012.CHEP278.PROD.OUTLOOK.COM (2603:10a6:910:10::22)
 by AS1PR07MB8710.eurprd07.prod.outlook.com (2603:10a6:20b:479::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Fri, 2 Oct
 2026 07:54:19 +0000
Received: from ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
 (2603:10a6:910:10:cafe::40) by ZRAP278CA0012.outlook.office365.com
 (2603:10a6:910:10::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.19 via Frontend Transport; Fri, 2
 Oct 2026 07:54:19 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 ZR1PEPF0000E6B3.mail.protection.outlook.com (10.167.241.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Fri, 2 Oct 2026 07:54:19 +0000
Received: from seroius18815.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 2 Oct 2026 09:54:18 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18815.sero.gic.ericsson.se (Postfix) with ESMTP id 6C3174020B40;
	Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 3FB1E700CF28; Fri,  2 Oct 2026 09:54:18 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v4 2/3] create-spdx-3.0: record component release date in SPDX output
Date: Fri, 2 Oct 2026 09:54:13 +0200
Message-ID: <20261002075414.2311840-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261002075414.2311840-1-daniel.turull@ericsson.com>
References: <20261002075414.2311840-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZR1PEPF0000E6B3:EE_|AS1PR07MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf6f1dc-6f4b-464b-7b47-08df205a5d45
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|18002099003|22082099003|3023799007|260925022911599003|260925021311599003|10067099003|260925021911599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	0LqmshLCKUTnTYiJxjhb81UX0PidJqPNG4zYm0t43u9NnH5zetzZMJ+QHmoqRCssR3SK5EcQ90HYJoAPiOUKhtcRirfRDIMCNNihunygPXu1olbewLf/SgwRIJzufRMSMWZ21BQyQfKsnExptTYcHbETkywkBIVQj9jomG0dbYYqAUws7UE3KQNLjUPZdQ8V2mnsWWElve/W5jYga3IqVvYNydqhedCV4tXzEFkQ6lqI2Ndc4kJjgKVblahqXilwUG5Pn70T2ODC948SKuQVrX0HE1+PFQTssyyO0WpbMv3YhczD9ptCTU+Iao/g2D7Ll10n0H2MuM1Dtmdp56aYjpYZjJr63pPSktgdbqAsDH2DF9cR+n3nX6LPjpC7a3G4cZ6P8+v1vo36zz8OUUxWx7t8orVCPgX7yFXM/EPW7OZ5lXoYZETVhEnxbej9CTpHgTotsKIRWjWifji/KWM+MNRcqquaaW9wflMVQEXjVt6CSuQ80GNyh7OHHIShcYJrtC9QpEeKimW6Ijl2VUTzF4tTYkN6F1GeRYiBYRnsmUzAbe3NguVqg5K4CiOFvhILgeNXSi+BhmylVFiowP3ca3UgtUFlcDdNGBebY28c7b0KBqJlAvbShs6xgYEGB0lMZ5JSiaLg0MiXG2r8YHrVDzTGNKxPVYVbk62RzXkxShSGv0r2pIPxiWMMDx8ysQ00BzZE5HBbMibhAUripuKGUg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(18002099003)(22082099003)(3023799007)(260925022911599003)(260925021311599003)(10067099003)(260925021911599003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	hhRyOQJQ1vd8GOo1/oJXBkSgFy90rT2HJDMM3RCfJ4gV8dX95LnwQJwOiW4MHkAPYWgu045mULhfp2QKSuWiNh5kBsgJL5Zpa919gfYE5UJzlnPy2s9cVgJdqbJzi2vMVjzY11EYrhlAH17nSes43Y8dHRUwG4GAaGYmCdbY6OBv+VummW4VXGPOa8CD2yCWsxBg2/3lDF47/sm+N1TF2wwyOzKmT/JaI55KuQDSiQiOZCkpiKHW5T9wWspUXYLjd9U8nB1wcVcAwpupUxO7YfEtDXnui855i9ilDOys7C0sJhhVY3zR3r6kPoEd3NMS+nFyINnlcm8IwZHi37Nq+pa9xzMsl1AWe0MdXg97Bk/metoruK4tgjOeWwU6hhyaUISLFHnD6Vs4cLv4zhjuFA0SEPhqguzl/ogNPxUThzST1DLJajqxKoYNKBCwzHlJ
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2026 07:54:19.3166
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf6f1dc-6f4b-464b-7b47-08df205a5d45
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	ZR1PEPF0000E6B3.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR07MB8710
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Oct 2026 07:54:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247087

From: Daniel Turull <daniel.turull@ericsson.com>

Record each package's release date in the releaseTime property of its
software_Package object, using the SOURCE_DATE_EPOCH already computed
for reproducible builds.

Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
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
---
 meta/lib/oe/spdx30_tasks.py          | 22 +++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 41 ++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)

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
index 8285189382..88c3eb6b15 100644
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
@@ -443,3 +444,43 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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

