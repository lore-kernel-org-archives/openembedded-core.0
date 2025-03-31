Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75010C36017
	for <webhook@archiver.kernel.org>; Mon, 31 Mar 2025 04:38:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.44681.1743395910751396576
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Mar 2025 21:38:30 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=61856e1cce=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V4bLLW014431
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:38:30 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2176.outbound.protection.outlook.com [104.47.73.176])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 45p6311r3a-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:38:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJc0kl0X5GgPRqx3xurAMJkYbxwtnD2Fj3GSNMY7MTAMyPrCStHdoNo3GIZI7NGvoD0JRusNQ6Vk6C9CD2Ez9uk9acPJzEAjO8xVRok1smQhyjpsWYOhOv7umxRlQN1QUjPXSyzQZf1BBF4ujw+Z++jUmWycU1AsA6z91BxrTCVm5aR2/RDJGuUcPbFIQcMh+1YzZvxZ3Qm7G+1AvXFaQr+tlbtVIhWcIeL8HVlbBV9o98d/vqAXHugz/V4/EHu6F8UINQzLE5890DfXlRnwGEI3G/jJ7S6g/JeHQui+stLDoyQ0HcJaYyRj5h22TrYQHPCG0LbEYKHsDGvNZFdEHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzcvj+U6B4FLA+HtDOMjHUwer6gMbycmTtcQiA7wmS8=;
 b=C6KEAu5lI7BGeglBuaObzE5buyiyVzVqLGxxGXlUO7N864123EcP9OpAbyMptch86Bzg2Gp3D1rUrh+aM0yQS3x4e7x3I6TVskOuQ9/6111IcyGwXyssbGGbqI1/MEs+iqNVbBg0r7hwlM+kVgiIkIGGqQst8nRKS6zi2XzUxpfsEpCCpCg/r/LVq41bVBzja9FPxZ/Vvvj6VEd57yicgwmZ2gNrRa1iSyJW7Eh5V5orGi7EYnNN299I0iDmcMlCALuhx8ooTuvklf8LpqhKDdTUcQMaBDI/op1c2mMaKrdgB7x1PYKgmtuWtC/kWG7XcsR0wXmL2IpqnWiEz3TDog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Mon, 31 Mar
 2025 04:38:28 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8534.043; Mon, 31 Mar 2025
 04:38:28 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Yash.Shinde@windriver.com
Subject: [PATCH v2 3/3] rust: Upgrade 1.85.0->1.85.1
Date: Sun, 30 Mar 2025 21:36:01 -0700
Message-ID: <20250331043737.1964155-3-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250331043737.1964155-1-Yash.Shinde@windriver.com>
References: <20250331043737.1964155-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P221CA0028.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:32a::16) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: b670e578-b668-4015-c320-08dd700de19a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lMCf7BvzKUiiJQ0OqHBLQPzHMuP0IQ8ARf4oMd35tCCwBoeqrFifKLnbPDAN?=
 =?us-ascii?Q?9vvjM0hocYa3H9dl39NTWVq6NA5UVfa4UNSg7Py9eICeiAkGetmYM8qc+c86?=
 =?us-ascii?Q?/RvhDx7Wb4gcfSrERvmEtoBC4WPhWdd8TWDhB8WqpS5rjjSJgH4diKdzL6SM?=
 =?us-ascii?Q?WTFwbcayWhx6BkKc91vgiqpC/tlHuYmJVpkZ/tlYIrHks3oouUGJg7vSXQgI?=
 =?us-ascii?Q?pj3C5HKXM7RfF391UoU9EQ7d7w97/bD2FuBRhtzqREUqvKPT3yejc9UQy+FN?=
 =?us-ascii?Q?T3xro9SB8JSHwGOmMbc80omrQpt1lbH7zrVcNkYVyBhYZuF39L1E1Zh9FtrZ?=
 =?us-ascii?Q?VPATOwhrcUG8MezmphS5zLuhnKHVreGgWhot+qviJaCG9PK9zCOtrsb7YL0y?=
 =?us-ascii?Q?lRSsi6ZsGengbakxXAatCkAJvhUBy2ZHJrdyuLc0GI/WylL+gjPADu3Q52DG?=
 =?us-ascii?Q?U30Ga4OubKherQEqpsuNpYviTyrryy/QVlA8zq2z9RqC3wPQrhRe8/NH7ujL?=
 =?us-ascii?Q?Svl9AhRm8trM7Hq4cIkBGz+RvNvRDC90tLjupfQKDdaTW/KJLkSsNb7/OyMj?=
 =?us-ascii?Q?1XdXhq2J8+nbFmzRJlIPHHKQOvBNJ8MdS1nF17LmTk95jyq/8gOHGVLc+/al?=
 =?us-ascii?Q?c3BUt+4UNcbyy5v8r5xNjXEzY9rAYju6yjo8EyniZga5aY6SR30TldTaEs0w?=
 =?us-ascii?Q?g1b6qHxToYvaGj/XC1HOoDs0Fwmkuk6NYd2QyPyct5DyZ0c9czT6KgVRbn6H?=
 =?us-ascii?Q?8xOeMlR4ST6OSzz7zE6Qjvgx5ntIG/hUeO8hPM5r2oq3YxzdQ7LltG7IGy3O?=
 =?us-ascii?Q?2oPB0Ls3oaOfoCNI2GMiqyMLpyb4p+weLv+jZI6oKxAheuvM7uV3SKxjrcp7?=
 =?us-ascii?Q?aEcaxBxBILj5ebbWl+zxbaxthOO6u/h3OOS64jW7RIO7RkqDYUQ/ikTMw+9X?=
 =?us-ascii?Q?xYNC6efZK2vVbxB+vHVHzRSjFuhYDyYt+IgnzW3n8RVN6PVqKMpDhqL+hnAl?=
 =?us-ascii?Q?UVU9naLIOJ81gQB2eNpCHZ0V6rsoNcMwZr1Khe7j9/DQzXHFHhE8NMs1UdXV?=
 =?us-ascii?Q?CnxD2lwNBvcVCPSVr98kdvBK7LySOdnvHaR/A3Ev9yp/h8lJP/wzbagWtOcr?=
 =?us-ascii?Q?dauoBbW4XNzhMDFs1xsPomBBu8LsV2qt5Qsh/Q/Zjvy5+fuOD0q9EYcRIIfP?=
 =?us-ascii?Q?Lb+TWJbBQ4kCNlRTaPSobUNNy9sZ0MFzwEqzUEJ2cCsLlRn0F9PXzSMc2Cph?=
 =?us-ascii?Q?zb5rjVeSNCPmksPR74Ie3GLMU1al2auTEf9TloOMKl6Z2ZISurfos96Z46oV?=
 =?us-ascii?Q?NxTANptuQira9Z/VdQd0WlJUS9HLpAPAKMZr5e48edVDSCOwqxVYwSSqnXgR?=
 =?us-ascii?Q?nAi+AeSu2MVz3DF62rl16C5/1s7+6dVdY49C7t6OHeUsLz7fh+WcqSjJGBJz?=
 =?us-ascii?Q?sJoLUUjuinMZkbs6ShsqNu9wRx0Engaj?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?t+wJI23nqidDaxXgrRcoVgmJtMbSocsmeZxTM+BfqeD/av/hPrAOakhITxq1?=
 =?us-ascii?Q?aSEf0g7gV1Gwo9Ep0NrLHzf9ZC0Mu9ABWzxpsVonrmveUD9oLBtJXUuChlJd?=
 =?us-ascii?Q?nr102I7qjA/Y2mHg6uKJjjEmmNJKcyHbOk0jwa0Z9Vch5lmmxGaE8DNLym6N?=
 =?us-ascii?Q?DDNLOwT28bPXazA8KvTCsEzZf8Z5yJ25tTL9xm5jvWIXeLnb3FRvs/8KDkdh?=
 =?us-ascii?Q?jZ7GLPicEKtqHW4a0ykSgOoyRdwFg2n9IwRNmRF1dWUxTCKMFLltOfF2UB1w?=
 =?us-ascii?Q?uRAJktlG42u0NurR9//46CZbQt/qK+v1N5lsZOe7HH5b3MDCx1Y4ewrbCOkq?=
 =?us-ascii?Q?nYMp5otzv2brAoLLTSBBUTNhofTupyGjeRfBk2vx6G4/2ygdHFtEzzwARpA4?=
 =?us-ascii?Q?661W2cm2sDdhINI9vciBNNLKoYSuQ87ViXxOIxih8gLa5zZcKiN0fbXGtLsp?=
 =?us-ascii?Q?+XnT2uONv4IsQjtLTnxoNAEIkfyw5o56yu35Jcba2MK04qwLOvtDfiHpnbbg?=
 =?us-ascii?Q?Ox5SoSgTXVISJcvlz61li1ooT+x8EgthKfwDDubwR5yDqa3zIN6+pR4s3wqO?=
 =?us-ascii?Q?Olncwj88FJvCRpYqyPcrlydZpoBOki1eepLicGLAVDsNvwOOHENUVVce7KqR?=
 =?us-ascii?Q?Td3mAcI/Wl8B4TIeYJDLdtfwNfCtnJBKPICIRjt5b6Q3Sds8BcnrSjSV2Hxh?=
 =?us-ascii?Q?BH2RRq2CF28FzsiyEfk2oVhSOAQQFe9wjbzEVFyfhC+FYxJ8KA29FFGZGeUk?=
 =?us-ascii?Q?eSh8eJRcaoTPrnYRRypdwjEQIiLmI3iGMQ2uz4ygn48P1z+ZD60S77kIMVBO?=
 =?us-ascii?Q?RBKBFNFQGpyHj3nfTxkY8rOT6uUm2lQjIro5sTox8zlTdtrf1qOeFDYerix7?=
 =?us-ascii?Q?cDJFJnZCCWahvPltpLFzGs9MVo/DGtGFkc5V6wSXjgSb2W7XoZOzEekQVo+s?=
 =?us-ascii?Q?a4wQzjF042c0fKsCimBKJSVyh5ZiAAy07CA5J3H+7OgV/eXVszyBBtUiGQXW?=
 =?us-ascii?Q?RY9Pvi/XKWoiOJ/EMl9b47Oi3cjFeJZ9OYPlfrybdY43MF+1LZSx5zK0GArM?=
 =?us-ascii?Q?mHENm+UVfk6uZmd/nTJ0FUfj1+lOmRDtUbDYD8IHkMlOyL7Kz6yHPP+hMfmP?=
 =?us-ascii?Q?KOyuntCyyVDjTZ5sBXRNWIDVm5kR3ZkCdpqo8EVT+YEfzIIW4QQqDx/skxgN?=
 =?us-ascii?Q?xy3soVpFGhINyUwliLgu10VFJdHv3LhXA6+d3u+3yUIinaM7F9F+U8FFhH0e?=
 =?us-ascii?Q?libKVs9j/rA2/CffwwP/fWNBBxztxiLz3vHFBB5AT/hcSLOEiN8Qo1BE8UMw?=
 =?us-ascii?Q?OmLeMDvTl5XXD1fEQysJgX0vX0NT4sBNt1oaz6cUQzz0tLdp7NyAnSxNxfW5?=
 =?us-ascii?Q?p09WESVELLY3da/4EqhSamQBChNAsNHa/qRdxRGea+gE+Gz+KwpiPsXBQt1i?=
 =?us-ascii?Q?qR3mhsKlRkjgmtEIKwDaONbLYlCo99N6oP5GSdjnCfpARLav+Xmdkh+52b90?=
 =?us-ascii?Q?8ksn985fTMJeOqwlwa58strbtlTuJ6Z94th2hpqKc6HOzAA94qZDJOlHLCZ0?=
 =?us-ascii?Q?FDyss9ZGvCeYQDsTed0u3IWKqQxtExcS3IRvnm672zA6Qr5rc7eFWJtO6+Vd?=
 =?us-ascii?Q?nw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b670e578-b668-4015-c320-08dd700de19a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2025 04:38:27.9505
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oi9L0iXhnvF1Dg4zzqVTivQUgLKpIr2yRoTEzq0fyH+AJnbwpEeagl27uOV/zbfpXAdO+0hlLctEaeFNILi5lWJYXxHIQKGuW/OySLso8v8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-Authority-Analysis: v=2.4 cv=C+npyRP+ c=1 sm=1 tr=0 ts=67ea1c45 cx=c_pps a=BfiT+f4K8gVEfImFRIf1tA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=2ekUlhpUPfvdi_zIjIEA:9 a=5jj6Z5E1gPFHsPOh:21 a=42jQ_h8IXvAA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: YGc5NkpccYSQX7SilaiXYA2EGR-vfBDF
X-Proofpoint-GUID: YGc5NkpccYSQX7SilaiXYA2EGR-vfBDF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_02,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502280000
 definitions=main-2503310030
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 31 Mar 2025 04:38:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213929

From: Yash Shinde <Yash.Shinde@windriver.com>

Rust stable version updated to 1.85.1
https://blog.rust-lang.org/2025/03/18/Rust-1.85.1.html

Dropped patches:
downgrade-bootstrap-cc.patch since it's merged with v1.85.1.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |  2 +-
 .../rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} |  0
 .../rust/files/downgrade-bootstrap-cc.patch   | 41 -------------------
 ...ibstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} |  0
 ....85.0.bb => rust-cross-canadian_1.85.1.bb} |  0
 ...ust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} |  0
 meta/recipes-devtools/rust/rust-source.inc    |  3 +-
 .../rust/{rust_1.85.0.bb => rust_1.85.1.bb}   |  0
 8 files changed, 2 insertions(+), 44 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.85.0.bb => cargo_1.85.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.85.0.bb => libstd-rs_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.85.0.bb => rust-cross-canadian_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.85.0.bb => rust-llvm_1.85.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.85.0.bb => rust_1.85.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 6d6c146284..a3b3df2afa 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "14.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.41%"
-RUSTVERSION ?= "1.85.0%"
+RUSTVERSION ?= "1.85.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.85.0.bb b/meta/recipes-devtools/rust/cargo_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.85.0.bb
rename to meta/recipes-devtools/rust/cargo_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch b/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
deleted file mode 100644
index 3ae68720f9..0000000000
--- a/meta/recipes-devtools/rust/files/downgrade-bootstrap-cc.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Downgrade bootstrap cc version
-
-In rust v1.85.0, the upgraded cc version causes bootstrap
-to fail on custom targets. Downgrading the cc version fixes
-the error. This commit is merged with v1.85.1 and the patch
-can be dropped when upgraded to it.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/137460/commits/e4ca11f87ffca8c63aa56d45b46e62b6acc58bd7]
-
-Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
-diff --git a/src/bootstrap/Cargo.lock b/src/bootstrap/Cargo.lock
-index a47f3af60cb..890e64e2bab 100644
---- a/src/bootstrap/Cargo.lock
-+++ b/src/bootstrap/Cargo.lock
-@@ -88,9 +88,9 @@ dependencies = [
-
- [[package]]
- name = "cc"
--version = "1.2.0"
-+version = "1.1.22"
- source = "registry+https://github.com/rust-lang/crates.io-index"
--checksum = "1aeb932158bd710538c73702db6945cb68a8fb08c519e6e12706b94263b36db8"
-+checksum = "9540e661f81799159abee814118cc139a2004b3a3aa3ea37724a1b66530b90e0"
- dependencies = [
-  "shlex",
- ]
-diff --git a/src/bootstrap/Cargo.toml b/src/bootstrap/Cargo.toml
-index ed51862390d..2c1d85b01e6 100644
---- a/src/bootstrap/Cargo.toml
-+++ b/src/bootstrap/Cargo.toml
-@@ -37,7 +37,9 @@ test = false
- # Most of the time updating these dependencies requires modifications to the
- # bootstrap codebase(e.g., https://github.com/rust-lang/rust/issues/124565);
- # otherwise, some targets will fail. That's why these dependencies are explicitly pinned.
--cc = "=1.2.0"
-+#
-+# Do not upgrade this crate unless https://github.com/rust-lang/cc-rs/issues/1317 is fixed.
-+cc = "=1.1.22"
- cmake = "=0.1.48"
-
- build_helper = { path = "../build_helper" }
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.85.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.85.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.85.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.85.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.85.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e07055882c..8400a4875d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -8,9 +8,8 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://revert-link-std-statically-in-rustc_driver-feature.patch;patchdir=${RUSTSRC} \
             file://Zdual-proc-macros-additional-check.patch;patchdir=${RUSTSRC} \
-            file://downgrade-bootstrap-cc.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "d542c397217b5ba5bac7eb274f5ca62d031f61842c3ba4cc5328c709c38ea1e7"
+SRC_URI[rust.sha256sum] = "b1fbf809efe9f036939401e142631c201a53bcf43ec1696bd9f5290ba236a266"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.85.0.bb b/meta/recipes-devtools/rust/rust_1.85.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.85.0.bb
rename to meta/recipes-devtools/rust/rust_1.85.1.bb
-- 
2.43.0


