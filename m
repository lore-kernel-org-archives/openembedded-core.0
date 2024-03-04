Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B13CC54E49
	for <webhook@archiver.kernel.org>; Mon,  4 Mar 2024 06:15:37 +0000 (UTC)
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (EUR04-DB3-obe.outbound.protection.outlook.com [40.107.6.79])
 by mx.groups.io with SMTP id smtpd.web10.92480.1709532931231998518
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Mar 2024 22:15:31 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=DxQBIH90;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.6.79, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nEct6uza5D0Z4gvRwHGGbJ6vk6DoAYJMIQ+tVRL3MpU2sBzQAN0VVnNhzkBgFi/3a0jxeo9TWtxXA8AymGXyV4W3BT9riEmkfq6cTUxi85p1nIK5tepY7M6vqdKPZy1euC171qM6BbOrlk1M2KHBuWli3S5ABtiXfk5gdLtdG6T5B9DHe9FENRAqXjX5qziaSSs3WQ99iYmHAYZl5wgRbstEDTiI2CANr58VEMATtq4pKbNQourbHGMBPHUW2XMeMQKFuIxTLgz7y3CjqM20hjHgHFC4KfKRTw94zxj5jQt70bwFdk7T1GqoN6opg+UVWyTypT4FSXTiaitoo0Y2jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bcuek2tViWoD/Ewl9mI7yu2ygzSIVQRji2W6lADxax8=;
 b=LLuOQLfWDuTe4w5UNjYqolHVvEFki4Mpu766qdaeJCH737gJTeUTVbQdqF6IZZfY8Te+yctV8dMp/iTca7u2dKWzJefQQK6YamcSQ3MpFGZOM29k73YToieSB3+mh6cELLArpKrkPa9I3M+TqqVTEjPYU8WLxw/t27VJWgkcq5WTBw+2BEw0x5WQGukyzOE3nvHbPXBscIl2G/wlbUClFZgrw8pIYQf25H9/Xt37DpRcE4A40MBAsXeANc8ZpZ+gXTAo5VfQ9dmgeBAZypT1ldAYKQPQQNu8Tjf6dwHvtnEX2o3CM52rZQ7YcnDojeFVFz4rYGN6E+JKXxnLdNY8/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bcuek2tViWoD/Ewl9mI7yu2ygzSIVQRji2W6lADxax8=;
 b=DxQBIH90hmxVzc7bim/yx0UmnYBiLAgoGPFkgPHscXG1fvQsrtfSjY+MV1ZNv85Mq/VGYQAuLe7aBbU8zZtYatrkVc0l5A/ooGkeLAzCzZ4xn4wH4BXv6gQYGtoC9QdmDH3q1S5qRQsquCOT5nntlL40TyGBmTCHu1MU8Q97Oao=
Received: from AS9PR06CA0302.eurprd06.prod.outlook.com (2603:10a6:20b:45b::17)
 by GV1PR06MB8385.eurprd06.prod.outlook.com (2603:10a6:150:20::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 06:15:28 +0000
Received: from AMS1EPF0000004B.eurprd04.prod.outlook.com
 (2603:10a6:20b:45b:cafe::f) by AS9PR06CA0302.outlook.office365.com
 (2603:10a6:20b:45b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.38 via Frontend
 Transport; Mon, 4 Mar 2024 06:15:28 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AMS1EPF0000004B.mail.protection.outlook.com (10.167.16.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7362.11 via Frontend Transport; Mon, 4 Mar 2024 06:15:26 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 4 Mar 2024 07:15:26 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v3 0/3] pkg-database and systemd-sysext image
Date: Mon,  4 Mar 2024 07:15:17 +0100
Message-ID: <20240304061520.2280541-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 04 Mar 2024 06:15:26.0209 (UTC) FILETIME=[593AB710:01DA6DFB]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004B:EE_|GV1PR06MB8385:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 376b6e57-ae13-42d1-2031-08dc3c127bd1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Mh/q2ha/JBQvlDNHqikvHbEl5hlAOqpNUH6Wti04OTc84oIgbjCc+sRBqp9Y35fbMRkZP063jax+WK20FyPe9a+jF4lmrSzZGfv7lSMATNtHoUaswoKQVyfArFs07NPuYpy8Sdj9/dbubDLmEQ3BpafbiBeEW2Sw4UKi3gKJIQmTm5aTCH/xBed1yNR2e/ufCU0fXeu/vpvxfEW+l2Q3/UVwU7BwggXFuGVsmni1ERm+DulJvrfae3IZsBYDsDYazZ5KDnwaXnEqlBhd0LRsWRXip3krfjU8J//qUu8fQykCSAZZMXRXzk0+7Up8EOYTpajDiv8RdKIjmTdV6y6dhgBTh4ntjzsaviFr4TiRR4SQPq9jJAWIqfaOASLpAp6bl/e2sWrlj3VPclsDX6qvu5f5cVPvFmupH97hKMNOstkBc393yzsU+kpghHW9u6+62vzjIftZtsDCA20k7V24skWDuXuL+qtBV4pkb4JC+WLdq2JJRQjqr67pBns2J9REl89VtgXF2gefoEUi3mqwN5+jVIwnrpplgbqwAA1A/cSjUIDpAVwV8MCVCxOO5M7eD8tNnaOKHzm5bqshOHouH/RkBYXHK7Sv66ZNufDxt4x78gcEu3nOaKYnA1ma/Hh7ii0Cb73yrdn55UQBZM92OgUr3uST1eUVb5+SPsHIz+ID2pZvVWxmmhsv33wnEGZPVnWhrshwPyVDs6c9297NeW5QM6ZHMYDpLBqICQmAQbww1G74NKaNWGQ4igvYJnRX
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(82310400014)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2024 06:15:26.3679
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 376b6e57-ae13-42d1-2031-08dc3c127bd1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004B.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR06MB8385
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Mar 2024 06:15:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196585

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

