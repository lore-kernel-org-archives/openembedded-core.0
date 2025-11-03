Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23F82CCFA06
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:26:58 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15246.1762154815247262870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:26:57 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=BSZ3e7n6;
 spf=pass (domain: navimatix.de, ip: 52.101.69.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N27KnZr65p1brN4o+ZAK59VUO8k8zFg5ledSwg37Cafz+8ZIxhBTdhdaNa3K+gryniSttYeXR5quvewc0Nh3b1vk13QGCftm5ZziJm3u/ZSe75BG7SO72aBd7niVqu/CxHYfsoGiWZEPXsC4u2GtHv91NsmXnocc07x70/NR6i9ZwctYQMbdFbV6c9TfAvQrkwxL357Fs8FRT2aDQ5w+5yWm/FEgx/40dIdjUlpjbh6X0HFdf0qY771xLf8pr/saOFyi4JcKe967VDBJ3nbiLRKtj6902wT44yyJv5zxMQ6TR+XBUB8iu9ZP6VR5D0XxFvw+eXZIxVeIl9MBowX3Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZgzUHCnkTe0Ex97CfEMgKg9QVfRSopKTqzwHBr/z2jo=;
 b=XMf4xjSG1ks9bTSDyAKHRGwUAqiFYtWBiXRjKOTc/m68fyntwYJ5kMBE+aUm1oOS0yDA4baK1ClPjg07m6FuQoWmuxaQ4ifmLueVNuUqTdSHlN0p+DUXWdYxKC3HbplDtz8psgXucxIOKjl0t5oHmkOM1Cov9Gdnx/645kpYQ3byDajl3439AxnYab69f24crZxCU/AkpKkQj0WaTDf86Llg5pEI8z2lD5Q6In68J7eRAju4B5jcWsUanPXMn7pteT6EJWI9wVOeE7vZFr9on7akS3sjOj/SVQ7p/LuY6oMMN0wO8kBEdgZ7UMb+uPVWcuJeE3e56aEm3nlAIro4lQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZgzUHCnkTe0Ex97CfEMgKg9QVfRSopKTqzwHBr/z2jo=;
 b=BSZ3e7n6kk1T2Y4e0QJD7qxMZ1wK+XmsRv6WayrWxOWZkY5kCIMMIA35UuG264OpCi5jd6Pa/0//hkD7Z4E9zzaidJeLD35Dnvcmb/RCGUu1PAVTxoMYcAK54OaF/2bfXzgolfIjwcpLi/lPe7eNF8coPQW86fJssTyTeAPHeGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:26:52 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:26:52 +0000
Date: Mon, 3 Nov 2025 08:26:51 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 01/18] libgudev: Remove UPSTREAM_CHECK_URI; not needed
Message-ID: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251103072622.1296182-1-joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0288.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8a::12) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: c976b46f-0435-45d3-d29d-08de1aaa5c1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?qlrpLozPknLfXxDig9ZoUnkB5IN2U58I/UKVtsMC3H9pcWgt/Km3aAU9lQZp?=
 =?us-ascii?Q?tiIP4F8hJYtkQ72Xz6AT4P2gQ660DVVEYNMptiknkTC9viuwQ+SnTqv3mO8G?=
 =?us-ascii?Q?37LJ8sf3H+d4FA88xCsiZtjt5tx5ZrhKp6g/+SjmdQqRMOeIJF7xhao0/PAd?=
 =?us-ascii?Q?6c2kPVOawCgCMjlwbNW/6Sb3ZGAXsevIUUfMoRgMQXTHx6Eu/iRYDdGNJaJp?=
 =?us-ascii?Q?c6N8PhnSU2/qFaMsfS3XYc1866lvl0p+poz6NpEZiFDTsw17cbFGMmfCfwxr?=
 =?us-ascii?Q?x9+sOcOSXTXJNdF60zTJ4rG5PIwsNZVwnz0Tomqj6+sbS33G9VxSfygCYd2I?=
 =?us-ascii?Q?yg9Ah48xAJwQnQpdN9/HlveOSwxqkIZ8tJ2kmtyJvltfLXswwKAhH+uEnSad?=
 =?us-ascii?Q?UL1Ja7/zdPs7vFgpbV9dcpbhRYC2va9dN+F+Tuom7QZrT8dMPVRIUgvJBbi+?=
 =?us-ascii?Q?5laol9Ce8lzSo+MqkMdhf7VOhs2v/TdBA+7MRQ4eyyeVB1dkl3q/tiRxqc6p?=
 =?us-ascii?Q?rCHrXInSVaMxL2Dp6jMX80K6oC8y1MhGcb73ioeAH3W+jGewdhRTfe4NwsuN?=
 =?us-ascii?Q?jJx19+uSkP+x2i42v18vsCrAE7nf71FVzgdRgfdpb9raCXIPlzBZhrAif2Id?=
 =?us-ascii?Q?D1gWqPjH0m/C9ODEjfdFJgEe/DdlL8WbWA5mqhTnJN9YoskgcSEAeeLKk1rR?=
 =?us-ascii?Q?T8ATOK4J+XbGgONFwpVceH2bBcNdvWdVpL7ajh4NgDoKnaeY85vGK5E31Zy8?=
 =?us-ascii?Q?GQBnVqGyqbNgQRNxt8oZhIuF4hvP9ZBfYNbSF36DbXwJOdU8xoaehk/BhSMf?=
 =?us-ascii?Q?LyJl1mRxonQ2Eh62dKqbhxDR2IdeSMYCDlHTNEBGtLM4vAbOw+M7/Z6nTAY8?=
 =?us-ascii?Q?Z6IPR4at4x8Evduyj7plJHC2L0TDKcaw/aW/Mh1JY0c91RsN1ZeYIklYrxjw?=
 =?us-ascii?Q?YKegcQmgJdkPkuj5PA9BDS13J1vWFZEyXOKEHVjInPlV0q8Jm7l88o0z6uVv?=
 =?us-ascii?Q?0wQqtAysMn7ocfPcTQeccf7b58nzodaPc+l6L0QMqQYik9X4mtpE0jTeMNid?=
 =?us-ascii?Q?poHESf4DRlUCWTg2rHiBXc1oYbJHDeJciqYb/NpkekWp0uKyoF0zZKBFIYLe?=
 =?us-ascii?Q?wl5fXGcogIaTBSRqlHeThS4VhLjg2hl7hsECNFN3V7LzWPcWC6Bv6z+6iVO5?=
 =?us-ascii?Q?rK1monWbku1L76oCHBMhYYwpmtdZ9nRzKz3SXhoKcnvV7EMHLlw533bBGJNY?=
 =?us-ascii?Q?1NMgmSmXu3X4/db1rnyj2wFlivPAGIu8brEfM1tKrlbSAqaWx9ufnCAffwDa?=
 =?us-ascii?Q?Rk+N7fKoOGPSBmBVpQUH2MiM7jeRxM+vn/pHvHXQWU/o6JH9za8IzzYNKBna?=
 =?us-ascii?Q?3RSkPvJ+DAubOwurjP/pfVUkBElhPCkO7NnOaOiTuPHhMA+N/vWBUFmEtdLY?=
 =?us-ascii?Q?iI4xTDywUZCfcfG249MXsqAMFV4dIpoX?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?nCEembA4Xi2JzayiqVqKHU01O8aOH05LtkMh54KuBmIGObPrdBFzIKjsOx9v?=
 =?us-ascii?Q?YIvscZUIIz3y8TI1znhk9UlK951O77AjdD50LPXE4QHg87z/W3VD/edXB9Xh?=
 =?us-ascii?Q?FPE5Xf9mr7U8cvPEAAT6Em+ZKJP5riCWhKW6fjGAlLuxotx4vFIM93c2IE5w?=
 =?us-ascii?Q?OdR7QF++cXNOIP+QRZtRWY3FgwuxZ5oKvagchVWcAPljMGdEnmNVgQBvR8il?=
 =?us-ascii?Q?7A8osRALRy+ZRBr9SBo6gNDr/nTOkt91YXbr/Q6q6HoDc5+ogcxsKYhedc8J?=
 =?us-ascii?Q?A8kDyA+rSl3PTSP5sP0EJfVhtCp05HBVzASGDXxjUpS3/+Q8MNkeXh9cSsmm?=
 =?us-ascii?Q?iBMyxWMaO9TjWEkGNavUOKiaJw9lx+9b9Ptk44/lkizPtzD+akyr12Uarblj?=
 =?us-ascii?Q?KZ/55bDMKer+cleW6bJwMIbpqmwgJQhsKptjEeh2LRmlEsVYf1l2OiX82g1F?=
 =?us-ascii?Q?xrQCUTzOnRrzvTAfh5ihCcWduWkHPQxQwamUpDdWrgWHPgK35PVgpF0BF4bg?=
 =?us-ascii?Q?CcfQWQ1EtSP0D0FmMGMw9YjOI5OFSco8PFnIKacr3pykeDxDQsFPUKktAccn?=
 =?us-ascii?Q?Cptk3YNXGzGdDQ0Y48yvIPNtqlkSb9w9PZKMtCzsfZ5MG8fR3Pb/4DWOPrs1?=
 =?us-ascii?Q?TA0uh/f3kNgp4CbrhgTT1lSg+GpxEeU5+CGzxHl2ZQ3t5/iBnzX7LUMLRO2e?=
 =?us-ascii?Q?RCXKTqOK24ijLlEuIrLVwXL71NdLcQ4y3c6t/MTWQcl2v19Q6a93BL+9HFXT?=
 =?us-ascii?Q?QMzLY5LtztI41Smb/rKFiLxNJ9SBSlyhWETnjvUO8goaQeh5kkHD/1tXZmiD?=
 =?us-ascii?Q?4EZgNwo7VCmUnUcJQ49H9rTbkm0poESjX2zS17YlnFCbcI7mVPePZf9wKhyD?=
 =?us-ascii?Q?+bB+v9bk8laMervW9quYdTDRIVKd51LZpPUbS/gVByzdEL3j2yDgsaGOwQhP?=
 =?us-ascii?Q?mtsEPH5jA0r4fPbVxpKxrBoR5bG4gAk2LtQFhSq0tdb2dhSWrMG9fr6U0W/e?=
 =?us-ascii?Q?I34dqXQg5W7YFuSfYh+5Of45bURU68sirS+6uto1m1r0ZyGeLK0l+zSeNgeS?=
 =?us-ascii?Q?J94DVdSzqEeijDloZ6TXtbNZcafpSRlxkLs4WGynUVVj3AIedQnmNHKKSjvb?=
 =?us-ascii?Q?kCBO621Vky8NPEoykmsyyzpuVLDHhCkHrRokAD8OZ6quc3KJGkn5oWKF3iI7?=
 =?us-ascii?Q?YCmw7kqcIv/VrsytX+C1tUmIi+AUxDv+h/YRad9g6qZlbm/WU7fDd96G2SeH?=
 =?us-ascii?Q?0avrR/QGlI3Uy/PTFtEXBxEbXkwcFXvpm4yppJhg7JaZYkR8l2+ONPjQMjcT?=
 =?us-ascii?Q?sWyrXGJKe571oWr/0oe1wRXE/c9HjJfyUzpb7GglF9Uyk0p0h1HGFWGRrKVk?=
 =?us-ascii?Q?YvjvHE6hAhEO8u+oNYqbvioE8vE3U71vKCC2sFAca4mMS3NucLDbykRpR58k?=
 =?us-ascii?Q?UGu4wCtPAMogsoLTvktPZJAcgzGucfkTpsyhAQAXsWciZ6xkWNgQP/ZPAd2M?=
 =?us-ascii?Q?b6+uxjKWBXcA50EEfaujmgWhGp+TID2oixUvWF7los0c/tpjQKImiuR9mkE+?=
 =?us-ascii?Q?MgKCwPVEkSYNKai0H5k7FWBHMY95SNeybFU9qs/0POSl+MTjKoBGoO2+CBsb?=
 =?us-ascii?Q?jw=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c976b46f-0435-45d3-d29d-08de1aaa5c1c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:26:52.6882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0G77EcmtjmkeEwJOtG6TTrIO+Jzi50exkp9VdqWw0taR9d8nY8BcA8wXSkDVw3PM2Ivs1X1ZKaItCmEjeoa0tcIbMDjMZzorSE/KMe+xpo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:26:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225592

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/libgudev/libgudev_238.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-gnome/libgudev/libgudev_238.bb b/meta/recipes-gno=
me/libgudev/libgudev_238.bb
index f197f6421d..ff5017ade0 100644
--- a/meta/recipes-gnome/libgudev/libgudev_238.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_238.bb
@@ -23,9 +23,6 @@ GIR_MESON_DISABLE_FLAG =3D 'disabled'
=20
 GTKDOC_MESON_OPTION =3D "gtk_doc"
=20
-UPSTREAM_CHECK_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/libgudev/"
-UPSTREAM_CHECK_REGEX =3D "(?P<pver>(\d+))"
-
 EXTRA_OEMESON +=3D "-Dtests=3Ddisabled -Dvapi=3Ddisabled"
=20
 # This isn't a GNOME-style version do gnome_verdir fails. Just return the
--=20
2.51.0


