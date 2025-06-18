Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCCFC71155
	for <webhook@archiver.kernel.org>; Wed, 18 Jun 2025 03:07:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.37600.1750216054744571472
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Jun 2025 20:07:34 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8264ca7d46=qi.chen@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I1A2Lm017752
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 20:07:34 -0700
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10on2042.outbound.protection.outlook.com [40.107.94.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4798kkks56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 17 Jun 2025 20:07:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OZoIUYiH3JRInLmMVXbEwb3WlJMGAmRolXxJ1Sk+OtNLzBLRpP6ufmb7ew4EcCBySuq+9ix0k7YDe2sVqVvo++g3LSt/cdNHc3mLnWDvzqT4s+6Q68MNXiLtCPj0ROOz5uuwXhcmfFv0i2bdn8h1mZY2rP2I4cVciTaX0u+cG1c3KwMeALyroW6WjvpCf9CcCBSojWgP+DbY7QFdEfhMyCVGzy6/5MrWegXQXtCZTvEJ7Yw68o8F0jLaih6N/A43iMRqCWzbHJQKCrII7JZ60f9//YXlk987exoWbNH2yVWWj0Dow4J6V+eH0YTdZfHzXmVYEJ4Lzqqu/IODv3i3hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cRYcxGLb4YX+jxcyEYXnZlTyNiqWSRq3EivUe21Sha0=;
 b=m/AEUp6KvKj35eMhO5eAJYOAi1jjuaDPK7wiGXed2W3/SSuE2OA8UPd3rZT0a67Pnr8d9PeLpStgSHyGPtPYzd4q4k/L9m7GmPLc6tJ4Esu3anSOWT+bvsJyoe+7iObupP5fALdG7r+umZ3lMLByK6B02FlRJGDRh8+xbKyxhqzP6qEmvASEzxQq0yiwb/XgnaM1KD4gw69mbatRHTRKBkYeZwIHm8/pnz/bcGWwHDTpGOsJWekyRhKYks/M50B92Fl0X+jnw39YCX47mIFnCRribmh+O0hrjmEBcWyvNTGKl6/UEvQB9Q4SLZ6qDmntlUIGY1HJgim4xXVf5RLZsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by MW4PR11MB6864.namprd11.prod.outlook.com (2603:10b6:303:21b::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.19; Wed, 18 Jun
 2025 03:07:29 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%4]) with mapi id 15.20.8835.027; Wed, 18 Jun 2025
 03:07:29 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH] coreutils: fix CVE-2025-5278
Date: Wed, 18 Jun 2025 11:07:10 +0800
Message-Id: <20250618030710.4051350-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::8) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|MW4PR11MB6864:EE_
X-MS-Office365-Filtering-Correlation-Id: 98475316-2189-4b71-11e0-08ddae15425d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EhZfMYduyfwJI4uWVGDdnBHvUhu8ZM7DPrdO4oRunoL1KsOA2aOeUt8Lzjyx?=
 =?us-ascii?Q?bNWk7xrM0jJNoXXCEIdxCUiBK6T0kSzVTZ19U3t4BQeYR8WojxXAzDNXtg47?=
 =?us-ascii?Q?xtFwUM7vhraCaEwBBeO/ejGkqzQ+lFNPYhndjp4iW3C4C/2otvDFKqlE7641?=
 =?us-ascii?Q?pGQRfdmBu9U2GCq7M+B/LnZOcbRZlARr37bxEhIMKzimuDpfoFLuwz+8iA24?=
 =?us-ascii?Q?BtFzp6gw5q8TNjduO9V/YjYUJb1zUKcjknEHZk1mVOLxZvZ8E3b8TK/hGj/s?=
 =?us-ascii?Q?KXrjCEIGKh3AVt1FiVbgJGY4SuDxupYLf31SogxeJTk1iqZxYxOQtNsGi3Xt?=
 =?us-ascii?Q?ZMVGjd80TDI7UBQj9b4avDEibCciPFOCYTCNoonE5hxHUsfswhbbN0UdCNtm?=
 =?us-ascii?Q?aKBvOwfvgmSPd+hF+q0JticvrnUW08ubw0dCervmgRrG68PSWkSEy2yMCHLb?=
 =?us-ascii?Q?DRx5Z3xUgzzz776eNYwNz/TDAp3YQ6/LhUmQBFGtOjVL7gukHsQrO0aX5jIA?=
 =?us-ascii?Q?8cYEN+JhpA5uxaT4yo7S9LZP6+Ecb4u1yc3NxX+cmh23FIA5d00ON+g6cpJ6?=
 =?us-ascii?Q?A2FICvb0V3Myql1JkAAL+DNiQkjyn4jiEqXPad+Cd8v1qCDbykzvQr6mvVmX?=
 =?us-ascii?Q?B8jDm3ckYvOd3VLsS7JJEHb9RXoqmybycF4eT/MLdDae/zyV2AUkCywOwYhq?=
 =?us-ascii?Q?So+2zM8WMZzS71xhMJWu18vwfDgBzai/76BQQv6AJGWf7f6AHRojw8yaWc+k?=
 =?us-ascii?Q?fVWnEW6+MUFJLLjAy9FAenKDpB6quES0N87I9KfGUFxAZEuXwHpn+BQENg7h?=
 =?us-ascii?Q?6CwbrwVpEvHcVuEC17s2TLGi/FlfNt5IXaxcG1AlH38J3tt4YPOhvljX4DWE?=
 =?us-ascii?Q?0jamF4V5KKZNVJLb6n7hVtOaoBTAOP8rNf2mVJXzjZB+Z456u97yYkZpROGV?=
 =?us-ascii?Q?FcESWOHE78oF4739i/iBbrzZL+su/OfPXYRcTPmTaoVbr7sFy53LzpVx1QDA?=
 =?us-ascii?Q?yJDBpXzXA2uicm6OGhhIuplB7ivz3xlpCXpnANEIN3egY9d6/bzyMXnhO4H4?=
 =?us-ascii?Q?FoOfiHCS/o72RGJBWIwkhOpquSgEDRmUxr162nU2quWpR11VzleKR+vysu88?=
 =?us-ascii?Q?J7184qjevLQbMOvN+bY4ZOYvUnajbLnjUEE4q2121xHXuvzduvYgexlMRnLY?=
 =?us-ascii?Q?j8ISoCMMiwACcqTsQO6jfhK7R3V1qUmj3MtQP977eVqC7M8CWvT9dcPX6E3o?=
 =?us-ascii?Q?iPankwsMez64pGQsTjoPNETnhEbz7GdfaQKwPqcVkVUew8ybSz1uZAJTLWtq?=
 =?us-ascii?Q?d8+xiaRmb6U5Wd7YqIW1dnxrPUpCU/N28bACuYhqq2KuvGT5WiXTRqCE/Ale?=
 =?us-ascii?Q?+FU8bnmKRIXMTrUqUrARkEiRRwmhesJcjReemNh8nvPE/wjrVKBKflzZqgEx?=
 =?us-ascii?Q?655iWRAQJaRbrRywXwj7U2AvkdjuWGHh?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?2/3jmfoBqYtCcDEfNvItMCnBOE+eD3VzlhKJ2D8Siry0C/NaszaRxo11oNzH?=
 =?us-ascii?Q?MrBFdOU9RTWt0eQr/fLSc1DYJoHNWomhOIWnGWGSzbsWKMZuxW6GFzeha9mG?=
 =?us-ascii?Q?v52lCNCZx82D5IVFXBZ3Hpjs1sOB6OeJG0sSCWPyu5qm0ZMuaCVBKd2l6pmp?=
 =?us-ascii?Q?GLcguW/zJskpgl9jss3NDjQ2ZN3vWE0gO87wFsCetTYxiRXl2lNbqEIGiwen?=
 =?us-ascii?Q?VNXTrezxzqO3U6ny4NGBxOFE4HDC/l7P1+y537jZDPGb19wlL5l8Wx9YVIpZ?=
 =?us-ascii?Q?2JBwCTH5Ue0U5BUbdf2eQgDYp8vT6G8uGKiELJFXnCBAESgojBmwgHvDN0Q6?=
 =?us-ascii?Q?yRtwsrkyoCKQDRFoEBPJ7dz6u51omZN08U606rlvrpouKiPzRLHj3cuXUZIj?=
 =?us-ascii?Q?o3D5iF+uokwTigCkvCK6ESBInckZ9dy4x2o5H6O/Nj1aCCPltbKvT8y3Jmdp?=
 =?us-ascii?Q?mocZG7kH40Fg0NifX3GSgPiar1fZ2zeN1HeBz+zDzkTczgWfzTS8LK3URzxw?=
 =?us-ascii?Q?0jxE57/6GJw2oOlxk9bvRfV7/4UG/tiuhoNrqwomVDMtCzM7OEQy0owSbYzR?=
 =?us-ascii?Q?4UBMVyU4hObkFOHI0cQ1woFR0vQxx9n9eB/eTY4u+Pnjt9BIrmv9Jh2ZesHz?=
 =?us-ascii?Q?Tz9aFzcLV7VayDRMTHnyitw+pGBgWnzLc5c1KPVQdMK7TGVHxAz5zhmTOHxa?=
 =?us-ascii?Q?6Xw5UaJh+YrXUhE+H6n9v8bpiFEkmDz1n2Pkac3rZIyIrL79qaq5OJc2/H8H?=
 =?us-ascii?Q?wyDMX3UdlZyAAR6oosK7MWmBEYw6NRW750YaoqmC20k6oLulGKdnB0yYJsgn?=
 =?us-ascii?Q?BSctInvUggUvCJpU2EjhFNTb6in3ghESm8EULL3FMm84HdIr8L7y0MCwMqxD?=
 =?us-ascii?Q?gMaw7ndJ6DJEGCoIVOmZD1hpA/OPHD8R40+raycdI/3PeJmq0U+K33grf60G?=
 =?us-ascii?Q?GgVNvt64i05+V4q6dJINqeMgAz5l7D9QmyzUhDXPzELKkAz5GbozKE+vnPBd?=
 =?us-ascii?Q?eBs69IiLErjkXpjbuIliGu3yh+WXrJ3pIMVsOHveY1J0As+IDfoe0zqq1fuj?=
 =?us-ascii?Q?RF130sF1bes+DWkqE+lXEAY4qTtoNl8HK6GcWvrqYt6C50O4QGjJSS2DHNYu?=
 =?us-ascii?Q?XuXxKfiTgohy518HIqEk3uOAp71l4rSA/AoukiqUxGm8YxAQErnQummx5Ooa?=
 =?us-ascii?Q?t/BscWaUPfd5CQS0YFW7ekE0Kq/x3AYrsPo57t9pBT6y8wbc015z4aiCYqCe?=
 =?us-ascii?Q?utN1ucfEyOoFLbTk32/Dit07qYzPngn3tHxmtsc0n3Y+4fPd110ox5/Dist0?=
 =?us-ascii?Q?FhPnRbQG9ynSFXNO0nf3+7TKVOnh/htafyx9oiNZl4yV4jkpPIfo75fvQFyE?=
 =?us-ascii?Q?ZfzCpVI6b411L3zeEbgpxJKdrmDuXx7vOsqTF6wgfXOrq6uWsmJYtlGWEVOk?=
 =?us-ascii?Q?wBSJmcb+gd62AJonhk77cbPSZxcUhanUqL80rJT7vcmWuwVBcnBlEtvZCViZ?=
 =?us-ascii?Q?KWvaxMGQ2qh4vNDXwXkEK5fjQxEQ85vB/QrRCFLeCITqcPbxHmvRjHJSOB8E?=
 =?us-ascii?Q?755b3/fOc/ehdbwhIPKjC0VX4OQwuD6G33VE1/8C?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98475316-2189-4b71-11e0-08ddae15425d
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2025 03:07:29.0482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UQTO8eveUrftj5+WSpwhjdD6Wero21xePLt0I7S9oVnTKLdul/qs8iOTgPtwy2CilpEFq1xRuVQkvm4p/sgYIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6864
X-Proofpoint-GUID: D2f6AhYg95uamNdhF-i1olRQFM1_ZYPG
X-Proofpoint-ORIG-GUID: D2f6AhYg95uamNdhF-i1olRQFM1_ZYPG
X-Authority-Analysis: v=2.4 cv=MaFsu4/f c=1 sm=1 tr=0 ts=68522d76 cx=c_pps a=00UAwjix3vm3VCpLsN/FZA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDAyNCBTYWx0ZWRfX7dV8huLj6Xnk oktYgtBslax+KHkUdCyQxdOTdpooq8FMiBE8IbkORMiId5uP3rjoe8ayfQ4mNEowSAkNz1n5XyP lNGPaUxWWRpXHGwyoyBOqEV0YYm6yspXgzQqIMMXYX626UcZpfmWHIiVzSkH57EkjIHM+TapoiE
 dhmE8u6n41uPwv5iGbc4RCFJ6ioHO+V/iz+813ZGdfaLSFx7rqWT+jleeNJ1RBWBSAN9Kb8dWxU 29jILF/b0v1i4MHOqhbGUOt+2J3sK/yOMIh6TvFbI+ZAJUP16P5Uh1W1nXWeqCnKZZgxC8xpu5l iqioHRu8ZOqlP5OgNPgQ3MPWeMgPdwvuf9im+B+0qhy+tHBazi7h6CBEd94wOAd/Y9a054lVwX8
 giFacErY7zZ2TsDIUC3EanrToC0JjSWbLdFGf6b6m0k7olVunEm4TOFRBnY6rVlbC8DSraWn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_01,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 phishscore=0 adultscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506180024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Jun 2025 03:07:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218968

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...1-sort-fix-buffer-under-read-CWE-127.patch | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.4.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-sort-fix-buffer-under-read-CWE-127.patch
@@ -0,0 +1,112 @@
+From 8763c305c29d0abb7e2be4695212b42917d054b2 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Tue, 20 May 2025 16:03:44 +0100
+Subject: [PATCH] sort: fix buffer under-read (CWE-127)
+
+* src/sort.c (begfield): Check pointer adjustment
+to avoid Out-of-range pointer offset (CWE-823).
+(limfield): Likewise.
+* tests/sort/sort-field-limit.sh: Add a new test,
+which triggers with ASAN or Valgrind.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention bug fix introduced in v7.2 (2009).
+Fixes https://bugs.gnu.org/78507
+
+CVE: CVE-2025-5278
+
+Upstream-Status: Backport [https://cgit.git.savannah.gnu.org/cgit/coreutils.git/commit/?id=8c9602e3a145e9596dc1a63c6ed67865814b6633]
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ src/sort.c                     | 12 ++++++++++--
+ tests/local.mk                 |  1 +
+ tests/sort/sort-field-limit.sh | 35 ++++++++++++++++++++++++++++++++++
+ 3 files changed, 46 insertions(+), 2 deletions(-)
+ create mode 100755 tests/sort/sort-field-limit.sh
+
+diff --git a/src/sort.c b/src/sort.c
+index b10183b6f..7af1a2512 100644
+--- a/src/sort.c
++++ b/src/sort.c
+@@ -1644,7 +1644,11 @@ begfield (struct line const *line, struct keyfield const *key)
+       ++ptr;
+ 
+   /* Advance PTR by SCHAR (if possible), but no further than LIM.  */
+-  ptr = MIN (lim, ptr + schar);
++  size_t remaining_bytes = lim - ptr;
++  if (schar < remaining_bytes)
++    ptr += schar;
++  else
++    ptr = lim;
+ 
+   return ptr;
+ }
+@@ -1746,7 +1750,11 @@ limfield (struct line const *line, struct keyfield const *key)
+           ++ptr;
+ 
+       /* Advance PTR by ECHAR (if possible), but no further than LIM.  */
+-      ptr = MIN (lim, ptr + echar);
++      size_t remaining_bytes = lim - ptr;
++      if (echar < remaining_bytes)
++        ptr += echar;
++      else
++        ptr = lim;
+     }
+ 
+   return ptr;
+diff --git a/tests/local.mk b/tests/local.mk
+index 4da6756ac..642d225fa 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -388,6 +388,7 @@ all_tests =					\
+   tests/sort/sort-debug-keys.sh			\
+   tests/sort/sort-debug-warn.sh			\
+   tests/sort/sort-discrim.sh			\
++  tests/sort/sort-field-limit.sh		\
+   tests/sort/sort-files0-from.pl		\
+   tests/sort/sort-float.sh			\
+   tests/sort/sort-h-thousands-sep.sh		\
+diff --git a/tests/sort/sort-field-limit.sh b/tests/sort/sort-field-limit.sh
+new file mode 100755
+index 000000000..52d8e1d17
+--- /dev/null
++++ b/tests/sort/sort-field-limit.sh
+@@ -0,0 +1,35 @@
++#!/bin/sh
++# From 7.2-9.7, this would trigger an out of bounds mem read
++
++# Copyright (C) 2025 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ sort
++getlimits_
++
++# This issue triggers with valgrind or ASAN
++valgrind --error-exitcode=1 sort --version 2>/dev/null &&
++  VALGRIND='valgrind --error-exitcode=1'
++
++{ printf '%s\n' aa bb; } > in || framework_failure_
++
++_POSIX2_VERSION=200809 $VALGRIND sort +0.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++_POSIX2_VERSION=200809 $VALGRIND sort +1 -1.${SIZE_MAX}R in > out || fail=1
++compare in out || fail=1
++
++Exit $fail
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/coreutils/coreutils_9.4.bb b/meta/recipes-core/coreutils/coreutils_9.4.bb
index 62ecdea6ec..ce35240d44 100644
--- a/meta/recipes-core/coreutils/coreutils_9.4.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.4.bb
@@ -18,6 +18,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://0001-posixtm-pacify-clang-18.patch \
            file://CVE-2024-0684.patch \
+           file://0001-sort-fix-buffer-under-read-CWE-127.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "ea613a4cf44612326e917201bbbcdfbd301de21ffc3b59b6e5c07e040b275e52"
-- 
2.34.1


