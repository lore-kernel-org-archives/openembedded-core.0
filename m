Return-Path: <joerg.sommer@navimatix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00BACCCFA08
	for <webhook@archiver.kernel.org>; Mon,  3 Nov 2025 08:22:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.137])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15849.1762158136543386658
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Nov 2025 00:22:18 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@navimatix.de header.s=selector1 header.b=R7vvy568;
 spf=pass (domain: navimatix.de, ip: 40.107.162.137, mailfrom: joerg.sommer@navimatix.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X97tEAq2n581o8gsMwnuF1dLqt0yQgs76tZOKpI7Kn2jbjWKkdeRSDJrbAn9FurBLAntN0dNXFD9yrO4YuSjv9+1w594mHljHP0QPQjzmYDDW6FDD6Wxr67Exsp2wyv8btk+12J4PXXgLizRrZT0cujxp2jM03mVJH0T9kSOby9PEQTqJ1rCETbcW+thadlafqvXwFZhqe1ID9CR76/qxxAFpOuL+Kg8JzL5UE7+w42igcVpBJmF0MnXHlfeUlpl1zf7xyNkEETpLOVNyU+6d66rqX+QVvdKx/J0RD0OJ0F8st7Ll2+GThrN277iBFAELo8dCgf+wQT0iKjTjJivkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wax/CrKRmtqA8hE4yxO0XHUN5J20SZRhZfYVTUpw1NE=;
 b=nVPSFVMiOT2G/2zfl/eNkZaOesCS09u0Rg86CEMvRwISNXMwZ5uq3QjCCe1C2W92n/c/cGqd2WCHgkIIP1UgvBxFklOkwCw+r4pYGliL42Kw7obTTT6zi5sOG4eD7RPLtivhiV9p5K16QdSVCyC82qLBEbxvUFCkXe+jil/5P5D10soxXvnXq6btiN8hMjJDvvdVMKFRMEyb8ivZf6Bx8bLkGvVryXT9jTlOQeIvGCqG9V1IbpjeCPYwHnk3DZXFrGpTSZ7ey1UWUMJNzyfoG7kbIWmfPOTS2FtEPlC+G3LPEUfwYQZ32XB1Dujq1sg5gp/R9tDocVoTa2GNlfN6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=navimatix.de; dmarc=pass action=none header.from=navimatix.de;
 dkim=pass header.d=navimatix.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=navimatix.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wax/CrKRmtqA8hE4yxO0XHUN5J20SZRhZfYVTUpw1NE=;
 b=R7vvy568y53g6RkSwTM0OZ3m6ukVhdTscDpyT4c/gmpgGJElvSBakXSvC1S4ulLXYNUGRXN8EF8L4Gh2FcrViqcvHOQj1Mz09ramVcpfuMyfw+6obu1IH1ILke/7y5/K1C1dcBBnfdjEACXfi6NIaZw/ZN3iaeTHzWyvgiOHHsI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=navimatix.de;
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8) by PAXPR01MB10285.eurprd01.prod.exchangelabs.com
 (2603:10a6:102:24e::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 08:22:14 +0000
Received: from GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 ([fe80::aa6f:8b89:a47b:990b]) by
 GV2PR01MB11835.eurprd01.prod.exchangelabs.com ([fe80::aa6f:8b89:a47b:990b%5])
 with mapi id 15.20.9275.015; Mon, 3 Nov 2025 08:22:14 +0000
Date: Mon, 3 Nov 2025 09:22:12 +0100
From: =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
To: openembedded-core@lists.openembedded.org, ross.burton@arm.com, 
	richard.purdie@linuxfoundation.org, joerg.sommer@navimatix.de
CC: Ross Burton <ross.burton@arm.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, =?utf-8?B?SsO2cmc=?= Sommer <joerg.sommer@navimatix.de>
Subject: [kirkstone][PATCH 17/19] gtk+3: depend on the librsvg pixbuf loader
 in gtk3-demo
Message-ID: <d8f7756d6360f7d7c48a794c6a533d8ebdd2f05e.1762157680.git.joerg.sommer@navimatix.de>
X-Mailer: git-send-email 2.51.0
References: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <0d34bc13973f2ff1567713e5de053dfa3d202802.1762157680.git.joerg.sommer@navimatix.de>
X-ClientProxiedBy: BE1P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:66::14) To GV2PR01MB11835.eurprd01.prod.exchangelabs.com
 (2603:10a6:150:2cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR01MB11835:EE_|PAXPR01MB10285:EE_
X-MS-Office365-Filtering-Correlation-Id: 35533a93-141c-47c5-c248-08de1ab217cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?8CXKhbgoRmzpTvlL/62wuhH8mVl7lGzXsp+NID5Lorn574PBwBnexnWENPQw?=
 =?us-ascii?Q?GXb5OSbh7o1NybWI8Ubnd8oW07QjA1GeHwUArP+A2Vjj1eHIi3QvW70ChGMR?=
 =?us-ascii?Q?WAFhYV9Iw3yTUAZFVuhnIv5QlUagMJ6ZYhTQwJZb4A+SUvc2YRPNwGMP7iFs?=
 =?us-ascii?Q?91qYlL/ISz/I+uOOEUIQPttxbNGitVe76BZoEtBRcYeHCOzOeQB0ULGn5p7k?=
 =?us-ascii?Q?ifcbJonwDC388+vH2g47qqmzSm1jcdctEUTb94rf+yfAaK+PHu17PyQbHjis?=
 =?us-ascii?Q?61dk6en6nktqxqpEEloyMyoBGk66pzV72czLt1AKXjeFog8r7LnV8fY4XRmS?=
 =?us-ascii?Q?MEc+PKbeZusoXLkLf/pebu7pbKgObrGKfWfNlbe1D/4I8Qyi7NXjDPrRc7hf?=
 =?us-ascii?Q?BrAMe9EyajEe1/NWD7WXeFX30C0kN19Bta+Ml3PpL810OYhYJhzlG4pBT1Af?=
 =?us-ascii?Q?1lMk97uAio0Zv6FbKi9yPDZFYBe+cKAQHSIOJN9AlRMJU+My8AkvzfQjQFji?=
 =?us-ascii?Q?qAwCyIaIDs122eBzV5Ayix22AVKF+kwKxxOLT1MltTL0OvQlvMM2y2huf5Pg?=
 =?us-ascii?Q?LVcVOD+bJKC+nHZ6QDzVrdCwBLVeTff5XrNe7ZHviYivYJsxLV3Wz7knFNzq?=
 =?us-ascii?Q?a7QPQGR7P+dFuPyH3YXonyxRLvI/gytBDMgiBdSCiDLR1uQ1PQTzqJU6bwMB?=
 =?us-ascii?Q?JVBPDGmKCt+kWCNCdPlXQbC7Rsc8PvgikEdk82Q0ZzUs5Plwmoo2UUWd0YZp?=
 =?us-ascii?Q?3Qz22ewGRl7aTz09Fso5Nc+yIgC4XiGzfEowvvVmo2Vi0FPnsgWb/jd230jm?=
 =?us-ascii?Q?yR9NtpiuL1RKgAQuVqnX955nWg7FsJy3fdrx4sBcL+Tw7UeM5QgKbIrnTnhr?=
 =?us-ascii?Q?J7IuHeNclurCX3KlFeXB7EAqnoqlb7XbOQzLW+Y6tWZl+Du0QDF/GvaxcZVN?=
 =?us-ascii?Q?NpJiSTsGVeqEzOAJ70iBXyL8YMdIpx+I6SHzHguhU3zC6tPUp0ertvAcucZG?=
 =?us-ascii?Q?wHwiCgNmO/sedm5ms6sxdnIDp7JhyLVx55ozTHLyfdkQWa3Py3MAxBn35/1j?=
 =?us-ascii?Q?xTXnxpeQ1T+I2Lq2RaZNuxNBTdH8pjyksCz06DR/BHubH8/9wDkbFCPK74k4?=
 =?us-ascii?Q?x3xFMgoHL2mNuDK/kE9KGCLetaNfw0GhGubhA98H9p+N/y1ir3izTzOJLD4x?=
 =?us-ascii?Q?0tRioKuKc6v7toD57+9TMdM+5ABzLKAJ6CAE6iYrWBUAy0BZp+y1ig9KDzZr?=
 =?us-ascii?Q?0kFLiiMxFCGFdWwE4R8+9kUfJ0NOHVqi3jnfbfKedWXK4I4dgadBh1hHe0Pd?=
 =?us-ascii?Q?3ponRwKOpoEJF8ttGivu9UlTan2xTT3U1OdYDynnhSzANf8a/sEeq4xjk+Kv?=
 =?us-ascii?Q?1gCnLEU1HhI5UFOYS7i1vyaEIpfgV4P7wDK6ecaMAJAqqRe/8Mzo6gpSe+bd?=
 =?us-ascii?Q?PnSRTiyOPFKVCzz6NQyiSiVo/f1Sav3A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR01MB11835.eurprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?qa5I89sV2z+zFCb5POLRk70xoUNs7t2obQi+wdbYoC4pjnSRaS8Bq2t1wi3/?=
 =?us-ascii?Q?nB346AIQf1GNc3lhC5NznUqdOOgQCfKYYnMEWoEGaRCFhzN2hheYzIdtpJzn?=
 =?us-ascii?Q?wQXIOtICOD/e8W12Fvjwvegb27ePuPphm9tMIva42hpd5HTlsARCTTm4ZFSc?=
 =?us-ascii?Q?SclzOGQQJxqfhQbsbwcCmynprf5dRrvqgRpF0aeevtmUlxZeoJASi/nC50Ep?=
 =?us-ascii?Q?mD5BMNvT1AroHWCNHiClrWVaRUl7+VoG4lqmpy3p6YH+hAZ43717EcC3B7gk?=
 =?us-ascii?Q?e/WxT6un88wQS8oXMO3Q/hFrsIB1ZnJMDzsHzGg24hFV2O1vD3HlgRJZgB9I?=
 =?us-ascii?Q?B4wcfJW9rVyDDzAlUWL09wObrkfkmh8b6RNJRhl4P/K000xiErD7IfNRDYu1?=
 =?us-ascii?Q?7T4/5hzjSQNGtyTDVv4Rc5gyECM8gwh01BoF5zg688mgKWVYO9FU2lMqNZlH?=
 =?us-ascii?Q?0be2ZZfzsRjx6pc9fv7nXKPIBb3ypRCF57NBcXToJUG+ozKcLw/BhljvgltC?=
 =?us-ascii?Q?YOTPajJPtOLd69YGMLwjToISBsGsebwtLiuW++i12ohanXBEnkI3MQl4D+5/?=
 =?us-ascii?Q?Pc5pHJGpNj37TV94TS/A5mhoCaGJPlBnx5qgz7NMRSb9dreWSy7DzavCbKU+?=
 =?us-ascii?Q?oe64NX4je/YQIQVf9J8DsS10znLSdrCT+gzl5B4fJJoCEmyY/DMEdK4m4xVA?=
 =?us-ascii?Q?LEWlQE1enyVl3DLaoFrQiV7arBMSJcIsBqaWDqgT3N755NpjbdUfoQWIVHbX?=
 =?us-ascii?Q?yoHFaWD0PfmmFeBjAg2bujQJcT52Rrkuvd2yKA2V6d1Ka/DpFQJ9gbHg4uB4?=
 =?us-ascii?Q?AxtNkB85hNjqyKBuGQBQrgktOgGWLBcHIkhPFghOiaxn62DxjQAU0z9GULLd?=
 =?us-ascii?Q?vRq2huB89LefXXnHQ4fGJRcclJt2WDtUEJJweKcvsIMoXEYAhsZg5oH1F6RD?=
 =?us-ascii?Q?bYKSd+Pwi2tsx0xcpPmxY9yncfXDrtviRkE20V96faeKVtTMJa2ofVOK/waG?=
 =?us-ascii?Q?okeuVE3pIWiho9MgZl9E0+H726z8NrA0Mi4NyffyT/tZcQ4xrnJqhIFrMvFg?=
 =?us-ascii?Q?UO7OmW0bFyVQXWdK3F6wwNKfmqSVI1GiL6sykkip+07aksOSsBMuVuxVg12t?=
 =?us-ascii?Q?RGMM6AlyLSrpV0Tu02pxTAgKWzC365ktP8jHJRY/IlqMflO4S/wOlMWYIAOI?=
 =?us-ascii?Q?IOLDiiimhfiCqr2l65FdZtoBdR6a7zlFMOHCrLSIEyF9pNi4evUAY+wQUFR0?=
 =?us-ascii?Q?j2JKVoPVVWX/keoUttqytU/dZEHfOvBvtFYV8eOH7wzLPDiXEm4OwJyTRH/W?=
 =?us-ascii?Q?nE0C5Q1jHdqX58JgFh9UibP2r/b8SQRy2paY0Byr6VVFzR3HRWOGZb+Jdjni?=
 =?us-ascii?Q?qkv1pfbmbRIC9ZpZFUvvyG7fZ+K/fuBKJOyrnbXhMT6s4ty5BtoTVyIOGPcx?=
 =?us-ascii?Q?IvbMW3wg82IHL6ncSMDaTpxIWQOQnif3EkjJxC707DOR0essGICClQFl90W1?=
 =?us-ascii?Q?xbeMAANXsRoIGHvAf97InLpAqpcWyehd/pGRsV0BhOGrJx7sUU5VCWhoSrQY?=
 =?us-ascii?Q?JKNojtjRqrNhJfWqP+96/wG4s0ejHbKnQXOCjoV+Ge0SWNbk1fddy+TWTYv5?=
 =?us-ascii?Q?Pg=3D=3D?=
X-OriginatorOrg: navimatix.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 35533a93-141c-47c5-c248-08de1ab217cc
X-MS-Exchange-CrossTenant-AuthSource: GV2PR01MB11835.eurprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 08:22:14.0254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c87b4f54-b992-4813-8f3f-4a876324197f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bkt36oh0++lcOv9wPZAWDTw8Xuxym4tBOX41yFhv85XtK8GnIg6CNtJ5P/u6RwnQTL37dlVaLLKhDcNyBK/WZbH5FEOB2bFl96AQscBys7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR01MB10285
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 03 Nov 2025 08:22:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225631

From: Ross Burton <ross.burton@arm.com>

The demo uses some SVG icons, so depend on the SVG pixbuf loader so that
they are visible.

(From OE-Core rev: 77e18e640c42ee3992464fddc1a16760cea9bc4f)

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Cherry-pick-of: 7517eed223cbe42efd022fdf759e846331847836
Signed-off-by: J=F6rg Sommer <joerg.sommer@navimatix.de>
---
 meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb b/meta/recipes-gnome/=
gtk+/gtk+3_3.24.43.bb
index 2171880c50..15870dcc08 100644
--- a/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
+++ b/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb
@@ -142,6 +142,7 @@ GTKGLIBC_RRECOMMENDS ?=3D "${GTKBASE_RRECOMMENDS} glibc=
-gconv-iso8859-1"
 RRECOMMENDS:${PN} =3D "${GTKBASE_RRECOMMENDS}"
 RRECOMMENDS:${PN}:libc-glibc =3D "${GTKGLIBC_RRECOMMENDS}"
 RDEPENDS:${PN}-dev +=3D "${@bb.utils.contains("PACKAGECONFIG", "wayland", =
"wayland-protocols", "", d)}"
+RDEPENDS:${PN}-demo +=3D "librsvg-gtk"
=20
 PACKAGES_DYNAMIC +=3D "^gtk3-immodule-.* ^gtk3-printbackend-.*"
=20
--=20
2.51.0


