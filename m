Return-Path: <rasmus.villemoes@prevas.dk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907E9CA5FA2
	for <webhook@archiver.kernel.org>; Mon, 28 Sep 2026 16:12:25 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.61306.1790611940484597262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2026 09:12:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@prevas.dk header.s=selector1 header.b=QG9H7ro7;
 spf=pass (domain: prevas.dk, ip: 40.107.159.20, mailfrom: rasmus.villemoes@prevas.dk)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W41/PSQYmjXTsr3kn60pVcbj5eECAoBLOqFB/JcBgEAhp8a0f7nKbP2FZ5mPCeWjNM5isKuYqaGTc+CTwcWfS6FixWGvBDKtawKNBigslTEjSgSXf1TVbRyVp/lm+8je/JiWdgKd3wciuDQGp12+G7jzz59ZuiZCcrtuVHsxOGZRtRiCiG1GBARwJ4mSfBOmtCu0Ue+oQOu2mxZX/b1JmiFSXIi5+XgO97QlGTGCGgnp4sZdqyTMc3QMDqo+lLvPdT64vbiYgjtdY+BirUWY4wY16HjCnJsjFJSqDAt+OvMnf8LE2gBpnpJbg9a/gDm+wgkkwMaUmUOrHOTXg7+qdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l42N6q9zfkndJazhqu+Pk7bsPVgo/boQXvxlTHW2M2E=;
 b=qT8LcJIpvxkOk6Fgq2lOAEqqlkGuw9U0A7C2s0MJMUHWw88y+pDGlrA4axkcI13WxC4NGAHM2Ql5VqFFt07c7EeDLu7INVOu9fPg/GVMH5hA6NBmozXemWXLvUh9EoUqm5HbmUARDEnAjjXWXSoILs8XkdB53SygE4B8xslizVftOVbmqlrzrkuDDghcDSLvoER6Wl7G7XbtY08mWzWmY0KXpOB1/bz/oCLE1GTgVk5nYcJCC3pPWAvTjcp56WOm+wIEzWxpPp8/sPbunTX+HlhwuyAk/vbuH2OKxv+i+EgQaCXgRRTKW8vllOrn95cQpESMRId/3YGqqWJf9g1rKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=prevas.dk; dmarc=pass action=none header.from=prevas.dk;
 dkim=pass header.d=prevas.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prevas.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l42N6q9zfkndJazhqu+Pk7bsPVgo/boQXvxlTHW2M2E=;
 b=QG9H7ro7Jrz2OL6wFLJRhleQiDk46NddMucWZcPdzeZ7bMPOvK4NXAfKp+ToZQgtbDb1Sph99WqTbLCNEv27vh1biKH/K0xQ6XFlLE6WxbLctwHEAVNcsBOX+NHWzTVLtp4IlbPHWAFxlpLyJfL3UlvxcDiPLQQZD9rX62n8q0U=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=prevas.dk;
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:681::18)
 by PAWPR10MB7173.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 16:12:13 +0000
Received: from AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8]) by AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::ebc6:4e0d:5d6b:95d8%5]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 16:12:13 +0000
From: Rasmus Villemoes <ravi@prevas.dk>
To: openembedded-core@lists.openembedded.org
CC: Stefano Babic <sbabic@nabladev.com>,
	Ross Burton <Ross.Burton@arm.com>,
	Rasmus Villemoes <ravi@prevas.dk>
Subject: [PATCH v2] libubootenv: add yaml PACKAGECONFIG
Date: Mon, 28 Sep 2026 18:12:10 +0200
Message-ID: <20260928161210.1771353-1-ravi@prevas.dk>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: CPBP307CA0003.DNKP307.PROD.OUTLOOK.COM
 (2603:10a6:380:1::15) To AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:681::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS5PR10MB8243:EE_|PAWPR10MB7173:EE_
X-MS-Office365-Filtering-Correlation-Id: a5cbbf14-ce1c-480d-63df-08df1d7b41c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|6133799003|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	mz9X8PTQ88i4axBXn2YEbAMgFiKgScobiNU2NUWq56O0n8DMGhr0tIFM7A3O8GmS5WDL8E42KZCukgRmiC+qixVIqUVAGbSdCTb4kVtCDy607BqQhTs3R7GwdfWtoKNwT9F2VSnBzT7NA/MRM3TkaznASCGIux5xgqBBl8OKoJdcnDVoB9OWsv0ChvyC8MpZDVzk95SM4JB9G5Ya5HIvUA1Rp1ryo5UNPsC3flbt234gAOW1wbaUfp7WpqoIuwaE5gN54MRMVjyc0NvXAEROCazENLXmGW26P04LOPGZU/58MfpVFFd2LA9N8ZessBQjxfV/qK1FIkDGDLDro5cugy/jAMtCj/fJqd5FAQr+UzxCv+8QrGHMRQR8KdIq1+88HHcadHYID9nJEZ5AhRi0rGUFxRuUt8Ue6+F8axYHuqyP4RQI9ooxwTX3AWJFbhwAEzKSjqWRoQLsa8jrPSM5ATD1/bnTXRtqD1xjAEOPn4Q2IWPXmIf4LOwxs824zTdDy2pFVyLTIGT1p2JpyYnX9NA+2E3S74muFMgfw8cjQD8OrixoSFPj09OQJziq2ErxPfpkJWmjq7XrFaj14RZ6Ye7zL9QIbnY1/0KlBf37glYlQCaL7tkz4Sqg/knE8+43zXCwnRLeTuFLHriQIsUbMRzSCEcth7J1NMbt9YXx+d4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(6133799003)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?urAzjE+9wCXM/lUoNUYjQwK5PmR2wtuVuyfLz07w3tfba68QyR7c6FTHRKMD?=
 =?us-ascii?Q?g1hSjqXA+B140rH/5xk48ytE8sXtrSJ9R9VESMFCk5RfumkkxCH4pkul9+jE?=
 =?us-ascii?Q?sOFwcOyw9vgGZA1Z29+8eF7fRBzdYu7qkskQZ3ISXvvTAlAlddHk+SUOEMQj?=
 =?us-ascii?Q?waN8XaUsUJequtO7tQDQbY3oA53Yn2y2P/hbbp1/Pr/gJ+yAMV16hi7Oa6tz?=
 =?us-ascii?Q?zY55ukpXm+/iIfbdIS5iH7kMkfoq23GiYxndipobXIpgj9NOzSbIFK0QNZ+Y?=
 =?us-ascii?Q?8d9gSKN+xl8YO6Ksyu3XmylRvYmjF9tcMpbx2fmavQkl+IN+0SohDjbY9Dyz?=
 =?us-ascii?Q?MN65cJfTXfhL4SEEkmhOC1NvPzx1peaydMYWH7McnpeM/bYTJGlTzSyJBSsC?=
 =?us-ascii?Q?MdanEC2cOqQy9vzYtOOuVlIUbAcqOXHNXdgD70C4/u0lbhilkBAcoWljjZ+O?=
 =?us-ascii?Q?IYFi1xHESvJ14qr5OL/izOR4whWYjq4IWFfHTOhoyejfLxea+xREsvQTuNZz?=
 =?us-ascii?Q?Fs4Z1EZ6JTF+rCMUTbey8n5Pn2sFDdE/Hosd3clWkqTtLYgoppbK7YrT2+m/?=
 =?us-ascii?Q?v/0F3zfWyvoQZesfqD4pUJgKtr1T4h+4cxxOVAF0N7I2OEADtaK2eIoTUhwi?=
 =?us-ascii?Q?U30elqAQkC8lq+LnWzcqmVMP89SBWBIwS/JRGliG3QUCTCunHpjvSapoQIeN?=
 =?us-ascii?Q?aGajtZN9lWj2bi8qfiJp9f4VuybDygwbBcn60iAjM0KnZViPmGNAslfqkB8Y?=
 =?us-ascii?Q?jKCTVTXMFjg0J03WkTe9bgKwvO6LkR/+tJs3QHpiwCsVOnBS9s+MpPJ/qboM?=
 =?us-ascii?Q?XXvZXXVPQ+/eKQBfteSp5aXDhpAVG5hz+baVPvRPj4+uFrDO00wXU2rIl7Ge?=
 =?us-ascii?Q?JfjzarQUvQQ1Wn+hjnrGeviYJsDczkxIFGpsC/8AQrGq1BjBzGWJKgEmtpGC?=
 =?us-ascii?Q?9z+FTiGa4q86t4zbk5OXLTWkGXSmigHwCx2eH6C1tI6Sj9CqjjeKQJTue5RZ?=
 =?us-ascii?Q?goQUN45403/vP1leD3UessOCcsaQ3+gHF+a73urqCUpBeORAWUwmNFnKn7iK?=
 =?us-ascii?Q?enfzD21ZDrDLoTRbw1eHmhqFonh6cbK1aB0NKlpR5FslUsqlUbNvbSokMfca?=
 =?us-ascii?Q?g9nYuZzdZJxeS0DHLw65LF73pb7+ifcU18oaKrOh+vPw/hoIM5l5BJY2U+Hc?=
 =?us-ascii?Q?bWtBSvt6OdEOsD9q0X6Uyn4+LhH0brvv7LxToVtNndkcb3MhuNtZwGYKUhDd?=
 =?us-ascii?Q?2cSXb0T1wZluQQOJ6hhY0sQ703uC0qsNCGKJ4sybXZSCc2samEQuD8JCLFov?=
 =?us-ascii?Q?IzwiX+8CFp/oZMVgqAeYfARGAmbYbH7JGAJsdAIR4ycV2ybV2TCsmqsWpyGi?=
 =?us-ascii?Q?lyxo8WVp57WaHRd09oPM8H5O6P3AmZfeu27Xaz265qagz1ejcGhobZa6Cgjg?=
 =?us-ascii?Q?xjs2DYNFZnW7Im43+jhFESgUcTnY/sac5ko6lCKkL9YI6m3oeOuY+7gHDFx5?=
 =?us-ascii?Q?ScJ83KKiQZBAtvnRwZZ4M7/yFCOWL+RcI8gjagbSeGXJWdUSMac0hB2VsfKZ?=
 =?us-ascii?Q?SrQAx0nvmN7K+D/ocPD/IgH6OimIOF3TmJvBiLb2w6AOcyZhTQEGrVuvY2L7?=
 =?us-ascii?Q?yh9mJwIfi2qB3SSjMmpxrwt5sTjsA2iaIRxxuGCruuJHPH4z8cV9ponoBcX6?=
 =?us-ascii?Q?GXG5e6/yEk72IWpJtayLRa5sP0PrXXOYZNHq5aDSgZB3gVIbyCPJ8MTnvr4s?=
 =?us-ascii?Q?s5209IRV3diKyWgXUu6RibgyMS/H9KY=3D?=
X-OriginatorOrg: prevas.dk
X-MS-Exchange-CrossTenant-Network-Message-Id: a5cbbf14-ce1c-480d-63df-08df1d7b41c5
X-MS-Exchange-CrossTenant-AuthSource: AS5PR10MB8243.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 16:12:13.3232
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d350cf71-778d-4780-88f5-071a4cb1ed61
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AUk1c6Aut//mo6EviiG8nHnkXfToEJNdNwPQiiBfGrMs0zP68PnOrHwaopJ1zFDc7dj+h+OGibmLCejkgCX+Ty8AtNjycbNdo+1S8+kft4U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7173
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2026 16:12:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246773

From: Rasmus Villemoes <ravi@prevas.dk>

The upstream project supports setting NO_YML_SUPPORT=3DON to opt out of
the ability to parse its new-style yaml configuration file
format (i.e. only the traditional format used by the env tools from
U-Boot itself), and hence also removing the libyaml dependency.

Expose that as a PACKAGECONFIG knob, defaulting to on for backwards
compatibility.

Reviewed-by: Stefano Babic <sbabic@nabladev.com>
Signed-off-by: Rasmus Villemoes <ravi@prevas.dk>
---
v2: Add explicit -DNO_YML_SUPPORT=3DOFF to the positive part, add Stefano's=
 R-b.

 meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb b/meta/recipes-bs=
p/u-boot/libubootenv_0.3.7.bb
index 7b5300f38b..854814139e 100644
--- a/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
+++ b/meta/recipes-bsp/u-boot/libubootenv_0.3.7.bb
@@ -17,7 +17,10 @@ inherit cmake lib_package
=20
 EXTRA_OECMAKE =3D "-DCMAKE_BUILD_TYPE=3DRelease"
=20
-DEPENDS =3D "zlib libyaml"
+PACKAGECONFIG ??=3D "yaml"
+PACKAGECONFIG[yaml] =3D "-DNO_YML_SUPPORT=3DOFF,-DNO_YML_SUPPORT=3DON,liby=
aml"
+
+DEPENDS =3D "zlib"
 PROVIDES +=3D "u-boot-fw-utils"
 RPROVIDES:${PN}-bin +=3D "u-boot-fw-utils"
=20
--=20
2.55.0


