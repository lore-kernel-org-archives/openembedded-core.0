Return-Path: <guocai.he.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41B9BC83F03
	for <webhook@archiver.kernel.org>; Mon,  7 Jul 2025 02:51:15 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.50814.1751856673090251457
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Jul 2025 19:51:13 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=928339c54a=guocai.he.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5671XI1Y019278
	for <openembedded-core@lists.openembedded.org>; Sun, 6 Jul 2025 19:51:12 -0700
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04on2080.outbound.protection.outlook.com [40.107.102.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47pyb5h3nu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 06 Jul 2025 19:51:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q45Ox1h7sjYwxwsgpIit4DrEm6be/DrY0aEgX+xvq4Dn0xLUg8NYtVeD/m1DG+Rd7fbtg5eqMdQBj+sIWLU1jDQ8G8EwoJZQ8MCHSZqr/xBm1c1FPeLObDqkrcf/HS3DtK8+91kfLxGy02Jk05thSlXpiVU/wydEsF6KROJXPXLej4Wb4SVLRzjvJsqLRZlnZVqSDHBUUe6MdsJu16lCFiZgXAfu/KBBqKPr7nQyzWPn8N4/RTf94/C8zpZb7F6+A+g3ADctcW5UTJcAC3y5IGvrGzuynSQEo+RIz7UCgQ3mGJhLOemQNLeBbYLiv28elwTU0HV11PBl6QxU7zV6/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/yUIz89RokJRp5AcsjTw2Cxp5+jMkq5a3RSqWRPsHHs=;
 b=Fce9LPqSW5FYa6RGbmlfvGp7YVQ8lDjKUvd+nL3S3xcMl1KcUu94YlLZsGfGTepLX9bkm+OOqqhSjPGiEmWU6bnHMOkWCrlxIZ5l8XpnPdyLiGc/9MeAf8TxvMT7+AkY5Xc8pKuGjVADAoyfzXcXWbB+zuVWkzHbI1q3JjcFRFuX1VG5ap9U1BI2BVA8V7MPGpAplTsCc+gXugiwn1ViDQjEcQb8HW8Q+WUm/Ddbl69wxi9VgG5ZOpMTr3W0w5YmtYdzc+o1CkmVITgFCg6X3EXtXi+ntVFND3Dbwe/NWxNh7+2nNUxURRC3ZxCFby9bgpGnPXsNIw5NDa0R34YsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5586.namprd11.prod.outlook.com (2603:10b6:5:35d::21)
 by DS0PR11MB8208.namprd11.prod.outlook.com (2603:10b6:8:165::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Mon, 7 Jul
 2025 02:51:10 +0000
Received: from CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86]) by CO6PR11MB5586.namprd11.prod.outlook.com
 ([fe80::813a:3211:c8fd:1f86%5]) with mapi id 15.20.8901.023; Mon, 7 Jul 2025
 02:51:10 +0000
From: guocai.he.cn@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [oe-core][scarthgap][PATCH] minicom: correct the SRC_URI
Date: Mon,  7 Jul 2025 10:50:46 +0800
Message-Id: <20250707025046.3759227-1-guocai.he.cn@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0109.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c4::9) To CO6PR11MB5586.namprd11.prod.outlook.com
 (2603:10b6:5:35d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5586:EE_|DS0PR11MB8208:EE_
X-MS-Office365-Filtering-Correlation-Id: 060f0e81-1c08-46bd-ba24-08ddbd0120e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?s5rx6ThlF6a7cPTo9UucMqmOgKz5dyYFXA9/02hgw8wobX+rshUAX9dnOaIe?=
 =?us-ascii?Q?WF3iiMNJbxrQKVESBucTlTm79biJgFu9bYfmctPqGNA01550JyY3sQHqn6sQ?=
 =?us-ascii?Q?0CEOMwNgTCiU+jPUSP0fgARNGojzr4p13JHZ/cv3IXCwSL0WEtXdeZUn2L0N?=
 =?us-ascii?Q?Ujap5yk5g4/yNBF/0DhOQCG4jWZUIfWNJne/XvyWJ2alWjL6vyFoa7fCabPb?=
 =?us-ascii?Q?zvZrCPI9GG48Pm3ec+MVWOEIwQGAROPiz+GJVxgWrAfefM3s2pC0cXsDyepu?=
 =?us-ascii?Q?ehDVxZhnDxvrP+irdcHosVRq69kS76pAGY/AVySfYH8P+2xJmQ+P77nTJRZe?=
 =?us-ascii?Q?CIJGRFnzZeE6uwR3tl2b3uFs5Ibr8vjdojw2kVy4jOEckTYJBtbu2H96keNI?=
 =?us-ascii?Q?D9iIuVdCF5pewZ1Ld+SLWrRkqjPsA1k7oX8mb+ZlIa0Cv0trxNk3VysOwKT0?=
 =?us-ascii?Q?qXfApoVLat081YdDvGUQSdixR1CNchwFMdNPtHXbZHdxM85k/r/WwjVewUpa?=
 =?us-ascii?Q?yiQrKkD5Z1SDyeBHr7qgWoiKj3lpq+2W3Ukza4B+o7H/TnVY01Z1OVFohakD?=
 =?us-ascii?Q?/PWhhUcVrYhy/kGY2BOm0zJHpeKyIv8ulsbKJw0FcXTSjIMzIc8fB+cd0Kw2?=
 =?us-ascii?Q?QDKooegYNRtpuHmrPGTfMaxAJzrL5B5q/xH2AhotEGJdmTtYnYedDfXYAf4B?=
 =?us-ascii?Q?WfwoBiAdsjCQ/J1o7+mQtwpeOetx/OW4tGpDDdxW1SIn/LAkA5CF01mQNTZE?=
 =?us-ascii?Q?5S5jMf50XdcK8b8KppdnHz8y4tXWD1PCmgmwdqpjUSW4e42mE5SvJnCnN+YS?=
 =?us-ascii?Q?axBT48FEOxXauJwEmo6kMGQYzbA7INuPgg5+kL50/0yMits0bZgoL6OWQlI4?=
 =?us-ascii?Q?1T0Vf78WOEi6B2LnXfHXInLtZ1UjD6B0WpdyecLl4yJjI2Ic4SvjE16KEEst?=
 =?us-ascii?Q?PZu6xaZJ58qhtkXRnIqeXaRe4dsE/PAZpi1u6Y0pF9jQBkPCArr+UAD4XOet?=
 =?us-ascii?Q?1NqadcwQxXET6kCQM29U+flb47X+S9Oba8Oe+6I1lp1RxxOYAsoKTXSh9T5K?=
 =?us-ascii?Q?uz+T4UTCW5LglbVu8SAn0MNW2f6t2z4payZQGQZD+LvaRyQTEymqxaJSGlrf?=
 =?us-ascii?Q?WoP3nltHpCtxPN3nU8hDbRMULFz2usRBtJFRg/lx8cPWtLqa3+h7kJ+vUFTR?=
 =?us-ascii?Q?zKSYYSXXyq3sIBqath499KnJ+oRdNYX3Q37VdRWzWMxFWDWvG6bw7arZbUhg?=
 =?us-ascii?Q?3w4e9kj16Fj443t39V68boNCeAH+o4FPoTaTPDyjzkI7svaUMIPnWiHUdL9f?=
 =?us-ascii?Q?N/IYQKrQBb4qAioU+BvWyt2Ot8kLOolIjTR+trn5w6PDvFt8TJbfzz0uLb23?=
 =?us-ascii?Q?I/lk+hSxHyuuPUfbBCYEcCI3Hwxfm81pe3xFgH4gy7BAYNThRsoYBSwbsGVa?=
 =?us-ascii?Q?y5aCYJqcey7tyHX7Fv1JhAu7ieBtnMrEECePMJih+9xk8zGosSBQFvf4HpSf?=
 =?us-ascii?Q?iq3kDFmg4sJY3/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5586.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?xgp1kQQFWaOu+SB3sW58ipCGMFAbKn4Y0k/xbQQnOhfcJyHKzJKZ2N+cIAqz?=
 =?us-ascii?Q?VybUGjCLX+RSVYmFsi8OlK2u4V9fOobvdjbEiu4dggvW2gnnPAS4MrBoDLvG?=
 =?us-ascii?Q?MdLjXlgcnW/0HUJcGMXMAf3AnbgKbyVpGmm84U76s2QRQakV9pi71abwOYrR?=
 =?us-ascii?Q?bqda3cJgQLi5Uf4yV21vQGxzcROCmDhW75IFLXLfgnVovSciJ4nnUHxxwbGe?=
 =?us-ascii?Q?L0XOEKcXj9xzPLEXPBMhvgbsQ9VZsad++gRl/qM2fU+5NIriQTfPGKzNjAdo?=
 =?us-ascii?Q?I1+Htbh+Jloa6nksYU/brgLfJ9vRQutOouxtUdvbd1naVjx2IHLKH8Q1U78y?=
 =?us-ascii?Q?3HwcMn5oP4xfKqEj9u26W6XMjks2lsBDoUpUCCw5miebxHjs68b7mUynyyVb?=
 =?us-ascii?Q?BtpE5mjWrcf5EOhy+KrwsoFDYoXLWdoeJJLNul6b/Za0DdVBGxItnpdrUmDc?=
 =?us-ascii?Q?KJFQNIZJL3ON3dpBblnGbLXXsOd6S7MNooIjxymS+oDLH5vqzDvhvLcyKI4o?=
 =?us-ascii?Q?0RXGaVca1Y67TAmiiJRAk+KcUDIKKEMJP2+Bqea4p3NBOPsSWhYFMsIb0m2s?=
 =?us-ascii?Q?iGw3zemVeGcqSC4v83GSQgEVjckFspiqhAI0ee7hY61B4yxBPJ2v+3Ih/2pv?=
 =?us-ascii?Q?oGJU/1niFXYCICmJlVe4s/uuqOF4pzib8XPnfUGfPXRGtvdTeYFocE/17WT1?=
 =?us-ascii?Q?0UWGi7S/RPeqEOs6JhZ7Meul/c/ECIMZiiZ1ppqh6cf+k/jQkRpJmTG+YMNU?=
 =?us-ascii?Q?RqSmjKcb9wsfBXXaEO7CAYOM7kYSX9p85fc2yU8NV1opD5aYyELEFFXkrV7B?=
 =?us-ascii?Q?K9OSYATyTz//t+iJ8IHe7tU8XSM8q8dM3n9vJd1NXUe9/CHBY1P31XTK67JI?=
 =?us-ascii?Q?9g+JMT25NGI2wODqvNT064UwOeR+1ce+nvomdq3Y2kWWRK5gxjMktsqKs9c0?=
 =?us-ascii?Q?0U4MrE3BtDNPbupuWaETXmy4ghcwK7yMic9n5j+4G6tpj6oRTghqYhQM6Hra?=
 =?us-ascii?Q?a8hQtDPpEWv5YTsxB3T7BGg+H25khcrv/iMIx++zqK2kd7X8Z0BRsN5zsJvB?=
 =?us-ascii?Q?CW8nbL0JJY6KbAzT/Cx3yC4vdRmOndTkCZoPrlBRs4yYiPNtyg5Ut0BQ/phP?=
 =?us-ascii?Q?cSBk4uZhhc1FR0cP1ceCsIrsPDw7wllFkiR38x+uWXzytJiLMTwCG0e9PkKE?=
 =?us-ascii?Q?PVXMzvi0Z8pJmJseUTOKiSNjtnX2t2N/5wURstPF72pDklgoA7oYwCCbsRcR?=
 =?us-ascii?Q?O9mTCuE/bvLdfVEtFWCTRWoboZzhit8f7Q7YBybBUj3Ql3FyekzkIeYjeoQC?=
 =?us-ascii?Q?T7a1qtqebAyoFLWgkXd4Xr3zjYd7OH/m4T+IwhiiKzrpnFm0mvmVNWgWisUK?=
 =?us-ascii?Q?xgHhrPvsIkYlTt2T5CqE46ztrw4eFH4k/faA+/NBFiKTLVYFh3RPeOC8qFGy?=
 =?us-ascii?Q?R5UJ+Vhmhe8SpvqDb456TDbBfuTnRla2zdtSK396ZdSJDWU39nDXJq+mrQJA?=
 =?us-ascii?Q?4fRlvgc16WAgV8aCK7sxZ+LcGo7Gu/wuf+yS5P8+oPEf2Wzej0tY7WKwLHIc?=
 =?us-ascii?Q?drr0KZe78GVph0XZZnUfvlGXlzlbr7E1DicJO4DFeBX76paVDBKtnKMPDB9P?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 060f0e81-1c08-46bd-ba24-08ddbd0120e5
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5586.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2025 02:51:10.3784
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: axyrvZYWvrbs0vwCnZalEivK+2uHu3R4lpKLR7kf2tcDxs+7LuQGM/zoO1Jn9NZEJHDpPHLTgX+U3RBsEvDYx7E4IqVBYTJtCJbgkMZstUw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8208
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA3MDAxNiBTYWx0ZWRfX7tRmJNg7qrfp TLldu6lNlMTPo1VBiEiARajWiDyuG52ZlQQd95MAb4McfCOSt4fPgeTIn0tdmYEXb6Xozs39h2m PZ0DYXWPjljy78sA16kO6uGXyWuUO49ZO0VQKieu58qc/8qn+cYs0flBzPmFHAF899ReLIj/l6y
 bEW9feYEh/Ydc+6KohQNddrPPIyvD1xM/R9Vzm9MbVMmZ6VnftM2/b6mijIdPnArKTp9kMqsmNO fbB1avpn3azg7XSwjYctae1a2YDW8MspZzAascKl1peIul8/nSTzg3y89n7merbKOGQU2ES4yit amWCPzPKmOuN2yY2MokZLHnSolJWE8v0Tdr4ohckciHAxVx7tuf+GMXo2RPuSuH1DddrwqZ4M6q
 9+on8aULyi54kKkOJH8nPuyI+0UAhz75BeOAkaLNiyB41Fx/8KEGMWZX/dZ2ORbeMewB9U5i
X-Authority-Analysis: v=2.4 cv=V5590fni c=1 sm=1 tr=0 ts=686b3620 cx=c_pps a=jHt2LEqBz83fb7eelIN2eg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=xNf9USuDAAAA:8 a=t7CeM3EgAAAA:8 a=uGnYa7RnW22gQ9SNJNMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: vs8OZ9JYJ57C0yaulyl0RSdrlgJrq2_M
X-Proofpoint-GUID: vs8OZ9JYJ57C0yaulyl0RSdrlgJrq2_M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507070016
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 07 Jul 2025 02:51:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219969

From: Guocai He <guocai.he.cn@windriver.com>

In http://ftp.debian.org/debian/pool/main/m/minicom/, the
tarball of minicom_2.9.orig.tar.bz2 can not be found.
So the old SRC_URI should be updated.

Signed-off-by: Guocai He <guocai.he.cn@windriver.com>
---
Because minicom_2.10.orig.tar.bz2 which master used is still 
exist in http://ftp.debian.org/debian/pool/main/m/minicom/,
so the recipe of master no need to update.
---
 meta/recipes-extended/minicom/minicom_2.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/minicom/minicom_2.9.bb b/meta/recipes-extended/minicom/minicom_2.9.bb
index 907d5c79c9..38f517f2a2 100644
--- a/meta/recipes-extended/minicom/minicom_2.9.bb
+++ b/meta/recipes-extended/minicom/minicom_2.9.bb
@@ -7,7 +7,7 @@ LICENSE = "GPL-2.0-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=420477abc567404debca0a2a1cb6b645 \
                     file://src/minicom.h;beginline=1;endline=12;md5=a58838cb709f0db517f4e42730c49e81"
 
-SRC_URI = "${DEBIAN_MIRROR}/main/m/${BPN}/${BPN}_${PV}.orig.tar.bz2"
+SRC_URI = "https://salsa.debian.org/minicom-team/${BPN}/-/archive/${PV}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[sha256sum] = "9efbb6458140e5a0de445613f0e76bcf12cbf7a9892b2f53e075c2e7beaba86c"
 
-- 
2.34.1


