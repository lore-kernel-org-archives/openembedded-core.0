Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4938CA1016
	for <webhook@archiver.kernel.org>; Thu, 11 Sep 2025 12:09:19 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.44952.1757592555041147223
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Sep 2025 05:09:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=QG5G/qu9;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1349761c94=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58B8GwCm2631441
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:09:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=T4DNs7Blm
	dVAXyXs2mXSuHdCvr2G46mI6JqDg4Ei9K0=; b=QG5G/qu9UwBh3BIGvgVuZY+k3
	C1NRcUcPf1JllYbrKsIYp8gP9fITgZjRbRMFcsFAVZ979nGxSXiAWjQOnFltPuA3
	HDjuGEXLnRULxod8LCnUlsaG0613D6bTzI2oiTKuJbQUXLdIQv6vIKfglGrej6qj
	KZQDFvHdrMUzct5WZ8XuwDwhY/J7F0x/SgosQXV5CtmdrpzkCx3aHVgpisgOduDn
	FnDwSoW4SwHy3fChqWsYDpiXyDx9UXWcw2PHE+DDHRKalb3MfgB9FFif6cjpHj/0
	QXpHHV/TsnadUtkLLHKNGuT5VBxaA/9sTwWN/MDlV1/jfc8l+oXIzN6k/pSYQ==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 491ve346ny-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:09:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=talU40VdPAAmAcvlDNtHFXh/Fg7JK27e0icnRB7uyxM+xJHFMVZMxbPWp+v28faQZyfe1gLd2IK3LHsIvd4m0mDV8hIUlArOGOYbvzGIGBAqq7XTOYEcHTxGPkQmckkmUTGo6qWaMdhIIpRZp3mrBjUgQO8rid7a+iTxbGb1FJZNddh+w6z3tO83GdHEcBhayN544ovSMWdC+L5JJDE6mkVhCpIq8WnVv4tenjQom3NqCPcGnoDcUrpG6Wj5Efi60mLP0oQGSOrjtaQcKjqrfsXV8TsNzvWbduq6BoeLW7IAP/5vyYqyJZRpf860mX/O5DWM//gO9Cfe4W/lMuok/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T4DNs7BlmdVAXyXs2mXSuHdCvr2G46mI6JqDg4Ei9K0=;
 b=OwSZLfs67aOUQw07FW/7BBWKfywq3p1Imlx6dydSxZAivlIehV3diTkBLNYS6u5qDWmx39/9/y07p/SnQovrHM8sEDBJ3YvvOItDZaBSiwVKeZOO+QeOhWWSdooy4pelNSRQkJ6bbtiNsEgc1h4fd46r6P07zInoSpiaOIf2j9kA5EwpbNIIf3k351CT5dAF1KhsvDqnxr2SuIpEHv2C51UOc8gg0GJheAETn3Go9BjNiIk3DG/w5aD0b+HpsvDpyHaVnXAq8qepqNPgqVWIekwPMWxy2DeneCv7RAIXWJzOeQVrkd+KAfhSclyqwG4UpGsrGJCeP936YLHpHNPxpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by DS7PR11MB6248.namprd11.prod.outlook.com (2603:10b6:8:97::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Thu, 11 Sep
 2025 12:09:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9094.021; Thu, 11 Sep 2025
 12:09:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH] nativesdk-packagegroup-sdk-host: add nativesdk-gprofng package to RDEPENDS
Date: Thu, 11 Sep 2025 05:08:55 -0700
Message-ID: <20250911120855.2268283-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0170.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::25) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|DS7PR11MB6248:EE_
X-MS-Office365-Filtering-Correlation-Id: 57629559-df36-4c5a-a144-08ddf12c0492
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?l5bP0mZcJDqwL8MKUSClIxEYpqoUs0IEFc6meaqAzIBIycJeK0t1a99/kzCd?=
 =?us-ascii?Q?+PuRfZLcc6OWi6Do4UV7CVLrBF39dGQKO7/6C2TGivV7t6OgMHx4CHGVNtxl?=
 =?us-ascii?Q?Rbz9Kcu8tA4/1g8NpAclNclADC0lcBUYUt4BveSA0ZX+iDy3ivtyotBQyH1c?=
 =?us-ascii?Q?eKiSkJduNXm3FOslVgHpLovWy9LLXxo4er0UM3Ig+lU+107+aX6mC3NElQ0Y?=
 =?us-ascii?Q?ugXMZBgFy91Q0o2Bu11beS4oJWjAyymdUmgKrUZ4/eloMr5kpvwHiLi977R8?=
 =?us-ascii?Q?qF9thLcnlMUislLyDYnnWO5ffaTLZszt95VmS7txHPEZ+0Hv5R1n5Rb9/tSx?=
 =?us-ascii?Q?ILi7w/f4Ya9zaK6DWGFyQn6VwEPDz0l8xAgE7Yr7/hmsMGqK1KMcWJIIATrL?=
 =?us-ascii?Q?kwbsTsjEywufCkEHYGZGgBgHE30rTg/7ieEYnj2olRd0mOVGOsskbou+XlXN?=
 =?us-ascii?Q?ouNyvFtbLqa75Q1uBf2LEhtlSJ1RjNY9EdxhMmKP21BTI+EFzM4HsDrhSktA?=
 =?us-ascii?Q?sA5qFQGfns7kG1AyPTxNXoT4kNBoMLTgWKxjeB9Ru2BjR3UG9EumSPT/PSeL?=
 =?us-ascii?Q?EQTI+5fTMfXfMus88clWqx9lr4Accc5kuo3hJtO31MJvQQxU19wOL8Zvr/vD?=
 =?us-ascii?Q?FnKa7V/GOgk4e2adVfXOR3KEFS1xvIX3Baseyz2yDndWFPpNKxTR24jZO2qG?=
 =?us-ascii?Q?9w+s4e9Fvh/83nCNq6wZnLqSl3m+S5tSltYGXh+tL3N1UTh/38WASkULWryu?=
 =?us-ascii?Q?Wjh7oBsC+ee1LIzZQE1VS5gT6Gcc/nHe8E84gXZh6HXAe/41C69MVb3adH2J?=
 =?us-ascii?Q?uQe6LiIGEUDxd44UiGA+yFMVPKzezN712NhhSQHeD0fN6N1jxdnXYAMCkCs4?=
 =?us-ascii?Q?vff8OUIRBUGsWO6RkxEWY8s5l9vfYB9VxNh37OlGDfb+tczIcSq15vd5rsvk?=
 =?us-ascii?Q?CPblM0Qaud4/lV4Bo3UGP7P7ZMiOf+3Ojyk44ZDifzK1UEazoHw9Rwr/JOcr?=
 =?us-ascii?Q?x6rjUSEMGg88lR4GelaYJ6x9T1ReKcWoFPwjRMQaGe14xgbRHyhwPNXOX//1?=
 =?us-ascii?Q?XXyJeWW6ploS5SSCnxL4WdIuolWLlJRampsKLDK5gHwy7MChIey7jtO8pIJr?=
 =?us-ascii?Q?XqAkjAEUN5Rr5YFRDqkTtfyM1JHvRQ4ASLwYbJZAtwgvhT9LaEPDPeA5Yr9Q?=
 =?us-ascii?Q?3kO8mUYkYONmn6z7Gxc5mODFGhAb7BRWvWiXAhlm/ZkT2tBthJ72Y9xJ2RTO?=
 =?us-ascii?Q?RvU4WiQVOI4faKifr5PzVP4ufn8raM5BzYqAt5ttFnTIc7TPr+TC6d5vpRJ7?=
 =?us-ascii?Q?Kr6GUYketj+O96Dj4TV2gr2qi6Rct4WfssmFrYb6hcGgsYUNOPR7RyfETZ8W?=
 =?us-ascii?Q?QvEr8EqKo9fHHkqhoVUqO95pR5Lbn2gjPJEnQEvQIQF2Ha8emlFvVR5SCRUd?=
 =?us-ascii?Q?tlXmFrvpVsg9dFOKA91h3BbOkpERa7xjOdj9iai8Q/mJ+xDyogFgTABlWwtG?=
 =?us-ascii?Q?JYtbBwzLn4V7lcU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IbQhTtVLbDCdjMbn/pcFgKDCHq2widI8Jx9cMrH8vaquulj2gxRFfIFyy5z4?=
 =?us-ascii?Q?+BE3+PB6H27ZgezZyMhD0Gq5Da0h8bg1L5pD1EkRlFfnp23yaMfIZAZerFe7?=
 =?us-ascii?Q?jCe2ViyTpo12bSF6+kSrniq4iMPCBU/i8Ac34EcISBJ9+BCSjuO6iwKXHk0X?=
 =?us-ascii?Q?XJyoszKdScP/9tMByskqQsGziY038eBZ6mMVUpbweunvR/El3np7lWdH1NOV?=
 =?us-ascii?Q?RT5vVEcNP20dBpZx7DillzV8dtaPM22/PcGMopelqEbgJYXHxCoZo7s3evBh?=
 =?us-ascii?Q?3Uu9dxNIj3J5Dqwv9KYgnOF9mBVG9crH3vsy35xwv9Bw/Qbi2rlHewQ4ofCi?=
 =?us-ascii?Q?mMInzWgjd5VR+CRjQS73UVSM5NVZy2zuR57gJt5+DUi7FZYrwAJKq0DrTRjo?=
 =?us-ascii?Q?lsxMRcVZLoIbqr4Rhknt2k5n65ooQhetoTQ/BuXGmd8gtfMVR23YNDR3ZQ3r?=
 =?us-ascii?Q?ZpVouaJz3gzJntEiD8S0rERZYpDhcWgwLJo577JTIQj9yjzVxBK6zIFFfRCv?=
 =?us-ascii?Q?qN0b7/FwMC1nYCfG/YX5Z7T5xvnL1U9uCZI6lI9k4Q5hYCQmxWkPNfYxoeNT?=
 =?us-ascii?Q?/Z9lRMATSkGpdTudvhCEhNou6hOoTsixMn3X6QEtIgYZvEsot8zEgXAYY5QN?=
 =?us-ascii?Q?U1K2ZSXBbTkElW+KJsEb9EOG5vaA0GqFSKzokkI2CabefMGRb3XNL2EnV6II?=
 =?us-ascii?Q?ZodtGFp6Zf5bCvLWG1AYI87qT9Kl9a0Kh5waYH3DBlzZXT2ih4gxraOUYt8T?=
 =?us-ascii?Q?MulbRIQALutkQKVrZBE+5yIyX9i6cjWmgCqjbcf7GRPBCmKhZ8xJbXIJloxE?=
 =?us-ascii?Q?iQoGyjcHEgarPSVQy6AnWyeJ4m0l4Aqk0lG7dQqjix7fyam/e0p0mq91UvY9?=
 =?us-ascii?Q?8uf5ddyx8Koasza4hcCc6LhThpYT6X0vp6TT9ieeT/fIqsHUH1LR2D5YntuU?=
 =?us-ascii?Q?fLghZOfB81lFAwY9tf+KbRRYrgUmyoNsTEomFNAkBeav93kI/Y2xmJoa0xct?=
 =?us-ascii?Q?kQnJI+5KFbxklHg04LxjEOtuqg0/HiFjBKYl+8hzo7jRnyQTraAoiofisWiG?=
 =?us-ascii?Q?jYsI/X8ldvXCMUjvvzbBNeM7dRxAzkQfIdIlnm/gsIHwtWUoOBT2DhoKFDwJ?=
 =?us-ascii?Q?ump4LKObk3zK5Ya8Nzns04No20x6s6swTXXKcp48SI7EyXqCWfauELX3d+m+?=
 =?us-ascii?Q?HqHy4AxSIj5MRCny92IZcFCkY2rzkKe8uZBwZWNq4SyZI50YjBBlTs47YpmH?=
 =?us-ascii?Q?+S5M5mEd0+FmlMAboDbGEs3hlSSWjajLxvolwPSUpVgJyEgmINfs4kYSDQIJ?=
 =?us-ascii?Q?Jk53m3VteLiM6zqWqyEezIr9K+C5v60D+f4T5RfopAWePU8UhS44HBj6cV1u?=
 =?us-ascii?Q?mP8XvUOXIhZcsjiwwe9gJSY4CPmlcUH8830Txx7iczqa0zbcJI7F3qCL9Lzo?=
 =?us-ascii?Q?yRzcFMEIixvv1z8gw8iL0Qhshn6hDjpoRzHUApH257ZySpAylYGaoMUfl3bt?=
 =?us-ascii?Q?AlJISbwX39EQhRgkIULkliDa6qRiXcvWDyKbcSencmhnyOJKWzz/TOK3q1SM?=
 =?us-ascii?Q?YQc8fxOXdYALIHf16aCgP53DPeq1+QrLhE93gjb6ZeE3yEPWQ6Jbik8TpaD5?=
 =?us-ascii?Q?lQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57629559-df36-4c5a-a144-08ddf12c0492
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2025 12:09:11.5792
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QzxuBCaU/h8j8BEN0+iblohPHsfLhRogjyTSUdRizmFwAnq2BMIGIS3vwhIShj5E+S8Jr00qiZnuDfS44/Ch47q6BDJShm9qwVE5sVOMi30=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6248
X-Proofpoint-GUID: qoGtZQJJFPKRI9dhkwcj-Vihfwex-xwN
X-Authority-Analysis: v=2.4 cv=U4mSDfru c=1 sm=1 tr=0 ts=68c2bbe9 cx=c_pps
 a=Hxg71G30CNBv6xsSWT+A2w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8
 a=B8cl3dvgPsPGOGex-tAA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: qoGtZQJJFPKRI9dhkwcj-Vihfwex-xwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTExMDExMCBTYWx0ZWRfX6jHiLTbIdG/v
 Cve92en/finQSUYxUQMp2jPg6yDGgpkcLejGCU4fMx8RNXnrUpOoJInabQtqfzlyjaHXIEICXyw
 2Qn+sznW7K0k3bDz1tjmHAVRhE4b2pVYtN7l3M6Nao312i7d5FtTbWl2z4jlKtY0/B4vvN3Jdk1
 Rlqq55Zt7g8Q1HmvefRCzFnfTyaYrDYkbPrp6T1IWgCMrwNGYJ3O2dffWXXwwg66GKHh98sgYMR
 R/VQn/W4j4Ygw8F5OHV273njzk0YDVGiUXdF2YSEKmPnfehvJRlAIMCBu5Joizal9pqaD0XFTgT
 QAJZO1bnLI+zDo5zAA6nLDxcCigjsYX/wxy6QiWvKtiXuA9AfiBpFcnDm45/1o=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Sep 2025 12:09:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223272

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
following error:
$sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
./x86_64-poky-linux-gp-display-html --help
Can't locate bigint.pm in @INC (you may need to install the bigint module

The patch from below link will fix this issue but only when
nativesdk-gprofng is installed.
https://lists.openembedded.org/g/openembedded-core/message/204681

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../packagegroups/nativesdk-packagegroup-sdk-host.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
index c1d3c25060..5374067bab 100644
--- a/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
+++ b/meta/recipes-core/packagegroups/nativesdk-packagegroup-sdk-host.bb
@@ -30,6 +30,7 @@ RDEPENDS:${PN} = "\
     nativesdk-bison \
     nativesdk-flex \
     nativesdk-perl-module-integer \
+    nativesdk-gprofng \
     "
 
 RDEPENDS:${PN}:darwin = "\
-- 
2.49.0


