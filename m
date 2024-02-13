Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFA6C4829A
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 08:57:13 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.84])
 by mx.groups.io with SMTP id smtpd.web11.7644.1707814632367669003
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 00:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=VGyg2LLc;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.8.84, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k4dZ4e2pstXaZ1oYFVzd2JCZsq5hWsEtnhFiQP0xvSjWPa7G6Md76CYk542Fw9HdsgqDq3EGDMXvgyk/GKaj2T4/PAtVrHcrXPx6jO9kLv2H6zz2KlLJWzBe93Fw282aVlSIdQqGiz+9//bZEC6MZ0/NT5021zNhD7QS3Nni136qwG2LLrC3SCbM2mWiWpnIsVIgUIUNcxinWYxF4I7gyC9/z8hp5bbbhY246KtQv8/mI8Cid8bD2Y+riJv3c1BvDvggmRlR99zLXWtlSlrlKi0xgXkb/1+V6qpc6+yFk/ldv0d6BHUDTy2HGbGk2316HYV+Hlq70EDu2o9n+plEdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Err5UJw6uRJTqMwX8a5bqux1w7KY851YfP5fa523gHs=;
 b=FPhDW7LDd0Ytj6zSYXipq+7PnOHU+Ej4axStAvDFro8fWCEHmn7regYHqGHnQYVghPia/Vorruy48Qy+u7MIeWkMI8D0OtINucu9mPJfiiXtOyO3arMuVNBfDuJsAkMQQyE+0w9mFQigeaBYvJt1JWWOEf/qJJhMlA55bEt95sY+vT3TCrEfrp0+2DeinMd2ZkeXHDRxmJwmsjcaUCLBiu+urK/0StDYTnUlk2Y/Nwxmsm8+WYPj8a6t86u4MHgrL5ypoUZrEKpiNw1cxdtwBb5mBF7hrX0fqFl19y5co0TiF2TF5vabzwDxl8lvHJN/YeVR4JTeILwieGDSk48FJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Err5UJw6uRJTqMwX8a5bqux1w7KY851YfP5fa523gHs=;
 b=VGyg2LLcqPBPxOpJtztFdxLLhDcbKph0sCh4XM3HZ0qeEoPKyvZqiGPERETWl23atrZS/QEJfMYPsryBN11Ghzndzpj8oD8ZlL2mzKtmEJTmgUW6UYXmRPWY96DChwgETzoYtb4PcMDGjbwHxVZ2afs3imL+E0XngU23wzER8/8=
Received: from AM0PR02CA0015.eurprd02.prod.outlook.com (2603:10a6:208:3e::28)
 by VI1PR06MB8849.eurprd06.prod.outlook.com (2603:10a6:800:1d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.37; Tue, 13 Feb
 2024 08:57:08 +0000
Received: from AMS0EPF000001A7.eurprd05.prod.outlook.com
 (2603:10a6:208:3e:cafe::99) by AM0PR02CA0015.outlook.office365.com
 (2603:10a6:208:3e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.38 via Frontend
 Transport; Tue, 13 Feb 2024 08:57:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AMS0EPF000001A7.mail.protection.outlook.com (10.167.16.234) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7292.25 via Frontend Transport; Tue, 13 Feb 2024 08:57:08 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 09:57:08 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 0/3] pkg-database and systemd-sysext image
Date: Tue, 13 Feb 2024 09:56:54 +0100
Message-ID: <20240213085658.170917-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 08:57:08.0499 (UTC) FILETIME=[9FFBAE30:01DA5E5A]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A7:EE_|VI1PR06MB8849:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 103eccb7-5b7d-46b4-370e-08dc2c71c292
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	+x6D1uedhDhYMLB5503D2DmNf70+jFooS+n4hSqiR7peLXAkMLq74e8Pwo+YjyurDLEzrVoQrN3q1hkz0JZMDkhWcViV0wKfuh8Mb1musQRiZ8nowPqGMLSujizoVoF9FRtmTKXvboO/kJtXJFRzSOGpDzenMBd+0WBnZPuc0hxtm3h7nuusdAEYEW/cNusyyU7MZ4zLiAI77w26YaV9V/XaYONNfV0GYWtrzAZlpakNv2dnkzLn49ZL/0J4pzbZ9RVkGo9XZwqPl2wj+4gBQ95+4XSq7sNWs4xE7v657NEikrPTOoOnC0t+S1u+1TmlHRW9eOIrEXfbc6iRtLF3oGZuxS4OUmWg/6zDbZNKnHdkru7zB9s0OsdTIlCIHQoClJsPiLdixMNCTzZfReCiFjynD4bJkm25Zrke5NARKyeDzFDaeWLYWAfe35TNsjxI6EFbhAeXGvqgbhO5oCH8BYTpPEeL/ytrNMUXx+i2UI3gV3m8bR8bjXTS3IdG4AIC9AvT1ApdLTLJL/y0DFJQrFzwqgS5+wB8UNA8vszOeC5oop1pqc2e//WzosBCJ4bwT6KGcEvIqZixdBNKJrmobv1E+e1nd7eSFAtxF5FAaqU=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(136003)(396003)(346002)(376002)(230922051799003)(1800799012)(186009)(82310400011)(451199024)(64100799003)(36840700001)(40470700004)(46966006)(36756003)(70206006)(5660300002)(107886003)(2616005)(1076003)(478600001)(26005)(336012)(83380400001)(70586007)(8676002)(6916009)(8936002)(4326008)(316002)(6666004)(86362001)(41300700001)(82740400003)(356005)(81166007)(44832011)(2906002);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 08:57:08.6744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 103eccb7-5b7d-46b4-370e-08dc2c71c292
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS0EPF000001A7.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR06MB8849
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 08:57:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195372

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
  IMAGE_BASE_PKGDB =3D "some-core-image-${MACHINE}"
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

