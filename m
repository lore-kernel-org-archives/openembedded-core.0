Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9312C54F50
	for <webhook@archiver.kernel.org>; Mon, 27 Jul 2026 22:56:30 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43803.1785192984463147669
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Jul 2026 15:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=nf9xnkeo;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1668b11650=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66RMbGAL1753026
	for <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 15:56:24 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	nf9xnkeo8WowUobNcxVlW8Cp6aUD+aO3ADrwPMp3l60mUBtIvEVQHfi7r8RyJ7Oa
	EKu4u14Aijhg1J+2LN3njPnmxKtgeAKQRvOp9hKfjAiRlNc3vJqn3rTqQ27NNkPw
	mNPha4Ra5gBNJjxx/r5JeUqisT4hjUKwrH+kFgLqdeV4ScM9J+d8LUcf8pq/OuRE
	ibe42xlr4WydIDeYaE5UsegUvnNBTyHczR3UEJRbXKy9J9mMFInsph3tkJZ8edeE
	pAEkPn6v+gtm7M2YGiOv3Pa7eQxeL39Oq4AuetC9wOBgotbxXyg6qtT0idhKXOxn
	t3ExIicdV8QQfLf1yDHsUA==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012012.outbound.protection.outlook.com [40.107.209.12])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fmvnf2s9c-5
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 27 Jul 2026 15:56:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S3mlqVhlT+k9fMvyAvQPoGK3IjcLGJhHvUV48s66zqCDvjwt6HA6KgAX9ghlEixEOYs5cUoUvmGjkHuLugsVQXJUexGZandIYrnvc2WgdQ03w3U++nxw3AbL2kqB6J6IrF+FUasnKuZ7L21s/yUoFjK4G0E/965qLnFMPJglTDRVT03PoHGy182pHqyeE2MZsyzuE8x12y85ekZ7ArU6BjlVA/MIY3RfPJhy+lJ2CQvavvJUQGyKOrzpoylW2cjM5Kwv2CldggqE5o9tyvSzJ4F4zQTaJXx/nvjuwHjt/pKW1hJpHKPHXhYuuNQ5VJa9zLyTvOHTmXlGwsAsnxXrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=IWDTXntLcgPRqRfR4KKLaV/tP/o8bc6L5y6SMk9eaveVj40iiy7wmJJH2bl65tIVylalCFxz2sdX8MSUJTBpXwNwWf7MkCf+rdqAO1p+gAoRio4EuBtyvniwoC1smlcah8MY4yeshprwUMNhoI6LBJ5WD6aW2a7gVEbJVFgOf66KxX7NsnjcSclwI6MsnWQmNsWgB/JyztdpVnRrEATJOru6gZTY/eDCBipjEIElmqxa8EPrgnNR3QrE9RVZoACID2SOXRavErlUVNi/cUOhFRWQ0hMi6pnSpQ2sewseAtUdW6c4wzlba78TObYimbcj056ihQQlYAur1KK5NSytdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by IA0PR11MB7259.namprd11.prod.outlook.com (2603:10b6:208:43c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 22:56:22 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 22:56:22 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v10 6/8] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Mon, 27 Jul 2026 15:55:58 -0700
Message-ID: <20260727225602.342005-7-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260727225602.342005-1-sumanth.gavini@windriver.com>
References: <20260727225602.342005-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ2PR07CA0005.namprd07.prod.outlook.com
 (2603:10b6:a03:505::29) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|IA0PR11MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: 943958d9-ba6d-437c-a248-08deec324733
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|23010399003|52116014|366016|10067099003|11063799006|56012099006|18002099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	xGka8y+JJCmWjVveAex//4SCYpNkAJEYNz/2DpAWQEDTP7YJUanh70+W4nGmsOLlYiwpZON+wPOiOL8HgfJ628hGnDRPcjLRiW2Lz5eZ0iwn/bqKFckhb8qqiAUW8uwePJvmGuqS9UEl4d2ZAftBGXq1jZkVSv/O9/tP62aYUnd3pD+I8uxOHk3Q2gW8aGbSKiHQM4+rbeYUbeJV7kAkmyiV2RtR7cWa0RPZo+x9gy153iYDaO/tAyEgcsVq/z+kBi96CVmZs3PTSOlluIxxxW+UnmQZYjutvfS6dseygHKAPttGScSSyTNJkn19jRPt3fnnz2sG3GcuKYzhR0BZWJz3T9SWPq/+R73S5WkBG7jpAFppymTsRMuwt/mlP+fBJ3KC6MR7Xd9Qg+LDhz50V0M5IDPk9SEasrtPDAn2ENwuq6ms1LaCNQfBMmTpbPgOj9+fwfB3Qni0EecwYzVUhZYKZDE1a9MjOW8EskstQ07jS+fOzPOTkDS9mFCm3RKnn9+yiYslqvui3JmH47eXVhhETApRvXfvaLRcEgcTwWCCOIE/hwzpGXb18BZxxnPE3GLNgCg11h/vKbAJAhsH16apC1Ac60XW+UgqLNyTua5B4/JN3ZTma1R9hT1didG83nmbhQfFEcrorYjhGBISMMXgyS9j+ZgiypyVpUWr8Myev8ndC9IcBq6MTH3siNp+M+n1mux+JxRC6pUZ+Wfa/hufm2++v77a2LYvpEvGaVs=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(52116014)(366016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?sN+BbBzGioCl74DO6InUZ5T+x6rLffljYEvOD3ZX1b+0jX20K54KEhXjCXsu?=
 =?us-ascii?Q?dJexGT9cHZBqWi1aVK28uIVh6NjwPfWQKTyWvToxoTdLRn+p9aDXe0Ke+I+/?=
 =?us-ascii?Q?txFYMGfFZvuDyw9s8OT5BtupaZnMTp/J5TRxtZb4gyglu0eJao270bYyR3y/?=
 =?us-ascii?Q?hYZWHfuL1N67+3C5EiLCDBSIogwV/QvpsUwSWMlg/aIrRitsussPvZNQ00FG?=
 =?us-ascii?Q?TlRosd3xAl8rJMYj4Ki13Bea+6x8aVXHFONNWoGhuhVmO0YI72ZkZzyxw+xk?=
 =?us-ascii?Q?z+rNk7vVdaEM3D60rvP1tygo9PJuHmXeSdS7DaICX8lGpXWrvw1lJAbLM4Ta?=
 =?us-ascii?Q?b6YCmnksuUQD3/7cijFKerI7h0Sh7fF/RImSTJ+jfcLiTuQgqGY8OmigTcK+?=
 =?us-ascii?Q?dDFApHkYJvWu6SE3i+X7ZNdGLmH23azxKAJ+Ip2nmhPAFSdXFfB51AZljAKY?=
 =?us-ascii?Q?0+MckNmTDePKuqsGQ+GpCm04vUgp4U1cxCYnhZDwmEuaJHkqa2Dr+qBdpDVX?=
 =?us-ascii?Q?CWpi7V3D4HftiG3jR875G4Ya7zeL1BRcHywg5JAY66e8IlhOGM3wEEYze0GS?=
 =?us-ascii?Q?g3NPQFfqZ4Nsh2UErrwIdCQlylYz5SR9gi6usWIr5657LMrZRl70WccM2fa6?=
 =?us-ascii?Q?zGo4eo6aa4bJNgOuf7I2d8kK2OvH3aHa/Io46uaSoLVKT84NOkdQ+3X6gNCq?=
 =?us-ascii?Q?zp7TOJ7Ge1vePriTR98zzgupXU7zq2oYZSD5QBLx87JLbR+uCslU/v4vtNgt?=
 =?us-ascii?Q?AtTM38eZgsD1vFlqnrSwgFP/n/zHrS2uQ/EkzvkTX+aD1pd14Cdc5d76fNcL?=
 =?us-ascii?Q?vmpVv4NWF5wCdBK3mA6GCeJ3lUK2ayLKuULxIhEIxUU9LdpAEfU5go7Yl4ht?=
 =?us-ascii?Q?5k5hfHxdyRWJGAfj85WXjyLiKz2Fhll5EC25vBgzkK3EhpIbTIJUqZj9eMbk?=
 =?us-ascii?Q?+j43+Tp9zF3VnJPBNEaCqS87qU3mwJ5QcQBuF7iJFMWKuJyY6/Y16m0qlvep?=
 =?us-ascii?Q?W9lyh0Bg9xyX0+DZd+zXa3iBF8KCAEjR8KUfos3qdZCu7ULXXyqfqH8YaqL2?=
 =?us-ascii?Q?GDgeh8tmNJEdRvr/Cdgy4Qhl+yAldnumpVRREgq1fDk+qK0zFswvBvl2E7L/?=
 =?us-ascii?Q?3mJD+n74Xqu1qzlxmvdm1D+IOiTht3Q6oqA+k1vYCM23UIM6oqMB/sNcx7UA?=
 =?us-ascii?Q?g9SSMZfDgL7NPuA/dYgoDut7Qvq5H1qU+lOJ2hxHw7eO0+2LYhZZ89lGWaZD?=
 =?us-ascii?Q?GHLmfLC8y5rtDC5dotbGAni2cKt2sHpV2aeQBmE3EXdtyTKL+TwWrc2IuZR5?=
 =?us-ascii?Q?oiSJUkwJJOK8anscwJa666B+SpQ5iwjRHttNBieiHR92y0MTaP7LsvKSWI/4?=
 =?us-ascii?Q?8paG21YdN4yQqRN7ptogLTfcyO1jY7Sk/4juk1SrJFap58pQYCNMZGXuVgXK?=
 =?us-ascii?Q?QrgX6HfBbhQefSsUWtF/3eVvIJ5im7TI5gwu2mtqU+NiaFW9dldbNCDEudE9?=
 =?us-ascii?Q?mP4yQiCI+kohQYAihuVsL21WjfjgHeolzB6Em/QpLHlEOrJH1sHxWDavWikZ?=
 =?us-ascii?Q?F0cq4rPnB0Ahcs85pTYbAMeYUuLpk99XJnlTUTUyFacQwenppLaPOJ42lpgI?=
 =?us-ascii?Q?r517DVoczEqWQfJ/RhrdlAZehhpxpuJP8GYJA7cIyw6ogDXSscHcuDEFpDjv?=
 =?us-ascii?Q?J7hGrEPKRom5iUZQgTB4aDBp3kPPXvyH5Y4GYnKYuBkctfvidvHi8494l81h?=
 =?us-ascii?Q?9oL/bvaKmB3UvQ8R3AeBrYfR5RL9PyQ=3D?=
X-Exchange-RoutingPolicyChecked: 
	YWJ6Mtd6nDaP0zcxVWn+5VcfiNS9VcxmMdSgvQ1wUPSbE+N4gyblUOBUgicoKb5F+eX8wNnCahfvvUpk3AKtMgYtjK/srp7xhddmS0zq9PpSO3iNKkI7AOVFgTuAp3wKxfpM/vGCGp7sSv+GjcjL9jXkZUoH7Iu1J8KzP9njlrgMwyPm4fsQrJEWnA9ekELyN3ECbNCyQqw09ltM/Zk5pal11F9XogpQf8tVspyQeoOKvuoUU0axq5DBmYAGtqH+t/8gWWlhs5znrqTuhCxn4wVMoXzXBCeZSQzEX+bFo4iy/WnWN5ygUCOErCTU/fFq7FbSkD8zFY4xl23jJLsRcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943958d9-ba6d-437c-a248-08deec324733
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 22:56:22.1343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +dRqtWLW4EWW0oBQLIANFnVvjRz+XyDQ6bwExipL2OA4exK1vcXHximGuBUFkQG/cXoBZ6sBWCNW4PdWRNmn5GOb3GsRDTWExg7LMXny0ew=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7259
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX2MJbFB6BB2EK
 0RU3fMjoksu3pCw4BbBabLIMpRITLa1/mSmYmq0YZTWj5QWIIO80+vn+NwmUD5e0oThrVQEiNNM
 A27OPnOhvPPAgyYj6xvMjsRMcZggVGJ1zcyrBBI/AbcAPRAIF40n
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI3MDIwNSBTYWx0ZWRfX/EdMAv6ojRqn
 mshJB8Y4LuoinwG3ouIXONv9CsR9iWxmjhQgDRTuh+MDveiU2mCdckjiiH+CQQZQtsPQhTLsGPr
 XA0oMcqyRa+s2CFl5vB5bPyMvNez8iGA3FdG93O5Srv0OlioqaB6A9Ay1KF1+Q84jTepnM6NFnq
 nwUZ7Z32UY9cXZjqtQspYuFqHDjzU73sIS5pyCcRYnU7HtB2wWupIiSLpX+V3rFA7HorAED9Z4k
 24efKlLuUZ85E37CkIKgkUlKVD+CXNsMHBByx9/mSQVGLnFfxmbhB3uvoDLsMnpYWg/TlSer02b
 7c929hQiUH+OcZ335awdXsrw3z+aPcs+INAsiCIF8TZenRzihhUeDCtD4G7YtbmC7VBIxtqQRjc
 NT8DNBCbAKTvrZ+Of6W3oHrtkt05vikH7xkzblwybCYDAurfb5RvKPa0PyV7A+e19A6hy2gINwe
 8say8JsXKYpIw0vrOuA==
X-Proofpoint-GUID: ensRtJ2dccuMQsgN_q9__5CPXrPYLQyZ
X-Authority-Analysis: v=2.4 cv=M7x97Sws c=1 sm=1 tr=0 ts=6a67e218 cx=c_pps
 a=ul7AMzggcqKAecwK2qVOCw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: rf-vbOBwQGxA9ozzGiarwMrpJ_fav_yZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-27_06,2026-07-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607270205
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 27 Jul 2026 22:56:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/242130

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

