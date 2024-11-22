Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1D56E65D34
	for <webhook@archiver.kernel.org>; Fri, 22 Nov 2024 08:20:44 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.19837.1732263642064600354
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Nov 2024 00:20:42 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=1056908776=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM7BHUg014934
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 00:20:41 -0800
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2173.outbound.protection.outlook.com [104.47.56.173])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42xusq6dfv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 00:20:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gEzgs8HUz/I/Co6kYZLFUpwvDguJNBm2xc/Ra/m1/UbVW6DoOp0LKJHsdWN7isM2lOf97W+L/bYUOBwWp3TQq9/Qe77M5Ut98aI+49Tin2vkaq8UMRaeKk4SntMCQYBw5LZ+0rwbA6mKsTnY+fpMqwZA4HC69otBgQJJbNZ2C9x0tw+JFbfltSDeDJ3FjmjvVyM74vhgqpnQu6Ay+LrMi+6RHW9iSMtnSmad2c+9YJgahPdtBKG0FsgxnvgU1SJleNjxaKxYxrHyQyHzMtvPg3MtRlrMp2ExttemPIzdy2avDuKC3+0A+septsdZaSAm3JIRa3lrzhaLdVn7TH5Z5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v4jbp99VVSOFoeZrE1UbQo/trLYVByA4eHwUMb+YGN8=;
 b=lCtaz3YVW7UpZm+0VFb2ei7fs7/Z0cK9hp0XciXbU1bhbkc7KY+3GTVwh7E6b7xU6YnaFkfc/GHVBTbM0Jn+7z37Ykfk2A1RrYoE7op7ABRgE2/vD5/DI3qM9dArxw4IUXZsilRn6a8OCffrdQl0MhiBpETPxsrtydORu8gnDzNpSZCbZXLpii8iZk1wnYMnmG6304Ape+tk7X5R0ne50QA2OucGhL83AJaTUqo5I7FEG5GVn8oGHzZDC06taCX/9vGZlMjQxC+mJN4ai128p8eyGR/VqukEvy96PDMNHFDTXQ07vRoFKCfYZKRy03pBOSo/vcR/Q0w4TRYtubRwkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by IA1PR11MB7679.namprd11.prod.outlook.com (2603:10b6:208:3f1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 08:20:36 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.8158.024; Fri, 22 Nov 2024
 08:20:36 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com
Subject: [PATCH] rust-target-config: Fix TARGET_C_INT_WIDTH with correct size
Date: Fri, 22 Nov 2024 00:19:57 -0800
Message-ID: <20241122081957.1372811-1-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0061.namprd05.prod.outlook.com
 (2603:10b6:a03:332::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|IA1PR11MB7679:EE_
X-MS-Office365-Filtering-Correlation-Id: e62216fd-72f8-40c4-d799-08dd0ace8a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?kRGyGHBGquzvP4LQoFVay8ZhECNTnzbBHfll6oP8bhLaa1JfyQPsR8m15+Fr?=
 =?us-ascii?Q?Uh10XdhSzYSiCKiti0lXeBGss83YCsi0FlrrK+MuMSokMZ7f+N5e2zH+xf0D?=
 =?us-ascii?Q?gZl1DmrhhUIMze3SjIQ/uHAD58In04SrECzoNLWW7wu7dtB6BHvYATWvmIp5?=
 =?us-ascii?Q?qw2tTQuSxnOir46nDdD603WgK3ASUiIGUPrJmGdXhM7CAI/gT/sLVYEAYYKc?=
 =?us-ascii?Q?i5VvKXwxpyJ6bD6F4LaA9mrV1XyboTq0F5PfjCcRBEldFfcCCdxY3SLbPI/H?=
 =?us-ascii?Q?87mw3pnddOAgOUgzr1YbihxO60AdYMzXrvxIQWVwPcQV0YLWhRdg4jgzuxxN?=
 =?us-ascii?Q?CB4Yjj+n2Aw/l3KfUQgNNdScZ1j56HkkLi318UtM2rDzvngdOoL6JofL2tyo?=
 =?us-ascii?Q?3NXaraWZNH7yksVjzCR1X7+nXTtqusg3SdE7yWQYs0YgVs4sC/kiRyFPPjqM?=
 =?us-ascii?Q?GxJW7JFF1DalcRxOq29nkarEDHgRpXBVcJY2NHmg5lSOifeVZ7rQcfT+Fm7Y?=
 =?us-ascii?Q?2I6YBip4zh0BLHagnRye1n54BqjKcaJh3aHcvgS8oH5JuEIMhX+dNrIIuflI?=
 =?us-ascii?Q?xQvRHKvJBoypR9ZoDESIQvBODporjTgXyPFuuhwfIA2Aer3R8G8b11QbbAyM?=
 =?us-ascii?Q?uTVynSBxtCxKdf8K2XXOtZccIZpAJwAT8oLZxI/qTo4hV4cU1xu+95oEKSGP?=
 =?us-ascii?Q?CB3cfqwrdHs7nY1D5QotwXQjdBgBU04vDh1DAcXn6jHBH2kiVPSSCqhfxPnm?=
 =?us-ascii?Q?n8PWsqF4wG8wr2rxbJha6V9LplSdwl/LzjwsEBW05xnqV1V03CQVhLJZlzal?=
 =?us-ascii?Q?tAn0/ouzaFAcOtvNr7GhM+Z6rDPuva/d4QHnht3bHQfgb5pVM/Kb5H3NQv0H?=
 =?us-ascii?Q?rO87y3CArL5piQKWXKCO76I1sTSgRJa/TNOKbnAJclGVFrb9OsRElcu7i+Ug?=
 =?us-ascii?Q?6DjWV0hbfotrLyXu/aaWCiyyYoXtuzKMbo6E1khPL0pJsV2BhX+iYMGY7H35?=
 =?us-ascii?Q?3Vn+rsakfjxJEp5xsOCGdrBd9zcGhIEgxrlp0gc3l89XVM5qekCBTXqLqnnI?=
 =?us-ascii?Q?wdXswORsMp9svvd/t7OsCTxP8kJAQuvdDWfHhaKMTwHLl7UzVJxzpagcN0EL?=
 =?us-ascii?Q?TJkMXQOzVm66lCRmO6pwt6X8k233QO1xCpwB6w8aKQGA250yVjkZqiKhqYdg?=
 =?us-ascii?Q?zjcCvLt197Sg9zbBSxUDD0g901Mq7IlZ8TLfZoJ72dSqSVN525/aIO2U5Ctw?=
 =?us-ascii?Q?sDPGgPjx+k4xhZE0V191IniBIelca/0a6GMtNGgeQAkcyi5tQNpQN+l1+sAT?=
 =?us-ascii?Q?M2ec0cZsyCImKczRT9jaZ4Oz?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Ir5N0pAy3ow1B1RJsKz4u3XW04IwqlFmq+EvBzvyPmcgvF62chMHNCM0mY/B?=
 =?us-ascii?Q?DPRxvAOLaUIMqka30BCof6SKccZn8Owa4q87exj07l8Q4f/9bTA/IksTSACk?=
 =?us-ascii?Q?qEvD4jl3ViIkW5eWYaDz+ZF6Xzr0TrldjBux8QViY2FKfzAo0+9BCMIF6eas?=
 =?us-ascii?Q?qfXfNoF6PvFkCxsKi6VLvB0yH4BpQsbGFw33+iRi2iAKm+JWr3fbfyvvFU5f?=
 =?us-ascii?Q?+cbi5MDqb16BeKsTcvYwZYFRAOA4Wmwsb8ZPePUC8YXTOHUzu5Bh+LYC5KBo?=
 =?us-ascii?Q?uup8yPb4Cb+wFJwLujQvFXdydcT2bSJdyGVNjYqBxFOoN43PeCyEGXlqTQe2?=
 =?us-ascii?Q?vvQx1JjA2E1Bu4BnYedPotQ4iLNim8eyDfm55KMZch80Gd5G9d7x7mrkV7oZ?=
 =?us-ascii?Q?x4E51Fw0iEOrU5BeNzeFMJD7USMaxC3WL098X1mpKT+14Ys7cbYL+9xrq4Hr?=
 =?us-ascii?Q?DUV6QycPTe/Nr29kMdCG7Okq00/J2rUniPRS/GjgMKLnUtdA9DQ1MK9LwfAE?=
 =?us-ascii?Q?v13kKXowI3q3IbpVHoet2Wfk+3LHRRQBCKN87emUnf7aSYt38bke3Sopzsdg?=
 =?us-ascii?Q?9Lf/Zg5B4qnP5GmpoI2wNRB1nqlqUpsWhGh/lpr/P8qg7QcIVraTnvxVSgBF?=
 =?us-ascii?Q?0TBWE05iEkIY0OLkPasQPWgw1RTWmIA0S8jpoKl1ib7NBV5b5SpBA3p69Tjs?=
 =?us-ascii?Q?fQSJQPGckCiwSgrBJoKcGgRNdtK0hS4w1b9HYc3AnF/ZRiIv6jhoWxWFkkPj?=
 =?us-ascii?Q?sh/kNGpipykto2HDkSj7+fGW6lyIYyW63wAdtitTCT25MBu/qVs+W+oNl0Vv?=
 =?us-ascii?Q?foUQlR4EO2iHgLz2DqJ1+TWovJ4EX5kY8ii4yvuMo+ljIxJC5n7XgqXqWkd9?=
 =?us-ascii?Q?po9dhCq+VQPZbnNpvZorBLqwhPlIfGbLnkrT+QmwJHDi6sUk+ewXyizzma7J?=
 =?us-ascii?Q?40Do7hkNICdBBKQfZ+KhYmDQRp3kw1d1/wqYUYfnC6EWLhtSIathgrWKxb7R?=
 =?us-ascii?Q?x0bf8YEJvZ4JYMAjX7haZtxc8v++X8p4yXdU6I9V82LxjFaExeeCqkQzqQid?=
 =?us-ascii?Q?/iiKJWE0o1jdQdjRY8J/4yky/pvZixy3qBaJklg7tsP7cSYUvupaMlx6C89S?=
 =?us-ascii?Q?TImbdo2dj42erVgM53RJB5aUmPWQmrRdoO7GvyNt8Q00qIC0w2UumaDUPolX?=
 =?us-ascii?Q?ixlVD12+NHki0mi4lo9I3StlBVhOiLcbmtppM8J5hE0EH0r9zjEmmQ5fwEZK?=
 =?us-ascii?Q?XBR9hxXrkKhNlphxs9a30umaCLAildQ7A1FBcLoTeEh66+CU7LHnuvqmTsYM?=
 =?us-ascii?Q?TgIjHWlR04FcC3i63b+BkqI1lwYCO8mp7x7slASQ0gQvjAtoQOxI6ypK0aDd?=
 =?us-ascii?Q?VKnnuN/jnPzVj7X9tLGECNHKlGVUx4n3f6sp6oEgVbPDW2pI1TLwF97L8cKE?=
 =?us-ascii?Q?chrFEXBc1X2t6JruGl+mvxMKfFKWQBd0T2guNtwv4fTrV6bZ4SkNLpuFrlZL?=
 =?us-ascii?Q?LSVA9F7QIfOxBuBrRTKJ8lsT0FyXQedCXigb4jQJe8uMcsD/XQ6wPHO/qIeR?=
 =?us-ascii?Q?7yo+SwTPN1xoyFeHWLUV5BfhxfsoOvJYzNFMnSkvbrnUSxQuY1YmtJv66Ldq?=
 =?us-ascii?Q?3w=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e62216fd-72f8-40c4-d799-08dd0ace8a80
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 08:20:36.0956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dvE9HZUU2jcHgKaZP3fZ5Xc1IsAbc0sUF+3aKjATIU8a4gYtTATNeVnuaN943iW7r3QKThHsHFO7gO4iTGVNgWYqhIhlSWxSrN9kapDJNxo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7679
X-Proofpoint-GUID: 0NhUSJ64LfLuLOBJqQ57AZ2hjtjuEUn7
X-Proofpoint-ORIG-GUID: 0NhUSJ64LfLuLOBJqQ57AZ2hjtjuEUn7
X-Authority-Analysis: v=2.4 cv=d9mnygjE c=1 sm=1 tr=0 ts=67403ed9 cx=c_pps a=5b96o3JgDboJA9an2DnXiA==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8
 a=t7CeM3EgAAAA:8 a=zW_x3ObERHP4Tp4e9FcA:9 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-22_02,2024-11-21_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 malwarescore=0 mlxlogscore=238 spamscore=0
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411220069
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 22 Nov 2024 08:20:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/207593

From: Harish Sadineni <Harish.Sadineni@windriver.com>

[YOCTO #15600]

The TARGET_C_INT_WIDTH value was incorrectly set to 64 instead of 32.
It is updated for PPC, Mips, and riscv64 architectures.

Discussion links for solution:
 https://lists.openembedded.org/g/openembedded-core/message/207486
 https://lists.openembedded.org/g/openembedded-core/message/207496

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/rust-target-config.bbclass | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index f7aa6c74d8..399c13db26 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -198,7 +198,7 @@ MAX_ATOMIC_WIDTH[mipsel] = "32"
 DATA_LAYOUT[mips64] = "E-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64] = "big"
 TARGET_POINTER_WIDTH[mips64] = "64"
-TARGET_C_INT_WIDTH[mips64] = "64"
+TARGET_C_INT_WIDTH[mips64] = "32"
 MAX_ATOMIC_WIDTH[mips64] = "64"
 
 ## mips64-n32-unknown-linux-{gnu, musl}
@@ -212,7 +212,7 @@ MAX_ATOMIC_WIDTH[mips64-n32] = "64"
 DATA_LAYOUT[mips64el] = "e-m:e-i8:8:32-i16:16:32-i64:64-n32:64-S128"
 TARGET_ENDIAN[mips64el] = "little"
 TARGET_POINTER_WIDTH[mips64el] = "64"
-TARGET_C_INT_WIDTH[mips64el] = "64"
+TARGET_C_INT_WIDTH[mips64el] = "32"
 MAX_ATOMIC_WIDTH[mips64el] = "64"
 
 ## powerpc-unknown-linux-{gnu, musl}
@@ -226,14 +226,14 @@ MAX_ATOMIC_WIDTH[powerpc] = "32"
 DATA_LAYOUT[powerpc64] = "E-m:e-i64:64-n32:64-S128-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64] = "big"
 TARGET_POINTER_WIDTH[powerpc64] = "64"
-TARGET_C_INT_WIDTH[powerpc64] = "64"
+TARGET_C_INT_WIDTH[powerpc64] = "32"
 MAX_ATOMIC_WIDTH[powerpc64] = "64"
 
 ## powerpc64le-unknown-linux-{gnu, musl}
 DATA_LAYOUT[powerpc64le] = "e-m:e-i64:64-n32:64-v256:256:256-v512:512:512"
 TARGET_ENDIAN[powerpc64le] = "little"
 TARGET_POINTER_WIDTH[powerpc64le] = "64"
-TARGET_C_INT_WIDTH[powerpc64le] = "64"
+TARGET_C_INT_WIDTH[powerpc64le] = "32"
 MAX_ATOMIC_WIDTH[powerpc64le] = "64"
 
 ## riscv32gc-unknown-linux-{gnu, musl}
@@ -247,7 +247,7 @@ MAX_ATOMIC_WIDTH[riscv32gc] = "32"
 DATA_LAYOUT[riscv64gc] = "e-m:e-p:64:64-i64:64-i128:128-n64-S128"
 TARGET_ENDIAN[riscv64gc] = "little"
 TARGET_POINTER_WIDTH[riscv64gc] = "64"
-TARGET_C_INT_WIDTH[riscv64gc] = "64"
+TARGET_C_INT_WIDTH[riscv64gc] = "32"
 MAX_ATOMIC_WIDTH[riscv64gc] = "64"
 
 ## loongarch64-unknown-linux-{gnu, musl}
-- 
2.43.0


