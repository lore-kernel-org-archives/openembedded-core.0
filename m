Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37AE1C0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:28 +0000 (UTC)
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (NAM12-MW2-obe.outbound.protection.outlook.com [40.107.244.42])
 by mx.groups.io with SMTP id smtpd.web11.19504.1738174525905298795
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:26 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=Uky51S5M;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.244.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VMnpO9tMPd5JpOLl93ioXJTnjuMyhx8kqXUzbgS4NKvXQ6jz8Wsl1Xly7iwYle3lpxWBBvp9SN3FhiI9Wjj4Ge9xRFZxmzF+28GGPaHTyQMN0adAA19RYuL9wDRONs3gsU4G6YSEzbo0qmRxE/eng3xO4ZBL1c76oRjEzIYfM2okcAqut5LgUDtUze9HzPGO9H4fUtW9gOKKuw7tyrJFu831j4bHcajOQpz8nT30D1itE/A/v0buonOviRpFMwT99/YOvu4gEG/v5ttvPqadOOaKZCUw+CwG6OAICholYrKS6MXrXRJ8N3iqJjXm0iz/ND0k5Uo30InvJ2DzniPlTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFHp4J6LVREK+aImh08omPfFNhcOLGnhzhT3RUakteQ=;
 b=Qpg4QCfZzDP2bAqe4ZiH1sdwOAHZyI7Q9p3p4igfnltBJwf2nKDBW4qgbqlvX3Hjv+fmOQ4o66ItxtIdLkZEljJK5OlkuYItI3FYnQ+wcMZe+/ZW/juPUz6MXPJOYVJOtbZVUeUJ2FCghGP7E5IX/RqRHt5UwO/RGVq74p6RSomyW5L1LQ3AaxLURH2KfsX7KS/L6AXPo/GD1wi91UKmKpH+aMYVOoYFmX72goNGfEV9OllRzBnZ+yWhvp5FV4xhWY/sqQh2khNGeABA0Bk449hi4boBjd6S6xt/yjk1NWGOu8cw4MPmNdX0y+YgVOoWL/pz65a93+GpbUYUvx1IhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFHp4J6LVREK+aImh08omPfFNhcOLGnhzhT3RUakteQ=;
 b=Uky51S5Mp3XcRNAF6QvhPZXbo7BO/hwQ2/E3x5bLWVH24WvhEBjtJMwqZzyASAZUM57p+TbCBL4tf09kwSn/LoqCFiHRflKwLuvKZmdWa1GYC7iDr75LD86enEMCXx3OdgVioAt9a0SbfE8p5Q2IVsdsRmiWNDv4xKV/WS15Ug9qvmrdPROzS2dZQ0o1eMx1bigQAekR7JAVBw9m689MLC6SfjqfWA2S8hEGFE0Q2d7dl36NXnaIWPPX0If2e2b3ddvFT7FQR7yuki4uGU15jahijhjS79XisyT9ShWpQ6AnTu9KZ0dVja6fyNr5IprFzyYGfREk4uUxiA1Buu3xLw==
Received: from BN0PR04CA0068.namprd04.prod.outlook.com (2603:10b6:408:ea::13)
 by DS0PR12MB7656.namprd12.prod.outlook.com (2603:10b6:8:11f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.24; Wed, 29 Jan
 2025 18:15:21 +0000
Received: from BN1PEPF00004688.namprd05.prod.outlook.com
 (2603:10b6:408:ea:cafe::93) by BN0PR04CA0068.outlook.office365.com
 (2603:10b6:408:ea::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.17 via Frontend Transport; Wed,
 29 Jan 2025 18:15:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN1PEPF00004688.mail.protection.outlook.com (10.167.243.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 18:15:21 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 11:14:39 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 1/5] devtool: standard: cleanup imports; stop relying on transitive bb imports
Date: Wed, 29 Jan 2025 13:14:52 -0500
Message-ID: <20250129181456.1826467-1-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004688:EE_|DS0PR12MB7656:EE_
X-MS-Office365-Filtering-Correlation-Id: ebd7e2f3-5161-469e-506e-08dd4090e49e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?81wnhrMlYGIu038JoEVAuvOVWkoMQIdUaeOYbEvgcg7/oApUUUqGBsB+JonO?=
 =?us-ascii?Q?hd9k+AWHeufGXb/EIqUXfSOtiJ5cRxQAbyte19fA/O5LdMoEe5ehxkPJMH5v?=
 =?us-ascii?Q?ZdqN7f4Moh3Vrmgt5aoAO8n3a4kdNjOvQbl2pEJpbiGa2lqVdFaDmq8CseCV?=
 =?us-ascii?Q?bGk/lmW4/hXeV6iMLDnFCVWmwFa2SrwDcq44VIT5fMgj021AeFZlJRuM460s?=
 =?us-ascii?Q?ZXVhhx2X65RaScLQ6wImIqkOWO1HZW4O4g00gyNq6/3XVafZYQhVzyrqBFM8?=
 =?us-ascii?Q?N44ilA6TbRtzDY+5nLrhuRpOiXPIKGXQ5pee4b2yqTlT+iaYAq1s5iZFeESi?=
 =?us-ascii?Q?xGQabPqo65Aeb2IPVSGmMX4xzxWP1DryGF/j+d5mfmPX2b87CvGqCfGToIah?=
 =?us-ascii?Q?ggsPw7eMmtnDbIx6nHt78EllmU+PA8It4OTgTqBQcAyCl7Kn0Hl/FcPYtCr1?=
 =?us-ascii?Q?MVYZ8gS1iWvr7G2rxYKtHKeAJbwG/wE8G0acXKq/ZnoUPRFrytlalvdvWdK+?=
 =?us-ascii?Q?z7abef9EBWNl6fsXmlS6sgw1gBSHVSomgVnfGzSxcoxyrUJrlZWUXa8TpQ5t?=
 =?us-ascii?Q?UlGifYp1aqQo6E5BwgQftqp1/gtWgqEojgPVgXJiFNbHT7uj5QDj68DnEYuY?=
 =?us-ascii?Q?2Qea1QDGcaxa1E/xWFk8QVkYCgGhIdlSO/ycnRu23gDoAwLl1/hWx7ju0Hu1?=
 =?us-ascii?Q?09LNrz/lFono7dRfG9J3JLSaHYUpkv2Lp9J8jlQ/65XhAelHjabPRem4XMaP?=
 =?us-ascii?Q?Poq1lzSSW1jvyfYnVVIW9u3Kv8GLJyQR3kC7G0MZAENFTra4bCAveNEs370H?=
 =?us-ascii?Q?KGguOcC78TQGeMWhsjUKaun9/DhvC4SvQ2zGmW4CvPHg69b99LEPAYUYdR7H?=
 =?us-ascii?Q?Tj6hSHcO8jLRxdIb/h7d0zO6/X4H//k3n07G6Ef/RyhH/WQOTYskOSnB7t7A?=
 =?us-ascii?Q?FHCDEt4ctDFm4rAdxZtEbHyMtLX9SBIAklzjB7YN1w27pR3G2tHimLkvlKor?=
 =?us-ascii?Q?aF/aBhx6gIEQJm8dmQOr/ks3rvdnGmUAEURgPMdXxX2ptqrq2jUuE/JXFpKp?=
 =?us-ascii?Q?zI2RF2hh3oopDGQ5xHdZphHIHFnMpo/HA/Beog64j5n0DzO4Qdtxyp5uCtc3?=
 =?us-ascii?Q?vObwQoS9GuuywnLwE7JdZmzUSwIYFHgJ2faomvB/i07ec0HP1CyCKSxrWGpa?=
 =?us-ascii?Q?FaQT7Q7eFkuL+/sbQZakeFEdHiJqdAbEaV8F7EIz+tQzCYvnEyWIrxvoD26Y?=
 =?us-ascii?Q?Q0dlGlm0u3MpQ3z2xEgPU4kOCPshk4M84+H3bfZlF66O3htbcfQv6za7B+56?=
 =?us-ascii?Q?zUzRsZmZDwQToE2vyGHX9w0bfVjvXEQCSWlQ2fgFH4b/jn8y2foPz9yuJBoE?=
 =?us-ascii?Q?qweNO3L36ahe2YZxFo2MPHN2q/BQ9R0y/zU26u/HiBNJZYaUcKiNDHRG722N?=
 =?us-ascii?Q?mMqpiK0/686Pq9yM5AhWI7RpFFfkqdNyXAQv2Jziv9dhIcc8uO7HIA477zCQ?=
 =?us-ascii?Q?zA2PVe+iNlZdiQw=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:15:21.0277
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebd7e2f3-5161-469e-506e-08dd4090e49e
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004688.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7656
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210404

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 41 ++++++++++++++++++---------------
 scripts/lib/devtool/upgrade.py  |  1 +
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index fa846ce61a..305536f6f0 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -19,9 +19,12 @@ import scriptutils
 import errno
 import glob
 from collections import OrderedDict
+
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace=
_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclasse=
xtend_targets, update_unlockedsigs, check_prerelease_version, check_git_rep=
o_dirty, check_git_repo_op, DevtoolError
 from devtool import parse_recipe
=20
+import bb.utils
+
 logger =3D logging.getLogger('devtool')
=20
 override_branch_prefix =3D 'devtool-override-'
@@ -29,7 +32,8 @@ override_branch_prefix =3D 'devtool-override-'
=20
 def add(args, config, basepath, workspace):
     """Entry point for the devtool 'add' subcommand"""
-    import bb
+    import bb.data
+    import bb.process
     import oe.recipeutils
=20
     if not args.recipename and not args.srctree and not args.fetch and not=
 args.fetchuri:
@@ -304,6 +308,7 @@ def add(args, config, basepath, workspace):
=20
 def _check_compatible_recipe(pn, d):
     """Check if the recipe is supported by devtool"""
+    import bb.data
     if pn =3D=3D 'perf':
         raise DevtoolError("The perf recipe does not actually check out "
                            "source and thus cannot be supported by this to=
ol",
@@ -373,7 +378,7 @@ def _copy_file(src, dst, dry_run_outdir=3DNone, base_ou=
tdir=3DNone):
=20
 def _git_ls_tree(repodir, treeish=3D'HEAD', recursive=3DFalse):
     """List contents of a git treeish"""
-    import bb
+    import bb.process
     cmd =3D ['git', 'ls-tree', '-z', treeish]
     if recursive:
         cmd.append('-r')
@@ -388,7 +393,7 @@ def _git_ls_tree(repodir, treeish=3D'HEAD', recursive=
=3DFalse):
=20
 def _git_modified(repodir):
     """List the difference between HEAD and the index"""
-    import bb
+    import bb.process
     cmd =3D ['git', 'status', '--porcelain']
     out, _ =3D bb.process.run(cmd, cwd=3Drepodir)
     ret =3D []
@@ -426,8 +431,6 @@ def _ls_tree(directory):
=20
 def extract(args, config, basepath, workspace):
     """Entry point for the devtool 'extract' subcommand"""
-    import bb
-
     tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
     if not tinfoil:
         # Error already shown
@@ -450,8 +453,6 @@ def extract(args, config, basepath, workspace):
=20
 def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
-    import bb
-
     tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
     if not tinfoil:
         # Error already shown
@@ -474,9 +475,9 @@ def sync(args, config, basepath, workspace):
=20
 def _extract_source(srctree, keep_temp, devbranch, sync, config, basepath,=
 workspace, fixed_setup, d, tinfoil, no_overrides=3DFalse):
     """Extract sources of a recipe"""
-    import oe.recipeutils
-    import oe.patch
     import oe.path
+    import bb.data
+    import bb.process
=20
     pn =3D d.getVar('PN')
=20
@@ -677,8 +678,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync=
, config, basepath, works
=20
 def _add_md5(config, recipename, filename):
     """Record checksum of a file (or recursively for a directory) to the m=
d5-file of the workspace"""
-    import bb.utils
-
     def addfile(fn):
         md5 =3D bb.utils.md5_file(fn)
         with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a+=
') as f:
@@ -697,7 +696,6 @@ def _add_md5(config, recipename, filename):
 def _check_preserve(config, recipename):
     """Check if a file was manually changed and needs to be saved in 'atti=
c'
        directory"""
-    import bb.utils
     origfile =3D os.path.join(config.workspace_path, '.devtool_md5')
     newfile =3D os.path.join(config.workspace_path, '.devtool_md5_new')
     preservepath =3D os.path.join(config.workspace_path, 'attic', recipena=
me)
@@ -739,6 +737,7 @@ def get_staging_kver(srcdir):
     return staging_kerVer
=20
 def get_staging_kbranch(srcdir):
+    import bb.process
     staging_kbranch =3D ""
     if os.path.exists(srcdir) and os.listdir(srcdir):
         (branch, _) =3D bb.process.run('git branch | grep \\* | cut -d \' =
\' -f2', cwd=3Dsrcdir)
@@ -757,7 +756,8 @@ def get_real_srctree(srctree, s, workdir):
=20
 def modify(args, config, basepath, workspace):
     """Entry point for the devtool 'modify' subcommand"""
-    import bb
+    import bb.data
+    import bb.process
     import oe.recipeutils
     import oe.patch
     import oe.path
@@ -1183,7 +1183,7 @@ def _get_patchset_revs(srctree, recipe_path, initial_=
rev=3DNone, force_patch_refre
     """Get initial and update rev of a recipe. These are the start point o=
f the
     whole patchset and start point for the patches to be re-generated/upda=
ted.
     """
-    import bb
+    import bb.process
=20
     # Get current branch
     stdout, _ =3D bb.process.run('git rev-parse --abbrev-ref HEAD',
@@ -1309,6 +1309,7 @@ def _export_patches(srctree, rd, start_revs, destdir,=
 changed_revs=3DNone):
     """
     import oe.recipeutils
     from oe.patch import GitApplyTree
+    import bb.process
     updated =3D OrderedDict()
     added =3D OrderedDict()
     seqpatch_re =3D re.compile('^([0-9]{4}-)?(.+)')
@@ -1378,6 +1379,7 @@ def _export_patches(srctree, rd, start_revs, destdir,=
 changed_revs=3DNone):
=20
 def _create_kconfig_diff(srctree, rd, outfile):
     """Create a kconfig fragment"""
+    import bb.process
     # Only update config fragment if both config files exist
     orig_config =3D os.path.join(srctree, '.config.baseline')
     new_config =3D os.path.join(srctree, '.config.new')
@@ -1415,6 +1417,8 @@ def _export_local_files(srctree, rd, destdir, srctree=
base):
          - for removed dict, the absolute path to the existing file in rec=
ipe space
     """
     import oe.recipeutils
+    import bb.data
+    import bb.process
=20
     # Find out local files (SRC_URI files that exist in the "recipe space"=
).
     # Local files that reside in srctree are not included in patch generat=
ion.
@@ -1506,7 +1510,7 @@ def _determine_files_dir(rd):
=20
 def _update_recipe_srcrev(recipename, workspace, srctree, rd, appendlayerd=
ir, wildcard_version, no_remove, no_report_remove, dry_run_outdir=3DNone):
     """Implement the 'srcrev' mode of update-recipe"""
-    import bb
+    import bb.process
     import oe.recipeutils
=20
     dry_run_suffix =3D ' (dry-run)' if dry_run_outdir else ''
@@ -1607,7 +1611,6 @@ def _update_recipe_srcrev(recipename, workspace, srct=
ree, rd, appendlayerdir, wi
=20
 def _update_recipe_patch(recipename, workspace, srctree, rd, appendlayerdi=
r, wildcard_version, no_remove, no_report_remove, initial_rev, dry_run_outd=
ir=3DNone, force_patch_refresh=3DFalse):
     """Implement the 'patch' mode of update-recipe"""
-    import bb
     import oe.recipeutils
=20
     recipefile =3D rd.getVar('FILE')
@@ -1786,6 +1789,7 @@ def _update_recipe_patch(recipename, workspace, srctr=
ee, rd, appendlayerdir, wil
=20
 def _guess_recipe_update_mode(srctree, rdata):
     """Guess the recipe update mode to use"""
+    import bb.process
     src_uri =3D (rdata.getVar('SRC_URI') or '').split()
     git_uris =3D [uri for uri in src_uri if uri.startswith('git://')]
     if not git_uris:
@@ -1807,6 +1811,8 @@ def _guess_recipe_update_mode(srctree, rdata):
     return 'patch'
=20
 def _update_recipe(recipename, workspace, rd, mode, appendlayerdir, wildca=
rd_version, no_remove, initial_rev, no_report_remove=3DFalse, dry_run_outdi=
r=3DNone, no_overrides=3DFalse, force_patch_refresh=3DFalse):
+    import bb.data
+    import bb.process
     srctree =3D workspace[recipename]['srctree']
     if mode =3D=3D 'auto':
         mode =3D _guess_recipe_update_mode(srctree, rd)
@@ -1929,6 +1935,7 @@ def status(args, config, basepath, workspace):
=20
 def _reset(recipes, no_clean, remove_work, config, basepath, workspace):
     """Reset one or more recipes"""
+    import bb.process
     import oe.path
=20
     def clean_preferred_provider(pn, layerconf_path):
@@ -2032,8 +2039,6 @@ def _reset(recipes, no_clean, remove_work, config, ba=
sepath, workspace):
=20
 def reset(args, config, basepath, workspace):
     """Entry point for the devtool 'reset' subcommand"""
-    import bb
-    import shutil
=20
     recipes =3D ""
=20
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.p=
y
index eed3a49e4b..94b6c11a37 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -169,6 +169,7 @@ def _get_uri(rd):
=20
 def _extract_new_source(newpv, srctree, no_patch, srcrev, srcbranch, branc=
h, keep_temp, tinfoil, rd):
     """Extract sources of a recipe with a new version"""
+    import oe.patch
=20
     def __run(cmd):
         """Simple wrapper which calls _run with srctree as cwd"""
--=20
2.43.0


