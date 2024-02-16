Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F091C48BF7
	for <webhook@archiver.kernel.org>; Fri, 16 Feb 2024 19:00:11 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.84])
 by mx.groups.io with SMTP id smtpd.web10.5209.1708110007990173307
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Feb 2024 11:00:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=UjqUnnCJ;
 spf=pass (domain: axis.com, ip: 40.107.247.84, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dWjyRKADvrfV9zjEup07tIdZY3c62L58qFhP23fZSol9MclNKvodP9c6D8Ob0B2IW31BzQ5vdHArDN4AbVtehekSD6f/wP5WNQEHI+EPZ1ds39dYUDL+BZJK8oWdE7+bhnMbHjRq0ttnOkiuSIjyMRlwsAyi2kGPnd9RU0/z3L6EQse7kfEWcUSeltcRS9o9CSvvS5oTPklJJcVtNcdObB7xsPInolNhRqZUP42TQSE9ZJEaEpbyoCAEhiD1ms+SbwY+bxBUdNjkbuyNuNxnFIrEt6aIzwHFVDxwg9ha7T53j8j4zauxNOCPxe6idgwn/o0F2BAaQ/fhT8n5LFyuNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J2eCNrPB1/SPg+Io9nS9zFDpYMEjKFx96ex70OMLOyY=;
 b=UL2oqwxebKQIEBpykQh6MdWq2oUw3VNaTsI8+wFYxFvZUM13BFIL26ejvjGvC1arzDsTf1Cj56uS3lNOMmmBoehmKtLWMDvXPNbNsPFjmIEE2dAfN9aVRbgzwypTWN+bDOzPUCJEUK1AGQ91nWIKmhD9Uu2+qIhjERv1D2hDJo6PGp2UcKNRjbKVrLAqFqEjpFlxSVhORnWSdJxCQ/yR5yMfrPuXnh92zaREQzIf5YF9RaHf2aZp/mhJiPk4pyitw2f0uJbEFMEc4COP2gzlhiyBbN2vH0dt03vTJBFLlHzUn1CqKYRVi8/HcJs4LOXkd8+0r02XmG+ooMomdadINg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J2eCNrPB1/SPg+Io9nS9zFDpYMEjKFx96ex70OMLOyY=;
 b=UjqUnnCJ4uJGH7rRaagT5HMTyaAwEPwnUi11Ck/ccr3QJ2Da1Di0RKWT7Au3iKfbOscg+L0+QRyZUYg8wQQujdREBR5sX53eCzWryqIpBhoFUZ8YjNWZKVtruFkd5tgbyeFDag26dC4P1EjmPvObfF/kLLVRLSCh7ZWNt+3qbEg=
Received: from AS4P195CA0035.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:65a::19)
 by VI0PR02MB10859.eurprd02.prod.outlook.com (2603:10a6:800:212::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.26; Fri, 16 Feb
 2024 19:00:03 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:65a:cafe::62) by AS4P195CA0035.outlook.office365.com
 (2603:10a6:20b:65a::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.40 via Frontend
 Transport; Fri, 16 Feb 2024 19:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=axis.com;
Received-SPF: Fail (protection.outlook.com: domain of axis.com does not
 designate 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com;
Received: from mail.axis.com (195.60.68.100) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7292.25 via Frontend Transport; Fri, 16 Feb 2024 19:00:02 +0000
Received: from SE-MAILARCH01W.axis.com (10.20.40.15) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAILARCH01W.axis.com
 (10.20.40.15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 16 Feb
 2024 20:00:02 +0100
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Fri, 16 Feb 2024 20:00:02 +0100
Received: from saur (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 6B7FD1493D
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100 (CET)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur (8.17.1/8.15.2) with ESMTPS id 41GJ02CE2607006
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 20:00:02 +0100
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 41GJ01LH2607005
	for openembedded-core@lists.openembedded.org; Fri, 16 Feb 2024 20:00:01 +0100
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/7] devtool: standard: Add some missing whitespace
Date: Fri, 16 Feb 2024 19:59:50 +0100
Message-ID: <20240216185956.2606978-1-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|VI0PR02MB10859:EE_
X-MS-Office365-Filtering-Correlation-Id: 9251be16-7e43-40c2-afa3-08dc2f217b5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Vt+/Onm3a9OvMcGNzCTXGiR8tyyZTVFa/eQ69uVPbDuJTODlp8ZnYHA83XfU857TWLahX6xuUNTX5X04l0ma1rWxigrYLIswz/xh2s+MncHLuibgW0r5dfYuddOvbcAdPiGyj56VR00x9vNCOqRfJvdF4mfI0XGFDE61vPnDN58ye2SQp12isawmTyDxh4y7wdts/878gG9PrB9XcQwaYhqWV3WP6IAPar08surzKd4NvIYzg1tnRfpdw886lMqC1MsvjPpNuzvXE8l2l48zwV9Gv2jUlB8GWUiL28Rp0ZszKfl1/Q8Pov9oBCBIFuLDGttzh9+e5h7NuNWo1tJdYyhbIrx2TE+/ILilEOPTevobA316vVIBnMqCxfyxXivKlIJvcYDg1QiW2kAordrrZiNVhDLq0KIakCTkju1jqn3o8oPlvzE8efxu39u3JRQz0oQdl6Y3w2ZcCoxYjDgzuaSneD+2x2QwHT57uxM2E5v8q2zDpBP19Z6MJVOxJp5l1kcQbf+jPCNv9S5SIbH2de7serPfQxfOnwB1PaCipJq/9JZMvT/K9nVrsc+b4RO3nRYlddO8QOYjl9qiNlfvtOVevrpxdTd3kV4YAZ3GUkIS/TY9vRQ7zovvv2wwbB3naY1wWyghmSzTIwolYJE2BkgPvb5yqReGly3kZ63L5+E=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(346002)(136003)(376002)(396003)(230922051799003)(82310400011)(451199024)(186009)(1800799012)(64100799003)(36860700004)(40470700004)(46966006)(336012)(41300700001)(1076003)(81166007)(2616005)(83380400001)(426003)(82740400003)(356005)(26005)(6916009)(70206006)(70586007)(8676002)(2906002)(478600001)(42186006)(6666004)(316002)(8936002)(5660300002)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2024 19:00:02.9553
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9251be16-7e43-40c2-afa3-08dc2f217b5c
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR02MB10859
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Feb 2024 19:00:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195799

Makes it a little bit easier when reading the code.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 scripts/lib/devtool/standard.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard=
.py
index 0243e3bc75..dd9232da1c 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -460,7 +460,7 @@ def sync(args, config, basepath, workspace):
     finally:
         tinfoil.shutdown()
=20
-def symlink_oelocal_files_srctree(rd,srctree):
+def symlink_oelocal_files_srctree(rd, srctree):
     import oe.patch
     if os.path.abspath(rd.getVar('S')) =3D=3D os.path.abspath(rd.getVar('W=
ORKDIR')):
         # If recipe extracts to ${WORKDIR}, symlink the files into the src=
tree
@@ -657,9 +657,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync=
, config, basepath, works
=20
             if os.path.exists(workshareddir) and (not os.listdir(workshare=
ddir) or kernelVersion !=3D staging_kerVer):
                 shutil.rmtree(workshareddir)
-                oe.path.copyhardlinktree(srcsubdir,workshareddir)
+                oe.path.copyhardlinktree(srcsubdir, workshareddir)
             elif not os.path.exists(workshareddir):
-                oe.path.copyhardlinktree(srcsubdir,workshareddir)
+                oe.path.copyhardlinktree(srcsubdir, workshareddir)
=20
         tempdir_localdir =3D os.path.join(tempdir, 'oe-local-files')
         srctree_localdir =3D os.path.join(srctree, 'oe-local-files')
@@ -689,7 +689,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync=
, config, basepath, works
                 shutil.move(tempdir_localdir, srcsubdir)
=20
             shutil.move(srcsubdir, srctree)
-            symlink_oelocal_files_srctree(d,srctree)
+            symlink_oelocal_files_srctree(d, srctree)
=20
         if is_kernel_yocto:
             logger.info('Copying kernel config to srctree')
@@ -762,7 +762,7 @@ def get_staging_kver(srcdir):
     kerver =3D []
     staging_kerVer=3D""
     if os.path.exists(srcdir) and os.listdir(srcdir):
-        with open(os.path.join(srcdir,"Makefile")) as f:
+        with open(os.path.join(srcdir, "Makefile")) as f:
             version =3D [next(f) for x in range(5)][1:4]
             for word in version:
                 kerver.append(word.split('=3D ')[1].split('\n')[0])
@@ -843,10 +843,10 @@ def modify(args, config, basepath, workspace):
             staging_kerVer =3D get_staging_kver(srcdir)
             staging_kbranch =3D get_staging_kbranch(srcdir)
             if (os.path.exists(srcdir) and os.listdir(srcdir)) and (kernel=
Version in staging_kerVer and staging_kbranch =3D=3D kbranch):
-                oe.path.copyhardlinktree(srcdir,srctree)
+                oe.path.copyhardlinktree(srcdir, srctree)
                 workdir =3D rd.getVar('WORKDIR')
                 srcsubdir =3D rd.getVar('S')
-                localfilesdir =3D os.path.join(srctree,'oe-local-files')
+                localfilesdir =3D os.path.join(srctree, 'oe-local-files')
                 # Move local source files into separate subdir
                 recipe_patches =3D [os.path.basename(patch) for patch in o=
e.recipeutils.get_recipe_patches(rd)]
                 local_files =3D oe.recipeutils.get_recipe_local_files(rd)
@@ -870,9 +870,9 @@ def modify(args, config, basepath, workspace):
                     for fname in local_files:
                         _move_file(os.path.join(workdir, fname), os.path.j=
oin(srctree, 'oe-local-files', fname))
                     with open(os.path.join(srctree, 'oe-local-files', '.gi=
tignore'), 'w') as f:
-                        f.write('# Ignore local files, by default. Remove =
this file ''if you want to commit the directory to Git\n*\n')
+                        f.write('# Ignore local files, by default. Remove =
this file if you want to commit the directory to Git\n*\n')
=20
-                symlink_oelocal_files_srctree(rd,srctree)
+                symlink_oelocal_files_srctree(rd, srctree)
=20
                 task =3D 'do_configure'
                 res =3D tinfoil.build_targets(pn, task, handle_events=3DTr=
ue)
@@ -880,7 +880,7 @@ def modify(args, config, basepath, workspace):
                 # Copy .config to workspace
                 kconfpath =3D rd.getVar('B')
                 logger.info('Copying kernel config to workspace')
-                shutil.copy2(os.path.join(kconfpath, '.config'),srctree)
+                shutil.copy2(os.path.join(kconfpath, '.config'), srctree)
=20
                 # Set this to true, we still need to get initial_rev
                 # by parsing the git repo
@@ -1004,7 +1004,7 @@ def modify(args, config, basepath, workspace):
                         '        mv ${S}/.config ${S}/.config.old\n'
                         '    fi\n'
                         '}\n')
-            if rd.getVarFlag('do_menuconfig','task'):
+            if rd.getVarFlag('do_menuconfig', 'task'):
                 f.write('\ndo_configure:append() {\n'
                 '    if [ ${@oe.types.boolean(d.getVar("KCONFIG_CONFIG_ENA=
BLE_MENUCONFIG"))} =3D True ]; then\n'
                 '        cp ${KCONFIG_CONFIG_ROOTDIR}/.config ${S}/.config=
.baseline\n'
@@ -2081,7 +2081,7 @@ def _reset(recipes, no_clean, remove_work, config, ba=
sepath, workspace):
                         # We don't want to risk wiping out any work in pro=
gress
                         if srctreebase.startswith(os.path.join(config.work=
space_path, 'sources')):
                             from datetime import datetime
-                            preservesrc =3D os.path.join(config.workspace_=
path, 'attic', 'sources', "{}.{}".format(pn,datetime.now().strftime("%Y%m%d=
%H%M%S")))
+                            preservesrc =3D os.path.join(config.workspace_=
path, 'attic', 'sources', "{}.{}".format(pn, datetime.now().strftime("%Y%m%=
d%H%M%S")))
                             logger.info('Preserving source tree in %s\nIf =
you no '
                                         'longer need it then please delete=
 it manually.\n'
                                         'It is also possible to reuse it v=
ia devtool source tree argument.'

