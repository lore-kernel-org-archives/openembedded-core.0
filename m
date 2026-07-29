Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4DBC55162
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 23:52:13 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.711.1785369122103421598
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Jul 2026 16:52:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=odeCRSc/;
 spf=temperror, err=temporary DNS error (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=2670ca2d30=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66TNmCtV2692684
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 16:52:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	odeCRSc/2AaW4zx17347tgBBZA+1NXi9NHn7TjtV/6GhUxoX9vsJz+f+FL2LUDaD
	+4DvJYjnzJsjPOIIOO0Yox0hMcsCFcUXFbof286mDO8NTIpEocU0jrH+UHoFa5mA
	5NMjC+n4+rfUrPceomOSuQNmIpomt5UHI2BYOPDJSJ7UkJqhuKsCRbpx+E8OpL13
	bY9u4t1BlYMNfnQi873VPZZEWIKvbZ+HdVc279fAi3wnpOkLY9hHriD/EAyJ5ByU
	/nhJ7lWoNa1OXOntc0eHVyo5ZKxWHQGFd+FEPJlJsbvO4L0JL7XDKx7REXNQiaXf
	Ba8MqCZEaHWg8ZOXwK08gQ==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010010.outbound.protection.outlook.com [52.101.201.10])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fqugmg03b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 29 Jul 2026 16:52:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wDtfoDsMf9zngtci8S/vP3J7/5nzBgsTx0ocQA5dutTHCV/4k29OK0n7Sei54sTc0rF0kjrEaguU31BZPC3QuHh1b7ZyEqOMRW+ZP4G58kVaqf66CQb47xZoQnu8D1lCeZsl2qbVzsgvdIvGQdkRtHMRXrW/XDVzf5jc0MZ3eqoyhRPtrHArey5iwHkRUm/v+Kv+nQZCKuXHRJ84fDYmPs/Re6cuLvtuYEjnL1IxPCiqd1wxeDwEczre/D9PCNnHOvwCABftYb1nZPUcXTUv9f+luOv3g/9YyCdtK+dsErHwlAIy1FBwrhLEzetn9pPTRL6bdzqHDEfevJBdJK/1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=aSfsWHDIv87ATsgAXg/CL5k5ZiBDk50qbe7CM1B9y0TAOprwAcFaA7MjtRqASKHNHdYISLbvFNFmN6ADuAc8UlQ7WODLYu1vFjPuDBSsZ23OpHR4PFbuZvUKfgdPrIseMOgyejH88mz/uX74S7OVT3Nk2RdrtYC5QunnVO0zdOdNRuJMJQFLHFZJGsQxDphEH05WzE0qIXOhApdXlJ+lOYm/9IhiUMFlamF01IT8ZiKVAJKi/xv8yD37cw0cbXXuT+bw77OggQcug+Mzrh1xGAEkrgfPoFLVHnSPx4D9z6IEplOtChhyicVwgJJiqBrLT9fnvpzrx6P6ZbOFwiUHkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by MN0PR11MB6183.namprd11.prod.outlook.com (2603:10b6:208:3c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 23:51:59 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.012; Wed, 29 Jul 2026
 23:51:59 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v11 6/9] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Wed, 29 Jul 2026 16:51:37 -0700
Message-ID: <20260729235141.1067679-7-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
References: <20260729235141.1067679-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0055.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::30) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|MN0PR11MB6183:EE_
X-MS-Office365-Filtering-Correlation-Id: 91af964a-448b-4a6b-d8b3-08deedcc613b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|23010399003|52116014|38350700014|11063799006|56012099006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lKVMKEWANYynhP9UnHcnWkIhRKdD9E3uPeNt3kyyRRmpNr9ao0Ntnu2DrLv0KCP+8w1otqV9Zf0xSoWBhj4h0SKD/8MIVqcuXjZhakdsbpCu8WEeBtryYO9cq2zWo8DwAZ1/k/NM3v36UyCf0FJpZ3vlj/DP9nHC8DrGbQ6jmfwMcLC6P6/cy1uRLFIzPLWh7lH9txGA3nL8sJK6SgQulXd3Yu4+oi7HhDCUfWnFSm6eO+DOk6M3CvUGDiYeqgbRen4tkJEx24+t3bITBD0SMtruDu+xaud9He7ld3qetuiZUL7DdzoFWQF5OFB3daFC41LmyiWUsp6oENqRGdBfhQwspWRTT6RB2IhKGBNQACAPBty0yuSSnByeNaqIwXGoH4BZ7/lUSwGb2B4syWP7D8uWi+uNsqH6kZ1kMpyY/6SvF7FfMRTaXxi2X+0Wae8ltwF+8pcSRx5jIZ779Z9x1jsV5TvLnL0w54Ivq+KlU3Zu4tE7DwJirsry2e5iQl4NEMtgjRjcdJo9Nlv5+q/atG843N40BSSTMbWwuBIFWMLM9PjUk+ti9Z4dmhkYp+OnE0oCWOkN63Z+K7D6LCYsaTm9qRN5XAzZAuMCPGC2iBd/RhGaHuxc+RW67gIGzBt8Pkn9rsH93pypA8kpGVnHJv6WV2/iYF94g/FpHL2CUipamAdpgt2aqElTaTsi2suyKJEx+qM4YgntTShAgLus0YPuveUQIvNYahp2f+3RRoA=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(23010399003)(52116014)(38350700014)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?zSJEk5cGzZJg8AnB58oCtIhApmaP3jcN5pLTOjv2omQO50ReaTYH3LqVNa0K?=
 =?us-ascii?Q?75pnooIPIzUYKvEc6HwVF3g26OCYkDneHR1REJgyxLLRIuzCbEzXOjETxI1B?=
 =?us-ascii?Q?T64JbX1UKb7R3DexE6eUHl8QWO6vd6wjZq8o9npMwzi8wdwmNjOeFfWPtx2e?=
 =?us-ascii?Q?8/boUZnSmlYbaH5j/H/nK+MuyGQQePnCyjWDnUcbl+b9CySQWRWqz+Kxezpa?=
 =?us-ascii?Q?ljc6tdcOCAC9p9GjbON9axmfCqxJ7yndPzdzgExXH2OyF5KwjqOMZpr4lKBK?=
 =?us-ascii?Q?KqyYqD8QoplnjBgWqA7eVtU1TNEVM6rJhORvS/66ZhBDF1+bPnaRiMo5Fl7j?=
 =?us-ascii?Q?pAhUf+I7jJtLXYMpWCI9RwTGtJSAN2+CfnJdDGXi3G06m8ggucRzDeWBA94y?=
 =?us-ascii?Q?QDvTME1xwj++DxJ+ecO3+YqWKrxh91I5eRGxOpr/IETvLsz20lc1HIxVec2g?=
 =?us-ascii?Q?A5c55TRt+/Z+goA82wdAaPuepO/RfMphgjdqYE67wQuKnwuN2kXtaHDxqbXk?=
 =?us-ascii?Q?5VO1huSglzN0JX8rAUZH92R1FVtQSrNgwB6iOD6kbKvJ8BplC1Xp0OA+geM7?=
 =?us-ascii?Q?34D860dhLPHi0Ck1ZBz3twh1ufQunOEjxMdyPVGb4a3OGfHHeHDejcqUWbE8?=
 =?us-ascii?Q?OJ6RNsiMjX+iCpBFnpUn9RNy/dQ5g0UrhqEDnmOoqEeCT1Ww8zWMaz69yfA0?=
 =?us-ascii?Q?8pOlcXVytMrIEATo7rk4q+HdQrSz6B+GYSHcwgs99IBEa12qBNZaqHBbs/rU?=
 =?us-ascii?Q?tMrKJwpgPjB0tUTS+JJApfdHd7qI4DPCKtOUcCaiJt9Odq+rmkfWeXkZes3c?=
 =?us-ascii?Q?DnGQSpWkoH2JHeRTi1fvBFPVU5eYfV65q1wGBtNONo3SotMloRHYO33QNFfc?=
 =?us-ascii?Q?IHIT+jtP25kIChUnHBm/ajyoASKbEAH1SFROK+9TEbG4U88f3WBeEF7a/Lb3?=
 =?us-ascii?Q?VRdCTh/q6N8+UlkhvCAJ3skm0rgrRZsPmbtBj0gAN0LK717Qjgh+RH7ZDQ+g?=
 =?us-ascii?Q?0rIiEsWJX8jbtcAWGKU8EcHi5Rp1hGch8YIy65VCRTAeXfGlLpNALv9owABG?=
 =?us-ascii?Q?0ZwG2qz22+PGxd0gniMAm4wQBSmmLijtmun/6neA+lAjSepXYA1i7WnQsaq3?=
 =?us-ascii?Q?ZOe5CeRhEAXxU+lUTgW24yhtjKFWxnnT3SGiX8d4RNy/uTlQkipPUJxBUW3w?=
 =?us-ascii?Q?8dnmHmuEpWa3UlWMTrCGdyad5JpaSwh8tQLNG+63NA3Ye1eCELaZVTEKq3BY?=
 =?us-ascii?Q?3Fj7wZVTN2Aqq/dbdVtdu7z2aHo9CvxZqAxO9E6IECiIkIzcV3xyRGUZgGBA?=
 =?us-ascii?Q?qn/2wD6HSbfXYBUqR8Z3i/1yayUFOI61O7+UVGKYVQK+1mSXWC5eCCcu2Eda?=
 =?us-ascii?Q?ND2Xwas8XKOhhgFSUZ9tzzQ6GsF4eY5nGx5Ig6jVlZ7hDQACebd7uojn8+Ly?=
 =?us-ascii?Q?A704GxiKYLwV1+5tFtfhhqSLe+9a3FOyXfVikNW8kwJ0r+lhSBblOxTm9vFQ?=
 =?us-ascii?Q?05rVgnECFzWWcO8o6mSdEAPcF8Ec4KJFw0fW0K2CYmljOkXokj6bN8og+jDw?=
 =?us-ascii?Q?WUK8I15zOZLSogfqHgZXo60AEjhqpEfY67s0dUzg/0bTAVboTPXYZvKZfN9m?=
 =?us-ascii?Q?IstdVSo7RRnEfFJ5ojXJ1vPCAUYWo5x5rLAhbeacpzajUkcFngaxWKrGps1v?=
 =?us-ascii?Q?afVV2Gz+nhdxScyVPIBfUHybhAndXJW3qCMz+9S4VeNpUk7CtW7GZ2s8yomz?=
 =?us-ascii?Q?wZKAeJ45SkC3JvK42P9i56DnPjYv4FA=3D?=
X-Exchange-RoutingPolicyChecked: 
	QTMwavoZ/peLGWOZ/ZeVCmXqQtGdkZhN3LCDRJGLHSnbESjtPcE/3mCUxBE3Fgzx2acaFoeq0xDW2cH4hoaM2G25Sw/DAYWDULZZP682nvitHdphUtqWB2rqgCNdBCHZw+WoKtgY7V80yP0agoo0aBrwUuVPcQ8CKVV9zTdj4PMDmfgMOPOt/NO8nyrth4fXDLy4fIrmT3rFdOe/rMFdJILSzU0ciwqMVaV3Ykqt3G2MPZxv7W0keQenMRzoT5jxPr95PT9uxy8RJmMNufNpkm/p8bnabxrbK6oBOK+h1mABckxKf/vU6oVqYNsmxtCmELV5WsweLkMuJ1PPHgZxIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91af964a-448b-4a6b-d8b3-08deedcc613b
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 23:51:59.4509
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uj39YwcOk9mXbI2lzaU9Wv8+aKYuSOorzjrGlMNzT9M4P4Mw9krS/UP7MQ84z4B72L+TczZ2/oUp9KI9n0yBIZJJLkIadXl8FSPIn31qnwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6183
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: XN4SLXdps5T2Ya6dIFfaLX2xvqbujrlt
X-Proofpoint-ORIG-GUID: _ajkSTB1csUAZUXvp1ZTXB_5TFVsCiYJ
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a6a9221 cx=c_pps
 a=utU5wDo5Le20VJoxH2NzxQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfXyxg5lO8+Co74
 8RZ+Ba5xyB8imgsDwpeCzVSEYuPiuyIGErzx+S70gtM9HNCNTgfEyBwzffXsl050Bb4/tdU+gVZ
 fAAdv+ej6bUKqD5cPNKpBsqspbhuKg+oBFFqf0fnZud1Yw0/BB8Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI5MDE3NyBTYWx0ZWRfX2Fvi3M/9p2s7
 IemDjC9qGcW4j3JinXoUTPrLP+azDQ6n634roel5CIkadnQ+F6bCKlvrA9HxJTUC2QcMvcCw1eW
 J5uS+id1wYCJr25ou50GJ7IfAU3MQMJluebZaH0DQw0OAgfENdjQYRCKcUCzv0o60YRUPPvmkkV
 PdCyvk3EQ6BERatimeqgvMM9eFNQEM/K3NLd9xtZVit5EHlLYkwnyx64TF3ir55eyYQ32DiCJyB
 3LmJIhQp4rNyEXa5a+AuSR3RK55wKsLL+ir2aIFFWspj9urfnFZg1Bqpa/1YGlX/E/7cX2wpVDd
 /WwBxaRt1epP2WuLTxQLTcp2v3AqUNx3WP5K50JPfyJQwWBT9vfJGD6YxhnVlfYwdnuV8iNu8q5
 b2kjQNddaJgGU+iw1LF41NCV5v0AnoxnTV/GgiIm+VQrhuKwfDzJNIVvzHfQNutAytWlJEl7Dqa
 tqeFqIInF+iVG2cfC1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-29_08,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607290177
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Jul 2026 23:52:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242304

The rpm package requires /usr/bin/pkg-config when it has .pc files.
Fixed:
1) target-sdk-provides-dummy.bb:
  - package acl-dev-2.3.2-r0.core2_64 from oe-repo requires
    /usr/bin/pkg-config, but none of the providers can be installed

2) nativesdk-sdk-provides-dummy.bb:
  - package nativesdk-wayland-dev-1.24.0-r0.x86_64_nativesdk from
    oe-repo requires /usr/bin/pkg-config, but none of the providers can be installed

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Sumanth Gavini <sumanth.gavini@windriver.com>
---
 meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb | 1 +
 meta/recipes-core/meta/target-sdk-provides-dummy.bb    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
index 37dad54409..6075770bf0 100644
--- a/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/nativesdk-sdk-provides-dummy.bb
@@ -11,6 +11,7 @@ DUMMYPROVIDES = "\
     /bin/sh \
     /bin/bash \
     /usr/bin/env \
+    /usr/bin/pkg-config \
     libGL.so()(64bit) \
     libGL.so \
 "
diff --git a/meta/recipes-core/meta/target-sdk-provides-dummy.bb b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
index 65b87fd97d..ca155d0705 100644
--- a/meta/recipes-core/meta/target-sdk-provides-dummy.bb
+++ b/meta/recipes-core/meta/target-sdk-provides-dummy.bb
@@ -54,6 +54,7 @@ DUMMYPROVIDES = "\
     /bin/bash \
     /usr/bin/env \
     /usr/bin/perl \
+    /usr/bin/pkg-config \
     libperl.so.5 \
     libperl.so.5()(64bit) \
 "

