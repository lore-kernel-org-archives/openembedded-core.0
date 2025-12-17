Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05BADD65559
	for <webhook@archiver.kernel.org>; Wed, 17 Dec 2025 13:07:07 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.141])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14079.1765976823131637635
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Dec 2025 05:07:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=KoSuvI3I;
 spf=pass (domain: phytec.de, ip: 52.101.83.141, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8bre593B2Cpvxv3Wg3cOGw3d1U3lTJDmKzPQF2/boSqzJLWby9A3i5GD8308yCUfY4jHuFtfOWUclesN6qK/62/lnIO30kjIi1wuebrNPYQ6jtvWhYEeMmmJRGfSVc7zSN6rJTcm4kFBrW39r1tjHuCJXv0OaKAwmj6dXOyddEWXD6BnP/4f3H+U3EolsmTTMjl/xvb52ENGeleCNrWN7oKJN60S4YXnJt1qWtTFJbz8RUthHR9a9Ezcrbqa2Zr0N84mr5sOzkPENyfygRH5hA7L3SS9pfyeVIAVcr87bVd6/96nQ5HxwCfcvCRNAiXeJGOfQmW4I+2r/HwQZWPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kccd6p0eSbbhweD7Yr82p3p1X+OFwZBYogjvry8xnFA=;
 b=tcOa8fqdlf9eVIMUp8kfc4M+mvgoFty4XXMrUUo+KQORvmmMCpSIrerNpnSGU3q0pmkKlLk8uyznj2OP7PxT+D9AQ7PqV8wbqvDYjLOgL+9dRolopz1CIrDLU9fTqIb1A0xHDUn41kLPCAwJuxc3NGYcdJUP6jezcwrONKc2FznYUQPYklHuVmm98d1M4SVlCJS6MX3Mb82p/zCyjcNEMVv/+6HLr/l17nWCrtRqySEC2npQgPfobRS7Ygfk15Qa3OdrAmvkqe9xHY0qJH8gl96TvF8mrbZ0E85YKZ7lBNIig+RJ5W0MzIYbtCdd/YQ2hJ6d+4TzH5dp1JHUeJL7ZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kccd6p0eSbbhweD7Yr82p3p1X+OFwZBYogjvry8xnFA=;
 b=KoSuvI3IfU+pkHKXUXH+MUSVkkq6ZNVGT2h/mNDQXrrrHxbDFf130W7VJqQTaea7DcY8NUGBwbQAUJYruvKTddyEXLqFcSolztij+r5byeFF2X0iEVNh0irSdkRRBSVtQxEbMv/Cz+Dl2H8R7VJnyTfwMLKU5IA3lZjN2QBOpf1zI67Ytan7qUy8QaI4SgclGf+R9+5KITq3AXNJA5AILl3jPxxP6deMZPPHeL3SQtUeBrniIR8951zRMSzGR08zbQ48ntPMsq31AYByURvkF3e6wHZ0c887DqV+pBTyAoABlD3l7BP4zwC58PttxQj+AWpRyFf9/DHKPp8dtn4tVg==
Received: from DUZPR01CA0155.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::11) by PA1P195MB2563.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:449::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 13:06:55 +0000
Received: from DB1PEPF000509FD.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::c5) by DUZPR01CA0155.outlook.office365.com
 (2603:10a6:10:4bd::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Wed,
 17 Dec 2025 13:07:08 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is 91.26.50.189)
 smtp.mailfrom=phytec.de; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=phytec.de;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 phytec.de discourages use of 91.26.50.189 as permitted sender)
Received: from Postix.phytec.de (91.26.50.189) by
 DB1PEPF000509FD.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Wed, 17 Dec 2025 13:06:54 +0000
Received: from augenblix2.phytec.de (172.25.0.51) by Postix.phytec.de
 (172.25.0.11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Wed, 17 Dec
 2025 14:06:54 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v3 1/2] cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock
Date: Wed, 17 Dec 2025 14:06:43 +0100
Message-ID: <20251217130644.2710575-1-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509FD:EE_|PA1P195MB2563:EE_
X-MS-Office365-Filtering-Correlation-Id: e8030322-b99a-43f3-0002-08de3d6d2709
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?xsM7LCdLmTB+gI3RL8gb5UmX2KP0D5vgVIAXJRvE0bUaLUng4YfJ5yKsNlaG?=
 =?us-ascii?Q?eDk/akCI8LWh6spEUTqXPtseEcmBFClfLwuGpYW4bU5Dm/aVGgzU27ODJn9A?=
 =?us-ascii?Q?aNkawBcW1sXJ5hHKSfnMN11mH0x7PQdERlme8ZW+c76exFP4qOzctdribuHu?=
 =?us-ascii?Q?c5WzoEps5Ce/wsts1HPML667S6bZpaRf+WUZsmPQXVTRDAbJV+cwiewYM1aV?=
 =?us-ascii?Q?E68gajOd3O/a1gLU+Qgoc373oM0PG6Fv1kTKpE/Xwo/ao4miMnpS+p9HSE4U?=
 =?us-ascii?Q?M6bcfxJYuE/E+W4nCHHOPkQFKJ4PSzTuoXezXU4KkzbF+NqqDhEPGBrAnyJC?=
 =?us-ascii?Q?vYlgIGlE/pYAgnTUPxDovxn9SWps2s/k8tCwY1JM/kItGvepV6gH53MFoSw5?=
 =?us-ascii?Q?6F9IwnpK4yR7U2CsaLPKLku7A4/YI/0R95CKNun40N/QWVAFVwTwq8ch/yPB?=
 =?us-ascii?Q?NTEVfWudnukfJ9hbrk5YbI+9svkTwYj51Y/eUfLIwUujXk3/7LzYBG/Cunje?=
 =?us-ascii?Q?P01UqxpppWm2eQnDvce+kr1RzCgEMNcpW7fy/m2Ry7cmkggYFc6RbOOtA8aj?=
 =?us-ascii?Q?LfU/n1PbmrQBq7syg2+3h8f/HoNujomcfTho3la1LtCsEPecLhHpihnwKaux?=
 =?us-ascii?Q?9940VtLOIFdNgkBoT5PY2GF4p0NWDzDBx/QKey4/iEcmxqCJ6OJ4svID5tcl?=
 =?us-ascii?Q?8kToFh9/90fd4zEB8iQQMoeQZIcbULdeFIdI/pybLP+C3HpK7vJYyS7DBmRr?=
 =?us-ascii?Q?cWKZD6UEU6R0ZgnBc/JDLkFg4g/+fbxY0rT6rh8HLc/W3OcVe6VFqbSkCzIW?=
 =?us-ascii?Q?ti8hCRFMLroPyWQTXMGpHgWHj5xUUDD2MJe8wsIA9ol465HST0Pl+Dzz1pyB?=
 =?us-ascii?Q?IrcR4szoIKocbF0rP6hlgemz9UWdhT1EU8h7vSU1WlgmZGY2s87YRtWrMliu?=
 =?us-ascii?Q?WfBy6u/B61MLrmz2Pb6+mHnRqeSLNZ4kNqMKQRLzLQTmFLaXBqSIAM2vwKeB?=
 =?us-ascii?Q?l8/xrgbBO0ilSDpQRk9o1KrBmkY6fb6zs20ZwiAytX6o0wr+epKbR9RSkPAG?=
 =?us-ascii?Q?5PpVNaujqMrKGJiiOWMZegIAK2BDViQGei/W0kNeRxFvmgmsF+/DXYF+YlN4?=
 =?us-ascii?Q?jRoM3p6oi658r5HnuVv1uyjiX+ZNzZZ1U+ZTULi3f/QpPs3Yei3mtT2REUIG?=
 =?us-ascii?Q?e5R46kdJ0DwdFoaA0N9bzHB5/p6pwRY9XREvzw30eUhZFLMECK0o/ojAs0Ma?=
 =?us-ascii?Q?pHOTrH0tYVQ7E338YO5Y/DZ+1VxuC/f35JhpFzhBqmEXamdi1Ap+MP2E1Bba?=
 =?us-ascii?Q?9QKzQQlbMagr6utDwpQqewbSLJGO8KiYwG36x6DKsJpry3M0T1l6bWP3MQ/6?=
 =?us-ascii?Q?2MU6CWZeMM43o53pYrlgi0DE3lxA/uD/0hmuk7YPQ1PmXltK6HXn5IPkHH1q?=
 =?us-ascii?Q?KHzxAqnzFzKltVBynEXVXm1AYQdEpFo8E8IN1lkdfnHzm4gtrh2SZEjZAccG?=
 =?us-ascii?Q?TeD8vFCqN3fCrCtkmUSYBOZQs0de2JWwlhHgnSbpWXrPdlPfZW/MClpf7AZ8?=
 =?us-ascii?Q?Rsp7F8RrlyG9tg8Tu2A=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 13:06:54.8069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e8030322-b99a-43f3-0002-08de3d6d2709
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509FD.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1P195MB2563
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Dec 2025 13:07:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228040

Do not fail if only some Cargo.lock files are empty. Only fail, if there
are absolutely no dependencies found in any Cargo.lock.

This fixes the following error message, which would occur with "bitbake
-c update_crates python3-orjson":

    ERROR: python3-orjson-3.10.17-r0 do_update_crates: Execution of '.../py=
thon3-orjson/3.10.17/temp/run.do_update_crates.70693' failed with exit code=
 1
    ERROR: Logfile of failure stored in: .../python3-orjson/3.10.17/temp/lo=
g.do_update_crates.70693
    Log data follows:
    | DEBUG: Executing python function extend_recipe_sysroot
    | NOTE: Direct dependencies are ['.../sources/oe-core/../oe-core/meta/r=
ecipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', 'virtual:n=
ative:.../sources/oe-core/../oe-core/meta/recipes-devtools/patch/patch_2.8.=
bb:do_populate_sysroot', 'virtual:native:.../sources/oe-core/../oe-core/met=
a/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot']
    | NOTE: Installed into sysroot: []
    | NOTE: Skipping as already exists in sysroot: ['gettext-minimal-native=
', 'cmake-native', 'libtool-native', 'quilt-native', 'texinfo-dummy-native'=
, 'openssl-native', 'expat-native', 'ncurses-native', 'util-linux-libuuid-n=
ative', 'zlib-native', 'libedit-native', 'make-native', 'patch-native', 'pe=
rl-native', 'python3-native', 'bzip2-native', 'xz-native', 'zstd-native', '=
attr-native', 'gdbm-native', 'libffi-native', 'sqlite3-native']
    | DEBUG: Python function extend_recipe_sysroot finished
    | DEBUG: Executing shell function do_update_crates
    | Traceback (most recent call last):
    |   File "<stdin>", line 41, in <module>
    |   File "<stdin>", line 12, in get_crates
    | ValueError: Unable to find any candidate crates that use crates.io
    |
    | The above exception was the direct cause of the following exception:
    |
    | Traceback (most recent call last):
    |   File "<stdin>", line 43, in <module>
    | ValueError: Cannot parse '.../python3-orjson/3.10.17/sources/orjson-3=
.10.17/include/cargo/simdutf8-0.1.5/Cargo.lock'
    | WARNING: exit code 1 from a shell command.
    ERROR: Task (.../sources/oe-core/../meta-openembedded/meta-python/recip=
es-devtools/python/python3-orjson_3.10.17.bb:do_update_crates) failed with =
exit code '1'

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v3:
  - Revert back to piping Python code to native Python
---
 .../cargo-update-recipe-crates.bbclass           | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 3251d5ef2e..ffc658f0f1 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -38,7 +38,8 @@ def get_crates(f):
     crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('sour=
ce', ''), crates['package']))
=20
     if not crates_candidates:
-        raise ValueError("Unable to find any candidate crates that use cra=
tes.io")
+        print("WARNING: Unable to find any candidate crates that use crate=
s.io")
+        return None
=20
     # Update crates uri and their checksum, to avoid name clashing on the =
checksum
     # we need to rename crates with name and version to have a unique key
@@ -65,14 +66,11 @@ for root, dirs, files in os.walk('${CARGO_LOCK_SRC_DIR}=
'):
         continue
     for file in files:
         if file =3D=3D 'Cargo.lock':
-            try:
-                cargo_lock_path =3D os.path.join(root, file)
-                crates +=3D get_crates(os.path.join(root, file))
-            except Exception as e:
-                raise ValueError("Cannot parse '%s'" % cargo_lock_path) fr=
om e
-            else:
-                found =3D True
-if not found:
+            cargo_lock_path =3D os.path.join(root, file)
+            c =3D get_crates(cargo_lock_path)
+            if c is not None:
+                crates +=3D c
+if crates is None:
     raise ValueError("Unable to find any Cargo.lock in ${CARGO_LOCK_SRC_DI=
R}")
 open("${TARGET_FILE}", 'w').write(crates)
 EOF
--=20
2.43.0


