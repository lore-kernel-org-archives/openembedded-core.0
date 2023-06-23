Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B982BC001B0
	for <webhook@archiver.kernel.org>; Fri, 23 Jun 2023 11:16:24 +0000 (UTC)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (EUR02-VI1-obe.outbound.protection.outlook.com [40.107.241.58])
 by mx.groups.io with SMTP id smtpd.web10.39470.1687518976694237201
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Jun 2023 04:16:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=PiDQjfQd;
 spf=pass (domain: siemens.com, ip: 40.107.241.58, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HlIUR3fath6FmnebxXCwDVBTHC7QUPDmO4gpq0KN9CBAX5vM4vRhUdXPb4xmSE0hFRcSdRw1aF0ukx1O5qH8gAkaJ8CuptETTgzkMUvSW33vEg3aSKaUCXNRJzHOGvQa0a4dPiWa2TTTE5l8ZZrIdgIbNBm0+Iw3tBqEY98cqdIMJhZXy28/khrVcv+zVMZKUU1pxlQhCqXd4bhjw18yVpzCgkWyf2avclC+z06nCfIhjDoiiuk8/D15ZjJnEp2F1c8aojCE6ZjXf0F9ouiTEWnph9oVTpadO7Ufw6cP9hfPOJm9svBNB4hx7PdbjmAW3RmKEZBn4rOhh4DxhLDtzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PfTC8MKebxgCIb4nRwnjoRvcQ8HuPrSVMGmmMPjfI0Q=;
 b=ZPsUVMQO3oa9AX3QJxtYbBIhhvBE13xrdlHXPgcciz/LUqrgmKTQ2h4i3z6ctKCP6SzJoe+yywpc9jTQcru6vUzEJp3vDLIowlc0OMi2gOnMfjHYuXcBpaUAWqTf89Q+Zn3H8BU/LEbFMhgF4zkZwlYk0xbOl60EuTKNVn36dgumSFhd1DoLNr+xad3DD/xFpcP8ItackoylSox9rGh0gT2TP4qyDA605fVu3xTbSe/rtZ22OPVn4NbFdc9Vv1OAffbOS8Iq0v8V3JxHAAw2DGnnMCUClwgLAcVGFkHRIh1Tz8SFdsuaIAhjFr4d7aQjHEJU5GQqlqH/lfdm0rWZoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.75) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PfTC8MKebxgCIb4nRwnjoRvcQ8HuPrSVMGmmMPjfI0Q=;
 b=PiDQjfQdyKvI4irext+TAwGgUjM8YjkrLpMV+6zTue0QcewP0Pvx01qfxm68sZOIQw0E2/KHrCjjgilQfLcOrJN7mNZtn0h3AwhsDFiISxC/aBQaCOdJ+mWQL+DbMj35A0WDIzfRsosqLcZheooGx46xZ2WsQmcXDouQXpCIVn1ZJsOwBZH/QQkmli7b3GdBlqd3uHWQIH3mruDoIOhKSyMen02lEnaWo0O8tuJJPMnS21081Ai/KMu73kmhzDqEUxh9DmlrBvjjDrlOzJgN4aDpUTSQsoSbU3Ny3DVeEyh0FfOWIF+HLWg5UWFE5Kmd3wTo8WZ3SF0VgD5dU2MpQQ==
Received: from DB7PR03CA0106.eurprd03.prod.outlook.com (2603:10a6:10:72::47)
 by GV2PR10MB6138.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:150:ae::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 11:16:13 +0000
Received: from DB5EUR01FT093.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::6a) by DB7PR03CA0106.outlook.office365.com
 (2603:10a6:10:72::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26 via Frontend
 Transport; Fri, 23 Jun 2023 11:16:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.75)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.75 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.75; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.75) by
 DB5EUR01FT093.mail.protection.outlook.com (10.152.4.174) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6544.10 via Frontend Transport; Fri, 23 Jun 2023 11:16:13 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VRA.ad011.siemens.net (194.138.21.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Fri, 23 Jun 2023 13:16:09 +0200
Received: from md3hr6tc.ad001.com (167.87.2.72) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Fri, 23 Jun 2023 13:16:09 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: <luca.ceresoli@bootlin.com>, Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v9 0/3] CVE-check handling
Date: Fri, 23 Jun 2023 13:14:55 +0200
Message-ID: <20230623111459.97933-2-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [167.87.2.72]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT093:EE_|GV2PR10MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: cf2a9e47-9c75-48e4-6205-08db73db4127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	y2LScpvznb2q5uMqZ3W3S5zlGLdguW6ZxS9itdvewWvtoOLmVHNihlL/lUZGFgS2FwsE2BU+Pz67CaG1m/WYVzRXyaT1kZnrkA3sz9d0/I5FosH9StP/MHjkRenWI5fIpgIQ8Y5VhR/BwIpqnfjkMndyZgoQRBv0S0dSFAGFrSg5kz68FUpQa5h2sRmPvXxmIqlL1rO2q93vl60/8kvvbWsVA6/uj8wLaedW7UqWqSSudA1lHI2Y9vyNHpxQCd5RZPW48ActlWQ7GpnU9TuiYmbr4nekwY7OQ9583f6P0hCwK9V8dP3TanaeJC6xXfX9Xy3lRRDKASQpHnFI4ZNsS1Df1DLTLYRJPLwZofdSwnJV6hs/RAam4JFK4bg+oLtpwq94EnHG6XMtsQj3IqEJtSj8KtuGJ3f597PDNPxYukPi+010x8ux9CahpRh4QwBQECcZdALdSZuUi1UFAsCb1SKPnTBGfCPEf5WvM+QqCY6Cqgpx/gLl0BRbej8J8cbZEvor9Ohs9nCSIBO69p/8pf5cMpOgRCc1uxjCqk8+7rVqI273VURNodnm/w4kEGV0EzvCghGUptglvw+so4z7RWu5XTLRlPIa+9irNXebXTOgdzJAJPkXh1l6S8n9UdoJ8V2ScdkBCoDJ1p+TtGD5TqCm2DlO2mmDRuP8/VuHwAqqQfU7sezBryVNeCI/PiqnBbGWXA6btwUT//PZj8WwCuhcAePnCgpNirJ06GHbLGCNp3VbwzyUJLiP20hXYryyzQSJuT32+xVxldtPpHzYUA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.75;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(346002)(39860400002)(376002)(396003)(136003)(451199021)(46966006)(40470700004)(36840700001)(8936002)(40480700001)(2906002)(107886003)(2616005)(956004)(54906003)(70206006)(6916009)(36860700001)(336012)(70586007)(4326008)(86362001)(47076005)(83380400001)(316002)(36756003)(41300700001)(8676002)(40460700003)(16526019)(82740400003)(5660300002)(186003)(82960400001)(6666004)(26005)(44832011)(1076003)(66899021)(82310400005)(478600001)(356005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 11:16:13.0564
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cf2a9e47-9c75-48e4-6205-08db73db4127
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.75];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT093.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB6138
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 23 Jun 2023 11:16:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183321

After discussion in all parallel threads we proposed following variant whic=
h
covers both expressed requirements to have very small number of different c=
ve
statuses and also very large number of them at the same time.
This is a compromise version which maybe is not ideal but deals with
conflicting responses we got.

Changes compared to version 8:
 - moved CVE_CHECK_STATUSMAP into separated cve-check-map.conf file
  - this will allow to use it without inheriting the cve-check class, like =
for SPDX

Documentation will be updated in separated repository.

 meta/classes/cve-check.bbclass                |  81 +++-
 meta/conf/bitbake.conf                        |   1 +
 meta/conf/cve-check-map.conf                  |  28 ++
 .../distro/include/cve-extra-exclusions.inc   | 371 +++++++++---------
 meta/lib/oe/cve_check.py                      |  25 ++
 meta/lib/oeqa/selftest/cases/cve_check.py     |  26 +-
 meta/recipes-bsp/grub/grub2.inc               |   6 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   3 +-
 .../recipes-connectivity/bind/bind_9.18.15.bb |   2 +-
 .../bluez5/bluez5_5.66.bb                     |   4 +-
 .../openssh/openssh_9.3p1.bb                  |   9 +-
 .../openssl/openssl_3.1.1.bb                  |   3 +-
 meta/recipes-core/coreutils/coreutils_9.3.bb  |   4 +-
 meta/recipes-core/glibc/glibc_2.37.bb         |  17 +-
 meta/recipes-core/libxml/libxml2_2.10.4.bb    |   4 -
 meta/recipes-core/systemd/systemd_253.3.bb    |   3 -
 meta/recipes-devtools/cmake/cmake.inc         |   4 +-
 meta/recipes-devtools/flex/flex_2.6.4.bb      |   6 +-
 meta/recipes-devtools/gcc/gcc-13.1.inc        |   3 +-
 meta/recipes-devtools/git/git_2.39.3.bb       |   7 -
 meta/recipes-devtools/jquery/jquery_3.6.3.bb  |   5 +-
 meta/recipes-devtools/ninja/ninja_1.11.1.bb   |   3 +-
 .../recipes-devtools/python/python3_3.11.3.bb |  13 +-
 meta/recipes-devtools/qemu/qemu.inc           |  13 +-
 meta/recipes-devtools/rsync/rsync_3.2.7.bb    |   3 -
 meta/recipes-devtools/tcltk/tcl_8.6.13.bb     |   4 -
 meta/recipes-extended/cpio/cpio_2.14.bb       |   3 +-
 meta/recipes-extended/cups/cups.inc           |  17 +-
 .../ghostscript/ghostscript_10.01.1.bb        |   3 +-
 .../iputils/iputils_20221126.bb               |   5 +-
 .../libtirpc/libtirpc_1.3.3.bb                |   3 +-
 .../logrotate/logrotate_3.21.0.bb             |   5 +-
 meta/recipes-extended/procps/procps_4.0.3.bb  |   4 -
 meta/recipes-extended/shadow/shadow_4.13.bb   |   7 +-
 meta/recipes-extended/unzip/unzip_6.0.bb      |   3 +-
 .../xinetd/xinetd_2.3.15.4.bb                 |   2 +-
 meta/recipes-extended/zip/zip_3.0.bb          |   7 +-
 .../libnotify/libnotify_0.8.2.bb              |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.56.0.bb  |   3 +-
 meta/recipes-graphics/builder/builder_0.1.bb  |   3 +-
 .../xorg-xserver/xserver-xorg.inc             |  19 +-
 .../linux/cve-exclusion_6.1.inc               |  11 +-
 .../libpng/libpng_1.6.39.bb                   |   3 +-
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  10 +-
 .../libgcrypt/libgcrypt_1.10.2.bb             |   4 +-
 .../recipes-support/libxslt/libxslt_1.1.38.bb |   4 +-
 meta/recipes-support/lz4/lz4_1.9.4.bb         |   3 +-
 meta/recipes-support/sqlite/sqlite3_3.41.2.bb |   7 -
 48 files changed, 403 insertions(+), 373 deletions(-)
 create mode 100644 meta/conf/cve-check-map.conf

--=20
2.41.0


