Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDA0ACCA468
	for <webhook@archiver.kernel.org>; Tue, 30 Sep 2025 12:39:20 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.24359.1759235959540034382
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Sep 2025 05:39:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Vj/TvVYt;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2368802316=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58U3UVK72521247
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=X9eIAUZBn
	ZQslV9nssoodsejnNn8yJPkNdJWC6s8UdE=; b=Vj/TvVYtsiMq3js0FRBmENDhA
	7GCCcpLaapO4l/IDpMihzVO2C+imVVGmVYNBl9K9HMMLL8v0yclltOgNsrzKtcgX
	YcmIGHUS9AsGNxaH+FydoO/NmRgYs/OyCOleg8WDMnNSs7+GLtEvD1FjL+asCL/j
	7LxRXQtWntrm79Zr/+2tnt15JXALYQrNAfnKurTsPuGHhTmSIOJ87NQZkNHexxq0
	DBuOIjtzf8wOOwHE1rzyCxJOlcfSDaMDoPUrrQ6OdSJ+MuRJ0j55uz48iWBLLDEK
	FZAybgiOh9hxSE1zU7pBUPe6nu96nSq98dkOoN9T4XCM7tR/uHwlga4qIQEiQ==
Received: from dm5pr21cu001.outbound.protection.outlook.com (mail-centralusazon11011067.outbound.protection.outlook.com [52.101.62.67])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49e54wue2j-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZdngYCi8LE7KVTwYAOCeRDX6i75P819XiUlq6PWWXxgkFomnGp0nS4wP2lg1kT3ZMy2VVuCrIwMQp/0pkNnclE+8GjOrfnGBsqqO5NIuEa1N1jeK7Kh8vdQuDlDQ1t0JGRGG7Rk+IQyssx36+KOCcqI3FVRCtngbKXkKyZO3kf6xWX67AB61zHm5f1iFiuxoPeGvkQ1KKs2kLXGXn3tmjpzKr5G3Gr7mHbkVoFxVBSlN5Fqgnh87pTLrSIfuZF5WxFiBE2rtgO0g+c3/qA7PuxT52iHeFsR/s43IpC+zLL1N6+CAxoGQYB1fccQleMM1aWu7l8g6aB8rQKV76aojg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X9eIAUZBnZQslV9nssoodsejnNn8yJPkNdJWC6s8UdE=;
 b=tDzmouWkuZwbYN8bDoRne0fg1GPRO91JZUbPMhY8m0Ipcon5SpIU4akjxjKg4vcChrl8VKfTNedpS6B36811q9K1lovFuvUNGzF9aoMRAsPpA66wi+12Rz+O6JxlMo+aeZAzPPfM6hZe+5tZ35DFZCt7rnrESnSnSPS1ghe/3JU1EKSdbTZbWlxpZeRUioer6Hhbq1i2opHy6pGeghr5GxhONaPvqbBghhyLLpFkGid8g1AuSjzuCV11ogfcjvMp/Rw+Ljr60CyKA3Seo1GAlFCm6lzNbbFit2MlOyQ15vqskoVNp9Ii81C97cAVV/6FvggcZ+xMbE5Nbvxhh1+hTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by DS7PR11MB6246.namprd11.prod.outlook.com (2603:10b6:8:99::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 12:39:15 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 12:39:15 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [PATCH 1/2] binutils-cross-canadian: Add missing perl mpodules to RDEPENDS
Date: Tue, 30 Sep 2025 05:39:00 -0700
Message-ID: <20250930123901.949798-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0072.namprd06.prod.outlook.com
 (2603:10b6:a03:14b::49) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|DS7PR11MB6246:EE_
X-MS-Office365-Filtering-Correlation-Id: 6730c2e6-a574-451a-3546-08de001e5d5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?jvYs0mSZZuxafeKbFWhvcXMH97dbgey7TUXarm3HTx27N1MP66nmC7v/liAO?=
 =?us-ascii?Q?I4G0lvkBk4TyouRlBTw8j8TIdHE25x2Fa2PlIsDlbWk2VcnjPFaKP009IDfS?=
 =?us-ascii?Q?PbB8n4xzql2OcjC6HPxlj49D/wM4YOguhza7Hc64h51y02sEPvwVa1qxkRRz?=
 =?us-ascii?Q?SiiB+fxTIHPO2W48xaMfRibtnZHEpksoLnDAX7XrcIMtdC+DUrmkFoSVs6VB?=
 =?us-ascii?Q?LxyNUcss2iSiqH99THGFk4Y85jP37oGgWC6R+y281wPRskw8dLwu7HPtO2G0?=
 =?us-ascii?Q?D4QFmAkWsyoYaXsG0nNh7NDhq0j7VTL7qOhhCkQcqV7edSfhavX0kAJedpU4?=
 =?us-ascii?Q?8lUINIFiK2On9gIjw1+Y9+TKfHg/dyrTaPqN/NDa/4k9X8AbtwUumxbA0kCf?=
 =?us-ascii?Q?t6wrtTP/u8kJhMX/hZ7Ry5ubSwkhaQl9R8WtQBk8nA67F8nKe1i6Rnvtea62?=
 =?us-ascii?Q?3Vg52m/DVNwnXeR7plILnd3oQ85wZkyH3Dp/H9Co0FEApQ21aLKVnnc78Nwt?=
 =?us-ascii?Q?3EakECER4eUeNrPg3g4BqnIH+7xo/hR5SOd4JclaEONDpEt4eBga8CoH1WZt?=
 =?us-ascii?Q?dvyl/2Ap2/k8NUs3s2UZTa9DTdNBOwLT7Nwqu0/r207j71fXsMHM8cIJYCtc?=
 =?us-ascii?Q?75wkmeeAklcb7BXPF1Km2UQWCT3E9LooEvT7BAUMW7+oC3gcFAdluuXbSMGc?=
 =?us-ascii?Q?7l/00yywMJF7GmluP9FzYck5HoWuGz0qxZjopN0wYmCNfmhoEbpxOFQPoNpT?=
 =?us-ascii?Q?BrHLuRG1r22omTBAbivvFSI5d8bcpdtfmVUvFYulUvt3kmTmAwhI39r3b4U3?=
 =?us-ascii?Q?PwCZ9yZ43yBqlKzMu5IyIJSm52RhSxkZ6j33JuoHACWhqbencaox7WLUG45+?=
 =?us-ascii?Q?kE5vLA6K4hWowqyk5DfLoA7dTToFlbJJqu6zmF+jliGeFp+rEcYNWWOB4Ubx?=
 =?us-ascii?Q?EbOr1h3GqvtQMKRN2N05yaN3Rk0vGGMwuWrXNml95doywlEA4ILjDEpda5PN?=
 =?us-ascii?Q?ktJPfd62VU2XZyb+6RS9gOw6podlkSpe/VJ8l+Pmj4ovJgWRVWvRA1XYzybz?=
 =?us-ascii?Q?NO2tCcZgAo+C7QAZlEAWqOt+dlT5EJjfUGZyJXLPsX44cAdfBS7DGN2Ml6Pm?=
 =?us-ascii?Q?B93mZqw0+ApvNXnkJVCeHgd3oL/yxaTmFnX3kYwFkQe5/FLxxMd8AVxQC/Rl?=
 =?us-ascii?Q?xfBnkFTbdcylnSzDZNZDFyhIrUY3NQTjn5IGE2cghAbRoJMjeq+ESESn4XUf?=
 =?us-ascii?Q?qjT5Smne8Rv4KM4J6NgrDcMNTsy7uHjeIFV0XSu3C5ih7NL4A+lhqLu3GE1K?=
 =?us-ascii?Q?31lqKQiWxi46NOCNSQGQxdT1NJzxneUUkNmJ9Bhb5jABlyYX+RzoNhQQXupi?=
 =?us-ascii?Q?sxrdE6uNcBIUdnSLCusNfQgsT1LTnBWiKmqYXyfHaY+jGEeSntzuJmj7RbN9?=
 =?us-ascii?Q?3wLhmoP8j6zqimuh7x8q6zyoj7xaCg5gYc0SOL8FbtbK7GS1gqGplFqe4lA+?=
 =?us-ascii?Q?CC02w3pSJcCJkzlPieeEgFDWOcyTmHIU22E3?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?3Mv+dSLyzM1K0mv5ZFHCdyDTd/APAI/0cQkYqnpREDE0yt14fpXk5eAdA0tG?=
 =?us-ascii?Q?OLC+gjkb7E03epUzTNI2P1ATiJYB/rKmwI8JDlpxX8IcJR6qyKB/kdAVx2BG?=
 =?us-ascii?Q?mawYftMGie4iHunnAipS7qKWeVXtXKTIfsnBzpJROXzcPgDrygfpdX+iJHCT?=
 =?us-ascii?Q?HtBvyYcwrQLGDmSAvc+0WS69Rb/5jdBX8zuq2BAfM0hYUBtctbNDJG1J9NsC?=
 =?us-ascii?Q?jqbjS6neefQH5P+MHEL4FoSU2J9EX7z6UL7mu0Buijst/sHAxjbBQQdJTWZy?=
 =?us-ascii?Q?FwI220K/7bDizBqgRNPPw3oBNJzKOQhI+QDEBvsi2kgj+Q55E4g1aeD+dPX6?=
 =?us-ascii?Q?/pcdY7eiW0lOAlO81Xbh2YyHJSIG+FIgY7z4f8gCOrzJtjuqgxdNkC/kc6L0?=
 =?us-ascii?Q?3Mnt7yW+XugoFwx3G392AGBGopHj8hS4RgZlcNihrkS88DlD5D5RawAFgQl1?=
 =?us-ascii?Q?1a6UyAgdnDxTc1aXRb9CqVludFOrifTESGKOkE0GqlNBs0fDcc2oGjw0tMCd?=
 =?us-ascii?Q?PGYuvmYOBzOfY33aMdcelXt6gztXA4KE4Fu2X6nEHsvGNXxi/r8s8i+iybaS?=
 =?us-ascii?Q?72FkzMBieRCCln5PcwlDLjPA4pPsoq6ByWU2UVyjzPPs6xqp5lNsb6lzHIUx?=
 =?us-ascii?Q?GOar26tnp9Lre38d5WLIrO0cADVykMEhD/jwAAOxDBRGyc36/PX3s7DURzOF?=
 =?us-ascii?Q?hvOqBMjuGI80Nxn+WdGHKRoKzG3vm/++lnrpLGt4JJCBNBF9OhBJZIuyIvdw?=
 =?us-ascii?Q?OiIgMrsGgG+lppaMEx57KYHhWRV7/+uxh/6nhEbTUuenfxS4MdiwjNtGVSgA?=
 =?us-ascii?Q?B2bttCekRzt4LVktImUNcem1SDyLnEbOC7wl8P+NsiLI1fp+Nkgz2NONjtBo?=
 =?us-ascii?Q?/OZwVaoj+FCQECMd4Iy+Z39NfsLruEOYjjUowuavESsLSqEJR2KUHmbFjQcB?=
 =?us-ascii?Q?aub0ytY6XH/Yc08jvXCbkVIYG7spFEOKpCud64g2svm/ohCaU+53kewrEjge?=
 =?us-ascii?Q?SNBX5q6dm4qOKl2c7buhnsnzjpgUpY+ybnvKVbpw9oirdapUpo6nY1dV6WkF?=
 =?us-ascii?Q?9mG5DKwamRAS4NwRgQc4KRHuZtYFGIb+xbAZ9abPzXK5GHOZIlWq7OeB79UQ?=
 =?us-ascii?Q?lmVLp87vYMYEnKbyj/KyBdZgVEZFiDZxrsEmLcxo6GhEOPeWsbrx2CJujkog?=
 =?us-ascii?Q?BHHLAcDhDhBAcQK4ybBuq1YK0P2U/XHUETZvEjejzQzrEd8o/ZvGl2xIygw/?=
 =?us-ascii?Q?sbsS7N7ZVrEEEi5QZll9yRN2E+BbNUP8vHk82natEeIQqp7wTyCQ74kN/vQ3?=
 =?us-ascii?Q?y9ID78gOiQk5GQH9Dw8ZDwq/IAN6wG42BPfV24vXVe3QTJ8BfMGJi9AsuJEV?=
 =?us-ascii?Q?FecN0Ww//B8LjNDC/4bS+gCvZe9Jx2lpLtzwgExC9ZjrxdaOhHn1kIl079MI?=
 =?us-ascii?Q?TurJW1PAFV5iN7lyIWEXMMkFh9EV5DzqLaiHKGJn+0wjA+12LCQQ4mqZ0Uui?=
 =?us-ascii?Q?yX+0YuQHT7OhPuU7tdsz4AfqlSO94plQTByuY0C9w5bofCPMca0LJuacTMJv?=
 =?us-ascii?Q?1x89hPxCB+YSr5/+k4F31rZnWdtshmZlwBV75J08sbj7IUYLND3wkE55r5hj?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6730c2e6-a574-451a-3546-08de001e5d5b
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 12:39:15.5511
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CKrH3GEsz8MDDCQnvOVjhirdPSRroFTsK7yKV4j5X0orJB1T/Anduo12tY+PNY+ba5kXzW6/mbMwS3JffyEuQi5VsVO8/gVAyuzO/YzdVJo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6246
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTMwMDExMyBTYWx0ZWRfXxWHi95wbeQrn
 cfZBGnemu3LTwUhyvYVTsoEyMQiP3lYkfYWYb6WNf9AirL9J383o/9ugq3Gej8WQNvMR6X1sK0R
 jnhM2G/G8XpoVtyXXeab5Xm48WA2yDjFXwSxIxM/cj9cY+Bn3gkjRBMDnmt2OsPmnozxXGb14hp
 kk7KkiIQq3tmxsaDSkLU8oVql/ZErLSLjyrCvdqZMC9Wqyv53wGVQtH0QgNTGqah1UVVyKGXDfA
 zJ63FOHFZgxeAzd8pfJ2D6rM7IcRdwqUhZsTGRYGqmbR+ozF61zHy+7G6MOpTYfz0C74Gh3q1IU
 GuUnATco+Y4DgQzx7OIL/BL9aBJwtiKW6VlWgzoBG1XGrXKTockmUHdftpfgZ24QyforCLeswq8
 turuTjN5Sd+BkX78aWAg+qk1b9Q0tQ==
X-Authority-Analysis: v=2.4 cv=ZNPaWH7b c=1 sm=1 tr=0 ts=68dbcf76 cx=c_pps
 a=GcdpE1at2Es8HfJfZlkF2Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10 a=t7CeM3EgAAAA:8 a=B8cl3dvgPsPGOGex-tAA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: tPyX_ehrA29ZGrM65c6aW4JXjy3YER7-
X-Proofpoint-GUID: tPyX_ehrA29ZGrM65c6aW4JXjy3YER7-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2509150000
 definitions=main-2509300113
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Sep 2025 12:39:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224186

From: Harish Sadineni <Harish.Sadineni@windriver.com>

In sdk while running "x86_64-poky-linux-gp-display-html --help" gives
following error:
$sdk/sysroots/x86_64-pokysdk-linux/usr/bin/x86_64-poky-linux->
./x86_64-poky-linux-gp-display-html --help
Can't locate bigint.pm in @INC (you may need to install the bigint module

By adding the following perl modules to RDEPENDS fixes the above errors:
  nativesdk-perl-module-bignum
  nativesdk-perl-module-bigint
  nativesdk-perl-module-math-bigint

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-cross-canadian.inc | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
index 7d7ffe92ce..9dc73fbdf1 100644
--- a/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
+++ b/meta/recipes-devtools/binutils/binutils-cross-canadian.inc
@@ -5,6 +5,7 @@ PN = "binutils-cross-canadian-${TRANSLATED_TARGET_ARCH}"
 BPN = "binutils"
 
 DEPENDS = "flex-native bison-native virtual/nativesdk-cross-cc virtual/nativesdk-libc nativesdk-zlib nativesdk-gettext nativesdk-flex"
+RDEPENDS:${PN} += "nativesdk-perl-module-bignum  nativesdk-perl-module-bigint nativesdk-perl-module-math-bigint"
 EXTRA_OECONF += "--with-sysroot=${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-${TARGET_OS} \
                 --enable-poison-system-directories \
                 "
-- 
2.49.0


