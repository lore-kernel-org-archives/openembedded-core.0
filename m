Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15A59CCF9F8
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 07:27:08 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.15411.1762154824888959459
 for <openembedded-core@lists.openembedded.org>;
 Sun, 02 Nov 2025 23:27:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=Gv3PGzqY;
 spf=pass (domain: navimatix.de, ip: 52.101.69.76, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NjThyFAiiwk9sbn/Y6LTEnghOCo0jyciZRPX6KptQURGHOdyg9yOndKfPv8G/MfPWWyImtgt97BhC0C4dkxuT09Rvfij2fIFxkqyRbtrazZ5wNwWMgIENc04IOfPKKj9TSio6qb5W4fXRCUqEGNfkSJBq7V+TwKyyE/vyAX0BUB1ARnuzs2FDs4qsr1CqWgEnLFokKY6t+fC8LpanJYm91O0pbLiUfNgiEzwXER3jgw/F9IFKcuLbDAStxtMUODWBNO60KSyOmyKJUWffknKuLu5ejivwZFFtAhCNw+k+udX6K7Nr+XGxS3OqAPGcqFMqTTTFs/ts+vh4b/PTxhogw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FUanXYnmIbwID2c1I9wYHlHT7jYn1CAHm3cYZcqcFao=;
 b=TMFKMI4qT3cwlA8KIsng8C+eni0ZivKm23tyrBCyHucThJZ4LDePRjdZgxEUdPCdwA7PUC4ojhNoAW9AZrfCkaSVg2KzlnkdsjU85GtZqGVB1l9GOYeLJ4t88FoQiHaiuHW9sy8YPGdwrti6pA7TTH6lOvkT7ZkwLBIR/DfoYv4GicjkrOJNwC9bR6CCOFBtvSNn8UZwPUGDMuE10JCNG2w6rYUUe47bXY+SKVRSPKguwaAA2dncWx1a7xRKEXlld5/ONKlt2IBSVeG7s4RFL9t/SZ658LPf14t6h/TRdqdqvEKKj5kMSXyRNohPoofatfvr3IR6NpRpMVgINlg47A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FUanXYnmIbwID2c1I9wYHlHT7jYn1CAHm3cYZcqcFao=;
 b=Gv3PGzqYZKiFjctLHAvPw/uTGnYPW6/LHhQfho9YLsicC14wOeCR4D9QWLPCQS4wcYy9fBb/ByOvZYUx90SLPVgZKBhYgYZLgwrqnC1zm2kvJyrbNcIoh9Hen2rWgvkRoPerF1kjJifDsLC1kesa9g26nc9vyM+lDBFxG57SKS8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by AS1PR01MB9155.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:4d5::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Mon, 3 Nov
 2025 07:27:02 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 07:27:02 +0000
Date: Mon, 3 Nov 2025 08:27:00 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, joerg.sommer@navimatix.de
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 06/18] gconf: Use SRC_URI from gnomebase
Message-ID: <f4433409cc0811227348ac22eb84a6f049bc1f20.1762154252.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <270455d31cdf073ffbc85ef7622e4b41bc10cb86.1762154252.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0468.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7f::24) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|AS1PR01MB9155:EE_
X-MS-Office365-Filtering-Correlation-Id: c66d98e8-0897-4f69-6961-08de1aaa61b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?VnLfqCEvDmER4Oy5zyRckAv3cjALJZepC9HsYGMYcLer0bO/Pc84t6hOTV/y?=
 =?us-ascii?Q?EE122HeERdNY2Al4FnC3GW72MK9fbIbA7b0FCN+E4fk7qpSrv+1dt3k/0qMX?=
 =?us-ascii?Q?CemPbXpb6nf+vWy0pV3q97acxJ6IzXNx/+Gp4GZxZhv3pLZFtmYxIqtpwJDv?=
 =?us-ascii?Q?za66pE4PZcszvvc+uf0/+KIuLP7eMCD7xUY5eiaiXIyjIVYLSMl2Ix5NpNu8?=
 =?us-ascii?Q?Aqt+ze3dL2XGanYhViJ8geoA0QFhpFIalCwQFy2+Ol+a0r24csDj9sA1c+cA?=
 =?us-ascii?Q?LVjewnkWezWuI49pML9il9G9IxuyQygztWTWtJruCA/Q+zYDX6eDOcxRb+n/?=
 =?us-ascii?Q?++7zQe30l8pQPjPFxaWYYc2Ha6kX+vr7kfUYI/1jUW+NbNXQnrYvOy9fbpB9?=
 =?us-ascii?Q?8DwOg6H9E3Jluc94gnHRvs3gnh0GCrGOc+BONYpd4+du/wvwyD0CZzPfUzmM?=
 =?us-ascii?Q?eCXG2lpiLYmR4NYErMVF46qf2luljf3Rxik19hAFgeyGP4WujitIPrVLVY6N?=
 =?us-ascii?Q?ZSnQJ97s8Ut8HNve5+jzK368Pz5/4Kfr/KKWwWbP2QaNmukBtvbXHn7lLK4f?=
 =?us-ascii?Q?Un7psGGGAfMAoVux1apQMyQ0o+dZ3CmejCk4ZTUtcXJXvhEt0TroQlpTRFUF?=
 =?us-ascii?Q?64b7jJKzYALI77Raa8bJhcVCbWK7snd7AsM9AvCwjZmAIP+vsoD1MtM0FDqd?=
 =?us-ascii?Q?p0R7Et+liyAXmLs3S4gJyNpmQCkpFnZOIwqCzeoIBqr9GhmJJFOBb//mxoCL?=
 =?us-ascii?Q?jcYevzKO3i3fzlCkH3esv6Dd0HvLffKrxKEDFfkSJNyXtDzHuYFfEowy8ugB?=
 =?us-ascii?Q?WR3oUTmHLzxNkf2ITQN2jOJ++BV9A6tGssegozN4Ny0TTc/9aJyioPzctcZ0?=
 =?us-ascii?Q?jFTYKjxtqksIa7iUOtUC6lp6aPGEbMqYscg9vbM+VMvd0/ddRAKn03/Ns5W0?=
 =?us-ascii?Q?rrrIGLkKvGqk1fyvammSpYl5xnAaBBweN0tlRCf6jQJx3QRvZTeNGqV2vpJG?=
 =?us-ascii?Q?EJCpZ4GE4yoEshf6UKgTO/XOKLitSLx3240FbO45pd7R4bDCX8JHFU7Ygjw4?=
 =?us-ascii?Q?iQD7uDSjzoRs0bkckfd6b05YPN0UUzn58xcOiJqF92Kv38QsnmiqOKNfLGsX?=
 =?us-ascii?Q?mnirlylHc+dB8yrs29/J2zd0jswPEsN6iqtZ6GvQrGd9nppzDJOmSokgiqGL?=
 =?us-ascii?Q?37RLCXLVswB8VE7HushalFL53pqJo/oHtnmVTPlS567pUAoVjbQAgn6OxmoM?=
 =?us-ascii?Q?C0bjLPhpL2+2q6HhAFQPx/Nn9VuDTl27TBeyGKvMD9bqvfwBPqbddzPokJ74?=
 =?us-ascii?Q?HPn8pv+MYS/tRADAgWl+6f+ZmJ0wXBxxD6uJke6fXURC/mkjVNtI1EDAs1/O?=
 =?us-ascii?Q?NaTBWUbBEBsiQklqK7ZLc8cjXnVP0VhHJKCEpUyivc/IJF5LUylqlefItuCd?=
 =?us-ascii?Q?+pIIPyriN+27zYGvUBcwl9H3vV7HbLki?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ucw2cfrVkkkBysPJefwqNhZpFoAGeGUpko8V9b509nsG3NtDQDwKnnoRy3cw?=
 =?us-ascii?Q?AFc/+WVdY4BpZCokQ5MLjrz3Y7tcPLce6E3mUw4T9rxdfmm4B+qK6/lvQl/K?=
 =?us-ascii?Q?zuGhK6gDsvpNVsoswAvQMiOni2YpVUdi4nhzL0/MDJSAbXQ4vK2T62o5xgRR?=
 =?us-ascii?Q?gqF607v+XcLbUR+AUA86BM5dFan+hX8ESfsMmnvZc+f8/Y0hUoKVR2w5IHr5?=
 =?us-ascii?Q?G8f5gldZJwH0yer9+0Vo2pFVET+0A7TQzuzAxDs4i+qIVWrSgs1pEcuq4AKX?=
 =?us-ascii?Q?rugwwa4uW3sQbCKEzGlE8Zt6U/Gp4eApAqj4a3PrfRWPo2IfbD9bfRmQeGmk?=
 =?us-ascii?Q?RFU5RxneADl7Gf3OQ2iX7o78AXJktPSIedyPC+ILvVeCCNA92LvwmmLaY70E?=
 =?us-ascii?Q?opaVslRYUZIVhQ+pDf6CjdnjnDqG3fp5doI9g5XhZYMaAAlmPkLvOMWzzU2G?=
 =?us-ascii?Q?66w+no+zbL0Z9zzwpqWJ+ryVid/KxIOursamm4oh/M1w6191GGXnXEL/KyVV?=
 =?us-ascii?Q?KmEScGSTdqhTzFIJ1FjYSnR5gytu4Ad2BgUo6pSiaeFG9kOFZQ3AryefhZrA?=
 =?us-ascii?Q?MZ+c6mqv0slrU7aSdAgp4vDIKTnlltPI1Yijw4vl4padYv2LuRJYj8FrP1hu?=
 =?us-ascii?Q?UYvne1jtdFHkgMg67H8MsVpGb5CkA744VHWIgLf0ua1G3GE+r1XNpqgqQbMG?=
 =?us-ascii?Q?D41qOcCrlo70qmxdFFC9XezMqJx6CqpPBoGaSTM1gXumxzb0/j+CxtOR4pHp?=
 =?us-ascii?Q?HCwC+D+ICXw3L/0nBWV4xOiNSju/PKf1L4OYY6H88EwytDcJZJDVkhQeU2z7?=
 =?us-ascii?Q?wF1yfVo5+XKMIR57Uw5/KW0FltSobt3xHCt1N8QUoCZYn5IPADG1IGiCWAg8?=
 =?us-ascii?Q?dql8VS9mu0l3x8zeUicndRYp/HxHq7eXscpv6zvVHprAjrGhpDr++GDYAy5p?=
 =?us-ascii?Q?CyVfJ6Er7jszalO5dQfx58EN2VZr65i5F28XBIKnNutHr47dAWzyk3kUeNuE?=
 =?us-ascii?Q?gQyMUn2O1KjH7mYqGldz4txFkD9WVZjnL65FgC+bJPsP1X3LzKYzigmsrWui?=
 =?us-ascii?Q?hLL0h/dgp9twsqrZHaRXuneBWxKBAFsgNJvvdkvkVydZ3h3gxdG4m3tSieMv?=
 =?us-ascii?Q?sgOZOrf+h1F7r47sh52GLqlr+FP4X4/CMO0gT6p56e7VwSUa4B1B28LyMiOJ?=
 =?us-ascii?Q?7c7p9MMQFv0z3NGHDIr0v4pNiNSY1QeSth/mBIyFb1zlLXhS+YDxBXKF22Fn?=
 =?us-ascii?Q?01Rn56wvrkowBBeTVm1Lz/dhIgmQG++/q406DBHaw9V+ABcsv3dL1uNov7Xu?=
 =?us-ascii?Q?h3lh0jsqD6iKi2XcksXbtzh07EFELsRtRqLtwZJnGYdEhCtVxvc32ECB7tSx?=
 =?us-ascii?Q?kS1rxxdTZJ4RqLILM6ZU+mZG1e7A1dWjGgpbtx+EAcCqTnJtMoszaZguWWCq?=
 =?us-ascii?Q?a5c0SreCJhlW5YDySNMTxeQBs/xOMjk0vomZys7OwyLzdq90k7cfwDcrBrkm?=
 =?us-ascii?Q?4cYTq0pooz1OxR2n1EnB/jIlJJ6CUByK4xyIAoeYBPMobE/FPaVO4AE0p19t?=
 =?us-ascii?Q?EyJvNdXfpm/jaetsBQ4jXHotNGTZcLnuPG9MOOCGHauCRNiVeJVA08KAvVk2?=
 =?us-ascii?Q?vg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: c66d98e8-0897-4f69-6961-08de1aaa61b2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 07:27:02.0188
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4erwTL0nTaVVfCvoKTNiOOs+cSBUIKQCQME6zwGeDSk2K2W5f4C56uXcvx8M4w2QCXDtYNo0sEwwTEgPtQ3JvRVbE1u4Mrm1jAISm7vPk8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR01MB9155
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 07:27:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225597

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gnome/gconf_3.2.6.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-gnome/gnome/gconf_3.2.6.bb b/meta/recipes-gnome/g=
nome/gconf_3.2.6.bb
index 54666801c5..45de01d9b1 100644
--- a/meta/recipes-gnome/gnome/gconf_3.2.6.bb
+++ b/meta/recipes-gnome/gnome/gconf_3.2.6.bb
@@ -9,20 +9,20 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D55ca817ccb7d5b=
5b66355690e9abc605"
=20
 DEPENDS =3D "glib-2.0 glib-2.0-native dbus dbus-glib libxml2 intltool-nati=
ve"
=20
+GNOMEBN =3D "GConf"
 GNOMEBASEBUILDCLASS =3D "autotools"
 inherit gnomebase gtk-doc gettext gobject-introspection gio-module-cache
=20
-SRC_URI =3D "${GNOME_MIRROR}/GConf/${@gnome_verdir("${PV}")}/GConf-${PV}.t=
ar.xz;name=3Darchive \
+SRC_URI +=3D "\
            file://remove_plus_from_invalid_characters_list.patch \
            file://unable-connect-dbus.patch \
            file://create_config_directory.patch \
            file://python3.patch \
 "
=20
-SRC_URI[archive.md5sum] =3D "2b16996d0e4b112856ee5c59130e822c"
 SRC_URI[archive.sha256sum] =3D "1912b91803ab09a5eed34d364bf09fe3a2a9c96751=
fde03a4e0cfa51a04d784c"
=20
-S =3D "${UNPACKDIR}/GConf-${PV}"
+S =3D "${UNPACKDIR}/${GNOMEBN}-${PV}"
=20
 EXTRA_OECONF =3D "--enable-shared --disable-static \
                 --disable-orbit --with-openldap=3Dno --disable-gtk"
--=20
2.51.0


