Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D6C5C021B0
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 15:21:14 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.24916.1739978470124678905
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Feb 2025 07:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=41459c3b11=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51JAjlxd025788
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:21:09 -0800
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00k96dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 07:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AKUGNI9IQjEUuhNqqW1UeruirFgknHl7d5Eq8/I2V8Z+Ke5tn0xmQirPvIjU9vcT16UCP4y/fb8SPJZ2xJnn6JKmLUb+ObcjOie5S0kwioq6bxYYUDuIKpVI9ig3UJPi20OZRNz1fcPwXqcgo+TlPp/dPjtYF94DO099GTVqT2RvgtYwcxWN76A3V/vZjV8D/6gCYW8RuUqOsSLVfJ9xNoBxtXT2LImq8FT0hQL28r6LW56zqIifxzbeRTRI/I+t1lOPFxt+ynhCDPpkUyQCwyV6/NdKMd7h87n2+d5EUTZFIcptpkTErPN7wH9si6S78aX3UqqY2OHszCOX138zng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fbgU57/tJVD4tlrTZ3rKg8w8055NeXA2CIZrOpZ6XIY=;
 b=R+84YwW4S0KqTuLxtlOm4ApzDffsHe5lKBAPpSD8RRQYOIXkxljVJLg2AoOJoVVlhil1mSVoVzhriHZP71UuImndHx8O5+mksPE+9zJr9knwgZijDSBX5uw7+L15AFQnF3eWJp2PZW+FDx9EzWWvioegnG7GAnz8FTgWXs5Rz9/793eywULWhc5PFW0HaxgYjGcJFeXNGcg2Hn2neBDQJ0PhHMmuC6bz1H2vjVZeDDpFvwS9/VcrhWe7BNK27NinYr2TmFwpJyWMUUaNwDQ/l+ykfFuaQo+LUq2GNyS3rRNOyW9h3pyHgMJqlukoQthX5UidTcIkX+4DlD3FpQStvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA1PR11MB6323.namprd11.prod.outlook.com (2603:10b6:208:389::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 15:20:56 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 15:20:56 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Shivaprasad.Moodalappa@windriver.com, Sundeep.Kokkonda@windriver.com,
        Deepesh.Varatharajan@windriver.com
Subject: [PATCH V2 2/3] rust: oe-selftest issue fix with v1.82
Date: Wed, 19 Feb 2025 07:20:31 -0800
Message-ID: <20250219152037.1564893-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250219152037.1564893-1-Deepesh.Varatharajan@windriver.com>
References: <20250219152037.1564893-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::27) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA1PR11MB6323:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc54709-1822-4bfb-a44e-08dd50f901db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|13003099007|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?KVkMmkuwYdNsqvOQZmbjV0pKoqKiW74N8DxgpfndxCl8lc5heI8WUrHtdVyb?=
 =?us-ascii?Q?Hr+aQ0vhOuxGg2ZMjEo8RTFcDGCBOpOaZaGcg3kDV1TeIXFwAxhC9H6uCyTN?=
 =?us-ascii?Q?sRiFKRijoGpKq6yV/OnRB9+YNPk3bSjAm3INZWUMxKH2TaOb0fzckRCM+e3F?=
 =?us-ascii?Q?q9a7W/UTNSI+yozzMrf3QNrR40UUp3pSvkiawCJx4bbXp8GDwmgYlgXnO56U?=
 =?us-ascii?Q?odSrTIwIBuIrLM1VhTN0vlhPXG2Ufa+kA6FFPZHMTL6xwix2j7U2/Yfrf9bO?=
 =?us-ascii?Q?MxYpyLRSLzVA3dD9rRkS+1lUuXcgZaH8B1LOcWubC0/XipIm5d2TvaEWHqcR?=
 =?us-ascii?Q?c57Wdee1f/asAYEuKlJ8BjtXJ9IMJ/4GWuXDbWIw35R1IMT6Qlbz3jpmhzO/?=
 =?us-ascii?Q?z31wEosxR/YyiD/BbxXItcgDi8QFrWAfjl6lhmYQBQrLGemVJFYBhm/DEyjG?=
 =?us-ascii?Q?xQWnJz0IS2F669Et0hJ4MqT/QWI31QlRbyqqSoQCaYXLf9iF7k0a9b5v9atR?=
 =?us-ascii?Q?IcD6aBZqcmD6AUNyhSmM2xDvCk2Nhu3pBm9DFp6VRIF7WJiP7Mah3+d9OybX?=
 =?us-ascii?Q?Kq0QNgcHRojWzcwscOH+S8c9igWb0ziA7Lj31ohUQlL2MKe2fkshMZK4qX/0?=
 =?us-ascii?Q?kI8QJgfC8OSudoVv6+3XHGsk9VTZHLuinsxgE9xH1nPCWlwfEGMRdHGnQQfG?=
 =?us-ascii?Q?A8VbTsPkrxv47kKSZzkjbrWNzEZP6RtqaaKg8ZgsWClL2gZrWQ5peqmo8NH1?=
 =?us-ascii?Q?+vEOW65dDyXFmcpJFZzld8l5E6tFnRnguzYgfDaG6lFHQxbcLvG13/c2JU6D?=
 =?us-ascii?Q?qlgIPDnRIpI7fkpoqd/yD3ROdNAVIt9mkl79YXSbTByQXFrDACtoERie2/5B?=
 =?us-ascii?Q?ZvLW7Uloi6Vr9rS0ytfBNqyKzNRpmo4yiSGvZOJ/hGtQ7bQHZALHvTYBLXN2?=
 =?us-ascii?Q?Zo70r47SgzChAJGogbGpRnrIrOozr8lZc06uVkIGlqXmV3MZllM7XXNHwDqS?=
 =?us-ascii?Q?PBPbg5zH7dqmfd7qmCUvUsW9vjAhlWZqs9MpJcEio9HoWlVzsaFG9yOYHUyK?=
 =?us-ascii?Q?0vWX4bYyxgS0qdr5QA01tfDzyk4QyrTMFOT/iF2dStFkosgcIYF774chJrCG?=
 =?us-ascii?Q?8cbLn9G6uLTRS7U0J2Ss9nVfpOxiQQ1VTvwdW47tt+r06GDSClua+fKIbhxi?=
 =?us-ascii?Q?Ho5tQqAz+UUeUvHvHtpjwITw4cVT7oiNQvxeAPUE3Ws6iAay/5/uCOVy7XhQ?=
 =?us-ascii?Q?6TQ3xC76IoPP+rTnaFwUwe5iyOz4B3IUVky0YYbtLLiWoKaF2aYar93GTyz+?=
 =?us-ascii?Q?jhYTWNok4JkU8KDCrD5ACTgMaoiqrfXUcsRZrC387JdatNzAyiapBCLHNl3Y?=
 =?us-ascii?Q?8MtBfG8cmrIZJVqsdPMk/O4V69NvFpi/VbCfVoLZxm0PU3vHWQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(13003099007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ftMBsNQ8hja3wBkK8OEWBcHeO+t30yLjPPhM+6XG2uvWinm5jnKSCrNaTJqn?=
 =?us-ascii?Q?OYlAQSfN05l1A/kcoDGEkv2zxe4NSTNrQoexaRr7YI5GBlg+/Vdxgbvs3+hs?=
 =?us-ascii?Q?O+j5CmLdhfGTRo1qNba4NEHNPEPk2j7eSBEUu2xTdAaLaiLCL6OQQ5sStzoE?=
 =?us-ascii?Q?yWy7VNvsGF1/p+fDEY1WdPgaZuT567mF6MX6iE+10LOnLNH6tH0RLfn/Ma6i?=
 =?us-ascii?Q?9GFFrby7hV3xvymJIHyNYZ3RUMIj7JmqRyf8aRk2gMTFK9ltsXBilsqAtAl0?=
 =?us-ascii?Q?llwYU2m6Dy+HAmf+dMq/xTrbHJ1nzrKp++e1ZdEhlPR9HNmx8URUt/chnqsO?=
 =?us-ascii?Q?P+EFoFl+la5QacatrY3vsX44muh8FrhO/Kpg5zel4yImHu/XNOVbDsf1hIgl?=
 =?us-ascii?Q?6jP19ZD/paNMLNWyKB93DVvYBeEP8vkLLMKE2ihNYCvbqhtPsNeiD2I4X1bF?=
 =?us-ascii?Q?Kz98j+z5jJmY2Y6HNS1iuJKtwuBsTWiCUwMhX06FFwS42qZGqsm+utkBTFY0?=
 =?us-ascii?Q?PLaHd7qj8CxTMvpvef++uiL3QnAL2zZlFn0m6FcFsqH8buRVKiGSAfG9AYlQ?=
 =?us-ascii?Q?GQginJF0Rpkdv7BF46C8ZXULE6k4ycBs14hitf+XM+a4HaQeIttY9U5rUdrC?=
 =?us-ascii?Q?bmvPCin9hYpetuD0VKZgnD2g3GAZkNvqu1C18A9ZWQ2m9Nt3NMid+LLU7tOr?=
 =?us-ascii?Q?Toop5LVM50nzrUxZSCF4MFmSJhvJc3lCKAYPPrtfodGu2upM5CpMf/f3yLwC?=
 =?us-ascii?Q?tBUKpqpo225toxYyjRoHHiEHs1h4YGRiuGEdMHRj8+ETycBfOiLVwsG94erc?=
 =?us-ascii?Q?KEWda5JHSCqvDdxw7X9VhW94YO4vesR6H6Tl+XgGPx0fHy5TU1o6HEOGclF3?=
 =?us-ascii?Q?08gjrF8QKanPySgK0RqSaeUdOQ2TZyj6TbPYLWwuQmyvzyFGBWsAFMru+WPL?=
 =?us-ascii?Q?izxSHIjDG3uXWT6TBRB3Gw9wlUifcH7ef/kuqcntWDcZkmxE/UC1yTbWKbF5?=
 =?us-ascii?Q?9mfAnuDDycdxanVfyz6tBAQyQbOG8jgF7m3rwoPQfgCWQuVrfDEAbDIqDXIL?=
 =?us-ascii?Q?s+k0JFcF0OsTP3l31H2kcz/LTJbrooqf3ztF42LAf8DiKfllzcZ8hsvXZdGa?=
 =?us-ascii?Q?NNcDH05QSWz33NB7qcqjQ6jeS28Zzfx6zU6izINazH8x+bAnCgBng8vUgdIg?=
 =?us-ascii?Q?ppRiv9Xm/Fug12r+N/YZweFF4c0YVS9xBLEVVn/byLusrLbVrzPIB4aCqB0R?=
 =?us-ascii?Q?GfozBfALwLl2n8bovd0OTOV7RvtQ4mdK5Xk6Fi7FpZL9enCQ615fp99P3oxF?=
 =?us-ascii?Q?vzDT43yYNU851pkIcysTQt8GhBBpmMyE+KgAKx9/O20uM/U3o/OIHKiBzdF5?=
 =?us-ascii?Q?WWpUEgxQ5w/J2x9gdn/XuTj1BhcCtpNQM5t6MbKD1jdXaLpyovg0D2dXJpO6?=
 =?us-ascii?Q?k909lCMgW63S00OPpsVGXFmZ1gh9L3OgE8YMk/EN9OUpnryr8cVEMA1Keo7I?=
 =?us-ascii?Q?dhkFPIizlJrp8siY0k46Wc2Y4INY3Ck9PxLcR0FYT8I2r/awcdejGxOLjrY2?=
 =?us-ascii?Q?W5Ntfz7qMAsF1cikdwKigCHpT6/bIiCiIBGRf9p70bPd1uaaY0DgMJ+XOjqk?=
 =?us-ascii?Q?EEpw2ftbF6dlFh+NMNTVL8o=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc54709-1822-4bfb-a44e-08dd50f901db
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 15:20:56.5680
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GupKrGNoeYhPCerhgoDj+0tbtHTqZZAWuRXtbm9OqdieaYPbReys716Qh2IuV+t7IIL+6kAOGstwym+7xtETE1mSko5TfdOHzBgyoU5/iprhNZX6gOvfTr56yHflgiFh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6323
X-Authority-Analysis: v=2.4 cv=N67TF39B c=1 sm=1 tr=0 ts=67b5f6e5 cx=c_pps a=u2H4imzVBiBAAVvoIH6jzw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=u02PoEkyPoAnoWPh7dwA:9 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: iIiftZO7A-Tq9yAOzC8qpnYchN3M2wHq
X-Proofpoint-GUID: iIiftZO7A-Tq9yAOzC8qpnYchN3M2wHq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_06,2025-02-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 15:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211713

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

A new feature "Link std statically in rustc_driver" was introduced
in rust_1.82 [https://github.com/rust-lang/rust/pull/122362],and
which is causing the below failure in oe-selftest.

Running unittests src/main.rs (build/x86_64-unknown-linux-gnu/stage1-rustc/
x86_64-poky-linux-gnu/release/deps/rustc_main-92223b15c9f2d827)
uploaded ".../build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/
release/deps/rustc_main-92223b15c9f2d827", waiting for result
/tmp/work/test4056/rustc_main-92223b15c9f2d827: error while loading shared
libraries: librustc_driver-fb0866b1cd913c20.so: cannot open shared object file: No
such file or directory

The rustc_main binary depends on the librustc_driver-*.so file. However,
this file has not been copied to QEMU. If we manually copy the file into
QEMU and export the LD_LIBRARY_PATH, the issue does not occur. Issue
reprorted to upstream and reverted the buggy code as a workaround.

Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/136237]

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 ...d-statically-in-rustc_driver-feature.patch | 199 ++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |   1 +
 2 files changed, 200 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch

diff --git a/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
new file mode 100644
index 0000000000..257883ef60
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/revert-link-std-statically-in-rustc_driver-feature.patch
@@ -0,0 +1,199 @@
+rust: oe-selftest issue fix with v1.82
+
+A new feature "Link std statically in rustc_driver" was introduced 
+in rust_1.82 [https://github.com/rust-lang/rust/pull/122362],and 
+which is causing the below failure in oe-selftest.
+
+Running unittests src/main.rs (build/x86_64-unknown-linux-gnu/stage1-rustc/
+x86_64-poky-linux-gnu/release/deps/rustc_main-92223b15c9f2d827)
+uploaded ".../build/x86_64-unknown-linux-gnu/stage1-rustc/x86_64-poky-linux-gnu/
+release/deps/rustc_main-92223b15c9f2d827", waiting for result
+/tmp/work/test4056/rustc_main-92223b15c9f2d827: error while loading shared 
+libraries: librustc_driver-fb0866b1cd913c20.so: cannot open shared object file: No 
+such file or directory
+
+The rustc_main binary depends on the librustc_driver-*.so file. However, 
+this file has not been copied to QEMU. If we manually copy the file into 
+QEMU and export the LD_LIBRARY_PATH, the issue does not occur. Issue 
+reprorted to upstream and reverted the buggy code as a workaround.
+
+Upstream-Status: Inappropriate [reported at https://github.com/rust-lang/rust/issues/136237]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+diff --git a/compiler/rustc/src/main.rs b/compiler/rustc/src/main.rs
+index e9a7397557..29766fc9d8 100644
+--- a/compiler/rustc/src/main.rs
++++ b/compiler/rustc/src/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ // A note about jemalloc: rustc uses jemalloc when built for CI and
+ // distribution. The obvious way to do this is with the `#[global_allocator]`
+ // mechanism. However, for complicated reasons (see
+diff --git a/compiler/rustc_metadata/src/dependency_format.rs b/compiler/rustc_metadata/src/dependency_format.rs
+index 39fa23766b..51d86b4009 100644
+--- a/compiler/rustc_metadata/src/dependency_format.rs
++++ b/compiler/rustc_metadata/src/dependency_format.rs
+@@ -51,7 +51,7 @@
+ //! Additionally, the algorithm is geared towards finding *any* solution rather
+ //! than finding a number of solutions (there are normally quite a few).
+
+-use rustc_data_structures::fx::{FxHashMap, FxHashSet};
++use rustc_data_structures::fx::FxHashMap;
+ use rustc_hir::def_id::CrateNum;
+ use rustc_middle::bug;
+ use rustc_middle::middle::dependency_format::{Dependencies, DependencyList, Linkage};
+@@ -162,43 +162,18 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
+         Linkage::Dynamic | Linkage::IncludedFromDylib => {}
+     }
+
+-    let all_dylibs = || {
+-        tcx.crates(()).iter().filter(|&&cnum| {
+-            !tcx.dep_kind(cnum).macros_only() && tcx.used_crate_source(cnum).dylib.is_some()
+-        })
+-    };
+-
+-    let mut upstream_in_dylibs = FxHashSet::default();
+-
+-    if tcx.features().rustc_private {
+-        // We need this to prevent users of `rustc_driver` from linking dynamically to `std`
+-        // which does not work as `std` is also statically linked into `rustc_driver`.
+-
+-        // Find all libraries statically linked to upstream dylibs.
+-        for &cnum in all_dylibs() {
+-            let deps = tcx.dylib_dependency_formats(cnum);
+-            for &(depnum, style) in deps.iter() {
+-                if let RequireStatic = style {
+-                    upstream_in_dylibs.insert(depnum);
+-                }
+-            }
+-        }
+-    }
+-
+     let mut formats = FxHashMap::default();
+
+     // Sweep all crates for found dylibs. Add all dylibs, as well as their
+     // dependencies, ensuring there are no conflicts. The only valid case for a
+     // dependency to be relied upon twice is for both cases to rely on a dylib.
+-    for &cnum in all_dylibs() {
+-        if upstream_in_dylibs.contains(&cnum) {
+-            info!("skipping dylib: {}", tcx.crate_name(cnum));
+-            // If this dylib is also available statically linked to another dylib
+-            // we try to use that instead.
++    for &cnum in tcx.crates(()).iter() {
++        if tcx.dep_kind(cnum).macros_only() {
+             continue;
+         }
+-
+         let name = tcx.crate_name(cnum);
++        let src = tcx.used_crate_source(cnum);
++        if src.dylib.is_some() {
+         info!("adding dylib: {}", name);
+         add_library(tcx, cnum, RequireDynamic, &mut formats, &mut unavailable_as_static);
+         let deps = tcx.dylib_dependency_formats(cnum);
+@@ -207,6 +182,7 @@ fn calculate_type(tcx: TyCtxt<'_>, ty: CrateType) -> DependencyList {
+             add_library(tcx, depnum, style, &mut formats, &mut unavailable_as_static);
+         }
+     }
++    }
+
+     // Collect what we've got so far in the return vector.
+     let last_crate = tcx.crates(()).len();
+diff --git a/src/bootstrap/src/bin/rustc.rs b/src/bootstrap/src/bin/rustc.rs
+index d04e2fbeb7..011c289d93 100644
+--- a/src/bootstrap/src/bin/rustc.rs
++++ b/src/bootstrap/src/bin/rustc.rs
+@@ -89,25 +89,6 @@ fn main() {
+         rustc_real
+     };
+
+-    // Get the name of the crate we're compiling, if any.
+-    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
+-
+-    // When statically linking `std` into `rustc_driver`, remove `-C prefer-dynamic`
+-    if env::var("RUSTC_LINK_STD_INTO_RUSTC_DRIVER").unwrap() == "1"
+-        && crate_name == Some("rustc_driver")
+-        && stage != "0"
+-    {
+-        if let Some(pos) = args.iter().enumerate().position(|(i, a)| {
+-            a == "-C" && args.get(i + 1).map(|a| a == "prefer-dynamic").unwrap_or(false)
+-        }) {
+-            args.remove(pos);
+-            args.remove(pos);
+-        }
+-        if let Some(pos) = args.iter().position(|a| a == "-Cprefer-dynamic") {
+-            args.remove(pos);
+-        }
+-    }
+-
+     let mut cmd = match env::var_os("RUSTC_WRAPPER_REAL") {
+         Some(wrapper) if !wrapper.is_empty() => {
+             let mut cmd = Command::new(wrapper);
+@@ -118,6 +99,9 @@ fn main() {
+     };
+     cmd.args(&args).env(dylib_path_var(), env::join_paths(&dylib_path).unwrap());
+
++    // Get the name of the crate we're compiling, if any.
++    let crate_name = parse_value_from_args(&orig_args, "--crate-name");
++
+     if let Some(crate_name) = crate_name {
+         if let Some(target) = env::var_os("RUSTC_TIME") {
+             if target == "all"
+diff --git a/src/bootstrap/src/core/builder.rs b/src/bootstrap/src/core/builder.rs
+index ff0d1f3a72..b2c9602e57 100644
+--- a/src/bootstrap/src/core/builder.rs
++++ b/src/bootstrap/src/core/builder.rs
+@@ -2153,7 +2153,7 @@ impl<'a> Builder<'a> {
+         // When we build Rust dylibs they're all intended for intermediate
+         // usage, so make sure we pass the -Cprefer-dynamic flag instead of
+         // linking all deps statically into the dylib.
+-        if matches!(mode, Mode::Std) {
++        if matches!(mode, Mode::Std | Mode::Rustc) {
+             rustflags.arg("-Cprefer-dynamic");
+         }
+         if matches!(mode, Mode::Rustc) && !self.link_std_into_rustc_driver(target) {
+diff --git a/src/tools/clippy/src/main.rs b/src/tools/clippy/src/main.rs
+index c9853e53f3..c9af2138a7 100644
+--- a/src/tools/clippy/src/main.rs
++++ b/src/tools/clippy/src/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to
+-// `rustc_driver`.
+-#![feature(rustc_private)]
+ // warn on lints, that are included in `rust-lang/rust`s bootstrap
+ #![warn(rust_2018_idioms, unused_lifetimes)]
+
+diff --git a/src/tools/clippy/tests/compile-test.rs b/src/tools/clippy/tests/compile-test.rs
+index 9754254cdd..dd95cc71cd 100644
+--- a/src/tools/clippy/tests/compile-test.rs
++++ b/src/tools/clippy/tests/compile-test.rs
+@@ -1,4 +1,4 @@
+-#![feature(rustc_private, let_chains)]
++#![feature(let_chains)]
+ #![warn(rust_2018_idioms, unused_lifetimes)]
+ #![allow(unused_extern_crates)]
+
+diff --git a/src/tools/rustdoc/main.rs b/src/tools/rustdoc/main.rs
+index d4099cafe5..5b499a1fa1 100644
+--- a/src/tools/rustdoc/main.rs
++++ b/src/tools/rustdoc/main.rs
+@@ -1,6 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ fn main() {
+     rustdoc::main()
+ }
+diff --git a/src/tools/rustfmt/src/git-rustfmt/main.rs b/src/tools/rustfmt/src/git-rustfmt/main.rs
+index b8b0432aa9..b5bd71e015 100644
+--- a/src/tools/rustfmt/src/git-rustfmt/main.rs
++++ b/src/tools/rustfmt/src/git-rustfmt/main.rs
+@@ -1,7 +1,3 @@
+-// We need this feature as it changes `dylib` linking behavior and allows us to link to
+-// `rustc_driver`.
+-#![feature(rustc_private)]
+-
+ use std::env;
+ use std::io::stdout;
+ use std::path::{Path, PathBuf};
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index dc716618f7..0c0c9dcaa0 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,6 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://oeqa-selftest-Increase-timeout-in-process-sigpipe-ru.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
+	    file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
 "
 SRC_URI[rust.sha256sum] = "1276a0bb8fa12288ba6fa96597d28b40e74c44257c051d3bc02c2b049bb38210"
 
-- 
2.43.0


