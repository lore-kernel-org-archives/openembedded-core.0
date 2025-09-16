Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0234CAC598
	for <webhook@archiver.kernel.org>; Tue, 16 Sep 2025 15:52:06 +0000 (UTC)
Received: from CH4PR04CU002.outbound.protection.outlook.com (CH4PR04CU002.outbound.protection.outlook.com [40.107.201.63])
 by mx.groups.io with SMTP id smtpd.web11.2151.1758037923728357046
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Sep 2025 08:52:04 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=psqzqSB6;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.201.63, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zFB4YvkR0PcnPkK/1BQ7Ox8CzLa+fVlFj43OfPwdrJs48Ov3BQD+vse2HxXljyIBcBvcTAT5Xhq5REwuALn2P1nuODenIjwhLGwpAxQaw5Sx6OGbpaSBrOUu+8yJuvIdFhNUnQ6wWfSqmck3eqel5gWq0IwO0vyUDdPqqjsi8NBZRIIMz3hgwdYaxXKxqzZSvWsvFTTOx8pNfy5laB4MVjwJ5lfg/484O6ONJJwyYucHs70x9a7IzpB5zFJj7x9oT+YHDR4t/BainG6nL1zrlhSGC4EK97/jeWlxfWtscKwcyouBI4nYPDP+gbN4lyED/7AxO6eSXOjsQFCm6IsNFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vHL1pLEUCIXMikkxWmvLccHVxKRqddj2ywY0nukh7pM=;
 b=OrwmLlicDGTH6+ecsR3svMS0SbFCJDDcVpMUqwRvxzeRoKazOvFUB2OHRXRKEavRABLpVtyF2DuiXwdLSTl916WTVvOR/J3j8ICQ+c/1nShL+bw41aVg6GyBSQoLg7m84Pd9p/sreTyxyhI5nBrINSI+5q9n5/oenTHizs5qMS0D6V0ZSc2dKWBxJTgDZOz1HBDLIf/pJvD/2/D5vBvUs/UydLoLSfGKqtA9AZaLPbddfFE/IeoDpT3EaddHOyI0FLwWGoNoOHMSBBlZ8Ad5BfsnBnQTqXirJyl68yT4ZcEejsZGoY61ZKrC7FQoTfMjmGFnjj2HPwVFfORTIONV2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vHL1pLEUCIXMikkxWmvLccHVxKRqddj2ywY0nukh7pM=;
 b=psqzqSB69I2O6iXHHWwNiHeTf9x1wYfdpXkCZgzuehO+mX8mCGIVJ+CrgWqVKgeW28Jjww1pSDWxxBGD7UyRk/HUWK5Zy7VS2nlguek7pEkqUTfcWUfcfu29nsobF496v539vxaOb+L1HEOsCCGBW2IqYOWSblgB6c/ooWBrlmVimt6HzJZ8JpOFGZiWODHTcWFS1rlWZioZi7XIP0OtFaJxUSnqR3SFGWvvoX71YFbxK7bs2DU2FVQeydu0ZTdf9nPq4oOyCkRJKuyzn62qcmGYuDieYHovbEgFeOd892XBTbUJiHhDfENklmzSEY/WtXTxmAbPklH9zwSjg2l8xA==
Received: from DM6PR02CA0142.namprd02.prod.outlook.com (2603:10b6:5:332::9) by
 MW3PR12MB4379.namprd12.prod.outlook.com (2603:10b6:303:5e::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.21; Tue, 16 Sep 2025 15:51:59 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:332:cafe::4b) by DM6PR02CA0142.outlook.office365.com
 (2603:10b6:5:332::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.21 via Frontend Transport; Tue,
 16 Sep 2025 15:51:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 15:51:59 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.5) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.58; Tue, 16 Sep 2025 09:51:51 -0600
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/3] devtool: __init__: cleanup imports, including a missing 'import errno'
Date: Tue, 16 Sep 2025 11:51:42 -0400
Message-ID: <20250916155144.3279173-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|MW3PR12MB4379:EE_
X-MS-Office365-Filtering-Correlation-Id: 96add34b-40b0-443f-fdc1-08ddf538f880
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ZLogI3vUj9sWvkuSzaulsIqfK6T/lI/jr//0bHL752brQkjd9guLcGyzcHPS?=
 =?us-ascii?Q?uvpEKTGLRImWyNt2HmMUFz/UroIr2/QqWm0OpJHYkkDLR2mb6MFZ/2TCVIYW?=
 =?us-ascii?Q?vCNB5lbj+zgiv9BM1INGsl4brFePPM2yLUvOtxgH/MQSjqze93O+vs4TyM1X?=
 =?us-ascii?Q?3DGwrXRgcEueEZN+j40EpMuuJbAcHI+0EbP0KTUqAEQB2ZQ0TElxCPsSOs2j?=
 =?us-ascii?Q?O98oy++ob41EmXBhIkZ0qGiioYG47ftaAWJki3fN4G/QuY6rI8JVR1YK2rI8?=
 =?us-ascii?Q?HOkSOQKNGSteLrJPZOpkzkkhgQ9qQ8nyIDmdEBaisjJx2EoaJZ94K2GqXTBE?=
 =?us-ascii?Q?pdV3ahmJf4qD4LrqSN9XGP6rshrOClOgNyhYPYRV1Uvllw+QlgCZa8L0fACw?=
 =?us-ascii?Q?gKDyvXA8R7b0J94MpUZ3W3C0gGr0MvOqJT5dLM3kPzP+QOQ2uveVTlzMxv6k?=
 =?us-ascii?Q?m/Mnf2i5Jpiwj7CuN0vGoa7kvVVE6XMWyKc2c2PwbykohAx3kvZ5qH4ywJTJ?=
 =?us-ascii?Q?nYyLQdCpys5MdRuiOA+TREFa7dVvoeMSqjf+h5xf+Yxf7U8aD2KtukCYBIW+?=
 =?us-ascii?Q?MtRitgwZUJrfIrd25fYXm97HOE5qUSCINy88CNi7Pc0eS89zqG2Y8Xn0/du8?=
 =?us-ascii?Q?G7c0dfqa55sC8psbe88nH2wvofJQsApdXjJnG+zTpnJzL553R2Aj3y8lPRU+?=
 =?us-ascii?Q?dvKYhlGudRg/BdjtNms54i12eqf+zVwy4ef0gIl2+xONTCrf6ZaGQupYzX6D?=
 =?us-ascii?Q?OMNBBYvuyzPKvpUnmnYTNJp3sk7a423mLyNnY27RLTDt07C/yxKnUvZSsbZk?=
 =?us-ascii?Q?Rp/76WaFRcbRK/l26Bk6nROAbQu3dkLTy7Td3/pnEoFQhhs/FrvKhxxtwpow?=
 =?us-ascii?Q?+zN8UXwcQlHWZ39n2RtrEb1/e+g/vPJvDv8/rIEfABP0CO11F2Yp2W/S4Y3I?=
 =?us-ascii?Q?xaXkp+7rs8YnRvBvaPT6SJKPLgCq+myzvGPOwmO7ysD1FzckTj3QaDe7+oov?=
 =?us-ascii?Q?IP6rJ+F4/RA3QmHq2lZUMan4eWVQtK633FwfqUTETptR7oO+x48NpdQ79lEA?=
 =?us-ascii?Q?5kHnaTuoz9wId97G4jDI+sPMHzM7L9deReCgyFfWCxvxJ70F3kdiQxxLHXLQ?=
 =?us-ascii?Q?NEAl7To0i6Csq0OATk44SPjXPNaoqMhyJk0Z5qJe+c9WwJJfN5AQoWo0Ifhi?=
 =?us-ascii?Q?xxnwpz3Gt4E5eZCMt5cA0yry/JQWgtrqgpv1r3fwxM0vqZyTEoVPlfS5FM8X?=
 =?us-ascii?Q?ABCJ4ACswzPCG4kYV2uR1QfDDpP33qa6hfhbbl5exSog3p5N8KBAkdM2Sns/?=
 =?us-ascii?Q?tQvo9uqTmY94L7J2SJ3TKtfZAVpkZnnigj2kbyTYpMz6aeI2aqEvPgN7ZTOr?=
 =?us-ascii?Q?T+hi1bN+uOFgZ9CSCoP4fqjKQtX0yjCeAcZakwjpiUYZigbC3fZ8x5HpIetj?=
 =?us-ascii?Q?Nn/f3844g8lLqgfUpUwmAu7+7AdoxcZ89w37A0aBW+yE+bXU5NjdtpjrRdCU?=
 =?us-ascii?Q?NS7DSqViwiH+5BjmWrZ4V587xN4ZGJjVAnMq?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 15:51:59.1617
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96add34b-40b0-443f-fdc1-08ddf538f880
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4379
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Sep 2025 15:52:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223568

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/__init__.py | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__=
.py
index c9d7ade9ff7..396e8025b7f 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -26,7 +26,7 @@ class DevtoolError(Exception):
=20
 def exec_build_env_command(init_path, builddir, cmd, watch=3DFalse, **opti=
ons):
     """Run a program in bitbake build context"""
-    import bb
+    import bb.process
     if not 'cwd' in options:
         options["cwd"] =3D builddir
     if init_path:
@@ -50,7 +50,7 @@ def exec_build_env_command(init_path, builddir, cmd, watc=
h=3DFalse, **options):
=20
 def exec_watch(cmd, **options):
     """Run program with stdout shown on sys.stdout"""
-    import bb
+    import bb.process
     if isinstance(cmd, str) and not "shell" in options:
         options["shell"] =3D True
=20
@@ -122,6 +122,7 @@ def setup_tinfoil(config_only=3DFalse, basepath=3DNone,=
 tracking=3DFalse):
=20
 def parse_recipe(config, tinfoil, pn, appends, filter_workspace=3DTrue):
     """Parse the specified recipe"""
+    import bb.providers
     try:
         recipefile =3D tinfoil.get_recipe_file(pn)
     except bb.providers.NoProvider as e:
@@ -178,6 +179,7 @@ def use_external_build(same_dir, no_same_dir, d):
     """
     Determine if we should use B!=3DS (separate build and source directori=
es) or not
     """
+    import bb.data
     b_is_s =3D True
     if no_same_dir:
         logger.info('Using separate build directory since --no-same-dir sp=
ecified')
@@ -320,6 +322,7 @@ def replace_from_file(path, old, new):
     try:
         rdata =3D read_file(path)
     except IOError as e:
+        import errno
         # if file does not exit, just quit, otherwise raise an exception
         if e.errno =3D=3D errno.ENOENT:
             return
@@ -339,6 +342,7 @@ def replace_from_file(path, old, new):
 def update_unlockedsigs(basepath, workspace, fixed_setup, extra=3DNone):
     """ This function will make unlocked-sigs.inc match the recipes in the
     workspace plus any extras we want unlocked. """
+    import bb.utils
=20
     if not fixed_setup:
         # Only need to write this out within the eSDK
@@ -390,11 +394,13 @@ def check_prerelease_version(ver, operation):
=20
 def check_git_repo_dirty(repodir):
     """Check if a git repository is clean or not"""
+    import bb.process
     stdout, _ =3D bb.process.run('git status --porcelain', cwd=3Drepodir)
     return stdout
=20
 def check_git_repo_op(srctree, ignoredirs=3DNone):
     """Check if a git repository is in the middle of a rebase"""
+    import bb.process
     stdout, _ =3D bb.process.run('git rev-parse --show-toplevel', cwd=3Dsr=
ctree)
     topleveldir =3D stdout.strip()
     if ignoredirs and topleveldir in ignoredirs:
--=20
2.43.0


