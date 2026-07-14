Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D7ECC44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:42:24 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.136])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6864.1784184137979596909
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:42:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=jV/oLG8e;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=63FLHKer;
 spf=pass (domain: navimatix.de, ip: 40.107.159.136, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aeXWrWd3NvMckQ3bJZytp5c4LULlY+D5Gr8NsHqKpWw=;
 b=jV/oLG8eP1Z/MMwubOy4C5GGckkcwB4AvvlFZ9LZWiN5NKqCmHviwk+qlY3lRLPEY8PHVL8TKjfgkHr7anesWKWBcO/HPCRpDkDwSWIJx7FWbI+HYXS4mA7LJIEnUcgdd2E6fUYesekpI2MWEuD849Yn11KPQ6T7ubWRPwlkJh0=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:42:15 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:42:15 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:42:12 +0200
Resent-Message-ID: <alh9RNyq5aDy0TvR@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5GIXPs0p1glzNvPVzAM3b+uwYbzMD8wPj0RUae/tNJF04d2lWBN0LdHPm5o6/C9IuAwek+K4fIJcQA9za/RPCcUX7HigyMiBe55j7l57klje7IbFiy1amj59O+t6bQxaeogNFdGoD4cL96tm1hlBfG62jG4n7fyh8g5qZpka99ivzgbvtFZmxLZ1bIrOqoTQvQ82Qfv49QG7Whfm6Zzg4cESczrnpZRmWvzKLTBkPamfdPnSGmEM62cKejDXiDPtLcRzf+SVdCf1h9HMaqpM6q2UedEvXmwsoADykJj47RNKH4cj7Wixts4lo4jqAqSug9HDd8hVbw8NqVaOsEusA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nwdiOEh7itjYHYeNK6nCji5y+IQXkARpAlnuGU+vfBM=;
 b=kJBlnHs4pfiEnWR97DZA8uH5qetvlDog+RjIh4romicvqfWgBGR83fAmRYQ7o/xjRGRAVT1/c1CfhSaLfFaRtCw1XsIS62mg91nj0FacpsjAVYgjbhEBBbWq0w++fIeRk03mhB5/oPb+0drCTRXk1DBl60n4Vg7ILw31c2qLLVCEY3sD+aMifcAo+NoSb2fnsO1q4YLlgQBqn8m4S50dvm5gZ3tAYZdyX+KP141CSTzKwvOCFgSfnyV5mOymIjb1LvukGiXnvejkcuUVgjLfVmJi9S57ZPBzQyfy3VQLikIXTDZ3MMXGKxQwR9c8gDH0eB1xkEdMq9T5oDQWqI70cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nwdiOEh7itjYHYeNK6nCji5y+IQXkARpAlnuGU+vfBM=;
 b=63FLHKerPe9IVYwQmxPYPkjrTivAgtwZ8muo6kIQ7X1zZQfr3ph3IWkIfildmOfnBUWz4h9iOVCGpnUUvkRrIGG5xmJoKLOrgbQIjfAU314bG4n2nDDSQ/qb9nqrQy64P5V7P1NIIcpKehMrsi4f7Mks0bqh000OYPazo/s0660=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:43 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 5/6] shadow: Enable PACKAGECONFIG[acl audit selinux] by
 DISTRO_FEATURES
Message-ID: <fa67ba9d1ea7e9f07f775458000118eb73293101.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0331.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:7d::20) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|DBAPR01MB6901:EE_|AS8PR01MB7768:EE_|DU0PR01MB10282:EE_|GV2PR01MB12865:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: d0eb0fec-087a-4cdb-d4b9-08dee3055f54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	W4X1LAxz/YYNdpHdG5WpHTT2vITXD91YFP77Vay5EStzz000d6nbzUhqL2QUnNXg90OS3s+rPgX5uWrlqd71uGvIfKekQznq7PL+yZ+xV49YdMF/4bClx6yrkOvHJbA1MyTQPVshYCUakvhHhj+rtTlE5HwSxF2qK6fMRg8S0c2ANuXteO3ODoWZpnGl0SP/KEbgQIJFLuiB/hTrMEJB3/OU1HZ+vQTNXKYt9iLnGmPkO8GOERS+eYqfpYcTED1vMBu675Pm6RNDvaPbnY5flkXxnJk3jPF444ajNzHkuyM5dg7kvgK04u9AGsuwDVcD3QcpFtPb1Qy5f7h8Wie9ZJH2AB9PtpctiUVOtD434OhE5lpKCtDXr+eMynxC3d557MaAlxWigZkEv+AYEAJgsAfLXOCMhTBINK/fr/O7Ms04dxmMDp5ws/J5V/ThNv0s2JZ8W835Fyl7umRY1kj5Lw6HbsJ8N86hKCu1sleavSkhsJfhnAT2NqUyVeUjLisMrk37ojjz1c+VNdpXYmg6Qa/agvnJ6lqros8/v7tWf+s8fZmC7hD5PN9u1rOhpSMrs0jNh1qo1E4N4OI0QFtnE/seRFCy30cle9uW5TzmhVrNOK6lW5ppcf4EwmsjXCMDIxPzUgyfgyW+yNkRSgRIkQ+9IAL00SbVYjd1nh3iTH0=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: abf6a3bb-08e0-4cf8-6275-08dee1b606a2
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:44.6065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YcvjrhY1mAc/cgumvJPl1OpYUJjxzawYhr+ulI3CuvfiONr+AOpiC9f6Nuf17V+SemVwS75X5B0C2FtANuyvpTyJw6ZRJO4jlrI30UwhPMc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE0P281CA0027.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:14::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	abf6a3bb-08e0-4cf8-6275-08dee1b606a2
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?72BAKFtCjTd1DFE0fUGmEWDYQ2rovGQPZ+pnin+AnMdGtNb5kGN/7h8eJ2?=
 =?iso-8859-1?Q?5guGAb3oA/D3fKTGGZ/HsyPBpfS98nxV27En0TaU11BjSLi0ERCVMF+dpR?=
 =?iso-8859-1?Q?e47w4qPKK8QRFV5piXFGKEjrPp8ef1dBgs+2sJ/mqXvyspzaMe9fxgtoRr?=
 =?iso-8859-1?Q?xLleF9wqbG5XMBPB7bDeKF54Q7VDlAgaiwmMk6XO2VVBc7K8zXStpyrZcm?=
 =?iso-8859-1?Q?zs9eKkkhziCCiYkY6Yx4/1Qr1G/oaDXT0ZXadJyAnja6pQTBLSUaGyHoDs?=
 =?iso-8859-1?Q?mFGgJZqrKAg3ExXHi5lbZ+pIq6MvfHICv+LczFHLdHWrFjF5FxUnAAbt6w?=
 =?iso-8859-1?Q?reE91Y60PY7F+nZsUE/Ns0+nl0Xj9+JDp4PVKQFoEjKy/IHQ6/qaEbc9Q4?=
 =?iso-8859-1?Q?kpHdg2NNTWS2CcD0wJLNVbY81kSyll7dTDalT7C/kQ+hgYocuhupFdks/w?=
 =?iso-8859-1?Q?WqGOj2cePPypyc7VQb1hrUp53pBYeQdfhU5bvQvdUCBI85OXdN3ZJpJ1If?=
 =?iso-8859-1?Q?8GrKBFD94Yts3kqmeklSq4/hTnPCBQXbHeFkCdQ4KqsbFDeBBn0ByhTAyX?=
 =?iso-8859-1?Q?lY3iS4UR1Mqitvl5get5By/mP1nwHnuOSrSGLh8UrN5uQISuNNXw6hPq4d?=
 =?iso-8859-1?Q?eLUp31RVwhK4sOz1VtvWXOwjCpUxUs7XLhMMl5ZNrWOxpJ+pgmW8i8Y0IA?=
 =?iso-8859-1?Q?1jvipr6DThVokLnofF28l0/aoLdoLI2QkgRarLm7fm8CGyIP9mOxJcdi9H?=
 =?iso-8859-1?Q?OVGsY8IG5/HV5X1sLybARLMBz+kkXvKLr1quJCQZDPz0HlRZzlXtJRNJju?=
 =?iso-8859-1?Q?J/s1T1b7P4fI39gh9sKOGoyDxz2y9UMukKXh/H7+cvJ2uHg32+D0RApB9o?=
 =?iso-8859-1?Q?Be/tvahl3uPhoTxRydvhgKB3LcBSf7escPa5S34hNMuBo24SzlntXV/1M5?=
 =?iso-8859-1?Q?ETeP0moJZMM1ECxS7KS3ZiKAk2NB18KF9YPeoTbJIdYnixlI55cMdPj1JA?=
 =?iso-8859-1?Q?piNl6BQsR46xTQCBfkfb0T/J3RnssqDEz06g1FuZtlp1T+XdCz3lGgntkh?=
 =?iso-8859-1?Q?RG8t4sWLGFpwQ/0HgvYGVAUu95/DdXJTt2qpFxsJ4jmnUf4MSapXm9WWNr?=
 =?iso-8859-1?Q?JSxkzr6AUnSUc0+8v+/tl6FNgUy9Ku0KApTVoOw1J2N/QTP4G3sOdoHUTq?=
 =?iso-8859-1?Q?B6/XtQv1KklpJGMSogUNZu6pMAjjdxbF3W98S/PUkHLORrD00oZba4Aqvq?=
 =?iso-8859-1?Q?DzfvkqhraJnZaIAxlzjd249AkL4G+9k9deZT3YpFNItMPy63HhZFVruRPB?=
 =?iso-8859-1?Q?5xTw5egmOQ+dym8rkS+qB5oirlspf78gaGOVCzXdjUxcM9e8yKmqlQWbu0?=
 =?iso-8859-1?Q?dJ6BYyjdVNLYbuR7rfOb+qa7LnUTuftajd9K7Ch6a07qbJXQy8c2X4jam6?=
 =?iso-8859-1?Q?HbrsW911C2J8A1T6IHVb9k63vsADtbU36+j0Tv7UMAaVmgM/MvaZL54Xpl?=
 =?iso-8859-1?Q?iCZtB4KqJi8kPuelVzP1XpFflYLnXqddf9RMerpZ70ZFzV+YdXI4fvXzzL?=
 =?iso-8859-1?Q?tJfUkoBSZMh/BwjyfxBKhrpMshf5c4n0oMllH8OIRiOwSigXMsYBvly9Ki?=
 =?iso-8859-1?Q?YnzGMdu/GD+946t/Dt5H4xv7HSO3xDaiFxZGg5j81YGZF+qmm+BNZYJ7Y9?=
 =?iso-8859-1?Q?sSCXpAR2j+mJQjbf8tyaUcoE+mCipoLpALW5y8uaLsCGcb6wppZjr0Uu32?=
 =?iso-8859-1?Q?h8LbWxTseApjEG1C6O3PdptkJoOHsvalK2DYtMM6+ICrtMmenkSdluETij?=
 =?iso-8859-1?Q?MA/xU8JC+HNNDrYyXYYMAe8O6XgUdT4=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d0eb0fec-087a-4cdb-d4b9-08dee3055f54
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:42:14.9885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ofetDarYrAXtHsDjKkbVFzSy6U3uHXRDMHf0Vg3QAI3dOvnHx+7g7s7S4+2MzmvTqI1eJ19Dh4lzRxK/byKgg1nLa7pbpnOex3qAGJvSNZY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:42:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241061

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/shadow/shadow_4.19.4.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/shadow/shadow_4.19.4.bb b/meta/recipes-e=
xtended/shadow/shadow_4.19.4.bb
index f70d1ca5f3..d9ff20c22c 100644
--- a/meta/recipes-extended/shadow/shadow_4.19.4.bb
+++ b/meta/recipes-extended/shadow/shadow_4.19.4.bb
@@ -70,7 +70,7 @@ PAM_PLUGINS =3D "libpam-runtime \
                pam-plugin-shells \
                pam-plugin-rootok"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)} \
+PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'acl audit pam =
selinux', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'xattr', 'attr'=
, '', d)}"
 PACKAGECONFIG:class-native ??=3D "${@bb.utils.contains('DISTRO_FEATURES', =
'xattr', 'attr', '', d)} libbsd"
 PACKAGECONFIG:class-nativesdk =3D ""
--=20
2.53.0


