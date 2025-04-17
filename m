Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CFDDC369D9
	for <webhook@archiver.kernel.org>; Thu, 17 Apr 2025 14:12:58 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [52.102.179.63])
 by mx.groups.io with SMTP id smtpd.web11.9448.1744898022627447438
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Apr 2025 06:53:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=RE2AEGiJ;
 spf=pass (domain: nxp.com, ip: 52.102.179.63, mailfrom: tom.hochstein@nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ARxv51Mhyw7lemUIw3rXGieTEgUK51LoBFSrjDVG+/8gdM7xpw6HR2XbC6RukcL7EQ1AwMOBXJzKyAHyfEYQN84knK1Iq2ar2Nj7qSMdXdOzWv5eUmJ76cvhDEfXskb8EOR6wuxVACqSaJUbtqQBepUZMyYmZKRB9TWPUNyGPoKBBzyt0fIVXB0A5pIXAJvsvY2ao+EwYxAEpB1P42EByOjSWduGwuA48xNakdfS1M6uDGfyZC3ZCLue7hzMqCiK9wGlvlf9Lps6E3xaj4m9uHf5yT9rhBJdcqcWs1rZN0sx4d+fd7G5nMvrYVndYH5EEW4/m82g7GVbh+coiiKtag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0v0khewHmlpeYl8AN2fdz+bUXCc/b68I/t/na3tlEoI=;
 b=nM8E/3rW/QFidEefxH85sdpMA9zA/NEp3dp43LmTCTpwm83kgBqTEOpc3wQwkA+LO6YiD4LEuBT1Xske7JEiPDdn96GcY+ZsL55cmEbUR1T95nhjkbbKc3jTwYPhwCWWn3VPd6gfdSED0A01wH9Pso55lLDc/MnKW8ImRuD0zSlJ2n0IwYIn5/xPj0+u62pkE5IhL/9bV7/os9IUoTlA01sruzgIGgJAAeBgFUi3MZW51rr8n+LecBarWfZ0YZpnlB9ZihmPdThoQ95MyaLXCDYJD4Aiaq6zJEp8PTCVHpbBQIVoepxuufcSivyyLjm/nSqjDa78zb9PgX+AnqZBUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=none; dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0v0khewHmlpeYl8AN2fdz+bUXCc/b68I/t/na3tlEoI=;
 b=RE2AEGiJlIRDkB2o/ceN5BK1bo/TojZdx9e3pLG/SLUDD7tM+sQPmi4BukLJJXE+4skW9Yq4YmuliUYlczQp9oJ43K07DhAjyiachqw//PcTR4Ve34d7w78DWK4Md2PpwEQY4Qq9/9oXwcjRAzUYVSFq6UXCo/Jiz0egm/SWhYDENCJ7E4DN4/EPzOGaLOx28j1xUjnijdkfkAPH+LsJJjUkH8eomObSPvBARGtf3203mB/Pd9L6/bzorTfd+Ji4NQ9Ke3cakJpbjaZ9Yaj3R7kzE0OCr3L5BuIHfdDYFugzYuZntGLRM8/jGroHPcYCty1LbKY7pwaxwTO1x6BVGQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by VI0PR04MB10319.eurprd04.prod.outlook.com (2603:10a6:800:231::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.37; Thu, 17 Apr
 2025 13:53:42 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%4]) with mapi id 15.20.8632.030; Thu, 17 Apr 2025
 13:53:42 +0000
To: openembedded-core@lists.openembedded.org
Cc: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH v7 4/7] meson: Fix host_machine setting for native cross-file
Date: Thu, 17 Apr 2025 08:52:46 -0500
Message-Id: <20250417135249.1720715-4-user@yb20>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417135249.1720715-1-user@yb20>
References: <20250417135249.1720715-1-user@yb20>
From: 
X-ClientProxiedBy: BY5PR04CA0026.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::36) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|VI0PR04MB10319:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a35515-1511-419b-2ca9-08dd7db743d2
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|61400799027|52116014|366016|38350700014|1557600111;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ttE0AGocoYLRED6V+xOEiwZ3Xyjgkb3NmAgumtU7JWqekLEk8Z4P8k079u2B?=
 =?us-ascii?Q?/8Azs2J7iCnadN5EmmvKvVpJLu5qCyID7qwviwSi2+88vxuqzMKjkeezecXS?=
 =?us-ascii?Q?giz/5pzolnjgepRdpToylAZgPuDqidJORlSRXmO/cWAydnHD9imLNXwdvnQP?=
 =?us-ascii?Q?CmK4LqZ9rBKthJiNJLCO+Wqi0L9OHZVpMx+KjwcaQNoTew2YGvGlYheJtnC9?=
 =?us-ascii?Q?9Nh+LYa122KvgyYPqLNlAa+lX4XyoMCp0AsI/3JQ4SDNvkOo4rc239RTW3jc?=
 =?us-ascii?Q?kHPt81tJtCOTixJOo1on8QLb4kpTM4gmjhGtcgnYjOO9x/xstqY4p43illRq?=
 =?us-ascii?Q?3NDoi29GeRhZ2iyeLch7yZELIZ8jQhCI+0EZicldu5+Olt4XTS4AcuIX5Cah?=
 =?us-ascii?Q?pvbSz923Jp1vJPmntsVsakSYm7Eb3yGspdeTAHGK6LyGmOa8+JrvyGqMl2Ny?=
 =?us-ascii?Q?iLdIrLYF5+/IpTGwpqzJJreAdtsSHXvKBydeNmHlGSp79siA3LZNYDISdgym?=
 =?us-ascii?Q?8MVo4zqWS25dWEX5Ha1bd5H22Mlx4tBVHDPKfNf38Om9/7amnuPJYVRYmfCt?=
 =?us-ascii?Q?m5Bcsw/Pyv41v/j5vw3Q8qeeSxGFEObjYotN1X0I5J5tIrVa9qsAeev3qmHs?=
 =?us-ascii?Q?rzP2iUF3SlS+WXY7KgRGkXzntgwRyy3mOyM/3FqhinFJeVYtPYgDe++D2dY0?=
 =?us-ascii?Q?fVAvPxFAGnh/fASm2pYkA0LUfPrm+P5w2cZfjOkwX7l9GyPVaqkmZmGR4j/B?=
 =?us-ascii?Q?6i2oIjUa3/HNVCA6ZjDNyMktjAEczLmkRJOekZzkEdfLTTpgqSsxsnfDC8Uk?=
 =?us-ascii?Q?nx3igJ7vz8GNEyaew5CwJjmVnRx07wsZn7NtMGKA3ZPimRsl79daGRMKwbC9?=
 =?us-ascii?Q?oraR5K7/xwCeiIkIoRun8zJlycWMv/1Eog++auz0hwHu44PhgSYKVfyuD8Mb?=
 =?us-ascii?Q?cHfftVIsujbj67y54O7W2X0ijJd/+s24ztDd8eCzPWxXpQ6ip+KI9tgpU3zo?=
 =?us-ascii?Q?ZIAjZaTz3XjIvFCB7Wm/Bl1p7/E0lQ2sx34m0/RnjhAKlk6mba1drzquqBhW?=
 =?us-ascii?Q?RPcOAmYVkjOLD6cfHaGwrE7b1xIm9qB5CxxDtpH9D2+XmaFG1QRFVeY5FJid?=
 =?us-ascii?Q?fCzclCfmvb/ogsZe43cIK7vJYLFwY6IkMz0gEIGgc/QmobJgreqXJVD+PQqC?=
 =?us-ascii?Q?mDam6KLV8zeicQA0kir4Nb+pl4+1Ty3t+dEfI59DKdbba1iFBPGS5yS9wqVb?=
 =?us-ascii?Q?NEN6EkvMqAgodttypRFcewpdI2LADs6RXJnuFertBGgzmEipD3kFnOC7A8ZX?=
 =?us-ascii?Q?c8xFNLVlO/D75K7MgtSku2I4fxCSHMJy0jb1JcbWt1Z0rIEiyDeBuCx8ubgb?=
 =?us-ascii?Q?MWPCIBAy8DXvI3Y7OS0ZsOUIS0ajxuGPP7ICV+N52xig7BTiTzhRHZc4XAg6?=
 =?us-ascii?Q?9aKLJypvBuLEzTP5+rE9CDXlXmM2a/C3A0p55cR1HlYl1lgCrdz8S66MRJLG?=
 =?us-ascii?Q?dWsxvhRu1xXXL+o0qItUNh1alAfeCmRA2LO3MenpK058YfYd+GOyiwqYvcyc?=
 =?us-ascii?Q?agkYKGWW2oL2dFLsY1VErv+iPlVSvl4jeJqnzvLFw4U2w2SpZt8eDasnzNZa?=
 =?us-ascii?Q?ohuACd8eN95xpquImPseSvdwnOC4e1Xrir7s5dZxM7XfTjjkS1nxUqqAzbJ1?=
 =?us-ascii?Q?4Ig38jfIqkq2RygQdJNsnSCS81AxRRSeKFD40wYUiKyhkzv5JtUjlbn/oiI5?=
 =?us-ascii?Q?zblEWedZnjhK7AgQ9i3Fp4au97+S/TebNHrzGNVNxT5tbasEmTaXcLLOTy/U?=
 =?us-ascii?Q?fb2moVG24MYr92YMdJQneFrEWjbt2N7RBOUgIJaqWlS7U6bm9TsCGEefC8FF?=
 =?us-ascii?Q?x075lHz+ZpICCJ0YHo39ud5bacIzQbQfVn5TklWC7tiYiKOjhyoZA3EzNbK4?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:6;SRV:;IPV:NLI;SFV:SPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230040)(376014)(61400799027)(52116014)(366016)(38350700014)(1557600111);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?SuInNWrtNPbuBcRb6yB4kjjg+Rmh8KmEr2j+rVxb5kbpdoQtRUC0IPdS+JxG?=
 =?us-ascii?Q?LekF4PJn8sYw6CXbb5uGckUmBcg87dGA/XXVzB5D0PQqV2dRlNMoKKbHj7lL?=
 =?us-ascii?Q?Vv5KFcktpENZ+VBYOuW35Yy0l41LbVSaelWkcGJRoli08mpK/bAdSRJ/VK/C?=
 =?us-ascii?Q?iKZKJSvyeZhyytqM4PN1+7u/WvFs/O0zsLgIfEKPWyHTwA9QGDAQ/70gVhMg?=
 =?us-ascii?Q?GBObClafY438IlZdduhssmyyJkWY1XQBEm5GoFbLMFd1+/ONycNHtFEOt226?=
 =?us-ascii?Q?vdoXtczUgL2LXWd/hpzmyCbxR/HLCeuH6QwLEfXldcDRFSPg+b0Z6jPDzFXq?=
 =?us-ascii?Q?3NlTtQ8J+ml3VLD9MH8SVioVXIf95Ze9MYSd1TnLTsmz8iTVXuz/kLsCifwe?=
 =?us-ascii?Q?Z1PVxBqbQH1k5zrAZBq+cKPyseCzz/M5TsvwgAZ5HZNFMU/G9uYPcMGOvJQc?=
 =?us-ascii?Q?/5/8rfj6xDILoyqtjoWdKxFgebbRYOCWxeQ7344TFJmCJm8E+DTmevTCJoFR?=
 =?us-ascii?Q?l59Yv/9G+3jTxYoonqNU7sbC1Bg71MA2TQBL7Ae1MeZO1d5kL0lfF5992hnT?=
 =?us-ascii?Q?WlgX7xkbdvO8p3qbg3krN6wd2zL6fGu7vNxEcKYfaGrx8KkqAubJL2+mY5Ko?=
 =?us-ascii?Q?CORGMYPKRXTw0UmRYfiecmhXWlnevRnNzmRuAAMdmbR0an2bXi6gLC0p/FyG?=
 =?us-ascii?Q?3BBRUaG9nk2/M5co/q13/fgWLBxHVF+fvl+C/hhIObmLe9DbAETq+DBDCQTV?=
 =?us-ascii?Q?SmZZu0PMi8DYZjAtfG4ngzRglB6FFZTeJB/UDjpmopmuVTjvW9UFkmAfAhqR?=
 =?us-ascii?Q?j4W540gFj9+ys6R2Nhc/YCWs67MEw/aedHDjQwVPjluI9/c85SOux2TK9f+W?=
 =?us-ascii?Q?S3MQRaYIBMY6vIh8sFj219yel6IXI8m9SQBiu2spIJ8ta1/qotRo/d91l9kA?=
 =?us-ascii?Q?huf+62HJeWB35vWC3QBuGHISZMFXoZGddW0cnTMOZPZEzIckVGWA4vOiTicM?=
 =?us-ascii?Q?r8lgwjkJ23Qa3FVRSVU8cdvpSoy0WGDW7o/yLuTZT6gVwPURC29sjLbPzv7c?=
 =?us-ascii?Q?ULwzxF3GiDNJ6Wd3vn+Tz4dRtD96iP6ueks6m5vj2bOaN/D9weKB9trVLOzY?=
 =?us-ascii?Q?pVkaqgIvT5HihIGpEkfvvvYXCFZxXd3ddFHkF/Xk/+O7iWtWO/M0xaJ3c5Ak?=
 =?us-ascii?Q?f6Sq0adnQ5jyP0A8VIinSBNKfEqlTBd3bPG82gkLKyxG5JnUIV+xMbscKHkV?=
 =?us-ascii?Q?cqK80pvGxt4cVQY6rz0IeKiKDfVPNyh+gdzxPrQ+CFyvXTFC1QU61R8Zw9vF?=
 =?us-ascii?Q?1tWFEx1z39ZnIp6JdViBSuLM88mWeEH/na0S3v6P6RvMCGDibPaoaoqsFRuD?=
 =?us-ascii?Q?6Y0aiZKTKpJnCo1jZ7Z1xyRGYMNagc/uzqhflRew84o6TbEwueky4c/PTqHF?=
 =?us-ascii?Q?ty8LVLdWuZ1xSR1ugebZuVP/+rKg/ghcTu5nCvMJcUX/hEL2qif+NgB5L5cF?=
 =?us-ascii?Q?sbHp4BX0UzTX6gGVOkdKUl8rrE7vyv3vBkh6B8vMNJ6WuIGsBnx3sD/sSYMR?=
 =?us-ascii?Q?b6pgBT4qkcJkIfVBtLCMO7UljkrlZ8mMPgrovgBa?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a35515-1511-419b-2ca9-08dd7db743d2
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 13:53:42.8457
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yP0Ebm8jzgv0k2SXIS5xa86fXGM+tocO7uW2/lGJW/u/pwlu7QU9KTSb6bTpQHRnPBWTlGLyBDLNk8RC1ShZdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10319
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Apr 2025 14:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215087

Caution: This is an external email. Please take care when clicking links or=
 opening attachments. When in doubt, report the message using the 'Report t=
his email' button


From: Tom Hochstein <tom.hochstein@oss.nxp.com>

For native and nativesdk, the meson cross-file settings for
`host_machine` are incorrectly set for the build machine, not the
"machine on which the compiled binary will run". See
https://mesonbuild.com/Cross-compilation.html.

Fixes: [YOCTO #15485]
Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-devtools/meson/meson_1.7.2.bb | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-devtools/meson/meson_1.7.2.bb b/meta/recipes-devt=
ools/meson/meson_1.7.2.bb
index 45a74612ce..7e9c661818 100644
--- a/meta/recipes-devtools/meson/meson_1.7.2.bb
+++ b/meta/recipes-devtools/meson/meson_1.7.2.bb
@@ -107,18 +107,14 @@ needs_exe_wrapper =3D true
 sys_root =3D @OECORE_TARGET_SYSROOT

 [host_machine]
-system =3D '$host_system'
-cpu_family =3D '$host_cpu_family'
-cpu =3D '$host_cpu'
-endian =3D '$host_endian'
+system =3D @OECORE_MESON_HOST_SYSTEM
+cpu_family =3D @OECORE_MESON_HOST_CPU_FAMILY
+cpu =3D @OECORE_MESON_HOST_CPU
+endian =3D @OECORE_MESON_HOST_ENDIAN
 EOF
 }

 do_install:append:class-nativesdk() {
-    host_system=3D${SDK_OS}
-    host_cpu_family=3D${@meson_cpu_family("SDK_ARCH", d)}
-    host_cpu=3D${SDK_ARCH}
-    host_endian=3D${@meson_endian("SDK", d)}
     install_templates

     install -d ${D}${SDKPATHNATIVE}/post-relocate-setup.d
@@ -132,10 +128,6 @@ do_install:append:class-nativesdk() {
 FILES:${PN}:append:class-nativesdk =3D "${datadir}/meson ${SDKPATHNATIVE}"

 do_install:append:class-native() {
-    host_system=3D${HOST_OS}
-    host_cpu_family=3D${@meson_cpu_family("HOST_ARCH", d)}
-    host_cpu=3D${HOST_ARCH}
-    host_endian=3D${@meson_endian("HOST", d)}
     install_templates

     install -d ${D}${datadir}/post-relocate-setup.d
--
2.34.1


