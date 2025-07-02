Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BA54C83013
	for <webhook@archiver.kernel.org>; Wed,  2 Jul 2025 07:29:22 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.17991.1751441356514586974
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Jul 2025 00:29:16 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=927864f6e4=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625QxPC028073
	for <openembedded-core@lists.openembedded.org>; Wed, 2 Jul 2025 00:29:16 -0700
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04on2088.outbound.protection.outlook.com [40.107.100.88])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47jfwm3sdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 00:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypyPU4nb7TWidkD9NU6pveuFKKM4dtk7THwRSTU1hwQzWcGXmdAgfrNs4bpf/I8hsBKjtzMQNMbckBuqTBHzt/Bkl6jF71VgkfB6iS2WIwKnNARiWHI+vWXLODLVtDLqJcqdX1DiF6bpJLdb81oNGh6fvGxrdvQ6xxwfvmbIEIEA4AU4tQJZoX0tVfFKvV2Z7eYL2UuyekRFarjlSYSxVPMYRE150aBV3vJvyF16s+nR+CoBFsmrw//Frnzs/X0BIEmkAVBgnzxnK6V25XUtpR22xcM/qU+kCdkTZvRxFltx6lPXIfu/fWQiDD52OQCydjlUuchuPMuTaWz8dFdnBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3YoLkGighnVKaneWCQwO1sgahtcZrjS/pnlAllKGaL4=;
 b=mJ83S3hXKgjf34Cv9l2e5Y/Drh3t5pMUXIm8vHhsyzt0kGsZmBTp0+klMBEjJALrTBQFCMCcBLyMUwWthfoooKoEdXcCJjg4yYgEVNoK9FSOGxr8hobgLu4UCBlGLda2WRsUFtYZrhvOqjkznj7ZC+UwcyQbTyB96KHvH5IXfUXX6xNlPHLzu7m4lAL7ZjKRZXhYuu6ptk0XevHsu7xntLaRaqSXAJanAhkOi6jJ+8zUZGbC6X42e4fRhueVLh3yu130xDehrcO+l66XxM8XTgbNFYeNRnjJmM4Pfy9Nkv74CzMa83lxJ9E/Ps7MAO5dZ4MI4dawUCGlz4CAeMVfZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 MW4PR11MB6862.namprd11.prod.outlook.com (2603:10b6:303:220::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.32; Wed, 2 Jul 2025 07:29:12 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::2b44:787c:e7ee:bfad%3]) with mapi id 15.20.8901.018; Wed, 2 Jul 2025
 07:29:12 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/6 v3] fix runtime versions
Date: Wed,  2 Jul 2025 15:28:51 +0800
Message-Id: <20250702072857.1267224-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SE2P216CA0133.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c7::13) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|MW4PR11MB6862:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a87381b-58ba-4037-b62c-08ddb93a2436
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?CYUHk9f+zf5BjwLIR0nogtEU1xxVu6nw9EyDaQAeHcxqvSK57DJ71pRQVc4w?=
 =?us-ascii?Q?zoEgYnDsvppEG+FindPrsTxX30gxEq5sbfYw5NRZyKalN2XjRCdBwDd5sbRh?=
 =?us-ascii?Q?tEgFwl2Rw1X42mwFdCQhRIcTiAPWH729cwAsYrdVFYjbjAC9//MAL6b2+oSB?=
 =?us-ascii?Q?5N3TJ2QpC5XCQyv/9S+Ck9cna1xO9v7WCHjMqKINf2OK4maxHRQ0GcMPM0PE?=
 =?us-ascii?Q?c+5356VflUzNN4H6nv61fswWq+9xDZdtpNJnoBC0R2jdrbOykYMY9XzC7xeZ?=
 =?us-ascii?Q?YaSEPPYI6nsKtMC/qaPUK+wUDT5sNmOBwLheDCTQDxgUARDpbox0k1csEtJ4?=
 =?us-ascii?Q?63wuMe+gmbrWR2DtbOp1rGJGbMH+kOfNmB6Q1AkfzxhXva19m+MJ6kxgCHUA?=
 =?us-ascii?Q?Vx3+qkpFlCfvnWjy8Kq2b7fekBzypV4hVYWOgzGUq/QFRFY/4EBLeEVvGzKx?=
 =?us-ascii?Q?4Q8CGArizjZa3PetlAkz1JOiAQ6NrnghD7DkTxYQ2AgzQmXXw1h9npwqKIC5?=
 =?us-ascii?Q?EKCaFUWafAa9E4lt9f2PGND6xJF7ko/pD1ClJJnPG4Is+6VTtk1on5XZmNAg?=
 =?us-ascii?Q?HE7FIZ0jtFZIVseY06svjtKrPJZ4y/JyXIKmgauWMQv2mnD69C5Xsbtw/cFi?=
 =?us-ascii?Q?oA6KX8HXCa7RHQZkCJ7Mo+hQO+2cbJqB8PoMUjGE3rXWcmd1o49PYjOcVsXz?=
 =?us-ascii?Q?9e0bsKjUYsn7VBJwjjE70AXlRXYSxveKu71N0jys85VwxdoOSJMkmRfiopLc?=
 =?us-ascii?Q?ZPZxIsrpVXCKAOZUhfKEu2FywSQ1u1YUvb2BX1U6kFpkN+mFoRFmXNqaHcrk?=
 =?us-ascii?Q?xFq5/ezepmjIj/bCnVQsMIpEGJTn/49nuyH6t1L8vS0AN+et3CBL7a0FnSTO?=
 =?us-ascii?Q?rouP8WhkhxauGd9a14qHWbI6xM1TbEgmL6mT/C7W+ABYhoVSzvmqEkbZXK64?=
 =?us-ascii?Q?AR2Keos8YGOQAjm3PikifW3WspaOx2K6EoBixJ/yIuK+3Ty99sfU27NiuOnb?=
 =?us-ascii?Q?7gF37x2UWasoeDvQ/b82xUo81uco8KYvioIlYxwKNN9hMRE0tjvzCTSuh4Xw?=
 =?us-ascii?Q?IIr+1vJaPL7jX3bZVKoenjInVnT/jKZMU4Iu8vmcr+j8j6bE+w/xdD3RGcYf?=
 =?us-ascii?Q?uLsvhnynJDav5yb1h8m7KWuqdPwuF5NNbWdG0xxDqWb7UfjSt7bOYMpdKx90?=
 =?us-ascii?Q?JMH3cjujgL1GSaA0kOfdhZCE6qwelKjp22EwzrIpLJUA41Brn3nngI1JWCau?=
 =?us-ascii?Q?GS7XvooATrdKPm7wSEH/aYq4CX58iRH3j6fJjZXWVekgxmt70nLw3PLY8iF/?=
 =?us-ascii?Q?VZNoPb5NJnxxmKS7sV1yM2k17N2Xm3fiiAMPp+N6bl+8pHYe4t3xtka0M8ew?=
 =?us-ascii?Q?csxcUMLAUOumh/+TDpXerRkHz2rPQPrLB6dZW4pL/hgnryLNlkArKqhBWgIm?=
 =?us-ascii?Q?DUiJf0IESitfTJ31XwwHWEVwbkVimTDgKRTzxrcMQq2oNNyduSGL8g=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?m2JbHDvZMTBwL1LI3zSRgG9lIYScuwfDYglloHMzggBDr0BCmqJhtxUAwL+b?=
 =?us-ascii?Q?+ifk3kd4+Dqw4Cr8GD7QRfwND3RvjngFm6L0AUjjpIcPn4pP3HjEPodiJAqG?=
 =?us-ascii?Q?DMs5pFQuHBbo6TYv5D5xdXpUP3wy1zY8CYhYUaJ2rkemX4ZbRdq2N/jpLQHU?=
 =?us-ascii?Q?umGUm3me+9baNP78kRuTvTrmYxT8JYtxxG3BRj6ltpFo1PNZ36YRJ6UT4DVd?=
 =?us-ascii?Q?rGS5rmM5Cf1mkp23FbYUvHKGznywtbIhAgSgHrwj3cntl2jaHPgPCHMN3wcg?=
 =?us-ascii?Q?YfI9qqrMjkfHOh3bzTPjzmNS/zq+L06PLWK3HfiQW/YwuQ5RMpVHrjXCeTuk?=
 =?us-ascii?Q?el1spsYQHZduGTzXyD1gpBAj0yraO68X0DY23qUJJ5b5A37EVaezh6VeBEZB?=
 =?us-ascii?Q?chS7JIjGVYpIkTOgLDE/DrazFHiB9p+noEnP1Sf9ogxUgPilW4ZK5OaeSMmf?=
 =?us-ascii?Q?//jIHcwyFnC6mSaqMVjYC60gyLMxb/9e1+2l/NKm1p1h5Vaq59M4LzRXufe0?=
 =?us-ascii?Q?qJpLAs5dS88JhZiS2r0GDFexi0/UUfL8P1vlxEkCNBzeJP88oAxNHNB8OfXn?=
 =?us-ascii?Q?g5Mz9207pY7vRaE9nsarVCmZ+1evoH1nRbBC6qJLLScOvqt8ZwTe7cVgErV3?=
 =?us-ascii?Q?fYIbkq1/6r2ydPX3seB+odnTCNx46H12tQTNAVO3qqfR49ggE8am1IOmfMCG?=
 =?us-ascii?Q?D0TKnytaFKCnu9OpMCnlamA2BCj5rup4N2gRjZTLxelxWOkjsouz1wr2v2Ds?=
 =?us-ascii?Q?keQmO8gZvPL4Ghm5MITxLu57YMFMF6BIWSI4hMGaLRJVki1wo+W2dvYuVFwx?=
 =?us-ascii?Q?dwifXI0KuTsBGH41Y06VSLmBDqSkevpDCQLbQswbG9YIyCH/BdSIchga2Fvt?=
 =?us-ascii?Q?fgT56SGu+QjXUz//SkBFJB0tnie4FzHJpre+B9kJxXtnlSvGhfU2ndJEYv9/?=
 =?us-ascii?Q?lKEVgJKfP7ghdGqUMDZYg2+PwRODrLpvVKGrmdeYNdSgGe+eNVEv28iKT+R3?=
 =?us-ascii?Q?URsxat4Sun6QSuXI4PLhRcTWTwGrpEZ6dYq6FnpxbnM8qeJi47UrAzHD+ATx?=
 =?us-ascii?Q?BD+z8D3BpxdTspzPEVzMBOVIoG6iNYsdtnXCZypuH3Ce+NBad9N2fyR/tFNC?=
 =?us-ascii?Q?oKgsOGL8QDf9jorWt2CHbEc0J7PKH+nyOqo+OggnEJmBTBqy3fydg3kL+2q+?=
 =?us-ascii?Q?uR7fPx8Wo1VxGpXMBpNRfY0kvs8WAgmsjNGVXtkP8LObDHDQTY1WQFz2hGVK?=
 =?us-ascii?Q?KsU5vaK6LGFHn+Ld0nduv1Api7JXgNbWS/0SH4/gmCA2HCFyG+vvTgStXllK?=
 =?us-ascii?Q?GsB8oGgo4IEPrMXtMqY9sX7k4KBR3JOy1zS4m9J8DQ0JBEXyyKw+hVj7FOIy?=
 =?us-ascii?Q?yvcY+TAfC/GKYKgHQI0fQsQ446YacYWUVcLoZfL5hfb1mEjM9negZK24D2Mt?=
 =?us-ascii?Q?tlabPEg6iT5Dh1B61JQHHB0wAf/Q0TSNY3HL5ZxD4Ac1L+kQ3RKvihLRGzYH?=
 =?us-ascii?Q?1cRw6g8z/WxAJfjScx4ouakFBrKbNQk2VrcMLFW6NLCzQuihPlisWCFREds2?=
 =?us-ascii?Q?e+Wf9opCsWxT7ncJTUNLzAzBVf9rlGDURJS7Gxbs?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a87381b-58ba-4037-b62c-08ddb93a2436
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 07:29:12.6051
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xiMmvHdYZ0CN2n2fKQRQOlSDoAUzuq/Xua3F2Aj+TxLEMJS8odK91ivCyRMEm8isi9CAnFRxIDzC99reG1GeJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6862
X-Authority-Analysis: v=2.4 cv=LPRmQIW9 c=1 sm=1 tr=0 ts=6864dfcc cx=c_pps a=bXIISpLe4O+zW6xWAQB2QA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10 a=op7ZrFneVHjmVXoe-tMA:9
X-Proofpoint-GUID: DvD8Q-mS1bkRLxIXo9LczXBk2VM1moa-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA1OSBTYWx0ZWRfX4T7ycc72D1cJ JCCf2l+N8gHdu3EXnbmKNpsh3qw9hSWcZ7GtIdHII+XTO/UanABqLBMt3maRrliEtBvtob7xvNg Zy1ffRu7Gb53FXdRugSi079+AdWNT6c15xO0XjlU7atmPWlMMd2KZZuffLRTUoI0W8NsbZ6IFG4
 LCXlLPzWDOzd6CdMcBZRjv9ANXDyfC3rN7+4MOpiAlgfHzO2MVN/WRSCsGMNFWUhGVeXLaMDz82 trFat3XIKgPsnGSfqcbBgPAxjJC/03barHIH7fwQiX1p4zcZxz1ImjPNmxsv/JL5dvJtSV4hzUa +l1BDNitUyWKz4vD+WjTShTjfZwniHt9Kete2reSDUXDJCZBg97ja19jc1VKjDvUYSXg5HTQo39
 436qDKeEXvX9DwqMqZO/w9m/NZxaTJhNKPsNwW7soQ0wLgRzX7VaHxJblcz/cFmN0P06XDcd
X-Proofpoint-ORIG-GUID: DvD8Q-mS1bkRLxIXo9LczXBk2VM1moa-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=873
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505280000
 definitions=main-2507020059
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 02 Jul 2025 07:29:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219793

Add an inc file in meta/recipes-support/gnupg/ to modify autogen.sh,
then gnupg and other recipes can include it to remove the unknown
suffix in runtime versions.

Yi Zhao (6):
  gnupg: drop -unknown suffix from version number
  libgpg-error:: drop -unknown suffix from version number
  pinentry: drop -unknown suffix from version number
  libgcrypt: drop -unknown suffix from version number
  libassuan: drop -unknown suffix from version number
  libksba: drop -unknown suffix from version number

 .../gnupg/drop-unknown-suffix.inc             | 29 +++++++++++++++++
 ...h-fix-find-version-for-beta-checking.patch | 31 -------------------
 meta/recipes-support/gnupg/gnupg_2.5.5.bb     |  3 +-
 .../libassuan/libassuan_3.0.2.bb              |  2 ++
 .../libgcrypt/libgcrypt_1.11.1.bb             |  2 ++
 .../libgpg-error/libgpg-error_1.55.bb         |  2 ++
 meta/recipes-support/libksba/libksba_1.6.7.bb |  2 ++
 .../pinentry/pinentry_1.3.1.bb                |  2 ++
 8 files changed, 41 insertions(+), 32 deletions(-)
 create mode 100644 meta/recipes-support/gnupg/drop-unknown-suffix.inc
 delete mode 100644 meta/recipes-support/gnupg/gnupg/0004-autogen.sh-fix-find-version-for-beta-checking.patch

-- 
2.34.1


