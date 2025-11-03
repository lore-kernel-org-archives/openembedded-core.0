Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05960CCFA09
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:09 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.75])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.16043.1762158123888962636
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:05 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=1YnzZqUB;
 spf=pass (domain: navimatix.de, ip: 40.107.130.75, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xXKckJVnM35rYZ2c6qcEuy3l1klLMQxis2Y0G5grhBcpq2Nbh8tbXnstnsJHFU8fPX1CgSDXv3tvbcWxNc/NAJIISrVI56/gU8yo0owhR0ItFML9dZYJSwPCj1W5oTkTuf+eKlOmyRHq1881acfR9YS6sP8WYdTWcHZnrXRNP9dheIMDG3dFtJ7+N8nRJClAhG1YagBJUHmOt3KsjcBctEFQU1Q1fU9ceHc6WVMgYA76ffZiS5ITK7am2CFh3VWyjPK4YyKBrp0U58eIEBSqA93lHoMpBN1k48CVRqXYOMJZK7D0VqI/BZpSmYUyJf+XyjISejyPtg0J0lr1ChEzYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHP6df+2C+5W9slydrbh+2kB9T+ieBUFhxn7wZFBM08=;
 b=w+iLn6BtBxJvyrG3umVQQ4GQ1GK5EPQqVHUNqAsLkjfbT9H6rfdQzFtcwTnIb4Yhh4z+GHwdZzTpV79XZAsg6upOT9u2FrQbniLTFuih7xyvVIl6x2RAgqE4gyhae6T1pzrwktYctFQnUOjajqfLb41zHJmY6K+y8TYlJBeuVM6ypMhU3EOhmAv1kECHlsJk2I0QdlX/11gvTEcn8c7jXp5OSnTmP1DoGXke7Ph6fI9RNXKQ59QNwMLXaTZKfnRgBKuKLE/PXzMN4XUPDJltVyPklBAEgvPcG8gJmVgyIRKHwliJPi41WADe6GCeOGZMDNEM+BKOXietzqTYOuLojg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHP6df+2C+5W9slydrbh+2kB9T+ieBUFhxn7wZFBM08=;
 b=1YnzZqUB6WFkN0a/zjEsLJeT/C0cBLiAUVYBhhe089NV5caa5bqBav5JNksyfEnbSU+3SV/Dl2qfc5KikS4O7V31UlCz0VaqiPJLw0bFg/JybzWAwBvcKJbNpg0pQkPoMJ4guh98xOCO0eD7OwaqzoyB047wAXOZVku8+Pjqifw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:03 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:02 +0000
Date: Mon, 3 Nov 2025 09:22:01 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, f_l_k@t-online.de, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Markus Volk <f_l_k@t-online.de>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 11/19] gtk+3: disable wayland without opengl
Message-ID: <2782719072163474aa3e444578cb48fea3ae60bc.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0314.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:85::15) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: e35890a3-521d-49af-e216-08de1ab210cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HcVBndpbBx8gMj1U1BiD+ylx+HRBQHa8IR0+iPzwsB0v+er7Xd8BKYMaNHKs?=
 =?us-ascii?Q?3Dmzz46NDXGgkJ0jH/VUHI1DvIkFBJp92pdvd+BpWmjbstQjuc0LPY9t4CGA?=
 =?us-ascii?Q?ul/fOWJTGp75oUn/1QhBRGqEfatP53e2RZ1I1UoceQIaXNAn1yxD2vWvfDd6?=
 =?us-ascii?Q?A5GDfj2YYu2DYDa0k5myUJGIiFF0NC2iKqhj2DPRyRD1ZwUOcl3dJJGV4Qpd?=
 =?us-ascii?Q?+z3V80NBrhWfOTkamIGmLgt+GKgL+Q5gtNna5Wi1mdu2+3hfEyj/smeFSbE6?=
 =?us-ascii?Q?TEdZNPIJsdHQXdX3jDrS5vkSzvVLDBWUU/ZoUT9nB2a6eeVA8+miLWe5jifi?=
 =?us-ascii?Q?AHt9t9PMQgj7G+t/ttq5LCS92tKFlCW/bBx38u1Qb2El3ZlRRHA9kbSMyAaR?=
 =?us-ascii?Q?iZAzLSMv7zJ2kvbVgRZQE4u1ivPXu7BlZLcNcjmi1QHWWvFQoi11hgtpeaab?=
 =?us-ascii?Q?Kv0FXogUlih9O4zSFtvVStETBfk6uSPVIPzsYPL94ArscIhjRRa8yxKyb/GG?=
 =?us-ascii?Q?asva4evYcx2GQnFmn6kzo94Lf7831nzAq2GemuQ9pbMb7uY8aysFJb8RBV9k?=
 =?us-ascii?Q?mbxb8jAJ9Y2wwJOH3K/ZWuPM9rIAA82wVNiGS8TUnO/rIJqcPOLncZGgFVGa?=
 =?us-ascii?Q?AReB2XXg55DMZ8GANlbogUGy5pmN6xayevlgy1Q2h/HrEq+5bUkEw3lrN2PS?=
 =?us-ascii?Q?I2waG0tg60cUYzS2j7SQpuboKYrQsktWz2Kw5quY3le6nEqyPenXzehrsYjK?=
 =?us-ascii?Q?+gHR8soeq1H+eMyUOF2koT35Q1JvgxXE3chqgOd/8V403VNZ9278pd6xzs3I?=
 =?us-ascii?Q?S6OP+HmwczbFPDDQlrpaTF7jDhRKu0THogXMPWmqkzPduQ3sHh6JC5FxZo8F?=
 =?us-ascii?Q?4uW8IbgrL9OiXsuH13TISHgfd1X8SaI46Rbj3k4musSNCrXPZmMD20lG+8Pc?=
 =?us-ascii?Q?TMXSdjk2wMvuCcx8qiCdjrvbHN7+E0T/EK97KMEe9QfFi1jCJnOzOinY406R?=
 =?us-ascii?Q?Df8Y9GJBO79jvO7OiKVTmhkkyLYg747J1yamxuStQb1YpxpGYozN7KqNHpNZ?=
 =?us-ascii?Q?oGJWYn6s3EH2e8YP134MLqIbvQGMofN4R37X8MAhrOtf+gn8gMdhd99XIYkZ?=
 =?us-ascii?Q?m3KAJkQsGVEifedK/ZFmSFd8ESyJNfmSX4knUG6ORA5jZ5lfUbAjOg0bLoI+?=
 =?us-ascii?Q?uxnOPrfeCQIv/pCUP8ayDsxyU/UoP4qRwBnLIhFT2/o2zMj2851t4RUkGpAO?=
 =?us-ascii?Q?yJlLqrwP805tm2tGvlXxtJyxufWWOcIzwbYau9VSFbGFbsBd+Exs6Zfq7dQw?=
 =?us-ascii?Q?hX60p/udsVVKlp/xXQxL1WAoYOFcEUBJC7PxYv1fDoBTGxBn2h6IUZWNAcZX?=
 =?us-ascii?Q?k8GD3IzKFBTwiSATlk1EFBxuZ9Wl7Wr3WZ5Mqw7S00ZooSzSrTNMVNP0fv7K?=
 =?us-ascii?Q?uxxJsVY3fxRSAId7cgj12cEy629qGh/B?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?0Iwtb6vAWokYkK0pkdFKcb5LOOYQxON6XfMx9bDvSnl8v2cAQT3x/LezK8pc?=
 =?us-ascii?Q?m7O7dnB52VoJfr+lfy92FIwoQV0loKK/NGFLRCDUtu3WVu1n8HmnfBVdItuV?=
 =?us-ascii?Q?1PPUD+wjrl2S3EpeUClT7xB+PhxCPjP0ndqf/KrzeaSaR0wfRdNG1dHPETiD?=
 =?us-ascii?Q?o4PEu1C2oUbVsgP7UM1T4IncX1oVY0FPxGWBwpE0Ef7LjYg4BADgKxgyzM0/?=
 =?us-ascii?Q?XPXgBDA2Y8VCme0TfB6iwKO83LJcW348iaVxfrtEKWR3NZCgXqxZKQPec0Xp?=
 =?us-ascii?Q?pCJr+ttGOaoIor1+5sPTMV2hb6BgRjOGgKyqVme2AFkMX3bdG+L/473t6GRy?=
 =?us-ascii?Q?MwWgF3rngr6q1iTV9qkLYWHVpgAw+cD+rtedbLEs2f1mVbVl5RRJQkwT/uF/?=
 =?us-ascii?Q?UA4SUk+ysO58NC3hP80CHFHprWms8vKwSwBE82xUBHw2iWtGA+WhYo6JPwJl?=
 =?us-ascii?Q?yS3bD32xt+WU8k/BuRqJ7fsGmVeZ/5cTpJARiP6DWL2GKlL3YnkiN3umTySV?=
 =?us-ascii?Q?swORQfGZjgVJaPuaT2q7nSrWM+tpgDrdKlAeJ1C0xXPXn2PTcIKh80hRwjg6?=
 =?us-ascii?Q?TjjxINmTMr25UbPKKe/3t+35z9G0TNFCWg413yMAZYUj7Chj1mnhTloZuyCz?=
 =?us-ascii?Q?ChdXuV9AttX52PGuL/lOJeTJHx7YCT696HsC+wTUqlrRbEC6UhlKXH3T29Uh?=
 =?us-ascii?Q?bU3TiLZEeVpE9D7ZYEK+bG67+0i1bmK08a3PWWtBnFo1ekld8jtckiB0JisA?=
 =?us-ascii?Q?+vhQBpHAVTNPpq96Oktu2DTeH2lP6vfjiTvTZloLW31c+QMElUzMa47Uhgnj?=
 =?us-ascii?Q?Fb6m+A5q4QuA7V9YnvLv1qTvjY4aPkSXrGt3C+DCUl3xQJKJIE4HIZQhQ2V5?=
 =?us-ascii?Q?h0PkRuRGZ26wHEIpmlVZWSXXvu7P/5OZfTrA92ZxuzHWODXcUP69SFRBnSKA?=
 =?us-ascii?Q?QPAORyifGVwYcseNeg6W2mNGoZ+qOgg1jnRUC+XBl/Nfs1fgqkudcGGbh7oP?=
 =?us-ascii?Q?g3/oQ/Fsj+aRYyk5Sv78uITH6oxjh2blSXd/CmtzpZBQ11wQq2m0t2mXljUg?=
 =?us-ascii?Q?2LHtwaEcu7R8HyLuxq2xtQu1yUHqrWR7nRTYQSs+9vxnKBdQxr3XAqw+HDwv?=
 =?us-ascii?Q?UOkt0boM/j3REdOHkOQattfmeu+ms6A99szDxquDoz9yudYwspZGulXvlsOU?=
 =?us-ascii?Q?ppPrLUfdMHXEk+UM2djYjsdvE7/lmh6zgGstsRNf1JetMcg0vLYNLegLmtWD?=
 =?us-ascii?Q?IDYONDMkHcJ1ORKQ6CLEtqjKhMkazFrWZQAWJAEddPehFsH5ohx35NvJtwr8?=
 =?us-ascii?Q?m87oE9D2itEoWjV34D+cDBxfvDvtBVUl5wvdwrJgsyPeH7mc4tcvu8Gv1Z/H?=
 =?us-ascii?Q?pzUDmCZaGwsJvGLalGZYepPoPZT2HTGCQ8WBejkTPP0UZjezZMi3PW9S5rw4?=
 =?us-ascii?Q?wuMTb0RfkzIE699lZEi71PHBe5jJyMPCLc39pAEFoM958vbmx6pECnFGyT29?=
 =?us-ascii?Q?Pyb0bzw9qOv5/2RqDO0y/onWdfhS56aGRhxtz8mtNiaeyybfCwtzSeBi8IFa?=
 =?us-ascii?Q?+pElB4lDKQnx3dWlrjHTERL3vRD/fpmgAKGVFmHom1PDLbPHNDuL+lvOhsbO?=
 =?us-ascii?Q?jg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e35890a3-521d-49af-e216-08de1ab210cf
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:02.3025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lQVWkeH5lqdt+GMmqgtCpvktq/l+gcIu76vceNFlTHWhsde1LnmmWgCCO4frvkNvRDZWALJ6Ozq2/AAcPnWoiDz8R2iihlxHMQD/CvrFUKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225625

From: Markus Volk <f_l_k@t-online.de>

Wayland backend requires epoxy so it will pull in a requirement for opengl
While doing some tests in building old stuff like matchbox-terminal with
vte 0.76, I encountered an issue with building matchbox-terminal without
opengl in DISTRO_FEATURES.

Explicitly stating that the Wayland backend requires opengl fixes this prob=
lem
and allows matchbox-terminal to be used without.

(From OE-Core rev: 35a7e970bfba02fa01ebcf03169d2ddad90ad419)

Signed-off-by: Markus Volk <f_l_k@t-online.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: f9ed8b9fa1b348baed17b97110c2a2403b058dbc
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3.inc | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-gnome/gtk+/gtk+3.inc b/meta/recipes-gnome/gtk+/gt=
k+3.inc
index 4a04c06432..e1603b43fc 100644
--- a/meta/recipes-gnome/gtk+/gtk+3.inc
+++ b/meta/recipes-gnome/gtk+/gtk+3.inc
@@ -33,7 +33,10 @@ GTKDOC_MESON_OPTION =3D 'gtk_doc'
 EXTRA_OEMESON =3D "-Dxinerama=3Dno -Dtests=3Dfalse"
 EXTRA_OEMESON:append:class-native =3D " -Ddemos=3Dfalse -Dexamples=3Dfalse=
"
=20
-PACKAGECONFIG ??=3D "${@bb.utils.filter('DISTRO_FEATURES', 'opengl wayland=
 x11', d)}"
+PACKAGECONFIG ??=3D " \
+	${@bb.utils.filter('DISTRO_FEATURES', 'opengl x11', d)} \
+	${@bb.utils.contains('DISTRO_FEATURES', 'opengl wayland', 'wayland', '', =
d)} \
+"
 PACKAGECONFIG:class-native =3D "${@bb.utils.filter('DISTRO_FEATURES', 'x11=
', d)}"
 PACKAGECONFIG:class-nativesdk =3D "${@bb.utils.filter('DISTRO_FEATURES', '=
x11', d)}"
=20
--=20
2.51.0


