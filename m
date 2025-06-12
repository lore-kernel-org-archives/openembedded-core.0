Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAC98C61CE8
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 09:57:23 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9126.1749722242494141264
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 02:57:22 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8258e96b79=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55C3Yba7027382
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474cd95bnx-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:21 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuDD6m6+sTrosYduZhX3Fz3ZFl9+QHUeOj4M0h00rv+/xj4fm30P07Pa5LW/otUFlk5gE0QlkkKbqN8ZB4YLi/b2Hi7/R6MClAah8tH5TpalqDa80X3L+FXb4hVbWoorGBdpGZKW/i42he9ocHemM4PLsGIxj83wodKMWVi4wWreem1FyXgn1uur0CUwxkkBfiShk73MNmwuYax2xwCdgboZVd0PfSjBBWceL0JmR0yGEmKDV5NqoB8bkr++P+pLV9CrN5zpkVBk6wWc5xOcLVWJawwq6k5VtMlirdfSMNxbCLXYyyMobDsB4SSI4IaP0xIZD51Rm2ViYjwBBW9UPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4LtgcHNUNHSGaWYbbaTl4BFG379HFex+LCKj55pOZu8=;
 b=p6Ing9LgJKRSnpAo/JruNdqG3nyiagDxBoxyMt2TZGkT7x3cPJTToD9CQ0S/1gp6086MCb3jM7E1RStz7sMXfs9vZWOGlA2gcn4nOwCRQr7jKjFfYPF+dfKKlMAtJ42gwQx1fO3bESrEwejyQKioNv7mfOmZuSz7DKnPsUP1jQIVo1Fi+MMijqSmZ8FcZxTXD62ho4Vat/4bUzGqsbW2m/po6xQUrtAu7bc3tuD0KKgxVt/y96mZuNGjuThwAY3b1K8BHo4/lUvnzkHH9QNBR4DIlkIE9dAqjJB5A7ySB0g8bM0Coju3JxEhIWrmwH04l1/8jZtpfQtpEvtK5PojZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 PH3PPF2B89F77E0.namprd11.prod.outlook.com (2603:10b6:518:1::d11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.20; Thu, 12 Jun
 2025 09:57:19 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Thu, 12 Jun 2025
 09:57:19 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        =SunilKumar.Dora@windriver.com
Subject: [kirkstone][PATCH V2 3/8] nptl: Remove unnecessary catch-all-wake in condvar group switch
Date: Thu, 12 Jun 2025 02:56:34 -0700
Message-ID: <20250612095639.3630518-4-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
References: <20250612095639.3630518-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH0P220CA0013.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:d3::11) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|PH3PPF2B89F77E0:EE_
X-MS-Office365-Filtering-Correlation-Id: 132c0114-1112-4443-08d7-08dda997850f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|52116014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?PQXnMMNokzGv5uM4SltYPMRF/BjT31PLYi+o974aQnDBKZrclwuLSptk3Kv2?=
 =?us-ascii?Q?IL2zxFiNza25B1YLMExn70dPjNNz8fDQxDDZWVw7QVmz/QjT0A7tN/pG5ZEL?=
 =?us-ascii?Q?q4zqN7c+9nwNsXKmo+Ic9KVNbGJIA4d9P1hG7jNykhiN1j9rHYNwNLRbDW1o?=
 =?us-ascii?Q?LBOB3qQWZC/RTzQZ0PuybX/lq54Ns4YoBombzfidl+1LLXB7TF5UZ6XmbxD0?=
 =?us-ascii?Q?yO9AC4kOouO9evzNyR5HJ6981jprkG6bcwWnFa3/xta66OEvgo8NotDKvD1k?=
 =?us-ascii?Q?9djr3aBu/kVMpSz4R4Fe4skUgfDoZPQr8S4rhDtAtkt9SXX5txGWfIvkA9Hf?=
 =?us-ascii?Q?9M2ilu/XSgnAYbiYZEaV+q55BEsLDfuNsgYqvXUBZye2pKWD7h4z7HeTsnUP?=
 =?us-ascii?Q?gIFEipUUygop+rIxqK4DUZwZnPbOZccqNJvYyf7GAhnn25wiqnITgSNz2o6A?=
 =?us-ascii?Q?zHRVJpeiiya9U+9MWmbv5/PhsTzc59HDeqiYCvIENTn7HE/DWPLA7+JelEoG?=
 =?us-ascii?Q?n8N5uJTdSgSVxiU5tpdiF6sRmSAiE06PGOtn2Xv6LV36xkoM2mojheB69tZq?=
 =?us-ascii?Q?epquTOdQ1wjeOhfXvl0tFl2y4G/oEH6iotvNoAm5eKiULkCR1gpTeFZPu7EF?=
 =?us-ascii?Q?i3XmAMM8QjfhkMudmRzRD7QqJmA7RWIW7EIawIJOT1yCg7kul9gLCiSb865B?=
 =?us-ascii?Q?mWX5DRVGuY2Y+dZT90UicWqrjbtEjDfKu2oSkswsaBaiLui+w3JqZ/vqIgdw?=
 =?us-ascii?Q?WTppsQrWitYAJZABsTU0krtG00sO26dGcwt7mxev+Eul+WqdTDtrgnLLluQc?=
 =?us-ascii?Q?eRUVDMcA2YzUsbAhuy/gt06rkIAX556F+fu5sfLzioP208ZddpgxFo9AwOhh?=
 =?us-ascii?Q?V96/83Tua2HthMZomsrJnHiEGbMHhJVpqXCR7Vdbxcgh/1KO7OzTHQzQ0HGK?=
 =?us-ascii?Q?lc7DpB93pVb/rS8YIXk01x32f+KVA9Hmle2KJQ68sIg5cn9TOj/DUlPP1tlX?=
 =?us-ascii?Q?6ywtZzSjuTKJa6fKyVw0weUnWgDFHMGrNJxquGtRLP2iLURQO8N7NPv/pVJC?=
 =?us-ascii?Q?3lcKCJw7T72x9wAqn4BSYsbN++aZMpepGARg8UQshsrjcoo0O/eNjf7bdpfD?=
 =?us-ascii?Q?w5fOKZ+Cgn1+CZbn5zm8ixebNiCzE6GIitmPIXKapNxlE42iN5NT3jF/Wo6g?=
 =?us-ascii?Q?yuJ9yo0TGZnFgw1nJM4PTntqc8lIAZH9cTKBwNjZGt8UzVCtV0am5EbD2MUx?=
 =?us-ascii?Q?QyRxB83rZznIbCHTYS4LrkG9xALlNcmeEPXC5K5sqJO5kQXVo1a6OoG3m+dJ?=
 =?us-ascii?Q?/1L0WTNNw9W5hiU5inw8M5LWAWdSkboFJkukieWj50AIx3LKPJIuqvPy+r6F?=
 =?us-ascii?Q?nTnlCWwCkvrsh4iViBdWp/hZj8c3lmnqnAWOujXU6UUmFzFJsifRN3zjwOrr?=
 =?us-ascii?Q?NrSw5dzDy7exYlPVlWSglVdtx8s9YFwf5m6k8KnBis4zfclxaInOfprcvTp0?=
 =?us-ascii?Q?H1/vkypzjGkDjWg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(52116014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?8KlTu/pmx7rovh8T+SfL2wZo3yNmODwulxUi685dwQuw8Wse9repCpPmvC2T?=
 =?us-ascii?Q?mkItyKSNtGMmPSy09RTNUKEnJnrimnCwqMOurGe/ikDo+JWWn/MyUyXn/Gjs?=
 =?us-ascii?Q?kB7LT8fa+0yHkJOorbCcUmGzx7oMiCJkN2gkQo7v/xJ1vdF/36vIGs1Yx/UY?=
 =?us-ascii?Q?Jy5VS4nu7aEUBofb+dSCaCmwaRk9D2F+tOW6lCrTbbHozNcT8xmSFoUabB+s?=
 =?us-ascii?Q?RqstXBpgfOePlY0uTDWKtn77IOsnjI2i4ECt1oPN/oQWZ6fMDsFFgBFPmOdK?=
 =?us-ascii?Q?SHWNsMOLrNe2ITt8gmpTbCuLWYfmLyhDMLN7a5RAIlexAbrRsb7oSr87AOwR?=
 =?us-ascii?Q?Ano55gBJttDDeNoLUX+EngA/d/t6GpOvMcsaw1xdDJr1/6x8v5DIhnByXngS?=
 =?us-ascii?Q?DXSiqrBqYSu3t89v+imjwegDMfF5Sj2Iob53b0K65xQbobevD5ol8b9sJPK0?=
 =?us-ascii?Q?5tFxS9FJtmdn84d9hSfw0lpXj5IUrlf9g8VX0yaNvJ23OxEzTmdIwdPHSk/F?=
 =?us-ascii?Q?/9/Seuj4r75Silv8FmotKL/HpUMJkimaT8f+cNxDupo7KshLPB6MntFIKg31?=
 =?us-ascii?Q?tezdKEbhZt6u2CA94gtquStx6GF6KdPHuRCRuFYw4C1Is+stQGU4foC142SJ?=
 =?us-ascii?Q?hbNpu+tKay0p257PjR/awAbQMLuCGY4m1DCzAtQ1UHarKKbgu2QsXA/qGHVX?=
 =?us-ascii?Q?PBoduERo8UFknFIquz9biVZxiCVuLzte/RyyKbV/zEuVLKaXYPktyj0M5r48?=
 =?us-ascii?Q?/uB4Z2u2GjqSnlxGsh8HyTd/7mh9MznvdMROeVgtTbgp7/IOMaupmOdjOLAF?=
 =?us-ascii?Q?I2e60QqfA5xni07vq8uXHnOT4tmCw8WoMdJ20xB+Hvfss+DikWj61XzxFgWK?=
 =?us-ascii?Q?NxVy5EVheFv256+aFMgN5tZLKydufHlHM3ANjCuJZdF+wfEeLd4zyS9BUh80?=
 =?us-ascii?Q?8VjL4rO+X7w8jMcXl2bR0iYLulFC+T+NQIp7Bezw5SP9xjh5c0Cvj+C3SW0G?=
 =?us-ascii?Q?CA0tUWilCPDlD+AxClAIOYUgJXipu2HSYHBdWxrvx9q5m/l0nfjY/qZIKVFO?=
 =?us-ascii?Q?RbYrD732XI74aFd8ZblkVyH2oUwXKYYLXbTA319FopaDeAl9xygLMuU7lcvn?=
 =?us-ascii?Q?Y7rbWgA2aOG9LGt8fXAMkWx22RwB7W2oE3BkJRoy1K4duGLfKPNxq8hXmE2p?=
 =?us-ascii?Q?j/gKDKQSmGvFna9ed6DEgUkHILgIU8iHnqii12oyx1sEYaD1P9HPQ9rbncor?=
 =?us-ascii?Q?0A0mIdAXRBGDlxGHTEaPobfFiCBHuzNoJ/AwEiXcoTgHv0rH/h4F3AQiUJfU?=
 =?us-ascii?Q?YfNb43gdo0sNUwDVhD38gsyOBZOsWQeoFvi5QaqR/rak8m1LXOnkJV+uY1yL?=
 =?us-ascii?Q?lHdBO1K5CwKhWNq7KohOSKdKFgT0QM5akotuT4fKbBG3ahFwxQxd4NliWOa8?=
 =?us-ascii?Q?cMFiwuxuYYhd4hvQzqePsYdca1C4Gzy0J+zJb74rlicx2FlJIhJPJoUMA1yo?=
 =?us-ascii?Q?n2ftfvDduWoWMJSBZD2W1OP9kQfkSEbRAFQJE9xVkbZuC6QmFBtj6eSrfWCd?=
 =?us-ascii?Q?wgBzh60rUusvhBGfT/TvBbXLrX09Fj4fut8rfNkJcsZF0yMiliQIiOxxUCiB?=
 =?us-ascii?Q?FXZynzwsLCK+ne7abM8X5ok=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 132c0114-1112-4443-08d7-08dda997850f
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2025 09:57:19.5258
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rt0Lfxd3D/VHEVuoRzLZoOExS9wJC8IUW2KqndwygzzUx4pu2/MauFLJsR+Dp525eD0apVAkoGe/Lni0pnC7Jn1eT431ma9oOEh8+Ce/TJg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF2B89F77E0
X-Authority-Analysis: v=2.4 cv=f+xIBPyM c=1 sm=1 tr=0 ts=684aa481 cx=c_pps a=oHfdRNjjH91Dx1UII95wnA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=t7CeM3EgAAAA:8 a=OTrzE_FXVTYtTbWwAisA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDA3NiBTYWx0ZWRfX3bXfvVR4iVNV H6N7O0r9cJNUOOrLb1iozUELMgg44XeZtplSP31KIljj6HSHaIBzjhDUGh6pe78f91PkfOApNLf 4XG7r2t003MAw80t89ynvpNqGf+5WSi1XUZ5jt42+kLLMRl+fefIdpEMSGwFYlORLyyjt+2XSmG
 JXLI//Movc8S1oFxyZZ97PDo8dIHS8IO5XToi0BoE2LhUx2dXSMmXZCXeUvkxKCNpRqYzCsEyxf Q2b7YrK8bTtH6x8z3Q+kvjcDYLTkXGuAiEs2BjwyOFtuQQr6L0PNlJWOFVwO06V2vsYO3ROInja 5LZu8owpAhTKNMPac703KZGXCh7MkfR3UM+fdF+ZhRKezT2Xl/I6q8xoL2Q2hHnCxtXGS4Xkmt6
 1VyqJTLuBt0eRrpcPZdGEZTSv0j1H+kSRaflwaGSI80GlC567XvorGyNvUbTqUHejKINlEly
X-Proofpoint-ORIG-GUID: 9X1lFHPtQBDDCs30__xMkQ_GAbWjFGok
X-Proofpoint-GUID: 9X1lFHPtQBDDCs30__xMkQ_GAbWjFGok
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_07,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2506120076
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 09:57:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218495

From: Sunil Dora <sunilkumar.dora@windriver.com>

The following commits have been cherry-picked from the Glibc master branch:
Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847

Upstream-Status: Backport [b42cc6af11062c260c7dfa91f1c89891366fed3e]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 .../glibc/glibc/0026-PR25847-3.patch          | 77 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |  1 +
 2 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0026-PR25847-3.patch

diff --git a/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
new file mode 100644
index 0000000000..566e9f1ae7
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0026-PR25847-3.patch
@@ -0,0 +1,77 @@
+From 5a20b546d5bb674334b0e658ecefd69e22fe8c90 Mon Sep 17 00:00:00 2001
+From: Malte Skarupke <malteskarupke@fastmail.fm>
+Date: Mon, 9 Jun 2025 03:27:47 -0700
+Subject: [PATCH] nptl: Remove unnecessary catch-all-wake in condvar group
+ switch
+
+This wake is unnecessary. We only switch groups after every sleeper in a group
+has been woken. Sure, they may take a while to actually wake up and may still
+hold a reference, but waking them a second time doesn't speed that up. Instead
+this just makes the code more complicated and may hide problems.
+
+In particular this safety wake wouldn't even have helped with the bug that was
+fixed by Barrus' patch: The bug there was that pthread_cond_signal would not
+switch g1 when it should, so we wouldn't even have entered this code path.
+
+The following commits have been cherry-picked from the master branch:
+Bug : https://sourceware.org/bugzilla/show_bug.cgi?id=25847
+
+Upstream-Status: Backport [b42cc6af11062c260c7dfa91f1c89891366fed3e]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ nptl/pthread_cond_common.c | 31 +------------------------------
+ 1 file changed, 1 insertion(+), 30 deletions(-)
+
+diff --git a/nptl/pthread_cond_common.c b/nptl/pthread_cond_common.c
+index 350a16fa..f976a533 100644
+--- a/nptl/pthread_cond_common.c
++++ b/nptl/pthread_cond_common.c
+@@ -221,13 +221,7 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+      * New waiters arriving concurrently with the group switching will all go
+        into G2 until we atomically make the switch.  Waiters existing in G2
+        are not affected.
+-     * Waiters in G1 have already received a signal and been woken. If they
+-       haven't woken yet, they will be closed out immediately by the advancing
+-       of __g_signals to the next "lowseq" (low 31 bits of the new g1_start),
+-       which will prevent waiters from blocking using a futex on
+-       __g_signals since it provides enough signals for all possible
+-       remaining waiters.  As a result, they can each consume a signal
+-       and they will eventually remove their group reference.  */
++     * Waiters in G1 have already received a signal and been woken.  */
+ 
+   /* Update __g1_start, which finishes closing this group.  The value we add
+      will never be negative because old_orig_size can only be zero when we
+@@ -240,29 +234,6 @@ __condvar_quiesce_and_switch_g1 (pthread_cond_t *cond, uint64_t wseq,
+ 
+   unsigned int lowseq = ((old_g1_start + old_orig_size) << 1) & ~1U;
+ 
+-  /* If any waiters still hold group references (and thus could be blocked),
+-     then wake them all up now and prevent any running ones from blocking.
+-     This is effectively a catch-all for any possible current or future
+-     bugs that can allow the group size to reach 0 before all G1 waiters
+-     have been awakened or at least given signals to consume, or any
+-     other case that can leave blocked (or about to block) older waiters..  */
+-  if ((atomic_fetch_or_release (cond->__data.__g_refs + g1, 0) >> 1) > 0)
+-   {
+-    /* First advance signals to the end of the group (i.e. enough signals
+-       for the entire G1 group) to ensure that waiters which have not
+-       yet blocked in the futex will not block.
+-       Note that in the vast majority of cases, this should never
+-       actually be necessary, since __g_signals will have enough
+-       signals for the remaining g_refs waiters.  As an optimization,
+-       we could check this first before proceeding, although that
+-       could still leave the potential for futex lost wakeup bugs
+-       if the signal count was non-zero but the futex wakeup
+-       was somehow lost.  */
+-    atomic_store_release (cond->__data.__g_signals + g1, lowseq);
+-
+-    futex_wake (cond->__data.__g_signals + g1, INT_MAX, private);
+-   }
+-
+   /* At this point, the old G1 is now a valid new G2 (but not in use yet).
+      No old waiter can neither grab a signal nor acquire a reference without
+      noticing that __g1_start is larger.
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index b7a9a2e0e3..d9073b6d64 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -63,6 +63,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
            file://0026-PR25847-1.patch \
            file://0026-PR25847-2.patch \
+           file://0026-PR25847-3.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


