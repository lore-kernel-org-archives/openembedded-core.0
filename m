Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA846CD129A
	for <webhook@archiver.kernel.org>; Wed, 10 Apr 2024 07:18:46 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.48])
 by mx.groups.io with SMTP id smtpd.web11.161161.1712733516694207046
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Apr 2024 00:18:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=RO09EzhK;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.22.48, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KjROb7ClutT0ZQ5OGao3JMgov9VRvC6vBKEdKKoOcfdmqI9B6mSwBJYXkm4EycQLHx4s7Cpyw/TvJNO/4oHKxTPDIsnWz+tC2UyTD+TfIlWND6OYeRpahgPfctVfL/uY3t7GWBXBVHgYqTFpeuSJs8+FCQVL8ZmOy3n2Of6qKAV0/KJ4gOvrJ5ypxD/JD34884dyh84mx4JOC13ckjcpHFlAyDHmGAdg9CWYvAtv7QA8dY8XpJpLBtwYfPtYZ5O6ROSZPYucDMJHX4a/BtDdFwCPZyU8nPTP1gY0mhgDIXsmYLqUDX3KIu6tnwHQALJeamTAv52V61Q8+1g80Nn7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H4PYRtc1Pmo1fd3+d3N3cII6wIjWZfJqgPt2MolzHK0=;
 b=DHdWizrUatc/egxWhGgjJX7SgtMLmYPmEhRZqdfa8cEmKPXEE8O4vvatfQK95/18ue6ZK2mYr4qGo/lGL3LLbdyi15QcBrBMuu19cjDl54rxAH6ExUmQU+8e80s/+rxkzJ/mf92fqTrCAw6Plxr58yDRezR7n9UCAlsRzHqOv1jY+lFrBFfjHl5x/LRvRquyVBfC6ZczsjOcAegO8OdxvDwLAZgP4F4MymL5w5fnAanT1bV26EH4urGgy4Z7v3MQ1wHM53F3G0npw8XPxSJUl/cI1RdLSwtWyUsHTEHYo6933w1L1bKLopzVjTRahHA8IQ4DefTan4kvVEWC2I/JbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=temperror action=none
 header.from=leica-geosystems.com; dkim=none (message not signed); arc=none
 (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H4PYRtc1Pmo1fd3+d3N3cII6wIjWZfJqgPt2MolzHK0=;
 b=RO09EzhK1coc4SyIBCQo4qhOibTh23eVop+BJv9F3I1WM8/rCNz8PGy8O0CnqMr1Tllj6E9siexQ+7+1AB7qO42KhwGYdQiryNMvgiewGtLpVFzGXPz1LZIumX9g8kSQq4V+Q29Hs2NSX06PMTlFKZS7VnKcxpdRZLjWwBre/6U=
Received: from AM7PR04CA0002.eurprd04.prod.outlook.com (2603:10a6:20b:110::12)
 by PA2PR06MB9613.eurprd06.prod.outlook.com (2603:10a6:102:41a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.10; Wed, 10 Apr
 2024 07:18:34 +0000
Received: from AMS0EPF000001AD.eurprd05.prod.outlook.com
 (2603:10a6:20b:110:cafe::37) by AM7PR04CA0002.outlook.office365.com
 (2603:10a6:20b:110::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.19 via Frontend
 Transport; Wed, 10 Apr 2024 07:18:34 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=temperror action=none header.from=leica-geosystems.com;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of leica-geosystems.com: DNS Timeout)
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001AD.mail.protection.outlook.com (10.167.16.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Wed, 10 Apr 2024 07:18:32 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 10 Apr 2024 09:18:32 +0200
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org,
	alex.kanavin@gmail.com,
	alexandre.belloni@bootlin.com
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v5 0/3] pkg-database and systemd-sysext image
Date: Wed, 10 Apr 2024 09:18:24 +0200
Message-ID: <20240410071827.4099903-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 10 Apr 2024 07:18:32.0468 (UTC) FILETIME=[4B4CBD40:01DA8B17]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AD:EE_|PA2PR06MB9613:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: d8b3d4d1-02ad-4219-f6b5-08dc592e6ded
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AGGvpf2Ni44RBOS/7fIF/4g4c3NWtDFIsM0oSlba7uCnSxh8UUlepaoR4zxvUaarY/+yie2UCaNEEia5X1cOzhQGju1C6DO5RiaV4ZMqMMk50Z12L/IPTfNJJ1lY3QtEJnuiWg2me6tzRGOBwt4LP0AWWImqfbkcLE4Ul0JCV7Ntu3b0gvUOzXVDHG1+Jpo903QKH+RwHLtAIfLCLFq5VIii2HVvOIQ+yCh+yFYPIxwua8f8J1W54OAIHls0ey0LwMavrcuZ/Z9AIwL91xGu9dukGG3c4G6+kxHPo1p+d7v6se29Iekyw2fvuX4KfWhAM9+sy1aGmiJK9wgy1wYjz8QvGDwbrDbcsCq/lNnmhhl0lZnDxCFOGgOEBFmCTxFAf7amh3r3Zk5LU2TX+jqZpD98ZfwRTTj1uAK1AzCs9SXwXhaZ2SwfjO7jzJqC4J+sE84gq0z3zjIkR+YzV+e/3IrTlLlirDla81gSbFcsCFRAe0kerk6VI5UNGYA/dBxx8/ToTS2WlLgPkUW4C6Ni+H7eNVeAE2rXopH5YITogUJHTjCu+utIW8DHIr3/U7K1Xf0R2AJnFqllPhyqASfdBdmi7pzH2VMGwxLmGClG6mQeI0ix+nut6diEoJ6XOmf3BcQm7a4l1lreSynaGqWIC+MCvRc8ifQNad2Gr1RU8xpLKcoS5iYBKGQy2alpxEsP+OEMKv84Y7njeA2W8xgKCWCbr7S+nrC97kHNxuJ6lw7vUPJILScjaPxWzskMHu3/
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(36860700004)(376005)(1800799015)(82310400014);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 07:18:32.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d8b3d4d1-02ad-4219-f6b5-08dc592e6ded
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001AD.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9613
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Apr 2024 07:18:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198080

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

