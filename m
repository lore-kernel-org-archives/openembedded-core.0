Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A3FC282EC
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:00:30 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.65.135])
 by mx.groups.io with SMTP id smtpd.web10.53023.1742220020291075222
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:00:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=JEvA8Ndx;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 52.101.65.135, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJul88LT2pVi+TN1k9G7JlsSJnTytt7Z3SA4uqVoNOge5eD9rQDYuU2jQ57xTyjYqEDPMDCTKZjRIX/jnneTETZ6meShCgU2ZmmWsU+7HJHFX+U1mcWROsrceIIi4bNDplwU8UfFYJWpUdmgGKmen3eucqSTCopgAMMkxOO3H4JNh6aUav7hi6NsvnHJzJfU2Z9lb1wSMPyjMF1FWYwba6idsKiDxpMlWVGV7lB+kuHz6rfhFUv+QnaYgx2Qjsry/zKl7Lz3590+w+vus7MUYEgn5LzmnYna2Glz61dCUcCE/09fSUvCm/wCp7/497daIWbXSIRiRycv1E9mZ/oiPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UbHcVyMUApIvTv7IlSzIxrJ02GqyBZ9F8QfYb2d9GLI=;
 b=jVmexnNPbn4vsj6y8/fjCf0Mbho1XsTVQhUl/lDxu04qp5sHygyUuEeDSpVytMk6BBfuwS9rUHpEg5V1xi2WxDY7KVgQ4J8apQqnAohrx4Mp4qi5Uq63yXBFoyuBGqXozGKdzsUoxYJGVECcWdFX2N/8w8L2HwZbpe39XaUN3mgf0Wp6miKaDVyYM0c64qE2xXesy4g3ruzxuWJ+R8uCLuNpsyamitDUvpjfxVxB4qu32PMzG1xpl65NwqY3FVqWnAnpc1SUkSww1EqslYcjLEG78eKNAjxXEFUIXLPjoz3ZyC2G10u0FfXOf/7l9WwJIXO2Yqkw9UKdXo89GA4MIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UbHcVyMUApIvTv7IlSzIxrJ02GqyBZ9F8QfYb2d9GLI=;
 b=JEvA8NdxKKaB4cyfkIuP9lwz0Ndv7U2hwaJA5EjZcLk/mucrLA+0dj8IYxepYoJtkCHfXuEaFKeP97jqLgDKYm+QCO/YGls08Yfk8oMsOxhiOJ1ErKpp2bz60BDy1PD/3KWEv6hjIa/Jook7doEPO4uoWebmXR7sYrVFuGT2YLyzyiv4C8tyFpm4NfKEbIR/rHUzCUgawjLJw15Y+QczIkOwtKPsyS6q0Lt5qXO7jR+2uNodB/53/E0lQTVrJqBTNSTAscXoFvn3OjJSng5EuccyWynCKh/XbmSl7SHQJFtsjUzkt6VeGRTXhfMClQotcDpbR8vymT/r8SLAvWWTHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by DUZPR06MB8819.eurprd06.prod.outlook.com (2603:10a6:10:4d3::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:00:17 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:00:17 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 2/4] packagegroup-core-x11: Avoid non-ASCII in RDEPENDS
Date: Mon, 17 Mar 2025 14:00:02 +0000
Message-ID: <20250317140004.1808848-2-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317140004.1808848-1-niko.mauno@vaisala.com>
References: <20250317140004.1808848-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00007A86.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::618) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|DUZPR06MB8819:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee10f6a-58b5-4054-51fa-08dd655c0c25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?ci7s7XfsRaR3pqDiiqE6FKFc8BWIYRMUTLs636DbGfPzRF2dvbk3KUoshggP?=
 =?us-ascii?Q?IC8VRHSG5Jyr86k+6bKi9rO+x+DotzGKY4zojr8hfcZXydrYSWbd3jQpYRLi?=
 =?us-ascii?Q?VIdk3lzrk3l9G92WcCoOWOAj8jY4I7zCcQBCeq84fgG0GAm8PRS/7JbadJL2?=
 =?us-ascii?Q?S/BiW5pbgMC7bX7LvkgQMocxACJ14mksvL1bsnbWCpIuQT99L6UhuOyHUUHD?=
 =?us-ascii?Q?2flKAsYP++Ne71OMbmeQUyXVNgFYuK/6hl1IK+OkJP8YLppiw1PpISTiy31g?=
 =?us-ascii?Q?k8UGaaAYwjFzuHAhcm42+bqWPjrul5dwQm9we1WSgISs4rx8FdO08qhZ0YB/?=
 =?us-ascii?Q?yQoMuADKRdk1AF5eh2OGn00ui+1v9LkAqm8h17DHEjv0kljY1rlG0mwNst+I?=
 =?us-ascii?Q?mojX9p/An0HR3ZdbhQw33o+8o7DFLiWHSVyJdzbOGW46VqIyClCf1qarZh6J?=
 =?us-ascii?Q?VVtuDQpEoJYr4MJly3vecKAcHisepgl/8/z9tJbafe3yLaVbEVkV4kYlNIFy?=
 =?us-ascii?Q?EVtYAcbI8x/EXPlemiKW0WMnJv8BhEFfbxU7H4Npekr7uZMhGLNQ97YTOw9c?=
 =?us-ascii?Q?olrsCiyRL145KEjfyqBCilS87n2ZZYorl4/RYbE6vwCziePwFlF7ecOakKNr?=
 =?us-ascii?Q?vmVmOmwOkg6I+Hkp54wUDVQTumoTPM3CyY/yQN5uHtaCjJ2qFJZ84tyyl0gJ?=
 =?us-ascii?Q?zgpuh4H1YIZsrUnnStAEA2c9sjIHd4tHiKs2mabFGu9Dq/Zr/uge8AhTP+mh?=
 =?us-ascii?Q?4f20IO/ExeWkq62vqrkfJkv+TQoJsRzn+vnjziS2P8FwuIMx+jJvY8qmsK46?=
 =?us-ascii?Q?i4P6aBZdSNlUrb0jDqb62BlGB5BC3WR3wypuEj2u1Gr+tQojkHw5P3rA2InI?=
 =?us-ascii?Q?s5j4SK9sRKINYdqxXat8uTFBi6gJVwAWf1jQtlIc+bxeUttqMfXz+NjRFyzl?=
 =?us-ascii?Q?0cgSTwiRyZ+NQkOzrjkUZQ9hueZXID+/P8ceMd35Stw5cbd68NsmQGujGFDY?=
 =?us-ascii?Q?CUArW0w+OgqJ0MeeqNjiJFB8bc5Bmuly8zDtrOdNipwg421QMtUdb1/iYjma?=
 =?us-ascii?Q?5aHkrJgbU1BMfzi3yuGJ6eMo8JzePSU6rH09ricxQOLfOiMwU0OeoxxdsVxb?=
 =?us-ascii?Q?nIp6cr6sO113/csUnz9v2KaRFHoNO6rWaXIEotTD5enZS7ht/MfdNIER556I?=
 =?us-ascii?Q?nrI02I3s9ZnxNrWRCQ2OPctTWcaDhAxdffNvRK1v704IEaBIqmmSRK4uh89n?=
 =?us-ascii?Q?6FQ+LV6STFqi/CFJA9lHo8mMxFUPi7TiwyfvaaIwwkABEZmZYt7XT3XWyG0w?=
 =?us-ascii?Q?Dc6phPGtkmtAwIk0/PRDLwXCFM3X2d20Dt50IjHTLASY1mMcQfCfxlm8dOkt?=
 =?us-ascii?Q?drG/FDMIHBgt7Od44dldOFJ2q58+fUhRNHfrlbXQcDYwGqnQp6CUEBv/y1Kc?=
 =?us-ascii?Q?sgOnH68JbImeMKgE3fsMBbMUk78edcdT?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dpR+cEULLEoPc/x2HocSFKOQmf4Q/zEXUgRsn6Hislfj7CZCkmLDHcEGn7Bw?=
 =?us-ascii?Q?9mhcV9pygqD2Ad0OfG6dwb9CCH0t7AuJMjNJsobjOlL69rGdPpXViHoGzfgN?=
 =?us-ascii?Q?1+KuHmdvQTLlLJVisu5Hd1Ozqs51zzRNwz6PyZEf2dk7yxIj5WDbsuZRlJ8U?=
 =?us-ascii?Q?QYIK8JdTHF7Ra8KzGiVW2M1q8RKYQIVyA5zm1zifMQ86oVOdR7Q9NENrs0jB?=
 =?us-ascii?Q?RyWm9Qs0cYGp3aGwGQeIesLRBu2Bp34nt3o6Uo5RT9ZZuUD0oMKw8Z1TpsCj?=
 =?us-ascii?Q?rbyjzqOgs2GqxjRKFxGuj48tvSExjohzwPffeimVBjhlyCHW4F+eLurB6NFX?=
 =?us-ascii?Q?dXyTZfWqNsA+9z+dpGl9IARAx6bqtK64vqFMXJ4h3u0BXHhBkPog6AbM+cwO?=
 =?us-ascii?Q?nm9D9PqtsGC0l/ql+yudTxc3B6WQ+sGOz234k9nAXKr1h4ggrRE35lRMamPI?=
 =?us-ascii?Q?M0R0Mdc5pby9UPPKIhGvQQHIH6eDfqfuNNapw+Vfbg+gQnwuF6wBP4xLXcvv?=
 =?us-ascii?Q?wZystUN+OZFxqLP9Hl3aVKWiKeuKLyVuBUdpm2nGSBV7dAxCKKFGlDWC2zAe?=
 =?us-ascii?Q?2qSR0VVbITmy3q6VJ173U2eAQx+vnjc9t92WrlHNAZ14gNgmOZP3BtdGdtgU?=
 =?us-ascii?Q?VxHR3oHvP56Uw9yXKMYwzUR4mO2Le6lUHFTu4m4dDsiqLSIIX/idmM7NQ2JI?=
 =?us-ascii?Q?7qsHTdm8mUjkN5X/4qfBTorClSiz9SI1Dyu0E/QfANWUoLKULZCMvwwY7AHy?=
 =?us-ascii?Q?wCs+frc0rVqp4mvZHpX/xKfFWlxStejDcIbdzIwpkiCpujgrE3+qLkOcTnSA?=
 =?us-ascii?Q?UjuzQr/7Odi5tDmekxMp9A35uelP2RodQpD+39Ba1S1IYBTrvJP2j4IpfPkf?=
 =?us-ascii?Q?zO0jQhT3gtgsN9tjLmeGATjzUi7JQqgymcl4tQXW0d8jMvTRbUKJinMFdY0l?=
 =?us-ascii?Q?3l7LaCYSroq3Vb4yZSiojP9OflMd3JT6WCGRXdiLi+0aSeCawF6fTBXsgiu6?=
 =?us-ascii?Q?7uFPGxhBhA3Tnljs2NIold2NYAVQgeB5Ko/o5g8l3Yea5KxJIg+5ncCDyWSc?=
 =?us-ascii?Q?TPrWt/jWlUgGy5Vdyr4+TBLKCRsPyo/Z+lTCH0eZi/8vddEquQv4vEefbz73?=
 =?us-ascii?Q?wiVBNcC+4c00d62sZSSbYBHvvTq6JAHuSlQ+TNyoYdAfoCAuX7AmjWbmdvVl?=
 =?us-ascii?Q?Vhw9GtKZieTXNpbgqXOv9k2qHxfv17AgMP0ZeXeEeC0UoYodlL1ArfYWxH+j?=
 =?us-ascii?Q?CnSZxi885VM7jyky85qFj0KTRRyb3yqNjtWAcr5CkG6ILHXr49ucRDeyo7A9?=
 =?us-ascii?Q?ECrJ7HX8UHYJDZm1ERxKfTvCm3qAIywassjAQXJIH8eXxLP9QhXJ5XqEmomZ?=
 =?us-ascii?Q?w4hgShLVkPWyNeQ9S+Y1OPozZpoicjWJd5fz012Mrc8H7HGxFxJalo3A2SRd?=
 =?us-ascii?Q?DUq6DWsAaU2dAPxgLUSqdNhsUj8Xgow2+UHKlNIROiwBLughOlxJ1PLez9tF?=
 =?us-ascii?Q?Jjw47x9VBpEkGJ5bNW7354or6DP2uI1z4uLjm+yuAN0lCAy5DufozguP0cKZ?=
 =?us-ascii?Q?5S0qbn/KZ9c15fpN6vii3ML2htO+lkcdrZcCiKp74xAxdkTKESN6FDVUuXh2?=
 =?us-ascii?Q?mA=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee10f6a-58b5-4054-51fa-08dd655c0c25
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:00:17.3385
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tSv7qtyC92nsWMaRjg7kN0R/LJPyTHzi6G9/9pnMhPoBq4QoT2tnIX1z1xM8DkbwHF9gMGi0kCWDQJ/GWujCxA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR06MB8819
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213102

Replace the UTF8 character for non-breaking space with regular
(ASCII) space in RDEPENDS:${PN}-utils variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b=
/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 91db7ed33b..10184f1cf1 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -30,6 +30,6 @@ RDEPENDS:${PN}-utils =3D "\
     xrandr \
     xmodmap \
     xdpyinfo \
-    xinput-calibrator=C2=A0\
+    xinput-calibrator \
     dbus-x11 \
     "
--=20
2.39.5


