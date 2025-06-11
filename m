Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D41C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 11:39:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.5546.1749641944157227825
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Jun 2025 04:39:04 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=8257d95e65=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B507Re013934
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 04:39:03 -0700
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2065.outbound.protection.outlook.com [40.107.237.65])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 474mxm4221-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 04:39:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vDdmnc9v5A2FYi0fEXNCAHXiEj7VRzhmIAcUmVfoUUOKTuEeNxBzRpnq3SErRSRAvTSHkuQ0zIhmu8+NzMLz1DUZOBWxLP7sbD3QyvP+W3RT44gZs2QPGR7Homd+fiZboW7xXwu3VAFQNfyhJlqaYkysJnjEZfFu7+R7QwYhWE5LHOqyGkcWyIr0VBrmymxtYKce6v0KixuMJ0g/yp/bZSp5NneR7ERN1MfAwbhF2veZbueoSFN1kaegyalbJTF8exgRy1wEmAHXz9hQR0HbXZRnYDQhAe4EbZobkz5oQtGmbEp4O6a1eMVxNoZnCwfZWyCviYqmW0ZFjxjNEeKuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=alYbNRws45uooU9saQTtufkPIwphLyG0Z9l+dIpdB/4=;
 b=S9CCjFqLHiC7lYQ2MRyIw0g2Az/DyePO0ccMZ1EAg8ILEt4CsdLHeVW668B/+0FIzvAFdmDAAoQXeF4Zj4O2HTobYT8g1MIVIkJXjLt4gOHRm75Fbn+iRJKHw4NIn4hmxl2QhRIOy18A2ua4dkzrJDVVL4vwsNwo6PMNpJ6/sNYe5qTI/UO6CoWzINa9ssDoAd7L0Qd7dMa83Jnt8IjsNpiFkS27fviYytHr4h4Vc/tHu0rFdu1TdAIIWF6lx2m96d5LGBPmWXNsNg93qb+YLVNG/sthIVr6PbfrlZqc4pCRGVUz5MgJKiZ41Am5y84usiIUJx//YZ8un3iicyU3kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DM6PR11MB4641.namprd11.prod.outlook.com (2603:10b6:5:2a9::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.20; Wed, 11 Jun 2025 11:39:00 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::9fa:eb3f:cf26:264d%4]) with mapi id 15.20.8835.018; Wed, 11 Jun 2025
 11:39:00 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: sunilkumar.dora@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [kirkstone][PATCH v2] Glibc: Fix for CVE-2025-4802
Date: Wed, 11 Jun 2025 04:38:34 -0700
Message-ID: <20250611113834.2168236-1-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0400.namprd13.prod.outlook.com
 (2603:10b6:208:2c2::15) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DM6PR11MB4641:EE_
X-MS-Office365-Filtering-Correlation-Id: c2831e1e-ffb7-4040-99d5-08dda8dc8f32
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?YUD+IJu2PATrDzEhzXw4niOYmQt9dHliYzzyKPW7E77lC/f7pPCKl1s1G2go?=
 =?us-ascii?Q?f01Moi3bAwYjvILV0vx58ePRG7ABFVCfK1UqEY2wRozVFavE/v7M1i7STUJ3?=
 =?us-ascii?Q?Qgh/KKwc4XBTI2OVKcNptsmgU/8sHqm4wFDcXDcLaa6kGp+gBJBAB22SWlWU?=
 =?us-ascii?Q?RpfBbKTr7kxgUkzeYrsovhfL8e3p2yWRr0XtSYrnw4nkLL2W6MsWQYV7jgXc?=
 =?us-ascii?Q?TrTqobXvCCZxk0erNAVnuUdyOe9zY36JU0jKgHGyEEX7cLvxYdLevAGt6D0N?=
 =?us-ascii?Q?bjwgQ4JhAxkoviuKqDpHjszCFHiR7kgFjQ1HKV9RofMPhvjTMpYMA2aoWjsu?=
 =?us-ascii?Q?tdv6+HOrmGus+comaV9YOsHu6n3bmNt+38AwXgMkEW2luRmL1alDTywAQjNy?=
 =?us-ascii?Q?4iCYuvo3U5KD/ykusJErwOdNaCDfJ7QJQFNcWCzpVlUoiHy5mxuxf7gM4hlf?=
 =?us-ascii?Q?swZFZc4N0T423VRLzZAhLSHxTF+d0uIdETmxiFARayoMDz3GSuGCrXEYFjwR?=
 =?us-ascii?Q?PHm6T8W2B+4ke8TahXE8yJnGii0e/MaGtnGylCCnOAgZ85Yw2hE6XMCutp7A?=
 =?us-ascii?Q?apUkXv8ldlx8U6vPuNIIz/TpGhwAcLA8qhIk7i8TF9xmrEPtvDFWA9gbQUfn?=
 =?us-ascii?Q?392lSXzN/l8VK4ykjWHYCVpEp0yu19L5eoy4xzYduOnAgQoWXVOpJn8i/eqo?=
 =?us-ascii?Q?7Xk8noEsUvV/5wjwuM/97U9RWHDNVthUC6ypoL2gUJXS9uhqO9W97SIo9JSy?=
 =?us-ascii?Q?DdLfww+lUapaqUBmDLlegICGMrM6uJDdAE86KRVhrf2JGg2P5i0ESG5LbtQ/?=
 =?us-ascii?Q?0xXsqZFVrsw29L2PXpv73TrE843Z+acOiHERqwIP8J85yF/kM9cfiEl94H4H?=
 =?us-ascii?Q?QxAOUsPHNrj9OU/fanDH0cDCvy8sQqumz9JS9CBBCRTCQ0mSzXydRyNHow9q?=
 =?us-ascii?Q?bp7r1igT3+OhKQkR0RN46uvnise9z+hf986dKe74fh39xzg9oK60RYxF30rC?=
 =?us-ascii?Q?tX1xovmqFghcip91UV6naRq16NNCjzB+klzuzMTQfXk8h9T69ynfj2VTohZI?=
 =?us-ascii?Q?FnZ4ml5eujYTYbofqhktzr6OUqdbdmwYuvETpmWfgg83t+JxFqe0RzdsVj+D?=
 =?us-ascii?Q?cR2NJfLkWf0Z6iL7jS97APpbOaCs/EYgsSv1SGCbWLnRn9tNmOVvF7HG4Urc?=
 =?us-ascii?Q?EDgjBBVLjjQbLP0vraxLeWvpa66apt6bih8RYhflOGdrQHssyiCOFSFBvGW3?=
 =?us-ascii?Q?sCdt7frM5wHyVyPzJbMgwn7V5tuBRLYz6+lStli3o6saoSqnUUjDkzSHRRFW?=
 =?us-ascii?Q?SQM2JNDMMLSLbze2Sil3dcGJRl4CqyZbVhH7acvp/kfdrpu9YiimaDug/TgH?=
 =?us-ascii?Q?IM5RUyxwsWg4kFpORv/srfZujQjy1dXZl3BMmkZ5vef/7H0+mW1/z+dfVsp7?=
 =?us-ascii?Q?XgvFql+PokWOnjOvzKWeIt3mwHlN/6NA?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?7BpbujBvPI7J43gQri8UNzTe5brRtk5MUqHqS1w5C1DyXwypdS4h0MMvaBAk?=
 =?us-ascii?Q?IntuAY5ez70/lyDdBCoRKbxFeYgaYXNs9eu2OCRV3hqWpajcMWvVeiSdKZkd?=
 =?us-ascii?Q?yG7a6dOT+r2tDmfxVS8B7G54y7XYHMyRNAxuOaLla5xqBFgLAeGwWP8NgxAe?=
 =?us-ascii?Q?n47e0Lz/aVUMNn3oXWCtU0SIq3UytjYyuzf33E6pmyPpFgVHFazYFsHCljCy?=
 =?us-ascii?Q?tXjZbN+NHw4WjeWyymeghbIXwqEESwn4J3aVlm0yhxRey3BZt9fAjguQAHX2?=
 =?us-ascii?Q?dh1df6zHy9HXmWHEs1N4kobMY1UKKnTQWXNLEYP6Q3GFpD/ubjfs5Zcy+IEf?=
 =?us-ascii?Q?Nv6fqWh2gXu63oqCrgP48HWUxDGpRXZuJwgFONLpUhYRq49c63ErW1vOmh4w?=
 =?us-ascii?Q?W7bgR1tDTSemXiUzmKtgfwwlYDWPbXDGzpc4kTUC0qJ8C8BJt7V3ZPcS0sSe?=
 =?us-ascii?Q?WvKtpuDxiXCCq6VudZydcRmYbekuKxokjjJPqtFx4zQQahOuYQBTXLET9r5J?=
 =?us-ascii?Q?SyDw5P8lVz2DJEgGKhnj3RR8PH19rUDRnJnrhAI4F4Ju+aHcRZ50evh4uf7d?=
 =?us-ascii?Q?AiTZMm151nIMmgrhdQlOyNYvwkyiVhRg4BylAbA/hmKKxvufV0HZ8emF5t9L?=
 =?us-ascii?Q?8g1C4rn0ZPJ6bubA5OseiellZETtgAGwBqRgjgT2YtRSS7IPNlD1t6rCUXgX?=
 =?us-ascii?Q?kDW6EAPEyIo9inJK9catt/IBPGVG2xB3k+fMKuvhJprfIJkL+rNYhl2KQMHp?=
 =?us-ascii?Q?jpsDHeO6JZrr8nZ/KQVsP4cb4k5De7UuVXVfMPTrDuwtShHR1CSdczIkHDe1?=
 =?us-ascii?Q?qyq22SOgvG6OZi4l8mOlEsmo6lIBRn0dXoiRQWl1rVzejpWTPUKJWYYuEX2y?=
 =?us-ascii?Q?Zt/+cV4XMWvsV8jUPiikCnWv/2rsN14n7VzLSYwwe1jjP981hiKuMO0TUDHw?=
 =?us-ascii?Q?uaarlhNZWRS3yPHKqR7rNEb2Dd0DP2deaXC+2U8/Cmj7jQMhLkzs91iCwRJY?=
 =?us-ascii?Q?Ud12OOLZAzknsqXUkiGKqfhfPeMF43c+EPJQHfRmddlH5bPIGmdDzBjkY1AN?=
 =?us-ascii?Q?prKvE73kSdHJm7TL8uKA47hF3ZhieJh0akPv7E2XMPcS9HLLi7UGe+6Ts0sT?=
 =?us-ascii?Q?Q2U5cZM04QZWMg35lLNxLkWruxleo12j3rzkTCj+UZNCEb+rXecCQwqBFuH/?=
 =?us-ascii?Q?SAQl2qR3llbgO3/G3b7RsTmfybE2HfEEtlr4TZ+U3C3Korftee/UseOm1obr?=
 =?us-ascii?Q?GDKvG3egx7L75G7L316Gp4YLzqNTrE6BG2lBWuIHUytjOfBPhPzbgpMo2b/3?=
 =?us-ascii?Q?EvH/f+I1i8fncHbsoMSSNLlCn0WLpWgziyE/GEpuRAR27NEbz99rDPShN0YY?=
 =?us-ascii?Q?1mWh0e5OdFNvm7tYOOy90tCcqela8PVQ6skfDo++zCpjwB4pNn+Ayfxdle1t?=
 =?us-ascii?Q?iRvN2/pgwW3/HAhdR6UQXkYsuCeM53b6fGWxamp3lR1BVTdGAda/Tgdq2Q4S?=
 =?us-ascii?Q?ZObu4+K1okKZyQ99u8sXNa5DrBJwZf/vsqM80SChp1I20yaCLs5+tlqta5Jt?=
 =?us-ascii?Q?8JqATt6dqnD6PZJRTC7PpOqQqECCssSjMSgmNe2Rjpg0NBs3Dy71R8Gq0H6T?=
 =?us-ascii?Q?YQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2831e1e-ffb7-4040-99d5-08dda8dc8f32
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 11:39:00.7094
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phD+NE0sO5JUWi20HlEBlcxgotaXABJBuBGU2i0DAM0RH2MQABv/g+YKm9cpjEzKu1OzGuv0RHh8s+Y2sniz59zPmqauwe0Ht/+HvxKA7FY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4641
X-Proofpoint-GUID: gzXg9oRynfW-r4JjD8kSGzBFDhlTxODv
X-Authority-Analysis: v=2.4 cv=L74dQ/T8 c=1 sm=1 tr=0 ts=68496ad7 cx=c_pps a=yRdPyDuw7Sx63jVS1OevmQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10 a=CCpqsmhAAAAA:8 a=mDV3o1hIAAAA:8 a=t7CeM3EgAAAA:8 a=KKAkSRfTAAAA:8 a=20KFwNOVAAAA:8 a=YV6vfrAavRWOqJXlchkA:9 a=ul9cdbp4aOFLsgKbc677:22 a=FdTzh2GWekK77mhwV6Dw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5OSBTYWx0ZWRfXwJ8VH1CpLZpw 1NTQ1ZXBoXufAtYIgfTvDuxOGHisJ7lmPyNtf72XiBC5mwEzOvc+58salBx5Ovmo5vcFoQie/e9 LmGSig+DAhX33pZvhNrAKOptkB1uNlYIHgdQXD//s/It1/2M0Q00d6YcIz/9Paffxsshx7Vg7T0
 6p94X6z1KFt4Mw3kMVbsvudA23FNElTb41weRisKZ7eOcSyrPeXLSxcg0NYQsXffNXZlHKi3iUd zJQx26fzPxXUDyOaolHoUOH8Hqh78AMa0ZSZ5bcAAe4G/LAAUpzhXlfikKPVsGpmq2nhLt8pMGR y6L1jF8GeQaJdowQgmZD+HJUZ0J8yQP3f/6o/Z5um3vbJot52l2UHrxGh4FE0MeIgRL0uVuSJwe
 N3Gww6GgrFHjR0kO8/oUcU0/xWnDhsOnpxnBnF1CIFhA96F0F0TqcdpAhNEBYJWN+0KC0JEY
X-Proofpoint-ORIG-GUID: gzXg9oRynfW-r4JjD8kSGzBFDhlTxODv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 adultscore=0 spamscore=0 suspectscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 phishscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2506110099
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 11 Jun 2025 11:39:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218450

From: Sunil Dora <sunilkumar.dora@windriver.com>

elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for static
[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]

Upstream-Status: Backport [ https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2 ]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
V2 - Resolved patchtest error for "CVE:" in commit message.

 .../glibc/glibc/0025-CVE-2025-4802.patch      | 249 ++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.35.bb         |   1 +
 2 files changed, 250 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch

diff --git a/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
new file mode 100644
index 0000000000..0298f5a865
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0025-CVE-2025-4802.patch
@@ -0,0 +1,249 @@
+From 32917e7ee972e7a01127a04454f12ef31dc312ed Mon Sep 17 00:00:00 2001
+From: Adhemerval Zanella <adhemerval.zanella@linaro.org>
+Date: Wed, 11 Jun 2025 03:19:10 -0700
+Subject: [PATCH] elf: Ignore LD_LIBRARY_PATH and debug env var for setuid for
+ static
+
+It mimics the ld.so behavior.
+Checked on x86_64-linux-gnu.
+
+[New Test Case]
+elf: Test case for bug 32976
+[https://sourceware.org/bugzilla/show_bug.cgi?id=32976]
+
+Check that LD_LIBRARY_PATH is ignored for AT_SECURE statically
+linked binaries, using support_capture_subprogram_self_sgid.
+
+Upstream-Status: Backport [https://sourceware.org/cgit/glibc/commit/?id=5451fa962cd0a90a0e2ec1d8910a559ace02bba0 &&
+                            https://sourceware.org/cgit/glibc/commit/?id=d8f7a79335b0d861c12c42aec94c04cd5bb181e2]
+
+CVE: CVE-2025-4802
+
+Co-authored-by: Florian Weimer <fweimer@redhat.com>
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ elf/Makefile              |   4 ++
+ elf/dl-support.c          |  46 ++++++++---------
+ elf/tst-dlopen-sgid-mod.c |   1 +
+ elf/tst-dlopen-sgid.c     | 104 ++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 132 insertions(+), 23 deletions(-)
+ create mode 100644 elf/tst-dlopen-sgid-mod.c
+ create mode 100644 elf/tst-dlopen-sgid.c
+
+diff --git a/elf/Makefile b/elf/Makefile
+index 61c41ea6..3ad66ab6 100644
+--- a/elf/Makefile
++++ b/elf/Makefile
+@@ -274,6 +274,7 @@ tests-static-normal := \
+   tst-array1-static \
+   tst-array5-static \
+   tst-dl-iter-static \
++  tst-dlopen-sgid \
+   tst-dst-static \
+   tst-env-setuid \
+   tst-env-setuid-tunables \
+@@ -807,6 +808,7 @@ modules-names = \
+   tst-dlmopen-gethostbyname-mod \
+   tst-dlmopen-twice-mod1 \
+   tst-dlmopen-twice-mod2 \
++  tst-dlopen-sgid-mod \
+   tst-dlopenfaillinkmod \
+   tst-dlopenfailmod1 \
+   tst-dlopenfailmod2 \
+@@ -2913,3 +2915,5 @@ $(objpfx)tst-recursive-tls.out: \
+     0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15)
+ $(objpfx)tst-recursive-tlsmod%.os: tst-recursive-tlsmodN.c
+ 	$(compile-command.c) -DVAR=thread_$* -DFUNC=get_threadvar_$*
++
++$(objpfx)tst-dlopen-sgid.out: $(objpfx)tst-dlopen-sgid-mod.so
+diff --git a/elf/dl-support.c b/elf/dl-support.c
+index 09079c12..c2baed69 100644
+--- a/elf/dl-support.c
++++ b/elf/dl-support.c
+@@ -272,8 +272,6 @@ _dl_non_dynamic_init (void)
+   _dl_main_map.l_phdr = GL(dl_phdr);
+   _dl_main_map.l_phnum = GL(dl_phnum);
+ 
+-  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
+-
+   /* Set up the data structures for the system-supplied DSO early,
+      so they can influence _dl_init_paths.  */
+   setup_vdso (NULL, NULL);
+@@ -281,27 +279,6 @@ _dl_non_dynamic_init (void)
+   /* With vDSO setup we can initialize the function pointers.  */
+   setup_vdso_pointers ();
+ 
+-  /* Initialize the data structures for the search paths for shared
+-     objects.  */
+-  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
+-		  /* No glibc-hwcaps selection support in statically
+-		     linked binaries.  */
+-		  NULL, NULL);
+-
+-  /* Remember the last search directory added at startup.  */
+-  _dl_init_all_dirs = GL(dl_all_dirs);
+-
+-  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
+-
+-  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
+-
+-  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
+-
+-  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
+-  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
+-    _dl_profile_output
+-      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
+-
+   if (__libc_enable_secure)
+     {
+       static const char unsecure_envvars[] =
+@@ -324,6 +301,29 @@ _dl_non_dynamic_init (void)
+ #endif
+     }
+ 
++  _dl_verbose = *(getenv ("LD_WARN") ?: "") == '\0' ? 0 : 1;
++
++  /* Initialize the data structures for the search paths for shared
++     objects.  */
++  _dl_init_paths (getenv ("LD_LIBRARY_PATH"), "LD_LIBRARY_PATH",
++		  /* No glibc-hwcaps selection support in statically
++		     linked binaries.  */
++		  NULL, NULL);
++
++  /* Remember the last search directory added at startup.  */
++  _dl_init_all_dirs = GL(dl_all_dirs);
++
++  _dl_lazy = *(getenv ("LD_BIND_NOW") ?: "") == '\0';
++
++  _dl_bind_not = *(getenv ("LD_BIND_NOT") ?: "") != '\0';
++
++  _dl_dynamic_weak = *(getenv ("LD_DYNAMIC_WEAK") ?: "") == '\0';
++
++  _dl_profile_output = getenv ("LD_PROFILE_OUTPUT");
++  if (_dl_profile_output == NULL || _dl_profile_output[0] == '\0')
++    _dl_profile_output
++      = &"/var/tmp\0/var/profile"[__libc_enable_secure ? 9 : 0];
++
+ #ifdef DL_PLATFORM_INIT
+   DL_PLATFORM_INIT;
+ #endif
+diff --git a/elf/tst-dlopen-sgid-mod.c b/elf/tst-dlopen-sgid-mod.c
+new file mode 100644
+index 00000000..5eb79eef
+--- /dev/null
++++ b/elf/tst-dlopen-sgid-mod.c
+@@ -0,0 +1 @@
++/* Opening this object should not succeed.  */
+diff --git a/elf/tst-dlopen-sgid.c b/elf/tst-dlopen-sgid.c
+new file mode 100644
+index 00000000..47829a40
+--- /dev/null
++++ b/elf/tst-dlopen-sgid.c
+@@ -0,0 +1,104 @@
++/* Test case for ignored LD_LIBRARY_PATH in static startug (bug 32976).
++   Copyright (C) 2025 Free Software Foundation, Inc.
++   This file is part of the GNU C Library.
++
++   The GNU C Library is free software; you can redistribute it and/or
++   modify it under the terms of the GNU Lesser General Public
++   License as published by the Free Software Foundation; either
++   version 2.1 of the License, or (at your option) any later version.
++
++   The GNU C Library is distributed in the hope that it will be useful,
++   but WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   Lesser General Public License for more details.
++
++   You should have received a copy of the GNU Lesser General Public
++   License along with the GNU C Library; if not, see
++   <https://www.gnu.org/licenses/>.  */
++
++#include <dlfcn.h>
++#include <gnu/lib-names.h>
++#include <stddef.h>
++#include <stdint.h>
++#include <stdlib.h>
++#include <string.h>
++#include <support/capture_subprocess.h>
++#include <support/check.h>
++#include <support/support.h>
++#include <support/temp_file.h>
++#include <unistd.h>
++
++/* This is the name of our test object.  Use a custom module for
++   testing, so that this object does not get picked up from the system
++   path.  */
++static const char dso_name[] = "tst-dlopen-sgid-mod.so";
++
++/* Used to mark the recursive invocation.  */
++static const char magic_argument[] = "run-actual-test";
++
++static int
++do_test (void)
++{
++/* Pathname of the directory that receives the shared objects this
++   test attempts to load.  */
++  char *libdir = support_create_temp_directory ("tst-dlopen-sgid-");
++
++  /* This is supposed to be ignored and stripped.  */
++  TEST_COMPARE (setenv ("LD_LIBRARY_PATH", libdir, 1), 0);
++
++  /* Copy of libc.so.6.  */
++  {
++    char *from = xasprintf ("%s/%s", support_objdir_root, LIBC_SO);
++    char *to = xasprintf ("%s/%s", libdir, LIBC_SO);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  /* Copy of the test object.   */
++  {
++    char *from = xasprintf ("%s/elf/%s", support_objdir_root, dso_name);
++    char *to = xasprintf ("%s/%s", libdir, dso_name);
++    add_temp_file (to);
++    support_copy_file (from, to);
++    free (to);
++    free (from);
++  }
++
++  TEST_COMPARE (support_capture_subprogram_self_sgid (magic_argument), 0);
++
++  free (libdir);
++
++  return 0;
++}
++
++static void
++alternative_main (int argc, char **argv)
++{
++  if (argc == 2 && strcmp (argv[1], magic_argument) == 0)
++    {
++      if (getgid () == getegid ())
++        /* This can happen if the file system is mounted nosuid.  */
++        FAIL_UNSUPPORTED ("SGID failed: GID and EGID match (%jd)\n",
++                          (intmax_t) getgid ());
++
++      /* Should be removed due to SGID.  */
++      TEST_COMPARE_STRING (getenv ("LD_LIBRARY_PATH"), NULL);
++
++      TEST_VERIFY (dlopen (dso_name, RTLD_NOW) == NULL);
++      {
++        const char *message = dlerror ();
++        TEST_COMPARE_STRING (message,
++                             "tst-dlopen-sgid-mod.so:"
++                             " cannot open shared object file:"
++                             " No such file or directory");
++      }
++
++      support_record_failure_barrier ();
++      exit (EXIT_SUCCESS);
++    }
++}
++
++#define PREPARE alternative_main
++#include <support/test-driver.c>
+-- 
+2.49.0
+
diff --git a/meta/recipes-core/glibc/glibc_2.35.bb b/meta/recipes-core/glibc/glibc_2.35.bb
index 9073e04537..1ea4d5a252 100644
--- a/meta/recipes-core/glibc/glibc_2.35.bb
+++ b/meta/recipes-core/glibc/glibc_2.35.bb
@@ -61,6 +61,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-sysdeps-gnu-configure.ac-Set-libc_cv_rootsbindir-onl.patch \
            file://0023-timezone-Make-shell-interpreter-overridable-in-tzsel.patch \
            file://0024-fix-create-thread-failed-in-unprivileged-process-BZ-.patch \
+           file://0025-CVE-2025-4802.patch \
            \
            file://0001-Revert-Linux-Implement-a-useful-version-of-_startup_.patch \
            file://0002-get_nscd_addresses-Fix-subscript-typos-BZ-29605.patch \
-- 
2.49.0


