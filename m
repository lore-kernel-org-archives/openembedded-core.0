Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D428FCA5FAB
	for <webhook@archiver.kernel.org>; Wed, 30 Sep 2026 05:43:08 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6947.1790746971951675773
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 22:42:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=RJiYWgbv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=47337851c1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68U3klkY2173176
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=uV0ODvlBY
	3J2Dl5MRmtEcXWPZ5rdumjHD+eAQTO9T9M=; b=RJiYWgbvIykDVZ3KexWn53JW4
	6DbBrlqwuiRFlt5Mc3Hkq321vtSsfiWJQNsVvld/0HSe5AtHUha5t2U2YH49F1Q5
	vF+6JO6JdP1bJkCQC1gLQAD1qBppERIQMZSmC7rA5+D0/8Q8yRdNFyslFwLvHGQr
	FKfkERmhMBw8Y7D7t136KrxVuRNB3BDJ0jqwEYewBqZ+lxdM+54xRHqHbeWd0gQ9
	OjLXlKjOcCwtElMo/D8FT8jcguxqQw5ohOj0Ip9vaH7dzt5YM7Ka+563LypYqski
	S+CxjnDOine6YLT7ozjKMc3KcchiMr0qyc6ovsR3jqBBwtGptZpYobPUtPUEg==
Received: from bn8pr05cu002.outbound.protection.outlook.com (mail-eastus2azon11021092.outbound.protection.outlook.com [52.101.57.92])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gx38wdxus-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:42:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bWIXe5AbgTV7IT82nZPjOFIkVxlE2k4SLwMt4Q3MoLDzBG+LDxZ5eAScldtJnPRLSQxuQDvVz9+cEoWxyx44N7axXTgKGXR85diZriPyI0TrGht3OuIXq28CvhiLXne1CfcR6kOgs9TzzCBCEhw57t1pgDcAk4jW2eStxxx9zqVhXQod8brNVXD7sxD7QsqiFMLLcESi//BGuA2dDvR7L7zkUO9OlC+wmwnortahJwTkW/dIiucE8k5fDQZiBXw+nOVEuYeTqmSF7ttFpNWaKfI9faG5cYghFDsqb0psLGL+Bf7qGM/jntHBlcT7bOD+0reJsdGaAPVk7H6WUsetxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uV0ODvlBY3J2Dl5MRmtEcXWPZ5rdumjHD+eAQTO9T9M=;
 b=PldHl4mZ/5wgaktxzF8jEZzVglpCzJnFmdPb0KYWCyBlPH14YyeOV2rho8MQXtD+uJHlXKQUIpyccf+xD9sosGZA9vec6fSFdtK3aqxxJrUR/oEjIYGHDJe4pLis1enITtb/DmtF4J+O7mXScZ4aTZ8lR7UVMw1BsUf2WAbIkU9qRa6GQI1bF+r/0c9QM01dfnya9URuEjGFrjbfpF/jXkUC8e3OZqYGrykfpAIv5A2WzvHbqT/lkXeNpLVw5fSs4fdZhiJPEpVCyTVTn0GTz6TlCKVfg3RhjZy29wzqaaY1uSiaV4pwoFoQV8F3GrsGZO/TeBntGv/O+8VyklGL7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DM4PR11MB7328.namprd11.prod.outlook.com (2603:10b6:8:104::9) by
 PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Wed, 30 Sep
 2026 05:42:47 +0000
Received: from DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86]) by DM4PR11MB7328.namprd11.prod.outlook.com
 ([fe80::26e8:ea57:9a33:9a86%4]) with mapi id 15.21.0451.026; Wed, 30 Sep 2026
 05:42:47 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [RFC] rust: Squash rust-cross-canadian.inc into the recipe
Date: Tue, 29 Sep 2026 22:42:33 -0700
Message-ID: <20260930054233.1573937-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::30) To DM4PR11MB7328.namprd11.prod.outlook.com
 (2603:10b6:8:104::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7328:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: 201b9f6f-3696-4d5e-d917-08df1eb5a828
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|18002099003|38350700014|6133799003|10067099003|260925022911599003|260925021911599003|260925021311599003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: 
	7ESOqVF4RIEhaUKIV35wANV+N2GZ1VLGb7+CTdHHU4dLmj6EQxoJZdif3pLMHFeSUYk3AGskIwMhVk52zeYqbzHooJgNibjkSXyYQlz5oNpsN4pMKNKyFEIBxLNy7eY7OpHf6T+/RMWfRvLd23nyIla9nNmk8+PXiW0wPqlA74PrZI7FeOOq/H7+mOROHwKzicGgvtqKT0xKqTaHznrLXS9YQWi+LwTjxhVO0p8+HCbqHACpoRTZ7s1fPCdnqkhswc1GwtbrmRqchzGhvfQvVkmXwDYX1reJiOzmuIvkG2y7ZV+yMq6j9v6iSLlJIC3sHs5MH1aw1m622Rc0YUl+4SEb+0chuJj9u0bLvRk65+/RpFmKVGOPGJqwwvlenrrGDS7jMcOu/7L+3vOneLaOYEthOazWRnFKLkezujcM1NxYJtwb1OZCOodrinxPPqu25wQ4mEtZakbJF2wxqWz6gcCXX0+01JAOdHFk8hvvlK5z/5GjeqvK5m13vthsF8rh9AQeaedTAvI5GRR3gJSLXUBsswsaDD0CewfkjvSnVYM3E5jpKhAJtqOJSOEz9/8ICtMDdtqeD+aAe9T9f+T7Au9om2W7krBIlaCvf8bc0qFugGr/AKwx7sWZhC8CXL7HseiEslfDnsvpO+lltb8w9kvHjhlSx/AZX/N7HmUfpuw2/O3d+EvVSMJZOOfiswZ3p1vGO1OHbA7IbTq1cyIwHaeqVUtROThU3hhSHPsLYZw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB7328.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(18002099003)(38350700014)(6133799003)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(56012099006)(11063799006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?iUkAaNYFi7OSszljEv+Xc1OycOfFlAZenHyFIY0zY17Dax8KsI62zR9z/B8A?=
 =?us-ascii?Q?m+jA9N+pqfKJ10GpMuImknc9vjhJv88c93UXTxxKQIzaye0xM9Q2P2EjDMB1?=
 =?us-ascii?Q?eoI5DWwj+ixGHSG6jVlF4RGfZvieSyElFtI+yVYa/aLWgwbLF00Eh1OfRId2?=
 =?us-ascii?Q?X38J6bXv7ETC3ifa5VwedgSwPUK2Hjx46yJJ8ALuxzgAxFNsOZiz0upzegBH?=
 =?us-ascii?Q?pY55s+VORh1c33W3NHtut57V97deiMgRB5wD0dtGDLLxOGldsGVI72U9cwWp?=
 =?us-ascii?Q?tjXJ7+FS7TUEyTsV3nYOPtWIrcTrkLrtZQz+/8YzbcGdn+YwIMd2mMBaqcBd?=
 =?us-ascii?Q?hAWyAyn/y0Sk0vDMUM2KHi6BSMHnUEmsM3k+0qE3LzWUbfWommaiyVA1hrX7?=
 =?us-ascii?Q?41qU7oOiqkjOdhZ8ZKLhdLLxWgC2BElDPvs/yYeuWGxsFNPdgixP3l7ScIKk?=
 =?us-ascii?Q?hfXyHdDEZuA7A7Tgv29lORJPR5G72UfoI0uWc/ua1EX7ESzYpLAPYMaN/9Us?=
 =?us-ascii?Q?47lhuOmEDT1VueuUo1FrshABgqUSYmc18C/Awnlx9MbR84qf/QVLGcmm2kfl?=
 =?us-ascii?Q?hq+07OpfLBoQpmUwhxUGpBhJY2n0S8FwV2g4SdO3HpAL6dFQ9ixZCn3APLXu?=
 =?us-ascii?Q?O1biS0sxyN6hs9A5ePUWY5NY8knJAYAV0nHQFJqdU5VpSKooodVanvEom37n?=
 =?us-ascii?Q?De82WdPHoePWrPhaeCyo1TAwfWPyRhHNnMkV6Ec4Vv2xZ9Vkw/heMvMAV0NX?=
 =?us-ascii?Q?fmkwnnLIVvICRWqGOWxjZRajWF/ATVko1oupvE8k5iOhDwxg/rQvcrXHz4/3?=
 =?us-ascii?Q?7zIfmA0FiTGv9Wx0ra2s3VBwwRa/kUd/X4gzI9INkScLTmOnbjn5A7CdoNst?=
 =?us-ascii?Q?OE9Y4w3TbBCKIp1jIxR2p/xxY+ygGwWaJ188A13WaRNm0YMXcU/QJz55Rol+?=
 =?us-ascii?Q?JCRvg5BG/Ph1I0ZjFd67Kxlib4Pbozs/WDDZm0z/sNQRzIYAU89RimxLPyzv?=
 =?us-ascii?Q?IF7UEYOfLbLm2oJyzRA61LBQ5XmsVHm/weOl9xAqQyQTz4xi2gWFDDqZbJHU?=
 =?us-ascii?Q?4o35Vh2M71mOAPUFWI0I3RjyVzoWeAGiz672ujhwD6GDiR12EHonRR+95Iv7?=
 =?us-ascii?Q?c1Soh3pmkLwN5UIX6Le7Or3kORzKgre5JNw8z6SvgCWocA+S3welshRah2z9?=
 =?us-ascii?Q?hqUA8zB3VNDDm0T7d/7Q+eZoZMshe2zNn3gJa6j+Vd4do96k4iq4sCvRewjc?=
 =?us-ascii?Q?e1YwkbnCrmHv3JAsTLIueexsw+OAsovCLTtX9wzqg5u/Rq0FV9Llg38c5AnU?=
 =?us-ascii?Q?9KwQC6cT/IrT5mGpYK+WGFYwqQTl95OMXQO4mshI5/t8e0ZXbmCkAXUZ1Yz5?=
 =?us-ascii?Q?e46Ah/cj7GGVSs0Fwfi4HuMS0maclM2iNzIzgFo86RQZXuDcutIpo3QmJHu1?=
 =?us-ascii?Q?P6624CdYR+iRvnRM8O+9+JsT1K4h6QqbUgcdV9eWf28Od1fUVUTaAsui9DA+?=
 =?us-ascii?Q?5SONfVFzbWNW8M7+nYa8agS21+Giq+0cR1gyp+r8RZtAhHw8PQpf631TO687?=
 =?us-ascii?Q?hzGK4lfpxkPkHXKhzXU9xfu6jN/FulZ+HbBRpC5IWmo5FP0nBaRt5VG07XDe?=
 =?us-ascii?Q?TA1wa+z2U8upGP4Db5+7YuV87CR932Na4C4iCSQPpdrGiSIJFCZrJol5NB45?=
 =?us-ascii?Q?5aJ946kkUCtp5IzFKCKSjjauoIrBQXnKC5e8TYmhsgJMMdO455dhZ+asImay?=
 =?us-ascii?Q?Njz1Tfu7eXpu8wwOtHU50pazlGxIina0cUjLpXkrbGC+BWznWYkR?=
X-Exchange-RoutingPolicyChecked: 
	egaG1Wl9K80Sgf+7D74UGyl236nccwHnb/JK2IMRolleBA66u7n0dPaJ7vmzWf0KTSWZ6jVQRcGD7Atehxz7VhvpvXtw471V35aVwQ6VrP74upiMq6CBi4DmahCueKatEXv6Owt3rjOR7Fs6BN+HaYSZYEB1DjocWa/fQdeYnQN8U37dQw9HScKg2Z430O1yMMGFkXRqpPVLrFrE9JAGKd3LDOeLiTbh2eoK/P0dTHfXXr+Ze8oNGjWj9rzWCcQBaYCsZTfHgRIWChIy+TOQwzSAI8vJ+l28qQWnF6nZAO0O07PHRRhSCtsMAU4xdmSyUkp8DBIRnnfnOuAuDMPRUg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 201b9f6f-3696-4d5e-d917-08df1eb5a828
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7328.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 05:42:47.1192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lwFAAL5CX2sg8RafZ8wKSBB3dcFsHEJIVvSqEAjD7c5kVTxLqMr68NB9tMUTcvU2etyDNkFcUOtu+XuFgP7IpEkkW7Jck20C+DIOFEqq9DTFX0hTyIw7h4pHPhkNwEf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
X-Proofpoint-GUID: Jr8xAYdgGzLbw66XWT3tye6eiTZMn_ds
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfX1TYz1QsxZe/g
 IBy8XwZJ4nQehM9zcpc6s0tjcrwSr1c3Y6FfYD3vyn/Af5BDe0pNzXEmypDC3eDdY5PbT05joK7
 ccYy41yRs2KceEfA3FxQznyJe6kXR7ITHugTM8QyaQhSy8Aix1FUOAFqaQTjgyHbK4opmyksRuQ
 qEu13DYuiXpZQJONZ5Evgp2xqvp5KZIYqck6MkjisuIaPdyjv3IDkTGptMChleYTWxAfdpGPBK/
 biLVETe23iJJmGpkU0dhduyhPZ3phGzFyCipNMu3JmuYGHrSkWJjaGyQLIKuKOlm/MnM265MDHY
 7X1op2mequ3Sn79uX6J/929sq4hNlQhG1IEwgpcAi5BxWEbEn7vTdhQiEcsbl0ZQmr56a9ndmx3
 D1E9dYIOY5/LFjaSUOEAB4D5cgnKOl63v+wExyqB3xkLd4q+pX2a/M3jmFHtNQz3m6/ywIiMl0A
 7Wjxvco1fDUjm8Dt5ew==
X-Proofpoint-ORIG-GUID: Jr8xAYdgGzLbw66XWT3tye6eiTZMn_ds
X-Authority-Analysis: v=2.4 cv=ZYSIpcVA c=1 sm=1 tr=0 ts=6abca15a cx=c_pps
 a=9avcgsFImRxvS4DvMwUk5A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=t7CeM3EgAAAA:8
 a=IrU3_hexpz4zClcvkekA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDAyMiBTYWx0ZWRfX6Mu0R3W7/DXw
 q4jEMJCoPKg2dbumZNE82s8RCYBw4Con+i0YnYPTqYW3ZznaXaZGfeeVytpsVz8quMZrq7W2O9E
 1cylU28bSS7PvFvH1L4ki7nZ6V6xugWW7Egx5CAPpIdMMVIugE1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_05,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300022
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Sep 2026 05:43:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246913

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

It was only used by rust-cross-canadian recipe.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 .../rust/rust-cross-canadian.inc              | 71 ------------------
 .../rust/rust-cross-canadian_1.98.1.bb        | 72 ++++++++++++++++++-
 2 files changed, 71 insertions(+), 72 deletions(-)
 delete mode 100644 meta/recipes-devtools/rust/rust-cross-canadian.inc

diff --git a/meta/recipes-devtools/rust/rust-cross-canadian.inc b/meta/recipes-devtools/rust/rust-cross-canadian.inc
deleted file mode 100644
index f083bcda82..0000000000
--- a/meta/recipes-devtools/rust/rust-cross-canadian.inc
+++ /dev/null
@@ -1,71 +0,0 @@
-SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
-PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
-CVE_PRODUCT = "rust"
-
-inherit rust-target-config
-inherit rust-common
-
-LICENSE = "MIT"
-
-MODIFYTOS = "0"
-
-DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
-
-SRC_URI += "file://target-rust-ccld.c"
-LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
-S = "${UNPACKDIR}"
-
-# Need to use our SDK's sh here, see #14878
-create_sdk_wrapper () {
-        file="$1"
-        shift
-        cat <<- EOF > "${file}"
-		#!/bin/sh
-		\$$1 \$@
-		EOF
-
-        chmod +x "$file"
-}
-
-do_install () {
-    # Rust requires /usr/lib to contain the libs.
-    # The required structure is retained for simplicity.
-    SYS_LIBDIR=$(dirname ${D}${libdir})
-    SYS_BINDIR=$(dirname ${D}${bindir})
-    RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
-
-    install -d ${RUSTLIB_DIR}
-    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
-    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
-
-    # Uses SDK's CC as linker so linked binaries works out of box.
-    # We have a problem as rust sets LD_LIBRARY_PATH and this will break running host
-    # binaries (even /bin/sh) in the SDK as they detect a newer glibc from the SDK
-    # in those paths and we hit symbol errors. We saw particular problems with symbol
-    # mismatch on ubuntu1804 during development. To avoid this we have an SDK built
-    # binary which unsets LD_LIBRARY_PATH, which can then call the wrapper script
-    # where the context is easier to do the env maniupations needed
-    install -d ${SYS_BINDIR}
-    outfile="${SYS_BINDIR}/target-rust-ccld"
-    ${CC} ${S}/target-rust-ccld.c -o $outfile
-    chmod +x "$outfile"
-    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
-
-    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
-    mkdir "${ENV_SETUP_DIR}"
-    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
-
-    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
-
-    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
-	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
-	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
-	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
-	EOF
-
-    chown -R root.root ${D}
-
-}
-
-FILES:${PN} += "${base_prefix}/environment-setup.d"
-
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb
index 55865238ab..64e4f752ce 100644
--- a/meta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb
+++ b/meta/recipes-devtools/rust/rust-cross-canadian_1.98.1.bb
@@ -1,2 +1,72 @@
+SUMMARY = "Rust compiler and runtime libaries (cross-canadian for ${TARGET_ARCH} target)"
+PN = "rust-cross-canadian-${TRANSLATED_TARGET_ARCH}"
+CVE_PRODUCT = "rust"
+
 inherit cross-canadian
-require rust-cross-canadian.inc
\ No newline at end of file
+inherit rust-target-config
+inherit rust-common
+
+LICENSE = "MIT"
+
+MODIFYTOS = "0"
+
+DEPENDS += "virtual/nativesdk-cross-cc virtual/nativesdk-libc virtual/nativesdk-compilerlibs"
+
+SRC_URI += "file://target-rust-ccld.c"
+LIC_FILES_CHKSUM = "file://target-rust-ccld.c;md5=af4e0e29f81a34cffe05aa07c89e93e9;endline=7"
+S = "${UNPACKDIR}"
+
+# Need to use our SDK's sh here, see #14878
+create_sdk_wrapper () {
+        file="$1"
+        shift
+        cat <<- EOF > "${file}"
+		#!/bin/sh
+		\$$1 \$@
+		EOF
+
+        chmod +x "$file"
+}
+
+do_install () {
+    # Rust requires /usr/lib to contain the libs.
+    # The required structure is retained for simplicity.
+    SYS_LIBDIR=$(dirname ${D}${libdir})
+    SYS_BINDIR=$(dirname ${D}${bindir})
+    RUSTLIB_DIR=${SYS_LIBDIR}/${TARGET_SYS}/rustlib
+
+    install -d ${RUSTLIB_DIR}
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_HOST_SYS}.json" "${RUSTLIB_DIR}"
+    install -m 0644 "${RUST_TARGETS_DIR}/${RUST_TARGET_SYS}.json" "${RUSTLIB_DIR}"
+
+    # Uses SDK's CC as linker so linked binaries works out of box.
+    # We have a problem as rust sets LD_LIBRARY_PATH and this will break running host
+    # binaries (even /bin/sh) in the SDK as they detect a newer glibc from the SDK
+    # in those paths and we hit symbol errors. We saw particular problems with symbol
+    # mismatch on ubuntu1804 during development. To avoid this we have an SDK built
+    # binary which unsets LD_LIBRARY_PATH, which can then call the wrapper script
+    # where the context is easier to do the env maniupations needed
+    install -d ${SYS_BINDIR}
+    outfile="${SYS_BINDIR}/target-rust-ccld"
+    ${CC} ${S}/target-rust-ccld.c -o $outfile
+    chmod +x "$outfile"
+    create_sdk_wrapper "${SYS_BINDIR}/target-rust-ccld-wrapper" "CC"
+
+    ENV_SETUP_DIR=${D}${base_prefix}/environment-setup.d
+    mkdir "${ENV_SETUP_DIR}"
+    RUST_ENV_SETUP_SH="${ENV_SETUP_DIR}/${RUST_TARGET_SYS}_rust.sh"
+
+    RUST_TARGET_TRIPLE=`echo ${RUST_TARGET_SYS} | tr '[:lower:]' '[:upper:]' | sed 's/-/_/g'`
+
+    cat <<- EOF > "${RUST_ENV_SETUP_SH}"
+	export CARGO_TARGET_${RUST_TARGET_TRIPLE}_RUSTFLAGS="--sysroot=\$OECORE_TARGET_SYSROOT/usr -C link-arg=--sysroot=\$OECORE_TARGET_SYSROOT"
+	export CARGO_BUILD_TARGET="${RUST_TARGET_SYS}"
+	export RUST_TARGET_PATH="\$OECORE_NATIVE_SYSROOT/usr/lib/${TARGET_SYS}/rustlib"
+	EOF
+
+    chown -R root.root ${D}
+
+}
+
+FILES:${PN} += "${base_prefix}/environment-setup.d"
+
-- 
2.49.0


