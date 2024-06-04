Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02ECEC25B7E
	for <webhook@archiver.kernel.org>; Tue,  4 Jun 2024 06:50:49 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.76])
 by mx.groups.io with SMTP id smtpd.web10.15186.1717483846489193217
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Jun 2024 23:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Hyd/jBDz;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.76, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UuhDhhd2MHV1JXS/GjAZOQGgIbsEWPWHV3W81wa59KQCs8BoL6P77UB2OPRDCg/+cdf1PkrZ0+N34k9t0kXihPxMKEq5InXL5IYlrmL2vbYG7qNcdAp2FDV8Nz7MWWyO0PaV9YzNU2ctve5bG/3CSMb8ON6OUkkk8GD8fIqVw0f+OwMbGnlW0NmzLOYSP2CPJBNHWasyCvsYkyRjNU4CknJJIIxD9XNYZPs7wVLnZ2vm44R7gAWpOOP2LS6jN45tlU5f5ybjOUzgdxm66E2dsxQrl92AzUXXaP50yAuaBWVhwFvIt+9hJ0dZtSH/tQlzifLowjBV2JS75NmuOUU70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MjFtlEUnT6pcXeQ+6K8H5/bY/feCeNxPq5Jf3RHusSo=;
 b=hI8xIlNKHG4mjCjD150HarwdXmaRnr+gMFlt1sl6QHVHiLqUkfk1wq3qfbf2+/1X67fnXVirDqn7JgWNquUd5SfY5hV6gJnB+r3vqD036K3739R4aSFAzfHJR3OXjyzGEZHlNUfob6/pmn7rf0EHfwyZ5QKXYPyNyTFL27rNGCSXQNVqMfRC0wPnmexaPPX2n7CeOH5U/mxpnPvHncGpgEUJPPGud+D8HmTrJ/fuC7EmSy1C/a9xx/en3MDPobRnEdexGyB4iERtiwFpEDF/2DgY9fGvECTwEtsV42CSBOeb7QJjQ9wsgZSpoXT+Uox3GKoFGnJ8g68/EjleTZ+s9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MjFtlEUnT6pcXeQ+6K8H5/bY/feCeNxPq5Jf3RHusSo=;
 b=Hyd/jBDzIptCV12uh0NSX2Rwd5GWKauIqBSuY58qQdP6O04iVH6Up23YOCiZc5tKLqtmE4na9LJm6i4eU6ZZlLUEnaHFBvl615L29Kl3b4XPEm779HDn0YvLGJAF+jR4POwpvOlTuHLMOnB1Y4GW1exNxnmG4A9GnEJECQZ5FGc=
Received: from AM8P191CA0011.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::16)
 by DB9PR06MB8255.eurprd06.prod.outlook.com (2603:10a6:10:2c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.19; Tue, 4 Jun
 2024 06:50:42 +0000
Received: from AM3PEPF0000A795.eurprd04.prod.outlook.com
 (2603:10a6:20b:21a:cafe::ed) by AM8P191CA0011.outlook.office365.com
 (2603:10a6:20b:21a::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.30 via Frontend
 Transport; Tue, 4 Jun 2024 06:50:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF0000A795.mail.protection.outlook.com (10.167.16.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 4 Jun 2024 06:50:41 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 4 Jun 2024 08:50:41 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v11 0/3] pkg-database and systemd-sysext image
Date: Tue,  4 Jun 2024 08:50:37 +0200
Message-ID: <20240604065040.2771-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Jun 2024 06:50:41.0828 (UTC) FILETIME=[843D8E40:01DAB64B]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF0000A795:EE_|DB9PR06MB8255:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 0878d524-7a46-4ab6-3295-08dc8462a6d2
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230031|376005|1800799015|36860700004|82310400017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?/VBc6nFR9Y4VBOFM0TEZjowFtjpifvsCzorY4nRS4Dr1GZTn4/PS+GWKCe6A?=
 =?us-ascii?Q?6hUaegZNoLwv6NOHd2hivpIC5X95DG8Bx+GKNh7BqFIVAelweLvzFT42YDhr?=
 =?us-ascii?Q?D07SBEu58/ux2hTJgZtdsbLJARpidGBze8pwBmbDLcH+Vfgh5L4rnIbr7PPo?=
 =?us-ascii?Q?lSu/BVNZNZUlYxsBrdTr+G7dazGIBr6Mq/Uy6W7BGu+I4BxWEpsDhkw6sdp4?=
 =?us-ascii?Q?egp4jBMNOUMJlekom1+KW+XvEjna6n4uNXjakjd/KJbivX9S2YFAp+OZRQjT?=
 =?us-ascii?Q?6FVE9jFwpKcghflo2bmqFatdGQ7XQ6/PDIQj6PUCJh3eOGX0TzVTZ+5DOVsW?=
 =?us-ascii?Q?A3GAOQfuFzDD5Kph7IngXHLcPOHVK+jQUDwWImRYJZ9wsKUjM0ok5fdA8rep?=
 =?us-ascii?Q?fTjgEvfJswn4WjBBv0nOlC1EoDlq+p8Yej7U4AdFQMFN4yoovWYHb9RkQvqv?=
 =?us-ascii?Q?mQq0bo3FNcJFcI2rYqBDbdu2SKW3aAJ6gn8lAgHTQoRBAULuWAHVAjT9mIgR?=
 =?us-ascii?Q?LTySOGz0CI9IK4e/dT2m02WmIHeWovapTDOFmmqskyP9cZwY+b++i5woaiVz?=
 =?us-ascii?Q?Gg9sI2NKLIV6EhgOQ+A5rpzL6f34epEyyUyejsne2irhcsojOal/4f0AAoH5?=
 =?us-ascii?Q?+fvxWegyCpoP+YIOyhXIwlb5nKRjoEmTpUZBctmWlIx+uGiG25SemzVxNAg5?=
 =?us-ascii?Q?9GENtVoZskhn+jksU8DSFyidHQWYpSr1Mtbj2ixwGFe3cQBPkcYboS9TwJ0s?=
 =?us-ascii?Q?HR5dG7CGekL8kKqgKaqFCQL+QY7EnfnswZlt75XIa0yOTaqIWAfnhvLexu81?=
 =?us-ascii?Q?7nQ8XqoTb7BngZAfQMPNLHlzBuSVk6cI5XXpQNRmdYJ8LjPW3cLzjcsObt+B?=
 =?us-ascii?Q?/42X9uj/DoBCx6ARkADVyAu/M4NpK9u/LBrL3Zbc3uLUXbvvmVGYoKdd6FSz?=
 =?us-ascii?Q?EHCPU8BWmBMDa7LVklb1AcJcoBN1JBGXDyRrHGxKoQNq0lVlLJH07b7bz6m0?=
 =?us-ascii?Q?/pXP7i1echk4b1GF6uCMnQK1cvezosaeLnZxJAUwiHzgYhV4iDyx7Hpf7KLM?=
 =?us-ascii?Q?jtz/WXx01uDB8zahNGW1dK1Kky9TqfPdOjtfDUe6AmxSIUimPqZ7WZdQB2dC?=
 =?us-ascii?Q?GhoQHNya5B2z+FGdAt9wFkzEvgE/deNIgPI7AENKBnfaQ7ng9fqa0T5kjCc2?=
 =?us-ascii?Q?QLyhIhdDD/VkLDVsZmYE3mUF0OtUF8+XwoMbsizo3iTt6BxyjEFRyOg4Y1Dq?=
 =?us-ascii?Q?cU77Q/UNhcrjYkD3LvCmyrWQGiKTOT9GZ9MuBVil3Z8dtecTie2dnknD8Ere?=
 =?us-ascii?Q?8DZGU/HnTfG7+CR48fCHeS0Dj+8k1Y2VMDVCA/fPCZhGiibYYqSBXfZa4Un2?=
 =?us-ascii?Q?t7ZjhY0=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(376005)(1800799015)(36860700004)(82310400017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2024 06:50:41.9910
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0878d524-7a46-4ab6-3295-08dc8462a6d2
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF0000A795.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR06MB8255
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jun 2024 06:50:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200292

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

changes with v10:
	tests: fix runCmd usage in relation to native-dirs
	   due to which only the use-pkgdbfs-ipk test would fail in a qemu run arm=
host environment
	  =20
changes with v11:
	tests: fix runCmd usage: replace image->STAGING_DIR_NATIVE with package-ma=
nager->RECIPE_SYSROOT_NATIVE
	   as native_sysroot
	   the tests for test_image_gen_pkgdbfs_deb and *_rpm would succeed, but t=
he one for *_ipk would fail
	   only when doing the armhost=3Dquemuarm64 build, because in the rootfs-i=
mage used as build enviroinmane
	   happens to be an opkg already presaent in the PATH - which would be cal=
led instead

