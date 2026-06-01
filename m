Return-Path: <abhishek.bachiphale@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1329CCD6E60
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 20:00:13 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8379.1780344007628353613
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Jun 2026 13:00:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=XuRxBKph;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06123b62e6=abhishek.bachiphale@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 651GxOH53929398
	for <openembedded-core@lists.openembedded.org>; Mon, 1 Jun 2026 20:00:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=NN0D/jZ3c2TtxNkrzLHgUBBahU4jD/he1Y3clWrxoU0=; b=XuRxBKphNSCh
	yXDRdtsxqyQfyLinHuy5Xl7WOu+Yjg2CF3IIZ+SUz6/9FoQfBf6YuA0gKZDzA28s
	XbvtnFw/RRqq7eYqbfd5o/J3cD+NLolkqRao9BS3DWQvwM1cjFe6Q9fSLCkSinn1
	0dLJtSv0gFfHihh6n1zQNA4Pq3PCz/SDODIINm4gM+WgMlB8a9Fw1OsE1UyEwMAz
	jMQYW0w/FygHDZcdPgNYN7qsXMm5QAxIx2oY3j9tRX5LxbuH1ttgd/mTbGi9SIUg
	7SGeNEK/q80b1+tH7EPXHjTIK4Gui+9ChXsypWiYzhz5p87ATv1kSRY+Nu2LiPRc
	Fr/rjV+S4Q==
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010018.outbound.protection.outlook.com [52.101.56.18])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efn403qv2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:06 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqeN9hwxwCDPAOLOabaVo8vOibs95+H6FM2nG5xYQpOSTA4c1beX7ZoAjA0oaNsNeUItt5+byQvh8iFg+Zim8K8kRICuEZPNjyBUo+Si5Qo2fRTnwKFsLhX4y4hOERY4WtrWdaIHIk+iy8uB36lnJKFEBgoZf//CGFek3v5p6TvQE+ZiqbzB6Rhd+niqg1X/kR+lGmkVwRZIB/LXT927lrvz/mFlMrDFE9hsLdVdA3acm/ezi0WBFIAlPvQIHEIERPIoiyTq7ztxYjp7Wr1YWJHZfi9sN+aV9G/ARvZkBdzshYzHtvFoN7IKetIC9c68n29730zMm204Zxoxfzn+DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NN0D/jZ3c2TtxNkrzLHgUBBahU4jD/he1Y3clWrxoU0=;
 b=kLyGzriXCuqjweH/cvJle0PgNTqQKMRhDbVo57ITeq7lA30VD5yyYuGGqoWDmD7I7rSCkv7lFU1mf20ANEAJOk8yj8x9ILGuJPGzTEjbYVTivpdnsfpSajSwPS+EvLSDFgpTdteaTteAV2kCciIX4aEigiG/2rWSGmoUSKPQWmMynciRCjgXAOS9xVUkh1o9KwC5IMLuLMBBAnnH99dHgqi+N0/yCxHSpAzYQVYLhI4N85I57kMVyGZMyEX/DA+xe6UtipzxylQM1TBQJhQ/UiWrJurnyCWHuS4HKHrEwY5WEmWibni8oLICpswNIEj6Egdo+nMIrQxdd6Yfkn1SMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB8399.namprd11.prod.outlook.com (2603:10b6:208:48d::9)
 by SJ5PPF8F93806F5.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::845) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Mon, 1 Jun 2026
 20:00:04 +0000
Received: from IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c]) by IA0PR11MB8399.namprd11.prod.outlook.com
 ([fe80::ea10:3d10:93bf:f83c%6]) with mapi id 15.21.0071.010; Mon, 1 Jun 2026
 20:00:04 +0000
From: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6][wrynose] cups: fix CVE-2026-39316
Date: Tue,  2 Jun 2026 01:28:01 +0530
Message-Id: <20260601195801.4008899-7-Abhishek.Bachiphale@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
References: <20260601195801.4008899-1-Abhishek.Bachiphale@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0094.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::18) To IA0PR11MB8399.namprd11.prod.outlook.com
 (2603:10b6:208:48d::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8399:EE_|SJ5PPF8F93806F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dbaa48f-b4c3-4632-97be-08dec0185f68
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|11063799006|3023799007|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info: 
	9A9g/h1OUck2EdNMM3Ni0u77u/TFtruPkboMtkF0+GudbI/5af8uX6tuuM6bnG9IrWo5IOGO5UPJWX+yuelKRlwMJRCTZ8Jg3r4u7kwxllCSSjTywhM+XCnu3L2cOi/BvKiEe5hOf260lkKkfey7CvFRl75vkfxUGq84uCGoavEoX3EhFsb+W3cFYakn1lqJlGShF1igQ+x5bc7Q0D+CSbono964Qm5KCVd3gCfH7P9LsZ534A6ncQm58R5MIGRGDKHNCzhD09QOBdZ81zzFGC5FWw2V/9r1k8pgzLLtZF3sv0ejXexcmQ9uYIm6Mjvjhfod66deXeId/Y8j0PPEPUGoTIabCPpA2zs8V4HgKjnc3aNRJaBM3ztPeANn2OpNC4tYuiuGtFGLMP2c5fIHHRlPuCMapJMShpuP9LPxOPjAf6J+kjT1MT9h8GWKHaEkr8vfjkm2BzqhH4v+2e+5VAU6EaMkpPcv8zm60vhFg8pGrVpLRRTdSntKWuQ5gjFlhSCV83fvN5+avgt5VULLXMrKyHBY2dU6rsEP4HA+nxTqWadi9aatNYLgqMRLZutzY79bmWzKCg69isQilt1cUl1cbYi3uhSiGEL56oKV/6YrCMYbQdck58niiofUD618bd7TItK+4f3M/oLhjCgXguO81Yzh0VlxL6sh4dgIfMFnYUcUQFsV84Rh2sV7eL1BdLqSNkMwVqCB2ZtaTvwdD6/+WYjLc2KgVGXcvz4SQOsY7dokbyl2M9sMTPaZfJ/a
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?A6OFqeiJG+KwQkgjWzhWIzM0u2ttNbjWHSZHCH1Pc+qKvlEDibJsxwZzgnWI?=
 =?us-ascii?Q?rUj0xOPPpP4M8iOYnaV7/tYIzMxFGsQo2aBWm4Fdz4yi9i5bot+LPBmGtKMx?=
 =?us-ascii?Q?hfrHc+HwYLWLnzC+bIn17SH/77LbFnedZVkOTsXlA8tZZE33PofeMuVLXU/0?=
 =?us-ascii?Q?ey+kcVjRh7zukBl+o3kvT7Ahv3BTWAMmHGKpvTjxKvM58Yw3iWZtBwP2KMsI?=
 =?us-ascii?Q?8JP0S4+bOTHjN/Hif0DIglGc82c0C4yEyKzGXeRbzRlfiSeK205gSkCERmyM?=
 =?us-ascii?Q?H8W+ZjCXUG/ZvOV/Zy47EQF/3Tq7jhxMxMLekvA9/X+aNyUiFz4mKgNC4Za5?=
 =?us-ascii?Q?bkmInAMKpfuj3UFVNMZPdQwSPAwqf8ulEQ1BpEA2TX1SpFZJi03r4kKgDJ9A?=
 =?us-ascii?Q?9gU1I8JFOEIf4QMW0eERrCX9j/Sl10/Oo3ynAzOrYzLMjhWKTUQWkBbtodUj?=
 =?us-ascii?Q?tLoe1C+Ox7bmdIW5vcSXNoRTfmCutxUs0mofUYfvaaOUj0cor0QEj3XrrwSa?=
 =?us-ascii?Q?gaxMRvY7SZ/2JcneQfCdxcWHT3IUUDn8fuvee6N2hXIF1ewZREjkWwB4I+cj?=
 =?us-ascii?Q?dYRRWEHh8IWaafyFBR7N9s6O9A6s+6zzCOEMEbByiiYJfO+psGBRHW6NugXb?=
 =?us-ascii?Q?0p+YP2lqOQGFPrdlY0f7G8fVCwLXMKEFZj/cSZah2mMF3yEYi5AMqoh/nfB+?=
 =?us-ascii?Q?GL3kUk8Rtqq8ugNcZrzkMEGeQhZ1QLDDwLNR+1yIvKcwg69bqhWHg7MaqEnm?=
 =?us-ascii?Q?gDcxK1LopG5EQEDFjJFiKwXH3UOX7t8SHrsgGyBGxK1mQIphlKyOSb4u1kqd?=
 =?us-ascii?Q?DXp1s7Z7GWmGzAtj3qC1horOQ+9OAe/D0IvDjN+qwxkHa4/CR2I5leUxLPA1?=
 =?us-ascii?Q?B46gIgSVh83dZWUlhh3yTMxq+qF78HSnR3jzY+FYDvMQKKTokNuiTsPnBvN+?=
 =?us-ascii?Q?ftmjJD8LGikDex/affbY/p2D577PCmLEpc0n3nzRrmTfhtlk/9s+R57YeYYe?=
 =?us-ascii?Q?VBwPUBaZV1UiPA0u2MzPXNjYXh1drmy9xh8MIVx4wPasnqNYv1TRdIJPsIiQ?=
 =?us-ascii?Q?+59PbUq5YQKIARisVIYVrqrkzmaDH146r5hAeoc3QUPwb4aobZrDZiWcpxHd?=
 =?us-ascii?Q?zTpJ4QDc1hoKdwZAXnedROqRhZrODlYX1MSkZm3Q6wr4cYPt5dqcYqDUzSyn?=
 =?us-ascii?Q?/144o2l2YhwrGFC1WpVqUOMbFBivOn2UBZakPch5IgzgmAnVgOmmTUf+NcIm?=
 =?us-ascii?Q?NHspgWtacDf0Wohk6WqDbmyggJq1kSeGyieYujYSlOEMCQXNpkepsNd/vaYf?=
 =?us-ascii?Q?Lcl67a2KugArd8N6irwNfWaUexmkqfTRrP3RpX4c1IkeUkV/49EIwt5MqOMz?=
 =?us-ascii?Q?f70DCjDYdnrlydqwGemifvotntY79tbZ5IPMW2hnbkKODmctIC2wVRO/zHXB?=
 =?us-ascii?Q?4JpYMHqYFUrlfqBUZozy+4Fl9DyWy4H+fu+qMYjMAcPL+GTf9WWU6ZZ4w6jc?=
 =?us-ascii?Q?yKD1sXCJZJJo2XfGZrwj7dD2mG/te1jSjNpNAFvrDcufOtn9FSyq1LhIDOk0?=
 =?us-ascii?Q?2YDA0GJhMgG5n0FZKQa1AWSIHVvqgrH0XLrH/sLqeSfQt7hyHX/7bpKtmJ08?=
 =?us-ascii?Q?iCS2/MKTbm3xKwpw4/riuy0u2dLd0gLqoP6xV5wYetCV9EjjMHceqfoRk/7Y?=
 =?us-ascii?Q?vl/GsgqWBK99fksHerV8zMAtATzmPcpzjm+Zk2VuAVZj2bSsoAo26CuBKdB2?=
 =?us-ascii?Q?lZtbpVDFTyvI8oD3QHMfoOWGQFbQgW5ZJzEqdVpuyoDHgXehZJfZ?=
X-Exchange-RoutingPolicyChecked: 
	CPGI88SWSIMh1xd0+LN8nBGhgFEqfj3YPTTXd2CaPOL2++VOWkqcXEasDaWA6s+eoJ0Xa0ZbuSF2rBzdejP/aWTSYHn+jEnLDKYJsg/yNZ3lEpVGpg72OvQ5YccYjevV6uuaWfGjt14q0bWs32o9EDOB0mOvdx3fZvmbJNtmWTF5mAVNtVTFCs65EI7kxrAs0y6Yg4POh0+wPpy2CYjBikFCHPGqDO+bWw+mNXU1oN78wCdH+HGH7CHrmQjyzdMuBlNHgLdTPN02sEl7E+g6GU4dcOUmYze6wP9JpyWyNO+bDmXz7I8UjqivnNsWkFGQ/sGFusLdFR453URW6Np/WQ==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6dbaa48f-b4c3-4632-97be-08dec0185f68
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2026 20:00:04.7782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ARaMgXx9/sUVpcDZcczbWOY/lmM99ggkeiDSiO610MQryQ0a6eWeoW1Gwdw0C20oVuwmNRQeBZ4QKYYOkum5Xrz0+jOcIMzZEKn05VNIUqNJOq8WDbzYxSVGAn7vC+PU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8F93806F5
X-Proofpoint-ORIG-GUID: QTUFaLBd4M6r5te0S55sZeMnkN7MEWe1
X-Proofpoint-GUID: QTUFaLBd4M6r5te0S55sZeMnkN7MEWe1
X-Authority-Analysis: v=2.4 cv=GI441ONK c=1 sm=1 tr=0 ts=6a1de4c6 cx=c_pps
 a=GAehYNPk9jHZ2DyfQldz4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=F_ubicZDAAAA:20
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=aTVoPYTGAAAA:8 a=jyMhGcLy8v583ZEMYxMA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=rKT3Ez47ESLuxQAP_tCa:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAxMDE5NSBTYWx0ZWRfXwYJHF9xDf8PG
 mqro1lQwEHpI3WPK7DdRI+sskGOIIikv2r/E1IAyy8iRceK86s7ocpBQU8PnkXu+traoHyX/Z9j
 yvlO4IzUvK/62Now9btpijeq8M+lmTNVUokxgGQ1ciB6RoOvnmAVOV0rKTespKnJ79Hvx57BXDT
 ZRb/5F6dq+UEzqJvnj3LH1C/A2URDUX/DWPUjRyqyVZLvWol6kIW5Si+lAhxMh7cCEHfVIeT34b
 4GCZNGjOjRmbngKCg/cz9LLK9VDaRif8sUBtqJ4E791zSLO1dl7D016uqPni7p98z2HRNWjOQfK
 ta7PrbgiDqJGTYM86smLDLVLr0800knSFhJMJzFNi5zvx6gRuPMxB202uV3NGnKxUh7p7aMXS6l
 DK3rXsZWYXkJtHvjlwY6CQDotpsbRwTqj+Lyv8OjIkab9oGMkDyhMnbwiDlLTAh9JTKsztseFMO
 RbDhTi+hLSrdQpPrtLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606010195
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Jun 2026 20:00:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237994

In CUPS versions 2.4.16 and prior, a use-after-free
vulnerability exists in the scheduler when temporary
printers are automatically deleted. The function
cupsdDeleteTemporaryPrinters() in scheduler/printers.c
calls cupsdDeletePrinter() without first expiring
subscriptions that reference the printer, leaving
cupsd_subscription_t.dest as a dangling pointer to freed
heap memory. The dangling pointer is subsequently
dereferenced at multiple code sites, causing a crash
(denial of service) of the cupsd daemon. With heap
grooming, this issue can be leveraged for code execution.

Apply upstream fix to expire subscriptions before
deleting printers, preventing dangling pointers and
use-after-free conditions.

Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
---
 meta/recipes-extended/cups/cups.inc           |  1 +
 .../cups/cups/CVE-2026-39316.patch            | 42 +++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-39316.patch

diff --git a/meta/recipes-extended/cups/cups.inc b/meta/recipes-extended/cups/cups.inc
index a12965bb6e..194b9c2638 100644
--- a/meta/recipes-extended/cups/cups.inc
+++ b/meta/recipes-extended/cups/cups.inc
@@ -20,6 +20,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/v${PV}/cups-${PV}-source.tar.gz \
            file://CVE-2026-34980.patch \
            file://CVE-2026-34990.patch \
            file://CVE-2026-39314.patch \
+           file://CVE-2026-39316.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/OpenPrinting/cups/releases"
diff --git a/meta/recipes-extended/cups/cups/CVE-2026-39316.patch b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
new file mode 100644
index 0000000000..c8d7e10ac2
--- /dev/null
+++ b/meta/recipes-extended/cups/cups/CVE-2026-39316.patch
@@ -0,0 +1,42 @@
+From 0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f Mon Sep 17 00:00:00 2001
+From: Michael R Sweet <msweet@msweet.org>
+Date: Sun, 5 Apr 2026 11:33:23 -0400
+Subject: [PATCH] Expire per-printer subscriptions before deleting.
+
+OpenPrinting CUPS is an open source printing system for Linux and other
+Unix-like operating systems. In versions 2.4.16 and prior, a
+use-after-free vulnerability exists in the CUPS scheduler (cupsd) when
+temporary printers are automatically deleted.
+cupsdDeleteTemporaryPrinters() in scheduler/printers.c calls
+cupsdDeletePrinter() without first expiring subscriptions that reference
+the printer, leaving cupsd_subscription_t.dest as a dangling pointer to
+freed heap memory. The dangling pointer is subsequently dereferenced at
+multiple code sites, causing a crash (denial of service) of the cupsd
+daemon. With heap grooming, this can be leveraged for code execution.
+
+CVE: CVE-2026-39316
+
+Upstream-Status: Backport [ https://github.com/OpenPrinting/cups/commit/0142eeb58e0d718b7d2e1f0d5dd214bd2192cc7f ]
+
+Signed-off-by: Abhishek Bachiphale <Abhishek.Bachiphale@windriver.com>
+---
+ scheduler/printers.c | 6 ++++++
+ 1 file changed, 7 insertions(+)
+
+diff --git a/scheduler/printers.c b/scheduler/printers.c
+index 4aba6241c..50778b89a 100644
+--- a/scheduler/printers.c
++++ b/scheduler/printers.c
+@@ -644,6 +644,12 @@ cupsdDeletePrinter(
+                      update ? "Job stopped due to printer being deleted." :
+ 		              "Job stopped.");
+ 
++ /*
++  * Expire subscriptions on the printer...
++  */
++
++  cupsdExpireSubscriptions(p, /*job*/NULL);
++
+  /*
+   * Remove the printer from the list...
+   */
-- 
2.40.0


