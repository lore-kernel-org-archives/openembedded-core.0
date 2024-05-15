Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE8A0C25B75
	for <webhook@archiver.kernel.org>; Wed, 15 May 2024 22:35:15 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.75])
 by mx.groups.io with SMTP id smtpd.web11.7874.1715812510091913956
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 May 2024 15:35:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=GC1eruk1;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.75, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLgllV1W96Xm+ldakSdoNT8loB4V7jJXsQnfYwb/GYxO/ytsfBhXcXYf0AHZkZwZ2SmGRI32z/T7uCeuUccWX64h/9aNDDYuSfFKl+Fchg9EP+2X9aAJ4LemQGBucrsi8F5Kd922siAkYBFBvchSWMBhzWfAEqk+vUBrNVWKlzVTlYnexARAgjdRMVd9ysxwrmIx+NAzKTyhtnObCazBpof8QEpe6A+LpYtnHUhIxYgcxQZT8R2H6beoze4Ys6lJULK8cVgd/vcSXryp7/afoUZ5R0ELNRho0OArK58QIx71Oh6YGb625wJzXUU2+WTfBsmSt1yT+PmnmC6Y0VIIbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YVzOG2lthWCFE50S0rlJjpbrrPn/5UKu2lIwFJved4=;
 b=NZHO8VPi98NCUN4hVwYxqFzCS7jU6XFVN0HfCkjtmoEI2iHzrWKJB8n+MLGe6+E6yN9bVfh1o/H4flnXWLeaAa0KOq2YrfPw4z0bzY4H3Rmczmy/f4ev0jE/veb7koC8+HZNWo6wrWPKtNemq+ig4cV3FB3IUfX38m29NfqqffvrZquuiGm+nLfTsQNJlGEvcvxwCCLEKiJYmDJUbfOUQ013cU/H0PxkYDl/+X8T+yrP13xghydIMHWSqlWcIdtQW/gJbQE9ZNuC2konUhZ8zDdwsKHYmqQCXyXMfMKlXF3oIhVbrfUdaUG2JcvRNue23s8+Fe2BFaMIbs3wDjHscQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YVzOG2lthWCFE50S0rlJjpbrrPn/5UKu2lIwFJved4=;
 b=GC1eruk1oLDSgMzleREzBPgOnkZVRoX1Jcz4PgnYUVX9ZRiMB+BKSp/JLARNix3zn2X7xf7C5DsjfD+KEWkRML01qyR37CC459loqdCOpqNt8C4d1MBot/tj8ReLTwUVG0/obDAAN0AtYAToh9aEr2zC9X7aKNgq7bOrhIdh6CM=
Received: from AS9PR06CA0539.eurprd06.prod.outlook.com (2603:10a6:20b:49d::28)
 by AS8PR06MB7447.eurprd06.prod.outlook.com (2603:10a6:20b:333::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 22:35:06 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:49d:cafe::ca) by AS9PR06CA0539.outlook.office365.com
 (2603:10a6:20b:49d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.25 via Frontend
 Transport; Wed, 15 May 2024 22:35:06 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7587.21 via Frontend Transport; Wed, 15 May 2024 22:35:04 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 16 May 2024 00:35:04 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v9 0/3] pkg-database and systemd-sysext image
Date: Thu, 16 May 2024 00:34:57 +0200
Message-ID: <20240515223500.3464486-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 15 May 2024 22:35:04.0117 (UTC) FILETIME=[2155B650:01DAA718]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|AS8PR06MB7447:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0a3f58d9-420e-4d59-bb11-08dc752f4406
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|82310400017|1800799015|376005|36860700004;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VO3bPWGRZ9iZZ/yycKLYFlGNoE73M6z/YfT9qrf+gi4kFZqZ9rkd9dlU13QC?=
 =?us-ascii?Q?DRnS4Takwftq7Xa+snPhRxTNF9p7z/ChP0jqS/AKcOxupz4tdYvF83Hw6dXa?=
 =?us-ascii?Q?mvX27AIPZxkQ23C0qxx3ydHYSaEWKcs8K0SLpo6GFpDeHOzf+QWKIdt0vA+1?=
 =?us-ascii?Q?ObsPqhK5Pgv0qGChGo2ibOj7iqsWKeAuez4xHSGzsE/+0LKzMBKPmHkYyaZP?=
 =?us-ascii?Q?pg9dFtr7GpSQRFlSb8BugFeLk0i0eVJjYafOyx5vJRBucDz7RSmIhqMliqk7?=
 =?us-ascii?Q?K98v/11q3j+Fiwc1o2E2BMcUJxNPMmzTBiLxKzLSi6/9QsF8PEoWBgdm2PEl?=
 =?us-ascii?Q?Vj3iXHnoSPdS2DBLH5fkdEf4ysSryRYcNHXISm3AJp+m057RHKxSdO72uC3v?=
 =?us-ascii?Q?QvGSdWxS2zeQL4ipA5ngk0xA9mKT1MiqAVZrx3CzKeRoZdX1afpKXpl9IAJb?=
 =?us-ascii?Q?KIsMzo7nRwOATC1fi89zk0khv4GauBLkCtYUp+AlUlDRYKQ0Soq4dh69hBCE?=
 =?us-ascii?Q?Alg0ltVUQ88eh0Rjfex78ZBzUpV3sFbsF4PwAAuMVQSPSOUL0KvkEXQQOCUO?=
 =?us-ascii?Q?dGU5C+b4vTxD8fCUyZRYgYfFHCz79stIMcO1T1e9zC2cLtFw2qGbLHs15zwc?=
 =?us-ascii?Q?NYtR+FusLuo+aR+V6YF/t2H+QlD1+cfFshBeHh3Z/n/hnw0c+z8MoIERQWDI?=
 =?us-ascii?Q?7zxzDXT2QaClNN7BvLCj/jgDXyHcN8jjCyg4kaLwBfsZtfd0EJ+ksjz+7JCq?=
 =?us-ascii?Q?qU65N4iwamrF/pOk0n/8mEHzQ29uGtImTIm37Ft37+NnORIuqWypALh5YGoH?=
 =?us-ascii?Q?FmZKZ8LJBhqvn05YBt4YkTUKfMCUQNzzJBsGq5tpC78trhYvk5rLJXDwjkRx?=
 =?us-ascii?Q?/eaGPjDDgFqWfOKvNVcQPUsKICVlOD93tdQAB8yb7m/WNeeyUJNNUQef6fn2?=
 =?us-ascii?Q?3ahpshTxcvJx1xfjOwwrOIHqoj3hOm6lS2EqYV8ijP5HFyB1A06P/VChGEKv?=
 =?us-ascii?Q?D2yIFrKR3mmGcpop6h9qasoPF+ePIaCv8mkoQiDhvdPHgWx8u2mPUlMiS3bj?=
 =?us-ascii?Q?ukrTxgSU3eKsxPgRNvJHR8oNXc59lTQsk0e+opCtUscZqSAn9/lnI7XEZWyo?=
 =?us-ascii?Q?Iu/jPAlndRvTGdM1txVaStf4IYfoAeCInEI81Is4Zxh8k+4d2Skbd89LgfCr?=
 =?us-ascii?Q?E/pWD7S3AUN0SfTcMAm1MzHNP1dW3xkCuhbXOrtw8wV/uSYsBZHtPSsr/v68?=
 =?us-ascii?Q?W96qFTvt8sM92i3MqLklyInrUmEE3kWTCC3D8VIxizUkHg05qTUw0YtYBLfa?=
 =?us-ascii?Q?V1IDUIkNUTny1NniJq+jMZvGXCBVtBoZicnvYqLVcptmQIoVk7cKrld2qZS3?=
 =?us-ascii?Q?LH2JsMY=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400017)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 22:35:04.4503
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a3f58d9-420e-4d59-bb11-08dc752f4406
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR06MB7447
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 May 2024 22:35:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199430

systemd-sysext allows to overlay another image (or multiple) ontop of
a "base-image" =3D the current rootfs, via the use of overlayfs; to add
tools and features meant for development purposes.

To quote the documentation on systemd-sysext:
" ...addition in order to make debugging/development easier). System
extension images should not be misunderstood as a generic software
packaging framework, ..."

To build a lean image, that only holds packages that are not already
part of the base-image, a snapshot of the package-database is taken
after the installation of the base-rootfs is done, and picked up again
when collecting the rootfs of such a extension image.

with all this in place an example usage could look like this:
some-core-image.bb
  inherit core-image
  IMAGE_GEN_PKGDBFS =3D "1"

extending-image.bb
  inherit image-sysext
  IMAGE_FSTYPES =3D "squashfs"
  IMAGE_BASE_PKGDB =3D "some-core-image"
  # the above pointing at a package-db similar to:
  # build/deploy/images/$MACHINE/some-core-image-$MACHINE-20240210172305-pk=
gdb.rootfs.tar.gz

then on the device, running some-core-image, with the extension image place=
d at FN:
$> ln -s "$FN" /run/extensions/$(basename $FN).raw
$> systemd-sysext list
$> SYSTEMD_LOG_LEVEL=3Ddebug systemd-sysext merge

As long as the VERSION_ID of the extension image matches the os-release
in the base image, the above commands return sucessfully;
for details on the compativility check see the docs for systemd-sysext.

=3D=3D=3D=3D=3D=3D=3D=3D=3D

changes with v2:
        rebase from 'kirkstone' onto 'master'

changes with v3:
	incorporate review suggestions for simplification
	add task dependency handling
	add oe-selftest for the pkgdb handling
	add variable documentation and
	some more comments, and examples in the commit-msg

changes with v4:
	rebase onto 'master' =3D> no functional changes
	fixed patchtest findings

changes with v5:
        rebase onto 'master'
	add '.sysext' to the deployed symlink name
        sidenote on the tests and autobuilder failure: run locally they suc=
ceed, e.g.:
          #> oe-selftest --verbose -r imagefeatures.ImageFeatures.test_imag=
e_gen_pkgdbfs

changes with v6:
	tests: restructure to call 'bitbake' only once in the testcase itself
	  (in hopes of solving the autobuilder problem; local test runs succeed)

changes with v7:
        tests: undo the restructuring of done in v6, in favour of explicitl=
y forcing steps:
	  '-c rootfs -f'.  since concurrency of the autobuilder, and reusing artif=
acts/sstate-caching is probably the issue?

changes with v8:
        tests: fixed missing feature=3DPACKAGE_CLASSES during 'test_image_g=
en_pkgdbfs'
	   which is now split into three, one for each of the three available pack=
agemanager: ipk, deb, rpm
	  =20
changes with v9:
	tests: fix singular failure in 'oe-selftest-armhost'
	   which was due to the built image not containing a 'kernel-image...', wh=
ich the gen-pkgdb sanity
	   check expected, but 'packagegroup-core-boot' instead

