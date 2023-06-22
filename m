Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1966EB64DC
	for <webhook@archiver.kernel.org>; Thu, 22 Jun 2023 12:00:36 +0000 (UTC)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (EUR04-HE1-obe.outbound.protection.outlook.com [40.107.7.42])
 by mx.groups.io with SMTP id smtpd.web10.9465.1687435231952762364
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Jun 2023 05:00:32 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=hyA0asap;
 spf=pass (domain: siemens.com, ip: 40.107.7.42, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bluB6bWp7KZ0bNHw+9miUT27rJbzCwBuAtea6SS2w5d54wqC6jytN3s/PnK80vfrejstUuV0RUC+e6c8BA0opbuW22HB5Fok9bjgjunWP/FPrTcGDjCA8CpDMi+QsV8CfbOGDD3/ISGKm27atQRFoy2KSBF3N1bIPn5O2fniLOWj5/iBFmpXTnpZXArH8zcMHnkqqtuOpqRoRIF7191YEKePXoUdY0KSSUsa+WKHv9M4ge55acibjWs25cCs9oMN+J3GvE7thtSqDDPO5kbEwi+6RzyIuQ6gMyYKiOGV+fDULJE/Y/Cx4+u1TJ53htXp8tIUJGMC/C7/IgnIGGUf2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zAoRY/b1D0UYK0W6gbaHqK41vc9F8azXOfgylRa77lI=;
 b=eKnrg6Rahm6asMecHj+PQWdVGJvJCn9W1Jevg1sYDY6GrNiLAcA1WGNQP2LbfyTcRAQZVfEJBssV/ON7Z4p0lx7CH6qrzKFnlgf9FNbCSHptLP2J8K2UZDtxiQ1hJfWORSL27bFgoZw4PJ12HXb+xuRTiylHdq6mzPZpiGnyJq7aBISCwG/nXEIyWP344Va+IfOxJGVm4RwBrf0oqwPRdDOlw56SFvjdHLKp2WWX/ITt/8vkz03QYr/kmKTMY8rZj3t9PFSRmtZdmYbW/MOmVoBzC9L15za6qiXezBm/VIJWCebNvkQOT9lAymQ8o+7AT8TXQA9LtYmi6zo8OAb0Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zAoRY/b1D0UYK0W6gbaHqK41vc9F8azXOfgylRa77lI=;
 b=hyA0asap2EXqeDgmDcygH0DLgaBVmXaL0Y25AoAuOagqni/d5HjGCpsaa75erpX082pDvKIevgnmNldT3oc67bUyHg4kIp0wJ9S5wDjiZEaI9maAXHATUbKBKSKqDydlTrcHs8wYe/PZRugTSah1h0QmKOZjLrUZiHMVDkQ+j5W6TB+9gYdYc6W8I4c+t2v7odfXITStgbkoWNRaqkd+NnIiMR3KgkajDym6EUBHCaRHrxJThWIC9gPvKN+jEHdt4uWTEBpr2rYSTjprKcJHxP4F1uM000ZVGWPjJ5hG4PL24cH3mPq/f0lAno1xpTaMJ7k/ODcKNrcvTDahhFfhVw==
Received: from FR3P281CA0106.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a3::16)
 by DB9PR10MB5355.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:337::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Thu, 22 Jun
 2023 12:00:28 +0000
Received: from VE1EUR01FT009.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:a3:cafe::5b) by FR3P281CA0106.outlook.office365.com
 (2603:10a6:d10:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6544.9 via Frontend
 Transport; Thu, 22 Jun 2023 12:00:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT009.mail.protection.outlook.com (10.152.2.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6521.24 via Frontend Transport; Thu, 22 Jun 2023 12:00:27 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 22 Jun 2023 14:00:27 +0200
Received: from md3hr6tc.ad001.siemens.net (163.242.56.90) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 22 Jun 2023 14:00:26 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH v8 0/3] CVE-check handling
Date: Thu, 22 Jun 2023 14:00:00 +0200
Message-ID: <20230622120009.28939-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230519081850.82586-1-andrej.valek@siemens.com>
References: <20230519081850.82586-1-andrej.valek@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [163.242.56.90]
X-ClientProxiedBy: DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT009:EE_|DB9PR10MB5355:EE_
X-MS-Office365-Filtering-Correlation-Id: a16c2a9a-7988-41b0-0244-08db73184504
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	gzK2Zv/HhUpGmLb2AGOQ5W0PeuZN/XH4rCx2ILFScdyhHevL1YqCHApBAXJBmIjoQuZUmv0DOMbq0S78wP1UiPfutPnv7inWjnISGgOytLEVZLmlWond19hC+TjzyeusIBZMzHe8Zm4vzVjkqXSozBjn8m+EDTrLYU/aHxMm4jIDsuVAXcdiMF887SXm6U+jfcaZaLvK6CGGKb29X7NFcXw31B+t/oNb+nY7gGAQAiKrK+5/4Z68SsvwTtsF7t32Pgt3uPaRU7ItcKkzGe25IBGY5cnCdYUXkgjlPs2VS/iw/x5FUAN4fpksjYpLV1Yb7KgrmM1OACWaQwQ6iBCQ4SftaPEsMYCujMEKg+tuf23kK8drixglUVTwc+LukwaAkQllsngYTZAWj6DclDhq1Fv+vtnNTfqTAewhADbmWUTXICNCigkndZZtM6F0mRDqxgjMTlag3X4R4x114TpY41TKXCuEz+hGnj/y/Dkhcy003gid4LsOZrdim+rjs1cJ+qvN9hN5nbvStpMzGi4lQbHrbJ33yoy+LjrSmUQjd9G1o/h+OiezpOumee8jOV+cB8+N0r2vr+L2LYdbZTGqI3iduZNWw2E+2kpNV1A+yA8zCEZ51DSzy0oI3sQ8g4D+8jgIYvkOzUJSUZvM0oOmyr4WwHc7hehnBJYbYqvNeQQLb3S/OCGxgxcnVLuUmq+ua3RiWDA01eUry4n2tXg97zwHpnbMkznqpiobFiJaXzGNBnShXqCaUcZm5vymdzQE1YbKCzyk/wbOnd9FhwNFZA==
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(376002)(396003)(346002)(136003)(451199021)(46966006)(40470700004)(36840700001)(4326008)(478600001)(1076003)(26005)(40460700003)(107886003)(16526019)(40480700001)(186003)(6666004)(36756003)(2906002)(8676002)(41300700001)(70206006)(70586007)(6916009)(316002)(5660300002)(82960400001)(8936002)(44832011)(336012)(82310400005)(66899021)(83380400001)(86362001)(47076005)(81166007)(356005)(36860700001)(2616005)(956004)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2023 12:00:27.6888
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a16c2a9a-7988-41b0-0244-08db73184504
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	VE1EUR01FT009.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5355
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jun 2023 12:00:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183237

After discussion in all parallel threads we proposed following variant whic=
h
covers both expressed requirements to have very small number of different c=
ve
statuses and also very large number of them at the same time.
This is a compromise version which maybe is not ideal but deals with
conflicting responses we got.

Changes compared to version 7:
 - reverted dropped CVE ignores for lz4 and tiff

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
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |  10 +-
 .../libgcrypt/libgcrypt_1.10.2.bb             |   4 +-
 .../recipes-support/libxslt/libxslt_1.1.38.bb |   4 +-
 meta/recipes-support/lz4/lz4_1.9.4.bb         |   3 +-
 meta/recipes-support/sqlite/sqlite3_3.41.2.bb |   7 -
 46 files changed, 392 insertions(+), 373 deletions(-)

--=20
2.41.0


