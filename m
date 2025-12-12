Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39409D44159
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:53 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.100])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9097.1765531187120471987
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=W60uQ/mw;
 spf=pass (domain: phytec.de, ip: 52.101.83.100, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gyl1GaDMjP8BI59QcYM+r6us86Krok+yvhNqluZ0JiB5a2q1zK3fs2QAPkIU6F77XHbpMZ/QhIemwIANYOEJNjle8pQRY1pvcKzmx6auO/fOPLcgyKFg4LGimfKHI+SXg4LHE+68WGN0Nz6sB36BfkuYcnlzA6JLsh6SM4Hm0oKntG3/KKTcF3VLw2k6p5nYF33XKkrae2L5jR5NSjnNrHgGVdrCF3/TOuU7t4lNHG9XvvuEtH4xZPEEOfdYK09TiABfLHPaLof5EDKXopdWZNBTj/x6rQk8Sm2HX7ieV48fnGrh8UfahshD3kqHPej0KrSeOqZrsIvda2t/FLkY8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lG44S4AMEMwUKYCIEAA+K6wdVdMXNmFAG8mgDHmS/s=;
 b=eghPxPRHh+69ZaerB1k9T8MZ9xj72kI6orSe2GJW4wAalC/lVrHusmjfXk74m2fewjV2VwADZx0VBFkY+mT8y0TOkMVBHEesqU24mRAIX4WMKoRG3cZNoEF7at86zsmjrR8pQMbxNUvOtmtRQoT0IpJem7B7yGUvyzrttxLsFrUc7hpITKT50YNcvgfTK070YlgFOobpQn0msBBoZNAzjMK1eRAZzfIUCFsEy9IpXqtKSbQuxzflf4f83M6J5/wU2ZcqA3njukVzXOHLYZpPEpWhBEZxv+jO9Y/aBJ4/L8xqJLARzKIYH0xahH3QeRHtY0+0xxBDGAzFzhQ4Dl8xDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lG44S4AMEMwUKYCIEAA+K6wdVdMXNmFAG8mgDHmS/s=;
 b=W60uQ/mw78WAUN2fw1yMgHTVAnj+SzJdy5WnzKbJhQzjcvqneldI+OEPC2OH9fidly04/npyJqgSwbC13fykj5CauuHORqM7VWi9+0IqPRqox6o8Yr841gDJDZUW1hTVWDavd7PGZRoXKMcx+/RvBTvB7lBGMOnLPk4bz050zwYgH9dQbYPuu+ZSOOpGzyZHr4uVZIqXcw7LG42HqVGHshRmbes+C58J4+z77OPuXW8+5aeAdkB9mqOwX6jZKSwXnJ6kCnZF5vfbxAPHzAl4SGGWVCtN6H5H18xP04HZV1r82QX5soJ3bTSiFZP7m08L7fhCCYM2S84vdbx7bqx7IQ==
Received: from AM6P194CA0034.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::47)
 by DU7PPF366CD9CFC.EURP195.PROD.OUTLOOK.COM (2603:10a6:18:3::bcf) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 09:19:41 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::82) by AM6P194CA0034.outlook.office365.com
 (2603:10a6:209:90::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 09:19:40 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 AMS1EPF00000047.mail.protection.outlook.com (10.167.16.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 09:19:41 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Fri, 12 Dec
 2025 10:19:40 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 1/5] cargo-update-recipe-crates: Make do_update_crates() a Python function
Date: Fri, 12 Dec 2025 10:19:22 +0100
Message-ID: <20251212091927.3741063-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|DU7PPF366CD9CFC:EE_
X-MS-Office365-Filtering-Correlation-Id: d4c6cfbb-bd13-47e1-0ca0-08de395f94d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?SitFDZbXPYBFjsfDr/aYbr4NOXjgsflK0EgPF8K55/P4YzldzBVc/OUiuB/H?=
 =?us-ascii?Q?ewGu4Mq92+xyWaL5F44Kd3tJBL1rjM2zdXQ0g5WovOyfjfxCcOIWQZG55EH+?=
 =?us-ascii?Q?EuYGI98s/aIIHL3YVysMp4YJdBidshPK9QJlHBoJslUnt35xbbBZjIhSyrVo?=
 =?us-ascii?Q?kno9UKQtcV3+pQl59jK2PAmlUxG2bcJGGTw7HDl02g3+KyprgKn7vw/fDziF?=
 =?us-ascii?Q?CE5ZTlkVl/TJRUUizUE3UPXzsb29fI1ULcZaqOodaVqMRmxf152aMBBTlAp6?=
 =?us-ascii?Q?gz766QryLxekTqe4nwHCsOJdQ/x47P+3E+GB9+wZAqYfuDDlWjZXgu6a743c?=
 =?us-ascii?Q?Xka7RcodQGwj8y9r/t8zLZmJ5dAb/d9ZURcCnKaYwioZvFce/SHFaziI9nJ0?=
 =?us-ascii?Q?Ek2VfPk1YysvKduw/Kupkl5bji42yKQd8M6xs68KCF8wnDdQQ6ACLbnGUnIH?=
 =?us-ascii?Q?ZD5Mr1Uf0LOnxjZ8NFsFMVNH7J8yg5GhWP0OqtnmqbGq/stONuSBh+O/nNMQ?=
 =?us-ascii?Q?9tcjB3Gs2Jmw8i6GA3Lkq59IfSbWqFWBQbBLyjfnOwUkGOJn4qfVX6y7GPsr?=
 =?us-ascii?Q?phSIyYvkYaouqaqx+z+yRSi7h/K4VPW/mXf1c3+hH3kUOfe8a8xdkJ5ddjOY?=
 =?us-ascii?Q?60RnW1gOSI7j7JJwr0lohQLASAZfOFSxxiJfLuyM79+4SBuMF9NVHim0kxF2?=
 =?us-ascii?Q?O63paBqb9x5tBw/TMMbV9ISP6HKDS1Nxx+CdU7IUw5q9VpDqPZotg2JhpqFr?=
 =?us-ascii?Q?8X6Au5DV5FEH9JOTLJMo8JI59XahmTcV7BhgB28QDR3hC4igY4/Gfi9+ofQ1?=
 =?us-ascii?Q?1guHaeE8r0AOWR9GUwzLra0+3q6hkIGZ8OT6MMi2lE+7fVMpD/CJOCPWqbFc?=
 =?us-ascii?Q?7vuQS9fp2Fvv1HNU901ZPkKUbY18wOh1V7JwwhSNB2y3tg7uvzXGofKi4wyq?=
 =?us-ascii?Q?/xfFvytz11rAfMWta03TfZJII1NoE3504k9VcYcOlqncSZcqYDWvPy7adU5d?=
 =?us-ascii?Q?wvZXZ7AkJMW0iCg7ks+O5hG7EDHFOg1Wpa71QCwJFu5cCWR2XAcCj8RtnrXa?=
 =?us-ascii?Q?qXrNb0pjJmo0fZl938a0hLIeu8sWBA+I2e+2aXyIGbok90JkmI/9QlJL3kA/?=
 =?us-ascii?Q?2oMna2uBtLgj1nUnxUOxwzeO+nmGwb181/AteY7r1dVWjoInHsaz+41jGuqW?=
 =?us-ascii?Q?NQKfzL5RHuE2xnt2u1O2QUJLTyBZPEANVE3pNLsUGBqLbq1no/yPS1b3DmtK?=
 =?us-ascii?Q?VrM0aS94CiXORK1BJ0K38wGlRLpUlmyzRS/26yaWLvOjRgDZ0hadV943XcmQ?=
 =?us-ascii?Q?BafGUJnFT5pCW2BmEBQ3x/UpVNI16xhc5L8/oNPFX1BIWdABL5y9ocDW6jxg?=
 =?us-ascii?Q?NmqUX6NUaNuJN0k1w9/X8IZ/m3RJDKmfrgQf091fBT2rR8mPxtxec9F1+sok?=
 =?us-ascii?Q?HxqcyrsYtMLkSIzJ+R2T6wBO5misq/AF47V/A+3Yqg6WSrOZb3Qh10i30zE1?=
 =?us-ascii?Q?D+UGCzQB63zKrBq4awvmGN/UCVxXzkVJJhb9BR0hIV+t2cIYydKnYUFmq3TP?=
 =?us-ascii?Q?EieFa8mlr/PTVnzJFJ4=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:19:41.4090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4c6cfbb-bd13-47e1-0ca0-08de395f94d0
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PPF366CD9CFC
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 09:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227574

Port the do_update_crates() from Shell to a real Python function. This
improves readability by directly executing Python code, instead of
redirecting it through a string.

In the process, two new variables "target_file" and "cargo_lock_src_dir"
are introduced, which just contain the previously, similarly named
Bitbake variables in the Python function.

No functional changes are made.

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - Split changes into multiple patches, for improved readability
---
 .../cargo-update-recipe-crates.bbclass        | 93 +++++++++----------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 3251d5ef2e..2ccaf80e40 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -23,59 +23,58 @@ RECIPE_UPGRADE_EXTRA_TASKS +=3D "do_update_crates"
 # The directory where to search for Cargo.lock files
 CARGO_LOCK_SRC_DIR ??=3D "${S}"
=20
-do_update_crates() {
-    TARGET_FILE=3D"${THISDIR}/${BPN}-crates.inc"
+python do_update_crates() {
+    import tomllib
=20
-    nativepython3 - <<EOF
+    target_file =3D d.expand('${THISDIR}/${BPN}-crates.inc')
+    cargo_lock_src_dir =3D d.getVar('CARGO_LOCK_SRC_DIR')
=20
-def get_crates(f):
-    import tomllib
-    c_list =3D '# from %s' % os.path.relpath(f, '${CARGO_LOCK_SRC_DIR}')
-    c_list +=3D '\nSRC_URI +=3D " \\\'
-    crates =3D tomllib.load(open(f, 'rb'))
+    def get_crates(f):
+        c_list =3D '# from %s' % os.path.relpath(f, cargo_lock_src_dir)
+        c_list +=3D '\nSRC_URI +=3D " \\'
+        crates =3D tomllib.load(open(f, 'rb'))
=20
-    # Build a list with crates info that have crates.io in the source
-    crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('sour=
ce', ''), crates['package']))
+        # Build a list with crates info that have crates.io in the source
+        crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('=
source', ''), crates['package']))
=20
-    if not crates_candidates:
-        raise ValueError("Unable to find any candidate crates that use cra=
tes.io")
+        if not crates_candidates:
+            raise ValueError("Unable to find any candidate crates that use=
 crates.io")
=20
-    # Update crates uri and their checksum, to avoid name clashing on the =
checksum
-    # we need to rename crates with name and version to have a unique key
-    cksum_list =3D ''
-    for c in crates_candidates:
-        rename =3D "%s-%s" % (c['name'], c['version'])
-        c_list +=3D '\n    crate://crates.io/%s/%s \\\' % (c['name'], c['v=
ersion'])
-        if 'checksum' in c:
-            cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rename, =
c['checksum'])
+        # Update crates uri and their checksum, to avoid name clashing on =
the checksum
+        # we need to rename crates with name and version to have a unique =
key
+        cksum_list =3D ''
+        for c in crates_candidates:
+            rename =3D "%s-%s" % (c['name'], c['version'])
+            c_list +=3D '\n    crate://crates.io/%s/%s \\' % (c['name'], c=
['version'])
+            if 'checksum' in c:
+                cksum_list +=3D '\nSRC_URI[%s.sha256sum] =3D "%s"' % (rena=
me, c['checksum'])
=20
-    c_list +=3D '\n"\n'
-    c_list +=3D cksum_list
-    c_list +=3D '\n'
-    return c_list
+        c_list +=3D '\n"\n'
+        c_list +=3D cksum_list
+        c_list +=3D '\n'
+        return c_list
=20
-import os
-crates =3D "# Autogenerated with 'bitbake -c update_crates ${PN}'\n\n"
-found =3D False
-for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}'):
-    # ignore git and patches directories
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.pc')):
-        continue
-    if root.startswith(os.path.join('${CARGO_LOCK_SRC_DIR}', '.git')):
-        continue
-    for file in files:
-        if file =3D=3D 'Cargo.lock':
-            try:
-                cargo_lock_path =3D os.path.join(root, file)
-                crates +=3D get_crates(os.path.join(root, file))
-            except Exception as e:
-                raise ValueError("Cannot parse '%s'" % cargo_lock_path) fr=
om e
-            else:
-                found =3D True
-if not found:
-    raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DI=
R}")
-open("${TARGET_FILE}", 'w').write(crates)
-EOF
+    import os
+    crates =3D d.expand("# Autogenerated with 'bitbake -c update_crates ${=
PN}'\n\n")
+    found =3D False
+    for root, dirs, files in os.walk(cargo_lock_src_dir):
+        # ignore git and patches directories
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.pc')):
+            continue
+        if root.startswith(os.path.join(cargo_lock_src_dir, '.git')):
+            continue
+        for file in files:
+            if file =3D=3D 'Cargo.lock':
+                try:
+                    cargo_lock_path =3D os.path.join(root, file)
+                    crates +=3D get_crates(os.path.join(root, file))
+                except Exception as e:
+                    raise ValueError("Cannot parse '%s'" % cargo_lock_path=
) from e
+                else:
+                    found =3D True
+    if not found:
+        raise ValueError(f"Unable to find any Cargo.lock in {cargo_lock_sr=
c_dir}")
+    open(target_file, 'w').write(crates)
=20
-    bbnote "Successfully update crates inside '${TARGET_FILE}'"
+    bb.note(f"Successfully update crates inside '{target_file}'")
 }
--=20
2.43.0


