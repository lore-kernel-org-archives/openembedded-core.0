Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F611C83F07
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 15:48:01 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.505.1751384880040162620
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 08:48:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=927761a2af=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561BJwtP010292
	for <openembedded-core@lists.openembedded.org>; Tue, 1 Jul 2025 15:47:59 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47j7c9b6c4-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:47:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WYY+sAA8skIdrzAYwuvZ6LRX5sTaqtFrdAfYzAVK3rNJg+12XrBeYwnXfMx26jYw4c72U9Ewk7CTU1JYVD4rfImmCx+AH8HVfF40ifya4bTTUgU+q49oM7Uk07AXZIcw2YXDvzQ36pTCkSCTKaw1H2sLsZT6AYifhuYdOxHTCIUjISBAO2DsRWDfaDmJ3rHd3nG09YkjJs0oJwwt//U1SpqrIszUzfCVUx6omnWy2vY4d+RWoauiy0Fube5l4JQsSr1x1d3227B7YPYfddA2tIcOWVNGwv8V/SH0M1AQkztsQ5rtwzxP7ijZ1fWbNt88ZQoB+cp23Ktkm6phnFw7wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PugL2w9QnPrZSevp+CHXj35dTtfgBqpqrWtz0TQkOY0=;
 b=nb/Y23GuK2/rmeDfBqQkvZMsrZNAE/kaLn0tTx5W0QubXLAdoRTYy7ITUNeKJA2glKCeB5wNjHakX2QJQ6SBLgHwZR0RJrNp2J85KQIjjKvAciMqc4dc/AzGq5WqJU5Ua6M+Dy0ksrjtZRaL4GcbA2vGrWKx33Gv92xYvZzqIBmhvmhd9gZpkBg9KPSZMLxq7/8B2BxbX3KFh8jNmqJiim4VN+GpJVvLhQxmGSNGTId6P07dtesxE6nLEDmx3wsFhVTPyoUqIQ7172X50iQ+FD6sn2LhNEpEbhet5C6dJr2mscHEkk9Q3imQcXgwagRohXknBPMFaqbWzQZN44tBjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DM4PR11MB8130.namprd11.prod.outlook.com (2603:10b6:8:181::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.24; Tue, 1 Jul 2025 15:47:58 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8880.027; Tue, 1 Jul 2025
 15:47:58 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 7/9] libksba: drop -unknown suffix from version number
Date: Tue,  1 Jul 2025 23:47:29 +0800
Message-Id: <20250701154731.1465906-8-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250701154731.1465906-1-yi.zhao@windriver.com>
References: <20250701154731.1465906-1-yi.zhao@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0090.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2bf::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DM4PR11MB8130:EE_
X-MS-Office365-Filtering-Correlation-Id: 763aa3a0-daaf-4605-e47a-08ddb8b6a6c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|366016|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XMCmLB7iZAToXtRk1i5TNC70GrjfYejBfFDMBGx8qrdIqCNVleJlASZRJ8eI?=
 =?us-ascii?Q?bqkFp2RkuAbu/6wH659+CN0eXpm5hz2ha0VTcHCZCsRSdr5gaG0ovu3J366f?=
 =?us-ascii?Q?K+/x+htfAsuHL9eL00WL9/aTiPScF9GxMukMwF6rTSOUChCGuac2AAOUOsXc?=
 =?us-ascii?Q?2x8BnP/3lIabs3mOIezkAUsuhQj5JuaWAY9fjEjFaJvJ5TbUhCfW7aVzD8G7?=
 =?us-ascii?Q?5mFRjqIXdojaqY+O/j9M44BkeDm8uLqqikXs2dk/7wGo1CLoTH6FT2dAImA9?=
 =?us-ascii?Q?4o+DW38V7Bg9m1ziPKXRfY//vIHTpb2TO+XS3Ctm/dxMFYb8x5fZvhdj6V1y?=
 =?us-ascii?Q?8ea77cpGOM23o/VSoc+TyfpS6PENU3yei9NdvEmhV1vsCtUZqQ5pwenTfpUM?=
 =?us-ascii?Q?UJtVJJpyiOtM2ROcK7FETPb93SQ8QSRDeAAORgemtgma5CnMrvuypLBkZXy6?=
 =?us-ascii?Q?aobS9Al2yz1YeQu95xIDmZ7SGJFmduR6zl0yhVqJgg6h4q5salTnVxtaqc58?=
 =?us-ascii?Q?woQGzLC5BJ/lbyEzGsw/QtYUQNPaUhd/rVMc5byELJFRzQefStz6EijP+7/B?=
 =?us-ascii?Q?2WmUD+Q5wNrLG/7KOAlRkH3I464RxOrPyb8GSNryBcExNcoHq8ZCxYOxg88A?=
 =?us-ascii?Q?IiKoVE5dwjbCTXCf3352wN30ytB8LiSQmIoJSRakcmLcKi4JoClc/ygZLXlZ?=
 =?us-ascii?Q?fDXYSGN7bTC82pUtw843RKJzrjB+dw8lt656pOIoluozoAWY55TDOidn5fGT?=
 =?us-ascii?Q?ByJ+v7naatJqTXYKf97hAapAvABn4+GNnHWc0Sixguho4xhJXKtLAKSoU7oJ?=
 =?us-ascii?Q?s/ck+cjrDV20nw8O7dnUWNHdl1aS4AfeJhaBG0ksDUpOioYbztfTNxtATVCV?=
 =?us-ascii?Q?sLqPL5RArrvRtOdZYWcIEr0x9qyVYe/sjWsJnzptOEuqw5rWsadJD9GSoT1U?=
 =?us-ascii?Q?h++N0wqmJ9CeP3ik+vCXhMSdPCnWnfS3aWNrThd9IH17ASMfYPYxEfKm2HPX?=
 =?us-ascii?Q?ht+qfaLfrYZxcuEjupmd88B3qiNB90Nl+GbKofBghP6ctvRWUvbRWWw8NShR?=
 =?us-ascii?Q?esqUSaZSkZRj3FIxqciQWUm/ZT1EW9qcdxLlkWCzowR/5M8ihkdXVUZSnGGs?=
 =?us-ascii?Q?/alZVIFo+qK1eIiohULzJHyfhhD+m1bPG2Pst4o3PsC1vIVNxOke1H498sDq?=
 =?us-ascii?Q?d7bNUqHT7U6Gad1Fwg0wVtTJYGKw3dznCnmL227kcvLOlvlIPR3NCRYLea5u?=
 =?us-ascii?Q?86A2A04YdsEo2+2aju7ShoZFCVxBvUO+ucV6MRlx66lkPJAsIpnXyqZTfWjc?=
 =?us-ascii?Q?i273VUhCZi91+yxqYqrp25cqDvWwnb/PW8MAwfneW6HDmkRYRdfkASDfT0It?=
 =?us-ascii?Q?KYzeD5iOKo5Bn6iIkr1G0QHMbavRkjzmJN6a/zuB6cbfElzxxrgy8XvHbCGk?=
 =?us-ascii?Q?ARtTWUTbi4g=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9iR2Ty4w8d9Zn97PCKhdqrDVpy56up1kkrLHUdjAgQDAvFp5juZD8jZ4aPJn?=
 =?us-ascii?Q?CXexLjD04M9XVzzNAG2NzVkSgEXjYI9TIdgqtpTsN8VlHQACKKysu0ets39i?=
 =?us-ascii?Q?JkY64ZRVhwVEKFVitWncd50yAhdDAAbscoiqfIG90LhCiHUivv0fsE5aDYCE?=
 =?us-ascii?Q?BYKALk4gS7iA1AOj7KM3mIMe3snYWjiuGlQ4GBP3CwRbebwkyuO/7cSTWe62?=
 =?us-ascii?Q?+pObXrSlD5YeS8cL9mZplgasJGuNv9fYFrRBaVHVPubK4Z6aSNp67FptAhze?=
 =?us-ascii?Q?92zCqJETeNgrAzO3nMOZg2fjhMhqcMUYeHG2rU6SkUIjyh1t3ECZpf4X1SAZ?=
 =?us-ascii?Q?XRZzgPz2n0eZ9TGzaU2i6GuhVKSM4KDQZti/rrrEvGOLX/Z9Qs53w2hfwtc2?=
 =?us-ascii?Q?Sl6bY1JKRWDZVsRg8WzewpXs/Dpmqn3b00H+RoTq9Tg3dxrnFOo/Ag12hj9g?=
 =?us-ascii?Q?CMJniDZr9gBpD1Cl4D/WCJnGvkZy3pKHrlrq41QUGA0KNobCs4OvXEBASINu?=
 =?us-ascii?Q?Q2e86ZAb5SxIhVaF6AFNYyMWJ5eQdnBWfbN89CgTiRHN/0zAOj4BKdo5z1k8?=
 =?us-ascii?Q?KS4B51Su15yWO/GdTSFi7aVjWZvA54Esxx1tSZ7sQkY/LMhNcC8bDaPoRfOO?=
 =?us-ascii?Q?iXRZrmbWM4LcO4cDDHQkW+FHC0LWZ5noM1lkkZhsxNAISAVytRIOOIoEo+wP?=
 =?us-ascii?Q?fD/4gYp4HVDdL0pxnYzud2uQZtBum/33Wq/APCR9hTVHA87ujQGLs6u355VF?=
 =?us-ascii?Q?oLNrQYM9qo3djT1NoLLwcS24TRjemTrJE355yDhLtJoyLhzkAAo2ypj2ZCiM?=
 =?us-ascii?Q?uB50uUxmmbXUOufJbKCQEC6VxxDCsojG0yq+Mqiy/8eQ5KVQiCC4Fn80vtZL?=
 =?us-ascii?Q?IRggj4ho3jEEeDBiADuIJGPeCHkCpFAi4bj5GklLvzFmeYCiHOrsoQGVX1E4?=
 =?us-ascii?Q?Sq9K5gkgZK+OR8tmINTNqZq7NByUeBijdKMqdOIm6WbG/cSsa9e1erO2BJGb?=
 =?us-ascii?Q?TRyrdKl5g3xU21KQNbmL7MFyEnH0inSjGhoMfdZDDJ4QY/DCM3YhG/Oo7AgU?=
 =?us-ascii?Q?mq+PFl+ooePLpfOJt7ZlordTh6IMSfgmgwBt1hGXDl2bgC64LMP8V0/B9NnH?=
 =?us-ascii?Q?ERUvVR4axHQ1y0Xf8z8cv0zTA9fV3UKEPzFYrUImRaULdrRPo4/rjxTOWLi0?=
 =?us-ascii?Q?7cIpg6j9C+IHQKFMdHxcNNId5Zw5FLw9ppuh1cJLEFvkKJSflqnlomdNU1y9?=
 =?us-ascii?Q?XmjSRnUfSWdYj8rCVwFYH3EnujCQfGzuLtso9IC/IGNRBQGx+TTp/nxW4UxG?=
 =?us-ascii?Q?usEsD5AbeTMXGP7Tql0Xi/CYRkY6EHDMsBQuzU3QVkmzVLgxQeYwOsqytB9/?=
 =?us-ascii?Q?/y8bsAnGqM4mOGc6zZJoKPuc2vXG/c3BAG4PYpaD/xU4j9Jou61hViCadcA/?=
 =?us-ascii?Q?6s6DYJizT+96ba23tJKQAjfYXvja+NUEjNIU3E8hwL9qgEHUeLpikMrOihzm?=
 =?us-ascii?Q?R+rAJOSvE/yjhO6VTNS26YgvQYywcQGatw3NFZTfoZGO78rtA0hmR1ghJoG6?=
 =?us-ascii?Q?hMEEw0Zp83MNAPFOnXII28OVKNRpeuBAbVLepakw?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 763aa3a0-daaf-4605-e47a-08ddb8b6a6c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2025 15:47:58.0140
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HECOebhPtcaBHOvh3o034D5LtQg/VEFQhSsABJR2Ri+QOFlRnJQcdok5+7WM6A7zv6C0nROBCQ4Q8uUYfuj/ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8130
X-Proofpoint-ORIG-GUID: aKchjI_88megE9p5V8WLRCIEvCfsg6tN
X-Proofpoint-GUID: aKchjI_88megE9p5V8WLRCIEvCfsg6tN
X-Authority-Analysis: v=2.4 cv=M5xNKzws c=1 sm=1 tr=0 ts=6864032f cx=c_pps a=mTK3PmBKiS78iTy2M0NrJw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=GwUem0DFAAAA:8 a=t7CeM3EgAAAA:8 a=Gm4966zSTPbasCD8yEEA:9 a=4f0m0rT7cLEA:10 a=r0dl5i_q2XGqDZkti5dn:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwNiBTYWx0ZWRfX5hRhtuMhtHTR v3SfFdIBqZdXZpOtVfZuRt8t89QCrX1YsHBSY8aiQfU92bPX4hpj9Mq8J1uXNppGp81rvP85srO b/7uzuR+64AsHVXx6dCaJW+6cPiH0QEgAvJI8wcnb2UxdgOYbISf0+LthY78K18XmyDg1QbJUzG
 0jgfDk7eGerQwuJ4vvoolwCEAQd4lFudZRWfeSojh2/jcs+LMDNOZkdRxNzRSHTLSbxLL+JHN9k gO4SK+PAc6x5LSh7XeOLeWtylAwGL0OZgRFnieoMvYL2hj/10Bma6rAxzaDHofK6OtjO9YX3eAi Wq5OXvW9OhrYOQbgz1pi5RNJxvsX/npczaVzT1agYzgMey55Wl69XrjA1mZ1bxoiYvsgft3wErG
 Z9Baaigk61c1wUBphbb3JuI0U8+j2KhJsHj8AsAuvacsJl1BpLAv7y56Ltkx5W8K8yJfmuSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 mlxlogscore=961 suspectscore=0 mlxscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507010106
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 15:48:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219595

Inherit drop-unknown-suffix to remove unknown suffix in runtime version.

Befor the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7-unknown
Cflags: -I${includedir}
[snip]

After the fix:
$ cat /usr/lib/pkgconfig/ksba.pc
[snip]
Name: ksba
Description: X.509 and CMS support library
Requires: gpg-error
Version: 1.6.7
Cflags: -I${includedir}
[snip]

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 meta/recipes-support/libksba/libksba_1.6.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libksba/libksba_1.6.7.bb b/meta/recipes-support/libksba/libksba_1.6.7.bb
index b7a9fc4050..743e4af6fc 100644
--- a/meta/recipes-support/libksba/libksba_1.6.7.bb
+++ b/meta/recipes-support/libksba/libksba_1.6.7.bb
@@ -18,7 +18,7 @@ DEPENDS = "libgpg-error"
 
 BINCONFIG = "${bindir}/ksba-config"
 
-inherit autotools binconfig-disabled pkgconfig texinfo
+inherit autotools binconfig-disabled pkgconfig texinfo drop-unknown-suffix
 
 UPSTREAM_CHECK_URI = "https://gnupg.org/download/index.html"
 SRC_URI = "${GNUPG_MIRROR}/${BPN}/${BPN}-${PV}.tar.bz2 \
-- 
2.34.1


