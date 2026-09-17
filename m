Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED4C5C982D1
	for <webhook@archiver.kernel.org>; Thu, 17 Sep 2026 12:05:00 +0000 (UTC)
Received: from PNYPR01CU001.outbound.protection.outlook.com (PNYPR01CU001.outbound.protection.outlook.com [52.101.225.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34550.1789632474580128365
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Sep 2026 01:07:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@bmwtechworks.in header.s=selector1 header.b=wERpunrN;
 spf=pass (domain: bmwtechworks.in, ip: 52.101.225.53, mailfrom: upstream_ip-sk@bmwtechworks.in)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjh9wxVlF97KXDJce4Ucjb47WEnu8Pav6WQY1ZluEojnSbJSyn8VVDSOqMqI8uBMfK7PE81fYjDayYLoompJ4UK6LmiNoWhoJorqbCXG34oDVahRFJLPfIVMhVdNR3KFLsrHquZrhzB8moRrmWxHhJl5w98u8FWL+yuDbJKWzOER5wpfz7E8O1X+i59o/u5YkchQHHhvA4pmLo0PD8h+RKiH1CuxADwS0Bd0SrqaBpQHQEQyMTFki2wO8kfxWbtKRok642VnkxO98mwnY1dz2zKcK4STUUPet94ZekeKuG5qso7P2aMeA4wCvsoFFSQXmX7nGDFyGM4HkjbAsnfuqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYbPR3N0mmgcoy0vOttoLtHs4MkaS/IoeT30EWjHz5M=;
 b=DBda1QsZgcbGFpYAViYUvrBtfX7B3PrEfRlkzXqponW6xKh4F6WvwaTnoS558un0/8Mti/0HSLrTqOxTy4iR+opCfZm5rcXv7mC7IE1gmvO/754rLqIZcei5FU2wAtl0cjRzM06GDHq1YEzK8PwJKboDtA+dwP4TKJSC9g1nhTUG5DE3zKaRkK0DRxeApm9x0HLCoLuuqY96xjzbjKZGFMhc8sqtbNwKe9S4qpFYhw+D1vfW47iuQbaxbbgGe4c2+uzVlry+/Lrez24ipJ5YUQgZMdAadxLxED585aqkdbPcDKk3/kHjks4omyv+Wqyj3nCcGH2fYtriTRtOUtr+Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bmwtechworks.in; dmarc=pass action=none
 header.from=bmwtechworks.in; dkim=pass header.d=bmwtechworks.in; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bmwtechworks.in;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYbPR3N0mmgcoy0vOttoLtHs4MkaS/IoeT30EWjHz5M=;
 b=wERpunrNmD7dXcO8iThNQZellMXgKs4GftFaySqaDFCJRrHJYOExyeCIOMa3Dw4HsJZ5CTpskV+2t6zhuQ3eodqg293oPXzWoOnuSSl+m7VUE+CqHsujFnaczBzS8ebVjI0FO4vTJ3wXanA9HroVhox4Rm4qUqFNMnMEveCKvEApPyiOVfsEmtbRsl8jpijOX4sGeVrMzBCWQw0NHa/6r3aEPx7ueZnMBCoYfLldgNkVjWlIYx4d6NHClT+z+QXGiNJFDyWFArweR11MIpFkUMeLcx1EWgvi8MPVbwtIBRP4vBUvnm8L+zBzDqYIUA8eZb7D+Sv8tXQktbagYkF1Bg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bmwtechworks.in;
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::156)
 by PN3PPF99651108F.INDP287.PROD.OUTLOOK.COM (2603:1096:c04:1::c2) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.12; Thu, 17 Sep
 2026 08:07:45 +0000
Received: from PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12]) by PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 ([fe80::a44:7591:bce5:fd12%4]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 08:07:45 +0000
From: Sana Kazi <UpStream_IP-SK@bmwtechworks.in>
To: openembedded-core@lists.openembedded.org
CC: Sana Kazi <Kazi.S@bmwtechworks.in>
Subject: [oe-core][wrynose][PATCHv2] libgcrypt: Update license for dbg package
Date: Thu, 17 Sep 2026 13:37:38 +0530
Message-ID: <20260917080738.1039368-1-UpStream_IP-SK@bmwtechworks.in>
X-Mailer: git-send-email 2.43.0
X-ClientProxiedBy: PN4P287CA0119.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2b0::9) To PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c04:1::156)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN2PPFE40D44641:EE_|PN3PPF99651108F:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fcf0a1-c465-4d93-0cda-08df1492c1a0
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|23010399003|1800799024|52116014|376014|366016|38350700014|10067099003|11063799006|56012099006|55112099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	e8O5ebWGzETCL9wx7oIBDdNhEVdR4YmZ1xARvzyFium3zIiC2WMPtXh4iSCZb7zzfBQYGsoFlXn4nbXJ2fIubu+MVZMLCo9fInQpfjEjm+Rrfqi9XZFTDQjOgJeEl9WD+U/1UAUWSAPkwCu1/SJlr1ESQmBFwK6Wr0bxzcFY6iYAZzp5CPyIsltPpKCOCx4WgW2+7rUuscM+jHA2YpQ6ZvhxgBQFeFkBlNjLUUfbaaxAIcDXFThSLqr4kyTLkx5wMMiQMBoBzuaUn4m/Yg1TyV2nJRKoY2O/VpGUPH29zsvCGxRDuzjcLpsdRJYquAml0HXfnqFkGgxPdglJExknDlY5THmHWmdMTPZxA1GTGsQ9963HRQ60fGNLDOwxXeHKbjtub5Vb5+1DyEVp2RXQhNnSgMLSuMYMx2Nawv4il27P14AQXgLEolseDXbjbuZMzLtOq6WqTbpX177r3m+Mu+SWRsWAI/0f3F4buIbi/iEQnK2d9i3u21ah6us8MS5YMZUkznMBnknKgsQyPz8IAWOKnUxhp1CgIaLLvhXZig5rHUaMgmRpIvDPUI3DXNQXStKxEdsJ1P0pw5y5xN9ZCYShKRXxAGbhNPo+bcvca4+GOKhGuqUdPFstYoAJrSIltuyqto+TiG3InrfXFSbV9MPXAIoLndb0WXcZ0Ba5U1+e/Zw0+ixPCv2dp339EtsESvXGsNOn51rDlf+0QqBGnab8GNUAiFGppUAHtVFzCtI=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(52116014)(376014)(366016)(38350700014)(10067099003)(11063799006)(56012099006)(55112099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Sfasm9TptiYnN6v4WAkR0sugct5a2ooklY2q9W6zi1JgHif0sgBUR4OnPqfS?=
 =?us-ascii?Q?r7o5682p2erMPVDOGwommOXaEqtGzCcEJiEmKCGAufcoL1Xeu3ji3scXjkGn?=
 =?us-ascii?Q?Fwb97voq9eiCyyNTBTVzOYUNOrVF0XmNTvXDzXvZW/TEx9g0HW4QOODMY7GS?=
 =?us-ascii?Q?CLpEm5Au076JF+dzgnQAld+AETymVeEVdb7E9ttDv8Yv6JDwtbXThcNilBOA?=
 =?us-ascii?Q?G5QKbkg1UyiRNoBVQVBImaWRXbRttBGd2tZ5iFN8ea1aDk28yNeXBhkZZdia?=
 =?us-ascii?Q?cB/gw1rRM5fg7FtHvPj8RHTvU+iBe1pw3LZ8YF0cJ9ze3mm/9IkbNQB8EfMY?=
 =?us-ascii?Q?If1hNoHWQyf8WhqyLYtfcjH9lgSQqbtLVPXCOBmleuKBZQdR+0dRKApHMAvf?=
 =?us-ascii?Q?IW8WoJp/kza3W2qZ6zMDAEKWx32YImXPaSZ0gZm29aeb8c0gSBrApnkCzkQe?=
 =?us-ascii?Q?9JBJdl7xfz4bFxBknC0Mxngry9681Y7PjCkKUQfNxTc/JGQxSsoVzmRgtX8k?=
 =?us-ascii?Q?sdOhUP2NrR7ZLAd/9DwvZHPRTmH5eoW6PaIXB8tGp0GKUb+HbL6vawA6wP8H?=
 =?us-ascii?Q?A3QwGe0OU/DJ/kY35ev2mgOShzT20tFKDLcdjjvQZ5LYtHN+AOOnX7+eNsFQ?=
 =?us-ascii?Q?F8qdwP1noIKpZlkUx0FgsSZYg1lB2AU4O2XHlWCF2D+zc8tGC/iupm9k7ut0?=
 =?us-ascii?Q?mf7fbIRHlLiBsU04Ua+bdJT4Ua1JNLXnOUq84/vMvSokoyHLJwMfDGBPmGVY?=
 =?us-ascii?Q?CkRpKXCCH4Qmw93BrcSzyV6r9ysKcZGBZEqaRfMaj3JY2cKW2FOvHVJh8cgg?=
 =?us-ascii?Q?0k5pA2DfdRBmIPbqRg9jwmVk8GaqCDmSo7yXpDY2MtUgbUm6RWBg3lUIxkB0?=
 =?us-ascii?Q?8DsJLky9MmVCiwo9DIa38DE4GA+d393qm7ROogKrIEEYFkkWhIZ+fglsheCi?=
 =?us-ascii?Q?I5hlyiv3sp4WoT/yr2z9K+KiBrVbdTePE2W4t3UDlc4zoV8yurmyhgR2824L?=
 =?us-ascii?Q?MfoRh8lyHsw8kILRHyzrwhy/44x887dhjr7YeDxe69FGTSAKDNklDVjYG4xX?=
 =?us-ascii?Q?uI/ZEr/Tleqj1SCnYAnVMTMPguSCQcvG8ASPZRWBGOHUDowclghgSvq43MB/?=
 =?us-ascii?Q?QgGOyeFyn+/Ex4NJ50xHl0P6bAhglNBkqEJAZo6XzAbdkFtPFzsqKhNMYbsM?=
 =?us-ascii?Q?8Thy4cv8KO9wqetnTZUm3L/aO33mrfp8gMxfuANBlu1ZXdSNRVMDhKcszeBO?=
 =?us-ascii?Q?udr2Q1eEl0aOaaJ1M6r3zYLgTZSrRHE9/GS3CMfxQaOtX8XRbiISMCMxnoio?=
 =?us-ascii?Q?EqgkA0dS1HimR82k1mG0uPMC3sX/BqaT/ZCWr/gve7/pRPbxWwAoDDM22zed?=
 =?us-ascii?Q?XtVacHMmGUd6uKVJ+A8MUMG9qEo7OmwaR6sL652KqQIxsDy0uJz3hfIVbs9l?=
 =?us-ascii?Q?H4dKnivk2frPyNhhuH0aLRrbUC9FqjbmXcOpPWs2ws0mFAAOtbgVRKtlhHIW?=
 =?us-ascii?Q?7Os5cUqu/0/kguxBl9NWD0MBZgR1temgzueU75U2xWKNmxcslFldAk+s5VD9?=
 =?us-ascii?Q?OFyW8gKwVv+uGjKVROWy7OkKDNAvYymcg4dvBEeg28c6tTP/R9qWKMspFOdS?=
 =?us-ascii?Q?B2ZOpWKYTXoUfJfROOlNxMMeM9QpaRKUeFYC53A7nqJDiF1UmFP8oZv+8j9h?=
 =?us-ascii?Q?RQ3EOlRI7g9nXLXbWCqm1QaFZGO5i1mxLNsLvsXumLaRuBpF5Plrro1fO5tu?=
 =?us-ascii?Q?aKGlfr7W5bdpIqd2y0/Ka/mbef6WdJA=3D?=
X-OriginatorOrg: bmwtechworks.in
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fcf0a1-c465-4d93-0cda-08df1492c1a0
X-MS-Exchange-CrossTenant-AuthSource: PN2PPFE40D44641.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 08:07:45.7489
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 970fa6fd-1031-4cc6-8c56-488f3c61cd05
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hFy/W8eGwz95u9hRNenGz++UEYy/AtmhJPd0c2BZyV7ehZJv5PSPXDau6+Ze1Qk6y0x5N19rJ8TCo5RYJZLZ5oZwTSkSkj2M5mJdpTlM+Hk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PPF99651108F
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Sep 2026 12:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246059

From: Sana Kazi <Kazi.S@bmwtechworks.in>

Set LICENSE for libgcrypt-dbg as "LGPL-2.1-or-later"
as the files used in dbg package use LGPL-2.1-or-later.

Signed-off-by: Sana Kazi <Kazi.S@bmwtechworks.in>
---
 meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb b/meta/reci=
pes-support/libgcrypt/libgcrypt_1.12.1.bb
index d7f8563ae6..50c4fda7e9 100644
--- a/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
+++ b/meta/recipes-support/libgcrypt/libgcrypt_1.12.1.bb
@@ -9,6 +9,7 @@ SECTION =3D "libs"
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN} =3D "LGPL-2.1-or-later & BSD-3-Clause"
 LICENSE:${PN}-dev =3D "GPL-2.0-or-later & LGPL-2.1-or-later"
+LICENSE:${PN}-dbg =3D "LGPL-2.1-or-later"
=20
 LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D570a9b3749dd0463a1778803b12a6dc=
e \
                     file://COPYING.LIB;md5=3D4bf661c1e3793e55c8d1051bc5e0a=
e21 \
--=20
2.43.0


