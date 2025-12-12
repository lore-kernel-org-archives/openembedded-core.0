Return-Path: <m.schwan@phytec.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3919BD44158
	for <webhook@archiver.kernel.org>; Fri, 12 Dec 2025 09:19:53 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.130])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9096.1765531187074048339
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Dec 2025 01:19:47 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@phytec.de header.s=selector2 header.b=tnfEy8BL;
 spf=pass (domain: phytec.de, ip: 52.101.84.130, mailfrom: m.schwan@phytec.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gRuVvQUT/ZspPfwZsYNhoqki7vpW4vVet5k0fBiD+KFC5dxLwhsAdkVQJGypTb2nTqMGr0UfMn+C62l2lv9xKV/zaNbDrcIm9wNLYgrnpbmrfpuNW6UixaM8dKkvsUiQ9qGhU3HPP4EFY7pdAcPFL7RjMtgvCrKXpYSpKIlIE7ViYt4MiCebVcuS9QCh0oX6/g/XZbPSCBOBsxpbTaqCsNpoE+AkQZVTL9KPihUQfLftPNzDkgTD1ceCeS3F24xoKh0B2j6lJ6xXhGox+mIQdbtb7GywiCliVCI5LR2hiHh52zehNRMaNT8Tj1WntU35DUDtb7PNHNpwc3DTJhgtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6FtjkyC38oc5PUXBaD/uXKrHKGIc72MiDJgpoVyn9W0=;
 b=GzdYxxDSNRXsVjEKON17PnMXGfp85NDLSCR5JdYvZ0MWBx/EoXC4cBGIknoEzpYixoVnOnbe9hyYLxRxAJ6SE4EU/zKnJrGfXtHMhCdme0QgVykYFs+b7DVERJsTVZ2660ttMM9MsCdCqlcWu7rZE5TkwaTztsCz3ZVYlck69CvmZMGVxqXPCLM4kGArFuQS+pkfjxQuylfgli4vbnI83Rmw3J032g8/7yJ2Mh/hIN5RvLoMcAsAFubHBG+YOl8u6pb5QcU71LO4sPva5V+b60KBs5icEJUS90YZvYSIz3HMwsMLCC/Iv6tiiRfQ/Yz2Y0+IG32Ra7fZlOfx3c1sEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 91.26.50.189) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=phytec.de; dmarc=fail (p=quarantine sp=quarantine pct=100)
 action=quarantine header.from=phytec.de; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=phytec.de;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6FtjkyC38oc5PUXBaD/uXKrHKGIc72MiDJgpoVyn9W0=;
 b=tnfEy8BLKSyOEqu24TaC5Edyess8kYdrPiF04i1egPztqU8SIaNvIZYdLPfY5JTz7hkUwGSGs3hOf8M0amWeUh933oKdDBpykdSKQ1NzebUBwhXdLep4Z9ZVJZ3yF29KMmiCXZ7pwOrO3kiVJ7yX457XNVLTklQ1JjTF9l6bO/bIaRnVOusVizOUUzB/jGVCer8BbHLugXcQOGRLsAZNJtf/foNAUrMImbZhrtzMQWeL1gB3dVQZc6DnBQG3szEH3ZU5/mxg4Nt5oeFO20xow/RE7+EsRV1e8xgNAAD+1RWQ2+ydgVMF63INWnkXY9oDrSdZwmcWZaDYlSeXvckz4A==
Received: from AM6P194CA0023.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::36)
 by AS2P195MB2109.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:545::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.7; Fri, 12 Dec
 2025 09:19:42 +0000
Received: from AMS1EPF00000047.eurprd04.prod.outlook.com
 (2603:10a6:209:90:cafe::6e) by AM6P194CA0023.outlook.office365.com
 (2603:10a6:209:90::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 09:19:42 +0000
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
 2025 10:19:41 +0100
From: Martin Schwan <m.schwan@phytec.de>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH v2 2/5] cargo-update-recipe-crates: Don't fail for partially empty Cargo.lock
Date: Fri, 12 Dec 2025 10:19:23 +0100
Message-ID: <20251212091927.3741063-2-m.schwan@phytec.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251212091927.3741063-1-m.schwan@phytec.de>
References: <20251212091927.3741063-1-m.schwan@phytec.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [172.25.0.51]
X-ClientProxiedBy: Postix.phytec.de (172.25.0.11) To Postix.phytec.de
 (172.25.0.11)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF00000047:EE_|AS2P195MB2109:EE_
X-MS-Office365-Filtering-Correlation-Id: fbb8bc3b-d0a1-4f28-89ac-08de395f951f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?P8MlX0DxKBpA6udA6JjDWow9tE5cmsW4tn+Fjb1VPz7pVrr2/La9LmLqVPPJ?=
 =?us-ascii?Q?OhQeTTisLtTB/PMMjUJ5y7b1wRilzxPL395841dWeI3s6Hh9KWEEdab+C7AA?=
 =?us-ascii?Q?KE6eg0RGuTcWaWuykD8dOBgdrj9/DWS8biygwRz9H910MnN6z8H22QC9IIkb?=
 =?us-ascii?Q?jTt+CF6NFxeLt2Ud6RvO4wVQQoKpMdsx7u/sTN0N7ivF05rR81LCNFB8u5gJ?=
 =?us-ascii?Q?kBy7Ko5nAjO/a/FMbRS2990b/GDH9NuhaMzK0XBbW4kt/dooSbY6cSmH8K/q?=
 =?us-ascii?Q?/mZobilcaCEyLQ8Wvvw9pkN8ezvpnWr0wAnXLquIfmRSUFR5uIN3v6dbXrWf?=
 =?us-ascii?Q?wajWGrzrzZmL+VvDgoOHYzVwgimuhb7gWlV+TmIka0Vj30+rYTEpnU1V0RX7?=
 =?us-ascii?Q?xiYtmOm7Ct3NrCaM9ETTsbgXgwJS0bcBkMMkuX5eanO2fKwuzrxQ7OAurU4V?=
 =?us-ascii?Q?2X2ADcfTBvjG27DkMivo9i1ogH1JAyqbFHz7amsLkqJncqaQyWPvmO1ytJMB?=
 =?us-ascii?Q?2bTqeDdbq3jR/lfzyxe4TXruyd44G/EPLESIpeivr76ABdGZcrC0XaJfcLoS?=
 =?us-ascii?Q?ZX2spjxTpTwcyph7RLWo3xj/Z65qkjbwiNjtO3cqmwXt7zxUX/m7Sgo8sUdV?=
 =?us-ascii?Q?dUWNWkpQNjYU6sMEfxL8eJMzI75AWDP5tQjgptsg6U0Kd4D13flr52rRP39n?=
 =?us-ascii?Q?+bUF2ia1/Ey0o4pyiULp9e5hxBnSuvl57H2M1YNaJ/4JuPrR7jRaKtl695PA?=
 =?us-ascii?Q?i+kQr0d3mdgRsx6FojJ2ZUkhKJ7UcoHJqjLh+by11SIRqPI1/NDVYXrEgxxp?=
 =?us-ascii?Q?jEmBslBo11XP7/s4HtLymC2Ecf87s6kBQ3XI1WqCU8kWZN0RK5uyerdS3mrK?=
 =?us-ascii?Q?So7zoJYcvn2ClREBRU75VBdqQdSkCUgAOC/5n4/X60kGHVF9i84jpvdHiuB+?=
 =?us-ascii?Q?72wl04oYlN0mPwh3V5isBqGry6eP2hRX/YIOWgI7aaVZH+w+oGLLGjJA7Xjv?=
 =?us-ascii?Q?ASXhVNjPL6ps2+JgjZ+zCd4Mqqf/OnO02KzGpCMwHXUw7EJE3iMtWCWInKkD?=
 =?us-ascii?Q?JUHfZPuKma2JqQRp0OUvVq66KhXx599jeaV9Vk2C9+I3lQHSxcCKW46s1Y7f?=
 =?us-ascii?Q?O8/8F8YWY0YpsACWtvqLnqN/rOuNONffVAklLsNSnObdRJzojH9ao3vqV+9I?=
 =?us-ascii?Q?mN1/aqHqXixd/PgBC7hYMXjR+njVymCFoHO9UvVYygtuIid7MLNIDecQw1/a?=
 =?us-ascii?Q?2lRU12+IsaOIG/WxMkA3ehM2pU8i/5Vnn1JGjgGhOZIm1tf/WBDf/JA2msJs?=
 =?us-ascii?Q?qR3QmvNpzRtXJSwLlfQ4UAE5DzOQekRl8qBxEUnX/56J4UIOioOTJ1ZIXv5c?=
 =?us-ascii?Q?UHbOCkInXbgodZwrdktBPnwBj67ZLyTkJkv+NzvWR72g3SVn/r90VEIqHd+k?=
 =?us-ascii?Q?tytNKB+KsqymIohIQTAPnI8/eSP5g1GkrANJbK07g4cPzuNRAhSRLz9kVCQe?=
 =?us-ascii?Q?gB7lec/Agr1JAj35qN5s0B9E93vAUii2JRTZmNXjHRRhzgHeegp46YS7go33?=
 =?us-ascii?Q?7yQtQHn/qJAMeSHxjM4=3D?=
X-Forefront-Antispam-Report: 
	CIP:91.26.50.189;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:Postix.phytec.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1102;
X-OriginatorOrg: phytec.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 09:19:41.9311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb8bc3b-d0a1-4f28-89ac-08de395f951f
X-MS-Exchange-CrossTenant-Id: e609157c-80e2-446d-9be3-9c99c2399d29
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e609157c-80e2-446d-9be3-9c99c2399d29;Ip=[91.26.50.189];Helo=[Postix.phytec.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF00000047.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2P195MB2109
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Dec 2025 09:19:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227573

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

After this change, a working crates include file is produced and warning
messages are output instead to inform about potential issues in the
corresponding project:

    WARNING: python3-orjson-3.10.17-r0 do_update_crates: Unable to find any=
 candidate crates that use crates.io
    WARNING: python3-orjson-3.10.17-r0 do_update_crates: Cannot parse '.../=
python3-orjson/3.10.17/sources/orjson-3.10.17/include/cargo/simdutf8-0.1.5/=
Cargo.lock'

Signed-off-by: Martin Schwan <m.schwan@phytec.de>
---
Changes in v2:
  - Split changes into multiple patches, for improved readability
---
 .../cargo-update-recipe-crates.bbclass         | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta/classes-recipe/cargo-update-recipe-crates.bbclass b/meta/=
classes-recipe/cargo-update-recipe-crates.bbclass
index 2ccaf80e40..d3745392bd 100644
--- a/meta/classes-recipe/cargo-update-recipe-crates.bbclass
+++ b/meta/classes-recipe/cargo-update-recipe-crates.bbclass
@@ -38,7 +38,8 @@ python do_update_crates() {
         crates_candidates =3D list(filter(lambda c: 'crates.io' in c.get('=
source', ''), crates['package']))
=20
         if not crates_candidates:
-            raise ValueError("Unable to find any candidate crates that use=
 crates.io")
+            bb.warn('Unable to find any candidate crates that use crates.i=
o')
+            return None
=20
         # Update crates uri and their checksum, to avoid name clashing on =
the checksum
         # we need to rename crates with name and version to have a unique =
key
@@ -65,15 +66,14 @@ python do_update_crates() {
             continue
         for file in files:
             if file =3D=3D 'Cargo.lock':
-                try:
-                    cargo_lock_path =3D os.path.join(root, file)
-                    crates +=3D get_crates(os.path.join(root, file))
-                except Exception as e:
-                    raise ValueError("Cannot parse '%s'" % cargo_lock_path=
) from e
+                cargo_lock_path =3D os.path.join(root, file)
+                c =3D get_crates(cargo_lock_path)
+                if c is None:
+                    bb.warn('Cannot parse \'%s\'' % cargo_lock_path)
                 else:
-                    found =3D True
-    if not found:
-        raise ValueError(f"Unable to find any Cargo.lock in {cargo_lock_sr=
c_dir}")
+                    crates +=3D c
+    if crates is None:
+        bb.error(f'Unable to find any Cargo.lock in {cargo_lock_src_dir}')
     open(target_file, 'w').write(crates)
=20
     bb.note(f"Successfully update crates inside '{target_file}'")
--=20
2.43.0


