Return-Path: <Hemanth.KumarMD@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F84DCD98C7
	for <webhook@archiver.kernel.org>; Mon, 15 Jun 2026 11:12:24 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.127194.1781521933075236516
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jun 2026 04:12:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=SKcPD5gy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=06262cd989=hemanth.kumarmd@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAsg3U685783
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ujjql9r1y
	mTfXTtZwCP25s0mn2DrQCElfS1MXFL8UbA=; b=SKcPD5gyH0YgZYdhayDX8Nos5
	4M9vVGC0mZznyQ1JhBBy9IxsCRG3jPSt+dkFRyk0i9TbWn03O11nT89ioNAZ6v1k
	2YPP0A+NEflmg1QMHt62MntTYlFERM2yl7hGitoJJUesBcjgH8CF/iBapyuO7Mxl
	Ll5hEs67dyz2H5XvKxqld76gCOC9iRhGf9yxT3cg8W0U//RxqR2G/3NR64Yy9OUq
	uyyLzvC1E3XvRT1kMmffrs4jpk0gOcQJU3Q91rU9Ux8YA7R2sY0QVmaTYdNPIaAE
	Opy6Suh5tiYnkHTIFjGpJnzMH6FRX/ox2nNPnhq6obrN+jLYg/ORRGtwdgVFQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012060.outbound.protection.outlook.com [52.101.43.60])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ervkp2mn0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:12:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIhJSst9dE3H2z8SAjrWRoOYaIP2KFBHq9Me+xVjL+YN65+/RIj6uHmjcwngueSmvk9N09FEkoUwbdSu2nvl9BbETIcKa1oICO2seuxmmSl5TLTn6k7RQfoNVW6eCdtod2oj0FZMuIytFKtC+HDNwRNQi/sckrVEkO1jbu178/RMWt7P7F0u/HlrOQou+xKGw6HzsVQBDiLtUXPuQkcKg6yZma60C9fY1H1DN9OQ1PlzVLK/vGQW7wfjjffEfWel9b8HQW48cSuRr3lrl+kZ6J2brusQmmdN98ZeAS7FY3oeJJIH0w/bRS6XoZtMfloeCJZZOTd3LMXGp6lcBW1FUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujjql9r1ymTfXTtZwCP25s0mn2DrQCElfS1MXFL8UbA=;
 b=zT+sQA77VqGmQQssmXlJI9U601mT6H+aTD2xrcKx8Ce58g7tBDidQAcdNl1DvpLYmXlRRqe7I31hgMOxzEO+jZjykvsGuD7PE6H0EIPHvH5TSVdm667kK/ePtpb0hZl+rmfiWnaDi5tZyhy1AKYEDjFxe0mXvZiIjHiYkbuaNmQ4ICCKQXH6otuRQGlypGjlx0/ZY51yOAD0Gcvh4oqck4eTLTmuQkt6iCrWY3r5uJsgNAaXuQHGR2LLFanFExBcOyO91dLGwFy6DCUIsZeE5p7wpsl+RUyX2GdDTFt4dScQ0x1mvABJADWHxWVxQy+SlUmQUB8ZlofnmGeQYEs/nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM6PR11MB4564.namprd11.prod.outlook.com (2603:10b6:5:2a0::7) by
 PH0PR11MB9703.namprd11.prod.outlook.com (2603:10b6:510:399::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.16; Mon, 15 Jun
 2026 11:12:08 +0000
Received: from DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe]) by DM6PR11MB4564.namprd11.prod.outlook.com
 ([fe80::21dd:5cab:fc47:1dfe%3]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 11:12:08 +0000
From: Hemanth.KumarMD@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Hemanth.KumarMD@windriver.com,
        Sanjana.Venkatesh@windriver.com
Subject: [PATCH] binutils: Upgrade to 2.46.1 release
Date: Mon, 15 Jun 2026 04:11:53 -0700
Message-ID: <20260615111153.79211-1-Hemanth.KumarMD@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0119.namprd03.prod.outlook.com
 (2603:10b6:a03:333::34) To DM6PR11MB4564.namprd11.prod.outlook.com
 (2603:10b6:5:2a0::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR11MB4564:EE_|PH0PR11MB9703:EE_
X-MS-Office365-Filtering-Correlation-Id: bb8bad37-7b52-4493-8f44-08decacef0d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|23010399003|6133799003|56012099006|3023799007|11063799006|38350700014|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Bt85exVRqZltT1eNN4Zg+0qRq2I6SPgIVsDpNWkF036KkwqeTgSz1x9EJPmwiFFQMQH8r51VF2c9peJ3sXRocgvplWPfQiGeuqAPFKoFiw1D0AaddyxVjsjsk2+vGnfEzQpteZZxOb26qRIRie2QJVoJM8i+POic9UXvtrkKsdRz0yxKUZAG/Mh2eT4uvMRRsRsByHLUXe8BNAsIdUrraDvQxKjmPqBCsHGv0lKA6E5HX3p8YjhpdEOxYadgl9HaimQOZbDE0M45KvV1mKFyOsz+XDVGcGJQmxY/6MrrBTwhNAHT+iV4hD2TUT8F975Pcq+iGVQMqE711tAebybJeeyAcgqqsAfTdYFY1wY/d3Yy2LAT1gwvW73dkXMyQ1MvZbNAXN82ms87iCMnaicwr/fTYACot/ncoh4Op+hllWfhKLpMSTAaIEfoCcSYueNzumofEcMFyo0Vf5nAXM094DwchP3oDn061Jc9wIbgMn/kWQZKiAwoKaDsUZUV5bcaQMUQ/ZCHJi92/7SYG9vhUrc9ZFdsEqTWXxZi95TYVVi7jgcJUWl2CEIswUkdWa/UOS/QaXfW4jCGFZr9Fvf3VEhp4Zi2U58v5nA54JdDiuXco7Y0gJKHzB5PlbL/ZgnPiNKggCg60g6uDI2Krh/2noX8VDQ2LL2EcqXuAxMd1tQIaMlP2tecZCCWiRLKnuekUVGMwDlG8SEHCpNg89JFpO0Zl/yc9QfQjKF3TAFOa/BmNMrCz7zZHBuL8hkBpatQ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4564.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(23010399003)(6133799003)(56012099006)(3023799007)(11063799006)(38350700014)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?jbpIBpB+i6hrxn4j3xRJlMTqAVMVMBUpx6gUTrHwA0plcN3yCDq3mOiDx/GC?=
 =?us-ascii?Q?dRKdP7X6fTDjm4UQXidDLhn2WNRBhNEcSjM2zWOotMYDnFffQEzuuO8FHZVt?=
 =?us-ascii?Q?3XclG42VzX7ECVYJQE7WqF2a9B+tseG1mtbWTsvTFyzO5+fBBL8VzL2zLz5W?=
 =?us-ascii?Q?ocx9SVdNkcqoGQw+5mOjj2RS6rXSVvFgRF4KQjSo8WPhxJ2DTLXZ5wMnU3+u?=
 =?us-ascii?Q?CoNygp9nrcOYbeZzJLNKtP0DCsN43/DXjlkL8qa++FJlS6aN7U06YRlLYWp3?=
 =?us-ascii?Q?iNsTv0h5gCY+UtS/OSso+gF6FATsv+d9R4MZ4Wq5VbXJZFUDSUzWwZ0JP62/?=
 =?us-ascii?Q?FjXDjJkkueGVFpuMQfkxjZL9yDT0PajVD9+LWyY6ek5fdwbI9H2dBfgNtiQg?=
 =?us-ascii?Q?lqFn56UpU8c+LhUPASbtiUiv0PCgytMoxb258/Hl7Xe6aargkpaRdCbRvpN7?=
 =?us-ascii?Q?VR1CWyzBJKVQ7hXb++QFTQSWZqc49z5fEcWOcNvBUH4mRlD7S+VchgMC3BF+?=
 =?us-ascii?Q?7Rp3fasHn79xZaB9S45in/GnlDjXFoYvG2YkOjrJ6h3QsjqWAuJujffzYxHa?=
 =?us-ascii?Q?LlEX/eHFHLOIso8wn/yfKRSpbuxPj5DMicHI6G8ILLkX84hbMbn0IuzV+fmQ?=
 =?us-ascii?Q?f70aHOLyEGW/Qlj3u1pXFDnnE2rRP4RY66fVSGKz3ilmJuAaUF73mqj34Hgn?=
 =?us-ascii?Q?taglElDRxe8xJDT/bGeXVZURz8Ayt0rzaGmj9MxAzljzuVNhcWvJItOBvYl7?=
 =?us-ascii?Q?PIuYwXUrywR8lBvaz5niRV+yiqF7sgcPyuT7YAcrGV0iIpNqmVo7dDrudlcD?=
 =?us-ascii?Q?P28pdYDpSvFabmZerSGriQHVkqRkXscmc8DQFPuR3UqSghGF3HjN6Wj1f3QY?=
 =?us-ascii?Q?UsGdAQ3cKGRSTDaryUIHmjhUKxO+VCnNmXN9+l8ASrioS2pMVcxMTaSIgLi9?=
 =?us-ascii?Q?YWa7uL6Ow8ZsQsvVLsK8tUwKFB3bg2osvAL0FRXdcTSwUzXSllSuHIWlME7F?=
 =?us-ascii?Q?voFFMe9KEMyC8Brtn/YLp0N9hKLFFXckOo+3CkvePI7hLC6f1XEbmLUOFzG+?=
 =?us-ascii?Q?C7JyW1mb2DQ1tVLYCnzkmkAsh3kBRkjZ7CThCW7Cs8rrejfmmLHHeeayHucM?=
 =?us-ascii?Q?IufQUiN5O4BgugPCzXjM+oZyxQoEvY+DlmpyYK3tCNDaEbQVKqR67i9+RMRG?=
 =?us-ascii?Q?MOvsPSPq8aTylOGwNk5hf6U00fLZswvnJDJAIZz7bfGPVFpaLTHNRQABGQET?=
 =?us-ascii?Q?fvvuPhaiKtlIs66JFCOC+oW7ad9PrFAs5mZTTRXCJEk+XzFIrtO/HeESpvhl?=
 =?us-ascii?Q?vLkjG/bizd5bs6Mhmw1kUcvMCwEAoxLUvZ0ozrtxwOduhLVofJmBzR8oussZ?=
 =?us-ascii?Q?t91XEwxcZc1yi14dlA7z4CqyCcIGA8LMlGyjSB4AVZn+6wwxV6ywGLZ5PLDd?=
 =?us-ascii?Q?7BdUlgxiE+QzuHNjwQGefdNzyMCOGptN/Nu19oEbVeP7jZHCw73Nlt76A5xd?=
 =?us-ascii?Q?CdYiMIPL8R1gtPKnenCHptRNjFq4APpccI3W3JMnUXMDa5H9K7d+cPKzsvVj?=
 =?us-ascii?Q?FvpeWTRY2lM0Ik5JIkzmlgqACdJhA/u8FQWIQihJOjKJ+GxfB+aAYeATspJ5?=
 =?us-ascii?Q?1vZt2MnLpNV3WgjBl2a0/nZ8ndXn/kmKK2iF+0BH54oE73UVNsUFD2mmMQWP?=
 =?us-ascii?Q?hfcDA/SH8ObW5+CMtYlkmdtbBRS0JJ0MRF1ERTTSzk26hZdhIB/9GfHecAdp?=
 =?us-ascii?Q?+d3JtxyuqZwtpu3U/Tl9iRQgnPq1rww=3D?=
X-Exchange-RoutingPolicyChecked: 
	EIfO16bUwoA8gwr9InwGLmuv0OPP5sOA6eFq400lLR6T+FQENPhTzan9lCRbKrtMHo/Pz2538V1bRodtzUCLGXlgTkvESB2H8YuEBLFeZfa2J/uFKv/qk6u++T+AL/A6RnwEed5DOTQ12z5+zzZzCUMB+6yZuwm8BvQdtldMljmF46fCmHKk3BOk6O8CzxJCne0DN5czXoU25wVGAUmCuQMxBaWHyrSAlxTaPcUUKg4h+IqRjTyPSXHUe2wd47H1cV1bYiIpN+gjBDQO7GQkAFMc/fcyRXHdypoctEDcDLXz2+RQRjZZhBvkeGr5uyVE4n3jq8siLlw6/494C+2wtw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb8bad37-7b52-4493-8f44-08decacef0d7
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4564.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 11:12:08.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IfHwkOf27+MWNL5YlpwN3Fr5GNx8FmLmh2Ag6Cx1EcEQeEXNGjyJWYGBTGX6+P+Q+SaVYxxNTXJkWTXQxOzCv+9+sxSLQY/OAEySTao2z2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9703
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDExOCBTYWx0ZWRfX0x5qhGyrIo6Q
 VsWplBU70xqsZU0uiY6arjE9+wtzatd/t5jGtLJ9HTBHeoaN/rJnabQy7Z5drBqmNIWfLfvT/W2
 DWRuVN+IxwwnGHEyYu1iLkzXYdHxocFAZsmZ/0XxPZwat9cbMTn1vvNENo3f8ej6eEmaDwUATjt
 pAayYgzXPP2+PhLlffNbURpL9y6tP/8q+qJCjvh6ZedV2gel6x/vEa1ftPATFE2idenwLz0RaP8
 LQ5py7+fSu9+rcTjXmAdwj1AMAgrQPnKNZPB2mv/vy3WAqrx3j57AFfGgba0U8PBRVejmf3jG3u
 UstSoC7icS6vAODtkuaXHqlfEP/VKpfcwsog0jDUBUw6lJ16kJFIldlyUm2ANn/OoBw1FZIQ+i0
 dKJaz/wtwKqaq1T9XgUvs0TUVQybDKdHQWg9SFYX3rs+aqDeuKVK4c8C//6Uo0gsMH9DdY1AHll
 yWIgvaFaJ7gpKKZe8eg==
X-Authority-Analysis: v=2.4 cv=BK+DalQG c=1 sm=1 tr=0 ts=6a2fde0b cx=c_pps
 a=Ie8oki5xhBv/1/1SVvCQdA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=mDV3o1hIAAAA:8
 a=t7CeM3EgAAAA:8 a=CCpqsmhAAAAA:8 a=3f4llrMjj_qwfYf9k4cA:9
 a=FdTzh2GWekK77mhwV6Dw:22 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDExOCBTYWx0ZWRfX2YGNAe1AR5v2
 viZ8OkAeNSqm7lBUfCXa7fO6NH1Vr+1T2h6gH7HVMSeAplX58hqoBlYkpm8WlIytmNHx4CUlBXJ
 bghf35d+J2MadUvI0Nt6SDjtOUfyAtTlL5LlADVTgJg5aoEsByAW
X-Proofpoint-GUID: gj-GhxThpjDr-FnxJmEADgj556jFFW-g
X-Proofpoint-ORIG-GUID: gj-GhxThpjDr-FnxJmEADgj556jFFW-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jun 2026 11:12:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238835

From: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>

This release contains bug fixes for:
* PR34028
* PR34088
* PR34125

Release notes: https://lists.gnu.org/archive/html/info-gnu/2026-06/msg00003.html

git log --oneline 49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db..5e56594815854de5eca35c7c04b11705d0f19c02

5e565948158 This is the 2.46.1 release
a195046618e gprof: fix testsuite with older glibc
4bcbe5932ae sim: fix a few -Wdiscarded-qualifiers errors
66bf5c4dd9a Fix even more -Wdiscarded-qualifers issues
3e4fd1a57ec bfd: fix 2 more -Wdiscarded-qualifiers errors
e7b4e8eb10a check sframe version in _bfd_elf_parse_sframe
e6336a0b1c4 Correct calls to sframe_encoder_free
09a510d7e3f Correct calls to sframe_decoder_free
1f5796eedaf Fix discarded-qualifiers problems in ldlang.c
1d74be61a50 ld: Fix calls to strchr that discard or use wrong const qualifiers
922d530f0aa binutils: fix C23 -Wdiscarded-qualifiers errors
b88558ce1a1 Fix the strrchr error for DOS based filesystem
36ced277bcc gprof: Fix strchr discarded qualifier call
c27aa8783da ld: Limit PR ld/34088 test to Linux/x86-64 and Linux/aarch64
2cd5360f35a ld: Maintain the input file order
155188ea10a x86: refine special casing of insns with MSR as immediate

Testing Results:
+-------------------------------+--------+--------+------+
| Metric                        | Before | After  | Diff |
+-------------------------------+--------+--------+------+
| Expected passes               | 327    | 327    | 0    |
| Untested testcases            | 5      | 5      | 0    |
| Unsupported tests             | 9      | 9      | 0    |
+-------------------------------+--------+--------+------+

Signed-off-by: Hemanth Kumar M D <Hemanth.KumarMD@windriver.com>
---
 meta/recipes-devtools/binutils/binutils-2.46.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.46.inc b/meta/recipes-devtools/binutils/binutils-2.46.inc
index 4948e9b576..13d2a02108 100644
--- a/meta/recipes-devtools/binutils/binutils-2.46.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.46.inc
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "\
 
 # When upgrading to next major release, ensure that there is no trailing .0, so
 # that upstream version check can work correctly.
-PV = "2.46"
-CVE_VERSION = "2.46"
+PV = "2.46.1"
+CVE_VERSION = "2.46.1"
 SRCBRANCH ?= "binutils-2_46-branch"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
@@ -23,7 +23,7 @@ CVE_STATUS[CVE-2025-69651] = "disputed: observed behavior only in pre-release co
 CVE_STATUS[CVE-2025-69649] = "fixed-version: Fixed from version 2.46"
 CVE_STATUS[CVE-2025-69652] = "fixed-version: Fixed from version 2.46"
 
-SRCREV ?= "49d4d3fafa4ec4ff5a3460d91d5b1ed5286487db"
+SRCREV ?= "5e56594815854de5eca35c7c04b11705d0f19c02"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=${SRCBRANCH};protocol=https"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.49.0


