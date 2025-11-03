Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2019CCCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.126])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15246.1762154815247262870
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:26:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=2W1Yf6mo;
 spf=pass (domain: navimatix.de, ip: 52.101.69.126, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pHrTLOb/0n/FzRbEDaDpXca3KpA/ry6vc/ctNWgN2x6sKSn3nALi3JEXe2GjznwKbLJw86kd3sYSwhsPnvHw8rCVYUcnEDN4ecgCRh6V84tXrbGeXeRmGO8xTKCUTvteUUUSAac+L11iFK4mRF2700sEgChnuekypjIr29GMQ3p9xpjIoa1vlkeM4WysyzItTYYcsfCTeS+FP3yOOgI+bgT1COc3jOw0tbtV3t6NkC2w6t1yZQ6hP0sc2z+djgVUImRKwwi552bVWrsOoTrZU9Eydj4uwSAD18u+B3l14qzBYjOKus6Cy96e5i6FGNZdeS61VM53k5+TiapUNDOK/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nUsjRs1MTspyFYsjtPE1DNviFGWrDgfhhVGzd1MesEE=;
 b=fuHzYnARAK+kWyfGBEdIm8G4e8ve+Ecol/TLrR5P1FWg9zjPB+0a3cVhE3gelFhyXERl3UNQdg6LFV4VhfZOjjNo7gimeBZtb9cYGZE7yfY88bpZpkh9GXW1Z0p0DleXKLZUG4XFDb5vAW7Q8/oIbNFHicqvr/8y30eZI4IgtXX4Np2P3HyDqzlD+UPhWsGprFVUaXgVe4ObP2p660XQvZp4o7tam+eAUKgdZmg/lvRu4M1JXqHRjYvKH7Ivk1FZ1TRaYznMdhcYsbL0F2bVrFYFbZLoAD3Igs7y8nCsC7wqTnDnsAokN92vreofqHap3KyAoJpfuVnm5aHDfyLp5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nUsjRs1MTspyFYsjtPE1DNviFGWrDgfhhVGzd1MesEE=;
 b=2W1Yf6moMWyFfqyyEnictw4NwoO2j+ZhmIBjSSrulbKCaSbFNljfeO9y+qr6vGmcXYdrc4WDK63jRJPI8w2QP6NQsa84Y+8bJ9GBj6Amxycw4WL+/UrkNN/xpYbmoX8o8XS3WlnON1N6f9EDFnv8c0TWPfwvjCxGwFmY9qOljPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:26:56 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:26:56 +0000
Date: Mon, 3 Nov 2025 08:26:55 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 03/18] python3-pygobject: Use SRC_URI from gnomebase
Message-ID: <bec5466d6ba8633810148122642b7658bbc2cdc6.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0322.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:87::16) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: 49713d52-5c15-4c63-80b0-08de1aaa5e66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?eDCyHwVMXU8XJTXeCS3iFL6YsqbbZ7wuX69wj/uyRjonE5ro5fswnFRn5vi8?=
 =?us-ascii?Q?AKGqR1C+Zue2UVOTh/nFozugePrbzhuFmPn4iMZuxRaOZQCvkUY9bjwUvItL?=
 =?us-ascii?Q?woEeswvUqqOYI6rN5stUCDOw3naf8uF5umoofkWgxTWXLXp3bbm/vPGJRj+T?=
 =?us-ascii?Q?tXq+xqJUEpQuCVX2CuC3DFKrXjlGyUDA4wjSGxchjfuJcTCtRM4BYTS/p6kc?=
 =?us-ascii?Q?D/LSTzt2gWWQViiSjrK9MJOpdXkrHm1dpG3MJ8pIBY9SJfcgNRewU6N8ascM?=
 =?us-ascii?Q?XPIRaBAw72nCm5OIuxNPHfFXvuDtzgzJdVA3BejXx/T20FWRwKRqF/1D97V4?=
 =?us-ascii?Q?XL4+mbM10IcjMnjG2lR0izG6yeKEtHhdbmbv2nLFa1sny4So50SXj8CYWxEi?=
 =?us-ascii?Q?Cr1ZTU8NDITu1vbkfbyLYpPoNBkLxLegL7QEKvYuuOTlXsr6TdCZ9MpEPDgG?=
 =?us-ascii?Q?8ud2F8Sk/8jB3Xjw1/LAUomRmFlN3atRiKT841lWD81ofUPKw2/Qo9nOHjbI?=
 =?us-ascii?Q?+hGFYIZa82unx9X7IcMXalLElykMk2Ktc9yoL9TVR0TAPwHrTDnAf6+spSsz?=
 =?us-ascii?Q?xGgM+Jq/5k5yvf8m/QuSET8A4E+zung/I3MWzbgla6wra5SV78DQU+Mj2eUS?=
 =?us-ascii?Q?qyT2HX/qJ4KvD30hCWZaugtOmICxSVfCfaold5V0TQbDTNAmnAe7uC/QVB1j?=
 =?us-ascii?Q?7Ro95EdHmzdGlTk8fKr0ynxN3wIKffcxzq68VnJ467VZAYQzk+Rd9+jzKih6?=
 =?us-ascii?Q?IOSPWCQrqnMKBS/xGB6t4Cbkp8a60GzNr6OB35XxVgfwL1YKhAfFuuUPoTry?=
 =?us-ascii?Q?LMxi6fpsH+F+7UKwpTUcD30/z3z7rZvTLRoV/58jn9Xb/S5EnUsK0AR5JUdp?=
 =?us-ascii?Q?2ythULjTrxAm3pK9xf0Jok02wa9y4YLAOrB7PDNV0dL/3TLACku2PrJVUq6T?=
 =?us-ascii?Q?fymmBcfE1RN/zpftKxy+e83z4oEwVZYrcmnq5yalDQ6c/9V6BuYsl23r+Kqo?=
 =?us-ascii?Q?cIZ4LrNnjk3yFoyU9Li1luMaqLrvtT24h2Sxf14Q1RlfRgdur2C4myImVbO0?=
 =?us-ascii?Q?zX9iu7BfZbpc7W1ukjmrQIIe7YNQmPHymtvgs9klPPWuW31VIpfgHUDvqL/i?=
 =?us-ascii?Q?90HEUDxY1eiaNi0uY9i26CJSCZG+jNkM7xr1na3aaI92e4klfvk+iDEdeib5?=
 =?us-ascii?Q?Qt9fPbM2HXEbz1zwmVnxD3U/KTJHStEA5YdLcCGHVH85mE/4OJKD/M9I3AKV?=
 =?us-ascii?Q?o+OelKNNYY71/z+8f/f3fWZkFSbQDjxp+YDFKywddL+Bo0L2Ln/kFcFG9jIP?=
 =?us-ascii?Q?ypHr4MDrrjXgmKRtzeTy8FbSSNnYLZUcsv2WE7Z4fUho0lPtwxelvTT154Xu?=
 =?us-ascii?Q?jUYvGH2G7KRM5cnvPVuCZNpQB0bmTbIKH/fOXL7zYZP9e/TVC2DWl/gjUK7K?=
 =?us-ascii?Q?LvSJjvVwmIRRLG9G7OmccOY4XspbkgmF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?NhZmdHlDs2PFX6Ph4z7Tc1+U2Upa3OHKA0E+yhaMKr68NwXkTfq94iRYY0KI?=
 =?us-ascii?Q?tL9eUiJ+NL14O8tJCyKTMcZeZIb18tJ/bPXJcBT6j3/r+78WVkWKXc7Yp1wk?=
 =?us-ascii?Q?hsQTABnZsrmvgkwT4aCqOcfbRac0lzlUlkB0R1TE8zWu0caNY4m1hWMtos3J?=
 =?us-ascii?Q?5YTCP57IMGiYZ7r2WSzdMSV38D4/eN6K9erZyOZuXc+kGAqGGxnHC9/kgm3U?=
 =?us-ascii?Q?E7j3xPu6uVYrZi2/AvK7n35VOH1zIGteheu+2Lc1W0V+TpEZtI18d8ucDO3q?=
 =?us-ascii?Q?EfRsUgQ2vodsxGiuRnuN74nxqBZT5Jf980GU6g3wiQLUUdKKTHu/tuUjTNKr?=
 =?us-ascii?Q?LISryuvUwxfz2ZHIQ1OaeaVLEHRvhFB7DC2IHz5p+LBRkYyA/PDV2C1SRJAU?=
 =?us-ascii?Q?3PYxBzs/SEwOsZ5psHVIotHqJs1CgI2E3BCDEef/VPd1JPGYqKD+K3iIjLi5?=
 =?us-ascii?Q?4lxpOm07utrAA2/KwTE14rPuYsM/c0Qxd3na5w7b/8Vzya6mPGODy6eVtyLg?=
 =?us-ascii?Q?n8Lk0+EsG9ZnKNHd8Cc/WBO4spvmFDv90/EBjGLDTdZKzQJqH/vluM06k2K3?=
 =?us-ascii?Q?B3gyq4pVktyJswwU05dWBfkbcsL6wWJ0712LuCiLEvy3sBhy8KHf4XMestV5?=
 =?us-ascii?Q?/oLgkQ39N5hSd79tJa3JO6ZrF5OVb2WBvyWHnCx7Iv/6KgwW3BS0J/LQYhix?=
 =?us-ascii?Q?fddLez88QCg6LYRfEg5gUyEl195Hzq8EOnFQkdfRq80JTJ4P2iLh9scso6d9?=
 =?us-ascii?Q?sCJSr+cUb9wOyD9lU7LNgwaTXW5bsqWRSiYDqdcpViXDDTtCEbhk+7rKKKuT?=
 =?us-ascii?Q?zA+U8Abw7whChXK0q9pIa6M5RltPeRN+ODPW6biviVlUJ+nkdMcrXdERncsl?=
 =?us-ascii?Q?3UwE3+ukTvnFRsUwLqXJV9PVMgPcJpqv8uUkNX0rRTTJK8BkXZGmmjJC/dia?=
 =?us-ascii?Q?DndPJTdIivoijjB+qYdidd9M2Pjm4ir9tgVk7eYkVgh85Gwc6u8YgCyVuRRf?=
 =?us-ascii?Q?JT4FHKgYH8gBK/hlDiPQceDOWlszzOXKcnglRWchZ/7hQTAT9ps8cqgndEqA?=
 =?us-ascii?Q?4xWHYPAsdToZkDPJRg4VpK0Sm12gGr2lHcqHkO1s1fpk4ZkLdjAbDkPY2GAN?=
 =?us-ascii?Q?Nmuq8+bYfdotOEu8GdDzrQ2jgeUYarqoW6OEab1e/BchfOSJXeyEn/O/xIxR?=
 =?us-ascii?Q?qr/a+S6dnkwT8KDNBJ8zN4ksYcWYTFij8wK7wJkwM82A2IhaVqm605GrUu0F?=
 =?us-ascii?Q?g7QVYtApo8bddec9AsjN1YRjrqU2Y5CGyWRXA/hmMOoDSqVOmK3tmFllzKjt?=
 =?us-ascii?Q?BlDG5ad5b0oJu7H97L7cYZUpTepK1CKfoyhOwAlRnbTlldW7YJm4muqwfR/R?=
 =?us-ascii?Q?aqe3UlBtBWwS/m9V1PzlAV6nzb0xmUB0uj3PtEcbu+ygK3nhmbhDqlsixzuH?=
 =?us-ascii?Q?wQqDVu5+O9/lgWMmZWT3dTLXCdfrbgXf0+3hE3YnhTdQfgfjeRzJrk6qY8aU?=
 =?us-ascii?Q?aw9yLHhjcDXFT8JBgehm/0zBhOzfRJCwM/oonaiA6rV22NuvoHwczDOR6NIz?=
 =?us-ascii?Q?xYyJsvR96T+q4xQ76F+ue1pJ757jOGibLFWK0gT56YEZ+658R160DrsI6TGd?=
 =?us-ascii?Q?jQ=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 49713d52-5c15-4c63-80b0-08de1aaa5e66
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:26:56.5261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kTT3GqaVi1U8pWnhqv6S6WEEEKY5e4p3AWy7ijbZHF7564wuVOyYqrGhed3TBqq6K61LanYlMF+mOzGsjLO4r8E6LofaxikLGS50wBuZ9nM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225594

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-devtools/python/python3-pygobject_3.52.3.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb b/met=
a/recipes-devtools/python/python3-pygobject_3.52.3.bb
index 42b071ca08..ae81f1e31f 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.52.3.bb
@@ -16,12 +16,12 @@ python() {
=20
 DEPENDS +=3D "python3 glib-2.0"
=20
-SRCNAME =3D "pygobject"
+GNOME_COMPRESS_TYPE =3D "gz"
+GNOMEBN =3D "pygobject"
=20
-SRC_URI =3D "http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_ve=
rdir("${PV}")}/${SRCNAME}-${PV}.tar.gz"
-SRC_URI[sha256sum] =3D "00e427d291e957462a8fad659a9f9c8be776ff82a8b76bdf40=
2f1eaeec086d82"
+SRC_URI[archive.sha256sum] =3D "00e427d291e957462a8fad659a9f9c8be776ff82a8=
b76bdf402f1eaeec086d82"
=20
-S =3D "${UNPACKDIR}/${SRCNAME}-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 PACKAGECONFIG ??=3D "${@bb.utils.contains_any('DISTRO_FEATURES', [ 'direct=
fb', 'wayland', 'x11' ], 'cairo', '', d)}"
=20
--=20
2.51.0


