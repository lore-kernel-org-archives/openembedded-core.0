Return-Path: <chris.laplante@agilent.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9ABCC0218F
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 20:20:48 +0000 (UTC)
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (NAM04-BN8-obe.outbound.protection.outlook.com [40.107.100.86])
 by mx.groups.io with SMTP id smtpd.web10.22849.1738182040727325493
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jan 2025 12:20:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@agilent.com header.s=selector1 header.b=f7RDvt0F;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: agilent.com, ip: 40.107.100.86, mailfrom: chris.laplante@agilent.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vv8HMWmmdLgZtZfOUeHxl+oQi9l4hXXsMP4oN6ZPAlXUiNUeI+oCR+Z33Uvl1THMRCFNWBfRW/9F22NLgk64aWt4LGg7FF64bawiL/XZrNoyjxV64VqOUc31ZNbNxFvE4dLYFOGJR4rJjHL39HH8Uu9sRPDq7ykufMfSViREosoA9+dJJ/m9c4w0uhMB1VyPzbQkMo4CbZXXM27iXuIFJHEvRte0jBrnDUHJ+REM74DmTW3Rt95o2tLier17RvV451v1lx1/fqlxdVvTUXfGrmRaUWlfQ9GZehZGtn8ayKHuRAYZwh0iymCy6BMp1H79ANldYyhHp6o+8hKq9vWFQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N/yQkaPSubMUB74LxW83l6ZIjA0hEdWKYL/C4Nhxcoo=;
 b=sH2YM8QJ3Ty2O32/uD7dwp7y9LtDvxdCXsa3kWtdR1ff3OoKHdiFV/ZHNoitekNKC+2E4SV3BDv5TDfNDH7t5ag2pF3XDb7Q4PdoBn7dB64mYkPI1eJG5ex02YFco1oCEBpElswiLrF0HGpuOINl5f92AB3DGfOP5ODbY991JNrDb8gugVLNGKNwEhlDpYb44x6gRdxaSei+o6zy9Ybco4J/ntnacZ21zKtMnoTwYSlZ/gzihO7lR5N5mW2sePKJjys+LU6hmPofc26rX6yQusiqoiu7g7uoHkgIZ9msn2uqwGXmeNHPuWdAx6rBC+rfAfFgBDr5qDv3YpNLv8mk/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 192.25.218.34) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=agilent.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=agilent.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agilent.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N/yQkaPSubMUB74LxW83l6ZIjA0hEdWKYL/C4Nhxcoo=;
 b=f7RDvt0FnGm5QX70L0QshLKKqjQOsGhhxfnfl84ppKNLmmE4wgMS++lbYIMh8GNuuFkO8sxIdSja52A6PtBbBGPFDug7En/83TPicNJkWDLYuFdL0QqkWcnePGCy1KOmmKr9NnQy6AXcUOEO7b5U/PWx/3hYcN8Lv3G8okepskrMjkE7sVTW3TMmROPl1+/wICUDt3qd3k7aetNYFiorJ8vdEOHlf75MgBXKtkG3q7hN3N7S/JgFOf0r0jF83v6RVGxVASkBLptibZL4Di9KFXPDJKYmpsMqIXcSBmAM/n6d9D6kzbc582MzdjxLbsVECe1/BlkB6ACQM+rH50CH/g==
Received: from SN7P222CA0017.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:124::15)
 by DS0PR12MB7534.namprd12.prod.outlook.com (2603:10b6:8:139::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Wed, 29 Jan
 2025 20:20:35 +0000
Received: from SN1PEPF000397B5.namprd05.prod.outlook.com
 (2603:10b6:806:124:cafe::99) by SN7P222CA0017.outlook.office365.com
 (2603:10b6:806:124::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.18 via Frontend Transport; Wed,
 29 Jan 2025 20:20:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 192.25.218.34)
 smtp.mailfrom=agilent.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=agilent.com;
Received-SPF: Pass (protection.outlook.com: domain of agilent.com designates
 192.25.218.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=192.25.218.34; helo=edgeappmail.agilent.com; pr=C
Received: from edgeappmail.agilent.com (192.25.218.34) by
 SN1PEPF000397B5.mail.protection.outlook.com (10.167.248.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8398.14 via Frontend Transport; Wed, 29 Jan 2025 20:20:34 +0000
Received: from laplante-B650.lfs.agilent.com (192.25.126.4) by
 edgeappmail.agilent.com (192.25.218.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 29 Jan 2025 13:20:27 -0700
From: <chris.laplante@agilent.com>
To: <openembedded-core@lists.openembedded.org>
CC: Chris Laplante <chris.laplante@agilent.com>
Subject: [PATCH v2 3/5] devtool: standard: fix unbound variable usage
Date: Wed, 29 Jan 2025 15:20:14 -0500
Message-ID: <20250129202016.1833520-4-chris.laplante@agilent.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250129202016.1833520-1-chris.laplante@agilent.com>
References: <20250129202016.1833520-1-chris.laplante@agilent.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000397B5:EE_|DS0PR12MB7534:EE_
X-MS-Office365-Filtering-Correlation-Id: 56104a92-1f39-4867-4407-08dd40a2630f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?UGkvE8NvCVJnjsfakhZ69SLyNk0jF9ktyWAWXqJJ3g8R9aDajiGn2htLUm2F?=
 =?us-ascii?Q?suGNmODD5hM7xUOdhjwBEbaPw3B4PQ8YXv0pQgIVpxLBatu+L9Y8oh4lAM0f?=
 =?us-ascii?Q?O4LLSJB/xtle2NJWcb/xcyViSwY/EbcfxuPSNtHw/Ws2y0LYZ611d8gZYQMM?=
 =?us-ascii?Q?fATWKuoh4n+glZ6fvgTMsi+MX0Nbd/da6AXXOQVGkeO3TFoA5MMfe1Hw3S3F?=
 =?us-ascii?Q?ZKkMo/zePp0olFZBTJh+iyPYUvBs2cZhr6BUYfy+VPJJ29mGN/2rPGFIAy01?=
 =?us-ascii?Q?59PAMcPisHCLDmEupLi5G0iC8XaERaTVCkusoYRMHV+oCJDfPaPgktrKZXjd?=
 =?us-ascii?Q?V1TdM0Rqh7Xo8Nec6D3pIIbsZmvNEvh3ZyexXmUppZW81VHdFfWNExRtLhps?=
 =?us-ascii?Q?+dX0DoDSPCk5zH5uxVPMaGmB3TV8LzEzkOQ1f+ZSCYg/sF1KqPnSnCVYjaGX?=
 =?us-ascii?Q?TOpbHLcBqKpMOjsLvhnlj5ImE7xPEaIeGfJ9hnAaZcTg8EWoorZFcpdxuKdp?=
 =?us-ascii?Q?W1w/wGiMoINwLO8KfxE4FstzgKFAJ737f/1mBG8fEx1ZJiuVSDjLQTN6m9qZ?=
 =?us-ascii?Q?VD7mIRLqs5IqJk+nf48gWR1ZtnwBY2ZBeBIOy5lvDFqliM7ObckEZF9BT4Pt?=
 =?us-ascii?Q?XH+fZvZOC3eA40GyoAwFBTO0v4bsJWoAv0/unjvuNP/XQZuujtFCDVRfzYbh?=
 =?us-ascii?Q?U/iYo9VXHzijdsE2AkoKQfN09fcAGW4JU0HBPtPeonus7f7p7nscfVo/ts92?=
 =?us-ascii?Q?JlYRQFmLIxHYZm+ay4+qXmouLF8AqzN45kOuuwxpAskCk3rKNnlc8l8vt6lP?=
 =?us-ascii?Q?prtzavsQVXacyolTDcDoTh/w4NO2pD69oXA0qHiwU00aLC1VoQa+Dk1kUbhH?=
 =?us-ascii?Q?x0HLBw+aecHQrLr7WOKA1bPXQVIRDId8NkNUToLOKhVOw5rLhXL3+LK7XKzY?=
 =?us-ascii?Q?+LXEGNMnsCA+GNvs2x7sz9VVfskaPlhzluL2peNJb5apdPx0ZNtORoJMo3oh?=
 =?us-ascii?Q?NFTV9A9okgxT5Jpda6/dbYxLH6tq5kLl7SqiNngVMlbpv1nT9+K17S/rMMB1?=
 =?us-ascii?Q?AhB4OXqv3c1VS0Xj0LcN+Jgbp9mkWwozeuo/7KkvLBJZ2M2Vuz22/f38JyoF?=
 =?us-ascii?Q?tad1PlUsfrXYXiV6Xt6eF+Yym3hLNrB4hv+QAEQ2cqa4Qw0b4dagZoJQukN2?=
 =?us-ascii?Q?FpjJt6yuJPjdcji/G2yjUnaYAFQDFYY3wJlTcdBI/BGo+OtWE6MX2PAbb3uy?=
 =?us-ascii?Q?SOQKz/bUcl7/AtHMvovB67Qj/owvBs8D2aXDPW4RqElt07gky8R0t9k+uazB?=
 =?us-ascii?Q?ss67zb8XDbhC9+jDH/5OMxWihIzvWY+5QyCgBAiwfsegUd7L5HSp771p86j9?=
 =?us-ascii?Q?/nCKzX4k5m9y6YgyAI1NOjRM5c+EQuUg13DyeF1TyhpZLYlyhTgNjUgxvHcM?=
 =?us-ascii?Q?qheggGXUAb6qweOWRtbxeMgWMx+Y1ZDqlsDS3IFxwTX+AUifmokpTt+y2Gbx?=
 =?us-ascii?Q?oXGQ3jIfhoOwb0s=3D?=
X-Forefront-Antispam-Report: 
	CIP:192.25.218.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:edgeappmail.agilent.com;PTR:wpcosapexchedg3.windmz.agilent.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: agilent.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2025 20:20:34.6521
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56104a92-1f39-4867-4407-08dd40a2630f
X-MS-Exchange-CrossTenant-Id: a9c0bc09-8b46-4206-9351-2ba12fb4a5c0
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a9c0bc09-8b46-4206-9351-2ba12fb4a5c0;Ip=[192.25.218.34];Helo=[edgeappmail.agilent.com]
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TreatMessagesAsInternal-SN1PEPF000397B5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7534
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jan 2025 20:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210415

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


