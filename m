Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18577C5DF6E
	for <webhook@archiver.kernel.org>; Sun, 16 Aug 2026 16:26:27 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12743.1786897581017369743
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Aug 2026 09:26:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=VTcZDt0K;
 spf=pass (domain: est.tech, ip: 40.107.162.26, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HMlpge04atfRtlKDD+wuYGTfbXYlTLQKsiWayid6DkNaNqjWGZRPcE7qgTXzVcnHmFC09mClUJedUK7ARCTD5OCSSxoPnUXJYFFwXvvIWqMOt4PTYsAHd2g2c+a4Kl0BIf6jAF5GRW37DNWDP06V5Scj++7kPuoT0OZWMN/FQa/isa9Sx9lhNDnZnDs81vhmUr5T1QrTW+bFWJJnxkfEfdpHbZ7s6YHR2GQwLn17hlH4VDnz2fE3j3km/xPI/6EOZHKQ5TddtdPl7CzPeTedoR19XWWhO306qis3NQIj2jYZVTx+UFdH06p8L0MNhPd6ZouUSmjwON1wHfZd71GvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zRu9yoPeUfpnxCT32DJT38tNp2O7VIXDvbOHWpjXHw4=;
 b=AQ8YWyY8lLEg/O8MRqEPAPayioJ1t714gIxWGIblwLcX5J9nVRtKrWPwsFMVyvyv7EsK+wwlRHN3D1J0oHtzVnkbHfqsbiXKtjPYxAged/1N8iZpMf8Qf7r6n/lBYDJjPdB47vuvvnWJMi+WoX+cXOVnq1JVW1ky+uF3CW2aRpV0Jj7mCIECFvl0hLr/ISNSWwvBa++mcRxBbtgFReI4XEN+PipIYU0mbbUi3o4luy7SUPLBLnQhr+bytybY8wFkx9zo1xRqWM/P1FX6doBlgSLjnwgejuXFcwqd8MkWb2OJSFp2KsMPHP4KNeOb15LgA95nbOgfQJuTMHmw3tCBvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zRu9yoPeUfpnxCT32DJT38tNp2O7VIXDvbOHWpjXHw4=;
 b=VTcZDt0K/YDn2UTPQvnGtsrEBm6WjU59Alddq+fan3j0KjfVa6KqdS8VtY9HnRKlerR3PzKy2ZDKNYjR8wnm8uNFbiy8ZnxgEaGHiPgJ3jHmChUi2j3RulhP/5TvSeecC1LyS0jQBps6Rng1fxvfPzDyXk+OaKUsVzrNDmjLKbz+nQ0ZgYyfpxW+b7MlWsQGzOiHo37mTAzeu4fEcGD1sltmqU2yMGa1PQ8Kcvq5Ql407Rzj4hlpqjQhVJLEKmAsk9MvQ3YESao7jiBKyZyWW5jNWCwT0XYT1XbkxkL97vrHW5UkowKQoqCH+9IvYQwa3eRLfjNZ5FPx1TNy1ueUeA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM (2603:10a6:18:3::ad4)
 by GVXP189MB2751.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:1fd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Sun, 16 Aug
 2026 16:26:16 +0000
Received: from DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85]) by DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 ([fe80::7ab2:c6af:6760:5c85%7]) with mapi id 15.21.0339.007; Sun, 16 Aug 2026
 16:26:16 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
Subject: [PATCH 1/2] boost-build-native: upgrade 1.91.0 -> 1.92.0
Date: Sun, 16 Aug 2026 18:26:10 +0200
Message-ID: <20260816162611.41933-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
References: <20260816162611.41933-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DB9PR01CA0010.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::15) To DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:18:3::ad4)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU7PPF66507B2D7:EE_|GVXP189MB2751:EE_
X-MS-Office365-Filtering-Correlation-Id: b2cff134-1b30-457f-7561-08defbb318a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|10070799003|23010399003|1800799024|376014|10067099003|56012099006|3023799007|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	NohlQZKGjW8HLPtLsmTxyc66Sbo8kQoO4fA6mgeEPW6AWNcAYUOrrGeaOAJnr1A3zhleUtuIRs9GuXvYxkuc3JjHsiPFuNKngG1beAyp2E3HDWElYKqxd99sK8CxLIgDJTd3+75YySowS2IszqOYUpqOtoZtfVeammqkS64ZWTAP3ZE+pffgXoutUmu9HyUfJLGM6TCNZ/tsfV29JIDNVaCXEt8FrU3qB8LzdL1cd+j6LI+rDmRlNQFdXyH/6CHXD8RqJGmAQeAk1ogKDU35eHlD2x7pk0hlFnzsQ/4CzZ8d5AdagRqVSKMR/GgQd2HZZRQBa9moOtiJkP4o+V2JREgJhtSxLFIaaKvkkfPFWRyxNx0MaT1L8v3BJ6fxZ6/cAyA2zhJyDrCwXHmOpghI6y1J9snDJ/wb5r/hP6jglCBebLPyzpv1VlJsPp4vZiQl+UXE3EYCnn+QP6NAcKz7kKyPWdMPMHw2JvGv6+DtKgAuabNMITTw6h2PWWz4BlvRfuCFppE4wdO0hGTAqQtggjonPHPSxMCp8qsRQKFhPvCFWtmc8tg0P3PpqEIF69ofRQ2c5sJLFIygqU7u+eqGDbLmtwtzkKSOmBlX8r9Ruz/5JAQyRoTc0cmTVR7GNnhy4Mfhbt7a6hQPcp4HfUPWZL7bwoRttUEzvK+BnZ3DaCs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(23010399003)(1800799024)(376014)(10067099003)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?AGwnQBJlAJ1TWEryCBL2o6VLpxHtTby1J+kcEjaLjk5v267/xetMHBYApR8K?=
 =?us-ascii?Q?CY/k7cdblh2NsdlNNvz0a+lOKxq2bnhWrEQDfM5EPKevpERXINPuQXRDEzQr?=
 =?us-ascii?Q?8l6t1zRWBUR5Xk0qwp1F/OgPYXH+4WP0D9LRYyaAbAynxs5NxrIeB/eit5gL?=
 =?us-ascii?Q?jL3hj4WtymEaH57QnJ/+zokulsRXazoxCvNmbfmqYcQeHFL3e40AOS0H36x+?=
 =?us-ascii?Q?ysixxX+3sOvJm9gCG4ZHpX3mwuAN5IDEe+NeGGEbbdtX7df7kBhyj9rLwTCl?=
 =?us-ascii?Q?OuecleDLRA+V0uffURhTH7gVfd+7Rf8yoSBC3cTnxjUnwjQ8KoDSRqPwUIIe?=
 =?us-ascii?Q?dos8wKqQctpJagebcc2iBH2O+ooNiJ87b276+68OpfVFp74iP29XMXaB+W+5?=
 =?us-ascii?Q?Ghb41ESwVa72aCv1nr9U78YRlH161hAUPQdDaJTSirzlKbEPjOrGfFWe6bnv?=
 =?us-ascii?Q?A+9Dae6TGOTaRcYc1TBT5k0I8PgBDW5PU8miNQ5aPUCw4fLx56lmSMVwA8B3?=
 =?us-ascii?Q?KPOuOrkTrYoVFCV4AVySSGCxBTG1SDPBCV88ng1J+v8mgxATDVoUAIaY4y23?=
 =?us-ascii?Q?Zv+IdlQ599+rmqbRHzQK+/3NTqrZ8MifBQLk21GZpFSGhC1jPeUH6ZzV9ccb?=
 =?us-ascii?Q?V+gLLSVX93Vd59WPP/auYPQOMfC6egAPpwYi/24/vVE4g87okkHr+n+O2Pia?=
 =?us-ascii?Q?pDdgeC0myTn//J+dQ0H9UT6OI5lD0taRG/L4/eUKA7B7Jv9U3PdXqF/OWD/n?=
 =?us-ascii?Q?Q1m/f+CNCzTvMlL3YNXF/dXdsWaN2J1BFwVKZsbvs2quoW7/SDJz/VZpizNi?=
 =?us-ascii?Q?a95xYiWnF6a3IWlTkYYRzqQWXbvAYOD9rQLABmSVm8NOYULNy9eL2o8Pud1P?=
 =?us-ascii?Q?RgudoCrlpg+fvOR7PUwYFAa1zA11LDDKU20zVVUgBFzFatdyZU7VY7p1xGl5?=
 =?us-ascii?Q?jyLlevSDKL7Cn6YeptMB0T+CavdlvKxmILRF6XdZ24xKd8NSn6vyFrhLnqQh?=
 =?us-ascii?Q?I7uZSQYql1UdKl1gKiGwwviqHuynOdZqnjSH9a/UpDhYJJ7MnR9NYviPn8d+?=
 =?us-ascii?Q?ytOyj6KGHB1IuBsgk3xoiA1RCwfZ+LkZks0L3s0r7FoNrIw3vEZ23wpzuu/j?=
 =?us-ascii?Q?I85bVQ4lhCK0J/B6JYZw/7RTnGryq5PtgCPFpAB3k0Mlu/0mf8wfSkZXKJxP?=
 =?us-ascii?Q?ZeUBtChmTc9HUJTZMK7TYNDcPZmp4pDDRp2a3JX5Za3bAqujzQtf/HgxUSpd?=
 =?us-ascii?Q?o9XePR9Z2706/2VHb+FmnGstZCCEXFYLKseOhG/LcwPceT7GBSI8f6VDa0At?=
 =?us-ascii?Q?PS9RWVCzdbQP0L8V/c97FNiQ2rSENsU+JbgdiMqYq5RxyYrYWV+lA5WvoeHc?=
 =?us-ascii?Q?KFDmz27bolZmoFkgDrVpn/Ipoe6RNwDEyz7nL/4zFwqQjpur//StnHRmMDQz?=
 =?us-ascii?Q?L1nKAE0i7clwmFKzbUVrLrMljLhOXuxUnNaOTbREar1cpJct2sRSPptFHiLy?=
 =?us-ascii?Q?vNjOv93ly9hvAtZrQR1vhSfi0hZFRV7e+Cs/g0kXu7Sg3ZKEQcVyy0NnFME/?=
 =?us-ascii?Q?jDaOhnlMxR1rI1OsXVujJxKj7uVfxca6jpSyQrfDXhQRqQcW6O1TqSoEjB12?=
 =?us-ascii?Q?DwC9iuHOJCDBRsWzO/M9p+o4mQZpnoWeWggD52a2X+0eDxpEaCi0KQ3aMtwp?=
 =?us-ascii?Q?/dCsnc7PrneQ+kAMKgqESSRS1jhIy3uf8axNETPQI4fwY55bxCAbLLOMUI6Z?=
 =?us-ascii?Q?cngg18CKKCrw8IxPpjm+FcZuQ03UXval911PutfynAJqGHyEJmRJMGP94178?=
X-MS-Exchange-AntiSpam-MessageData-1: U8QAJV4zCWmtSHhR1OsN2nGzOzv1A/qnJro=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: b2cff134-1b30-457f-7561-08defbb318a3
X-MS-Exchange-CrossTenant-AuthSource: DU7PPF66507B2D7.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Aug 2026 16:26:16.5015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e43wLMz49/Skv0GeRlofR4GAbP1NHeWEXBbrBdXkhOa38zXAxr/lywYsoD+iTqFSJkf8zPj/TrRcS/WhcKpH8sLABcUOhMf4eRGGcAhAE7k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXP189MB2751
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Aug 2026 16:26:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243537

CompareLog: https://github.com/boostorg/build/compare/boost-1.91.0...boost-=
1.92.0

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 ...oost-build-native_1.91.0.bb =3D> boost-build-native_1.92.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/boost/{boost-build-native_1.91.0.bb =3D> boost=
-build-native_1.92.0.bb} (92%)

diff --git a/meta/recipes-support/boost/boost-build-native_1.91.0.bb b/meta=
/recipes-support/boost/boost-build-native_1.92.0.bb
similarity index 92%
rename from meta/recipes-support/boost/boost-build-native_1.91.0.bb
rename to meta/recipes-support/boost/boost-build-native_1.92.0.bb
index c276cf436d..008bdacf5e 100644
--- a/meta/recipes-support/boost/boost-build-native_1.91.0.bb
+++ b/meta/recipes-support/boost/boost-build-native_1.92.0.bb
@@ -7,7 +7,7 @@ LICENSE =3D "BSL-1.0"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3De4224ccaecb14d942c71d31bef2=
0d78c"
=20
 SRC_URI =3D "git://github.com/boostorg/build;protocol=3Dhttps;branch=3Dmas=
ter;tag=3Dboost-${PV}"
-SRCREV =3D "85252c9d6a3817daca23ddae94ce16c7be4d2c12"
+SRCREV =3D "05b6b638b54e1f013fb8b281f5020e337be31363"
 PE =3D "1"
=20
 UPSTREAM_CHECK_GITTAGREGEX =3D "boost-(?P<pver>(\d+(\.\d+)+))"

