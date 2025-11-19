Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A064ECF3182
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 09:29:35 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2947.1763544569974356595
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Nov 2025 01:29:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=IfG4bkS/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3418937dd1=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AJ7vSDf4100534
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:29:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=jQK/KQ2HV
	oajKcHse5hLVm1GQpQJL+2pN3TKlGT1OO0=; b=IfG4bkS/U94J6C144pJnFPyCe
	EHZIeTLDpnXtQK/Z00P6f1Z8i+/Xzv1Lb3dqkVQH6rby/QNXgXASTCLtN7FaW6pY
	N/Mpe9LvwgBk45wFylBid7Br2Mvrw2LXP4CbW4mEPqhlLIhF/DCBQOMrx2vD3PhH
	utlsRDPNtoIArSbeiCVEc+Aw+VU3X0yrpZiao+sVhhaorYfVYLxGCvcSNBc1MH9I
	SCsYGZp4U/DxjMAGsQaHE05eHsIDZtP0bWL5ralNJg/lo3Eou0qot2khAaQrueXj
	TqGDkhr7ciIEpxF7qK/NOaky1bYbysKYmuHqBMJQCbzV0pwlAe5aOWEviqNgA==
Received: from dm1pr04cu001.outbound.protection.outlook.com (mail-centralusazon11010039.outbound.protection.outlook.com [52.101.61.39])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4aeeqwmvkg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:29:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A/Xwqu3rk5zOSsGwaaVuBgIPN73ZE6LMwXCP0C+e4Szs84YEMB/E3d7+4bnysc2j7w5uN/UB204IgsfryqXn4hh6UwEBohpzqj2anIc7bM4SwupVN1VZqQbvT8JgmpaYw8pxU+JxyTgitGAVYJ+xLMYI4oNPynWHNskkgGOE7DERbQGq5zvUzte0r4OZaDtgQMKu7MtlDcJTsXL1Q8BaePxxASoFtzNth/S3gTsMN033mRUZ3ik5aHvd3+rkaeBcHJpplCVkSkh8muVCOzhxPgwiF3IqWnm6MitwQX3m49lOPPEiFabZd/nMq/h7hmG/cK4U2TRF4e6Vjy1uOF+qmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jQK/KQ2HVoajKcHse5hLVm1GQpQJL+2pN3TKlGT1OO0=;
 b=ouH0tsc2MQVXMjMnfwvBY6GYj4ys/nqrz9KX0UDApyvvCXfJpU0QSpPBDEfPcywpy7LJ4uhF7nC9cL0u+vCkBpvTgiXVoIV/C+Co6RyMVYjqKnmbyyTNZHWb/Rr5m5uV9s5dtB2Xs2MR5sW+4j8eHEXSB7tS+bwhtLt3YwrNh1rMYN6rKbkt5H5opkelXp0VypvXKVTDF9D/z+Wwpricfyd3LHLluOyI/uhreZ8BJmRWSuex16nctmUlsv9+dw/fqQvpjMziK6vKKKDleQyghuVvpV4otKYJmn/18Us626kbb/V/lVWGPuy/ZEMVjT1dmCRaGItcQ7rRArpITkN9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by IA4PR11MB9106.namprd11.prod.outlook.com (2603:10b6:208:55f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 09:29:24 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 09:29:24 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] llvm/clang: Upgrade to 21.1.6 release
Date: Wed, 19 Nov 2025 01:28:45 -0800
Message-ID: <20251119092845.2142732-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR03CA0022.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::35) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|IA4PR11MB9106:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f8c7ac-c9eb-42bb-c0c9-08de274e20c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?RJv6ulQxSTPeVT1xvjVqQal3U+z1HBGNojCe8gKOzW/uVqwfjtG/2LqjmSsV?=
 =?us-ascii?Q?E39shpt06C6mZbypEwXKMgef8W9DG7rSB3oAKpic6pL47f1fQJjeV0daQ2bq?=
 =?us-ascii?Q?t3996n+C8Iy7OUOQ8nW+yaYljtC8pn4HHpPRqAvVezY0FGp5YZtDVOURiPug?=
 =?us-ascii?Q?+y19SJCnSGDFpbb9dydDODt93npR4pcQI6jXdCh+zbUypDF3rY5J4z7eqVKH?=
 =?us-ascii?Q?uIWWKE6hkiGbS8mBrPYC55ZWzZlUJt1bz3FolMFMCev62+T/a+9+6TOPXKBp?=
 =?us-ascii?Q?+UR1qD/CDssPzItyvxiRGE5oElKdi0932zEaHNFicsCtdJOlMBYY2BkktX+e?=
 =?us-ascii?Q?RJoaEgJvb9vp8sRsjDz4GQtp3ueBsQ5GITZqMBA7AL1WgsHE4G9UanZwW3bR?=
 =?us-ascii?Q?k/L6+anPuUxvTyXkrjjBoy8n/UWHp8TZX1k0wfu8ZP1kKThzbJReXyy+mLbi?=
 =?us-ascii?Q?mGPb+Lw0DLXhfQvHFGscL19qp7WJ7RebPUNhiTd75092Ep66eW4fJbPP8lLT?=
 =?us-ascii?Q?yt8KCpIVHKqRZNzbJFTDzCvAXCuXuGXALLjFsvNrvg2aztG+JozF4QuEuR9G?=
 =?us-ascii?Q?uI4cQuevilOyC2PrhOV9zXfLP79T7JhdPpAOzMV4+aFdfy3HQkqnUVHeECla?=
 =?us-ascii?Q?WOvsJdoNpDAFj8W8zmrW7E2102kcPGtbJO6e1BfPuyk0fhdstpSt3X4Y+i9N?=
 =?us-ascii?Q?f06q808VabC6FhSs3U+b9BCmcoJNqfWzriKIyCh+JvpcAxykRihNeJW5XP3q?=
 =?us-ascii?Q?7yQmCqZwzOroPHTFxSh5HxFpTORhWY55A2qHxEqkm4g8fnAsf4/78vzPv0vF?=
 =?us-ascii?Q?9L53gq5KnbbTPlrzbkXltAYnff7//JfAsdzFkIxqZjlzAgDMUHqEnAtxs8S2?=
 =?us-ascii?Q?FWWEnN81qGV1WN0N0v0Yg/Olsotahj2mAWZekorePxmgAhpm9g2vXK9eism3?=
 =?us-ascii?Q?q7XZp70HMnTho1oach9oRzmc5XHHhWGwZN0/OC4LRWD29xk56+HsDQnl1J1/?=
 =?us-ascii?Q?32VSbYWJjZgXaA5BtIUs47CuFu7aJ332lAEkXWRl7DwVKzOk6t7CNZXPOvaa?=
 =?us-ascii?Q?/18Z0EOegzUWWejUwyaTcEhSx1OUCPTF9s85sG6CM4hNWklGZbu1Gho5bKXw?=
 =?us-ascii?Q?Lho1V27iRaaF045/A2iVE8znSEZBGvpp3kmy9T8XLA0eUsHHZ/XezqLxGr2E?=
 =?us-ascii?Q?XJ5Pdb3xtPOWLs3hWXniXd7wWPwVcPSlusMViittKzYpqeNSZNEg2aLZe9U0?=
 =?us-ascii?Q?RMNSBISMsd2LSUPmrixijRrXhURk2rgpEK+MLvHti7i6PHn8s+olbO70HGMt?=
 =?us-ascii?Q?qlnGqsvsljiLMHbJOaCxWRJrd5Bp3PmUgmYodiG8NBjMR/E0vCstvRMIkvrH?=
 =?us-ascii?Q?ZaVlExRyNlQBphkn/JJBZnfVgWcbGtrG5qE4oc4CXviQ9IxAVgVOopEizx8i?=
 =?us-ascii?Q?Lvk9NdHMSmzi88cCJWvev5CIjCUabmht57ECiOmfBjyR9haWQIoPgq8X7ljl?=
 =?us-ascii?Q?1NQwxPbwQe+0a9YX6HB8iKbjc/v9Fd+La31B?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N7iiHRrE3+a1s2/jPFWWO4zwq+Ow1T2ARYFPCPLBVZ/KmqCgwttWCc6HtN+c?=
 =?us-ascii?Q?k4pDlbOI/jssd6IGkFmCj4HxfhfdDCpyzXf8JwxSzho7ZJIR7v6ftvKGI2WD?=
 =?us-ascii?Q?Zo962cDKE5D8xQ6gK7QJTRFPVnntoDXB434ipiowCdmpVJlU5BXoTXTXlj/f?=
 =?us-ascii?Q?m/Nz4f77DcJ/6MzwvjHDT2ZAM0tjQnijxqrSz0EuEGPNxG3E8/OVQxVEpfI9?=
 =?us-ascii?Q?rC1eKg9h4GGcmWtR/PzZTOjPu401E8q9uEBS1H5eHKc0for2wvujfcxckbL8?=
 =?us-ascii?Q?zmKABpFoIoWNCbFVG0/KSaQvEJxIFLS1qmhLW0SPKNqow8ARwx7kehqniZmg?=
 =?us-ascii?Q?erLRiGTQRmBoaPbzKCh0HAuZya4xcFBnk/jp4e5XIWvqulFfRs0vOLcSwlxl?=
 =?us-ascii?Q?QGbl7AUDaCig60P5dVc/8iZi7qKfv8+ofcj4nXaIzWCmbZ+sJpoja/UmB4a5?=
 =?us-ascii?Q?YuXTgofi2XMuLNX6mtCC3sggN05lRAQYw4s7Jt+UXYrwuHXkTG+rSIqLHx04?=
 =?us-ascii?Q?COxqpjPxTVIFMXcdNHDKYfz8uluIVc+thA35DgST5JYGvc14A+Glk1N+YsBL?=
 =?us-ascii?Q?DocZ9Ap1/8KhNFs5ieU4/JyE5UoT48eVB6MOlsvH6AvSFxkBdQmThOR1U9Rt?=
 =?us-ascii?Q?UaGB0ef+nQQudcu1MXgrw65JArQt8CvzE+JePVUKs2VmP5kLyqMxJUfRbJ3B?=
 =?us-ascii?Q?AsnLgus7genRjth7ssz3eKz7m05CBC0zMZPgSY/+MwE5uHiAAhtmN47dDpRc?=
 =?us-ascii?Q?RAsD4/iB++fCVl8ctJ2UnAaug8lXQzWXJ5ua9/8PL1GkkWFafFk3wsRNgpLi?=
 =?us-ascii?Q?t9Ep4u+GyjrjNWGrNIdxQvZLszdsTgOrNNA4ODkbB2rcTTEfMescnL3FuXhI?=
 =?us-ascii?Q?oR/JLc1xXuFx9L+KI3faSfmN6RgcCEixbRq0wYv1h5reU+aCpk+kYEKKqUwo?=
 =?us-ascii?Q?+yx2C95cMkgXrIozBfZ3ebQrYJh7KDKeHWSJu31ghoQFNq9l4x7Tr84Y88a8?=
 =?us-ascii?Q?9anEZSe54tu5WcPxJ1v7nOILoMugPqVWpoGWsmw/o9oBYAtzF/tMLWWyRs+V?=
 =?us-ascii?Q?Q3lIjyL2BagFBl0mk3Ib0ZVIBuEFEmix+cRm3sbbKUml0MuhxHcSTsym/XNq?=
 =?us-ascii?Q?OJ5F1eInYzikmEEMp2Y1jL8fQ+kHj3IDauj09UxMru5FqnkHFB69dAYDytNd?=
 =?us-ascii?Q?eouiSqW6BsdNDYRalFXw85mo3TYy8Mgp6YblevSQlEEhiVGIDN/M9FLsevx4?=
 =?us-ascii?Q?TYaE1llbsG00vkd3/PfO2QwMJi+bH6NeKLYnBVJd3FIf8MTy8v7RL23xz/ei?=
 =?us-ascii?Q?lsFAp69TkdGz+LGBIKcTl1IcqCJpJfa4OpCntnOd3TTHwY1rrWxGDjf0hRu0?=
 =?us-ascii?Q?m4GoyVyfFyISwxuuyobCCHvSanchdzzbyIR8XNhShRWmCaPz7T9cKoOmZ25D?=
 =?us-ascii?Q?a8fPamV5a7GZOtZP3TCgUK5V44Skxv8UMte75Eb+Zhu/4ugbpDMx7bVq2ibt?=
 =?us-ascii?Q?1QMKPT389IyOublQm2P0f24Ulaikdn8bTCTWTgUaei6Xka02NlxiZ5lIfSII?=
 =?us-ascii?Q?IXCSJdTft8ABp0Ns9LTtm3zAeJ5PGdODE3mNiTxLDnQcJ3bofKe9+s/v8sQj?=
 =?us-ascii?Q?JjQCUNruXeWM+dAeHsLCtGw=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f8c7ac-c9eb-42bb-c0c9-08de274e20c7
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 09:29:24.6169
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8yz9+8njZkZOoQfxdivXDAYV9GUxgvGSGuwjHIiMFNb68As1RUCkPc9h1zdwbMX2yvWZVf7Lru0n0ByBg95pNb89bcoB4FG1oPpBnQkd4bbenkMk9p9MMlgEX6DDFvga
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9106
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE5MDA3NCBTYWx0ZWRfX2Dg+l4Z58wSr
 ZAZUK18Yw4EBiuuaH7lh0hk82JJM2pHZu+CyG+vKGgvHmS1lIqYD+/JCh9SSXF44k1TSAU8Mt/j
 7TGLovg4D7qqQE6vsPvF4ITjMvQNedxo00DnODphEuePlcqpTGBW0GVgNMH4UgMjlYvvzpQrzAq
 KArr8JAcfPMHlWqDMdBkr0260u9csYm42A91aNd4OpfwHkFDQw2lg9xHSslNDDLEw1xzle2TZZc
 aSvhinuK2DARGqmztXLXNaLpWEuqVeSUNdV24Dd7tQm3/xqtPXVbFv84X0kAwopJUq/k3ijeMER
 yCBgQ52BPE4TfIlvUnF6rWeRLZA2VDOJ2JkUAD98KgJ7jmrW6CtDm4LM29iU0QYVm+39J6/eKer
 80U4+25pTCaPhMAhfZsKdipxLrK33w==
X-Proofpoint-GUID: XpL6M4qspmkoKAkv-5n438xLvm6saCvn
X-Authority-Analysis: v=2.4 cv=OuxCCi/t c=1 sm=1 tr=0 ts=691d8df8 cx=c_pps
 a=gUoplhyZVfsoAH38zi7lgQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=DTK4Wj5hcAfu3kbIAe0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: XpL6M4qspmkoKAkv-5n438xLvm6saCvn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511190074
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Nov 2025 09:29:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226544

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Brings following bugfixes on top of 21.1.5

a832a5222e48 (HEAD, tag: llvmorg-21.1.6) Reland "[LoongArch] Add `isSafeToMove` hook to prevent unsafe instruction motion" (#167465)
2d631cc168b2 [CMake][Release] Stop linking against stage1 runtimes (#164017)
6ca64545e1eb [MachineCopyPropagation] Remove logic to recognise and delete no-op moves produced after forwarded uses (#167336)
69586a904bb8 [RISCV] Correct the CFA offsets for stack probing. (#166616)
2fde0df91125 [clang][modules] Fix crash in enum visibility lookup for C++20 header units (#166272)
251d2d374e01 [Github] Backport ABI Workflow Changes to Release Branch
4b2ac3f7a210 [debugserver] Fix debugserver build on < macOS 10.15 (#166599)
4aaab27c2343 Bump version to 21.1.6

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/maintainers.inc     | 2 +-
 meta/recipes-devtools/clang/common-clang.inc | 2 +-
 meta/recipes-devtools/clang/common.inc       | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 6c3174cbb7..49e067eee7 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -481,7 +481,7 @@ RECIPE_MAINTAINER:pn-linux-yocto-rt = "Bruce Ashfield <bruce.ashfield@gmail.com>
 RECIPE_MAINTAINER:pn-linux-yocto-tiny = "Bruce Ashfield <bruce.ashfield@gmail.com>"
 RECIPE_MAINTAINER:pn-lld = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-lldb = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER:pn-llvm-project-source-21.1.5 = "Khem Raj <raj.khem@gmail.com>"
+RECIPE_MAINTAINER:pn-llvm-project-source-21.1.6 = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm-tblgen-native = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-llvm = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-logrotate = "Yi Zhao <yi.zhao@windriver.com>"
diff --git a/meta/recipes-devtools/clang/common-clang.inc b/meta/recipes-devtools/clang/common-clang.inc
index f5e3875d2c..4051ce6085 100644
--- a/meta/recipes-devtools/clang/common-clang.inc
+++ b/meta/recipes-devtools/clang/common-clang.inc
@@ -5,7 +5,7 @@ LLVM_HTTP ?= "https://github.com/llvm"
 
 MAJOR_VER = "21"
 MINOR_VER = "1"
-PATCH_VER = "5"
+PATCH_VER = "6"
 # could be 'rcX' or 'git' or empty ( for release )
 VER_SUFFIX = ""
 
diff --git a/meta/recipes-devtools/clang/common.inc b/meta/recipes-devtools/clang/common.inc
index 6aec58d44d..f19599ae58 100644
--- a/meta/recipes-devtools/clang/common.inc
+++ b/meta/recipes-devtools/clang/common.inc
@@ -17,7 +17,7 @@ BASEURI ?= "${LLVM_HTTP}/llvm-project/releases/download/llvmorg-${PV}${VER_SUFFI
 UPSTREAM_CHECK_URI = "${LLVM_HTTP}/llvm-project/releases/"
 UPSTREAM_CHECK_REGEX = "releases/tag/llvmorg-?(?P<pver>\d+(\.\d+)+)"
 SOURCEDIR ?= "llvm-project-${PV}${VER_SUFFIX}.src"
-SRC_URI[sha256sum] = "1794be4bf974e99a3fe1da4b2b9b1456c02ae9479c942f365441d8d207bd650c"
+SRC_URI[sha256sum] = "ae67086eb04bed7ca11ab880349b5f1ab6f50e1b88cda376eaf8a845b935762b"
 
 SRC_URI = "\
     ${BASEURI} \
-- 
2.49.0


