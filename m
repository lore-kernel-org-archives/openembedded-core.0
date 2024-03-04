Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39AB4C54E4A
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:16:07 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.74])
 by mx.groups.io with SMTP id smtpd.web11.92456.1709532962867985470
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:16:03 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=GGD2cmou;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.74, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SykKz/9eXTkACqoEROkmOU1JqkjRmLgftBJ8D9q2b//G0DxPlUnfACtLBqqQUedIJR3rWzC17hNxakwgQ9fZeDyMdy4SHuEHInwdwYOJ0yvE1EGv2UMtQ7YwcdHEUt4ouojq1+YLK0/1yLd8zYvgi33LmUhoYnwjW6/d+hiHWrqqFFCBDX/qtmzxh3hPzfC/iGSO54vhNMitpbJMu1Exn83fDZF1ejDHQ3nw3CyOClOhEbkQJI+etBJK4nq6lDZAbPTPuhfEDJqoJjPqZptgwEOo/Nzx/QMkGWZ39KGd3iZEzPXyMvy9UHvdTxFUXJqzFLF74Hf3s7n2ZXSNAAQS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcuek2tViWoD/Ewl9mI7yu2ygzSIVQRji2W6lADxax8=;
 b=aaWTyfzJNrM4Zm59cWCumApmsgvbw5G086YOQjBxP8Px4H8xq0yYf9FpbZ7hxxoVKAgHzGJz0YffsdFt7uxQGYmCh1lJh6BvlWWO5u/ZYQFi0haK+CLKHoOXBis8uDl4auBJ9icOzgug2j4EAZ7+4+JViWRXi7tWbmH/uYD7h+Ffgoecpiw4dX0p/uJotCtyMvhEY29oXdilen+M96vxIMZtlQ53WJHqsDVV4IkUtam+iJXFS6dc/aPvqBW1beto3RoetQeNMJk68jlfV7mc70frhj8vWIfAlayBXYeLblgryKJUacXzwnU35OndsGartNyhE+Al4mOXDosLJ2/hlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcuek2tViWoD/Ewl9mI7yu2ygzSIVQRji2W6lADxax8=;
 b=GGD2cmouST1rLDV4Dv5vHMH4ZVJ8NchvJ8ezLewcwKY5zHvftoS/Q/l/RCx4lISvbFuN6OCd5yfhau7mG5NvsFRTyz9pmjXrW96uWGbQKxLkGEZ7cvXxRBYdtv/PjCOwRuSCoZOcgAJznSGeeWPNGzA4Ne6+X9THhfEYg7mL9bE=
Received: from DU6P191CA0005.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:540::18)
 by DUZPR06MB8984.eurprd06.prod.outlook.com (2603:10a6:10:4da::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.22; Mon, 4 Mar
 2024 06:15:58 +0000
Received: from DU2PEPF00028D09.eurprd03.prod.outlook.com
 (2603:10a6:10:540:cafe::97) by DU6P191CA0005.outlook.office365.com
 (2603:10a6:10:540::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39 via Frontend
 Transport; Mon, 4 Mar 2024 06:15:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 DU2PEPF00028D09.mail.protection.outlook.com (10.167.242.169) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 06:15:57 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 4 Mar 2024 07:15:57 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v4 0/3] pkg-database and systemd-sysext image
Date: Mon,  4 Mar 2024 07:15:50 +0100
Message-ID: <20240304061553.2281009-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Mar 2024 06:15:57.0599 (UTC) FILETIME=[6BF072F0:01DA6DFB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D09:EE_|DUZPR06MB8984:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9d73d54c-e269-4535-2028-08dc3c128e9d
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yGmazWDL9PuwtiRP6AitIp4aRKlRFnfBUiBnXKiSOwVcvUrrDFGkNh8Vcn3HKYYL0nE3fwap3LSvle+XSCF5vUVW7xOD/rJrXLiVgpzVh4i8pHQMw0ox/JF+yrnznIY9mr2uE1ZQEavTqhVGxip7+xpVwbz374KTU+x3K9C6A/nvFVVsBVJ2uFw+GcMp4m+RjrUq3t7lh9XACnBtC503DI4CoAiFDlQTGQs/rjEd9IPNwFZ2pKJ/9P16g1oQ30XDUr64GodapQEqROwxSrOnYzS5IKVqyyeKxMTimwlDpNIlbmTUTO1QnY5egjGpa+DwtBkBW23IB7pfFk8p7l6dZ+kj+bNIEE1N3Cvn8PPfR/8/GZ93GI4fCiSjDB+7xlvTsRRyH80LXHbZoRNBqqQlBbbarnknE47QpA7LyGChmICDUyAWPz+Y3NUzdqaO5mPwLuPKB4otcu9JD9SENsujd9fJuTZCuQGJtMkH54+liUSTtbO0LmlkWy1QWW0PVbk/j5grR2AnyzS3ARYzWjpkhNkadxHVFqVLeHJRqeDlIEaaj9KmXUh5p3RI/eQ93z01AR/2d0kabYu3LinEUEWJU/ZiOE6csbBRvAmnCjx7Q6vyke6WVEgIycmPZT8bPlKBPMnKVLP0lACWOeiIk1nKMXpjIQOA3I1fEAUcDaFnjhH4MbIZ1eyby2QOTkIiWYcPOm19hvq2FTkjeTkMcsWwAlW4MxP9d7aciOhHY4U6i4wbgfFV56dNbwBDaP3J3VHP
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(376005)(36860700004)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:15:57.8882
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d73d54c-e269-4535-2028-08dc3c128e9d
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D09.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8984
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 06:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196588

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

changes with v4;
	rebase onto 'master' =3D> no functional changes
	fixed patchtest findings

