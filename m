Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B16DEB64DA
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 06:59:55 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.53])
 by mx.groups.io with SMTP id smtpd.web10.5917.1687417186089373877
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jun 2023 23:59:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=L4l5pzgx;
 spf=pass (domain: siemens.com, ip: 40.107.22.53, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SUS2X5URRxkiYFaZpT067CjIvfdBvcfQDXbX0I7laDCAwWJoc/QQg6exNypm3oMyTnyt0ZKzRlXr1tQh5zJEc5FWRTVd4sHOF7lvOT9AiAWhQlKf+XfynFkQdQSDNLY2ROPv9odEb5BEzegC5O2z/o2xfxJfDNXRLRAS6P2SefL1rojbyK+fLij+VMA7m91fbwVXtHiln9ABfeu3csxku6SF99dbLE67WLBgZ6KXQQDfVLvA23I4gbCTKdwXzquM5riSBiYsQt/l4AKDhRxB5VMwbhFYo5PEQkeax13dbP/HguIJOxz80E+g3Lft+M7trvbRDiv91tECzHLEiP70/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c+Ozm31Fd5yeGS22xmGALbQ5jVcXtVoYqStKnVzdUOo=;
 b=CBbi6/yQhNvnVoJ6AargjR01NId6ZysJEpfsK+yL1HTK4y/uEGpM6K7ZObtHsflt+aNdSozPuHSZ/8Kz/yPqmbwEUuP/dIHGf7mgjs+j8ZnSM2uHRSciZ3xlNEAbOtQAmNS1wbD2u/ai+osXr+tuYgG8icRJnyQMtAuX6gg3k/DNQBKNTX1SdsVo2NOGz65Aw1HDz33HCjI/1RS8ArloB6gtTyeQDctkS8dz5iGDXY2ikg0NwfpfxkBdQXlLtuZYMRxLP+rBB9erS3LtYRY9PkZzja639VDy3u+tUEjY6IxsHNDA4s1XmxVl2KAcqOGTvUvH5KjwRKLXFdtE7dA8uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.74) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+Ozm31Fd5yeGS22xmGALbQ5jVcXtVoYqStKnVzdUOo=;
 b=L4l5pzgxQY+aNUDI7ugreYF6navWqj0FcJAWnNi1CUHjWtGatfZY8hlbJclp9OfZB761Y/Z1ZaO4WYj1eyTgrWMRoL33TxYbahjk2pnIflJ440+BT92rJYyn2ngyVYaClInHHagIu4ojFtoI52T1NE1f3VuG6nsl/t2AMHB3pyHFtE2CMTWWf92ago8O70RjurxW/T+GSqgpmEC4FtvP3NelnbF+zmJsff6tl3m7TWElUQz5OeBmp+TsOySfQ4hLe3VvHSewfFQ1iLietIyH4IjuNgyDqgD5dRhtUwuLeSBP+qiTibklIxHZyZW/sdaCReIedC/c2/h25UWEGC1vmg==
Received: from DUZPR01CA0210.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::24) by AS8PR10MB6866.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:5b7::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Thu, 22 Jun
 2023 06:59:43 +0000
Received: from DB5EUR01FT004.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::2) by DUZPR01CA0210.outlook.office365.com
 (2603:10a6:10:4b6::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23 via Frontend
 Transport; Thu, 22 Jun 2023 06:59:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.74)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.74 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.74; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.74) by
 DB5EUR01FT004.mail.protection.outlook.com (10.152.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 06:59:42 +0000
Received: from DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) by
 DEMCHDC8VQA.ad011.siemens.net (194.138.21.74) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 08:59:40 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.106.9) by
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 08:59:40 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v7 0/3] CVE-check handling
Date: Thu, 22 Jun 2023 08:59:02 +0200
Message-ID: <20230622065914.37448-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.106.9]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WBA.ad011.siemens.net (139.25.226.105)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT004:EE_|AS8PR10MB6866:EE_
X-MS-Office365-Filtering-Correlation-Id: 102a3eeb-830e-4e88-927a-08db72ee416b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	tHOUrJoPnCNOgX9bRKH7mK4AmHCqdOvg5bQke3d8NQyG9LrKPpt4P6mnE3+u8N/4IsUn7NN0+BaChlYZN9u4kIVY9FcDs0ioN5rHq6xIYzXmd3qaOUXEtI7yfAVTnhjLs35FIErHn4hLTph3282StojRzTO/UyMss4eQNA8WAMrmqr1QybPLG56h9d7Nvk7RwBhkstggE6dwdKFil83qP64qL06ue9fCADObMK/4JlBSo7mBRcLERRAZyF9DGDtXy479cEOJifPjsSfn0Bs86DBHxmr8T5DybLHDlaqFQUyEzyue/5oqOlagivQX33iCKyUHnwvkNpDVEfoh2HNIwnR8WfEQjlScnXTdulIJ6bUJU5aHTHHX5CVXdznwN7h4hittnzPBRjhO57OEbyPduBduy8wmRhpj+b31mIPxzHi5lM9HjiyokqpY7tQedlMQ9j2MjwNQmqGCML1xfSaeJ3gcib7v6oJ8SKOilOtvfMSWqDZtoRq964F8bgK9s9o6dt5XIGAUZ6koRA7W3RQryquqt++a+rsixvFX1llSeP37bo1qnlJa+8poHZdLz75yAHEwF+GV2ctSqpMQpAey2UUSmF7aYXJNGHw/w6f1nHJMWFF/WxhB6b29uK36T5QAz09H3aP8COEU9F1C7WxMA40Bkw7Jj6j00jXCPzFG+eekTALkBY/Bfr7o0VBcVaSf2VAaxQIanDRG6MEGnDFQRjjPjw1dQ4MHNV7B29LJnc4=
X-Forefront-Antispam-Report: 
	CIP:194.138.21.74;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:hybrid.siemens.com;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(451199021)(40470700004)(36840700001)(46966006)(7596003)(7636003)(356005)(107886003)(66899021)(82960400001)(82740400003)(40460700003)(2906002)(478600001)(36860700001)(40480700001)(6666004)(316002)(47076005)(83380400001)(2616005)(956004)(70206006)(82310400005)(5660300002)(336012)(41300700001)(44832011)(70586007)(6916009)(4326008)(1076003)(26005)(86362001)(8676002)(8936002)(36756003)(16526019)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 06:59:42.7471
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 102a3eeb-830e-4e88-927a-08db72ee416b
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.74];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT004.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6866
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 06:59:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183224

After discussion in all parallel threads we proposed following variant whic=
h
covers both expressed requirements to have very small number of different c=
ve
statuses and also very large number of them at the same time.
This is a compromise version which maybe is not ideal but deals with
conflicting responses we got.

Changes compare to version 6:
 - added conversion from CVE_CHECK_IGNORE to CVE_STATUS
 - added comments for all statuses
 - dropped "not-affected" status
  - conversion showed that it is not very usefull
 - added "disputed" status

Documentation will be updated in separated repository.

 meta/classes/cve-check.bbclass                |  99 ++++-
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
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |   9 +-
 .../libgcrypt/libgcrypt_1.10.2.bb             |   4 +-
 .../recipes-support/libxslt/libxslt_1.1.38.bb |   4 +-
 meta/recipes-support/lz4/lz4_1.9.4.bb         |   3 -
 meta/recipes-support/sqlite/sqlite3_3.41.2.bb |   7 -
 46 files changed, 390 insertions(+), 374 deletions(-)

--=20
2.41.0


