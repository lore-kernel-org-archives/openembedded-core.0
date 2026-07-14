Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D825C44501
	for <webhook@archiver.kernel.org>; Thu, 16 Jul 2026 06:40:44 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.120])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6849.1784184042952640436
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 23:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@navimatix.de header.s=selector1 header.b=4CyjxNil;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=MAadt4Jk;
 spf=pass (domain: navimatix.de, ip: 40.107.162.120, mailfrom: joerg.sommer@navimatix.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OQKjzGLTYUbIczIItYtIJnpR+8ePAuerofj/EWbT56k=;
 b=4CyjxNilnM5PPGms9hL3+Agu7IqTcAAmxP4v8c2HiRoPTo//I09anXh5KPCHgqpbfTyx4FD3hM4PTQut0jCY3dzR6yow2XsoGb19WDCI8JNcesUCUW8eyukCX1g6VclbwYs6BTeUro6ynmj18Bjh0qcBvlTLKZZoQyVt6Ucbzgc=
Authentication-Results: dkim=error (no key for signature)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by DB8PR01MB6518.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:15c::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.11; Thu, 16 Jul
 2026 06:40:40 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::d5c3:2dea:3d98:25fd]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::d5c3:2dea:3d98:25fd%3])
 with mapi id 15.21.0223.011; Thu, 16 Jul 2026 06:40:40 +0000
Resent-From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Resent-Date: Thu, 16 Jul 2026 08:40:38 +0200
Resent-Message-ID: <alh85oIsJOuaNrZz@navimatix.de>
Resent-To: openembedded-core@lists.openembedded.org
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bAKvzH7FAC8P6SIfAxjXygGhm6E7a1MRoaPT/xVJfxvUcrpk8pywwp1AAOlZWHuusjsPZtNKoI4NEdHzVQpa2td9Qa318PeOIXndy6q4MVrVG6mQucZZyLgdVQqukbiy8pgh2N8XKycMikqUa98wGPzpoprVp4ATuf2mBiQhdMwv4nlV+FZ6ZMkln1R3BFHFrmaXBuWdUq+ZJCprSrYoeGg/wuhGk2AK2QKpcIT3Jb4J63V1Rwvn+E7jsanqsboF/HeV4XqIaPvN5DHFveNeegU8+abYYeb4TwtrfuJg0R3/P3mq3HPtRcLlLXwHzn3Py30ZZPRnlSmIZNuEMvzfxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2OhAx9k3cv5xE4IYTkn60+JVg1KiseMPtIYCdmyzD+Q=;
 b=SxrDG+kS/n7E4BtV5k2Sz7sFcNAQYnozogosZUjK7MAMZHZqdftMO5hyf8bxRrfSILqF8CBVrOOb9YeWx5BScNJt3pX6M+w6JorA3zXKH52FshOctvtbXsRqB+QiQK6K4ktctCh75Dp9KdiHsEbmutnwL5rgMQcdvGzneU7WoYBqiVtQQsLD2Wsi1ElftQ7bBWc0ClAsmA1wufLhwoz/N4uhrR4wcRfkRcoon1vkmoikQYe3V8Lrj5HpUabZ8br3jEZh3kHsm0RxUUqU6CdqQavbtda7P8jjrrg/AsMnz1l/mtAfoMclvIQTAOOGkmewwz3K5iA7DFc/eHbiQve11A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2OhAx9k3cv5xE4IYTkn60+JVg1KiseMPtIYCdmyzD+Q=;
 b=MAadt4JkuhDzPdzhT4rXj6GVHuhOb4yVG2xDqroM/zL6Lci3jzep8ljLi/sgkv05W4vaACF331TMChmD3a0dvd4Lxcp4KhecBL9Yqezuafjd3psOtd4fBJd3MLC7pU9tq4OiVEX1eXan2j2N21HGpQp9U0IS6/7GJRnOodo9ziE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Date: Tue, 14 Jul 2026 16:41:41 +0200
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: <openembedded-core@lists.openembedded.org>, <joerg.sommer@navimatix.de>
CC: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [PATCH 4/6] cronie: Enable PACKAGECONFIG[audit selinux] by
 DISTRO_FEATURES
Message-ID: <502a2e4689a9a733c41b98548155891cee179422.1784039919.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.53.0
References: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <4fb61a12d8843e728054e9c46c6bc09c50aa2957.1784039919.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0087.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:78::17) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
X-MS-TrafficTypeDiagnostic: 
	GV2PR01MB11835:EE_|PAXPR01MB8872:EE_|AM7PPF270311C46:EE_|AMBPR01MB12682:EE_|DB9PR01MB8189:EE_|GV2PR01MB11835:EE_|DB8PR01MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ec677fd-b1bf-4aac-6781-08dee305270f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|35042699022|14060799003|1800799024|366016|376014|23010399003|56012099006|6133799003|18002099003|22082099003|10067099003;
X-Microsoft-Antispam-Message-Info: 
	Debrdj9OgSvUY3ZYv6SYoth9KOx2zEthSZFwgcRDgyM02B0xHKRqat7E4oWVCtWI0nuUOhcoEuw9iShqVZwJDPUn3MwP9Q5x9JzIrECJfU8AC0oDjGo8PlyD9kM6H3OG0QOvB2LhuIJanE73CwKJ2Vd26WkFb2pqu93FEYjPMUhtFm6rIlJwyh1tvqDGP1DCfOpsSnLcFNAmX6naR4Sr9P9hO5F7snRff7FLVqk+tGdQNqiPfUIqL5rYkMMhpsQUQnL8h8DjXVWSXivDERyYiqG+40vwy+2V4FG/1wfg6w2fcGOdB6oTTh4tYGYx+B+FE2ykP1rxyG9tF2E89HTya7tfB4mS9HikTtCZM6gElPfcyEqx4K6ptJJrtpPQNYcffavHmbUhZDGGHavVkW1GnLtfXg/tgVXWPr9DzVRXsE/b4z4wIjL5La8t0w6gxoU6QbABn0/NQziEgrIrubuFxn/uSGjyEkQckk4/kE//+CHJQEFzfgHYQGQirf/bffPuWgdaEDoYQc8wA4ncR+WlMkfYq96ckq0obWJMvlSzV/0aYP4CsOpRgU13wLWGGJrr4KMUFhoSTRu4KkUQu/5PhoArj+5qxXOE6DzVC0rHSZw37vuM2ZITZHr/27ijkkKI+2Q54OhdfVyq6PnMD5Av3dEufBf/rdihPK6cPaS/iuw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(35042699022)(14060799003)(1800799024)(366016)(376014)(23010399003)(56012099006)(6133799003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-CrossTenant-Network-Message-Id: 8102104d-7f87-4e0b-982f-08dee1b6058c
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2026 14:41:42.7627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9wZJZ7P+QmGLS+hBogzN/QKvfFhDtoF+W2TTA9ZqbyJsfPqOWd2NMqbirTDHn0VnO9lhNM4Vhc+A8S4LyMULpPL8HlOaAro1m/Fog1YlU+o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB8872
X-ClientProxiedBy: BE1P281CA0190.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::9) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	8102104d-7f87-4e0b-982f-08dee1b6058c
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?iso-8859-1?Q?kfaxwRWvp7MPV2Ci3D8c+UJz425NxTEI58D+LHS2vcaWI3vQpwGmcFP7Bk?=
 =?iso-8859-1?Q?4Q9Tb2Tx1JTFS5O5ige7LgzFqFt5fEibfdJUSIm1ZqiJ5rZ+Vlo9drlBNl?=
 =?iso-8859-1?Q?pznt6JAYiN4AFvpAdxgMw/iqO2IfWiOWDVabHNa7f801wqRac4v6WGZgjx?=
 =?iso-8859-1?Q?CCg3HOeGp5jo/NomvNgszadq3JpXtIWYTl6hb4VpMNsk106Ts8jtRCzQck?=
 =?iso-8859-1?Q?3o5CWZmJgGt+ItAIMkZEQTNaPUKEPX/N9/MqHfM82TkLMjJebWZSPnupbh?=
 =?iso-8859-1?Q?sAxH7A8y91sFU1PZ+nLGSm3cy9np3FVQS5rzOYmaQMTE/K66a/p45BGONr?=
 =?iso-8859-1?Q?EbSsFRhpZlToiVHEfh9VhyWj2IEa5eznbkCscWkjLOagoP63l8N1+HuG81?=
 =?iso-8859-1?Q?4YGU7KvXfgnSCdM0x9bHX8w0TE8lsSp9LhoHBF5bmZGdP5PfOhJs01sBe1?=
 =?iso-8859-1?Q?HWG+nB6t+HybJPgapD9w3D/tXyjKVi8Fn9woD2OzSHQVHt5jCmh7GBi3CO?=
 =?iso-8859-1?Q?pUxr/WDIl2nHsDEEPpZiiwaqLum/tXPUEu/Mj0IY2w+Zhf9Wq2C33XoEsh?=
 =?iso-8859-1?Q?5GgX1Maqo6FZguf+imUC+9gVgaTQFKAzqyxSzoXW6X+ybAbRkZxVQxZ9Z5?=
 =?iso-8859-1?Q?aekxA/VDMQkJaT+JZRcXMqh61CE/GX3wvALYESbRsccqhkDuHH1z/sMyoK?=
 =?iso-8859-1?Q?Lyk/CIN9tFoyhmHLHTHGO1YqnfYKczhud6WFP8ni4GDqpQn3zCkvtx+UVJ?=
 =?iso-8859-1?Q?30ahjWXJan18Goaqqjfh6x8LW0tSAeK8Xa9V4/Fd/P/DdTYCncPCh3WCth?=
 =?iso-8859-1?Q?EdrMtCEgXFHVv4pLoCYZ69NFCapzLxiSehiNXWoQM+lxZUvHL8eDcP5eiJ?=
 =?iso-8859-1?Q?ABVXJ8tLEh8ELXpv7xJU+mBVjbg00NhUw90imRMKW4tlZ+rptOG0eT3D/Y?=
 =?iso-8859-1?Q?Nv8ov39ssPPtzWURtAMg0x9/EyZ6weNCupXgeO85w0z4t8XpAHe/VC5iV7?=
 =?iso-8859-1?Q?9Teug02A+Lf/HZ4ajCeLExf2A2oyYqPH7iBYLtjiXLew0S/yJeL3edijU7?=
 =?iso-8859-1?Q?drtvtWDi+nmjo/tTO96fnAMhIrmH7zEEKlMaQHxo2QBFvrNInc5GRWOnz7?=
 =?iso-8859-1?Q?d/2IdssNq32L4B+cXAuYoNLWIACZMTAnayp9tR55Mt25bSDwlCM1JIBHs8?=
 =?iso-8859-1?Q?QaR20SU/Ly5XHnuojI0lrr95+VlU+gGDDiJeRYAADH0dPNIwOOXFz5dcPC?=
 =?iso-8859-1?Q?C837rF2reuG4L8EAGm52VKlX90MW/7xNTZuU5AnDlzyfy2l11ogJyUNa4K?=
 =?iso-8859-1?Q?MEjfhF5HeHDP38xVmdbR549K4NHAJ6Qmgn70N0qjnxnuHHIoA8Q04zWSZz?=
 =?iso-8859-1?Q?UoFs32dYhRzsbzv8mjBEBRNWn/Giatd9f5uI4GeJnbzvjqgvEXadBU7VgP?=
 =?iso-8859-1?Q?zgWIyLl8Kl2PG8FXxhIWmb3DKghFo/IdHgd0Ab50PVeuGS21/sDWUHQ0oA?=
 =?iso-8859-1?Q?vkBDw7hfIbZZcrGA5CNWT1PeY2ttomedTJM5R1YFBuMcLHCM0gACkWnYL/?=
 =?iso-8859-1?Q?O1MkgEnWtF0GN+fTRuhVCNPZ/VPJvRh9cC7pRfeFAVRYd8ZsbgxJ2jRGEA?=
 =?iso-8859-1?Q?035+DhtSVXfNFWZD6zeil8RMu82LqcG+FPH4VstV2ogrWmtlQ5lWXPgTLo?=
 =?iso-8859-1?Q?lfbmgwLfAYd3W5VTApQihK3q8Sjbfh0SgjTobqKoXTjUkWI1TRBEnbw50Q?=
 =?iso-8859-1?Q?UJQ99Mch8mZ5noTTb8qnSyxmX7j9g8uhbxXtC2XGMQuePybru5wzDDNFvm?=
 =?iso-8859-1?Q?GMhnKCygpmOzh2CvjJGuOaDMRo+dqeo=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ec677fd-b1bf-4aac-6781-08dee305270f
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 06:40:40.4145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kV56NdcBbIfgijxsJO5aC9/7SHQ9GYFIHz8v3pEzCmIyVDAopQYoDSHutYi/O2voxSuiYcVTXQ+DK4aRGAD1pimB3gjK/EDGzmyggn/UOaw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR01MB6518
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Jul 2026 06:40:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241059

From: J=F6rg Sommer <joerg.sommer@navimatix.de>

Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-extended/cronie/cronie_1.7.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/cronie/cronie_1.7.2.bb b/meta/recipes-ex=
tended/cronie/cronie_1.7.2.bb
index b250717ab8..50cb895cf8 100644
--- a/meta/recipes-extended/cronie/cronie_1.7.2.bb
+++ b/meta/recipes-extended/cronie/cronie_1.7.2.bb
@@ -31,7 +31,7 @@ SRC_URI[sha256sum] =3D "f1da374a15ba7605cf378347f96bc8b67=
8d3d7c0765269c8242cfe5b07
 inherit autotools update-rc.d useradd systemd github-releases
 UPSTREAM_CHECK_REGEX =3D "releases/tag/cronie-(?P<pver>\d+(\.\d+)+)"
=20
-PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'pam', d)}"
+PACKAGECONFIG ?=3D "${@bb.utils.filter('DISTRO_FEATURES', 'audit pam selin=
ux', d)}"
=20
 PACKAGECONFIG[audit] =3D "--with-audit,--without-audit,audit,"
 PACKAGECONFIG[pam] =3D "--with-pam,--without-pam,libpam,${PAM_DEPS}"
--=20
2.53.0


