Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54EECA0EDC
	for <webhook@archiver.kernel.org>; Wed, 13 Aug 2025 02:53:48 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.91949.1755053622820324752
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Aug 2025 19:53:43 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=0320c6fca9=qi.chen@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57D1G2jh2355457
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:53:42 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48ggw0r1sm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:53:41 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bxSilCHhauOexJ6CyBg4R4Ac1Ds9/DYCee7NldA3OePQUEBzM2zOM6xOJ8XTDECPgMR9I2/GGGM8VZbVulI1qIq6IZ0I7/bZkJQAyFVowoTY6PhWv0T82ThtPgOpDrRGGi1UFFshI5dN7WV7eAOtilF8an49QAEiFCATC85CgYHKo8nQoJ/BXfA+ExsWqzAW/Dww/IXSJx5ZUCsuEZOhI1rhJD3dglnAasNTKPc5+TdejbMOrSyboQYf/6Yd2jezUB+JoxjilVx5PEKAKecbUJMR27iFnyNO4Bqxj5t/oadgYvMzYUQ930ujbpyaLL3JPiTVswVF0uaQWFNzL63aCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9Ywr6HkLrrnhcLNE7dth41tYpMyd4BbEV2Wj0TqjYw=;
 b=zBmPxjHLI6lBTgLbbKWuEJOmGKvYu9b1ndkmXV+o82WI9U/oziTv2+ZLA3cVtDVKVkZ6JzOBGD+CshPS8DSCpIyKHp6h12VKrM8HgcHGvVshxsjrhvgWQJTXpouWa+Z8zzSH91a8W48pSO8cJKmwwa97EccQc3T4GlHtHZRSfGUOQzYsaMQpbwngea9uRMDzloyd0rRpusQfVOosIhtkbOXE9hKVuMlQRarp6X+IjzdrrxJ21MLU9jos7QjQNPlSINn5bzJgwEXSRVfxMH6wstcXwimFMEafPnhjIX8JMT+Z1eVHePdgedjtJ1vDDosFcMEd6yPiv2IRXIw9U8M+mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by SJ5PPFF8B526086.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::862) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Wed, 13 Aug
 2025 02:53:38 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::a7e3:721d:9cec:6093%6]) with mapi id 15.20.9009.018; Wed, 13 Aug 2025
 02:53:38 +0000
From: Qi.Chen@windriver.com
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] util-linux/util-linux-libuuid: upgrade from 2.41 to 2.41.1
Date: Wed, 13 Aug 2025 10:53:22 +0800
Message-Id: <20250813025322.3701681-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYAPR01CA0084.jpnprd01.prod.outlook.com
 (2603:1096:404:2c::24) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|SJ5PPFF8B526086:EE_
X-MS-Office365-Filtering-Correlation-Id: 5779d942-8dbf-4dfe-2aea-08ddda149a37
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?QkNuAPaaWh2V88C6m5lVkNByGGtf04Fw6qZriXPnTU4AxucB/DVoD73uXBP8?=
 =?us-ascii?Q?mq0RXWyTIBq3vRV/e2BWseYFEDDkBZCs5W/SlVf51Lz/dt7uIBNzSTX+2bqu?=
 =?us-ascii?Q?iE7XsXZiRC83p7xYXjwIaToQOpsujMKHuCOFhXpFssS+E7VG0DhLTK7ShhrL?=
 =?us-ascii?Q?hAZHBvUX3/bBEvN0u+EfNgck+Rs0j6EGm9v4VgxNklw4HGLR6vOckM0kAApG?=
 =?us-ascii?Q?NzwoNrlazUWlnkfK7RtGC8IjTQjpaGjDOpVXhaeaTRy2LV2fEwF1vMPQG733?=
 =?us-ascii?Q?eFvKAM5pIOL8kPfP2VzcYh6Z0wW1P9pN6zzV+0MKkGyrJFazb0sUHxJs2qU9?=
 =?us-ascii?Q?X5vRKbnU71q26LwTLNHCrr6tC33olAPNemgHJO8tbMMYDh0HVYamKZA/pBAE?=
 =?us-ascii?Q?1glhxbb/jOdpNzGIwaoCoPp+PazbMfu6qz7rpYzO8qA7zk/TW18Hlat1QrCS?=
 =?us-ascii?Q?N3sJJ9DfWeVMZgkVpLWlfLa6eETHmt1m1bLsLtS8i+d/WYV7LuAfIp+1sMNC?=
 =?us-ascii?Q?NaluVM1KMwkx5cqt2BoJh7Yk1+9BK3cmNtBkmPFM3n4g12aNUE+kbCJOlIsP?=
 =?us-ascii?Q?qFTV6tuXZLkDOLt4ty0UtIndkV6kp5UTA36MXqHdW2PFTFiuPeNMQ3Io7OHU?=
 =?us-ascii?Q?+9D+tlvfQP2t6PZRaRieWFJ9Dxr+jcJTR9pvl1PEIBdToqDFH1InMqZ3IC+x?=
 =?us-ascii?Q?N4miifUhQ9f1uireMMN7Om16Er336hNiXIzUGYK62avWDa/iXdY0illgRDxi?=
 =?us-ascii?Q?BiDubKEiS83T55lPW0Aj1Isg+ARY9XonPG2yuolvSAzOfHhen9l3WJAwDnf4?=
 =?us-ascii?Q?J1Kay9TSjBPGKpfIQgKqbBAkWut5ENvqAtGGLyMOLgCPnKYnHY/Ody0l8KBY?=
 =?us-ascii?Q?rFWeJbDCOOziF74pFtx+i9GuL57aUo33zL0j4s4ug2L8TWsHZt4wVLA4950t?=
 =?us-ascii?Q?VG9l/uEeoae/eHz74gqmOaRWXOSIpCC2wQuZ3TpakQ963FeTuMOuPimf2zy2?=
 =?us-ascii?Q?JRnRap9KR2g0aafSUjiC1cL1CS8toaWsz6GnjD9rY/qjvU6CcnDCac2S6NDj?=
 =?us-ascii?Q?CvmaV5Y9lOWENSjUHS8sNV3lvZmVBAotCrtq+Po7qrraMuinZr8Jf5pGQz8A?=
 =?us-ascii?Q?dgi5rsiOcdML2+5orAbs8LLC6/vro9JJ46gYkHfG5EaaWSLte9h1KB9juYkv?=
 =?us-ascii?Q?fBNvHTpeGcPKVwHdHxbKtpZMKnM0lPoxe0y4DbyysF/+kgv7b6TvGemjlTuS?=
 =?us-ascii?Q?xkDzAgk06cW/H7e+VFJso++BtOrmCig12eUytURM6VdhtW7xaSITh9fWqgoi?=
 =?us-ascii?Q?ZLgVADxTWrgkZO1+DmM6vgT4raW4AJKyD90/7oF7OKHqrtCAtfUyvj/0tuOJ?=
 =?us-ascii?Q?0TpkrZvaDDz9jM86l9HQFRxIbW+/onfe7u0amjgj65gYER/VTl/aGU0z5DBa?=
 =?us-ascii?Q?O/5lx3LjOp5ufGROhc0mndF+zqGByTCVts6GYuNohbImyVa0CxJsNw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IALDMuTtSyO1nncHMDGXWP4zCPOGpyvxBh5BemEeGKQSIKEDPddp5iLpvT08?=
 =?us-ascii?Q?GXjOAmbVrYDUSaZFPwRYGjvpbrN3I9Pfbdq3LeEQpkDtYwSA3jYZRcjln1ic?=
 =?us-ascii?Q?RD2mP2lKv3dv2p+ZqpNw5l4d98KoaZJ/KRNVZ+JV8f7y7saXUyTSAELpnJJp?=
 =?us-ascii?Q?ZJ1NlFvvyivXkSiOS1IB3kGbNSvmA0Nux2yGBH6wMgnkumyGGh/1VoNqWZdg?=
 =?us-ascii?Q?rWXJqlfj3Ksd5xkzVfq7wzXrE7+0UWg+mS88hcz+4VzVNmEVcU66zY3JUjIo?=
 =?us-ascii?Q?IzdiUXzs9jxiynqCuayK6HUu6MZ9rvuvmWGbtkoXWr72zUJIPCMss2kI21ju?=
 =?us-ascii?Q?z7jMb6wFyoRnyMWMQvdKWC+30nTlwRYOYlBJjid8icQRyV1suRoO4lsrWzlY?=
 =?us-ascii?Q?42TqVgow7pNzp9NSvYZrKPo9ips5U82UaFGjQiaOrJ+ydAw3BzsI1ht/XHd6?=
 =?us-ascii?Q?GgNKc6BQtV1BtY2NrZHh04l0ZahaMWlIFjCvrm5HOQHS87axXDvOWDNJOpTI?=
 =?us-ascii?Q?873IjgQSJHewRuPAG+4AZVM81H0dD624Coz6xH4WKtaKVI9eRVlRrXAzSvFQ?=
 =?us-ascii?Q?Vo46/cSJmNSlnPWR7GsdDMDfqeJ22CAtPSZYoXNGSO2OfvWBlScFbtJpR37c?=
 =?us-ascii?Q?Wb9bSIT9j5273+W9PFCkhjmOBpDP81/dp4aIjJykrsutjL24gRPFuVtSUOiO?=
 =?us-ascii?Q?j6vzhze3jQ1mENnE/xOcEvIqivLGt9WL9fIsGAdDthSQ7CQOT/7vdVLkcHuh?=
 =?us-ascii?Q?5kFDpq0mskP/VXCdHzNukLW5mK5PJPCieeALkdEp7ykQV4NbnJycPR71EuJX?=
 =?us-ascii?Q?9E/q16MsnzuoHBNjo04Li1DFvuZxrs/6BCa3GsTuCqzdkm1S02QRAyEDyf26?=
 =?us-ascii?Q?gMKhDw2jihRsA8acxZzjsCdXPLE527QztNBbFMUig+3u5+PPASoLERep6tYV?=
 =?us-ascii?Q?FV23bucaCGv0gfjikddWyk9jZQTlkV/OBbmroWvtnpGJWt0PJGEYkVT4g3HO?=
 =?us-ascii?Q?XmQmjp/pKRFvG6vIFTDhOlSVmXlyz9vuU+52ZlGpBAQjRsKQFC/0oS/6PbKv?=
 =?us-ascii?Q?zkL5YWOWPUBLzJ2K7sVS5lqw8cvd/yMKRx7i44XTW+hIOL6R10NEqUKiKcgi?=
 =?us-ascii?Q?TSDOhVoqZxEiBV2+JkFfHe5i/I4nYBL0lVriPW9k9CFxH2fo5BNDqiSa0xWw?=
 =?us-ascii?Q?9XsRLjefVMCw38CU2zzbt4TszEb/uocLTRCzctcUTP5s5KYimOAK8ZLSBC8l?=
 =?us-ascii?Q?JkJXcoKbbo2ry4LzIotlwYT7/ThCRpXFKU12PnzU9Le7j2DjsNizci3kWp66?=
 =?us-ascii?Q?CFYjoQ8cFJgRbFoHf/RHUZyYrhjKet5bI6/NN0GCK1oV83y6O6HalcwMXhuH?=
 =?us-ascii?Q?4V0SuX9b9L3IZ4Rfgtq+Kea4tNA69vNkpy09+AeTiFw5xJdurUbWVtEQLdeD?=
 =?us-ascii?Q?/FRFVRHOqe2sFBQGjLObmbbwqxvbMzXbZZ+NrwUD3vhRtHM+jusu4N5gkQLu?=
 =?us-ascii?Q?AJgJm73z16TTSK1O8u7drHAuAfuHY4AOLC2acO8JNOs41qkXKk+YgD1wGzfY?=
 =?us-ascii?Q?DDlcSujqkgfLVe8/PUhdEMY2ulCaUqI8UKDrQaOX?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5779d942-8dbf-4dfe-2aea-08ddda149a37
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2025 02:53:37.9957
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ZnjtXqbvNG5T6GBHAvLUoje2hczvPb4nvTnGqCOcuxbTa5zes/ZWH/tDlBarG92JssTuea4cyB7Pq9Ce2Mgmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFF8B526086
X-Proofpoint-GUID: thSSFQK-6TCVgzA-GIYf7wSStfSGZmPb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEzMDAyNyBTYWx0ZWRfX2gvO7IfWfjRy
 u58shN2VzI1XhnLeV4iUiIZzrzlpPM69ewc8Z+xAU1taHxa9aTm8UtAlvU9BZZM0v/B9cFiCick
 8O4Nt8trZ6ek4JFMIkuQuzkcb/K7Hw1KD0MUJWWfgQa3HsYnfX5KFxBZWn8i7fqBV63ablNtjbX
 It2bg7yMQQqqdV5bb3ECExS/OgIMtySfoZ36iaXGDf9jX1UzkBMwx1YwJwyy0fGVy/dAdI7ZZzx
 f9xdsoShIhwPOX1uXXaktzV06b2wEcfQftr/lqo3tV+mx6jLNMdXpaRhfahw8p57oV+yEH6QC3I
 q4KnfmGX65ozC2tD4/3l2+XOZAQnKz+I/yRrYxOzLdvbIpUDwAh6ZmOvjUqYKs=
X-Authority-Analysis: v=2.4 cv=fN453Yae c=1 sm=1 tr=0 ts=689bfe35 cx=c_pps
 a=bs151/dfgynEF4VOmA9JGA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=LThvAZawUhurhuVFNCIA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: thSSFQK-6TCVgzA-GIYf7wSStfSGZmPb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 spamscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 13 Aug 2025 02:53:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221785

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade util-linux and util-linux-libuuid from 2.41 to 2.41.1.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...{util-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} | 0
 meta/recipes-core/util-linux/util-linux.inc                     | 2 +-
 .../util-linux/{util-linux_2.41.bb => util-linux_2.41.1.bb}     | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-core/util-linux/{util-linux-libuuid_2.41.bb => util-linux-libuuid_2.41.1.bb} (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.41.bb => util-linux_2.41.1.bb} (100%)

diff --git a/meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb b/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux-libuuid_2.41.bb
rename to meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb
diff --git a/meta/recipes-core/util-linux/util-linux.inc b/meta/recipes-core/util-linux/util-linux.inc
index 7d6759a2c0..c5698d9cab 100644
--- a/meta/recipes-core/util-linux/util-linux.inc
+++ b/meta/recipes-core/util-linux/util-linux.inc
@@ -23,6 +23,6 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/utils/util-linux/v${MAJOR_VERSION}/util-lin
            file://0001-tests-helpers-test_sigstate.c-explicitly-reset-SIGIN.patch \
            "
 
-SRC_URI[sha256sum] = "81ee93b3cfdfeb7d7c4090cedeba1d7bbce9141fd0b501b686b3fe475ddca4c6"
+SRC_URI[sha256sum] = "be9ad9a276f4305ab7dd2f5225c8be1ff54352f565ff4dede9628c1aaa7dec57"
 
 CVE_PRODUCT = "util-linux"
diff --git a/meta/recipes-core/util-linux/util-linux_2.41.bb b/meta/recipes-core/util-linux/util-linux_2.41.1.bb
similarity index 100%
rename from meta/recipes-core/util-linux/util-linux_2.41.bb
rename to meta/recipes-core/util-linux/util-linux_2.41.1.bb
-- 
2.34.1


