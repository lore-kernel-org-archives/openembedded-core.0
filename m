Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84820C54756
	for <webhook@archiver.kernel.org>; Thu, 22 May 2025 08:15:48 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19253.1747901741447432563
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 May 2025 01:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7237718411=yi.zhao@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54M6o2bB008750
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:41 -0700
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2047.outbound.protection.outlook.com [104.47.70.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46rwfsa9v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 01:15:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hHQoBL1mW1GD25mSK7j6pVj2tZ3XqjrLXU4c3gQa93CSSozOUw31Ky2dw6wxam2qwl7sx9xqDEQE1yKevw2D/zg77dcO8MUc8Hk3/z0jhqjr49fPi4BBAz54q6ky5lEDvdaevUbqkrxrKGsW/oLIeFY+Did5rlzQBY92REOkUPaVOym6dvmlKndQHIDyopcLg287z/SiRlk/uLe8Z4OlHCgpvPuqmbMtI4fdPNCATlThLZYTk97Spq8XtQpdENJaGDSDepumaS61Orxka/CtAbeZtMm16BVP1PYIeUpz+l5JZrERcJBbnC5Gd2FC6g9b8uhpWY0oI31LVIlDTTSYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4nVDxwuBnnJ21rp2T+ApfeSIDSIekcpgKkOHpJ+cnc=;
 b=JdCVfuTlqgStOl8B/lmyggPI0AgI89g/gms4RhzvpmC6AiKYBqV1e06jd57NlgA07BpjOQwPxiYkWELog1ez/28S97mfWnCEEkf+gs46uupmlkujX2a/6uWBsTf6ZVLSDv/m+iKCVCot2y5EdQbp96DedLt9ehG6M3u1BaycHBRAEKOe7aX/gPw5Ihb5aRLgRFFM8tNy7BU1pKQ70yqIm3uGQjwL3r5mCubOysZQeRoKvYZaoHqvrz4OHqpGmhzBhwW0KV6LBrin87ZzhDvit8GIDVJ55ZYtiwd2gP2QwjkH8pBnxZl8lM9Nv8f2RG6edzkIwVn4Q2H6RlGUvNVo9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 DS4PPF2720D4410.namprd11.prod.outlook.com (2603:10b6:f:fc02::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.20; Thu, 22 May
 2025 08:15:37 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%4]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 08:15:37 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4 v2] libcap: upgrade 2.75 -> 2.76
Date: Thu, 22 May 2025 16:15:10 +0800
Message-ID: <20250522081514.552836-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.48.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|DS4PPF2720D4410:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e52d5ba-8bf0-4c03-7acb-08dd9908d541
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?6zZdLuOFGKfAJQDvQSyMKkaSYPOSfsMcHXzmiPgk+0sNqI/5fl6CfmQPIzsY?=
 =?us-ascii?Q?Dzifr95zEofQOUNfoqANgxcd+6h7XSXDk4ATOG93sTB7Rk4zwXtAv/0vWkS5?=
 =?us-ascii?Q?HWKX+lRCZ/diuwBZ9I2xqQ4QjYRrQsfDQG7ne8Ie+eD6HUWrBWh+XhP474SW?=
 =?us-ascii?Q?ZsLi7rjOfN5gvfHg1MNshV9vViHIAeQQ9lQF4zysTG+HpsJf3Q5IZ2SKmNke?=
 =?us-ascii?Q?iAmgmbeV51Wc2f/sAzZCw5QwWUHszZit6oxPz9IiDyrAh3w3kFJrp9R/CrRn?=
 =?us-ascii?Q?nWsVBTSc+TX7AGTy1EtKSxceLZe0OfwNA11vvaGI/Fth3XHjUeooxwMAdW35?=
 =?us-ascii?Q?VgXzteklSh20z2iy5No6AU1uY/7ldRFsSUTvm0s5g5MFCEk2H3cZGr/oLeZK?=
 =?us-ascii?Q?iuLKB3tPamQgU9WjWbaWNoy40hOJD3uIv0mIUS7PnBMGcW1v3or9dWo960/k?=
 =?us-ascii?Q?+ozOKNiFcoLVAo9ripssLucspzuUqfzoR6Zhxu9ez747KvJPBkiBdolLufYZ?=
 =?us-ascii?Q?1QIRtH5eRRR0yDh+8YuEeKgpzGBYLVNDzaXDHrZTf927+iBxCmxnJvKQA26n?=
 =?us-ascii?Q?6Vjb8Q7w1s+idAFwPPwR63I5FT8H1e8tNa6h601U69J9cCtjUByjAOKQx7vC?=
 =?us-ascii?Q?4nX0hZh7abBJLeYeD9/T7pw6Aihyj21oDEiLB2Y+10EraNW5zNBaRe61oq2I?=
 =?us-ascii?Q?HHWXTLskheHhnnERM79U7BQ4JmD9xdFiLDt4eUySXxDCmssLWxQvY5Ab+TRj?=
 =?us-ascii?Q?wTlefgrc4EObyCAav7iIo9WkWMEObshkfMcWj4kizpFSeLunwRS7M/jM4ZGx?=
 =?us-ascii?Q?H/625UQz/c4zrasToKdCfWfzyq80oq1Fmvg32xCImMrQJovDPl9zZlVLsmIA?=
 =?us-ascii?Q?3clH2yaZeJAYAy6CAIvw5WjqkQC1ImtD/sdW5HYA2bTe6w5LQpJy3LuqjlIj?=
 =?us-ascii?Q?PpUXMd6A7L+07UHFAYxWtIQ4wP1JMh8fKq8oDT4kUoMcaZocwylLqaN9VzlU?=
 =?us-ascii?Q?IqT43Ib7KmNkeiVX8/Fgp6SjRirpHt0YMRjs/NQKPNc8XG29oeHgDA7z0DDU?=
 =?us-ascii?Q?GAWMehyQ3Pi7wbwkerRJG2yXLGuN2erWyGWYr8rTThIyVtVyzziOY/y7L0hw?=
 =?us-ascii?Q?yOs1jZDJYuFHoLmBEAYbgRFa76E67nHQ+yHaDLbBGBy2UXIlmpEhzThfP+ne?=
 =?us-ascii?Q?Nz4igTvph/bthACAMCHWAhE9Gu0f7t2MwKXLIcKaUDFnMiILwXpz3mjB7S5Y?=
 =?us-ascii?Q?RxVc3ptfvk/9coQJk1GmSIfRQSE9MjsGpIeiWcFiRoT9ooURvIXOEwID8b/6?=
 =?us-ascii?Q?GDokqFCo01MqI2g65lgeFpOfI5O4+ObYcTztv8r+9C3vwMrf6J+COJm6GNXw?=
 =?us-ascii?Q?wc2X9vMVtVWVAlrd8QiU+aj8drrwSFK1ffatjd/FqvXVkPtaKHOCcZR1+Fp+?=
 =?us-ascii?Q?2G3mD6vM5AK1rYt6aG29XjvhntBuTkRR?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?4FAO4C41WyWJza2jUXGRohps/OWbZNjZlgxhzqULroXnt8sx2JeexyV0GBX9?=
 =?us-ascii?Q?OYEbdDilgQdS61Axz/eQmYU5JOt9xV4PO70NnqzT6cjPy87znIdcPOPSPG82?=
 =?us-ascii?Q?n4kpXah6LvvdtNH9Xcw+2UDSWCrUAmwRSEgZvqpDPUX4iR4QJE7Qn7YKZb7V?=
 =?us-ascii?Q?CrFDnU2jpsIyONj8vLq7KD3wI6dxay71qxujc2/acD0MF7oU98crxthMh5ki?=
 =?us-ascii?Q?Owd4WN2ulaxSlgqVNMrs5PRbHgrdZbsij2UsolflJTXAO/ZgSz7zDU52AxpD?=
 =?us-ascii?Q?MdazG7GWp2C3xPFHofmVOIxVeyZDWpgHdIozK/2R9VlcNIL8t49L72ypE+rk?=
 =?us-ascii?Q?Ot8Uav4cB0+wR9UesOasMd4apL2kBz+CqizgL9Lcsf785rWEMo84UlfXpLsj?=
 =?us-ascii?Q?kus2no9Kei02Kc3UGR6Ko5BNbsLRplzRG2A4C6tJYZS//Q3+kQfY190cSUYQ?=
 =?us-ascii?Q?Zf3VswIWaP86lYUfq16Mnq0VnWeGCVt6R3XgCOVJHqYe9DdKS1s7RrlJ8njV?=
 =?us-ascii?Q?Q6AeOjAuVw1A1c8EV02jAXF2/umviiiyd8cYX2IVwGuRetltvhLPZL4oqvMi?=
 =?us-ascii?Q?tCjNmc6+aMolEp01f9Emv1S3BBQCy1gZQnHND8TjsL4q93l7PCBEcJXmcEH7?=
 =?us-ascii?Q?wf3SBZsv+43Lp8tVnU1opRJdELuQNrUbx7d4MAZGFfGE49ixBIVlCuTDEjbU?=
 =?us-ascii?Q?69QDTDNsCXrKGLP2g0Y5Gy8FDthmJ/2y1MXhwVSV4ADbgbn+J6itGdAL39Dw?=
 =?us-ascii?Q?850V8P0iFVqbagiqk1EfAc5B1FXz6nR571aXz8dScabkuXStpMUXLVKMkLRP?=
 =?us-ascii?Q?9CA2Tew7iMKJpfylCAD5S5HtQCdrzFItpHfC7/7x3uVRUhrLhZPyr/VHsC8v?=
 =?us-ascii?Q?kwnMOxcl0wwFkeAPtdJtgzaBkpHNl1G3WD7yp6BskC8ONRJT2kT8LXtq1pZn?=
 =?us-ascii?Q?BaXBRqxHb3Kp2xjRytsn5RCzTSU7TPQ7j0gGlqjDABa1oXBrbt3k+1i4plC1?=
 =?us-ascii?Q?5zlnAshHWzNGL38duT2v5j3DTHtim/oJA1JTiQXbj26iL0+HRkpWGfeI2FZu?=
 =?us-ascii?Q?XeUBwuQ+m67gcp8TWf3MA0/gKdpXfZIzk7BgkzPfuGJhfpWg+KL2qJLnn5gY?=
 =?us-ascii?Q?Thz5Q//jF/luHzZtHDw5toh5nK4XmcoXUW2fV/MxHEtXzyVeHDHT1zaN1og5?=
 =?us-ascii?Q?e1YDNVrRicfYsfne2ZFhKvN1Hq3lzGPVps1kxgDL0yHM776nrBsYaFlfd3Js?=
 =?us-ascii?Q?qQmeH0JCtg8qdXczOVwFSsPxDBjRF7xFWcm0XMcFvKgUFFh7xtKnTESalU7U?=
 =?us-ascii?Q?kKMwOMJ6ygN0u1dJfc/k6SXoRfJAlUXkb0QFH8kUWY64DueDrGqVMWR/W5bc?=
 =?us-ascii?Q?mtisfwnaD6TVFBM3lQSQgfMorKMNZlYw8/nd3aUYFvblIHFp/+CM4PoUFwxi?=
 =?us-ascii?Q?Ywya9Z4q2NIPLcem9f/DfUEHmsT4b30lzhP7mpIOJRkzAzV4QiBMqZXSbuOr?=
 =?us-ascii?Q?il+1uSvnpbxey5bqc1zlELsG4lkBLeLyncS8iV++IBg9iP8+tAxNuRLWXKgZ?=
 =?us-ascii?Q?pv1PDN7FQIKHYPMMVkMsrlJ6Dz1qBvKiCVJc4QuY?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e52d5ba-8bf0-4c03-7acb-08dd9908d541
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 08:15:37.6044
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IEXe6sQlV9acpOhjosTwVgTxonZn1RZZ2nBnSbPccTQi68A3MULYttUJcpftVd5FHzh6FvqZijxz+iC2CJ5rqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2720D4410
X-Proofpoint-GUID: 3yRWUXfT67rVZ7BpO6dau7e3k6hxVcIP
X-Proofpoint-ORIG-GUID: 3yRWUXfT67rVZ7BpO6dau7e3k6hxVcIP
X-Authority-Analysis: v=2.4 cv=KJNaDEFo c=1 sm=1 tr=0 ts=682edd2c cx=c_pps a=l9lnEPKonMfu/vbXsUzXcw==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=dt9VzEwgFbYA:10
 a=gFgmyHasAAAA:20 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=5SUXA_WdLhUxzk7qWv0A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDA4MiBTYWx0ZWRfX9ZuIhKmSFnUL fT5fT73VmnRnc0+E15xBMHnv40+4nL/BI1M12esziddW/kcGyzyDJwGPSS2VsifVgIuzJmk8EXN Nm8Zk436aEM9no44eWTAoAn9PxyAGKvYBSyNsLD97wIx/DwflIJW8wEea9mtE6O3Uv+eNYlr++A
 feE2W9pkJLKRX4LvtCfmcb6r5ljkiRCq/HbTvxLAreCHGujfaSG3ndso6Lf7YDmnNaAvvaT77dQ JsMaQAJX6o6/47SOTKlhPqJCmZaRwNpXtv12NAF9VSH4jgF2xOK7dBoK1B7Fufh48R/69So3x85 8dEWaoHYr5+2hb5alQ+eT1EF0TWzeNbTHqi+Rh2yQZMpaQ9Fyn4qLC9L17Rs0Y0iz8ry4GBGMFK
 DK5XiQePHGT54HkCYG6KRXUj3ve5VFXCWcU0SHvxcpLHG036jVJoaUaxPzcTXw4tb7IyCvMK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_04,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505220082
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 May 2025 08:15:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217066

ChangeLog:
https://sites.google.com/site/fullycapable/release-notes-for-libcap#h.wqnp1zp1o8bm

Refresh local patch.

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 ...dk-libcap-Raise-the-size-of-arrays-containing.patch | 10 +++++-----
 .../libcap/{libcap_2.75.bb => libcap_2.76.bb}          |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)
 rename meta/recipes-support/libcap/{libcap_2.75.bb => libcap_2.76.bb} (96%)

diff --git a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
index f2d11b2983..2cec20b4b1 100644
--- a/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
+++ b/meta/recipes-support/libcap/files/0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch
@@ -1,4 +1,4 @@
-From 1343e4ee17bb3f72e6b244706cacbeb16463c5d7 Mon Sep 17 00:00:00 2001
+From 969d21aa2bf474d9c5c80a64de1a9fe0e17e31b2 Mon Sep 17 00:00:00 2001
 From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 14 Oct 2021 15:57:36 +0800
 Subject: [PATCH] nativesdk-libcap: Raise the size of arrays containing dl
@@ -19,12 +19,12 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/libcap/execable.h b/libcap/execable.h
-index 89e61a3..22518dd 100644
+index a68ea24..60d3853 100644
 --- a/libcap/execable.h
 +++ b/libcap/execable.h
-@@ -23,7 +23,7 @@
- #endif
- #define __EXECABLE_H
+@@ -34,7 +34,7 @@ extern const int _IO_stdin_used;
+ const int _IO_stdin_used __attribute__((weak)) = 131073;
+ #endif /* def __GLIBC__ */
  
 -const char __execable_dl_loader[] __attribute((section(".interp"))) =
 +const char __execable_dl_loader[4096] __attribute((section(".interp"))) =
diff --git a/meta/recipes-support/libcap/libcap_2.75.bb b/meta/recipes-support/libcap/libcap_2.76.bb
similarity index 96%
rename from meta/recipes-support/libcap/libcap_2.75.bb
rename to meta/recipes-support/libcap/libcap_2.76.bb
index 8530f13295..c842246fc0 100644
--- a/meta/recipes-support/libcap/libcap_2.75.bb
+++ b/meta/recipes-support/libcap/libcap_2.76.bb
@@ -16,7 +16,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/libs/security/linux-privs/${BPN}2/${BPN}-${
 SRC_URI:append:class-nativesdk = " \
            file://0001-nativesdk-libcap-Raise-the-size-of-arrays-containing.patch \
            "
-SRC_URI[sha256sum] = "de4e7e064c9ba451d5234dd46e897d7c71c96a9ebf9a0c445bc04f4742d83632"
+SRC_URI[sha256sum] = "629da4ab29900d0f7fcc36227073743119925fd711c99a1689bbf5c9b40c8e6f"
 
 UPSTREAM_CHECK_URI = "https://www.kernel.org/pub/linux/libs/security/linux-privs/${BPN}2/"
 
-- 
2.48.1


