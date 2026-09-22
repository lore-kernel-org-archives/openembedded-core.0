Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5811FC982FE
	for <webhook@archiver.kernel.org>; Tue, 22 Sep 2026 14:44:00 +0000 (UTC)
Received: from DUZPR83CU001.outbound.protection.outlook.com (DUZPR83CU001.outbound.protection.outlook.com [52.101.66.16])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11951.1790088236985811541
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2026 07:43:57 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=IzrgIIBE;
 spf=pass (domain: ericsson.com, ip: 52.101.66.16, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TEWJj04N8oUW4jipo3QBjRsKXr425MGeZC1AfJasfyz3JH8PwwkJ0PQU2H3i77aHBIblRQkMTWhuA91bfN7o30bMUYeew6/Ik0+cIs9PKeUu5W8gSYMeT+sVK6IBqSQSKDrxRYmyxHqYaECnjJmkPhBchUz8CSvGaXZXCxw8SVPseEuyYYTSoEYdV3P7FOBPbBZZI7nDxU93tlY1DXracS9YAKFrpJwehgwfTI5qycgHW+1iFAp7rYKaqZbyDOY0Ug0Y3zU19XPZHAHhD+MWKvrBS2aTFdxjnUChp5Es4r3wz6M565rKjVUsFsy2qDS7MqBfQ9Xjs9mksv9KaMDTDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3unQZ5ASUnLtY8kmbPFGwsad6OfHosHRRAWCOuIrwqw=;
 b=Glqn67B+kVPsW/bwjTXo3tGogqgYD5D/+CwlWQ1HljxSzztbUcTfodQlkoOL9wKRHxc1bMwWz8BgZbUh6XsfodOcCp1tJPqWFBdEIivZ4+Jzm6PU2pSHlmN6RlRJtmEHLFnSW8ZfGR1tqYVUltKqNto1+2lxjc2wbvjwaM3Po3uZYSD8fZQYa+i3NX7f2KcEL5s9DjGVZEXNIlHaC0wxr66fnM8ZzURfcUIlNVm7AhNoTTqS8EdNAcpCdJxYr6hLWac8httIRzmJo2Avio3iULacian/8qO4by9/zqrtFKgmEjYHOa6wMqv5LnPdt3P8Z2aji45vzRMZ0BacEeo7pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3unQZ5ASUnLtY8kmbPFGwsad6OfHosHRRAWCOuIrwqw=;
 b=IzrgIIBEl3fadFvk/Iys39I6tNsAcT9NFzXV9gfdSAX3Qq6LyeZnCQSF7IOsNhG9decY21skxeeI4eiXYEY1w9lS/+TzKMDhFE+xtNVMWgPzc4FSRvMXBy8Zl5Pnm3Uf8G3pDLP0Dc1kU/hwdoz0Vv6fahF02TGtVbPMboPqMstovreWGk6OFC7DjVnj2r9EaIXsrnxG3rzsihXsL4y6uoIQCrkYHwvBhRTJSRmkKXaOx9ME1+C9TPMhkk7rASBxHCPVshNDBQj7Em64lK/P0cdcagDGP6KegTBL4TUuxWfAz2x0aZObb1nnTqizVVo2NTazsGxFPTmUXGkYVtUwqg==
Received: from GV3P280CA0057.SWEP280.PROD.OUTLOOK.COM (2603:10a6:150:9::25) by
 DUZPR07MB9717.eurprd07.prod.outlook.com (2603:10a6:10:4b1::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.16; Tue, 22 Sep 2026 14:43:50 +0000
Received: from WA1PEPF000099CF.eurprd04.prod.outlook.com
 (2603:10a6:150:9:cafe::55) by GV3P280CA0057.outlook.office365.com
 (2603:10a6:150:9::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.13 via Frontend Transport; Tue,
 22 Sep 2026 14:43:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.176.1.74)
 smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 WA1PEPF000099CF.mail.protection.outlook.com (10.167.242.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Tue, 22 Sep 2026 14:43:50 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Tue, 22 Sep 2026 16:43:47 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 963334020C12;
	Tue, 22 Sep 2026 16:43:39 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 63477700CF25; Tue, 22 Sep 2026 16:43:39 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH] create-spdx-3.0: record component release date in SPDX output
Date: Tue, 22 Sep 2026 16:43:29 +0200
Message-ID: <20260922144329.3703514-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: WA1PEPF000099CF:EE_|DUZPR07MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fec08de-9140-46a3-78b4-08df18b7ea6a
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|23010399003|36860700016|11063799006|6133799003|3023799007|10067099003|56012099006|18002099003|17002099007;
X-Microsoft-Antispam-Message-Info: 
	mK/IHc8aSEMjz0CZdXxQ/0zZJNrKgB7UVYyAZTds+rGmx/2AsfGIQ3HFF315HlGoboa/+5ejMNfTiAX4Og2yottqwRPUO+a5d2v9GOG+WsSuyD6ETomlnqRKGfvv8isbbq6z0+ben/iMh7p5mq0P8i6kLc3bpvfd1Z3EGziriF8V/bMTkD+fl+goQ+oK/PBlSOafPV9gm/c21JhFVlB4M5wZNKAVu+zndD+aDaLHs+UtvouxI8ErKQgwQA0LIzlUpAPjg7qeqGPzONNSo/LeRrf1WB/BmhvwbbaqcrLnLN+uqrpGHIGJvTWOnY8PaXl8aMI5/ioIircPHFaMfGMi9n6hsoMN3mo6PGoNjVXEIU4VLqU4OA+qtOzkIAxzS5TNwfNfgYsOJT/5NMBD3w8EnA+ub9iukUETBGSRO42QDq9WwRtIHXQOQ9SLKUHuqjIaMiyVrimAdep/WAhlaUPVNy5OYUqQUp1OlfiqhVQbFFIy3XPbdJhcaiRXuhSIWouBR+qGAfLeS5gx3jDE0t4l0TuxOQG0y05p4Gv2fUdSQktfUGQ8QJNxz9t06ET/JX9cMhxdV/cNkpOwlXkdmu8Rs/5cnncSV0leU2/fFTvJZhWARB9JJtwuV6MOoOd8ygJggRZY2bYSuTxSUv4dDRoyNpCFBRoUZhqGmZQ/+MOOWB93kgZ3cTWpT/sBtMTbf0FNYaEDXrZGBHhM9QfjS/OY6g==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(23010399003)(36860700016)(11063799006)(6133799003)(3023799007)(10067099003)(56012099006)(18002099003)(17002099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	A9mbY8xxD5xOA8k9PSp5i09MSingcnrbJ/4W0m+jZ3oNC6qYhDaeVzhYpg7gGoGSpbU6c74Ce0tdyMzoDLpW95E4TTyVWSOifCGdFCmzRBmjUeqmh2Z/+LzXU4qxl7F/qeJTcX5U+BBjg/EcBIXpPS/XopsXhFeE6zHy5CvDg2ypAdhhOD0df1EEgaLrf92X6ioZd6x+v57uMe7S5l2Iyp9uAN5JDUsSbgBGR3bc6SXgT82qhEMX7tRSIp4GxCbJFKEb3uB/e7r6Um9vaKz7eUxN5t29Tvuek5Ily7hgnPoVVDQJa7WzUKHp+LKp5OTpXr+9GHp3EKcQ617cQpSe6Zbvfdrg9BQbeYMHJdjwdsClVpITIpB+CmE4IlhlJ8aQLqduIipPTvRKwQm6EdqTI/Ctyx8MrCeHggy/r/RT/6jKySZhipfUZ7siLerYEexB
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2026 14:43:50.0184
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fec08de-9140-46a3-78b4-08df18b7ea6a
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	WA1PEPF000099CF.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR07MB9717
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2026 14:44:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246419

From: Daniel Turull <daniel.turull@ericsson.com>

Add SPDX_INCLUDE_RELEASE_DATE (default enabled), which records each
recipe's release date in the releaseTime property of its
software_Package object, using the SOURCE_DATE_EPOCH already computed
for reproducible builds. SPDX_RELEASE_DATE_INCLUDE_PATCHES (default
disabled) additionally considers the Date: header of applied patches,
using the newest of SOURCE_DATE_EPOCH and all patch dates found;
SPDX_COMPONENT_RELEASE_DATE overrides both.

Tested with oe-selftest -r spdx (full suite, including the new
release-date cases) with no regressions.

AI-Generated: Uses Kiro with Claude Sonnet 5
Signed-off-by: Daniel Turull <daniel.turull@ericsson.com>
---
 meta/classes/create-spdx-3.0.bbclass |  20 +++-
 meta/lib/oe/spdx30_tasks.py          |  65 ++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 142 +++++++++++++++++++++++++++
 3 files changed, 226 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass
index 56fd01fd53..9955ffad85 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -163,6 +163,23 @@ SPDX_GIT_PURL_MAPPINGS[doc] =3D "A space separated lis=
t of domain:purl_type \
     on gitlab.example.com to the pkg:gitlab PURL type. \
     github.com is always mapped to pkg:github by default."
=20
+SPDX_INCLUDE_RELEASE_DATE ??=3D "1"
+SPDX_INCLUDE_RELEASE_DATE[doc] =3D "If set to '1', record the release date=
 of \
+    each recipe in the software_Package releaseTime property, derived from=
 \
+    SOURCE_DATE_EPOCH. Set to '0' to omit the property entirely."
+
+SPDX_RELEASE_DATE_INCLUDE_PATCHES ??=3D "0"
+SPDX_RELEASE_DATE_INCLUDE_PATCHES[doc] =3D "If set to '1', also consider t=
he \
+    Date: header of applied patches in SRC_URI when determining the releas=
e \
+    date recorded in releaseTime, using the newest of SOURCE_DATE_EPOCH an=
d \
+    all patch dates found. Has no effect if SPDX_INCLUDE_RELEASE_DATE is '=
0'."
+
+SPDX_COMPONENT_RELEASE_DATE ??=3D ""
+SPDX_COMPONENT_RELEASE_DATE[doc] =3D "Overrides the release date recorded =
in the \
+    releaseTime property for this component. Expected format is full ISO 8=
601 \
+    UTC (YYYY-MM-DDTHH:MM:SSZ). Takes precedence over SPDX_INCLUDE_RELEASE=
_DATE \
+    and SPDX_RELEASE_DATE_INCLUDE_PATCHES."
+
 IMAGE_CLASSES:append =3D " create-spdx-image-3.0"
 SDK_CLASSES +=3D "create-spdx-sdk-3.0"
=20
@@ -192,7 +209,7 @@ python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
 }
-addtask do_create_recipe_spdx
+addtask do_create_recipe_spdx after do_deploy_source_date_epoch
=20
 SSTATETASKS +=3D "do_create_recipe_spdx"
 do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"
@@ -201,6 +218,7 @@ do_create_recipe_spdx[file-checksums] +=3D "${SPDX3_DEP=
_FILES}"
 do_create_recipe_spdx[cleandirs] =3D "${SPDXRECIPEDEPLOY}"
 do_create_recipe_spdx[deptask] +=3D "do_create_recipe_spdx"
 do_create_recipe_spdx[vardeps] +=3D "${SPDX3_VAR_DEPS}"
+do_create_recipe_spdx[vardeps] +=3D "SPDX_INCLUDE_RELEASE_DATE SPDX_RELEAS=
E_DATE_INCLUDE_PATCHES SPDX_COMPONENT_RELEASE_DATE"
 do_create_recipe_spdx[file-checksums] =3D "${@bb.fetch.get_checksum_file_l=
ist(d)}"
=20
 python do_create_recipe_spdx_setscene () {
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 9978ae731c..e6340c3678 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -36,6 +36,65 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
=20
=20
+def get_release_date(d):
+    """Resolve the release date to record in a recipe's releaseTime proper=
ty.
+
+    Returns a datetime, or None if no release date should be recorded.
+    """
+    override =3D d.getVar("SPDX_COMPONENT_RELEASE_DATE")
+    if override:
+        try:
+            return datetime.strptime(override, "%Y-%m-%dT%H:%M:%SZ").repla=
ce(tzinfo=3Dtimezone.utc)
+        except ValueError:
+            bb.fatal(
+                "SPDX_COMPONENT_RELEASE_DATE value '%s' is not valid. "
+                "Expected format: YYYY-MM-DDTHH:MM:SSZ (e.g. 2024-03-15T12=
:00:00Z)" % override
+            )
+
+    if d.getVar("SPDX_INCLUDE_RELEASE_DATE") !=3D "1":
+        return None
+
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+    if not source_date_epoch:
+        return None
+
+    release_date =3D datetime.fromtimestamp(int(source_date_epoch), tz=3Dt=
imezone.utc)
+
+    if d.getVar("SPDX_RELEASE_DATE_INCLUDE_PATCHES") =3D=3D "1":
+        # Only the static Date: header is used, never "git log" on the
+        # layer's repo, since that varies with clone depth/history.
+        for url in oe.patch.src_patches(d):
+            patch_path =3D bb.fetch.decodeurl(url)[2]
+            patch_date =3D _get_patch_date_header(patch_path)
+            if patch_date and patch_date > release_date:
+                release_date =3D patch_date
+
+    return release_date
+
+
+def _get_patch_date_header(patch_path):
+    """Parse the 'Date:' header from a git-format-patch style file, if
+    present, and return it as a timezone-aware datetime, or None."""
+    from email.utils import parsedate_to_datetime
+
+    try:
+        with open(patch_path, errors=3D"replace") as f:
+            for line in f:
+                if line.startswith("Date:"):
+                    try:
+                        parsed =3D parsedate_to_datetime(line[len("Date:")=
:].strip())
+                    except (ValueError, TypeError):
+                        return None
+                    if parsed.tzinfo is None:
+                        return None
+                    return parsed.astimezone(timezone.utc)
+                if line.startswith("---") or line.startswith("diff --git")=
:
+                    break
+    except OSError:
+        return None
+    return None
+
+
 def add_license_expression(
     d, objset, license_expression, license_data, search_objsets=3D[]
 ):
@@ -631,6 +690,12 @@ def create_recipe_spdx(d):
     if val :=3D d.getVar("DESCRIPTION"):
         recipe.description =3D val
=20
+    release_date =3D get_release_date(d)
+    if release_date is not None:
+        recipe.releaseTime =3D release_date
+    else:
+        delattr(recipe, "releaseTime")
+
     for cpe_id in oe.cve_check.get_cpe_ids(
         d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
     ):
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py
index 8285189382..3b6d02d38c 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -6,8 +6,11 @@
=20
 import textwrap
 import hashlib
+import os
+from datetime import datetime, timezone
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
+import oeqa.utils.ftools as ftools
 import oe.spdx30
=20
=20
@@ -443,3 +446,142 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase)=
:
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain =
digits"
             )
+
+    def test_release_date_source_date_epoch(self):
+        """releaseTime should be derived from SOURCE_DATE_EPOCH by default=
."""
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spd=
x.json",
+            task=3D"create_recipe_spdx",
+        )
+
+        # Query after the build so the do_unpack stamp file exists.
+        source_date_epoch =3D get_bb_var("SOURCE_DATE_EPOCH", "base-files"=
)
+        expected =3D datetime.fromtimestamp(int(source_date_epoch), tz=3Dt=
imezone.utc)
+
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "base-files":
+                recipe =3D pkg
+                break
+
+        self.assertIsNotNone(recipe, "Unable to find base-files software_P=
ackage")
+        self.assertEqual(recipe.releaseTime, expected)
+
+    def test_release_date_disabled(self):
+        """SPDX_INCLUDE_RELEASE_DATE =3D "0" should omit releaseTime entir=
ely."""
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spd=
x.json",
+            task=3D"create_recipe_spdx",
+            extraconf=3D"""\
+                SPDX_INCLUDE_RELEASE_DATE =3D "0"
+                """,
+        )
+
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "base-files":
+                recipe =3D pkg
+                break
+
+        self.assertIsNotNone(recipe, "Unable to find base-files software_P=
ackage")
+        self.assertIsNone(
+            recipe.releaseTime,
+            "releaseTime should not be set when SPDX_INCLUDE_RELEASE_DATE =
is '0'",
+        )
+
+    def test_release_date_override(self):
+        """SPDX_COMPONENT_RELEASE_DATE overrides the resolved date."""
+        override_date =3D "2020-01-01T00:00:00Z"
+
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spd=
x.json",
+            task=3D"create_recipe_spdx",
+            extraconf=3Df"""\
+                SPDX_COMPONENT_RELEASE_DATE =3D "{override_date}"
+                """,
+        )
+
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "base-files":
+                recipe =3D pkg
+                break
+
+        self.assertIsNotNone(recipe, "Unable to find base-files software_P=
ackage")
+        self.assertEqual(
+            recipe.releaseTime,
+            datetime(2020, 1, 1, tzinfo=3Dtimezone.utc),
+        )
+
+    def _write_test_patch(self, recipe, date_header):
+        """Write a no-op patch against a fixture file (not part of the
+        recipe's real source, so it isn't coupled to its content) with the
+        given Date: header, and point FILESEXTRAPATHS at it."""
+        inc_file =3D self.write_recipeinc(
+            recipe,
+            textwrap.dedent(
+                """\
+                FILESEXTRAPATHS:prepend :=3D "${THISDIR}/files:"
+                SRC_URI +=3D "file://release-date-test-file"
+                SRC_URI +=3D "file://release-date-test.patch"
+                """
+            ),
+        )
+        patch_dir =3D os.path.join(os.path.dirname(inc_file), "files")
+        os.makedirs(patch_dir, exist_ok=3DTrue)
+        ftools.write_file(
+            os.path.join(patch_dir, "release-date-test-file"),
+            "original content\n",
+        )
+        patch_path =3D os.path.join(patch_dir, "release-date-test.patch")
+        ftools.write_file(
+            patch_path,
+            textwrap.dedent(
+                f"""\
+                From: Test Author <test@example.com>
+                Date: {date_header}
+                Subject: [PATCH] modify release-date-test-file
+
+                Upstream-Status: Inappropriate [test patch, not intended f=
or upstream]
+
+                ---
+                --- a/release-date-test-file
+                +++ b/release-date-test-file
+                @@ -1 +1 @@
+                -original content
+                +patched content
+                """
+            ),
+        )
+        self.track_for_cleanup(patch_dir)
+        return patch_path
+
+    def test_release_date_include_patches(self):
+        """SPDX_RELEASE_DATE_INCLUDE_PATCHES =3D "1" makes a newer patch
+        Date: header win over SOURCE_DATE_EPOCH."""
+        newer_patch_date =3D "Mon, 15 Jun 2099 00:00:00 +0000"
+
+        self._write_test_patch("base-files", newer_patch_date)
+        self.add_command_to_tearDown("bitbake -c clean base-files")
+
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spd=
x.json",
+            task=3D"create_recipe_spdx",
+            extraconf=3D"""\
+                SPDX_RELEASE_DATE_INCLUDE_PATCHES =3D "1"
+                """,
+        )
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "base-files":
+                recipe =3D pkg
+                break
+        self.assertIsNotNone(recipe, "Unable to find base-files software_P=
ackage")
+        self.assertEqual(
+            recipe.releaseTime,
+            datetime(2099, 6, 15, tzinfo=3Dtimezone.utc),
+        )

