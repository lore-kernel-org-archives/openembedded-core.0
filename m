Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 067BECD6E79
	for <webhook@archiver.kernel.org>; Mon,  8 Jun 2026 16:54:46 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.84])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.59605.1780937680759136544
 for <openembedded-core@lists.openembedded.org>;
 Mon, 08 Jun 2026 09:54:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=LrqBQzRl;
 spf=pass (domain: navimatix.de, ip: 52.101.72.84, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8wMy+So5DdgaEWGsjyUMAmDkWQb8Q882BoEizJybqV6Tg/++SyCudTdORQHp74Urkq2eUFin2GSAICBv4KsPBeiHdKRKVZcdtoapFnEziGZPat6Sqs16tO71Qc8E3pMxiCtB5yGVS8YFRsudn70F+epFr6QRvq+nG/V5OXGZPBW0y6q+bBCMDK92UT59OBeIqkxmjYOMiYwqXSgbpSRS2DEgbzXq8P5rFSOfKpZLh32wILv8CJMJv8leYEeQFflf3ak1LlbBzgiYQY4YT38Xp5aKPQ+CCpP6c+pvh0d+2xCufdepfsNz2FGPkXKUvZ2E1xj8itfVYExcXd4kerU6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/d0BchwhbRJ7CxCYU7Ic4OFWHLsR0bqAkpzkpS4GQ8=;
 b=huagO3BVAEEHQTILFxMJSzfuzv3EsKEOFy8VMfNH6BLPHfrNmmp0vc/AtA48u8PeOvpuJt+k+mpN8r9fy9sfqFOOTkJ8MkJpUeNFexj27NAZ4hoxao9kRg3m59xV/31aSd5gnhuzYBljj6vMfkAu6gipQC0vWa1K5FmYhjIDG+lRJZR6hdfposl07YTuJhuFnthu/Jw+/EarFaWpRzwjScqCVwcEhnp/WG+y0LxuE1TA8UpgaA3zIMsNIvEy7+xjr1v31rNRaNJCGSh5THUa7GmhmsczAQsGxpHPQJciejxgDqUA2hXwv2ObQyBTJXnooKiXbFIwxneZYGRowhUz3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/d0BchwhbRJ7CxCYU7Ic4OFWHLsR0bqAkpzkpS4GQ8=;
 b=LrqBQzRlqFDbS9rvZq4ITelP253PhqMURmGTPXfa9FlwvWar2s4OTKPyEAPjxnbiEiBqIgui+BZreSsr617i+ovXbrAiYAsOhjsG1IKyhc0fA85n4soX6hXscSmTckExB55oYPfmgAlB88dRxSpKR0atjMzMoeiawVvB94agVYQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by VI2PR01MB10877.eurprd01.prod.exchangelabs.com
 (2603:10a6:800:275::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 16:54:31 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0092.011; Mon, 8 Jun 2026 16:54:31 +0000
Date: Mon, 8 Jun 2026 18:54:29 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de, 
	AHoemig@datus.com
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] rpcbind: Modify socket file only, if systemd is used
Message-ID: <921b2852784f105d6ca5c8a754f87a68f2ecb4f3.1780937668.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0480.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7e::7) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|VI2PR01MB10877:EE_
X-MS-Office365-Filtering-Correlation-Id: 69608ab3-322c-49e5-05bc-08dec57e9c0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	6yMQHw0zA+kpxz7YinVKx6w+//KgY2LYSWCPNUlY/MDyziWTznmwzdECZdeUCvPEoEipA+1WUO7hUEYZ3ivIE5+s7N9f+X/BGkP3mFV8Yp2yHphA53mkyDhuJNaXwyucW8tHGBHgi3kB+yF5uE71n10NBJm9P5yi3hnEBJuRNV8rJsZ30O7hrPNPFuyWoseVIw/lUjRfRenqUjllvLPDScWo8yWI1mCYBpxZjec3e+CoLsppVlh51GnUTe71ci23CgNRojISIsSPjHN3Q39UIUiHhFh3UGfFi4VIEi6qyFr2Q5rpWADjOfR6blmxitYSElxEkhxaQ1b0GaA5qTLLPIojZdW7dyjkvN6XrmBpXx0Qi2ZpRILUzPFnwo4dcidBpDQEg3R3m7H9j6L/AfpUNAAGMj/SChRHwcsCFlj7tCu7CLZFW8bllf7+4EP5kh+J9m9pQR4v2CHrIWhcimKTRTlxhOca4mY0X/V4vjiVuwEh1YGn23zrNg34rCAOY1WqpGYX1/CrE1kgyvfanpk8gTPuCMwKFeeOEFH2VF2rDpGZRPfzFt5G5szliwOyUFrzQx+2VpLTrI+xe0yOIJ1L9LzA8D2kCHMJDzk2KiNHwe43F8YJ5WKTp1k/d/kSDyI/RjLlxMWvDy1fPP10gKStI4CqFlBZ4+mnfBODtyUDnh+XtMzSzHvh/lT4g0ZDaD33
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Z/F3InBm6Lc1GuFDpfpjIsjZPdPWZSkO/Njm6Qmfg6HUXBDvvhQveaXnPISf?=
 =?us-ascii?Q?/L4T3JbB0xU2TpZ+X4TXHdTttDs0Sp0Rr8sgNaOYwRlptwhvbFkdD1Io96yD?=
 =?us-ascii?Q?YtV4sitAeFA5/ie5IXspfnyYDO/Xq9/TqY0GKz0/6EQEGqjodLHpubfHwx3Q?=
 =?us-ascii?Q?b7zPPXnhMHQguO+P6VnAabHO9RWSvrW3NRhm4BD6enFLdxAqIbgZ7icl/1QX?=
 =?us-ascii?Q?0YgQQfc0xYyk4SviB/mFxNVvD1fMPyep1M+QgofOhrxJEmWBL8YBN8phHsj2?=
 =?us-ascii?Q?gYOxvhofBreiaLShDR9h68oYL3wnrPUxoExmfPxfOWSKmIMG/IcfgnOZQ/zC?=
 =?us-ascii?Q?SdeOyd2/51E0s2kayge+1gRMt+josCKj/ICqGA7kA2XfVJDgghOJ+3FRuquG?=
 =?us-ascii?Q?D6bd5FMvsFrfPTqIbsaYKxnerJsMRz7jyizhPCTfH2ZoXJG/JeW1O36TKg/A?=
 =?us-ascii?Q?3Bj2BCoN3sjRPEaiPR2FW0cmGTioznx7DvWy5VUTntIyJTAKGX1gpUA0kYo6?=
 =?us-ascii?Q?Y4mPEds0vRqHoR0W6gr6P3eOTHL1HHRJoQZoxTITaq7QyYbMJ1224y2ctWYO?=
 =?us-ascii?Q?fwqnm0DpO9PufpPNglSODPtj9SdqPivjvU6mOYwyB26pvDE6X2+DGNWHK3Pz?=
 =?us-ascii?Q?IFTfx1h7nTwrtdvIcGxD0Rr11D2+EYz7W7GbhDM0ecrGexlMWjnPY+PFEz7M?=
 =?us-ascii?Q?wJg3DWzE+KatC4D4mulnHmJr6tKwUSLP1JpQYAGP09x3H1mS3WoCxtn14ZEq?=
 =?us-ascii?Q?Mem7h3Qu2FTVAOJe+ApcbJahAOgK5/5RlvqCenqvaBf2IgRUJLvzqGX/ESNf?=
 =?us-ascii?Q?wsoG8YlLd7pns3EQzltUk7/11bUdD/C6SFv1s/VoAT7fvdUM8EnC7t61UJZP?=
 =?us-ascii?Q?IQf7tiVYrlagQbXYDhPKqmaC+e2gahME3qPg/sbBYjnh1nLycbvtzzNwguus?=
 =?us-ascii?Q?jjSFPfaDMhIRaR2n/qoBpaUIhebiZUpN8iZLEkMKhW8uWfxKsgsnDkruiH+C?=
 =?us-ascii?Q?X/OoIGNK5kRye0LOK+MGHDjxuu2UPo0hAtWyA5S5vs7qOVqNBa3dX2mGZ0nw?=
 =?us-ascii?Q?BQYLIXeKrI/b3i7OJASF8F0Jn7ojMLWtv1zC7/HEIRtMGzSFb+IPTsWeVXTV?=
 =?us-ascii?Q?xZ0aPfOBwlj5+MzKc8Z1G53a9IzWhWRxGu5miGGgzbJxcqYQGGL1YPo2ysjk?=
 =?us-ascii?Q?B+dvnbtelU5MMWMA9EAcL6G+2MyLojcURIlFsyYRU2Tyj7Zuyqlyu316X29Y?=
 =?us-ascii?Q?f791ocrA3UfVtUhguwui/3mY+D/WD+CZhyEO7GLiS/npLdhi6gVsWRBWK48N?=
 =?us-ascii?Q?GBkqSo6TNwjuMMayBYMK3waE8lUjX4ZOGwnP18bAoX1E8HN306AAlnaHN2hd?=
 =?us-ascii?Q?VNm1EJjgBoWnuqspAnZNVxvPUgxlnvyw1QIn33gjAN9v0xPPmOz75uxmDZCQ?=
 =?us-ascii?Q?547nm7rHylP6zAEEkT/1l3WLHjkU5AOo0ttg5Et3GJkXZTYeAYS3SjZCuxeM?=
 =?us-ascii?Q?98addwkhisqeG879MI8bJa8wEHnoVm13gVJzc2iyyznRCQ+cxp6PxCRaX6O2?=
 =?us-ascii?Q?rhrrFk+S5aYODsXbH1bColJ4WAgP2Ua2vJkoV4TYIiO4yEWbDbwfCfQe1w2x?=
 =?us-ascii?Q?hftKyhfsBUAApR8GdN33WD7LNkEwU3ln7gSfm5REVI6Yf+MzeIkoBS57GMyp?=
 =?us-ascii?Q?wqz1Sc6do/jo5GmcYOXbLdk590WjUo1CZWJmVSdRl/DU0SQSM/yqnZFzHWal?=
 =?us-ascii?Q?IKTajDA5GAJSNZZuUmqNv2DI7kRYKZk=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 69608ab3-322c-49e5-05bc-08dec57e9c0d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 16:54:31.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xpmpL7UfmQ/KIBOMWX+UEmCoIPdqw8A5Mo8T2lxY7oJuzwx8BDTGBUFOMJIuEHEq89UupMJMRUCFX+HWwtlfpOKVlxLHWt2P22PGBwibz7w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR01MB10877
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Jun 2026 16:54:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238252

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Fixes: bee29dc822c611 ("rpcbind: Remove IPv6 listener, if ipv6 not in DISTR=
O_FEATURES")
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb b/meta/recipes-=
extended/rpcbind/rpcbind_1.2.8.bb
index bd8ba1e88a..6604774c1f 100644
--- a/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
+++ b/meta/recipes-extended/rpcbind/rpcbind_1.2.8.bb
@@ -55,7 +55,8 @@ do_install:append () {
 	install -d ${D}${systemd_system_unitdir}/rpcbind.service.d
 	install -m 0644 ${UNPACKDIR}/rpcbind.systemd ${D}${systemd_system_unitdir=
}/rpcbind.service.d/rpcbind.conf
=20
-	if ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)}
+	if ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'false', d)=
} \
+		&& ! ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'true', 'false', d)=
}
 	then
 		sed -i '/^Listen.*=3D\[.*\]/s/^/# /' ${D}${systemd_system_unitdir}/*.soc=
ket
 	fi
--=20
2.53.0


