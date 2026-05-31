Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEFECD6E52
	for <webhook@archiver.kernel.org>; Sun, 31 May 2026 13:31:17 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.77])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7267.1780234267395745862
 for <openembedded-core@lists.openembedded.org>;
 Sun, 31 May 2026 06:31:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=l9DBQzYD;
 spf=pass (domain: navimatix.de, ip: 40.107.130.77, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FplY79CxJY/vLk04aqAH08hGL4Tr2BI3xkD7oqqqJ9iNm7tzmyiH+sQhh7arLJmqMPhrLjUCy4hY1T5thj5/znEV/NX/MBjWBnmNPQio6dDGkRLvrt5+SPYLxqV96LmHMuxxbF+RAtEG5xuKAsWOIkOor9nGfoH8xa7h7yid39llmfZ3jSMH15uj/yb35OzRthYQH+/1vcDKUjnz8tmZ502bKUbpZwtZ96xmvXiHlCVOCx69MW6k3MdXYO/G0BgpmM/SP9wOcJbYPoMO9TG+zSgOlIiFaUHWdA5iG+Im0+0ELTcHiPo6fr2dVYyRNB8DqdN6xVEEOysxxnz2Sf/wZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNLAL5WwqvMmNsv+R9SjiZwpHK9gM/eWGYvp4SGPc1Q=;
 b=EjtRy4AyuBsGLnFCYnjI5HIjGNxE9CRb0fwh1+OvK8lRklBH1iPbcvPvBOS2ianXTCDbTDBfa1OeBog0V4UAG4UOoIECreG6B76N05etqYNM44iLE/sfXCSoxURo12SnYsNMinNzAuYZaW8rpOrxxbwBtnDp25Opnj3OTP4fPpn9t4Jr6iliG07EG237lOittRzu5Xtaw0LmKgKMMbgijriIK5gIzzvtHWlm6T9aLToBNXhRh2DO4wm004ZsbPPNPF1kqIJIdn+oaewoAop3pMoMD0bhPhjCi9dbKOZKCcWYrqzHbkdU5DX3nhuE4w9SUcNheT3unnoYLlqBqNIIbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNLAL5WwqvMmNsv+R9SjiZwpHK9gM/eWGYvp4SGPc1Q=;
 b=l9DBQzYDc+bMl5UBgHtCd+W1OLqKXXLCnwEEjFNFk94B/N+zKQKd6EtVIa7bWfRkQevws+J4Pb2XFh1EgaD3KOil+mjronWS6uzpWUCpiGSdHrcFop7g/052po880hqFhocsZ5Erl4u+UD01dHQ5jyct/ONeTFcWyhQhyrRrmV0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DU2PR01MB8032.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:275::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sun, 31 May
 2026 13:31:02 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0071.014; Sun, 31 May 2026 13:31:02 +0000
Date: Sun, 31 May 2026 15:31:01 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH] net-tools: Handle binmerge
Message-ID: <b1e118bc99ecb5716774ea8f973d646c9e6a0802.1780234260.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0454.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::29) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|DU2PR01MB8032:EE_
X-MS-Office365-Filtering-Correlation-Id: ad56aa3f-42b4-4202-397c-08debf18dc0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|18002099003|6133799003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	F6GWLYd1p0nZwFpQdbgRCuzJpvaNpcc8F1jmmiUrk8GCDOiEh4GCoCr7OEPSinaEvzcMB/mUxRYuHXpwMo42Y2cbQ34F27ROg7iuZJ3OklOe2Ga5xIr3CZIzcO3c5H8TFkcP3vVA4j+iQB1WrvDsL4RvbvBzMVHx4P+BJ9QsXPuClp6MOtzbkU47d0AacNNIG/Q53K845DucG8T/LgSz9NE6d/hjdALW4udHBGcHjwPMO6ywDQCV9KPAvFCKjct2PqO406dMQ8EVVQmSr512QeQNfPWA6yNxceQTg2+8YuKC4oxNMRVBFhB5djoQAkR+tqaxwfe0/DozvPqHW78xSHSBuXXDnlFDjoUpOzDe8CZbUQI3qRNMRbQgXNOAXjI4xUoA2vAWNN0wHaajEJcA8ffzFMkkh+1V1fDdSf6v/7BsSG1xvoAOC1VXcqRB8q8hbRM9uXZ7AgN8iuPuVsrvMd1MKTvZ+qym649djUGEs+bN/MNyZQAKycfPePZqO0f39dqi4f43UIXwtpoF5m7vePpkhqk4sKdviX5Y5s86du3JnXkL0rFIz0Q99IY2z+a2417KAvWRecR11ZcfpKsgM8O8t8Pk08n9v59mKriGO4DrN+5aQZi9HTi2Dgok5TFCb5+W6Kr7g1wrgbqU5zUUEBSGjlgkbFyDxRZfTxr7+RvqJjTQUmcVce0C3dnTJfAhQO1yKIc6zatRTdOlTavt0g==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(18002099003)(6133799003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?71tHvHJejhZGP0t1OZ3JzzUmKm//ton6LHrQNitFiJ4B4d10wgDEbaNukYSS?=
 =?us-ascii?Q?uq4IB+Z9SELjRrXlQe9vMbCXpE5OYJSH1bb7oD72RC5UF8E0zTF1hSE/p1UK?=
 =?us-ascii?Q?GIbmNze/4QOs//lvC1wofcwCVRBiSP91qKnI/3+Qshvo+EsVRMaWL/+jjies?=
 =?us-ascii?Q?qVBMcRxsexqsjqRfCJN5A7GfxNp3Rwk5dxg/RPsP9qD9urcEELXlR4nUGN7V?=
 =?us-ascii?Q?23x0rdsJt5PR6FTwRlCsI9dipki6Ty2HonsdBcbc01S23RTb8ru74+Y7W5XK?=
 =?us-ascii?Q?jYLBdD9jYd3JZ2nzl0wieE5Zszo4KCKpwrfnt++CQHz7AUx8ySKx4Hg5SXNv?=
 =?us-ascii?Q?VjU/JKC/zdxoJwLYHDxTpu8ZUk6ZS20h75iHs6vaQFAyNYjVM7u014qaWtCH?=
 =?us-ascii?Q?lXrsRBBIBwdwJXUTOdIcJAJpnBQ70DgI8oZCGVPZftvAYmx2O3rgRbX4Qlt/?=
 =?us-ascii?Q?eeDSbfWLjsj6GaY7cdwS7sYt1+4LWfvmB6cUHCfhk27G6SGjv6M6WaZDe2MH?=
 =?us-ascii?Q?vzQ2Gl2FeNI+/gxiq2L+rj6TycWJs8F5z1Dp4Z84T46NQ9KN3ePa7op06E4B?=
 =?us-ascii?Q?X88D3GfZMJ5twDc9VxK2o7KLkAYy/7HiZwv19qOKuCnqcgl7W3v99svO4S1l?=
 =?us-ascii?Q?ryI7cT8sZlmvbxbdWAED566HBn7hBbtZWTieiL+7U0m/t3N+l77q5nO8rCxF?=
 =?us-ascii?Q?6PhdEJf1bacD9L6WtJe/BrFZOPuXla7qaWo40u/xYa15m/mlbmXL43viIwfs?=
 =?us-ascii?Q?M7NSxcntRVbhvU9sWSdH7VIyuGlKrCckcjpYZHOlFNc63AqL82wqZtQ378bm?=
 =?us-ascii?Q?8e7qkyZzI29PqzvIuzEX372PqEs2aeDrBDu0rQUeEOKXwvv08h7C0YwmPUby?=
 =?us-ascii?Q?0dqul+aM7LObyu9IY4bvJxKGkLmljR6C1TkunhDCzrOGeq9HR7VObp5WvUnI?=
 =?us-ascii?Q?V7SZRUc06Rveu7RglpssMiiUbNYbG0abqciQysytsIXd06G1XQ015xOVVPMk?=
 =?us-ascii?Q?6pYkJ2ZgZ5S6HoTEBypUjUSskxJr5dPjbM9qzdEHX6441rkIAvJU2DI0ymnq?=
 =?us-ascii?Q?DlnTR6jeUJncHfxj8BTr1Xp+ZMtwaqzRo6dSri59+TBP4khqdsHZyApu56Dd?=
 =?us-ascii?Q?iCS2ZQw6sBbI2gGhY9yss2qUzlnRD99OkN/kA2YooPKaUNf0Rk7qocJdztfN?=
 =?us-ascii?Q?qR7xiKiWKwEHsMOcRjJ8lWM21kvJE9fb9CNKOtVqHoEe/Vw2Un/b642bKwsZ?=
 =?us-ascii?Q?MO7F740nXKvKBEHOErLIdhV+Ogytsv5ZF5Od3bKKT3UBq9d8aZtak1a9dAYA?=
 =?us-ascii?Q?JFN538HLefq8PApkKIO6Pi5aQDyQ+T8Dbzx2nxbH0m4YUSOtH2DlxfAUzvVw?=
 =?us-ascii?Q?+NSDciUkHuSb3UGrzK5sLV0vrD863+yDjx4OvYwDMDlF/WWHCKyd0Lsrqz9d?=
 =?us-ascii?Q?TEiEHgp78lLI4nASO3G8Lbia/tdG/q8NGvDHO5CCiZHSIt2UGowZtNmTG5f9?=
 =?us-ascii?Q?+RV91w3aRyx++PflXI0YegFByj6xUMLHNTm3gU05BkQeh77fkl+DqQfgE8Ci?=
 =?us-ascii?Q?57hZ5NLy7XCB4X6UhRsuGLTpFTk1bI8RTNyU7NakqaJaubj2wgjyjBQqZM7B?=
 =?us-ascii?Q?lMvtLXYyopC//5EAOCOsho8Rrwm8TUJ9VqgKaMp4NC7zUys8h6zHslBJ5Ik0?=
 =?us-ascii?Q?E2T/KK+EuBC8aas/xfCXxeuEK9sHtH2GpTEDkmRvE75w9N+LsTJfjXtYfqgw?=
 =?us-ascii?Q?acYXa8StJmvoLgRR5+DcXuaifRlES/0=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: ad56aa3f-42b4-4202-397c-08debf18dc0c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 May 2026 13:31:02.6349
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgSN/R4zo5EWqEqis/HMaywONt1wfo1ThgRvpCTc2LoM/wo2NzOB1IMivvqSHJFOMycW6iQUqkwuqVeq5m3RyT8EF0cyGbXzMO7oPuco82c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR01MB8032
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 31 May 2026 13:31:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237794

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

If $base_sbindir =3D $base_bindir the sbindir already exists.

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/net-tools/net-tools_2.10.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/net-tools/net-tools_2.10.bb b/meta/recip=
es-extended/net-tools/net-tools_2.10.bb
index 6c8297ba39..a21916fb26 100644
--- a/meta/recipes-extended/net-tools/net-tools_2.10.bb
+++ b/meta/recipes-extended/net-tools/net-tools_2.10.bb
@@ -73,7 +73,7 @@ do_install() {
 		rmdir ${D}/bin
 	fi
 	if [ "${base_sbindir}" !=3D "/sbin" ]; then
-		mkdir ${D}/${base_sbindir}
+		mkdir -p ${D}${base_sbindir}
 		mv ${D}/sbin/* ${D}/${base_sbindir}/
 		rmdir ${D}/sbin
 	fi
--=20
2.53.0


