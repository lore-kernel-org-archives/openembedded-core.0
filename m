Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BC0EC41513
	for <webhook@archiver.kernel.org>; Fri, 10 May 2024 03:09:50 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.56])
 by mx.groups.io with SMTP id smtpd.web11.4380.1715310585085421904
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 May 2024 20:09:45 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=kcvYy1qk;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.56, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RbfXfwk/W3SsTqDT9BmNykd3pnYJ7B1ZmZY4Sr1Ra8V1HsDU2X5hfL9amazzhpa4UP3SYOD4/vQvNl55xdBjzLyt/+wcVQBeuq5c3E2tTboudZRkIlU8mSUmVOiOJfh6OoyeVqEdWf/mtV64+LQW4IX2tY1EpPMBoMwYQOLbSqxO4m4NlRPAxLHeKgN0sTOMnu5VvOxN45Yx03AVvuPB5krMF0IrW0lsDHmQkfJ5pDn4XiJdZ+V6H5Ycal2147X6C91P79CTrBIR1wvI0W3o3PSdFCbyepZXzf8jbTCEkENceLaZaacjHKRJ6uLEnYRK/kumghrmRvcSdaN+UbNyjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rlJ8tBDT/5YVMuxPMShDef7/cKVSb3HgrUCIS9OH6qM=;
 b=ghqSrJJf4SfKzaCRQAxC/DyouG4WklEh1QD//Rbg0qNGKljjfYJ8en6roIDJN9tU9H22G4ncBjfI93swjy6A/2LElqr6JDIe9QbzggDdISCy9XmmnaWmOQjWDctpKVdIIdOekr+rR/Y0s3FnNHdhqyGfWHNUfDfX7CNXOQF3YeyVpBITxQV7Ug0Xl9rrCMoEQ7SsXPgrC19E5A8XX+3iigduEyDbkjQOueuf2SFrP8JpSX4SxtWFVJNttFmYyWbjInkI43Uz2FaahqMluoy50bkR8uuIUoX9WRGm2kATWLXAnYpBCenhzGfhw3BRc+mHgxOscfezPjBeIWznYg292Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rlJ8tBDT/5YVMuxPMShDef7/cKVSb3HgrUCIS9OH6qM=;
 b=kcvYy1qkyCTFCeeWnS4iSdqDbLXKmXK66JWLewita+gxPgelzbj716JunIGMRAaB2LmxGxnMKbUkvE4Vg6Jww1oDeYn8Aqr0SMF3B3nTd0sIP1UvO31K63JABmj/Tea8bQVIGQqg9Qqst0xeOvv7gqF+hnBibEimjLFCNJ+Bnxc=
Received: from DUZPR01CA0295.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b7::11) by PAXPR06MB8531.eurprd06.prod.outlook.com
 (2603:10a6:102:2b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47; Fri, 10 May
 2024 03:09:42 +0000
Received: from DU6PEPF0000952A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b7:cafe::2e) by DUZPR01CA0295.outlook.office365.com
 (2603:10a6:10:4b7::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.47 via Frontend
 Transport; Fri, 10 May 2024 03:09:42 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 DU6PEPF0000952A.mail.protection.outlook.com (10.167.8.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7544.18 via Frontend Transport; Fri, 10 May 2024 03:09:40 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Fri, 10 May 2024 05:09:39 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v6 0/3] pkg-database and systemd-sysext image
Date: Fri, 10 May 2024 05:09:34 +0200
Message-ID: <20240510030937.3789910-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 10 May 2024 03:09:39.0837 (UTC) FILETIME=[7F2692D0:01DAA287]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF0000952A:EE_|PAXPR06MB8531:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 671e9668-f44f-43f8-05ba-08dc709ea1e1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|1800799015|36860700004|82310400017|376005;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?vgKmwxDwYnA2c6n8WTJj65ZmF3AkYGlY2vFX4+Mng0A67drZA5DPGtfvhoGs?=
 =?us-ascii?Q?qP7fibe++J1qHA04yJT3Lofw/sdflw87Smv21ROw0zHjwAGEg5Xu9/TWFF4R?=
 =?us-ascii?Q?j+PgnhlMRmezSJh3PLAqgkDFa4WjlMz9lTcjHQyt1aNQcojUN5IJiVRNJ1b9?=
 =?us-ascii?Q?ITT+wTCMY2OSButC1CaxDmzNMliUuanfbR6rxqCFI1Q2nEah6XVR1InPayOm?=
 =?us-ascii?Q?WQeYH8z2PY95dWZOv2mMsXlKXuzhQtJWQTSEwlALVkDnwt9R9k5WNr/p3dCv?=
 =?us-ascii?Q?9+luCiLNjIUSfazE4NurDpEkoipOgvgei1eF81ugjvc0FfT6ZKagX/zEEcQ9?=
 =?us-ascii?Q?c7EUco7+CUeonQQQx3TpG1ssDVRMzomRGhTVeuGz8bGWo+lKFsKvgOv+KrLQ?=
 =?us-ascii?Q?W0PS4oUepm9jO+1HscBB6pQQ1En/Mxq3CXSexJVM8ILUNYgGOJ73nhUR/CR/?=
 =?us-ascii?Q?Agw7UlahnD0knksraR2hB2d88HuEPGae/oCXVQC+PDdWkCGerewSa4QCCjtU?=
 =?us-ascii?Q?rIJuEcLYnOYN7fC24D6/4uDg5dQJYE6psb0JHSGxrOJBnnz1+EpazgJ+GKoH?=
 =?us-ascii?Q?gnzHWFooyg0JEbK3mVDtgfs0AlbIkiHYoqCYt3imifE5yzwEt3SHhygNjE02?=
 =?us-ascii?Q?J69QRhNd644C11lPJsOVGRTuXcgtIcl6lg4gU/gTlhZWFtncGmnrwlLtcQb1?=
 =?us-ascii?Q?/1f4bfyORUrmeepLHBWsvnA2EuEyh4x7sp7VHdS+SdgaWNnjDEeUjpxglyYI?=
 =?us-ascii?Q?N1mVb7xSYwembsVCafcXTATlmLLKT/dNS+L34wSs4Jdm1ZHneDBPtW0CtmCI?=
 =?us-ascii?Q?10FzyZcMdQz7dPXXAPhmba7Umqn+CGykpFbm/Q8/k9DGTG6kt2xipl+UouF2?=
 =?us-ascii?Q?oDWer9Thka4uFjxbb0U7zVauoYX99yFRnzumtlbtsgwgJ4LcS7wWzbPGQwF/?=
 =?us-ascii?Q?2/VY/1XNm3EoRDF7yF9BGsITsj8J8IszEbja0KGS6G9EYLpkbyStZvfgz79L?=
 =?us-ascii?Q?Pv1bp5dzgBCoO7SRo4WMJuzm5P3eY1+8zX/BU2GQniFk38N2MoOVAiV+O+py?=
 =?us-ascii?Q?rS2b3h98iDwprom6nadRGQvQvAh2gtvtRqYnN3OzQwnWv0IsdTX9ahpfjdRQ?=
 =?us-ascii?Q?y5u7QKZe5npZla1D6K1euRxiunwMu9/N3K1JxNxZ9j5LevxBNvz19PpNEd0Z?=
 =?us-ascii?Q?j9TWnq+mCxhlIXwfvIEy1J5f+mQ0TZRF3gOccSRRCXsNuXPwV8IAPV5kNn6Q?=
 =?us-ascii?Q?GqXagGj5o9Lu95S2lTTGwgzolRa3wiHcWXXyVBkmd0PkRGIs6Cqa2lxcCnwf?=
 =?us-ascii?Q?g7wzw41oayyxIh0237DSaefNG+PtfDRqJKaRXUHlkWMPt+LfBJzR0fsiJ8gd?=
 =?us-ascii?Q?YtLv7mA=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(1800799015)(36860700004)(82310400017)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2024 03:09:40.2165
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 671e9668-f44f-43f8-05ba-08dc709ea1e1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU6PEPF0000952A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR06MB8531
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 May 2024 03:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/199187

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

