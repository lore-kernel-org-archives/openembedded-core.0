Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ACFC48BF6
	for <webhook@archiver.kernel.org>; Thu, 22 Feb 2024 00:34:43 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.83])
 by mx.groups.io with SMTP id smtpd.web11.2440.1708562080531229566
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Feb 2024 16:34:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=q0g7KQNt;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.83, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qkc2VA2HUJLNx/JBUgkfVQ/yaM2duEEYgBaYHOPzyvWsIXdEPHU2yXxNTkyjmMMARiDUt3cHtv1jQCK/BiHcJ2zXvYoi9bxvuPTnP/VEeOkxRR60utbPCWT1dkH2UtgXRKB3lWb+uRiZ062pl7oOkbzAoGM9wY1vxodn/Ojlpo9vtA7VF3AId/GJOe8MrPzcbC8tNyBzRd7UKMiysu+siGzPJITUnnki46jpRBtKlgVHRFGf2uut5psFNAQ9Jv8rv0z138LzPHLyusgy4tKCydx9Ijivj6XouYqDVfMeKJFHCq4/YD/vzcje9Eaz4YgP/HM+isv8seZGBKPLpvc6cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n1nBh53j4L7aQOa3HsxwVSVKiv5nsfF1H+rjx/DYJ1g=;
 b=QGIQroLwLf5baW+MZ8J0pJLVDeMIMsyN1gUEwV+wg+46rXpSiz6VGFZ7nYXFyYqqCLwzkXkg89D+klNSnHXTVy2jINyZscUGJCjTk0KiJGe3CebhNU10wRkD541L1rj3sJY0ViKeUFSq7gT/rompcVeC6R9vKyWBSKArbjZOKUSFtuKUCLia3PSWzJ+8MKYGeK8oq9W+yL0IaUBeF9nftKqU8AH95sY9OqBdW9Y8lejh6TPPkb3CXyY/GHbNis0xaAL4OuzRDiQRcnoZoCvZzFC+veDNjf44HjyEQs+YY7qGvrkKgeIMN8k/28MfK0pJrIDeuWLnOxJKslNJ8yf5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n1nBh53j4L7aQOa3HsxwVSVKiv5nsfF1H+rjx/DYJ1g=;
 b=q0g7KQNtmpUEkeeol6F2wi0aokMn7GGmhDP66ufFN4/mISIW4hsyClc2ZcbOB/9D1fDZntfQH6JBNUmIjfU445InDtvbXz6ylQt+bH147Bw3BWLIXbvEoGWlkgQz28B7aqT6q7ZVAAWYgdDMgjSqP2vozxdFXgQvyfjVlj5FaUU=
Received: from AS9PR05CA0040.eurprd05.prod.outlook.com (2603:10a6:20b:489::23)
 by PAWPR06MB8881.eurprd06.prod.outlook.com (2603:10a6:102:38e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.39; Thu, 22 Feb
 2024 00:34:37 +0000
Received: from AM3PEPF00009B9B.eurprd04.prod.outlook.com
 (2603:10a6:20b:489:cafe::29) by AS9PR05CA0040.outlook.office365.com
 (2603:10a6:20b:489::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.41 via Frontend
 Transport; Thu, 22 Feb 2024 00:34:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM3PEPF00009B9B.mail.protection.outlook.com (10.167.16.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Thu, 22 Feb 2024 00:34:37 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Thu, 22 Feb 2024 01:34:37 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v3 0/3] pkg-database and systemd-sysext image
Date: Thu, 22 Feb 2024 01:34:24 +0100
Message-ID: <20240222003428.1585775-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 22 Feb 2024 00:34:37.0094 (UTC) FILETIME=[EA102460:01DA6526]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM3PEPF00009B9B:EE_|PAWPR06MB8881:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 475a79b7-6c19-4778-2712-08dc333e0cac
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	CbqfAoCLw1jtbK6MWkGXVZl1Ttn0zu5W2Hr/zY+tJAoYVWnXOWcBynLwN38NPsMIUm9IjXGbIS1YT2bzn7FcF3ImrpFeZ4+X/AbxlBbAYbJrNLhvikd9fzk1rUIJKFOJD9LBajxGJ6DRLLCr4/GjpK1ROS3Ipb1TLtWacXqntBLBmCa+AWGwrlgauU6VJ26nrPStfNn0dhlsnTIyIuQ63TuLb72y21zqDIjZvQZLDDshvyU84QvB2ohDqP4uxYJPocvF9b5O9sCXz66zRBbRIC1f1raw7so8QMUuHFbgeWhf80eSrF9x8SlfZxQfos5xuxPDX2IVRKqQ93AlahhzJrgK/ww9CgTTU4d8EHRtdWU5cTf1stYytFMv+siJseUV5N0yl8VLZp9h5XmmnUxazb1ViuoPkvKsOQnt9oIzCSPVArw82EqEqpuMCR2UowVLnAxRMvAjWdkDIVB4N1Qp3kASjH4FXBtnBDFE8iMEj7GlVZhMVhYWlJhOlw5XNQsoWNgbxIKep82b3a+cYQSHpZcGltyGYkQdVpJYWYZeJVtRMDmf1+GnKJCWqkY0Eb7M27/mZgtSZP8LxWe+or856/dMd0A8um8hlgRCKqtLCv9gex+XuB6HRMUsNMkL00Z0Hw7bYT56/ZIcmXinFLrSTA==
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(46966006)(40470700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2024 00:34:37.3052
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 475a79b7-6c19-4778-2712-08dc333e0cac
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM3PEPF00009B9B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8881
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Feb 2024 00:34:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195999

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

changes with v3;
	incorporate review suggestions for simplification
	add task dependency handling
	add oe-selftest for the pkgdb handling
	add variable documentation and
	some more comments, and examples in the commit-msg

