Return-Path: <sumanth.gavini@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E195CC5AE49
	for <webhook@archiver.kernel.org>; Mon, 10 Aug 2026 04:53:11 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23265.1786337589824859987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Aug 2026 21:53:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bcgmGI45;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=26826cd257=sumanth.gavini@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67A4aL3H988538
	for <openembedded-core@lists.openembedded.org>; Sun, 9 Aug 2026 21:53:09 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=; b=
	bcgmGI453wIfMx9kWMcZs68ykLbx4k3phxA3UhXoPyFLeX9J3QMfpg8uV23jBX8+
	DKYOjcpznTH+GgtrA50LrzVOaulUpYe1ENdjNnOdJ4WyHtyNAFFYB2ufCPVqxhJa
	DNnI/XzR4qPJZcL9gTvaTClKZFSoPjABQEH7xTLVTj+LFg9l+bPThx5s6m3MgvdC
	sDUG8/mKPxIclPSFyCrqH0CMvWgb1xW4Iv+rnbJVhJ/ZiQFh/f3lkKWXd78N26vy
	dcvH4OFDBQFzeR5SXVkSBxs5Gk0H0X/IpyRU3c7g6NUBIrLEz06Ap3vMc46mgu2X
	76EdzH4Z/5+umpEvaacmug==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012055.outbound.protection.outlook.com [40.107.209.55])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4fwyr1smp0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sun, 09 Aug 2026 21:53:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q1HWmgsMTnyZXyzuDy1RjMNjlo+BAffPyb7Nio6L1YdsfSAjTNzcDMN5gbrvo+Y4Jq90O8ZDSyWYSJHWgXuydEUjcUW/0lB7BOY8n/u1n+F+1vl3VQO4lw0erD3xRCQQglbo9RFZOE1W4qDnx2Zt8rPZCiEMLMhDUdBvlaelfg34mE+BVljdPDfJVmI121uqJOX3t3SlVZ59iDSbXJakL4WJBz988JS/PGQ3JKmqioGR+BOp0TsawWeV8CiBqqt7K0+USzPzvotadvNpbOXCWt98bIdQQYr5zq3bwWIvCAaLXey4F7dhJnLiL3RXxmbWLrh6n7dHUJeZgj4x/vl73A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/ud+6qTwHGthzRQFY/Zq22ZvMOftx95yhtndj1FM5ws=;
 b=MVETmCmRqs8cywyUGOu86/K8oRgBjmarbjiSaF22ZnVxVVwIo1JLta1+bwAIidC9ywm8qPAqq+MyAmCwcgz+0x5TToG8AZpi8nnIs51UU0p9Ey2pwg9vHIDdKF59vSRcQ072lsXrxLFlER6PQ7qPxcY4xDG92Ij2WsnxrKp0VcDetaZBPwcQn2Z5zGuD8Y8QjeHivrkTWpQCXT2FG7w6lWJeH/brSstb2yLfysV0hnFFjMp91CDWgUyG8VihOHp2/IkMkWduzmaVPRkkauIdrPmA8mvXvrOVfndVEdws4Vp20SRkOccvzNQHCoXR8tKkiVCxZJtZCzkdDNnXQTBjvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA3PR11MB9256.namprd11.prod.outlook.com (2603:10b6:208:57f::21)
 by PH7PR11MB7595.namprd11.prod.outlook.com (2603:10b6:510:27a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:53:07 +0000
Received: from IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23]) by IA3PR11MB9256.namprd11.prod.outlook.com
 ([fe80::8355:9462:c4fe:5a23%4]) with mapi id 15.21.0270.016; Mon, 10 Aug 2026
 04:53:07 +0000
From: Sumanth Gavini <sumanth.gavini@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: alex.kanavin@gmail.com, mathieu.dubois-briand@bootlin.com,
        mattware@cisco.com, esparlin@cisco.com, peter.marko@siemens.com,
        randy.macleod@windriver.com
Subject: [PATCH v13 05/10] target-sdk-provides-dummy: Add pkg-config to DUMMYPROVIDES
Date: Sun,  9 Aug 2026 21:52:45 -0700
Message-ID: <20260810045250.3903576-6-sumanth.gavini@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
References: <20260810045250.3903576-1-sumanth.gavini@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0120.namprd05.prod.outlook.com
 (2603:10b6:a03:334::35) To IA3PR11MB9256.namprd11.prod.outlook.com
 (2603:10b6:208:57f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA3PR11MB9256:EE_|PH7PR11MB7595:EE_
X-MS-Office365-Filtering-Correlation-Id: d2000726-fa9e-42f2-673d-08def69b4508
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|23010399003|18002099003|22082099003|38350700014|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info: 
	YGdI9pCpEqch6LaQsGTJonue5zO3X6PK3qpNH1lrP82PQpXQ1uWRPeFYzeEtiw5DZSPWRU3tEljOFgWJcCYch7mb7C2/E8vdHcnpTY8UZ3UFoxPvJ2J5fuJacas1mztnGW1MISJHP+5NbVGsQUwRSTorzH5yMjrVCRjieBOdwCzQUOVDbqgSUJGSf6qvFUzCkr7HNj0zGF2zf16B201weVM6l23F1HkbBsuqu9T2AVHgLaNCMvm5gITU6DFtRQlAZscrnSu/PsFX1T9Zqkr3GXqIr7ywgXfPgvlxU17Vlm6ZAv/Ns40dLNdOG6TFex+qgnARsFD1FcodCJ1Q0Pm1hUWXaf11FDrhR7kMN9k1QyCUPCb9+dXn4RoC0UgSX9zooum8YtydFHMcEjpzR5r8UbZ9EUHWtKJpBmJZnulzHy+QN7lmI3v3WtNAU3qTkgWlqvWw6gDK4TeyBf88A1aHabyIfVyNSl1ZKze//YAq2PjspmGCU7lNrWWcSQq7uMAKaLws99q9zbMhQ5R1wwMsZvXa21qA761ZtpXxUyCvRmfQr/3QHeTh/TqNkp72sTi+sGdJvotGIj+agmR+XBW9fJuDFjurQhDe9tjl/8a+W4mZOp+P2usErM5hevx9M0ULQ2c9/eiViP5efd1O6WiR216wr7xVXJoWURKNtahZDC4p1pahABG7F7ADteK1ikjqpWY4GWDAOEOj9WNZ2akqA1kgl6wfmqIM6QSxddacuNc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA3PR11MB9256.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(23010399003)(18002099003)(22082099003)(38350700014)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?TVQQy7B1m2yMZYylvj1cCbgbJKsiwJxZkXHVaar8BZp0L/AQAgtcVf6jvV7V?=
 =?us-ascii?Q?gaJ7onbjWor/w24/vBBNAPKPnt+d+KUxLFv897CYG5YCnp48mAmK50Ix444r?=
 =?us-ascii?Q?TdSYylzpq8hL8Qm4CdMCp6cKhdPVQSOJE34PMUG/pFHr3A7CfmHWssvsZfKa?=
 =?us-ascii?Q?tLTYltMRHvkD5Rrm9IhPBdyuk0R9OXV4jD/ekpSPHpE03d1byvCEjsK8aFAe?=
 =?us-ascii?Q?YXohfQm40jiixhFazzgM9JINv6I+OCFWOPbBywn7lctRREpbpJp8JUzCrt3b?=
 =?us-ascii?Q?dSydw3+Z+ryDk/H8nU9SJxkNRwnOjpiVPBy38bbuHSkIobTBa+lOOmNsd1WK?=
 =?us-ascii?Q?nXYUHIK5/gQFq98/XiQ+mYngKSQgG7Brt4cOUr73OtrsLQg5gntyJvA7926w?=
 =?us-ascii?Q?CaTAcJGWE2luuVi3PAF0HohAGLFWPjAvR3N4xOA3bYanrZXmHsAC5id8j3As?=
 =?us-ascii?Q?etXwirB83APEP5BuK8jk5Gb6R0g4BBXORzcWnNEWiFG4khiv6y7lM/8du4Kj?=
 =?us-ascii?Q?xKz43tPKelaa/9IdGpcFqOcKP3RMHnkFryV+RRM/G8d5vwXIEl1/Lqe3ulLH?=
 =?us-ascii?Q?tbiegKwHT9YdCHEiEgBEKM1Zg07f6p5oO1Imh8gEyGVloUMlCMki48rpTDPm?=
 =?us-ascii?Q?kc03asLko4KRlt4Ug1KV4HggyaicWQxwsx21c3x5DQEpi3Cu348pKpWDYMrP?=
 =?us-ascii?Q?aF6L+uE/tdRMhd+NXJXLp6eG+IP4j+tSoqxluO6ERuy7WZxZEzCPJCv4Fk84?=
 =?us-ascii?Q?n61EInpp1X5kFQNd+QzrimuGmi1goMDI+51HiukGeoH0TfiSowL0oXxwrgMa?=
 =?us-ascii?Q?K5aZ2Q//Pg4dDhimZthg+mukzuTibnlSOCwsDYBaMZpOE7NKtE5YF61+4PT4?=
 =?us-ascii?Q?xXZfuqAde6CFGNKOirwnESOli2jdaBv+VAaK7qREffM+RRrIVqSMKl/2L97D?=
 =?us-ascii?Q?oV6Mqug6nxqN/jBoHPz8Sf+2ppRL4cTAv/M64OdpE1czp3y5BnbuM7Hy9UcI?=
 =?us-ascii?Q?fYkid++sYfcBMU4WjR8liFASfE5K1wpVN+VM55MJ8WpIajBeCwmLlboAdBpN?=
 =?us-ascii?Q?qRNqrEUmTl9/U2O/W/ejqYPZk3QFDL0vaBsRtQWEx/BsXByY+9hiy0/c3LET?=
 =?us-ascii?Q?OOQfbnkvbtbYC8NamgTiHUiHkRTuLidAx/Dhsrz9+aPRz0BCvo7VCYoPJO9s?=
 =?us-ascii?Q?lPakOepEu0sk4WDKh4MEqvm1dPwqWFhf3WXTSBiS6osHeaqLvgiHKmgxYnpw?=
 =?us-ascii?Q?JHPfiyYUZvn7xuTvH+eP6BGuvvKHOLntVTlh9ZSj6t7qhsQl5LxbUDrWwiQe?=
 =?us-ascii?Q?uoM2D1KuPiO0nh8DarXpwARRGZOLu5ZbFYRc8WRG8d5FQhE2det6PvuHGrhv?=
 =?us-ascii?Q?capLvVOzgwq62jFiKM2CK6hoUFHJwEj+G28lWn85kyhXT65W6qYDG9Urjsfn?=
 =?us-ascii?Q?UPNjP6wKAM21TJhghojtc0xSlJp1oeWv1i3qz378N6ui23JbFlDuCYKp6AaX?=
 =?us-ascii?Q?ahkaQYjMABOaz564AbQTrI2+/+6Hx1koMgFpEhQ/KEImwLYByaHH84ngV02+?=
 =?us-ascii?Q?ThL7NKKJ008C5ZeYnhd4/Zq8fbOuDQYbo3966L8Ol2idRg3vg5F2d+1ASUXp?=
 =?us-ascii?Q?7W9a4VDbRi+UzIFwkQ/oZzAlNBHkB6Vowi5gEKDI91XOJnvLD1MBlOIaHtfl?=
 =?us-ascii?Q?CzjNFYjPBig7wsZkEy8+X7qt3bIqVc8s2efIIIg0eZmvhuUAAtAkkkyecm86?=
 =?us-ascii?Q?tEdRPALf1g2znsvi6mLxpxojx7APlys=3D?=
X-Exchange-RoutingPolicyChecked: 
	kRNbTLXK2bal3M2IhaIBkaeO4nY260jRgzy8PjsfwlE/ZIzQf3COQfas7QuxyQFGA1GCS2t/X/bigxz3ux+I/q4jdmZGKCaATPizP/DBr1O9WAQ1mVpMW1BdFjNWPcrsUibOOEp3/c/ffVT/pLOlAjX3JEgRD3nAK6rMZgZh/CjQfb43OVIu9UtMRKMY8mk1q0l3cww3hml675WwVZmxe9R2pegWXfHEMu02IM4ERkGaNuYG89OomPz90F6TUTfJh6GCpoeU3t8wqv6L5KszuJkjcX9GVnKhYaxxrh1ayBGtvM2CZpNgWim/hISOrDvPFFntvnfVFtFbyJ5eezUhrA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2000726-fa9e-42f2-673d-08def69b4508
X-MS-Exchange-CrossTenant-AuthSource: IA3PR11MB9256.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Aug 2026 04:53:07.2503
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O8JSLSNu39d+kNwKQbgEZfZ2je+3Z1n1job6lJSkCVMaCnOyLBoBl2XOXf5XY0jq5HikKuaJyKkOzCd/AAPAoP2S12o1iZEbVRcQHORY+gU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7595
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX8zlqsSNPFDgj
 bagbYYu1A7+5no/6R3KiVh1JJpijzVfy4x/wgtbNHwmowm02VWB98kIO66Jj2m86eP6dWJCJ5NE
 Jx609G6yyd7Zh0pwNdZSXRWviOrePwPKpGPW4uKDkQfN29X6phwF3DWV8/HR/ItJsEf2Hk4c3qD
 ljEPZiXYBeYNQ27+gpW7FNUdqRu56/SMgMZ8oBSWha3OVL0uVqTJZolMyuH4MK6rRD5cYtGdl3s
 E/TQEU70ezgNQNzZDR6IurLs1n3uLjGvHPhRQ0h43URXT+sVRfZoC0unQ0em5iLxaRdCcpoJMFX
 C+oSyHPICdU/c/qpSvyLYIU3pSK1gepC3q8cVItp3PJrKAQSXMh19upNkJrDD2tW96LixU+bVW5
 pU3GeXLM8h30VCT/NeYCnv4Zo/DY8U5Tw9ja2FQ+yewl3ziptiFHhomvFATQ0LBXwqizkueH5Rh
 uOezdSlmrPRuBOEXaLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDAzOCBTYWx0ZWRfX4no/1WWl1dxI
 Y2+rELu4Q2hii7qDklVkssjDrU8ZNFFUP+fkB15oGeuJr12l006t93zPkAwiKZoFKgPiE86rM8q
 wuYDewxx6gQ5h+YvxGKxdJjmGea7J3omF6wCsNuBKLobo98N0xKN
X-Authority-Analysis: v=2.4 cv=Z5Lc2nRA c=1 sm=1 tr=0 ts=6a795935 cx=c_pps
 a=E7iPWXAsOYqR18yzHj3E3w==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=t7CeM3EgAAAA:8
 a=lZurfIDJcIjVqGklx3sA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: aWlOsUBT25TMT8IrszDMk4MK1jfpEXD7
X-Proofpoint-GUID: FxjQBVRP8kqtsTyKyNOeEX6boSFCNqO3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100038
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 10 Aug 2026 04:53:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243096

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

