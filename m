Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02885C433EF
	for <webhook@archiver.kernel.org>; Tue,  1 Feb 2022 16:17:10 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.76])
 by mx.groups.io with SMTP id smtpd.web12.50389.1643732224178235699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Feb 2022 08:17:09 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify"
 header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=4K7JcplX;
 spf=pass (domain: weidmueller.com, ip: 40.107.1.76,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k7JTL96Du1NQlnnbZCIz33o7lZGw7sb/f44nEmX9o01wQlBD81gmzpoCTp47bnhLQZeUizZsgl4+J05fBpIVEnb8UeYTM2SULkBYvd5ZwPVXQdJbvRNsu0jB2osSRa+rVqsttNOK1fyNO4cTq2esbRfzMLVnT44S483azTTEoDSu5KDMyMMkU9n3IBGTxPYmo71+a77pBOBZsZcxYFcCovVM5ihqWp2QQ3puKbni2JFr6T5glbHpuJCYTfkn5y6ToX9OH6DHqFQ45a8JizqiwYa29qOOF9kILJOsjQUEmOe9ucBOjXJW7gP3L/Sp9eRJS86WNhsIEjpphPz7bgK/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PcDepP7YXyOtnJkDyUIhy89xL64hZgGt/8igSiK78rw=;
 b=mz6DdrPtgaVYTSWjflTGZ45VSgAyrzh+atfIxNsOFSgp3+Zn7s+v2XSF6dlJNXF1j8mtNB/gi1/5MpGxXOnacjDD3SjQCfUiz/A3sfjrpeyoI3sgtA5DBGCYwQnS8FPYMo27EEGtPNgxz9d6M9LEDCPv0ATA2A7FeSYeKLD6o8VhFZfp+8olHxJHK6Nl65II7HUGFQqu4WLxkLtkMu9qyliFogtXNb/SWjxofT5dDBGhNhwysLfOXssv08S1pNvaCzM2Kb4uaSpIJYuD1Fvwr/2urtBEFNhOYZaeSO2iG1rFzJg2FrYk/w9tc8sR8tngZcoJGOEMzGUREqqrK4M/Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PcDepP7YXyOtnJkDyUIhy89xL64hZgGt/8igSiK78rw=;
 b=4K7JcplXddRhHAEigW8Pck7L04BTdVBEymEyHFT8TiLaCZHsTwWiW60Cunj+AoPO+HzQ30673o/g2FupX/J4/w1RfeUchOHIwtOZIgFo9BcYx2FTWgw9mDzRF3RlONrgMMqKxg5RvO9fgOBHyPot08TamGAhv0cd3amCYHLDahk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM0PR08MB5188.eurprd08.prod.outlook.com (2603:10a6:208:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Tue, 1 Feb
 2022 16:17:00 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::245e:139f:5d4d:1dc2%3]) with mapi id 15.20.4930.022; Tue, 1 Feb 2022
 16:17:00 +0000
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
To: openembedded-core@lists.openembedded.org
CC: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Subject: [PATCH 2/3] systemd: Add link-udev-shared PACKAGECONFIG
Date: Tue,  1 Feb 2022 17:16:37 +0100
Message-ID: 
 <20220201161638.25531-2-stefan.herbrechtsmeier-oss@weidmueller.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
References: 
 <20220201161638.25531-1-stefan.herbrechtsmeier-oss@weidmueller.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: AM5PR04CA0023.eurprd04.prod.outlook.com
 (2603:10a6:206:1::36) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 823c598b-0818-4799-700a-08d9e59e4682
X-MS-TrafficTypeDiagnostic: AM0PR08MB5188:EE_
X-Microsoft-Antispam-PRVS: 
	<AM0PR08MB51885E2B951019FDA930B3FDD7269@AM0PR08MB5188.eurprd08.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	LyFJrVWO66pKi5NpQt+47+sptN6tCeEi8VIW6YH+I4FIIWzLMJKFfN322KEcXnnwcJ8YiI1Se5VL9KQm/AdThZjpUZ1VtwXkeMwyMKK2Ry+lYITqafGVU8Y6UBh+z8266pncvpIgrdgler9bHxT4feTnfXLJj1myv1Ru4H+Eyj5HHyMhXDgR7BX8i/nO7COisq6M9LXVUatYHZ0s6PPtOfZYggztA8Au5MAeu0rD9pQU0s3XyHqSDravzpHZZWC9tB1qAnh4mmYrXx1lSo/U+eULs20AjHv0BatF56+EB9AX6nyJugdHewCCu03AIrvn9No0UCeZ0rkqW/NFjmXOeV3LGGEhiDCdDNUjQgKGBl2yDwhC1Rra2ff8bh0U4QZBoAGDSmkWkSQa/IsI2UsOaArrimOT6U5k2n0v3rTzXw6OCbGXT64Jd2tseFKq/MKLr8JRRYC25uBE4+SqopD4u7HbM7uro6ZDSAk85hk34UsTsEsX1adIevNWXeLHvcbs+poeUNy8XgPmbcsD+AkH7GR+laSdv292DoJWuKI6nc+iVpOLh6/Wi9bSkeGkq1ttOOG6T+GE12UInvfMvlQjfnkiyEOocznA1tOswOzIMYePbzAtyfIvtBVd+5TkVybbNLuCxF9kYD74vWH//KqhwKBbVC9GUKDA/hw0NUqXBDe2hZx5QM2G4x1bmqEVlN9bmVPKkJRO6hYUwWknAXZ+eg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(8936002)(2616005)(316002)(186003)(107886003)(38350700002)(66476007)(66556008)(66946007)(4326008)(8676002)(26005)(38100700002)(36756003)(1076003)(6916009)(2906002)(508600001)(6486002)(6666004)(6506007)(52116002)(6512007)(5660300002)(86362001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qMclGvPXScnhF2jwPOi5QRZvD2UpOIJnbBoJqFdi2RkOqEg14yAu3ZBzfJ0k?=
 =?us-ascii?Q?6b2Uyg2ji8KdLd5BTnqGFPEI1f5Oq968gnVLuH1AIKIGk3yjQEa/JjaqmpHg?=
 =?us-ascii?Q?v1WvFOOlL1XQ70bnF3klL3SS+6386QvCRcReWyE8DfCv6V26x6wJnwWg8VTQ?=
 =?us-ascii?Q?vOVjVPkDBw/xyCeypZtv+XtDoMhLWFBYorMpE7CoOStlyV9hYUTQxjWq3Fkn?=
 =?us-ascii?Q?CuPhgGZUYqNJYQB90kxfXdJsm+La8rCgJ9f3puL4g5iYF2NjFZ18WSNbhTM7?=
 =?us-ascii?Q?ws2anUmYNgPJL1oeA+DFqQirtkE3T64wrPBiqZYQg1bqjZ5JB804E/AhmtUx?=
 =?us-ascii?Q?qzP+uSWY6DRrTJXHDJQJou2oN8uzvB9N0P73eIlbviJm8GJREGgT/URbLDqa?=
 =?us-ascii?Q?OT8FHYurdAB2ORHkxu4P5A8lEsQMPl4WFUaFG36i4Vy1V/9OZrACQaFirGxQ?=
 =?us-ascii?Q?Ofu1V//1174uUuAoQCkGkTPmgpERnPSXpWfGwr8tRLGpXO7dzI7HnBwv9MXq?=
 =?us-ascii?Q?iMz4fHfGprEHCHOCpIuM3CjxCsHf7dCLhXX/cKTuefDxTwwWg9aOdHv0b6vp?=
 =?us-ascii?Q?VUHsyGQsrl1fvGRFDAv7Jn319nPP2ghokvYjIBJNGCvIFffRE9fdiu9tFeez?=
 =?us-ascii?Q?+TRMry8J2RocKEnrmMXQtDeuj9PEKskZrJbLmtRjvMBtp0XsPHUJYZlGoX+b?=
 =?us-ascii?Q?HEWfeOQn+TfiPDqvLgYAVs7fPCilhWL+YQ5iSHXA2ACMsaXiJHdIyGIO3uvy?=
 =?us-ascii?Q?MxzFyH8EbklF1LKhxVliLb9+yLPa97lAyC/a9x6ywnESuRsLN1D5rgHkOg6+?=
 =?us-ascii?Q?QaoibEaiS1M2TAppL7GEXEi6L2iDzVhvUi0w2MWO48jAXc0xAHhOp4m4Svtl?=
 =?us-ascii?Q?KyQdFTAChwS9Joy+9TvOF1C7s1L3QH7PP1vFZhOQjHKbhL7wIpX9jaslkGCE?=
 =?us-ascii?Q?fX4wFzV5N69veXvlkiH6nyFWUAFe9N7OYNolGvjicfGQk3AtTaWrzVGtBxDA?=
 =?us-ascii?Q?kx6NruefJDyuxhYaY/BpeJ/SwfayMxnKvq863hr2NtxvpCISzxlJaQrrirDg?=
 =?us-ascii?Q?cdavH94fq4sDC3ptBj8YDjbzZ3pM8MxCEohdTvrEcaZ769PQrfyEtL2M7S7i?=
 =?us-ascii?Q?RqwjQUk7C+T+yxHTulEMCun4g8pfR8SR/PEi9DF4+4E5GKCWz/9X/H0OdmJu?=
 =?us-ascii?Q?JzU5TPcuEcgeRR+z8Y5eSbcUPCbhnN9GwyYkxq6GZqNkgv51MmcDh0tlX7Ki?=
 =?us-ascii?Q?+5B4ZGNjBDj44YvVhC1SSspKGUytZ3kMPHzkMwBu/rs1QIPJMQnHGLsOcdtZ?=
 =?us-ascii?Q?qb13XRTwO04IFfif2RkFS8axW2hy7x/iKulaauU8EOdFM/4kmp/lIj5aRMsD?=
 =?us-ascii?Q?2yQFqJRJ/qkXqe6QsLkSoKXtSoyRh21MSPvuO5R6kGkVMpHsKgbiprjw3Tsc?=
 =?us-ascii?Q?qroM8cIQL+yqF9R6QlPJ0nRfUDQ0w1Jgbp6SvtDxGdiYrmWid29V/TYRVVaM?=
 =?us-ascii?Q?+h7kn26dAGI6IZhtQPVjb99au2JCqDCQJ4bHwApjhnnq6sOGUq//SMHZizdd?=
 =?us-ascii?Q?fW73LY5A+uu1oWDxE9Ad0RBY98mF0dydxjA3BFQ6zS5C+mcDFeeFYWkhK7gt?=
 =?us-ascii?Q?UWUxoGR6LFP9fc+h2nnXVAY=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 823c598b-0818-4799-700a-08d9e59e4682
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2022 16:17:00.0963
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 rTP4loF2Ca4AJZgtDiJg1/FYaga8CtA2RfkF0R/BE5fDdN2FJoPM/rEcXoYDynNSQq2omp60u2Gds7gSAl2Nug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5188
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Feb 2022 16:17:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161160

From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>

Add a PACKAGECONFIG to link systemd-udev and its helpers to
libsystemd-shared.so. If enabled the udev package depends on the systemd
package.

Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.c=
om>
---

 meta/recipes-core/systemd/systemd_249.7.bb | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd_249.7.bb b/meta/recipes-core=
/systemd/systemd_249.7.bb
index 53e7f6738d..739f3aae86 100644
--- a/meta/recipes-core/systemd/systemd_249.7.bb
+++ b/meta/recipes-core/systemd/systemd_249.7.bb
@@ -156,6 +156,9 @@ PACKAGECONFIG[kmod] =3D "-Dkmod=3Dtrue,-Dkmod=3Dfalse,k=
mod"
 PACKAGECONFIG[ldconfig] =3D "-Dldconfig=3Dtrue,-Dldconfig=3Dfalse,,ldconfi=
g"
 PACKAGECONFIG[libidn] =3D "-Dlibidn=3Dtrue,-Dlibidn=3Dfalse,libidn,,libidn=
"
 PACKAGECONFIG[libidn2] =3D "-Dlibidn2=3Dtrue,-Dlibidn2=3Dfalse,libidn2,,li=
bidn2"
+# Link udev shared with systemd helper library.
+# If enabled the udev package depends on the systemd package (which has th=
e needed shared library).
+PACKAGECONFIG[link-udev-shared] =3D "-Dlink-udev-shared=3Dtrue,-Dlink-udev=
-shared=3Dfalse"
 PACKAGECONFIG[localed] =3D "-Dlocaled=3Dtrue,-Dlocaled=3Dfalse"
 PACKAGECONFIG[logind] =3D "-Dlogind=3Dtrue,-Dlogind=3Dfalse"
 PACKAGECONFIG[lz4] =3D "-Dlz4=3Dtrue,-Dlz4=3Dfalse,lz4"
@@ -215,11 +218,6 @@ rootprefix ?=3D "${root_prefix}"
 rootlibdir ?=3D "${base_libdir}"
 rootlibexecdir =3D "${rootprefix}/lib"
=20
-# This links udev statically with systemd helper library.
-# Otherwise udev package would depend on systemd package (which has the ne=
eded shared library),
-# and always pull it into images.
-EXTRA_OEMESON +=3D "-Dlink-udev-shared=3Dfalse"
-
 EXTRA_OEMESON +=3D "-Dnobody-user=3Dnobody \
                   -Dnobody-group=3Dnobody \
                   -Drootlibdir=3D${rootlibdir} \
--=20
2.30.2


