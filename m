Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 124CBEF4ED4
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 12:02:26 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.53473.1775476940868476186
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 05:02:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=ZKyKxy28;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8556451cf2=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 636BhccP3426691
	for <openembedded-core@lists.openembedded.org>; Mon, 6 Apr 2026 12:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1SVuC4rn5
	nnBjEM4iM7sbfsOcciqG3+1JDt0eMbRvlY=; b=ZKyKxy28ojdXI8DyORiwoe1wQ
	SQ9327bNiw9wOxKU8J9DoFqLmRNg4YBWILHYSePpAmRKET10mwjLOsNR/A2Ie+uB
	DPZthOy+zNr1F7bSxI0ris1vNuVPs7XpkGuhlsODJoot1NCp32p4jEdKd+0E7QMo
	ihlljljIn9usZf83d6/KdFRZqpC+EMC3vKBpaosyButrc9N7+rmPeoFee3yn40UY
	VqFOFxukb6nG9QsJ+svpjqO3PZ8NBWUbTHMBbiQYxRjTMR9uv/FsbOe5mLtjJVkV
	XC88/QldOMW2vz+m2QmHWP/cTtBCphtkT57LhjGqdNfjr8ncRUoO8sgEVVEUQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012024.outbound.protection.outlook.com [52.101.43.24])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4dat649j16-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 12:02:19 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ehfxVcyFU4JLAZKtTjdpVWp2prmA7INVl74xDitr9iZsPpNOcK7mETjz69ySEQ1l+/E5u0pvmhymYIPMsJNrGPgEbcxKAKsWNOoXvhT6tBuMzswDtR4QzmswU/G47QDOR75hX9DRW/H/lIU1hm0G2WpWt2PWQDFBrZDsY0893wbzlLlB2lIia2pSRLGPpGPMuBFoctyMyJRqrL3rFxJMiNl1u719wVl78MeoiGtsod4CxGJ+FT2LhRJJXbaV25c7jRl+I93VxfHeK7dD8r3GvuxJYQtHJ9ZIkQMnMAKAvQplwtO74OIJ2ADI25bsqDy5RVp7jHTIFEoi0Tomv4yhJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1SVuC4rn5nnBjEM4iM7sbfsOcciqG3+1JDt0eMbRvlY=;
 b=GkGljYweAzAqww5aYph2W5mbQaxyAJKbGd8e/GwvBgy58mcOu/zORTvJ+czxZeXnHjRuWp45jka6Rda4Fi86ClIfCazMv/Kzw7cIuB4P6njOjxinNOtS6wd/wSuVHcW+ybWantkrc3exsA/htQzYaRCZJxtDCzbMIr3sIpk73Q9tJ+KiEUu6anBl6kn4r+WcECUxagBbhdkEnxg1NXIrqxkl6ofECMticlkfDYpqVzJyxM9ydEVpMiXwfp2o1r0OLpCBP+vK+U8ckLCvwRvSjsBwBr2lcmNu0nFRu4R60MF5ca2HkD+duc8Qu8ufEBY9uvP0eiAq07PdvlCpOmHDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by PH0PR11MB5781.namprd11.prod.outlook.com (2603:10b6:510:14a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.16; Mon, 6 Apr
 2026 12:02:14 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%7]) with mapi id 15.20.9769.016; Mon, 6 Apr 2026
 12:02:14 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH] rust: Upgrade 1.94.0 -> 1.94.1
Date: Mon,  6 Apr 2026 05:01:53 -0700
Message-ID: <20260406120153.3783152-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0063.namprd03.prod.outlook.com
 (2603:10b6:408:fc::8) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|PH0PR11MB5781:EE_
X-MS-Office365-Filtering-Correlation-Id: f573b4de-213c-432b-0d33-08de93d45727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	Gz0fW3GGTMeVfdBet8fMhC9mLbHmHBGy/O+3pmQ/FdO4l1NYHJppD1s6n2TKm+7pxBy8+DFHU8FcVPqb4VF8xV9anfxW7vNp6vWTcodKFC6B2XsiaVia8qrBehwMGhZk6NNZqLFiQDrOlOQ4Oq8Sw/IQ40WERJFSDtmOOLc9jYdRXoT7UGUiOntj0O5HeZzt8B2L+02gZukm0vwdj+v+eWIpj0JdgrstmpnmO2Dv2J9rnXlJTJuG+9piZzjXTs1wR8Iy6fdmmgwNF6TIUpdndAZXiBsSLd7o1iqW9hh1sK0IuYN2lG36755gqPNHV02hyASKwV7UGYZNOb1tdLDeg9fztQyJy4fBs/bczKx6iURY8DFs3h5E0QMVzhGVnHqt5AUhKbL6V10KDyxdisn3dUFUKqLvvLkgrBUce6zidLLPRuGIHL1Cvg4+J5k2NkXMI3vAcDj7p8fLI2bdd8QGMP707RzbWcEzGqtqN7/X17fKF7dwZrxzitff1T72o34Gzw2Est2J5ITdBPLfk9B96dvSdUhhfaQzWkP/EOlA4Xl2f8Y+zvufbpJMzGrJqQ5YgT5iMDeJ0bYCL3I54vvpeFieHG+VDjPS05DKruYs2evy1B01t1WWxXTq8Xlr0aTHJ5/GmAmpneK0UCxuJtHL+Al0Mq2dgqMFToaj3tDMpeXDA3glmbdz9qz2AiV+OXEx2aR77CP+zgMuBFDPxtoOCTccrfM++PscuSUT6wqE7obqHbj/C0OmXxTpJSPwo77c
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?DFuc+Bgc5kia5IEO9YaRDnoYoIxImR0T15nOV2LqI4fREqf2S5dNvIpy+OlE?=
 =?us-ascii?Q?kLb+ZkM3PRSy89yzLt8zEaH+dY6cVDS9anvoLqX1ezsjpL+8E+X5n7Re5sAU?=
 =?us-ascii?Q?5zNYBLLRROVpBfx1camdMOnc+yg5aQsCgdwuUEkXtFmK+JJmnco1PbGLg12Y?=
 =?us-ascii?Q?+4RQiOpBFDqxGlXH8uBfFWWNta96rsOamx7dwMHWrW57u57e/QYOT5EzF1JI?=
 =?us-ascii?Q?U8xjFvieQG1yULh2gzJv9UqwmVy0NvkQGO9w3/YXbsV44rakFkFIz4+4bViC?=
 =?us-ascii?Q?+VRYwdhvbpVuEqX0ypNACcVppymzmpX0l5sB/Usk5qY6zzv93jqR9J+BP88U?=
 =?us-ascii?Q?HUZhr4pIyvhFKU44Icupr11pwqI+FpdhyKQrpNUJmWP/wvqNZjaM1zdAJCdA?=
 =?us-ascii?Q?PxPo9ZXZyBlDYv97F2VEto80FRaNzixK4yiR7iGu7CxLP+FVThxL/FsgbScP?=
 =?us-ascii?Q?s+Rc7vQY1wVp/8wStL7Qv9l/avJM8Z4Xm+aEenzHKheTgYZ+8hNx/Nc05M54?=
 =?us-ascii?Q?1SMwdsGiqb5codKPfG0khM8hlSsVS0NCMCKzdoLLaqcdsDtQipF5l6cQ2MG5?=
 =?us-ascii?Q?AioHd9194BxA6yjumq64LPJqJySdi2Gb5yK8e5ShjRLNjI5FORITgwFxdJvS?=
 =?us-ascii?Q?uf/04T/fTO6m24bDq0zsqWlS36qOVxT3SA/4nP2swMzd+1HAHIa6ld2Rbbh8?=
 =?us-ascii?Q?dbHzZvhGJ0E9gMbpNDjiq2wbdSdMx2U+MQ7cO6tLWy2SxOz0Dg/3sROBhRBI?=
 =?us-ascii?Q?pJ+Jd9oDRB9Rg28PrW3c/CYP1thEdqQ7sSztgRs1bUPpTmDXsGVjsO934cDp?=
 =?us-ascii?Q?84dVSe4h/BAqsQ7wJNltOZ/JCg9MuRz3jXADTz4+tNANwolvnJemlsUw7wXm?=
 =?us-ascii?Q?5JxGsMaP1t574Tzq19TPdPtLVO/Jp/GGPMgjgKn35K4bFqZz2ImFnHK6nZOx?=
 =?us-ascii?Q?8DEViIAGOgAqkBDNgdtnzqUH5QzpJ/W040EOBIWdv+ro7FgwZkc4E1Hx7hd5?=
 =?us-ascii?Q?y6dK4ZWtr1m4cIAz2HGm/08ibIFi90LmpWlkE+Po7kJLG0QS07f9E44mUJLm?=
 =?us-ascii?Q?ZfBHDAF8CoLSn+QflkiT1MepWcV/pl06hMT6UN1/nSxNyNrew+QEsp2O7nI9?=
 =?us-ascii?Q?aEWc3q3z3pFQmHEWAqCulcibDBdcw1p16KrLcegGDPZ9Vv/Zm+seaEHMGv6H?=
 =?us-ascii?Q?APjjRj4OTRK1Fmnar3+lA4Gqw+w3t1rTT+TaAvwqZmkrX75iaoldCW7N1GfA?=
 =?us-ascii?Q?UFGuuWB0sDwhJl5+CHypwQf2IiXNcNvWbyZtSOeMyz+3/w5Q2lycs31oujrH?=
 =?us-ascii?Q?MbhV5BWH2kk6WMqbP7dPN5jG64BThAnfbfLed1v3PK5rrLHqlGjWw4Ya2Jdj?=
 =?us-ascii?Q?rdQmGO+dDVcdiCvUXUF3IQg0xius8HxlAIutHU9rBLAJs8S/6Mfavn1bGpvX?=
 =?us-ascii?Q?WESlW5hwdD3GR2mVbYpjDRhBsDu5Tev9IWeSpNxUrNdkhHxHZIdNVM0FTagx?=
 =?us-ascii?Q?O9SA4AuPDG21GO/KBZvrqPihk3nGXFjKWAv1qJel2Sls2edUHFHWDv+TQZcY?=
 =?us-ascii?Q?sgRcPumHXzy67khigp5n+MMwO/3pN9zG/mgHZcMa9KQ1gxmFPHZX8Bc/Rk7o?=
 =?us-ascii?Q?AP0069OI1Uxz7bPDR41IFPLvIMa6l/uDYMPFWg3IsLtXOyYEuG3NxJvPrTGM?=
 =?us-ascii?Q?SNFkEvOVSurX8GHHhAh8PETii7ppUe/m9SOPq92K2NgZcaDwnmKyxGQ1pcT0?=
 =?us-ascii?Q?NtP2L4cQdJi7VCu3VUHJO0TZC45bpfnxn1QbLMj4p1/FM+41lnZl?=
X-Exchange-RoutingPolicyChecked: 
	TOdrQ9uWuuRtjFbPvRn5VMqFyuAdwbds/IopR5nCyPjSqYTxinVuxA5b165NjbSh1oNh+ipjrHPlgdbU9t2urjTY60q3H5XksKpLGiZDAPoH9hw+8ye9UllPEzBd7Z1nGr5Gf+YAL2ABoLalVIfBGV7W7wHKINCppsQJGJevcFga31AZ7avlTVfZIKWTO0GPN/T5BY5bC+2imGzmKz/XQcW6Hg2rkJJic0KVeojN6UIT3GbiwOJxmKhv8O3R6BlheOiQWJC052OiDzsdzMnmPEI22OfeUIkJTBlbmu/ZtOCuAo5dS8jiSK44n8DTz5x1iQdg05GRPEdQs8HPfCXCcw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f573b4de-213c-432b-0d33-08de93d45727
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2026 12:02:13.9698
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c0/v/jQPBUJlXW+5MpGQxJbXbcK5M8uyWJNrFHuU2bPlSyu6eOvMWgQv4VX4PKKe6CkZ+pYweHAdDscx3FN0WB4hDe1C8XrdxQmb2gswmcNqt0Ty+QGssJ6EnLhmFS95
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5781
X-Authority-Analysis: v=2.4 cv=Q9XfIo2a c=1 sm=1 tr=0 ts=69d3a0cb cx=c_pps
 a=zj1Wid/uFNkmIHgSYpofMA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=fTW__CHxibyLmBMfj2wP:22 a=ei4SEBeUAAAA:8
 a=j57RdskLAAAA:20 a=t7CeM3EgAAAA:8 a=aPaJOW2T7HBD2Nt-MiUA:9
 a=t0EB5k7lhMAKNYPM:21 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: ZyU1dFaHdW4Bc6xBkBfv4cWUNhzSVFw4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDExOCBTYWx0ZWRfX7cctn6vJ4dl6
 EygZORmuaHlqMSZuDGYqu0tsZYFA0dW1VRxHD+u2MQiEyiH3Mq89OHG3mDv7q5oEnVFatMYH4Gt
 /umlXFjzVw206s9lnIOsf4/k5HiEkfYGldtW5vJ+2O14QBKHRZcQGfmXQVXmHfcCnriNj9pBW6G
 k1ILK1c2UeKNMIkLwVuORb36/I6qpvTPRtFtijX4QneWit6vM/kDRJelDwbTyn6pILMZWhGxve8
 DhMzshCHWVKGeVj9pG2DehNysY2v0qXVE5s8Hjytp26eR624caFkt0/NhC/yByju9CHgIvFQxq9
 kwTvJoJsiSyx4yz+iPx2amSCXX1Y72WUwnrBT9LZIPwa4jKhb0PIk7aVOPIkJ/N+pJu2IIMgpV0
 NszTJ2nhjNYmezO9wcxfVTEOqzvDThOYYsA+3UwdqoMqRL62kteVXb2QNsmiVJx1VTXRgyHtSg6
 xnH4LhCV+Xtj7NkH1Qw==
X-Proofpoint-GUID: ZyU1dFaHdW4Bc6xBkBfv4cWUNhzSVFw4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_02,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604060118
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 12:02:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234675

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

https://blog.rust-lang.org/2026/03/26/1.94.1-release/

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.94.1

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-1941-2026-03-26
Fixes: CVE-2026-33055 and CVE-2026-33056

Test results:
No changes

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc                     | 2 +-
 meta/recipes-devtools/rust/{cargo_1.94.0.bb => cargo_1.94.1.bb} | 0
 .../rust/{libstd-rs_1.94.0.bb => libstd-rs_1.94.1.bb}           | 0
 ...t-cross-canadian_1.94.0.bb => rust-cross-canadian_1.94.1.bb} | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.94.0.bb => rust_1.94.1.bb}   | 0
 6 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.94.0.bb => cargo_1.94.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.94.0.bb => libstd-rs_1.94.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.94.0.bb => rust-cross-canadian_1.94.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.94.0.bb => rust_1.94.1.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 4e4e3e0cd1..d2dd5abc03 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "15.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
-RUSTVERSION ?= "1.94.0%"
+RUSTVERSION ?= "1.94.1%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.94.0.bb b/meta/recipes-devtools/rust/cargo_1.94.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.94.0.bb
rename to meta/recipes-devtools/rust/cargo_1.94.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.94.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.94.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.94.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.94.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.94.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.94.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.94.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index cd6999c8f2..43d60fb6f6 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0001-Update-amdgpu-data-layout.patch;patchdir=${RUSTSRC} \
             file://0001-Adjust-loongarch-assembly-test.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "0b53ae34f5c0c3612cfe1de139f9167a018cd5737bc2205664fd69ba9b25f600"
+SRC_URI[rust.sha256sum] = "174fce10ce012317ca995810296d8af199318838180b03d68a853e0f02d4b571"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.94.0.bb b/meta/recipes-devtools/rust/rust_1.94.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.94.0.bb
rename to meta/recipes-devtools/rust/rust_1.94.1.bb
-- 
2.51.0


