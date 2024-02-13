Return-Path: <johannes.schneider@leica-geosystems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1A69C4829F
	for <webhook@archiver.kernel.org>; Tue, 13 Feb 2024 10:00:23 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.40])
 by mx.groups.io with SMTP id smtpd.web11.8368.1707818418968145968
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Feb 2024 02:00:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=Y/75JK6X;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 40.107.7.40, mailfrom: johannes.schneider@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD8usFvEEAWI7oZ33bU9jU8cI0tZJ0wi/kVkKKdhgbxi15wpFgy/Fp9W6/C3I9ZTuQCwni2M1sqOLYMbDj2DcyJPlPHO57fRlHES1V8tlNBH8EbIyWNZ/+ie3Cm0W81v7VDyyeBXqtMi9UQ+ZcDDFM5lE66s3u+lyXv2lnt7JScFh5BZ6MygPk2lzvggRyYmAM4RLxNSmJrMNdz4Qum+V6S6H+kDb7mt5/aqGl1uBMnEWiNKBIphunhDkb+l/d57egUlKAn1wpMvpVIh4B4ry2ybioKh5pXT5/2SfckpcWZaRRsQxljnM4P5lPNZzzqXAoeLlYsh98JBABzU9FVwLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1QEbwnAWboU6cMhtvaHrB/cNw2RzRRMwfDxqGl3syOA=;
 b=G9Az75RAAJlwnguUpt7SSlgZGAnVffZVBjU8T485jKUiEXt2pB5ePTMnSSmAdkQ0tc5tGw7DBa8VZbfyHWMueglRH0lCyPEnVyct//sCM9q+jfFlGagzi0BMoRsTEd2Fv+7RqLJgX/YaXlomrB1Tv9Sv6oTRqeF94tLqMVUhTm0y9aXInXTWFJcGZn+7hjomC0uJtDT6sQkWS4C4juUOAeWF12ZUP1pLz0DmP9/0HvW8ilFU0jo0lCsg59BaCn2wncb5WsbnP1ck2O02Kpb87db6LYdJuFXFPY/Jrx3BfRXpDCRO1QuxdgmistsYHTmURn8twdRIcyAZ3f7rgm+6Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.94) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1QEbwnAWboU6cMhtvaHrB/cNw2RzRRMwfDxqGl3syOA=;
 b=Y/75JK6XwacKoyxT7NdFRGnQnydTe9oORbHCwN2ufYpf/VUcUJMB+jSrEpqejGsSP4xE1rsn3QKM0pjwXoowpFMKpB6IAblJjxMwMkm5mkuqiqfdp7l8RvUf6fnSr0PMV/CnFx0VKa6asMrD+0NljW0Y8gBTg1l6V22v29vGSgA=
Received: from AM6P191CA0073.EURP191.PROD.OUTLOOK.COM (2603:10a6:209:8a::14)
 by PA4PR06MB7295.eurprd06.prod.outlook.com (2603:10a6:102:f8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.35; Tue, 13 Feb
 2024 10:00:15 +0000
Received: from AM4PEPF00025F95.EURPRD83.prod.outlook.com
 (2603:10a6:209:8a:cafe::4) by AM6P191CA0073.outlook.office365.com
 (2603:10a6:209:8a::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.39 via Frontend
 Transport; Tue, 13 Feb 2024 10:00:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.94)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.94 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.94; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.94) by
 AM4PEPF00025F95.mail.protection.outlook.com (10.167.16.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7316.0 via Frontend Transport; Tue, 13 Feb 2024 10:00:15 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.60.34.116]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 13 Feb 2024 11:00:15 +0100
From: Johannes Schneider <johannes.schneider@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: Johannes Schneider <johannes.schneider@leica-geosystems.com>
Subject: [PATCH v1 0/3] pkg-database and systemd-sysext image
Date: Tue, 13 Feb 2024 11:00:08 +0100
Message-ID: <20240213100012.252237-1-johannes.schneider@leica-geosystems.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-OriginalArrivalTime: 13 Feb 2024 10:00:15.0144 (UTC) FILETIME=[70FFDA80:01DA5E63]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F95:EE_|PA4PR06MB7295:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: c0ac4f41-ae88-4c85-84f5-08dc2c7a9396
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	XBPyKLQhxQHD+eud0B7GL3KZh9T5DbAsajzr2Lo+A2Olo+u54i2IWyVryNuwDLLhDt6LGHhDTAEtGfLie5FuD93rJ0TYV95Nu1gVXIVToyPAEDzmykiQ5sbZs2qnuWREM2TsDlDjVBUQbqiQV5TeWh8aZy928UicQ2joUbHhrpVS4TGfPyOrCmBlmapGGGuPHMKS8BNAjtEkt7cKo1ltGcaVyR90/oN7ABO2EN8HWfgve0kAEXL6L4gK/lCvBCXMvSrR3oC21NjuU/JV4fRv0V1f5ASxxGDGYsdhT8Kar7ZS4yUf1aMTPuH5W+JoQZemOoNct9zWZH/IYvBVMEAarxNmEKqwfc/5KwHHl/lWRq3360Q4pOtq7yXCFy835oiT1x1QVLtfg/FhQz6Pv+KdVv/8vtym2nN32yxdxgW4YC795ETGcNbv47IsposQGqZq/smdKNxM2QmFHbBQmddnQDouUtCpOo16l26JeMt5veDLUL0c4OONolNCneeHt8XbBO+DTxGMQj/KKS93PBF9sHTNDF5u9HYMu6FAa1FQwenhTn0kKt8VzKbRySopYwENmVyzs1GTZpVppyrNPmR66AVQ0QZ3LotqQAPBJ2cmqXA=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.94;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom50.leica-geosystems.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(376002)(39860400002)(136003)(346002)(230922051799003)(82310400011)(186009)(1800799012)(64100799003)(451199024)(46966006)(36840700001)(40470700004)(478600001)(41300700001)(8676002)(44832011)(4326008)(8936002)(2906002)(5660300002)(6916009)(6666004)(86362001)(70206006)(316002)(70586007)(2616005)(83380400001)(336012)(81166007)(356005)(107886003)(1076003)(82740400003)(26005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2024 10:00:15.3202
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0ac4f41-ae88-4c85-84f5-08dc2c7a9396
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.94];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F95.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR06MB7295
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Feb 2024 10:00:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/195380

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

changes with V2:
        rebase from 'kirkstone' onto 'master'

