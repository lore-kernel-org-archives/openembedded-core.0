Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4137DC02194
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 18:15:38 +0000 (UTC)
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (NAM02-BN1-obe.outbound.protection.outlook.com [40.107.212.42])
 by mx.groups.io with SMTP id smtpd.web10.19623.1738174531612701841
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 10:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=JCAwNyAM;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.212.42, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvaTq9YtGrEaENS0JdA0r+Kh5kuyXb5NV+SvPo3Do896f3qxTL2sJzZ+oCS0KVnTzFRkZeWIufUQVodRu5/Kq1Kh2lhSwCzEu7iqpMCjO5iuCL9ZG376Y8p3D0P3o3bKKi0zqKVvI5PTOAbxMzO8uiRnXH8gYIXwlMfjQWZXxo/E3zY/8W9gXxYlYZOhaqPeyuurXsml1OFqgbeOGuqDk2LQiTBFnw6KxmMEyJnDZkU5KKASaU6SmYMeLoQTMw3IG00prG0vbA9SKFQqUdXvOsMVOYAt/3virerIqBGXYD/Hd7vWFiMzO7UYg/yyFTu71pJG3YIDaMUFt1wTRTo3iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/yQkaPSubMUB74LxW83l6ZIjA0hEdWKYL/C4Nhxcoo=;
 b=Yvc8eynpkCNx7llZWTBJa4rqFTT7U/dE/7N9Osh2eLoP/XaVrmc0FViMpjMnzMRrBXSXS1/k3sZddQDt4nAdSdVFWJ3k9R0UUtJs6g1CLOfrLSqEt+f1jy2wdEBB7g8avvx+CXazTW679Be22C2E7kKiwEV29nBy1NDG9/LE98ZG/QZbvQPn4uY6u25BOybryRo1Y0JNyKgYV3V1/zy+7h59gbpLKao7lGP6MiPBjVn40kjfMz/UN8/rn7BhFDkfsMsZC6JoDFlb3FGqcLs83+5XhNinLnUbfBs5yqpCXN0PRETN1hIpt+WANNyftz7lEUa0LZlSZtsn771XrrEFqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.37) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/yQkaPSubMUB74LxW83l6ZIjA0hEdWKYL/C4Nhxcoo=;
 b=JCAwNyAMQlUvJ0c/tcso34CKZIBmX+SaoTGPqsJJp/q41bLbcBb82Q9j3KgM5I/hrM8hDam/kqs42IQJyhvmWVXcKh91JUkKh9kSXgxGCSDAMNlj3c7QHKj8B0yTVcSnZiyaT/I8g5RHChA4shRPQvBc6utVmY4u5grvci/DBuQKV6025Si0g4qs6YJK1SGoCKQr6sK1YewfZ5y1wLIlU7sBG4zIUZ+4PKrinvPv0mE7BbYZWzF0nKP3YWdxgrxqK4L1s4l4chJ7LjfSd1yuu2+Agyj9QwGZnpAiwZkV4OyBUIUWsUWBY8OU86S/3RSufCZ3oAhY6hy+KIjxhwgw1A==
Received: from BN9PR03CA0110.namprd03.prod.outlook.com (2603:10b6:408:fd::25)
 by SJ2PR12MB7800.namprd12.prod.outlook.com (2603:10b6:a03:4c1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.17; Wed, 29 Jan
 2025 18:15:23 +0000
Received: from BN1PEPF00004689.namprd05.prod.outlook.com
 (2603:10b6:408:fd:cafe::90) by BN9PR03CA0110.outlook.office365.com
 (2603:10b6:408:fd::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.14 via Frontend Transport; Wed,
 29 Jan 2025 18:15:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.37)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.37 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.37; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.37) by
 BN1PEPF00004689.mail.protection.outlook.com (10.167.243.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 18:15:21 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 11:14:40 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH 3/5] devtool: standard: fix unbound variable usage
Date: Wed, 29 Jan 2025 13:14:54 -0500
Message-ID: <20250129181456.1826467-3-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129181456.1826467-1-chris.laplante@agilent.com>
References: <20250129181456.1826467-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004689:EE_|SJ2PR12MB7800:EE_
X-MS-Office365-Filtering-Correlation-Id: 25f277a2-690c-4c65-3010-08dd4090e51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QydcTl4i/WR/g73j9xWIkM0A5IVX3Z4n3V/gGxuGVDrgbu0GEWsCpONAlxmM?=
 =?us-ascii?Q?Z2PnR4BdHrPxjxzFHcLowDUYm9w3YEdsXr1Oi7te3Q+0hKGQQggQFDA4Mxs5?=
 =?us-ascii?Q?j/P2U0xk53nBW+3XVtzyjJKix02RiEfu6ah9Nr1aPljdOocJ62YKwkqEWjz1?=
 =?us-ascii?Q?PBwjSgZRO/KUCNl24jyJtPmJ1MVGJ2+i37e+yGAqHn375VQu59UA3/oLWtN0?=
 =?us-ascii?Q?6Hf8zYjnqVnym6KcVgXxqIRbO31hu//WOcPkFq6lcu6wK/cbsyQWUZ2Jw5lB?=
 =?us-ascii?Q?8I0r4fq4/BLUUyr4Lj1BHIxAelegg2nTxP5F9HGaUemYFXLb3poiXcYEfGKH?=
 =?us-ascii?Q?8wtcRJdhYS8E3PNbvkVAmdctb6iZp4XaSS/Kek3CQytQoYUNnWTOd8wApi3D?=
 =?us-ascii?Q?vuJaoqW+QmmTXukDUrL/hf6GbK7abatmjjZsWNJxZKFL4v9WSpzQdCAQ1lAN?=
 =?us-ascii?Q?Konbjfk8uSJun8W4Tua67mHX4qv3qNJo3Trki0s3HTNOcVBVYQfdoTObNl4d?=
 =?us-ascii?Q?EMv4FIEgzfZ4f6OV67xmVDXTbGTlk1ibCk3ivPOwT+3N5bpyw/1uPdHhVl2o?=
 =?us-ascii?Q?q0I59+SJH7wQSeZZ7Tx+y9TxPBg8JgvYwqMChmoGufmDkaqauenkj+3SGY/W?=
 =?us-ascii?Q?6lV5X3CepoBuNX/wuk3+USDYfINvnMlrSGUv1zGImsAdLo2fbn83dtw9aTtY?=
 =?us-ascii?Q?jvOMiWpcdTzWjgH0WLpMFo+C4FNR1G5oKg5W1/C2bJOjRLWiTn+P+Bhb+wXQ?=
 =?us-ascii?Q?lW00TtKHPkbqFAfsxD5w+oNhnQ3la030bNLYR7DbxfZoaif+7GYvfIcnGMA6?=
 =?us-ascii?Q?jza0uo7HDHZ7aMFMHkKBpqqOL7l2pNqAXSyu9p7J32/3UEI7croXzRc2GiV5?=
 =?us-ascii?Q?3X1j4BctYfGROo48Ow0CuAsUU6LCp25vXfWY5Vx3eaO3YNWA6Mux1LxBc9rS?=
 =?us-ascii?Q?2R+2vQG1fbVqWhRQhm5pVt9Mqe9pKB+E+nCjQG7LKWccFgFngipS9cT3lXwc?=
 =?us-ascii?Q?nOAh5hpt6RqbONbMUAaqxPwto9GtLjj2nCTvhgutSP90hL4jJZ13+xK7mKKN?=
 =?us-ascii?Q?wn69GiDPRq8+kOt0M8CPWYvXooH3LHqj0AiDDQsGuLbZlmC3r0UTdRqni4U6?=
 =?us-ascii?Q?P4icCAiHPuLRNeTgLTV7MJ5FJCNjlYkVXKgeOPW7DKH/YR6V2j+He9goTang?=
 =?us-ascii?Q?NGILTDAXmkVVv1o7BzAAuUVC4bGOMPF15sYzM7Gy1X6CXVM8s6cEF7PyqV87?=
 =?us-ascii?Q?q2qeMwiFDk0j0kl7nkWrMIem4PlINv5usjJoYi9oaNaJ+jkcp1qosa4W170J?=
 =?us-ascii?Q?V9xqRFHoNNsjNZ+0aUzsMqwPb5izU2B1GLzdqncMCMZjI+gIfy1OuRluQ6Bc?=
 =?us-ascii?Q?Nk5dTfTafAQ3ctVsf6gnWB1iCrASf2VpTe1mMTCYLciYXBhtirZmVcwttJS9?=
 =?us-ascii?Q?dji+Wjp+OjDC7HADuNzbTD0Lhp+k783DAa59z1650aEQlPOBJi9Yu27Ss01N?=
 =?us-ascii?Q?k452mlXy2M5AI+s=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.37;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg1.windmz.agilent.com;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 18:15:21.8592
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 25f277a2-690c-4c65-3010-08dd4090e51d
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.37];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-BN1PEPF00004689.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7800
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 18:15:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210408

From: Chris Laplante <chris.laplante@agilent.com>

Signed-off-by: Chris Laplante <chris.laplante@agilent.com>
---
 scripts/lib/devtool/standard.py | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index ca89c8e882..20c94616b2 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -209,7 +209,7 @@ def add(args, config, basepath, workspace):
             for fn in os.listdir(tempdir):
                 shutil.move(os.path.join(tempdir, fn), recipedir)
         else:
-            raise DevtoolError('Command \'%s\' did not create any recipe f=
ile:\n%s' % (e.command, e.stdout))
+            raise DevtoolError(f'Failed to create a recipe file for source=
 {source}')
         attic_recipe =3D os.path.join(config.workspace_path, 'attic', reci=
pename, os.path.basename(recipefile))
         if os.path.exists(attic_recipe):
             logger.warning('A modified recipe from a previous invocation e=
xists in %s - you may wish to move this over the top of the new recipe if y=
ou had changes in it that you want to continue with' % attic_recipe)
@@ -542,6 +542,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync=
, config, basepath, works
     tempbasedir =3D d.getVar('WORKDIR')
     bb.utils.mkdirhier(tempbasedir)
     tempdir =3D tempfile.mkdtemp(prefix=3D'devtooltmp-', dir=3Dtempbasedir=
)
+    appendbackup =3D None
     try:
         tinfoil.logger.setLevel(logging.WARNING)
=20
@@ -552,7 +553,6 @@ def _extract_source(srctree, keep_temp, devbranch, sync=
, config, basepath, works
             appendbackup =3D os.path.join(tempdir, os.path.basename(append=
file) + '.bak')
             shutil.copyfile(appendfile, appendbackup)
         else:
-            appendbackup =3D None
             bb.utils.mkdirhier(os.path.dirname(appendfile))
         logger.debug('writing append file %s' % appendfile)
         with open(appendfile, 'a') as f:
@@ -1018,6 +1018,7 @@ def rename(args, config, basepath, workspace):
         origfnver =3D ''
=20
     recipefilemd5 =3D None
+    newrecipefilemd5 =3D None
     tinfoil =3D setup_tinfoil(basepath=3Dbasepath, tracking=3DTrue)
     try:
         rd =3D parse_recipe(config, tinfoil, args.recipename, True)
@@ -1095,6 +1096,7 @@ def rename(args, config, basepath, workspace):
=20
     # Rename source tree if it's the default path
     appendmd5 =3D None
+    newappendmd5 =3D None
     if not args.no_srctree:
         srctree =3D workspace[args.recipename]['srctree']
         if os.path.abspath(srctree) =3D=3D os.path.join(config.workspace_p=
ath, 'sources', args.recipename):
@@ -1331,6 +1333,7 @@ def _export_patches(srctree, rd, start_revs, destdir,=
 changed_revs=3DNone):
             # values, but they ought to be anyway...
             new_basename =3D seqpatch_re.match(new_patch).group(2)
             match_name =3D None
+            old_patch =3D None
             for old_patch in existing_patches:
                 old_basename =3D seqpatch_re.match(old_patch).group(2)
                 old_basename_splitext =3D os.path.splitext(old_basename)
@@ -1548,6 +1551,7 @@ def _update_recipe_srcrev(recipename, workspace, srct=
ree, rd, appendlayerdir, wi
         local_files_dir =3D tempfile.mkdtemp(dir=3Dtempdir)
         srctreebase =3D workspace[recipename]['srctreebase']
         upd_f, new_f, del_f =3D _export_local_files(srctree, rd, local_fil=
es_dir, srctreebase)
+        removedentries =3D {}
         if not no_remove:
             # Find list of existing patches in recipe file
             patches_dir =3D tempfile.mkdtemp(dir=3Dtempdir)
@@ -1724,6 +1728,7 @@ def _update_recipe_patch(recipename, workspace, srctr=
ee, rd, appendlayerdir, wil
             for basepath, param in upd_p.items():
                 path =3D param['path']
                 patchdir =3D param.get('patchdir', ".")
+                patchdir_param =3D {}
                 if patchdir !=3D "." :
                     patchdir_param =3D dict(patchdir_params)
                     if patchdir_param:
--=20
2.43.0


