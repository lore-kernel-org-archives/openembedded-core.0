Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26DA1C87FCE
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 06:11:35 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.75352.1753683090447451349
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jul 2025 23:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=930462124a=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.8/8.18.1.8) with ESMTP id 56S46KfY1304820
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 23:11:29 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 484ta1s5pq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 27 Jul 2025 23:11:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=duEh9DjuqGr4icM4REYuhtd6kJm1bJOr7k5NJQJiF72E+wAfeJVIIfSEqHhU05uVhS93n9gGqB10qrZhMqIB58tdB+oDDiLWTp8yaGoeGbW7/ySn+ix2KV84YC+gpLVGjoku+yABKzx8WoOn4piB1rG81NIWKIPLHpyNUqKrYm3eaVq/0O4ljAR2s5bMMkLUC2GyhhZ4UIDdy65i/Uvhf3kdMUGr5AYyVME28IU1Cxo3JZ/9vG/SqLnAbE29sqklhwka62eFrVXZwP6zWsG0Zt2BwwD80d1GPmnf41x8I1FmB9ncs9TWOg+cZkK1b/qUhF10GQg50AuLevOxoqBN6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v8HXpd73qbXo7iAztJ4Q1L8F7Kz0jvMwIdJgyzxaVto=;
 b=SL0b5tazTK79BBMkMK3QgzyCgw100pNhMNT7ZX1VX5pNe8iBLHRiPHtxQo/ZL5hdkd6WntGPIhwfrGmt/Q/dM91JbWzldiBA/OeHGTFqTEXzvjX8b7POS9W7MdnTupOqHLJ/xS5+TzCvGC6CjVF54A418xsD5mn1mLekoF4p/aqyg2t7BFAxuXXTtndjtyo4n0e9qBNUedafEB5vN8NRwCqvSab4r364HjoC9IBzgJd1LBKLYFjrytsqsV0XWBE6Fjw7Qry7fnppVmE5g1ZHaapJUhPi3FIms2Y8s9+Wy0FjYObLWzwoP1cJeR0tWX5dv+5NGFLlEYOVeOyW2aPVrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by PH7PR11MB7515.namprd11.prod.outlook.com (2603:10b6:510:278::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.25; Mon, 28 Jul
 2025 06:11:24 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.8964.024; Mon, 28 Jul 2025
 06:11:23 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar][PATCH V2] coreutils: fix CVE-2025-5278
Date: Mon, 28 Jul 2025 14:10:32 +0800
Message-Id: <20250728061032.3956638-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::13) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|PH7PR11MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 7214d0aa-f4eb-45bd-3093-08ddcd9d9422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?1o3fmr1t6bXVUh8YdTVtJwX+DymIN1h5eupynwxS0qRgiFQlzlZYSn/wEle7?=
 =?us-ascii?Q?io7ALRiH2JD+U1Wg0dtsFijkOVLjy6x9rnhfDzV36VWX4bkNaKv9g/Z3QIFU?=
 =?us-ascii?Q?hE7Eqtb2MA6iUDbqrNsRNt2R1efP60hhIV3DNiTPCDEKg0loPaLwPlytf1zo?=
 =?us-ascii?Q?cUj/9m7u5TDWaoYhumcHyujGP7/mojL5HDXvOAjJ7cyqdpz7ZFknRtqYhrc3?=
 =?us-ascii?Q?xTxA//DCrg47K6yWwku1b89aHQIfYjlrF6uJej9Q1WrCKBYFk1COYsmiSByh?=
 =?us-ascii?Q?iWulN2eANcjRY5SqxevQWOgccF84A6c2lArj5aG3CkCY0SHpkKftU71Nuk1o?=
 =?us-ascii?Q?KvhzuUUc47ybIzsd7s543Z9a9n34m3MCwlN+FDhGQTuvMp5J6klzwOV82dAG?=
 =?us-ascii?Q?OAzkIaSKl7YlLF8LjNjWgtKro0KVdnxpvS2hDq34AQs1G8F2xip34whgPxoE?=
 =?us-ascii?Q?0icbkW0mU9urw+kKIfmZag7/5WRmrAtZsO5nXBVrtLUGs/FHeCdfEyljQvG+?=
 =?us-ascii?Q?YobOiNkICMvnLtpWHRtzHo5hejmyinIWCFbAUvupyS7hp95RCIEBfAqisDEW?=
 =?us-ascii?Q?L6giOTHbK93eAvS1feDk/6OUqZXwL3vWcn1vCJs3tPsDH+XEd0MyCHWgSSpW?=
 =?us-ascii?Q?J7n8i23VHTKz2/v1GIYhstHYjyGVs4yO0kG1qs6nhp6Q+4dWeRxOgPRg/GS7?=
 =?us-ascii?Q?LvOIBk6PfwI6a90B346rtwTq5EH5rRqidfmOQjCATdVqVC+e/mTS/NgisChR?=
 =?us-ascii?Q?DoSySB0qHI4/C8Bw/Tw0xPfYic0SzCrEobkI13S0OWxDqCAxzovYfXq9NLJH?=
 =?us-ascii?Q?A1fSNRROlFMsG2m0VFhswUznZjUvHya/tXcl8coLehp5H5qa1D7yoyMyUN46?=
 =?us-ascii?Q?wUXirYa/KEbMNYTAPLU98PLB18yGhZ0cst6oLWmPQG0BA7vZCXK+FRgFcKsy?=
 =?us-ascii?Q?Xl7n52aVufB7kVx7Bz4kTOYvhiZnAl9dEPsFFNU+peZZkw3nbw53kqOs0Kqu?=
 =?us-ascii?Q?3tL9JhHW/1GjdIMZZE3NEyurhduMdUy24d4wyTsv9vw6FQO29mtSkX0EEMss?=
 =?us-ascii?Q?LlukvCGYS/2DI0cUG1yD8xkZe8W2am59PgAstpsvoNn1pC8ZkHW0OUV0bzuy?=
 =?us-ascii?Q?paAOvKrgHI8GwRyYBqCBi0tuY73rQkEJ2igE4+KnEVVLKXppgZqy9SNbG0Xe?=
 =?us-ascii?Q?1u8nExog3HXTkhLdokIYjiyxTiQB2ax2xfjizv+q6470ZgyxVwvMNvyMjAid?=
 =?us-ascii?Q?H9rQUkZvi3yK1+43eaFvJfcqoPUXzOJDKpwnluKj64ZoIiDOo0S6bAl7LkQ2?=
 =?us-ascii?Q?FzC4sXDk5b9qjURDW4TjNY6NPPzJ62ne1OLizOl2YS61DztMk0eFRWPkhhfD?=
 =?us-ascii?Q?2iBKhtwI/IMkP+0BnS/9ClmxIH4i9WIPE4R81oA8W2oj/kNWChuz/R0iqT1G?=
 =?us-ascii?Q?RNU0HYRtHoZPLajhNkH4SpmqRhrG8t07d5d0Fjlozf26zz7HhzWX4rMS9Y8f?=
 =?us-ascii?Q?PLQ+NIiAjw7S424=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?303skn7LfdIW6piq0p7LAb19HvW2gY/Bg9gpOezCCLpahboOpCRUTdNcwm3g?=
 =?us-ascii?Q?awqWCaBWrtV50FekhaV0cWQ1yp+rtp2WgvWHg6e9F4JmQReBw1+VxpNe6rwD?=
 =?us-ascii?Q?QSW5Ypf83knERKv+O5wk1xSn5cM+VydXmrW8dornVP1E3zSdntRIqh5y3aDa?=
 =?us-ascii?Q?d/maH1ZSGQCGzof0CBHktCuTx0AjW+ZbPT1fo7xu/i7k2pmcteTuOjiCljjK?=
 =?us-ascii?Q?4eYE6nANXN5Hao877zo4Oux3QavAmXK1PolwveqAdKyrdD+v6Oe8Tqg6jxvz?=
 =?us-ascii?Q?cmSh4LrZNDzr2yim+C8+gKtobp9uegt0HFU677Qf/l8r3z+cYjTdf0aDSFP8?=
 =?us-ascii?Q?ZCx7e07TGrPEHzOzNAnwWjYhfGHG6KT5w4OCO27Ebq+HTosRjadz1R9g4wCK?=
 =?us-ascii?Q?DV0zhSq0sEVyzCdyTNa48siTRumUVl0FOtLhD1Gb96LtPZ5aZXTq9znS5BPv?=
 =?us-ascii?Q?u9leVZnTrs3XXWtfeBaNorXYYv7jL1vwPKVUo9X0zAQ7JDOQjKDeIbD0Bsdk?=
 =?us-ascii?Q?jj+7r5Ot8d7Fj1xFoHU5XMsu0wuM2dUbWor+fimIn28/AfGUHQQJEgsUh7Fj?=
 =?us-ascii?Q?Dq/25HN4DnC/EdWcXYxJNHqv7+Got5fYnDJvPzkI/+HCoYifKLHtRESjmoTv?=
 =?us-ascii?Q?gqQGm8Mugj201ld3lvf5UpqN3XB1+vNVfqP6ld1qg6PDjAOJn50qM4xyvjpW?=
 =?us-ascii?Q?0RV1/OzWRHXcrfcxHVLmLp8BJ0PkfqzTBZjHBFn141nfMe4ynLHTLiHiBOti?=
 =?us-ascii?Q?DGYIyet3TI972t3nwkOX+FErRM/sZqcaIrLgrYv6YHbyZ6rXt3ynXFjCnl9M?=
 =?us-ascii?Q?RuSJCzQWL1sMYqpOh4fwEXzZUC/XvFM7zb45PNdAXKWQUb8MOWK4KoxLloDC?=
 =?us-ascii?Q?m12L8ueXj/3DZ55cODKaP2fU7OS5drkFdo7OZQc6XckGLNcDCzL4E3imXwG7?=
 =?us-ascii?Q?fYWfdi7o8SSOJz6Ty7bKfOWJCBLl/OW9cnJT0KmZXYQgbMJ5tXemGNxwvn13?=
 =?us-ascii?Q?VgeYnSUx3hK9DaargsbrelHO9sUFw2kWRqs/ufh+cBocXH4oj/Rrz1aM4o14?=
 =?us-ascii?Q?VNBf5wfH4yIvKBonFsoTWQ7jaEZsAXs5B78gt9YV1MyMscIwlgASqsr3NG8B?=
 =?us-ascii?Q?J/5jny8yT/MJln1yrWgW+6to/yl6RWCT7tub3on/UsgsO4CZe81fv5IY5c3Z?=
 =?us-ascii?Q?xHg4sfBGNs2MexSV9l3j7LH/6UUlBIOC8RPcbeXyGboDBrdR4XZWLMYFL3gJ?=
 =?us-ascii?Q?sq+JtLF/xU0gYd9f3XUyzcj/U5jPiFk2BkFW5SXu2cPV4oTxfxTNCcvT6Umh?=
 =?us-ascii?Q?PujlRMSylPdNWl3miIlZK2Mzw9jAlGkE8oPjPvUuM6tfiPjVNxQfuM7aJhJ2?=
 =?us-ascii?Q?VfNHfvgucvBIQDDeuOMXeqUWAtjvHB+VKHerY1QD+EXt3VZBOqC08ARuIx4v?=
 =?us-ascii?Q?E6FlFUDaM+wweK4Plt2jDSC+/Mo3AQeZgIEioE5Lyhl4tKqKLTIhOo5ogvNo?=
 =?us-ascii?Q?ll/PTD8lZzlnjQesLbClcfOPRSMbMbJWVLFgmZpOKAEBRupvh4jaQmkNPMdo?=
 =?us-ascii?Q?Y2CYO6WN58pao+tNlJVeFE3/L7pelf20kQQEdSAP?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7214d0aa-f4eb-45bd-3093-08ddcd9d9422
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2025 06:11:23.7465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hI3QlXwRgAYq9GhyyNtE3i0PB3/QSZ/sGlJhK8g/7MB3iEeH0lv25oOgAoT874zsaer9b8Cbfg9qOgn8nZxFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7515
X-Proofpoint-ORIG-GUID: FZeBcu2shWvSb-VN52w43yTixg4je1Uy
X-Proofpoint-GUID: FZeBcu2shWvSb-VN52w43yTixg4je1Uy
X-Authority-Analysis: v=2.4 cv=OYOYDgTY c=1 sm=1 tr=0 ts=68871491 cx=c_pps
 a=/wE8qVhL3yOOyAy5PcWrvQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=BCVRRYYnAAAA:8 a=rcHQxUATEmcyXpDv5zwA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=Yfo1nd69h7ycsZ8reatu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDA0NCBTYWx0ZWRfX4TzW0C1Q/jWl
 PNgb1r/OiLB8usPL3QpMC3I62/eiusf/0iC6TFWu7zx8LQl2Wfd+76LiJCj1DZVKDK8+Nw+JAz6
 aAEmiT0RqDsQxoLOZ/iFx3rpHJgojvGfiG2bE+dNFamvzhAZNZosQmz3UEvloDXoGwc67cSCq8i
 IJnxW7ODMW+NbF1duqkbVjsDg5dNrA4OBV++fGwa9/yWx7obQAwtqA52ogX8kJ/CQbiGHGNbQUI
 EMpkVSOZh+iN2TFwOoZx2L1VZc2AOoOvnUY3gpTfRXYgA/fMJk4bHh7eKIBsGzryNd1bwDNDGqE
 tL++ElNqgCbq8TLEXPajQvUDtRqnYRadcj9nOZByoFCH6xNEqeYPuQq6yRkLXf5JKRDsJQglv4N
 9Ae+uOR5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507210000 definitions=main-2507260059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Jul 2025 06:11:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220991

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2025-5278.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../coreutils/coreutils/CVE-2025-5278.patch   | 112 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_9.6.bb  |   1 +
 2 files changed, 113 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch

diff --git a/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
new file mode 100644
index 0000000000..41be1635b5
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/CVE-2025-5278.patch
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
diff --git a/meta/recipes-core/coreutils/coreutils_9.6.bb b/meta/recipes-core/coreutils/coreutils_9.6.bb
index b876a8fdd0..34c6246ed3 100644
--- a/meta/recipes-core/coreutils/coreutils_9.6.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.6.bb
@@ -19,6 +19,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://intermittent-testfailure.patch \
            file://0001-ls-fix-crash-with-context.patch \
            file://0001-cksum-port-to-32-bit-uint_fast32_t.patch \
+           file://CVE-2025-5278.patch \
            file://run-ptest \
            "
 SRC_URI[sha256sum] = "7a0124327b398fd9eb1a6abde583389821422c744ffa10734b24f557610d3283"
-- 
2.34.1


