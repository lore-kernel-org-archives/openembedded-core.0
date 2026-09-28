Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5114CCA5FA6
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 19:04:30 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.32])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.65594.1790622264715364112
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 12:04:25 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=azoNlccQ;
 spf=pass (domain: ericsson.com, ip: 52.101.83.32, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dD7G9skcsgVGP6NbSF+66kShHGDtXZ5CfQOc0RREIlJMGvt+QjKMdKcjFJBtTr7IbZboF8bg/Iq3XaJ99ERulU561LsgiUOLOEQIdOTzqOmkxaqBHgyRVRHVGmAfZDy7Zjyj81u1NZ6lt9TjFBnWJOcaMleueOd/kh5/1q9qdLVenJCDUVExTy5KHpCg3JlVNSZFJ1TJ1VUt+ffjS58mGCoWyJfY3HdhHSkNHB0owFCpznEoK6Xpb7aalaHlH940xkJVI/lirTjWTOps9ufZqPg6ynrnVa7QdaGLaDfgWuzBCGGOSsfNpqUdI2+xfdsx8uETQ56T4Zn7pUXbP02rSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g79nCB8Y3ptmP4PXtL2MjmYNQaP7oeR3x9dEaBKI34=;
 b=UXnDWkn6hsOLi5NLsUZ+T66uXCeh/3sAPThn9wCnLk2OEESSapPg5KoS8dDR2h1gdHs+Q+11LJ/v2rjfgyF5IS6T1/Z9bSKz7MrA7Y9Jq+ezW5DJtOYHodZtabQNtnpS6IYrCY8w6HDw8lkL+xsx8uP81u5TW2vasISbJ2I/8r0yy94fWKmZX244Fs3GxKl7owzzfyNNywW1xtJIoz/pK7jMURvI93gGlEabyT0TsD7k/cSdkLGoBWB9qoeWrCH9+uXrglSiulByhZQc7PmWNmn55kaEiRXxTRx4DAyu6NlTiUkpbGJPECY8YFChwkJUtb8rutE/u5cFKwQUJ/HfjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=bootlin.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g79nCB8Y3ptmP4PXtL2MjmYNQaP7oeR3x9dEaBKI34=;
 b=azoNlccQ22CSi4VqNi/wGXpiEsF02u3PR9xsO/lgN24CQAOk/RKeW5fIVHzGcOB5lwyy+UJafGHiHJqLiNwXN7H9kotPQQWESFw8hqZnK6HIpuPGELcIun6fY0SELLF4P1HK9f2AwtYcEi5LGROWtcXn03SBRzGDHjT8lULZV/rREx9bwVaOOluOq4b+FBeZpImJ9MgSYs41UV51MLDlGKeCPdO9frTlJn0RF1/oCi8AQNXPyPlSWHhULMUZs6ZAJGCKhePeXdiM5UMobiDNGSsgB7pHGGIHNKkTbWgdM4stB/ESZzE2EMRJkjblFGAwSeYv+VlhBzL5hzJmHCIVwg==
Received: from PAZP264CA0051.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1fc::11)
 by DU2PR07MB8111.eurprd07.prod.outlook.com (2603:10a6:10:270::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.24; Mon, 28 Sep
 2026 19:04:17 +0000
Received: from MI3PEPF0000848B.eurprd02.prod.outlook.com
 (2603:10a6:102:1fc:cafe::62) by PAZP264CA0051.outlook.office365.com
 (2603:10a6:102:1fc::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.24 via Frontend Transport; Mon,
 28 Sep 2026 19:04:17 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 MI3PEPF0000848B.mail.protection.outlook.com (10.167.240.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Mon, 28 Sep 2026 19:04:17 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.64) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Mon, 28 Sep 2026 21:04:07 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id DB3E740203DF;
	Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id B12D4700CF28; Mon, 28 Sep 2026 21:04:05 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, <mathieu.dubois-briand@bootlin.com>, Daniel Turull
	<daniel.turull@ericsson.com>
Subject: [PATCH v3 2/3] create-spdx-3.0: record component release date in SPDX output
Date: Mon, 28 Sep 2026 21:03:59 +0200
Message-ID: <20260928190400.3908822-3-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260928190400.3908822-1-daniel.turull@ericsson.com>
References: <20260928190400.3908822-1-daniel.turull@ericsson.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PEPF0000848B:EE_|DU2PR07MB8111:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d42734c-2322-46d9-a25c-08df1d934b70
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|23010399003|22082099003|18002099003|56012099006|10067099003|260925021311599003|260925022911599003|260925021911599003|3023799007|11063799006;
X-Microsoft-Antispam-Message-Info: 
	82GzlZE8iLpA5cYIzoWFc4nzfOg/2ct8rv1njStBQxEqf5ux8fdczVH7tqU29mdC/9Ipj1mOfTCSlTurUjPtXbwFLyr3L1ArPSmNgPxiL7uGjnmEqMd47JSdqnzqFBwnpPltmmCslRfZW8uPch74A6sKH1RW+HCWnokntExKNjrrg0JiDCHKtz3T/Ahm7UaohLmDNVX4xc0nfKEUu69IYWhn4TKsNgfKa6sUTRd5ifzb8jfx0IA48bbzSM6HpUb/MR8mqmYVqpsiMJocybDcONdguZ0oOg5DADh8E1LraB0nPD5Xg1hgxv31kX/MYXD6nUlaLXcDALd61pz1B/mBqiQTQIxrHaYVqrGzMlVjLhkwXnR8fENp3Ez+wIU4cdkNd4hHlR4N1eHl6Y/1Vg531Cjs0sGTDsdpU7oQyJNwa9XR2UfHvdxfHrJ+R/3+T7lctgnrhi3yd0NwJOfPQPm18YOwuRf7QD0zT1xQuOqiJXE9aFPQJSOiVrP5Hy8qePkczOOYMZv21heBJEEX/8yvzGd0dkF48ae6+y3Ht714Q4E3MT/KhiUZprn2dEnFqQvna9q/LkV2dBqrgXDrxkYcatelKCgHEi6Ac8hmlAeToxTHD3DVn2JcYsw6nSD4Z3uJf1g+90c9blBR2jVEclzWtY9ocpRGQ1TE5i/fmgRIQGFxAJ9Duskzbc+3lcrJVhylxpjvdUfxLJ2Fh1cxAp+QyQ==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(23010399003)(22082099003)(18002099003)(56012099006)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(3023799007)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	kFD2VmOPxsVu0hwrTwwDayFlvE1RrhYd4HWarvTHOW8p2YNtdWQEQpXBS83gxXe9X7KKnKxAOK4w4EbDG2cTe0LbLt82f27WoUTk19aMJuJv2rWdGphpCyMVqO95saUnW0ZJa4WcieunRT2AB5rQtJZ3F7oODvtmCYHa21P/8f3+xP4x3yDomGZ/PK39GgPk9cG2XWVfOpAPxEmGL0nOq9wLaQ4/UiU22EgotZNlfbNyeCLUWrJjygyiITFPJzCxNJjBNeWZgWhlcbtHTI/jC9l5xjV8QdOBHTp0196T+rxfuqvuvNwAhrFnEL8csu53GmyAG2xg5ozR4Tx/46rjuE1WLnT6gG8mzKbE3pWQIjfNe65ZDAGy5Mgt/raXttG3Uu8oU7hBMSkftgqYu8Kncj8BIXxuVI8l9MG6y3H4Vs6jlg0Yue50LM1Y5ieUpEi/
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 19:04:17.2172
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d42734c-2322-46d9-a25c-08df1d934b70
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	MI3PEPF0000848B.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR07MB8111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 19:04:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246791

From: Daniel Turull <daniel.turull@ericsson.com>

Record each recipe's release date in the releaseTime property of its
software_Package object, using the SOURCE_DATE_EPOCH already computed
for reproducible builds.

Accuracy depends on how SOURCE_DATE_EPOCH was derived: exact for
git-tagged recipes, best-effort for tarball/http(s) sources. Some
Python sdists (e.g. cryptography, hypothesis, maturin) normalize all
file mtimes to a fixed placeholder, so their releaseTime reflects
packaging-tool behavior, not the real release date.

Tested with oe-selftest -r spdx, and with `bitbake world
--runall=3Ddo_create_spdx`: 1011/1150 recipes got a releaseTime (range
1998-12-30 to 2026-09-17), 139 correctly had none.

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
---
 meta/classes/create-spdx-3.0.bbclass |  2 +-
 meta/lib/oe/spdx30_tasks.py          | 19 ++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 39 ++++++++++++++++++++++++++++
 3 files changed, 59 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass
index 56fd01fd53..2b1465b5a6 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
 }
-addtask do_create_recipe_spdx
+addtask do_create_recipe_spdx after do_unpack do_deploy_source_date_epoch
=20
 SSTATETASKS +=3D "do_create_recipe_spdx"
 do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6456a214a..964c2f1594 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -36,6 +36,21 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
=20
=20
+def get_release_date(d):
+    """Resolve the release date to record in a recipe's releaseTime proper=
ty.
+
+    Uses SOURCE_DATE_EPOCH; omits the fallback value since it's not a
+    meaningful release date.
+
+    Returns a datetime, or None if no release date should be recorded.
+    """
+    source_date_epoch =3D d.getVar("SOURCE_DATE_EPOCH")
+    if not source_date_epoch or source_date_epoch =3D=3D d.getVar("SOURCE_=
DATE_EPOCH_FALLBACK"):
+        return None
+
+    return datetime.fromtimestamp(int(source_date_epoch), tz=3Dtimezone.ut=
c)
+
+
 def add_license_expression(
     d, objset, license_expression, license_data, search_objsets=3D[]
 ):
@@ -633,6 +648,10 @@ def create_recipe_spdx(d):
     if val :=3D d.getVar("DESCRIPTION"):
         recipe.description =3D val
=20
+    release_date =3D get_release_date(d)
+    if release_date is not None:
+        recipe.releaseTime =3D release_date
+
     for cpe_id in oe.cve_check.get_cpe_ids(
         d.getVar("CVE_PRODUCT"), d.getVar("CVE_VERSION")
     ):
diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/=
cases/spdx.py
index 8285189382..668915b686 100644
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
@@ -443,3 +444,41 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain =
digits"
             )
+
+    def test_release_date_source_date_epoch(self):
+        """releaseTime should be derived from SOURCE_DATE_EPOCH."""
+        objset =3D self.check_recipe_spdx(
+            "tar",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/static/static-tar.spdx.jso=
n",
+            task=3D"create_recipe_spdx",
+        )
+
+        source_date_epoch =3D get_bb_var("SOURCE_DATE_EPOCH", "tar")
+        expected =3D datetime.fromtimestamp(int(source_date_epoch), tz=3Dt=
imezone.utc)
+
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "tar":
+                recipe =3D pkg
+                break
+
+        self.assertIsNotNone(recipe, "Unable to find tar software_Package"=
)
+        self.assertEqual(recipe.releaseTime, expected)
+
+    def test_release_date_omitted_for_fallback_value(self):
+        """releaseTime must be omitted when SDE_FILE only has the fallback=
."""
+        # packagegroup-base has no SRC_URI, so it only ever gets the fallb=
ack.
+        objset =3D self.check_recipe_spdx(
+            "packagegroup-base",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-packagegroup-b=
ase.spdx.json",
+            task=3D"create_recipe_spdx",
+        )
+
+        recipe =3D None
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            if pkg.name =3D=3D "packagegroup-base":
+                recipe =3D pkg
+                break
+
+        self.assertIsNotNone(recipe, "Unable to find packagegroup-base sof=
tware_Package")
+        self.assertIsNone(recipe.releaseTime)

