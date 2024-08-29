Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1285BC87FD2
	for <webhook@archiver.kernel.org>; Thu, 29 Aug 2024 18:33:57 +0000 (UTC)
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (EUR02-AM0-obe.outbound.protection.outlook.com [40.107.247.137])
 by mx.groups.io with SMTP id smtpd.web11.28285.1724956431052346358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Aug 2024 11:33:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=t296WYZL;
 spf=pass (domain: navimatix.de, ip: 40.107.247.137, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RYmESch3vooCvHGSjUZq7RwfiYgV0VTUkdQFxck71p/DY0tYnHUooz1pfOQtX4L930gVoRJLTrz+fjomMthd2SwX5VwC1S2fnkQ2LjBhjKlte52NxylomdptjWHSnSxiY3jU9deln/10VVnnensWgt9eM0OqbtSfVU/KNU4/6gs6Y+QdeH0RaQsIFDiSAOjTdtD7OTx+x2n9ybeolqOy2l0trDcD2JtqHVet9qkunz8WO57Do5s1HXD38jJ3FxSZMvngmcICxX7jzSTfM2PIc2TyxaX8Y/Q3y0jYi1DUcsi457mXdBIzCHPKpxmHzipGSwPn2dKMiTgiAbtuqLU6gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2JIFz/eYRokA39OlSH8bqYgcTavbTcu/5HxkQDSMYE0=;
 b=Pf77HYsimeFfEnXZ1vq4pqjAmgeyMBhMSmnOREn91qKdADe7FMg5lXhavIHf2PS/wogfCLNbiCb7c63d4QjVa/b5KpJo3I5gnyER+mRSaB1Swzi4VLkhRwTUHiAxOIKQuUhCxaDb0KcQ4laVMadBgjUqhcqCtOXdRt2TzszplAs36Vc1XAu1qVXCOgivKdSJjFUkaffQNB3Hr+08WibP6VggLShKaFFT8NLPGmXoNRYiHT6/X/AaIKi6CsBOZJjoMKT8XgEt7YhmxsHDiZT4qhhzT8IAYnj3udECC3d33YWOg3pVqN4RP8hOcoLoXND9gjqKCTFB4WH4vEHXCKXqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2JIFz/eYRokA39OlSH8bqYgcTavbTcu/5HxkQDSMYE0=;
 b=t296WYZLQI8wNBLlXkAfXolm8A1c+EBYyYSByomigwhlI2D/cvX6pUyIp9Muei0Jfvg9XnLOTly0P5sRR3XLjOjlrv86dIm6UWztUThNXFob01fGJZr0TJWs8Ur666yI7Pibqoxpayt5M3Ori56lut4BpmRMnug71jB5xM11zok=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5) by AS8PR01MB8650.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:44d::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 18:33:47 +0000
Received: from DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7]) by DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 ([fe80::d520:1b9e:a30e:69a7%2]) with mapi id 15.20.7897.027; Thu, 29 Aug 2024
 18:33:46 +0000
Date: Thu, 29 Aug 2024 20:33:45 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] runqemu: Fix detection of -serial parameter
Message-ID: <d2bebf1bef0e855cfefc771bd86e95d29b8d4cc2.1724956424.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0257.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:86::20) To DU2PR01MB8293.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:2d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR01MB8293:EE_|AS8PR01MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 064a86ef-d793-495b-81ae-08dcc8591e6a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?40LGCtQDncLCiqSKfa9pXf2mZpTjsgrlxIe36GbyD9bNrL/805QfnvDSjPXB?=
 =?us-ascii?Q?S9SewQWlb5SICszfuyKOsvrN1VyJue7cTYtohum4r9TmZhnBIHq13sivKSzC?=
 =?us-ascii?Q?osnjfqjbZ9F4A47IcvRMCiEoXJkcZ2vXO8Myb+CBbBgRu+HeRlU6+E6X3Lda?=
 =?us-ascii?Q?5OHe2DKWRbxkZKl+yszHpmyQrvXbPutWtWlYAiy2w639B+L34MViVrcfcwjj?=
 =?us-ascii?Q?BU5pBgp+5qxwwZlEyHt9/QX0BUtnbaMKxn7bNf1VYV2RQX64W5XQRCoML4/s?=
 =?us-ascii?Q?cMb74K/Y+N7DYpYT5c2jubOhlDRVsDIUDWINse0Cd0ms+/9fcoLTUBPtnTUP?=
 =?us-ascii?Q?pDgRwmDuA0ei0TwECaoxTSaPrkOX6tEuU+eg5O8AXV73O8zuRUcQpo+EFV9z?=
 =?us-ascii?Q?0q3q+aWVp5aB2HQc0mZ3+yQhjfbvez254u+or4rsbyYChnlUSsjIQJkO2IC3?=
 =?us-ascii?Q?dh4xF0STzaoDbrfj7sNLK3kXqELDv3Kdn0j9+ilZWFn4acmQqQzjCfOEV/yM?=
 =?us-ascii?Q?lv0doQw2gcVxg0Kx3LIVb0/YnwM6FZoYEMHPVLKLzrd0z8r+td6jR2iEq9Sm?=
 =?us-ascii?Q?/qI0/zv+ZxTk27YSpkamWmZEeM+/rQcdH1UpoPzubiRU3TD9DBK+4EM+9ABk?=
 =?us-ascii?Q?P9x37WY6kFNR95/0Z89cm/lqhagmuEFN1pM7iYTTJxGVCdWFQnddvUZ2L4TW?=
 =?us-ascii?Q?bffcCf91ZLpFza9BpKWpVOmhA1T4M4z8JormJHywG/3ljlhpiYFCinq+/36h?=
 =?us-ascii?Q?+65oxq1ubBncZ+RWUU669pV+qvD2dLZzrDHqBZsqIm8ZI3OVYTk+u85YJt1S?=
 =?us-ascii?Q?Bd/8qUuaSfh/wdFeqcZymPqaO6q0F6kxpd9qK1rjFd/TKZ0i3uUy2kWe7fUw?=
 =?us-ascii?Q?7jJVH58nsZWS3Qwjtj2n73FKc3ovp/cXJIePSAJcrtBNROHyaeYz0LV+JtBf?=
 =?us-ascii?Q?WGWHR5gZqBoZeRZQoz2ZmGqWYPVqQb+JAj1zg/zRfOtLWGHXjXji6B9qOpdr?=
 =?us-ascii?Q?xvrOJWftQSOQWi6x+dCxbM4W8qrD7Eb+Ys+Wtr7XpOGv8xuCF3ojWTjf9c+9?=
 =?us-ascii?Q?fnWMBUJR6TLpXPRFetMDlfiWK4wO2SX6bwPzcT3cRSKoiF7zHwkrItLrUMq+?=
 =?us-ascii?Q?QD9ySCEwQ/xGraYniDge6XFZ+tz43ZklD++lD/BGjlWQHmMCjDlZ9GnkuZKN?=
 =?us-ascii?Q?15CF0GwqXIk2DA7gLCQljEqiBBSRfm7bj9w3B227zf1gryfOsaC6R6eNPR0f?=
 =?us-ascii?Q?Tv76BZ1FzFMzUoomlEoyR8lF+aUrPPZ0agP0iPDmnKPjEVuSeFOeVM0SvNym?=
 =?us-ascii?Q?KX8456k+icDI7Z8d7EwNB7JMdX2THb64CJM4RJ5UOSaaOg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR01MB8293.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?VPx5BreLv+4jcZPB2szjpsiqubhhrWvU0r2rE8erXZnM2UYzQyKY/1ulmdfW?=
 =?us-ascii?Q?UJSItyi31GUESpvL2TKhLA2hj/yehs8kOFIVTvZbG9cftwIukOT1o8xn1ptM?=
 =?us-ascii?Q?g/4H0vxKfJjvA3i6mEgDtS9ctwJy4uA9MrxH4HFKI0Fn7NdGBSN+bEDskbHs?=
 =?us-ascii?Q?7u0Ik5bEz83pwX/pyiZSZtcNF6tL2PHIpHfV8teKrUyJWV1ToVBNa3RYK6/p?=
 =?us-ascii?Q?M4hT7bOCA3mM+6JTYGHI5eSeXHoIZtufbCRar0CVlpPDe1HZQUdDNA1bgfXp?=
 =?us-ascii?Q?EjIVJG+4vRRQyvSpxJoM3bIS7E2/K6ertgg3wU/ozudtyG8dP/JCbL3DtB2x?=
 =?us-ascii?Q?Uw3ERaOud2NlLVIdwn8FE3v0jeSqObiXntckyeAkV1OJQncHGT+CKANE3yqi?=
 =?us-ascii?Q?yqlYiWR4ioK2BbhZVNJcTyJaHqlkYmb1kA1yhZY9QiYYy+W2OrF4BN15KRCH?=
 =?us-ascii?Q?GIveTpzz6drsJCNKkkFrh3U90Vh8zX6phIgH1SeT2DdAgCGtz/1phdL3zWPb?=
 =?us-ascii?Q?R9LGdYf9AckGDBGoOi5MivLAdAvpZa7xpsgBIAN4KYy0mllpgxTcvtDLgn8r?=
 =?us-ascii?Q?v2M9u14x6CnrDjiCloSZGPdv4ct1Fvym/XziycA0vXHRDiEa6Lx/QVb6tqQM?=
 =?us-ascii?Q?zX8BJ8XbQ3MyKJ7Qug7CLgIXJx+RT6EVJWeEV0xh4ps18rcPgdV36CtzQW27?=
 =?us-ascii?Q?y2feay5ncvQDy6AZhh+OgXJzJxvoH2eFw8M2/olckwYUo7wgZIRLvnIIIbKG?=
 =?us-ascii?Q?nSzHN+d3RltopZDWgR00tSbW8d7oYuC/YYD+5idZNEUNuOKnT3L+Q+z92KQv?=
 =?us-ascii?Q?JQdECeqAA+ACtXx9ipuqg4hLx9g69h5QW2UWNDhVxtkWf0xMQKpll494zpkh?=
 =?us-ascii?Q?jI67F15GMk6LIeVTAqEqmHVQ6f/sEzzW74HXcBr2J15QkMWhdS77PWjUCfl/?=
 =?us-ascii?Q?NQGhnCgTsiIUhRETTxVN8B70Ugo4jT5aQRQ8py00vxYawJBjWI8kgIEccNDb?=
 =?us-ascii?Q?Da+TrHXSjeXY3X37ZLUgoJuUPulALa0dpF0HjR2caJWZXIM6jROqS6QhbvNs?=
 =?us-ascii?Q?hwAouPZHfJPJpQhC5cR79ZiV5oG4CHkaFhsV6UUOc67CLvDD1O+kuDIqLetY?=
 =?us-ascii?Q?CpHvkWW5AeTetrC/undZNSt9zDnbYl5Kgq5wd2qN7QXJgONvPbcwNySJV43K?=
 =?us-ascii?Q?2FOF5JDs0qBZjybEPPJ+3LnxsB2qreMYrtxRsC3BZn1jmls6O8vXRCq0YYz9?=
 =?us-ascii?Q?nUyWyh9HEvmv1Ep9iaBOgDcKcMKZXU/odb+9TKDrVPmZ3s/uUGToEEZZt5Yb?=
 =?us-ascii?Q?TDqIqs2jBWBY0jgkLbWuEj9ghMJFvRL0uwylULN/+zgtA4qtOHQ2iU7vRRTW?=
 =?us-ascii?Q?oc7x0nUymVVFLSdABO44vvwMqOwESR7UhXKgdhOm/twn8UEQcfVfhCIx8aNp?=
 =?us-ascii?Q?t4uQnvlhCeKVPH2x/7IkNAw4ZZLPeHSTx6eyVSMnxHhbp2acRs165RJotmFV?=
 =?us-ascii?Q?LOg/MGi1JINPwa2/CreBTnD88KVkaEjEkDGaZJ6a6SZHaHlZN7/EI+ftklxw?=
 =?us-ascii?Q?+3VkxcAl10Mld7vjHCIK9uZWah0+JfOMKLLu8vMIftuIkQ3pP1Hh4J316Q7S?=
 =?us-ascii?Q?7g=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 064a86ef-d793-495b-81ae-08dcc8591e6a
X-MS-Exchange-CrossTenant-AuthSource: DU2PR01MB8293.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 18:33:46.8871
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: majvZbL5E1GUc6okZsJGbXpDuzXUTnWY+IDjn+3+2dcSu2CtSkTVbJJuwB5xcMUnJ0xXSE1uQY8cTwqbGi0mO+laH0vfcr3mwG9bd5hHAWU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR01MB8650
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Aug 2024 18:33:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203942

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

The pattern `-serial` matches also `-device usb-serial` and `virtio-serial`
which are not the desired parameter. This causes the serial console ttyS1 i=
s
missing and Systemd's getty@ttyS1 fails constantly.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu b/scripts/runqemu
index 69cd44864e..f350021258 100755
--- a/scripts/runqemu
+++ b/scripts/runqemu
@@ -1483,7 +1483,7 @@ to your build configuration.
         # If no serial or serialtcp options were specified, only ttyS0 is =
created
         # and sysvinit shows an error trying to enable ttyS1:
         #     INIT: Id "S1" respawning too fast: disabled for 5 minutes
-        serial_num =3D len(re.findall("-serial", self.qemu_opt))
+        serial_num =3D len(re.findall("(^| )-serial ", self.qemu_opt))
=20
         # Assume if the user passed serial options, they know what they wa=
nt
         # and pad to two devices
@@ -1503,7 +1503,7 @@ to your build configuration.
=20
                 self.qemu_opt +=3D " %s" % self.get("QB_SERIAL_OPT")
=20
-        serial_num =3D len(re.findall("-serial", self.qemu_opt))
+        serial_num =3D len(re.findall("(^| )-serial ", self.qemu_opt))
         if serial_num < 2:
             self.qemu_opt +=3D " -serial null"
=20
--=20
2.34.1


