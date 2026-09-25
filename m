Return-Path: <daniel.turull@ericsson.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCCEFC98326
	for <webhook@archiver.kernel.org>; Fri, 25 Sep 2026 08:24:28 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3558.1790324662776582196
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2026 01:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ericsson.com header.s=selector2 header.b=gb389MhB;
 spf=pass (domain: ericsson.com, ip: 40.107.162.23, mailfrom: edaturu@ericsson.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vrvxcn6q0KWn2TiigKmRJGCEATxTKgBURszh5+MGoWINaLiNB5BmvI5MzQAQ2n0KaTIMY4Xw/dx7yd3OMl1rlr2szQzNrQTnkYNNt9rNTA2Mguumh8oH0Y/aHkQZoQrxACUIhyVsN3rqnP/b5+DgU9iX9UuRruOYvM0Bv0d9gtj9Gfggax0VlPnA0iJInjPNTzI0cyN8ogx449CmzwZb5c23eWPXGNNvm3ygccLa+virlC3U3QuI0fj4in8vuJXPvwPfbEasyY+tyZKuMN8+Yr6qoZ3X0+McF0Cd3Y1eApayPDHGvJ8Ccbn5o5oLoMvKDjnfi31+QkukfH3Ph1vKgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5IZmBcP2tlaejE7i45oExMedrz3wmi46HL0RUBYu+iY=;
 b=L83h42t1HVwKGtYIE2m73sOBX0SiR4+QUDKuJIS0Aw+Yflwg4APoIxtaQ0et+EJxDu09C3kg+cig/ej1nUG7y/qFYSsItxiVxnZssOV5WKjA+8UDRNTbtpfAG0pUEC6+ICzdzVsoyEQ6Ss2Cgp3eP0RiNK2RUFxd5Roo2p2+Nt1TWQD6jNF4NU6C56v8sI80iGn723pq2pN1/D4aSa7V6+YDfsbI3+L/PZR/gBVVJMrS08ghku//GPSsKqIaaSMd15Qy9gkdqmDQVM5Nj9ZAqQJzP/xZu9ze28BeAhDYHYIFozXk4XlYnQxoPLeoAxMQs5mvXzI6lMtxscOudBT9Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.176.1.74) smtp.rcpttodomain=gmail.com smtp.mailfrom=ericsson.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=ericsson.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericsson.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5IZmBcP2tlaejE7i45oExMedrz3wmi46HL0RUBYu+iY=;
 b=gb389MhBeASI8wLpEarZ8jwGnb4iew7woItgS/pxvGOEftQmmJxqxY/QhN+XDyHkm1Tzb49r9fV1FJADLI6i110E+e2DK00utSq8hZr1QS1u/jEuGOjsUSJq5g5p4u1UE9AFJJxpxGqRYA8l+r4dR4T9WmmUc8Xe5bSgerw3SSlwBfu1a4YgPUL6COPTuMmrLYnhbr8uqFDIMRQmMlXf40NYkpShEUAHYhuG/b+HsGwUO1PR4UUIPCDMOOglswZ5V5f62JIaUlI7XK0aXuuK71fy4BoJCm+YiogAba6EjQYH67bmMDu6f+ks0WWyHCdO+nIsIS6FfW/LGgWmjJzS6A==
Received: from AS4P189CA0036.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:5dd::7)
 by VI1SPRMB0019.eurprd07.prod.outlook.com (2603:10a6:800:1de::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Fri, 25 Sep
 2026 08:24:16 +0000
Received: from AM2PEPF00070CF2.eurprd02.prod.outlook.com
 (2603:10a6:20b:5dd:cafe::9d) by AS4P189CA0036.outlook.office365.com
 (2603:10a6:20b:5dd::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.451.18 via Frontend Transport; Fri,
 25 Sep 2026 08:24:16 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 192.176.1.74) smtp.mailfrom=ericsson.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ericsson.com;
Received-SPF: Pass (protection.outlook.com: domain of ericsson.com designates
 192.176.1.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.176.1.74; helo=oa.msg.ericsson.com; pr=C
Received: from oa.msg.ericsson.com (192.176.1.74) by
 AM2PEPF00070CF2.mail.protection.outlook.com (10.167.242.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Fri, 25 Sep 2026 08:24:16 +0000
Received: from seroius18814.sero.gic.ericsson.se (153.88.142.248) by
 smtp-central.internal.ericsson.com (100.87.178.67) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Fri, 25 Sep 2026 10:24:13 +0200
Received: from seroius08462.sero.gic.ericsson.se (seroius08462.sero.gic.ericsson.se [10.63.237.245])
	by seroius18814.sero.gic.ericsson.se (Postfix) with ESMTP id 527BC4020C1F;
	Fri, 25 Sep 2026 10:24:11 +0200 (CEST)
Received: by seroius08462.sero.gic.ericsson.se (Postfix, from userid 160155)
	id 25C5D700CF25; Fri, 25 Sep 2026 10:24:11 +0200 (CEST)
From: <daniel.turull@ericsson.com>
To: <openembedded-core@lists.openembedded.org>
CC: <JPEWhacker@gmail.com>, Daniel Turull <daniel.turull@ericsson.com>
Subject: [PATCH v2 1/2] create-spdx-3.0: record component release date in SPDX output
Date: Fri, 25 Sep 2026 10:24:03 +0200
Message-ID: <20260925082404.1491266-1-daniel.turull@ericsson.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF00070CF2:EE_|VI1SPRMB0019:EE_
X-MS-Office365-Filtering-Correlation-Id: 3dc9f693-0ee8-4057-4fa9-08df1ade63b1
X-SMTP-Server: smtp-central.internal.ericsson.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|23010399003|376014|56012099006|10067099003|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: 
	UUzWVDok7qNdHtFFTN0A0Q6bUVEp7aGeVISHpCGfUM36/WAssGrTU8H5ofJztinjZQ1qakinyvjaaan6QO8ffqm/p1FIqwkuPHYf30GsE+YgTqELvytVGQY34ycSDijfawLkn9keYLxsj1f01Bbp8qK6ZsyKV1onTMgTPHGyPUuHReshYhWzexHbnre7z6l57SYNlSGwxcsZUul1rb1VbwfLecyJivHe0cwqfUhdgo2grUeFPuyZ5avxiw/XxoiDb87CdYnXy+e6OyxBYAAfaF8x/ccK6ILWNhLK458/cBfe4lII0xv1g1vmMm0b+oOmo9p+3lLC5kw2c/4TGNvOzJZZQFp7HiI5WFOYIhVc2f1hwYPci+7x+CFisCqDdPmS/IKwq26diLWRqEq+xuITbE+CJLQEZ02gM8W5eDIutBoE1IQN14agwz9CeK2XnZF0kq5EYDX6Y1hKKjfnKCNyf5z1yv28CG9J5Ckz/si3I/YvGgXGpRAVCF0zJ00AAuwifXjIbTBZQGPbNxt6uw79JK6plrLkZEGObfUFcgbFsa01mZUOLVzuzL3JpKucp3A8y+I/SxUI4Pl52z2xEScuw9yRUtYmLb+AWB8XlBh52aZsWcDt1aSBhqk70WjaqnxfgmeURKQzOnMFH8WCAdMgu8En5zjjWWKrdqBtM65vIQd2AdT3XN6n1E0FJGbHeDLRtypcRXPdoB/bxLasip3Ejg==
X-Forefront-Antispam-Report: 
	CIP:192.176.1.74;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:oa.msg.ericsson.com;PTR:office365.se.ericsson.net;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(23010399003)(376014)(56012099006)(10067099003)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	9X5+WxeOR50B2jFvCBMR+S3eUJNdjRci9AM8Svdu+kHvqSIIqhlYcMtSPge7n/wm/j9qhQOrf5ie0yo4082QimFZtnEtUQiYt50jiY8xQw8/jWr3KSUHAgE7joMKeewl9Dyfq6sFL0qVRlj79Tl8xtT3eMHPy2z+q7zo5q80LfxCu0wYa5Ium5o28I9OSONCwPpZpCh12a35nHXA25tAh6V+MJT4XCvyt2rgr1q/vjWXstxLneV26kTb2e/0lkJvEOvbcXFnOmVnwASXvZqKRPMUDdP3UJeAT/B2N3NxT49VNtejY8pbjVbcgnUmNevkhsMUnUES8Xbt5iSfT0K6gnax6yZjCtCC5fENFIjLu3itxdtrNO0V0hQJcID1ZLE1GoNpUn6W/6GM/oRzUre4gji0SZ+ovVt63Msla0iKAce6GdGryWM/0xA5nXILq2+D
X-OriginatorOrg: ericsson.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Sep 2026 08:24:16.6912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3dc9f693-0ee8-4057-4fa9-08df1ade63b1
X-MS-Exchange-CrossTenant-Id: 92e84ceb-fbfd-47ab-be52-080c6b87953f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=92e84ceb-fbfd-47ab-be52-080c6b87953f;Ip=[192.176.1.74];Helo=[oa.msg.ericsson.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM2PEPF00070CF2.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1SPRMB0019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2026 08:24:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246609

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
---
 meta/classes/create-spdx-3.0.bbclass |  2 +-
 meta/lib/oe/spdx30_tasks.py          | 27 +++++++++++++++
 meta/lib/oeqa/selftest/cases/spdx.py | 52 ++++++++++++++++++++++++++++
 3 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/meta/classes/create-spdx-3.0.bbclass b/meta/classes/create-spd=
x-3.0.bbclass
index 56fd01fd53..da413d19a3 100644
--- a/meta/classes/create-spdx-3.0.bbclass
+++ b/meta/classes/create-spdx-3.0.bbclass
@@ -192,7 +192,7 @@ python do_create_recipe_spdx() {
     import oe.spdx30_tasks
     oe.spdx30_tasks.create_recipe_spdx(d)
 }
-addtask do_create_recipe_spdx
+addtask do_create_recipe_spdx after do_deploy_source_date_epoch
=20
 SSTATETASKS +=3D "do_create_recipe_spdx"
 do_create_recipe_spdx[sstate-inputdirs] =3D "${SPDXRECIPEDEPLOY}"
diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index b6456a214a..46cc0c5711 100644
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
@@ -36,6 +37,28 @@ def set_timestamp_now(d, o, prop):
         delattr(o, prop)
=20
=20
+def get_release_date(d):
+    """Resolve the release date to record in a recipe's releaseTime proper=
ty.
+
+    Uses the SOURCE_DATE_EPOCH already determined for reproducible builds
+    (SDE_FILE), without falling back to SOURCE_DATE_EPOCH_FALLBACK, since =
a
+    fixed fallback timestamp is not a meaningful release date.
+
+    Returns a datetime, or None if no release date should be recorded.
+    """
+    sde_file =3D d.getVar("SDE_FILE")
+    if not sde_file or not os.path.isfile(sde_file):
+        return None
+
+    source_date_epoch =3D oe.reproducible.epochfile_read(sde_file, d)
+    if source_date_epoch =3D=3D d.getVar("SOURCE_DATE_EPOCH_FALLBACK"):
+        # SDE_FILE exists but its value is only the fallback (e.g. no git
+        # checkout and no fetched source to derive a date from).
+        return None
+
+    return datetime.fromtimestamp(int(source_date_epoch), tz=3Dtimezone.ut=
c)
+
+
 def add_license_expression(
     d, objset, license_expression, license_data, search_objsets=3D[]
 ):
@@ -633,6 +656,10 @@ def create_recipe_spdx(d):
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
index 8285189382..fe23824ba6 100644
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
@@ -443,3 +444,54 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain =
digits"
             )
+
+    def test_release_date_source_date_epoch(self):
+        """releaseTime should be derived from the recipe's SDE_FILE."""
+        objset =3D self.check_recipe_spdx(
+            "base-files",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-base-files.spd=
x.json",
+            task=3D"create_recipe_spdx",
+        )
+
+        sde_file =3D get_bb_var("SDE_FILE", "base-files")
+        self.assertExists(sde_file)
+        with open(sde_file) as f:
+            source_date_epoch =3D int(f.read())
+
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
+    def test_release_date_omitted_for_fallback_value(self):
+        """releaseTime must be omitted when SDE_FILE only has the fallback=
."""
+        objset =3D self.check_recipe_spdx(
+            "packagegroup-base",
+            "{DEPLOY_DIR_SPDX}/{MACHINE_ARCH}/static/static-packagegroup-b=
ase.spdx.json",
+            task=3D"create_recipe_spdx",
+        )
+
+        sde_file =3D get_bb_var("SDE_FILE", "packagegroup-base")
+        fallback =3D get_bb_var("SOURCE_DATE_EPOCH_FALLBACK", "packagegrou=
p-base")
+        self.assertExists(sde_file)
+        with open(sde_file) as f:
+            self.assertEqual(
+                f.read().strip(), fallback,
+                "packagegroup-base has no SRC_URI; SDE_FILE is expected to=
 "
+                "only contain SOURCE_DATE_EPOCH_FALLBACK",
+            )
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

