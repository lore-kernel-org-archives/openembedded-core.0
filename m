Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA7EC02194
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:48 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (NAM12-DM6-obe.outbound.protection.outlook.com [40.107.243.64])
 by mx.groups.io with SMTP id smtpd.web10.22850.1738182040751011576
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=RPg5deJq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.243.64, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MQlu/GlG1Azp3+d8otVbRXfJ5SUZypOXbzB6gYFvsxkdRilmSaP91yN9sz9rTGGGZiFI6UJprGSpFuMAU0CEo480vw+UK/GI6R3NrXtmPs8OT07b9MsGfjs8bTzC3ykPipmDZM1JrPuuCocGjtNS47hShUuT7DqNH3WVSIl2aYPB9Qz8nfDxMAZI+RoALvokOeXzzUgqL77vQEcIAW1I2cskD4UCIYWTaTnq1mQRJ9eEk4gVT+GawsxKfjZoWe0ppcHmGF3Z2Bj8rsip7C/IBPvyAN3EMGgDJfm/LtxGdaU8U1KHkVJ5mxrApiORLXJ12aUR6Z+SgYnU6F49GezLcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KFHp4J6LVREK+aImh08omPfFNhcOLGnhzhT3RUakteQ=;
 b=xl2cKz7Sg4pL7+y+i+jSLgZPI7kG6Vy9k5J++9TWvyvjFLrk1egeAFj8bIX9Oohn6wvibVtuTcGiPbukQCQzf1/PQ7BnhP7Q1JRiXcpetvM84ipRf5HxwzuAoFXqjeU/kUo414Q+BKOVbrpo82Tph+iR20hiQX93M3Rjg88s3VYiT6QLrpTCd6lpeBnt+StKgB1D6xge2kXzH4sqKYXP7vnKo8FBGbv/tQ5ElUS2yB+GL1YAB8xxUvU128wwniPoKO8lF8ImyW3wr1rm8amZkepiHpnQpxxpW3WxOwRLTRCLOmUnyBZ+Vg7JEvoA7rIDi7UOV+m0PyzAI/8mw5lzTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KFHp4J6LVREK+aImh08omPfFNhcOLGnhzhT3RUakteQ=;
 b=RPg5deJqv2QNZX2h51t0mgLWGRf5DthZwBaNy8dE73tOksfnm8jbpPqavx9YyhAg+4CeY04qn/6aEc5FSN4tgpecrgT6C/rKo9TNUicOou78F8sKjr7lQuU/7Tt3OmrJiTTUM7gtYBRNmaBvzhNG4s8H1FzQ+FN87KmNKjbhiJoc0VuGRb2TH+37Jn1BvEPTam0Ugx/FfYFlKgxK/9R2L3N/m55LA9HQC8A1wtNZhGjZvkMCw+xk9UF+wSdJMU4seS17n8v4aiLRMBVqJJLEh7PNgBqEZP6KvQh7IbhQGmu7Hliue5zH+C8iZ6MMMuJe0Qg2i2XyL2ZCLijQ+0uuqg==
Received: from PH0PR07CA0082.namprd07.prod.outlook.com (2603:10b6:510:f::27)
 by MN2PR12MB4437.namprd12.prod.outlook.com (2603:10b6:208:26f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.18; Wed, 29 Jan
 2025 20:20:32 +0000
Received: from SN1PEPF000397B3.namprd05.prod.outlook.com
 (2603:10b6:510:f:cafe::72) by PH0PR07CA0082.outlook.office365.com
 (2603:10b6:510:f::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Wed,
 29 Jan 2025 20:20:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397B3.mail.protection.outlook.com (10.167.248.57) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:30 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:26 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 1/5] devtool: standard: cleanup imports; stop relying on transitive bb imports
Date: Wed, 29 Jan 2025 15:20:12 -0500
Message-ID: <20250129202016.1833520-2-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129202016.1833520-1-chris.laplante@agilent.com>
References: <20250129202016.1833520-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B3:EE_|MN2PR12MB4437:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b984db5-f460-4a90-912d-08dd40a260b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/FSwaKsBLMadVCS5RCHd8Mv7fD0YZll6RUOOmi9LFf18GJC5c0dNNidgoVrs?=
 =?us-ascii?Q?JkMMZjZQKu4jcXFACiCsHCZEFt6RLSLEcpyM7Jq3Ih4z2MpAgovVuOskdTyH?=
 =?us-ascii?Q?dJw7tH3cH8D37pkyHqqLwGBD0oAl7gJYLn1F0CsKxW8kS/l4XzMwJLSodx04?=
 =?us-ascii?Q?HEsJ14XpJLECRurYWEdmSTmW9bau+FgOOsmR8penyfCcXYEuU9NArXeutHsT?=
 =?us-ascii?Q?Ob7WZEckKtkb/qGc4tFSogQkEOcpU7TRrvcmz3kuPC0qg0rjS1GuH8Bh0jiR?=
 =?us-ascii?Q?oApBGzhH6BXXFERK0m/LUtjCWb3h1oeNkAbLpccoV+OQat651C3mGxXCmpCQ?=
 =?us-ascii?Q?/Uv1NTSRQ+k+Q2liiwm6TkZgOCu6L7MM3SQLMTCcBMOIU3Kn0AXU8Pr5YRx8?=
 =?us-ascii?Q?qmTEkpFE9CRGYappdw9BAyp+zKO3MhKOAoDp0b8UcAEyrD8pBL0LNPu88Q1S?=
 =?us-ascii?Q?Qliey2V4yfMALdMU0hPg4hA54aobtVEmwKl60gCMDCD+DglOQQ9w+DTLlbnn?=
 =?us-ascii?Q?/Mna5OiGk4tDeKzAW0mgVj8h6FaWxriGreHw/lUsRuz+CALXy2tD11dIEKCR?=
 =?us-ascii?Q?lq3T4unfMD6wC/vWmcTMIpod0HX9soQf2Nyrg00aOihs/QClywpjiLVNX9bG?=
 =?us-ascii?Q?3B6b3ZnFK3AnPArJrAervtZEnrlJUSBhOwUW/uzOhIei3ECJGes8kOyCFO00?=
 =?us-ascii?Q?+YU6WQgP1V8jDk3l/Rd7N7b20CA2iSVehz4GOCZrRzmZOJPOOOFSWgOh6mM9?=
 =?us-ascii?Q?p1ib2skPpoXBQo2aY7ziveAxt1RELCk2k7HZpDFO6D2QmIMErR0oKLNYbnin?=
 =?us-ascii?Q?ZFFjEowVB+GXS+YpEt0Jmtu9gEeZwobzvL04JXKTzvP5k19+txS+KX8QfVtn?=
 =?us-ascii?Q?tgoJYh0RnZ1VYKk5wciPcBNf2T2q0sEcxQ/BubQs/pqSIn/Y45fxJARTFWjU?=
 =?us-ascii?Q?wJ3vDRd4Uhv4/i1J1z/m0iA1ZVEP4XiU8WH9sCGq+S4DwXFOjXPmHM1jSkns?=
 =?us-ascii?Q?ZBY8NnXsZ2M2F25U6h6tku0h5jZlyE5BVQ8RpO8ewYrVWjRW7pSuz4RYfRFi?=
 =?us-ascii?Q?bFHvZayrBiN1xoOf9oxmgPKnzCthfDPK2xnUrJBAVjBpQrFhadLKLgPJil8W?=
 =?us-ascii?Q?HOSCTm8reFDmLIq53AHUaDjq6gZgN642oRCbAF4a31ICMzGiiDdBYlIRk+Ll?=
 =?us-ascii?Q?mVySrfSQpYJD+s5TZ+zbY/0sDziAhGjeaAQE9AWtllzRorYJdjwGdHzftXYc?=
 =?us-ascii?Q?/tCbbwgP6RFW5/QCjuGaMDwBQQBVS973FM0UizNisDJkvPwXGd2OKsr5qyj6?=
 =?us-ascii?Q?4rpdKGvFNZHV6qSgoZtV0jqZ6RRx/iwUW9QeQu+o+6HeDosHMGwdQohx2Jt6?=
 =?us-ascii?Q?GiuVKtciENIlGQTqeJFkbWAJeyGJPJHm/OtePmwYzoqvSRNZoF1i6Eef98RE?=
 =?us-ascii?Q?uRADMEbe7v3KVaGonDsEH9BVotEF9IECC8akPtjQvqCMbz3sDTxavIAeGR2J?=
 =?us-ascii?Q?77VLPUir0JId3ns=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:30.7154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b984db5-f460-4a90-912d-08dd40a260b6
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4437
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210416

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


