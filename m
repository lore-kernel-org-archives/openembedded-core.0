Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49464D5CC95
	for <webhook@archiver.kernel.org>; Wed, 30 Oct 2024 11:16:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.12365.1730287009669548686
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Oct 2024 04:16:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=103381fcd3=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAAeWL003721
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 11:16:49 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42gqd8mu4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 11:16:48 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iZI4oudW4+RZr64tO/kn0e1HjhnA3JtV/wclPlkN3neRINxRPDlGHAdZaWaA6ksLWv3oX/6KpIu9vLnq/xt2UELi5XxjsE56t5kuve9OdOc0OK5srE2TwEoKAf+7QvgaYdOsWemHYeHxPEjtllAEWl07sFZlilGsFx4Qdjh5EYiZnkeQ1Fa5JpKVLrck6efBLT4l15ozySbsb6Ef/HsAvqzycOfC4AKnf4xLRp47QyW2kfOnRsuEjNU4JHKFFBJp7yVUx2EFWuyPD6v7EJ+FeuHbqhA2949klgHi/1wy241k9ViOWQChLkMy3/lWUqR2ib/eb0/lXCp1VsXjcw+TQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BNi4fXwLsVBJeytHiYj78W858Zhud+nk0Ns/B1LCghw=;
 b=CD9aYLHmPfs+ny31j29sqPnEQHvpzukWyh8QlE5zrOYwHvI83CrzfLPsf/DyWSFrh66RUW7R18VfK2fYjxl1B29Yw1WFx1fztC4RPpqYUufiOv4W1lEYmYX2ivDwMt/z7CvHab4Gx+hvCS3mrpzgDaT0Y7G3Z1GV6X8v5Mr2zb1L67DfEmq856tif7xakoDagZ77aU4ztl05BRaixTA+achB1pFDAxSh+56F/2EMdTBwdecPEtp/l+pz8DEzOmYKGAA1zMHSVN2QGMtgrqDWAD2F/afijkSNuxEprJ38meYzZbqyaebkvH31VCyDKFf0IhrnzAnBBX8H7R7ttBUQXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA0PR11MB7839.namprd11.prod.outlook.com (2603:10b6:208:408::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 11:16:46 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%3]) with mapi id 15.20.8093.023; Wed, 30 Oct 2024
 11:16:28 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Naveen.Gowda@windriver.com,
        Sundeep.Kokkonda@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH] cargo: Increase RUST_MIN_STACK size to avoid SIGSEGV in DEBUG builds only.
Date: Wed, 30 Oct 2024 04:16:01 -0700
Message-ID: <20241030111601.284064-1-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0015.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::20) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA0PR11MB7839:EE_
X-MS-Office365-Filtering-Correlation-Id: 3866a84d-015a-487c-4f69-08dcf8d44c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?DqKHsP7+PY//LDWPwp7QmLkz5SCB5IIA3FxPmPLkImKbPX23SAG6kjFRQNsr?=
 =?us-ascii?Q?3HVRzJo9pT0Iyzbmb381dcfXDhzquLj22AiDYA2SSj9iOtduTOoWBPXTTTs3?=
 =?us-ascii?Q?/eDxNWCH/m8A7aib+xUtioCTJ4BzQbBWFPkRyPw8JR7HLEzUGvD7pIBLYyPG?=
 =?us-ascii?Q?OsDYBk3P0yFJhIMcgQiBiEHViOqTyQWxFWlkzm0nFxdVs6gzdc7LH7BOf93q?=
 =?us-ascii?Q?/VLFTINn0gsYX3cC0JaX68aJOLaNjEedt/s7CG/DOxZd2zMebmOA70nWmdlg?=
 =?us-ascii?Q?jJMu2PIUNMVJeRvXiA4yCFSdsr8WMwgx1V2/M1Mboe+6DfuiqC1Jw2ZGAfoY?=
 =?us-ascii?Q?VAO1sOETyrfLRratiMlFvqio4p7RSp+wFJkO+FkReYiM1pzgPcne53W3xxbm?=
 =?us-ascii?Q?ELfZ84+sy+Sb9tvxTJqCpMM4exm0OGASRP8tg6uBSHX0YLj2Vm1kcms3YQds?=
 =?us-ascii?Q?0WPQjI0GqF5c6HEm3SYZL0AzjTWe+EGUWJhKpvLtxKhDUVr0hSFdmUhpjbaJ?=
 =?us-ascii?Q?6CTEHXKkdcZal1Jv7T7GoQijACyefr+tNo0ZH67fxp53CkUiaYYqXK01KaN2?=
 =?us-ascii?Q?Vryyg/n4n2yE7Qt2erKclUEzVnJEes3VO6bU/V2BAdIccct8ookFv/FXtej3?=
 =?us-ascii?Q?6DpirygoyW+E3GU55wdTixiBZNcm0VdAjTtE7tpPyQDKMfOmCH4T8Txy8wcI?=
 =?us-ascii?Q?eHGUFV6rIzRlF6q0TzAWqGhC+UdvkREdRbXOpV1pfvan7Zs2HpNzBGshZwyS?=
 =?us-ascii?Q?07NvfIpPJgtl+For8uX3VG3XvY5oOoHhFBaAwd6Ra8ezLq2wxMOINoJz0QPY?=
 =?us-ascii?Q?4OUBdw7pBVuhCanN8SgECd6WbxgcAlhnGZ5Q6NCkP9//+iHZ/Q4n9PjwMRO0?=
 =?us-ascii?Q?7MOMtA3pTyjXau0KBr6qbXQLbNW03OHYxFDMhTm/KP76NgngzWpfkaxMNj9s?=
 =?us-ascii?Q?xt6EDNDOIIfKCsVXDbLO9Cfp6Y+fkZafhMwFEr0Ks3LOnn6sy0mz5GZfZodF?=
 =?us-ascii?Q?gYXHcuwrsl5OfisMZSDLQM0iQnBlDlPAFQGOfQNuX1LszqYX3n4lgaGjyO7w?=
 =?us-ascii?Q?2dmfU8Z5aOoPrjxMVqzwspc9p/xIhcfSWh54y1phBo0Cj2xW/1PegEmtycvN?=
 =?us-ascii?Q?5trNUG8Ggo4LYLNU6KmAcUZwzXrXXNipX/7VHEAVG7jH1Ppq+aAqQhYxl3EO?=
 =?us-ascii?Q?sRXfiNVYMlyHjIc4o4HoSKibsZBeUWSML3buI7S1aV0TjdKrhnE46sODFTVA?=
 =?us-ascii?Q?vWGPbcL1SZqSKgH2YRboPEygv2mJeo9yoMTkQZc25izgtylf2W/pCBheKIU2?=
 =?us-ascii?Q?6LhE6oO+ez1pX94qPf4uz6Cg4LJrQ8QfaHtZLsx7dpaokw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yCdixvf7Fc7LUV6RbZFLI0H/EZzwMnJOAesPrTcpzYJXBCvk2gJ2DIYbL0az?=
 =?us-ascii?Q?vPEL+3GKHDVoWJHN2lZ8F2czCEILEZvIBZNzGZjXN5Oc9CTzpcUkiy2ILTS4?=
 =?us-ascii?Q?TuLL0FmPplp1t8uz7YKECyIQOu9itn3vjHGAtr3euKNbQbKcbeXz83H7R3ly?=
 =?us-ascii?Q?u2A/+4qfxgknqm/kazObD2H4TOpAwrAHzwDo8R65XXotOKSj9FGvtDgepeKK?=
 =?us-ascii?Q?3brGjBTU6WkcSFHIgtzr1thyEfhfkFq9pzvBFi5odWmWS5xqBKBn7aL+MVpg?=
 =?us-ascii?Q?M/bHGiL5eH9ZvYdel+AmwdE5ynVpBQCObHK+3jBn9K43vaLTgYjkT+PogiEW?=
 =?us-ascii?Q?tuL1w7yZuyvcHgLhRbQqnHL3E1so72CNz/0oU4CBEulGYqQaFAwQuG0onnJ7?=
 =?us-ascii?Q?/exVyBDSNtmmi1FUhNcfML7U6BXSsQJrHO4HuIw/VqCrc5XORolWRkNIi9Kf?=
 =?us-ascii?Q?ipuvOcDguFpHEAtmC4bCAH3URyk6T0U/csdDVt4qW7ta4Xkg2l7Mnq7baWBP?=
 =?us-ascii?Q?idnUIHfwfZJ2ki/i8WTZ745qS7ch7+fhCW04m4WeAKNatwNvrLADfbk1nQI1?=
 =?us-ascii?Q?1fZD0OOTCZWScqmbL488OsuqDiWWXa9NdYwhCx7douLF9dqGskH0OFPNCzld?=
 =?us-ascii?Q?z6t3uRgottUOwoSTkWr9Xe6EYpcYK/lW/v1Nd+CdVZIXFu1G1Tt3UtHMH68R?=
 =?us-ascii?Q?xkfwbOpZwIYeI7bMJ7eoyPxOWHhJSG4AieRK7Jpu1RSGZc6PGGbz7RvbnDAi?=
 =?us-ascii?Q?JeMtyHrcNed0D+Wxkar320wqvcytu5VUJUP8c+OtFzn6bUn6yyh+yio9wuU2?=
 =?us-ascii?Q?msC/HgLr5zY2HF3uA1S2iakIVjSeO45otfFeZd7tGXBlJU5xwGdW9a1OFgYS?=
 =?us-ascii?Q?VKkqshRrb1CBZRfIbOx4ysEcfzXZu9CNvN6CfiFdO64WW8l/1ZQgBwEiQU2q?=
 =?us-ascii?Q?t6MeyW3ASOO3zivpJDMiWRDy465XZe5wWHbRrfJtwPbfX8Mfy1jmrgikfhIa?=
 =?us-ascii?Q?2x8YRJu7dPlharQMteA4q373GIjX4Q1cPTiRu3A/zIrErrZsgk5XOQ7ZMQz2?=
 =?us-ascii?Q?C3xsPFIxdfMV6fEM9HsK0CRBzoz8/iKtLvHMGSkq7ASFylr6Fetl15iOU+cI?=
 =?us-ascii?Q?lF489lIhlAnjwaVGSILqIgJVAo9b4Uv1+XzG9ylN1DYfaj+nmsaxteAzc2Zg?=
 =?us-ascii?Q?IFCI4jcjxepqU+Z4+vrN6ck+JZWSz4E7WPWR+NBuo0kHpFurEV5o0eZUFbgu?=
 =?us-ascii?Q?o2p4cFmb7AqJAOmHU1Sn+Vdih4rk2kw4PJZU6LTyzWr25ELBbdMWhLXznf6p?=
 =?us-ascii?Q?XovhE7UpYHh9LgLPpwwg0DXeT8y4I2lF/JuGgFIWXNXnUxdfeSXksMl6HSp8?=
 =?us-ascii?Q?Djve4jYJr6yDo5tk2NakdQMa+AHiVlQYrDREpfYAFajW89nSE+rxvx/nMnfW?=
 =?us-ascii?Q?NfRrvnlJQR2Jzm7Kfe5cYt8Z2uqd/yIpmam9bWYg/1uM1pixFjx7sOWLeZ/U?=
 =?us-ascii?Q?pyVyU5J6b3hLsbxno9UWR0dCSsnlocrl02U/TtyIoPRNSFW0WnXPb7N61Zs8?=
 =?us-ascii?Q?9XLPmZD+8gqLVSq2hUelZSvRqmJz8Tn+BNoexRUCmpaEo1ct8wprueIiUJ9X?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3866a84d-015a-487c-4f69-08dcf8d44c9b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 11:16:28.3117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5URzgaF0yIjpmj06J4vVOPMJDxcZC4oMrjTE9o+h5fR/m0W8TqLLxszaEbbhl4eJgOKyZPnGiR+MbH3r7CWqO82s6i0oJQWRvUOuYDf6a4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7839
X-Proofpoint-ORIG-GUID: 8EqSvMVsJojZiR_ge9WJmY9G1UMkZw9P
X-Authority-Analysis: v=2.4 cv=dKj0m/Zb c=1 sm=1 tr=0 ts=672215a0 cx=c_pps a=DnJuoDeutjy/DnsrngHDCQ==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=DAUX931o1VcA:10 a=bRTqI5nwn0kA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=5ZsEOnIs4V0YRZTnRnwA:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: 8EqSvMVsJojZiR_ge9WJmY9G1UMkZw9P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-30_09,2024-10-30_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1011
 spamscore=0 mlxscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2410300088
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Oct 2024 11:16:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206547

From: Yash Shinde <Yash.Shinde@windriver.com>

For some Rust crates, like building p384 in DEBUG mode, a SIGSEGV
is encountered as follows:

     note: rustc unexpectedly overflowed its stack! this is a bug
     note: maximum backtrace depth reached, frames may have been lost
     note: we would appreciate a report at https://github.com/rust-lang/rust
     note: backtrace dumped due to SIGSEGV! resuming signal
     error: could not compile `p384` (lib)

WARNING: Backtrace (BB generated script):
        #1: oe_cargo_build, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_compile.3262358, line 193
        #2: cargo_do_compile, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_compile.3262358, line 165
        #3: do_compile, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_compile.3262358, line 160
        #4: main, /home/poky/build/tmp/work/core2-32-wrs-linux/cargo/1.79.0/temp/run.do_compile.3262358, line 206

Setting RUST_MIN_STACK to 8MB conditionally for DEBUG builds only handles
the stack overflow and SIGSEGV.

References: https://github.com/esp-rs/rust/issues/214
            https://github.com/rust-lang/rust/issues/122357
            https://github.com/rust-lang/rust/pull/122847#issue-2201254359
            https://github.com/rust-lang/rust/pull/122847/commits

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/recipes-devtools/rust/cargo_1.79.0.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-devtools/rust/cargo_1.79.0.bb b/meta/recipes-devtools/rust/cargo_1.79.0.bb
index 123032cdf7..4917b25c0c 100644
--- a/meta/recipes-devtools/rust/cargo_1.79.0.bb
+++ b/meta/recipes-devtools/rust/cargo_1.79.0.bb
@@ -37,6 +37,9 @@ do_cargo_setup_snapshot[vardepsexclude] += "UNINATIVE_LOADER"
 
 do_compile:prepend () {
 	export RUSTC_BOOTSTRAP="1"
+	if [ "${DEBUG_BUILD}" = "1" ]; then
+		export RUST_MIN_STACK=8388608
+	fi
 }
 
 do_install () {
-- 
2.43.0


