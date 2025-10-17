Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94EF2CCD183
	for <webhook@archiver.kernel.org>; Fri, 17 Oct 2025 01:41:36 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.9])
 by mx.groups.io with SMTP id smtpd.web10.6273.1760665294315525079
 for <openembedded-core@lists.openembedded.org>;
 Thu, 16 Oct 2025 18:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=XhtoMNKV;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.69.9, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plPm1rf2oOmh8b922DP7mXrO++hlkWxxL9nspWUR1mbnVq6cxrOI801zHk7uxf0SwQogY+cRr+3MzZjLCpYWSgh047Vl/axSgGsv+v0DdbBbo/AZtNGe8xvjQ++41ZSkNW8q4rlYLbADEm7DqTeGPgOVEBNu5DLV8VDW0OSAZCLU2LWs4lQzcmjbxDcF+5AtpVm2LfkAy0onKuf3j2b9eXG8s5u2n1+bZMuq7HZD1ilAAmUpmLJg5jf+eoYA0abm9NfVSIcvtYHoF0/aiqdCi05MCPvEv7pPzOCnCkRR8PFdg5S5/Cm9cFz90UMsG77wUmcsMj5YrPo5DcGqnIJOGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vocy/hX9TgmW/dYRjy9Q66+LzmrJgq0kYhs2/ew33sU=;
 b=HoH5OtZiC+I5h/v2hOU/d+8aNDbJvYGmKCTnIn+UDn96GcFolEpKPQvB2CPEpHBHyiLWITPaKUXnAOoEJX8vc4LL7W97A/sxMARq5z/3bbwl+pALFmqiGOc7st8np1iaYawOZQ09E8XiqZVyJW+zXq2s/ym6EAMTh+XAaKbnRvQtpC14qj84/dcnTeYeZ0rtVAmloBiJhEkH+Z9KRcSeUjbmRTNpxB2leEF3J+d/Vi8owD/f13VVSDKjAG+Q0cbxKWWZFJ6enUZfByvo++iFahbzaK3JCSEL3DZXp/ruOtqIOKV2jbiMVkTNIeRNp4Mcprc2MxVq5HVMUPZYLmINMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vocy/hX9TgmW/dYRjy9Q66+LzmrJgq0kYhs2/ew33sU=;
 b=XhtoMNKVajvOaZPqJdONZto4stEfyBA+2wWj8fAITeQIxJGzqFY51Za4hXvY0z8yDLzDFZkcG6vjJgMinXnbwgFbNtMRPKMSpmMABAnSNElmicd7dvylVo/fOImlPIMtY/8dInIDuIXFjhkIPSu1YTSQfNZVIk7tlMrJethDOdM=
Received: from DUZP191CA0059.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4fa::13)
 by PAWPR06MB8620.eurprd06.prod.outlook.com (2603:10a6:102:391::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Fri, 17 Oct
 2025 01:41:28 +0000
Received: from DB1PEPF000509EF.eurprd03.prod.outlook.com
 (2603:10a6:10:4fa:cafe::78) by DUZP191CA0059.outlook.office365.com
 (2603:10a6:10:4fa::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.13 via Frontend Transport; Fri,
 17 Oct 2025 01:41:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DB1PEPF000509EF.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.7 via Frontend Transport; Fri, 17 Oct 2025 01:41:27 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 17 Oct 2025 03:41:27 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	saul.Wold@windriver.com,
	adrian.freihofer@siemens.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1] devtool: un-/deploy-target: put deploylist into destdir
Date: Fri, 17 Oct 2025 01:41:23 +0000
Message-ID: <20251017014123.222073-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 17 Oct 2025 01:41:27.0592 (UTC) FILETIME=[2798D280:01DC3F07]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509EF:EE_|PAWPR06MB8620:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: b6dc889d-a3a1-449b-2413-08de0d1e4a45
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wnBYR0oGrh1MFa2eNpSgvh5zQ/2TFDDZQLycIdXYn++VsPpTQq1hrkX8IOGn?=
 =?us-ascii?Q?4jaaurAT9IfBfMP4ymf4i+gz/NUTIgSwO2smPjTVlpUiFAdReUnJTMFPdlmU?=
 =?us-ascii?Q?grjZzs92gRCEmbA1u2zhYA+yQhB6xUfPJXeB/t+WnPXP1Nt2/AFwb/9rej+F?=
 =?us-ascii?Q?B2TI3n87cVv1VBz8klQTN9wxMFoAYsGKxdCUY2jjFv/mkN5WpmkVlvaQZpeS?=
 =?us-ascii?Q?ssV/nlMBMFV1E4X4/G1ifzAlr8pU2o9xBho4B5wQB93UBUSJsJ1WU5x2+yqZ?=
 =?us-ascii?Q?yjZMNpa6xwaKakqZ4h6DizapU9H6szXZ4oNxXeUYzSV2d0U/U1cF5YMw1py8?=
 =?us-ascii?Q?GA/OgBEddZvCR7/Cs+F0mlnES0FD/RdSOPD9UKMw/Lkx32RkBhxHacF2Jkma?=
 =?us-ascii?Q?PcKF+7An9LKe4ihgUU+UxHbo+U3Gj7SfCXPAUxNBU2V8ZgGrD6xmQjkI07gm?=
 =?us-ascii?Q?1uRbynZ+g4CLjvcDGjXcOuHcuDjDXRAsvQe2BsT0yjNzLNAsMTJ8xKAJSzHq?=
 =?us-ascii?Q?MxzV0A0N/2Wf0eFZxtu3zpYERm4knkiGpkT+UqDeiy2/YuHJq6jTO6slCo8B?=
 =?us-ascii?Q?kLInzlhwp3AHnAodfrfLASa93uTzeWIPmjoKyUGANGg4kmsKbjlECvLJ5s3A?=
 =?us-ascii?Q?2m/F7yaAZW4k3lNMvJKuwFzWoQjdusluTSyOzB+xv6ZG3PEikvFoUyIb3m9Q?=
 =?us-ascii?Q?UFqZwRIoXq/roEOj+2dXxoxJQrtxiNGJ9EKOGwAxQ37UDI+89oJ8kHes6Rcy?=
 =?us-ascii?Q?TiVLB+SwOdnPqx7FPCfxQv/9gvwFcwI9W4g20MPDBazJdhuEBWArjheIxEBH?=
 =?us-ascii?Q?h5zgAVzvWOvKQBlg9skglDlF+ylR+RI5dLGUaD0pZp+Gem2iokLKyve58Qs6?=
 =?us-ascii?Q?9z6bGXxg0wkXSP2VCs0ZOl98iocNSkVtnkiZoTUkq5b28Hvd//V+m8fPPe2M?=
 =?us-ascii?Q?8pm8PPMxXgdlGiKAS2X+zj8zvLktdtifzLg0nisKsPXrj8BNbIs866tNcb4r?=
 =?us-ascii?Q?0ZtEKFPyrngCL2NRKKc1AeNGTc/42MWhfMPGSZxfVw1oO4/5GIsHY4RM84i3?=
 =?us-ascii?Q?vES3FMKj9iKhnCpQbKOZjDxhGnCIbWrbUb9VcOBM3gBvF+Gtt+4qh+vXdjrr?=
 =?us-ascii?Q?Bm/HZjt2iLDFtoh444f/YkV2HNevbQtDOrlOdEFzLxzG2DFJSPOkN8czQXbj?=
 =?us-ascii?Q?2Jp4wy7N4yS5bEHTZkT/vrIdyjoPWbkIUc7XY781M+qF/7kUbJOg+ZPIJ71d?=
 =?us-ascii?Q?XqMwg7dmJJ2hJ8MU7BMGJzLWCc4tpRplepu32haJCE/sf19t1i5I38+dgXus?=
 =?us-ascii?Q?WX6sail9SXw6OSNmIU5ulfSjdYi7ZX4oONd7a/tmtnJHHlxl+KxIulDsoKcu?=
 =?us-ascii?Q?20qxfWP8pvN1Ig59U7HJQEZI7QRRS9JqUFZRaCm0rWwZRZaFi9XrVvfHxfub?=
 =?us-ascii?Q?LXXPwLCfm2dniSmfOqMGKNbs5MLXjHHW+Aazmr2aiQqUodmVJvd8gkbo/CdK?=
 =?us-ascii?Q?pttnclSEANxHBg4LCqN8bulI23gr5Je9K9F5AiVaje5BdFdeXsWP6Ap7XeDW?=
 =?us-ascii?Q?muh44rQjMrJ3USC/U5Y=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 01:41:27.8750
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6dc889d-a3a1-449b-2413-08de0d1e4a45
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB1PEPF000509EF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8620
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Oct 2025 01:41:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224987

When deploying on devices with a RO root-filesystem, devtool would
fail on writing to the hard-coded "deploylist_path =3D '/.devtool'"

Since devtool already supports deploying to a different root-prefix
with: hostname[:destdir], we can make use of this guaranteed RW
location to place the deployment-list there.

Add the destdir parameter to the _prepare_remote_script function, to
construct the deploylist_path from it. For the 'undeploy' the same
host:destdir splitting logic is used as in 'deploy'.

Now it is possible to modify and build a recipe 'foo-bar' with
devtool, and have its ./image content deployed through:
$build> devtool deploy foo-bar target:/opt/development-overlay
Or removed again with:
$build> devtool undeploy foo-bar target:/opt/development-overlay

Signed-off-by: Johannes Schneider <johannes.schneider@leica-geosystems.com>
---
 scripts/lib/devtool/deploy.py | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index b5ca8f2c2f..a98b33c571 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -20,9 +20,9 @@ from devtool import exec_fakeroot_no_d, setup_tinfoil, ch=
eck_workspace_recipe, D
=20
 logger =3D logging.getLogger('devtool')
=20
-deploylist_path =3D '/.devtool'
+deploylist_dirname =3D '.devtool'
=20
-def _prepare_remote_script(deploy, verbose=3DFalse, dryrun=3DFalse, undepl=
oyall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):
+def _prepare_remote_script(deploy, destdir=3D'/', verbose=3DFalse, dryrun=
=3DFalse, undeployall=3DFalse, nopreserve=3DFalse, nocheckspace=3DFalse):
     """
     Prepare a shell script for running on the target to
     deploy/undeploy files. We have to be careful what we put in this
@@ -31,6 +31,7 @@ def _prepare_remote_script(deploy, verbose=3DFalse, dryru=
n=3DFalse, undeployall=3DFals
     busybox rather than bash with coreutils).
     """
     lines =3D []
+    deploylist_path =3D os.path.join(destdir, deploylist_dirname)
     lines.append('#!/bin/sh')
     lines.append('set -e')
     if undeployall:
@@ -146,7 +147,7 @@ def deploy(args, config, basepath, workspace):
         except Exception as e:
             raise DevtoolError('Exception parsing recipe %s: %s' %
                             (args.recipename, e))
-       =20
+
         srcdir =3D rd.getVar('D')
         workdir =3D rd.getVar('WORKDIR')
         path =3D rd.getVar('PATH')
@@ -244,6 +245,7 @@ def deploy_no_d(srcdir, workdir, path, strip_cmd, libdi=
r, base_libdir, max_proce
         tmpscript =3D '/tmp/devtool_deploy.sh'
         tmpfilelist =3D os.path.join(os.path.dirname(tmpscript), 'devtool_=
deploy.list')
         shellscript =3D _prepare_remote_script(deploy=3DTrue,
+                                            destdir=3Ddestdir,
                                             verbose=3Dargs.show_status,
                                             nopreserve=3Dargs.no_preserve,
                                             nocheckspace=3Dargs.no_check_s=
pace)
@@ -303,12 +305,19 @@ def undeploy(args, config, basepath, workspace):
         scp_port =3D "-P %s" % args.port
         ssh_port =3D "-p %s" % args.port
=20
-    args.target =3D args.target.split(':')[0]
+    try:
+        host, destdir =3D args.target.split(':')
+    except ValueError:
+        destdir =3D '/'
+    else:
+        args.target =3D host
+    if not destdir.endswith('/'):
+        destdir +=3D '/'
=20
     tmpdir =3D tempfile.mkdtemp(prefix=3D'devtool')
     try:
         tmpscript =3D '/tmp/devtool_undeploy.sh'
-        shellscript =3D _prepare_remote_script(deploy=3DFalse, dryrun=3Dar=
gs.dry_run, undeployall=3Dargs.all)
+        shellscript =3D _prepare_remote_script(deploy=3DFalse, destdir=3Dd=
estdir, dryrun=3Dargs.dry_run, undeployall=3Dargs.all)
         # Write out the script to a file
         with open(os.path.join(tmpdir, os.path.basename(tmpscript)), 'w') =
as f:
             f.write(shellscript)

base-commit: 58558b97c157469f060bb2ad59a40254fb6181e4
--=20
2.43.0


