Return-Path: <andrej.valek@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 223D8C77B7E
	for <webhook@archiver.kernel.org>; Thu, 25 May 2023 08:44:08 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.77])
 by mx.groups.io with SMTP id smtpd.web11.7333.1685004241132298759
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 May 2023 01:44:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@siemens.com header.s=selector2 header.b=R8EZqt5J;
 spf=pass (domain: siemens.com, ip: 40.107.8.77, mailfrom: andrej.valek@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TMIoUBuodwIQTJG0+Ckjdpvz5N5Nps2EuzzNay1DhCKVT0wDMvUNmHEhLjEPP87mzdbIQ97vBRwRL5YCfdk1yYjWoYkiLAABc/eEq1HKc7AQMjab1FVH8SL+u+lIgSSLTOIw05vGgs3hT2UX5iFpPbd/gYWZk+pTpTevo6RA3+amKVOL9fn24mWFXDB1pVwYi7oEAkTszqYIIYWyIqZLPZduy94dlMcxHp7Uw7RQWt5Z3zfpHKIjjWtg+gS6Eg+1p2jyed/iea93a7YRVnRp3dyWSHGIPd/Pbuti3qMmEdGNGZ1+PD0YXEM8n+9qidSOXLdXEAE4B3opn+p+Ij4p9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=02ERdncNGBwKypylQRirKLFJX1HoqpsVPoUFYduUPGY=;
 b=gOGszVs43YONlJFoqBzGxhTAe2XQpP0mEygCT36OCBZLsK1mtX+c9t3Kh6atHsCRDcVnlK745ixlyFsYWUb6+2k+m/SB16L5BebHWi1GVYDB8AC11Klj/+pjjajsviTCJ/RBd1V/4PWa6P4eL02CsuJhn0MSKFkMEwY1Y9e98PR7IFqHlOzqt9+oqPPwhyZyyui+uMG7W4aNctrzL3ObM9q9dRA91zcoEJ8ECJAjX7Av7ea8ne679KmemWmPT8cncfP7bqN8hUUIqF2xzicDFmWWsEz7kapdRAQsVJS6FlA4Yy1/Ql7UYEKOJnn46Mv8L5iKF9nrQNWKa/cnWDnQPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=siemens.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=siemens.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=02ERdncNGBwKypylQRirKLFJX1HoqpsVPoUFYduUPGY=;
 b=R8EZqt5JqqNNls28ltWhgkoUEIVS3E9QTRAcKUfR7IFCmP3fLT88ARX0TdifubWrk5UqXwHMv0sSaf9fs8OqWRjTQB7dv2XN5ReJrskaYjWX3rBtrCAqAKcSiGLL5NEDnQkHZVv+QTZUb2zqV260mUsnVMnxjdiol0zZHHXRqoxTDkboATx1mUR5eHze5zkt1hVhoBKongYTA5fS8n0pVrx+VsDdt3YvaKMxFUZ/bYhfJD12MDWAe2UBMfdpMOyS1arqPzY8sm8+IeQewDbXjwa36qKcG7Nav0f/vWdonXU2SZ67uMZK44wQxSs7p3QgwSI/7JSvuNl8rkuzdHWCHw==
Received: from DB3PR06CA0001.eurprd06.prod.outlook.com (2603:10a6:8:1::14) by
 DU0PR10MB5220.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:348::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.16; Thu, 25 May 2023 08:43:57 +0000
Received: from DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::26) by DB3PR06CA0001.outlook.office365.com
 (2603:10a6:8:1::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.15 via Frontend
 Transport; Thu, 25 May 2023 08:43:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 DB5EUR01FT043.mail.protection.outlook.com (10.152.5.103) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6433.15 via Frontend Transport; Thu, 25 May 2023 08:43:57 +0000
Received: from DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 25 May 2023 10:43:56 +0200
Received: from md3hr6tc.ad001.siemens.net (139.22.37.138) by
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Thu, 25 May 2023 10:43:56 +0200
From: Andrej Valek <andrej.valek@siemens.com>
To: <openembedded-core@lists.openembedded.org>
CC: Andrej Valek <andrej.valek@siemens.com>
Subject: [OE-core][PATCH] busybox: 1.36.0 -> 1.36.1
Date: Thu, 25 May 2023 10:43:28 +0200
Message-ID: <20230525084328.77920-1-andrej.valek@siemens.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Originating-IP: [139.22.37.138]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC8WAA.ad011.siemens.net (139.25.226.104)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5EUR01FT043:EE_|DU0PR10MB5220:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e6fe6ac-b1e9-4ad4-350e-08db5cfc2dd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	9eWgP+GIby2IOXj1GHC6lOh4UZ+Wa3hYSVBVPANA+RUm9J+M4+Tu4Zis/aqXJY926+sy0oyJbyHONhrMgNQzTYcSzhnmtp3GuLIu1gAoXf6hiLynF//hPLh5SmDbTIjFJzhZVbM5RuiSnbvzTjfp/IUS6AJ7qUO3JhxyNjFjKQvSswOSOEyVQUpFyvXtthzitZMn52aHQ0TAYmZsEG3Ez6w15VcMz6QCYjyCxoubHrqOC4Q7nIcsS81UX4H9/jAYUA9mf332Xy0QoFnz4cE87dZvBKYYIqbM2JwWlBfK2BtcrDemJHQTB28Qe4sjmzcDlO52XleHhcgxttv8lAL8s/VcTdVBIO2orCtFl2TPJa/LDMLBNhGlBPoI7enD1y7rPvESwilJOu8YQ+YuoaiX9UDBQPz0LXh7u7b2SSunQMOSbnIG6LFVE9bWKIk40NWykSFYeo5BCe6ebQL3HIg5qKwxPshP5A/VovGwH3EuRJLzMGi3ebzdzFgUv1R4++7ZAb2juQFr6heqr+yhtcw4KX/ns/YgunuEW0+zfo5NklA5w8f28+qOHjpnqlDSEF752GhejlOvj3fOoIczzVHSOBoiLi/n7liNthgtbAsdseqL4EhGPGMwCDlPTeK5t553oELaLMBcN+pzuQH8FHoG9mvAwRg9BS4Yo7uluGli2eJBuekA3fF0L7WGHjyeloB7Pd88APH0c/rC2StzJ7TS0FSaF44EkPbvACEIyoG4j3q0gpd1iCN+HQzNdgbpGTbr
X-Forefront-Antispam-Report: 
	CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(396003)(136003)(376002)(346002)(451199021)(40470700004)(46966006)(36840700001)(70206006)(70586007)(5660300002)(4326008)(6916009)(8676002)(8936002)(966005)(26005)(1076003)(44832011)(107886003)(316002)(6666004)(41300700001)(478600001)(16526019)(186003)(47076005)(83380400001)(40460700003)(956004)(2616005)(2906002)(336012)(40480700001)(36860700001)(81166007)(82740400003)(356005)(82960400001)(86362001)(82310400005)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 May 2023 08:43:57.2606
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e6fe6ac-b1e9-4ad4-350e-08db5cfc2dd3
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DB5EUR01FT043.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB5220
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 25 May 2023 08:44:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181704

- regresion has been fixed, re-enable SHA*HWACCEL on x86
  - 8d198665a0d09c3f22f3a12234809f46b1c2b04a

Signed-off-by: Andrej Valek <andrej.valek@siemens.com>
---
 .../{busybox-inittab_1.36.0.bb =3D> busybox-inittab_1.36.1.bb}  | 0
 meta/recipes-core/busybox/busybox/sha_accel.cfg               | 2 --
 .../busybox/{busybox_1.36.0.bb =3D> busybox_1.36.1.bb}          | 4 +---
 3 files changed, 1 insertion(+), 5 deletions(-)
 rename meta/recipes-core/busybox/{busybox-inittab_1.36.0.bb =3D> busybox-i=
nittab_1.36.1.bb} (100%)
 delete mode 100644 meta/recipes-core/busybox/busybox/sha_accel.cfg
 rename meta/recipes-core/busybox/{busybox_1.36.0.bb =3D> busybox_1.36.1.bb=
} (91%)

diff --git a/meta/recipes-core/busybox/busybox-inittab_1.36.0.bb b/meta/rec=
ipes-core/busybox/busybox-inittab_1.36.1.bb
similarity index 100%
rename from meta/recipes-core/busybox/busybox-inittab_1.36.0.bb
rename to meta/recipes-core/busybox/busybox-inittab_1.36.1.bb
diff --git a/meta/recipes-core/busybox/busybox/sha_accel.cfg b/meta/recipes=
-core/busybox/busybox/sha_accel.cfg
deleted file mode 100644
index 8900305a11..0000000000
--- a/meta/recipes-core/busybox/busybox/sha_accel.cfg
+++ /dev/null
@@ -1,2 +0,0 @@
-# CONFIG_SHA256_HWACCEL is not set
-# CONFIG_SHA1_HWACCEL is not set
diff --git a/meta/recipes-core/busybox/busybox_1.36.0.bb b/meta/recipes-cor=
e/busybox/busybox_1.36.1.bb
similarity index 91%
rename from meta/recipes-core/busybox/busybox_1.36.0.bb
rename to meta/recipes-core/busybox/busybox_1.36.1.bb
index 8014a5c7bf..b34d60cded 100644
--- a/meta/recipes-core/busybox/busybox_1.36.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.36.1.bb
@@ -51,6 +51,4 @@ SRC_URI =3D "https://busybox.net/downloads/busybox-${PV}.=
tar.bz2;name=3Dtarball \
            file://0002-nslookup-sanitize-all-printed-strings-with-printabl=
e.patch \
            "
 SRC_URI:append:libc-musl =3D " file://musl.cfg "
-# TODO http://lists.busybox.net/pipermail/busybox/2023-January/090078.html
-SRC_URI:append:x86 =3D " file://sha_accel.cfg"
-SRC_URI[tarball.sha256sum] =3D "542750c8af7cb2630e201780b4f99f3dcceeb06f50=
5b479ec68241c1e6af61a5"
+SRC_URI[tarball.sha256sum] =3D "b8cc24c9574d809e7279c3be349795c5d5ceb6fdf1=
9ca709f80cde50e47de314"
--=20
2.40.1


