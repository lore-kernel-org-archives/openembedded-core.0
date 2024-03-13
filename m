Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE06C54E58
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:03:51 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.16266.1710335023729474686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Mar 2024 06:03:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XGQgd+ND;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=38026f214a=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42DAV89N005104
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:03:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:content-transfer-encoding
	:content-type:mime-version; s=PPS06212021; bh=3Ko3PB8J0uC7Tma28J
	9XNE3FyH0IB/tFFRVnK541TV0=; b=XGQgd+NDsUltHY25NyOi9IwCKdtIw6ArJC
	lGhE8hPf2FekSDAdQnGxS1dydEmAD0a1qUvfvx5aCrnb3U5OZDMf8Y6QJdY+YxRF
	i2stW245s9Q/qnxJ7F1myRqNDnfU6sPYv8QirZwKL6/fz9GKLVLQ4K9IUJa/w4M+
	Mi3i5nXqu7oAWhKfRi5I1my3I0D91cW2BKdeksCBFIEz6ZFL5i7fjfOoUQ4+1vab
	8h+RdquXttIVINtz72ygGtlqNbH5joyTL5jOIwNwXI3bkvD3t/xthXarqVWbc8Ly
	Q1WsoIOqwxOJDAqhoJEkWykNkLe+01/HYPBMHWr5pgyXsxfUz4wA==
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3wrer6byyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:03:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CMR87SJEW9+I4fMAyh06k+CuS7mLaV1PabjmOhZV0rucd0s7oO0+LjvMcXTsjHfrFEnHrwIiGqqNcHlPD1DMcZ6LKdvm0grKezcKsb2wuijwgZ8iX+W9qrxSZNdiMQCxfiwQniXGashCta8FkTJfiGDWfM6yGXxVWNe/zo6EmJ3NC3b5hVlmAn3QxLjOqzI8G0vxseMnJ4+kV8oC8tYCbaM/MnJiaON92UkFOf40HFjcnwbTZSNjgUM9fMNSrK+77B95AE8nmyenmRWBGr8jt3CgTIOZ+d/Qga2H3Y+1rEpSgDPNHs4AwatJDxaIKmHA9d6p9CQ3uUE74y9/ZdFW8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Ko3PB8J0uC7Tma28J9XNE3FyH0IB/tFFRVnK541TV0=;
 b=POq7JJmNiH/q0mHHh/ogTiO8iWlyjrbxybVGSp+z93gDf5q6oY8i0jsK7ecT8X5Fw2R7CsNk/oJW0xXdJ+UOx1z+oQX344WPAt2eNz1vvmIV4fWtSDLMKy8Gb8MuCSs6ywLzaWoBoerPLpPtGuuWFEn7Ev5E1lpcK8brMum34/X7PhM3Kz9yQ5clvUPCQnS69sPrtSLkXf6cdvg70viF8oaAOcPH0LRbRI+3pvjsrAKl5wnI96RqKWNUiSA9DNsBC5TcRrDnP7BrZp8SXZF76ADKt/g7o3aSRA/dEf7TywO1Iv9y4rok3XBlw5VWA4kWpdE9Bt/jINKAiWdhQ6McNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.12; Wed, 13 Mar
 2024 13:03:35 +0000
Received: from DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558]) by DS0PR11MB7484.namprd11.prod.outlook.com
 ([fe80::97da:833f:8511:a558%6]) with mapi id 15.20.7386.015; Wed, 13 Mar 2024
 13:03:35 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] libtirpc: drop redundant PACKAGECONFIG
Date: Wed, 13 Mar 2024 21:03:24 +0800
Message-Id: <20240313130324.2128933-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0015.apcprd04.prod.outlook.com
 (2603:1096:4:197::21) To DS0PR11MB7484.namprd11.prod.outlook.com
 (2603:10b6:8:14c::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7484:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff50eff-d1c2-4838-fb51-08dc435dfdb7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	6FKTZDx596Myd5mSHwiqlFXwWzSKP67Yf3HV+NYZMfwluf/VhFHvVwYAcGKg1oz/hqTZfNq8vLxCaVYuPYSJCF2AUAltwfRV8uPyUFNyThhUNXXlxoWcecroskLmQzFTU2UF8jVMR7gDR9zGDHMvYAtPbzKELARo63Dq8HUyAPGyVItPWRj9UY2MS9UDiXJASn7+x1OUgQMFWn8MvQBHwLUWYzv/9P0SX+Tm92ApCy3NJVJ5FMy9/M7RsjDplnQ3DpQKlndVaq/ZxML6pnG7RzjGiBY4qP/6Zs169SemUQcSDlailj6O4Dhwh+C/CMm7tA9fa22ncsugxX+J7u4KmNdMdZzKp4F+CtbzMecNOV9FMRVb+61LVVjvhRSi04jqTm5yQqBIy9TlHoUZaYXKSvfzwFbcg0EmoKhJUUdMj2pTlWEJ8SF1IfiJ1BpRLov6kHkyroLcjXHTg8YzXrps1FnssSCLFTqAVtInKTNzAbtxIJIDOP3SyyB68Q+mPjv71HcqF7/ya8+kctzlFGzr9qqP4xwyLvjzxNgKr0x8+71W5EkRZDBIWoPOylcxbCFRS52tGtoYz2OeWfSB1VmS1pUxd/0nBimS3EIo+EJg4aFbwAQ92m8yYyHZCLVqI6zKCj5NeDa11UFwrakyWPGPFn+ek4J0XPP/l4HiBCWsDE7j1yPLM4N7zZM85fKIyI+2VRUT4WhL/8DUiaxhzba2+A==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7484.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(52116005)(38350700005);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?HqEqLbkcHH1C9zFimEFahn7a0XcXrwa8PSDcdzxqDTBBlo+DADG11IvAStto?=
 =?us-ascii?Q?1EOAUJ4N7RXBfPZFGap77KNki1v0fqDFf4Jrvaf2k9xo8J7FD/m99pZSlZIP?=
 =?us-ascii?Q?uOMhZCIXLoez17mBHlsTlrhzipvFuXQlifElH1AiMJdYf11dM0D4gsCUe2DM?=
 =?us-ascii?Q?o0tlh/59DImRCDg0DUE7jr2fZYKGVP3MWFEydvSGay8IXa21SQJnuSoJA6ut?=
 =?us-ascii?Q?blz2xaV4kz+JVnuQhzlZnHhH3ear/yueXsoAkx+xC7t813AeerlMtnnFOZP8?=
 =?us-ascii?Q?d2I+rX5p2PbsKXT9InrcUjA7b2vH1qLUd7b+BYmKcrjmAhWAKP4X4h2sue+Z?=
 =?us-ascii?Q?e9So8c1s1vFWD4QNetsp7g7Xt9Ai0CrIM1ogZ1FLr/K9e0UlIM6/MlMWFxF2?=
 =?us-ascii?Q?bUhD99zzI1hLDwADZMsVlcnyeGkb4yn0gqSBofszFhsTuwEBT33tA6nlscvj?=
 =?us-ascii?Q?DhlHBwvGODLsus1uW+YiJqlmdKGUyw2mx+ND/MFKpyEt7aW7tEdQHatpm1J5?=
 =?us-ascii?Q?uURdAjslnUDmPkVFcsxoJpSUXcS2eQVgCqWIBsLBV+B+UMHpxqolKZgQx88N?=
 =?us-ascii?Q?ichN9Zhamc6LOn/JNiUICcreEkiM280BebafJkOLfam4dWL6hcXlM9i8HOcB?=
 =?us-ascii?Q?U5/SBAvQ89qUW114BkuHp4bZHZB10l58G1jRJl5w1YhKRtwZp4NjUX6mRVQ6?=
 =?us-ascii?Q?5CUxiIzp+scXgj0xG2TeSqEXfuCWruXPcJ2nq8BieCdXglX68eP2iE5OOY+Z?=
 =?us-ascii?Q?5nDJhSV+3zxtDhP2rOQ9W3nWUZDVbTRwv1k9+iQnYR5QdkocK2dcmkH5TD5L?=
 =?us-ascii?Q?zP1PAeZWBB3O2M0AjujgeKqFw1VlT0U6OvdbO1QfrXPnTGWrY1+4jQEuKxW1?=
 =?us-ascii?Q?OU7ymEyF1/CTAEKQKAuA/1dx5/O/ccSIyMY6QMy+dGPCpb5RxJ288bxWw4xz?=
 =?us-ascii?Q?3RKEc6MDHiEenCS2Ddl+7f+kSQ2mkjWxaDRNNMMdfvGyLCmbaaX3JpIqg5+o?=
 =?us-ascii?Q?11Vx7m5pn97/EcijveA5vanp0SxX1CHTHlHq3POQnHmejQRltJFKPrj3fp6k?=
 =?us-ascii?Q?d+wSa6JSeerMHYIAx1W1qdAJqIqQyVBWOxVsPk+73CDViLWWPcituVVIoyDb?=
 =?us-ascii?Q?bGGpsF3Do7jMvrfIpoUXluwm6uVWoFYnOPDuquNe9FYrmSE6j4PryfwQfnRu?=
 =?us-ascii?Q?LgCA8Eb0/SUVjgOL302oF0/15hcY7VEHrCg6BjZk2cEc+Ijw/Jti9dMZf53A?=
 =?us-ascii?Q?v13dEGJSLV68QZxTWBndmJD4vGNGZu478ELBzfcw6CwJUoFpul8YOrlanF4o?=
 =?us-ascii?Q?81M4ozy2MW65mvpvZoqKQbqsLcXUxvM+S1nF28Ur1mkWRsCmw57T8zn1vGFw?=
 =?us-ascii?Q?EXAY14v5Gv3Xuetql+hCLphq4BxwhuTmJ8/2QySZSPhsJqEnit3yxBliB9/P?=
 =?us-ascii?Q?NKLs7MzJ+p22ihQ9wNlisDtKAIe49TsO3nkIFJfsQUwusl2nd/WISAjzSXDB?=
 =?us-ascii?Q?doqiYrHDGFhimKtaFNmgz81EA0bsQsj8OPRP4pjdJ4L85T97e2E4Q1fwZTJ6?=
 =?us-ascii?Q?dTx8SvvYvnrS44T06J//nVPCKtBQ9K0xLjFmwPr5?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff50eff-d1c2-4838-fb51-08dc435dfdb7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7484.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2024 13:03:35.1050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SLoV4ylCs3ySHdBSQ1RrqEjmtbQzNzgksplgUeSLZa/0rDRexmE5JT6qwpZVzgkkQsqtSV6qUJ7I8rcY9OslYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-Proofpoint-ORIG-GUID: 6NAFJg2e0O1clVLPr-UMIEK1pJAv4Qgc
X-Proofpoint-GUID: 6NAFJg2e0O1clVLPr-UMIEK1pJAv4Qgc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_07,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 mlxlogscore=702 adultscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403130097
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Mar 2024 13:03:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197039

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
index 16c7a6007a..aa526e9e1c 100644
--- a/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
+++ b/meta/recipes-extended/libtirpc/libtirpc_1.3.4.bb
@@ -20,13 +20,11 @@ CVE_STATUS[CVE-2021-46828] = "fixed-version: fixed in 1.3.3rc1 so not present in
 
 inherit autotools pkgconfig
 
-PACKAGECONFIG ??= ""
-PACKAGECONFIG[gssapi] = "--enable-gssapi,--disable-gssapi,krb5"
-
 PACKAGECONFIG ??= "\
 	${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
+PACKAGECONFIG[gssapi] = "--enable-gssapi,--disable-gssapi,krb5"
 
 do_install:append() {
 	test -e ${D}${sysconfdir}/netconfig && chown root:root ${D}${sysconfdir}/netconfig
-- 
2.25.1


