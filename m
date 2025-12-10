Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD575D3C529
	for <webhook@archiver.kernel.org>; Wed, 10 Dec 2025 10:18:31 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12324.1765361908273440096
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Dec 2025 02:18:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=BOCI7IzU;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4439ea1cec=yash.shinde@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6A2Aa128616
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uEzm/WtXxnAQpQF3SnKJHZ9pCrGtOyeBI3F56JS2lmg=; b=
	BOCI7IzUX+kQ2sTTZ/Db75uIYG3IIdeYlnMg7u4Y3cQmrAkeoDNPNKnid06eamAf
	ai4WcThQiH7XoQR+9l9QcCUV+kO5doh+GKT6oDIADdYbao+5q4GEBP/atDuQtRdw
	9LQHF43nejAlg0tq5wdR0G1qeIXEHuxQnK4y9T69lSTke5LFZLOTynF0ni/x8qm9
	bqEJsfUUrGJI3TMcyWZtNeSyQ7GjgdQNyH20O7KHJjFmdDis2VjIIRqSlszqGUtp
	maS3e5UU0A+dOieOfoU7CmsjdLbv6W8vw8j2GWL2JRLNQZDOwEOr75kMzi8JcLEZ
	0u5bEER5zyBiB2ELGpU/XA==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay07hrd2b-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:27 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4zQSfuU9uuKMqK7ltB9BqaZw1y5Tv8e1GXIKOu1r6Bun24qoCdX58980S2UZnnQLkzLE0NY6KqOB1HvUHVvN73gk3RA6j7s3zv087fgggdn84XMCe0cW5u1uV9Rk/kTPTrIGTgSbIn14y4uaP762IofXL0xN605wYHGPbk1fXuDYV+L3QThgI2zU6pH8xNdFmyvjjw4CCr8jAf3BVwnvsotJsUTWCVNEURQEgrxqUNBahdDgDr6D43eSuumbQuygb0Fzmsk/cc7XeJN8V/SppJDW8z6vrUTLBwLCo/V5lULOKRONi6jQsRemjUyPo3WSYnDWhA7VmIathFjMjs9XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEzm/WtXxnAQpQF3SnKJHZ9pCrGtOyeBI3F56JS2lmg=;
 b=ikaEbw6izY9nzwu5FwH3Rh5WGoEcNN6I+QtZ3g/3k65QzrGHxCJz/fjlio/pYKXYee9qsHVDLnCdIKpL9QokNNJ8fP4oRo4qPMQkIqYyU5m9BwrqvFZJTuROFMxnkfu+3xzB5qoFUyHxy3ZzcgiXiQtCG4NI6coRmgTdRcFG42dCGLae5yDvExo4NSkEqWU7vR30c5tWI6J3uf2ZTt9vk3/IkyQm0mIqN6JcQ6ON20zhszstbZPWLqU56quvy48cQf6Dkh6bspJZGEhHJLv739/SmMw88zkcQlfYMZc+lX9PDm9D+060v1ClDAAdm0FOu4jgbQD2cyI7mtFzPdqWog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH0PR11MB7562.namprd11.prod.outlook.com (2603:10b6:510:287::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Wed, 10 Dec
 2025 10:18:24 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Wed, 10 Dec 2025
 10:18:24 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Yash.Shinde@windriver.com
Subject: [PATCH 2/5] rust: Exclude tier-check and fix openssl-sys build error
Date: Wed, 10 Dec 2025 02:18:00 -0800
Message-ID: <20251210101803.1120711-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
References: <20251210101803.1120711-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0185.namprd05.prod.outlook.com
 (2603:10b6:a03:330::10) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH0PR11MB7562:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c2f836b-ca33-466e-74a8-08de37d57365
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?7+vmh9u3Ho8kktbMPy4bJU+FzWegHlKGMmXxiqz1OafSlfLvILUQNJlLO4Oa?=
 =?us-ascii?Q?ppR5fGwlSNdcH5ghCtyZMrLcai8I0UHi960i2Hkr1BfGrVA5JuXu8r5HHk+G?=
 =?us-ascii?Q?qQcdlWOqbX90ZMfX3Wvw+afnflq31mg16IlPXrKWkzx+b+vSk+6MdEETBCF/?=
 =?us-ascii?Q?3DK1f4KWAWU26X/Biom14AWoBmzkfFSwJ5wTSSKKSAIkzOFGMeq7B9zL/HLH?=
 =?us-ascii?Q?cX+ojO1chTdSvA4tw4c54pathS4XWBMPIYMhqygILDNq5DGTnJOOXID3crlH?=
 =?us-ascii?Q?ZbNkXnS/leA8ur9EDCmjIqClJn+VifUKZHWsQes3LsAxuhtG1rZLosd/bH5w?=
 =?us-ascii?Q?Qor5WDQMZoO2zbHAzLu6NzxO9QXLPKg84yFlwSK6eeNqTofO5wMiZOF/dZ8l?=
 =?us-ascii?Q?MTVbleDDc8xRNoN9nqPwC3pqjYumKtZdjSZ24qh0PQV/l6x65VJ9KIAXHM4g?=
 =?us-ascii?Q?RsKa/9YN106n2Taxp2IqDARXNnczFMzu6GYO0xgtPjEcZ1KIV08+frA0UFOO?=
 =?us-ascii?Q?hu4n1CDRSJAtdjSCDgBDq1nsqvwM0ShSp5Zn5GqaV0b8nR2gXmGPAW6hGb2A?=
 =?us-ascii?Q?xicriz7PPYV5hNSjnZmPwcA5TnQuCs/mY8NIh+F9f28TtSIxh24bFnMM3Yfv?=
 =?us-ascii?Q?bBw0VDbK2/jCCBdstjCRV2V512iYAwzXHJ9H3Kwwe22CACh543lkosigO0Hl?=
 =?us-ascii?Q?8wLr5eqZFgaqSWo+sQbjL99mYoLzDL+DJKazaB0Fokz4FNIDa90szoA3p27Y?=
 =?us-ascii?Q?I2bocaOute3FIoKOU3ZHP1BQi4E+RwZZNuZIRmtgRHD7Me4n+WzpjSAdzaUa?=
 =?us-ascii?Q?9DNWqM4jlOqCyXVUoby4kDrE1QhPM6BrhzU3eB7V63UM1j63qgRPvQlmsV3r?=
 =?us-ascii?Q?/hkV0YZ5og9a+B0TbtwBQlUvx4BzfXw3pydriqUOxO79eKijN5lANbJlnIGE?=
 =?us-ascii?Q?6ZVB3ukCm3i8nQXoL9cCTpj8gE8sT3FYUCff7On698y9Lbj9Vwbh90Kp9ebq?=
 =?us-ascii?Q?AR0netwB3dJqjjxAw95ptPOLaiaW9GALt27+r8MVMeXzgMIYBikjg+3br0cn?=
 =?us-ascii?Q?cjptiOfaeRVJuQlJDGxLrXvc5ubU29pRQ1F4paMi79EtAWCpMOpERqizEJHF?=
 =?us-ascii?Q?zsnvMZH7dqula64ltZiTdxtqj+0mVVLF3whEON8fv+L0B6y7Ai2NrSkqVR9E?=
 =?us-ascii?Q?MSSzsJLwPzMuQa2+FcD6Ek88Azi+LS/7X1zKP10tbVUUwI+LT25xXQai8cdb?=
 =?us-ascii?Q?1p34/iSeK12gtCSIYjvQMce2uxa2GbQQJ5rudI0fIXgxETRQJAWlXAiLly5j?=
 =?us-ascii?Q?2Mh3NQgKoHQcdGwQA0yTKWWgd6h8epZwpkkKjT5LVfbUpx51AinKbfJ+p8U6?=
 =?us-ascii?Q?F0l3M8njLCQl1gvUIT5SYrGPraxKUUL00gAnBPqq+OsDVdVG+g0sbw87E2LO?=
 =?us-ascii?Q?cFdBJZBZnsejR9OL7hRotMhIOgIjfFBdw2zGXo8OlnndCmg3JFmgiNMVIJL7?=
 =?us-ascii?Q?V/4lrc863AwQ00HuV2MCUP5KFAEcqqTfMppO?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?mnswB4uoslwIHCq7mT0HUdzaHRtBiSsjPSylYn+n1RZWZsW4/EKCS1apWYIl?=
 =?us-ascii?Q?G5ZAxkANN/2yxNnP2jSPp7n9+HCuacYONOcy9QioITtYJKUwICkuCnqJ9VlX?=
 =?us-ascii?Q?bCYBojh6kZPCwWg0Z5g6gEvl38bs/6v1Efh4POto8PIbnDAJJqTngXUCi5mK?=
 =?us-ascii?Q?MZzcJ77PY4te0+t1kS3rSA1ifoSCAL+d83t/aMkt0GebxmNdydemp3w3PP8L?=
 =?us-ascii?Q?KnxO/3ikNsPd/VfDB96uGui/B1Qb6niVZW9Rx0VPRrNO8hHOyAIrYPnpm/AG?=
 =?us-ascii?Q?HnMIE2iFe46RFbJh+rbKXjmCMn+mqZNsHZYXjlGgP9zaViwcQ7A+JlmJBr4i?=
 =?us-ascii?Q?WTJxC/besTVpqaI2Iz4+wE5zj0cojB3IvrVNGJp5mq1VFZWq0KROeRKYvpk+?=
 =?us-ascii?Q?wDLNG2K+TIyPMDGRdQD3Rt05wyUsyK+qYnav0sQZkNwfOdJsTwKIOvxYndIz?=
 =?us-ascii?Q?18R2/kB53YOJAPOQHwb+ru3PjkNBqmvLrM27Cai1u9I/2uRUpxriEkaO/wR7?=
 =?us-ascii?Q?B2W76ktUmCb7JHreOUtZ5iE/SogBEe2GgpY7+IE++adHVP310/FfXP1qapIw?=
 =?us-ascii?Q?NKR6vJmGLOsf3s8QUSJw12lcBN6/pEUKo1lfH0TSZppLFVlKDup1QYG32Uon?=
 =?us-ascii?Q?iQdAw2YQhJFmxmRfUNjwF5oROVva5srMe6A1kbObiT0DeS8VrUAapB9hgqMT?=
 =?us-ascii?Q?k4x+EAQtcdsvlr8pKmbsa839rtCissSqJ93A20LND+hI7gGOfL9ySHaqjsgv?=
 =?us-ascii?Q?7iOTaKS1BO096ibaEb/UBJ1kYECC8Dwz3pb23ijJEgmSJyoLhNp5/fHuDoeA?=
 =?us-ascii?Q?Y/LZiPkRcq+CUkzDIbkBb0ObC174t6UcWovuagTZTbRUWv1g41Oc6+QmjXl4?=
 =?us-ascii?Q?UEu7f3tuKxwmPXkiKIGEc4ZnveS9RjXm7xVNA4blH6z4NcKNDyPf7aTupfwu?=
 =?us-ascii?Q?JpkLIfJsEQZvJQfnBWP38buxYpYggNQ7v83VcR40prnWIDeTmBLgzHqfVSXE?=
 =?us-ascii?Q?t0mqJAD29rlzbp4mSI5EHvS9PAUsYdPyR8ffL0ntsDkxlkTn1yffAjR4Ja9q?=
 =?us-ascii?Q?laVa0QeT/THmVVKQqMMt/+ZdXRjUH44PplKYtjhzR6pilb+i+8AVnZ6HNEPE?=
 =?us-ascii?Q?rc4qCliI/6FTy2H07Nc0fZu9WNXECgEFXg7wxuXK8dtpgpRR8cz67n/rBQA4?=
 =?us-ascii?Q?KguEwNUM89rT+YW1Q261BPFgaOxKFOSMUy8VykJlejNrfdXp0xBcTks5OYF5?=
 =?us-ascii?Q?ePRVGDFQV/Z6GffHRphv5XdiPNn/3d7OM3LiK+Yr3i8hGSoYWF1vJVzDCvZs?=
 =?us-ascii?Q?Jq3Ze3E/TKVQLpI4XWhB+Tr9slhGCrg3CJ4Y8/++u9VvEAsvDRrnQi0ZOS+7?=
 =?us-ascii?Q?1MFNvVdktFPKrAhT2dNHmNi1KnaGX+3hw+NgEHmXPVjuFr9r1/zloazqpj0k?=
 =?us-ascii?Q?KBw02IYYQWlIxL/n8xLS1q5fGN6OW0fdCuTiL4xqaHlsk10wqzV1DRoCH6J5?=
 =?us-ascii?Q?tnT4SCBF5XKfljYC5PjxSNBg5cjZbz+Sb9jwZ0VPFxJzi1RD93kDZtgNl2FF?=
 =?us-ascii?Q?kiJUa3echpmwbY82xj99l95FirV5MijgUMWLfll91hQ4udJn2YGrpNLystuL?=
 =?us-ascii?Q?iw=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c2f836b-ca33-466e-74a8-08de37d57365
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2025 10:18:23.7582
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qWjJbEWWuqfGTE9Tf581sII+rD8n9wDoYficbHAVfe/FwNr6Rdub8hNY1tgg71y50esRPRFt4LyV/HWL5ykRbAD6Z1c7wFKvVI0a2PSs/RA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB7562
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA4NSBTYWx0ZWRfX/e7KOjm/bo6g
 s/K8lxofilew2/MJ/TDnBYXgXHGDSHBVQKD3ovdYABA8mX2jRt6zxG9WxmWJzsFHWRqfg9Yg8qZ
 jAbsCnGwYM7ulTOZ6pZo04houcw/g2kJ29X2+b9fRCMa8XlCNcw4TKfM8VPt4kPh+aandWw3w7L
 SQR4vttvgWgWolgoY5b7FMLwBwO3tmBe7UkgH/5CFOdOE1nNlUyGAmQ8deQFYjxt3709pzELWOv
 Hp6FABm8CrLvN7eGUSu6dPagjm8zldtZylfE0B6mFoK6CxRb1DJtxDo/SpcjWdY8uwyA3p0g8C9
 5oyeU+RyzXj/vG7h1uYR5xvpxwD+0fOy8lR0CDPkjQNyLnCX3MiEqkcr6GQPAXhb21RySZWiXFQ
 6A/xFTXXlA3ployVzrDxyi5zuiepnw==
X-Proofpoint-ORIG-GUID: l-IbRrDhkuKxCd2xk-hSIaevlos7iqF6
X-Proofpoint-GUID: l-IbRrDhkuKxCd2xk-hSIaevlos7iqF6
X-Authority-Analysis: v=2.4 cv=dbyNHHXe c=1 sm=1 tr=0 ts=693948f3 cx=c_pps
 a=0dUMnQhOFwHl/g2jU5Tm3A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5O6Eb5gfv2Nn_D_gLL4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100085
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Dec 2025 10:18:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227462

From: Yash Shinde <Yash.Shinde@windriver.com>

- Exclude tier-check which fails due to file not found error.

Testing stage2 platform support check (x86_64-poky-linux-gnu)
Compiling tier-check v0.1.0
(/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1400964/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/src/tools/tier-check)
thread 'main' (163263) panicked at src/tools/tier-check/src/main.rs:16:10:
rustc should run: Os { code: 2, kind: NotFound, message: "No such file or directory" }

Reported: https://github.com/rust-lang/rust/issues/149171

- Fix following error by providing openssl in the image:
error: failed to run custom build command for `openssl-sys v0.9.109`

Failed to find OpenSSL development headers.
You can try fixing this setting the `OPENSSL_DIR` environment variable
pointing to your OpenSSL installation or installing OpenSSL headers package
specific to your distribution.

- Exclude "tests/assembly-llvm/c-variadic-arm.rs" failing on arm32.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 01a98339a6..355d690a59 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
@@ -75,9 +75,11 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/rustdoc-themes',
                             'src/tools/rust-installer',
                             'src/tools/test-float-parse',
+                            'src/tools/tier-check',
                             'src/tools/suggest-tests',
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
+                            'tests/assembly-llvm/c-variadic-arm.rs',
                             'tests/codegen-llvm/issues/issue-122805.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
@@ -117,9 +119,11 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             targetsys = get_bb_var("RUST_TARGET_SYS", "rust")
             rustlibpath = get_bb_var("WORKDIR", "rust")
             tmpdir = get_bb_var("TMPDIR", "rust")
+            staging_dir_native = get_bb_var("STAGING_DIR_NATIVE", "core-image-minimal")
 
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
             cmd = "export TARGET_VENDOR=\"-poky\";"
+            cmd = cmd + " export OPENSSL_DIR=%s/usr;" %(staging_dir_native)
             cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/python3-native:%s/recipe-sysroot-native/usr/bin:%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, rustlibpath, rustlibpath, tcpath, tmpdir)
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
-- 
2.49.0


