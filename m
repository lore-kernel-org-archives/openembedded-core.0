Return-Path: <SunilKumar.Dora@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D492C88E53
	for <webhook@archiver.kernel.org>; Tue, 15 Sep 2026 14:19:05 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24190.1789481944466021183
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Sep 2026 07:19:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=byEALlyC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=371803a4be=sunilkumar.dora@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FD1wme3120897
	for <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 07:19:04 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=jZ3iPyDLf9OnqucqpGZFeVkEHHDUz9uUHJNjKR3Gmvo=; b=
	byEALlyCIKLCre9FWf+BQIlPr95oBZTMLOqyX8HyIXiOZrLqgKaMnwDuXGIswyWi
	B7KfoJDvM358j5ylK4tUWxtwlL5d9U6nlF5JWLDyHTNAq0UEOJ2ZTv1qfEhLx93N
	vg4NFhJdG0/kYhjkBd2AqMOmcZd/EawRoyFtKAuyUb+xf7TW1VANxYtsb8RqFonl
	/O8n9CFRRJ9Rk3Vy7eusf0i5fUBKqFv6FX+r/bCMlvrWNmdPbbyCoqcfsLrZUT/V
	+DQ3OPTpcYHAT0wctnixAs2cHz1eWOpJVZOPgimDs86j7pJUuBBGTlk2nVdpjqnu
	FFJbwQZlvqyzFi56DcZJBw==
Received: from byapr05cu005.outbound.protection.outlook.com (mail-westusazon11020124.outbound.protection.outlook.com [52.101.85.124])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4gn210p3sg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 07:19:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PBvJ5z3oHiU+wtMECPX5TBpUfluOQKO5ybhQxufxbWg/VQ1nOfZbQLFmNvOKUUxo9t/2yz/EbIat8eIVbRdooKbN45cKOiR64HZc7p9E2lRTNpXPQesTsj1PKrJrIoizvhUCUdfuiwY54vLLE/olWLIvExYKzGLx1+oLQC3eCOnoYh0fLnOf8gGORp01BJVhjKIFryjipzgqSIEqj08tvKGlvoV47E8MVLxOcQ5fAjkLJ8j7iPsR82dcFqwin/MxLo5fA2GnhGqKvo0T3f+mrjG/5Her0eHiw7eCaIdwhKq/9o9UBCC+qbRGdCGrjhFvS8ZeaqRESesUsKdE8D05qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ3iPyDLf9OnqucqpGZFeVkEHHDUz9uUHJNjKR3Gmvo=;
 b=n02q8QUnT8iJFZZegCL0ZP8mmQRvm19VrrGZitc3uUsSLOqxihj/1zHh5rc0WVT6Cex+snIBAUFJPjC7RepBKEk7Iw4mlWflU/yqNQ4a5U5Xcw/UiiCmSK70sDfJleJlOji9OXg83kuh9R8fbe2hiZVLjgcrfSlcn1OR59p5PprlXzq66oTJFhycaMf/nMYigC4VU8jDyxYdBedo3vjNcicKGZlbkOwf2hUXNj/xo+qcG5aWTZCPSOeJFY4x0X8fnAtIZ8jg9U3Dblz0aX5IwUDe3Pey39K+sCwdI2AswXK4TwWUZwY+R1EWoJrk59vL7Guh4E8Xk5rEEwIcOdHqXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7901.namprd11.prod.outlook.com (2603:10b6:8:f4::20) by
 DS4PPFDB7809488.namprd11.prod.outlook.com (2603:10b6:f:fc02::56) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 14:19:01 +0000
Received: from DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f]) by DS0PR11MB7901.namprd11.prod.outlook.com
 ([fe80::4293:7c4b:a0b5:eb5f%3]) with mapi id 15.21.0406.007; Tue, 15 Sep 2026
 14:19:01 +0000
From: sunilkumar.dora@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, sundeep.kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, Randy.Macleod@windriver.com,
        alejandro@enedino.org
Subject: [PATCH 2/5] rust: hash cc object names relative to their source roots
Date: Tue, 15 Sep 2026 19:48:31 +0530
Message-ID: <20260915141834.1212812-3-sunilkumar.dora@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
References: <20260915141834.1212812-1-sunilkumar.dora@windriver.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: MA5PR01CA0162.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1cf::17) To DS0PR11MB7901.namprd11.prod.outlook.com
 (2603:10b6:8:f4::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7901:EE_|DS4PPFDB7809488:EE_
X-MS-Office365-Filtering-Correlation-Id: 4269074c-de85-4862-10b6-08df13344a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|23010399003|29003799003|6133799003|12006099003|25016099003|18002099003|22082099003|3023799007|10067099003|11063799006|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info: 
	nOi3ASFlJL695chTAiuK/q1O4lkML8tWU8sPy8jK6Jn1y4Ta6dFgjl+TglhyeD/QeYONOocrlh5Bj8NE00NWxKknfpditctod+Dzo+7yKR0vH+Np2nuorpnBtx50Nyn8rQZyBIYWF1HXJI3ou8Iw6O+Zoa7hnQ3OgRmMEAej6nvS0IPXujjPW7sC0BaKHX2uuEM5t4jj4mj8mFcnQIFxau3VY9zihL53dMxYyCwrkQAHd/zo1UUuNuh+K1EA6z8ahk2unjM7hl85yeG63s4XVtse9Ic5vQe5LI49RbY+Ie7Lh7wzSrJdbTTONkDMkrqTbxDX+ctizmQ+TCIa3rPUEiwbrMAFGqTX96a+4Yiywr6i6FR1uFpit0J+uA1OIJnrNxbd3ZLx9zQrFfVAl0ZVbu1eeVTUwTPNmXA6l+vmfO8nUMhErZ0lIQOEFOlfXvVcfrPcoah34bMQoJ9KEvkfAQaff4PQGiMtcSzlOfmHTaAR2bh5XdSQxJTGTibSYrcbRqZ0255032NDb6wyO7Kz/0+eY7Ca0L1Yw+llgd7djsK1d/pZcaJtayxy6m6ok5pmdMHzXv5bJx7gZxVVOB9gQz+K/Po+JtF3LAvP6oMWQeb40rtpwJYPRSb3F2TKIGBYkUKuFmryYWLNIyKR+yWqg9fWRKH3sEf05GwYECGNxog=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7901.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(23010399003)(29003799003)(6133799003)(12006099003)(25016099003)(18002099003)(22082099003)(3023799007)(10067099003)(11063799006)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BUU6ekoGTz5NTOSBxNtX9flc6N45p12e8yOSs2mq/5U9Yt4TpQzYCmsIoh9o?=
 =?us-ascii?Q?+mTIZ57OLu9TbXVLFN+WcTbk5NySKB83vPaoDQXLiGnlq3T2p8VUC+ERRLsf?=
 =?us-ascii?Q?xiKI0C/x/Z/3Ne4GmsFJ3hw7n+stYa/FGWp4Gm8iPWnAssg8lcYQ01bNp0HQ?=
 =?us-ascii?Q?tZS61rD8geUdKqbqgMGIhWpA/QXVjU5gS5TJAqWNlAKRn1gYLjdfdQ3ukEwO?=
 =?us-ascii?Q?mtJ10OQ8KRLkMF9k4kic0JPce6DApHAdY8MyNM1Ieb4JwqvsWhvZ/YnQYfaz?=
 =?us-ascii?Q?yWnqEAPJAp5LbbRD9vhfbU5qih56dsYGxqrd7q/icaeTXMiXhSG6z2Wy2+Dt?=
 =?us-ascii?Q?OGS3HoghLUrDdVZGVdVBgP0apUAvF9mkiI5g7/Q6921iJxBtShzEkeiLB2lB?=
 =?us-ascii?Q?ZNXDEFJTp0ft6evIR6eEP9pGXC9o6CCeAinT4IPs/PIkHwHY5xY97bcKF/re?=
 =?us-ascii?Q?6ZS7Z6cslEoWU02KKTdqUZknHHZJV4B5cDv6+jfMXUEUD7aAWfFaQFcKuShA?=
 =?us-ascii?Q?dKXbGvqoKkEF/F+I1XYmnN1vuceF2u7fnXKr9zepbJZWuDIDCV7GZTV+DmZM?=
 =?us-ascii?Q?ePy636zoJKer8GARLhKbxY2cIkh9wGVDbt/uea5Jjl2Tf71lVHQnywv3NZ4I?=
 =?us-ascii?Q?tQa9maX8hSNuGkH1SKwAFFzKEqTeX2Uws3NqC2Iu/pVqU5xB+asU3tkygPKJ?=
 =?us-ascii?Q?lFn5L2J/hsbMpHMKDyVnVCrOKfqSy0BlxtUdQTxnVa7siNqS0765AxfIWYOd?=
 =?us-ascii?Q?issE5gO72/oErx3fCioTUMoj+yPqvXnDvOH2gpyhYOtrArlotXxLaSXioo7c?=
 =?us-ascii?Q?odHhWthvve+U8kyTAssOEQnnGbEtpPF2tFeku54gujPL0jgsjccnDMMyskW8?=
 =?us-ascii?Q?kVEvjEI+gjEoIcL7BCYT98PVc2crnvmE1xPeNCvxvQwaGyEAkOs3vw8jGBkp?=
 =?us-ascii?Q?OJlfZ03Jvv/QjLSz3FCmf3tvIPbFXqYxuwYnlphOAiJQtPpm5sM/58kne+/3?=
 =?us-ascii?Q?O4rLtHPYWRm1YozYNp16Ws9bZ6lv1EQEIoW2v6+du0KVxPMBO+C1GPCe6dIJ?=
 =?us-ascii?Q?IK8Ym4anov7gI0z49GY+vlFVD1mZ8snx1KYDDCdsYSe1gR2jTTBCkyF+WKdu?=
 =?us-ascii?Q?aYYB/+XPAhf4HZVdocj1OjYPqdpG2E6/pBp1DQUp90ZwMJKtHY1xpM8Pdevh?=
 =?us-ascii?Q?w0MCQYTKS57MaidXl/+RXtLDHiEILIIQAnGQaCzaJKqfGMgWna23xcioeTEJ?=
 =?us-ascii?Q?to7S6Bp/algMa8zyRfmHyFwhzfe4oHCOGGSk8D1YQixXG+sdc4p1zcZJ+MTp?=
 =?us-ascii?Q?PMzyE/ex3nBf0k+kZCn35YSS40RzKZVhyitYjoTuoAHi5f3OhG1BlZjUSQqH?=
 =?us-ascii?Q?ehNHFUh/XogfkN+6SlbbMxyMt6mK/VbObmd4On7/54Sq38daNz3ZDflf0obj?=
 =?us-ascii?Q?QvDqgRkEb7B9JVnKBpOzzyc2xb6YcrnOYMfrxweJ5dZlQCT2CcpbIV8TpOOB?=
 =?us-ascii?Q?9x+V4gZt7qbRzxhQ5OfLS8ITFR/yisdPtvmx5ADs7oGalRIEYzhKCGdE7jvN?=
 =?us-ascii?Q?ss5aa+8S5M2A2UADxYPLFqu/ucABejv+1v9rzDKWSOy+5GnS7nKsrGiKD2RH?=
 =?us-ascii?Q?skG4+wTE9NzeSS1n18jKk9Q29iMS82fRcre+OmVnbzNRRGFvtN+fC3eN/oab?=
 =?us-ascii?Q?CDNXj7SVfXIBsdHNTRmAwZr0tZ3+lWPGKLbx75zTEc/UOL+t+ovnjQL7kxD/?=
 =?us-ascii?Q?9e6/VowuVlGcDYvZZSuYad2U84W5tzk=3D?=
X-Exchange-RoutingPolicyChecked: 
	SNnO6Tw6oLdNtr+WJxnPS2W6tBMlTH7h0nUZ8BRXNOE2CJbG0a4dt1E4LyT/oRxabOxkdPPQcXXNqj0DKV1axSpaKgLbDfL668YDSf2OgbQTJfZDFMeCGmSG+HSeCmHx6Uwj4OEZ/y7dloLJmIuuP1Hl+56u3hqasZvG5P40qwKSS93VRbbBNH+tXprqK13BkSgf31zNwCFzRoZjEDXf9xIlmxk6R/CFcMsXSw/HhNjj1CJAJ21hPi+/Upmt4KnhI3r/pgN8XQcbCslFNVzL9nDf5NAl5P2ZD1Im8FoT9BSbH0ICzt+oOdL4ShwuRz1sIj9PMPl4J+UHDfAdw4wIaw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4269074c-de85-4862-10b6-08df13344a25
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7901.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 14:19:01.4234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y2AovkpG+9hp+WLQooOSpqkFvypeR/328wF4eF20TjfyJb7KeEdj4+P1d823/MlQzf1mTrBT0++QECZO966Dxf+oI5gsfrWKf1eX+Z186xU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFDB7809488
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: x2Ilj3vYC-HKO8bYlo0RDxKlx77ncKKE
X-Proofpoint-ORIG-GUID: zTDefwCfAOmI53tCo8flRAuGc3UXZIGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX84hKjk2OG2Lm
 cxVZh1nVF929tni4rYpfaGljYIxCGMNt8TmcmiW+SPNtmgYYR7ePtZ7hMGv23MAEkZll29JonBg
 cFUaZPapeu9OXJZd2y66IOURXUMz8cF4bGOnxC9cwfHViSpwSj85lYxT4yGsVTTdsMSslyInJIc
 lgSddzDm34MUoUYOXNENHxCOWCH/b7dsyeYMXTgDmCFNUDiLbpCKl7/AS4cneRBtSTCa4o608xI
 kVuHqRXMx5kkRboArLaOo8aHHQ3tBM455iE7v9SCH3/A7G7XTTMR47k1SdqbGAedA2PLEAMyP/S
 Y78LR2ALS9H5EnDfZbddF9mBcOlUUrMWqLVLWRXd+ZB0uuXVZidjUyKXF3d277VaNNusP7iN7ok
 8e+QitV+RsloQiKA2Go9n8VRirKCYq8tk42E7cgzfqX7TuHXIH322hv0ziuVsISTuVjDzHqRUTY
 htTc6b+VYjNBTXCMTGg==
X-Authority-Analysis: v=2.4 cv=J5Y/fwnS c=1 sm=1 tr=0 ts=6aa953d7 cx=c_pps
 a=EXmEQszPLboQ/+r5oOSQfg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=NEAV23lmAAAA:8
 a=ei4SEBeUAAAA:8 a=t7CeM3EgAAAA:8 a=km4ZSH52QcTA4ai30IYA:9
 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22 a=Oq4Vy3458gLamwXu4UIl:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDIwOCBTYWx0ZWRfX7tHin742rdRR
 P6r1Y6CVVcLqNlNsvnFrThE7KyMt5R93JrV6SmFtERaCr1C5ipbBOz8sDluQW7i8Hgcpa0xPP/n
 jneuio3iQpSBXI0s5hNOo0zTL0elckLGUho4mQPRm/h3B1Fo8lXz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_04,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150208
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Sep 2026 14:19:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245844

From: Sunil Dora <sunilkumar.dora@windriver.com>

compiler-builtins compiles two sets of sources with cc: the
outline-atomics files it generates into OUT_DIR and the compiler-rt
intrinsics it reads from RUST_COMPILER_RT_ROOT. cc hashes the absolute
source directory into each object file name, so the names change with
the build location.

The added patch strips OUT_DIR or RUST_COMPILER_RT_ROOT before hashing,
falling back to CARGO_MANIFEST_DIR. It replaces
repro-issue-fix-with-cc-crate-hashmap.patch and covers both sets of
sources.

[YOCTO #16376]

Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
---
 ...bject-names-relative-to-source-roots.patch | 71 +++++++++++++++++++
 meta/recipes-devtools/rust/rust-source.inc    |  1 +
 2 files changed, 72 insertions(+)
 create mode 100644 meta/recipes-devtools/rust/files/cc-hash-object-names-r=
elative-to-source-roots.patch

diff --git a/meta/recipes-devtools/rust/files/cc-hash-object-names-relative=
-to-source-roots.patch b/meta/recipes-devtools/rust/files/cc-hash-object-na=
mes-relative-to-source-roots.patch
new file mode 100644
index 0000000000..bd32c8cda0
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/cc-hash-object-names-relative-to-sou=
rce-roots.patch
@@ -0,0 +1,71 @@
+From afb2b50f588cc02042f50aadbd1c28f19bbcd586 Mon Sep 17 00:00:00 2001
+From: Sunil Dora <sunilkumar.dora@windriver.com>
+Date: Tue, 15 Sep 2026 17:05:37 +0530
+Subject: [PATCH] cc: hash object names relative to the root the source came
+ from
+
+compiler-builtins builds two sets of objects with the cc crate: the
+outline-atomics sources (lse_*.S) it generates into OUT_DIR, and the
+compiler-rt C intrinsics it reads from RUST_COMPILER_RT_ROOT. cc hashes the
+absolute source directory into each object file name, so the names change
+with the build location and the shipped rlib is not reproducible.
+
+Strip OUT_DIR or RUST_COMPILER_RT_ROOT before hashing, falling back to
+CARGO_MANIFEST_DIR as upstream already did.
+
+The OUT_DIR part is generic and is proposed upstream as
+rust-lang/cc-rs#1902. RUST_COMPILER_RT_ROOT is set by rust's own build
+system, so that part is not in the upstream submission.
+
+Upstream-Status: Submitted [https://github.com/rust-lang/cc-rs/pull/1902]
+
+Signed-off-by: Sunil Dora <sunilkumar.dora@windriver.com>
+---
+ vendor/cc-1.2.0/.cargo-checksum.json   |  2 +-
+ vendor/cc-1.2.0/src/command_helpers.rs | 18 +++++++++++++++---
+ 2 files changed, 16 insertions(+), 4 deletions(-)
+
+diff --git a/vendor/cc-1.2.0/.cargo-checksum.json b/vendor/cc-1.2.0/.cargo=
-checksum.json
+index 470ecbb..2ff8a08 100644
+--- a/vendor/cc-1.2.0/.cargo-checksum.json
++++ b/vendor/cc-1.2.0/.cargo-checksum.json
+@@ -1 +1 @@
+-{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"b766a70e39b8ea7bb57afd288bcac205a23f6a26ac561=
9cb1d5b10f70c5dfdea","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
+\ No newline at end of file
++{"$comment":"This file only protects against accidental modifications. It=
 is not a security mechanism and does not protect against malicious changes=
.","files":{".cargo_vcs_info.json":"d6e26674a9d7de87dab83262a14f2377988a1e0=
87e4b514f3983f8dd141ea813","CHANGELOG.md":"fb0a3bcb34301d2578bef86feabe9305=
7068cb1906a7f10b584f58ff6123e8c6","Cargo.lock":"b661254fadca74408d53742755b=
371f7ae29e501e851aeae13bcd14a51883321","Cargo.toml":"50debe1b2fc050e8b305bd=
d514509d98cdbc59e96e5f10888df4b6fca19d3a75","Cargo.toml.orig":"0aff9dc74ddb=
e3bfe89ad9698212a6a18d6124b9593780aad25e277d28e9a71f","LICENSE-APACHE":"a60=
eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2","LICENSE-MIT=
":"378f5840b258e2779c39418f3f2d7b2ba96f1c7917dd6be0713f88305dbda397","READM=
E.md":"f1ddbede208a5b78333a25dac0a7598e678e9b601a7d99a791069bddaf180dfe","c=
lippy.toml":"aa7850db4350883c8f373bd0d6b4d19bf3b75f13c1c238e24368c109cb52fb=
1d","src/command_helpers.rs":"010873ba1ab0ea4b7e3b5eac72aed5f50e535d42cb94d=
a943d2aa3d74904aa0f","src/detect_compiler_family.c":"97ca4b021495611e828bec=
ea6187add37414186a16dfedd26c2947cbce6e8b2f","src/lib.rs":"221ba9475100303b5=
c694b2a02e5353452ee08a29e4e4d4d67ea8fcbd87605df","src/parallel/async_execut=
or.rs":"4ce24435fff6b6555b43fee042c16bd65d4150d0346567f246b9190d85b45983","=
src/parallel/job_token.rs":"018a01cb00182270bbcb68e31e7a7c5c621a95f086e4c68=
cfa2bf557ac24e5f2","src/parallel/mod.rs":"bd9c1334d17d138c281961c690b8d8118=
a2d6295a7d6cd7296826255436fa063","src/parallel/stderr.rs":"74384d41198740a6=
fce0877f144262db09fb091225fa8fbfa771314bb11487c6","src/target.rs":"7313240d=
b078ad85c1209a42a5fa96c3692b5d6e5093c7f366a1b99677247109","src/target/apple=
.rs":"6afbecac9f66aa72db55694413532f80b2753f28466a6213d1aa901a03c78bcd","sr=
c/target/generated.rs":"af067e1c291e895ddb591f92534eed0c48977cdb2b58f823942=
3e07c6de31cd3","src/target/llvm.rs":"e1db4a7fb8b905ee9853781f2fcc64a9d3b481=
54e4c8b6cb12f5373c5935da6e","src/target/parser.rs":"4f2129a24273d62bf8ab339=
098e7f758e4e42b0df369dd2b0eb1b20726be91f8","src/tempfile.rs":"ebafb5b0e5d08=
b0706916ed911d4245240e60c3e2d0c9a1630c520842988a2b3","src/tool.rs":"2e65500=
62e021f2b394388172bbb01e86fe6a94d2395bcb3c85a9e86690da1a9","src/utilities.r=
s":"52b30b24a1c31cdefb105309ee5220cfc9fca76eaf4e6d6509c3e19f431448fe","src/=
windows/com.rs":"a2800ddb81215fff2bf618336f5c4ff8e8bdb746dd18b795873c7304b3=
f2a5e3","src/windows/find_tools.rs":"0ff410bd71f08ee88e99609c15be5f1bc16ad7=
bd07a83918d13a70c8465642e2","src/windows/mod.rs":"34cfa201cfbcac7ccaa3ea529=
5d3e4200439af3cc5c6433baf81502596040a89","src/windows/registry.rs":"c521b72=
c825e8095843e73482ffa810ed066ad8bb9f86e6db0c5c143c171aba1","src/windows/set=
up_config.rs":"754439cbab492afd44c9755abcbec1a41c9b2c358131cee2df13c0e996db=
bec8","src/windows/vs_instances.rs":"946527cf8fd32c3472f6a2884dcdec29076310=
1097334c7478f9c24c3950db6b","src/windows/winapi.rs":"250d51c1826d1a2329e988=
9dd9f058cfce253dbf2a678b076147c6cdb5db046c","src/windows/windows_sys.rs":"e=
2714c8307bfa083b9745eb0e46cadd7f98d7b88abf45a7637172019324e34b8","src/windo=
ws/windows_targets.rs":"5b4648ebc22b028caca9f4b4bf8881fe2d094b7bec217264ba2=
e6e2c49d1ccee"},"package":"1aeb932158bd710538c73702db6945cb68a8fb08c519e6e1=
2706b94263b36db8"}
+\ No newline at end of file
+diff --git a/vendor/cc-1.2.0/src/command_helpers.rs b/vendor/cc-1.2.0/src/=
command_helpers.rs
+index adedab2..c911306 100644
+--- a/vendor/cc-1.2.0/src/command_helpers.rs
++++ b/vendor/cc-1.2.0/src/command_helpers.rs
+@@ -315,13 +315,25 @@ pub(crate) fn objects_from_files(files: &[Arc<Path>]=
, dst: &Path) -> Result<Vec<
+=20
+         // Make the dirname relative (if possible) to avoid full system p=
aths influencing the sha
+         // and making the output system-dependent
++        // compiler-builtins generates sources into OUT_DIR and reads the=
 compiler-rt
++        // intrinsics from RUST_COMPILER_RT_ROOT, so try those before the=
 manifest dir
+         //
+         // NOTE: Here we allow using std::env::var (instead of Build::get=
env) because
+         // CARGO_* variables always trigger a rebuild when changed
+         #[allow(clippy::disallowed_methods)]
+-        let dirname =3D if let Some(root) =3D std::env::var_os("CARGO_MAN=
IFEST_DIR") {
+-            let root =3D root.to_string_lossy();
+-            Cow::Borrowed(dirname.strip_prefix(&*root).unwrap_or(&dirname=
))
++        let strip_root =3D |var: &str| {
++            std::env::var_os(var).and_then(|root| {
++                dirname
++                    .strip_prefix(&*root.to_string_lossy())
++                    .map(str::to_owned)
++            })
++        };
++        let dirname =3D if let Some(rel) =3D strip_root("OUT_DIR") {
++            Cow::Owned(rel)
++        } else if let Some(rel) =3D strip_root("RUST_COMPILER_RT_ROOT") {
++            Cow::Owned(rel)
++        } else if let Some(rel) =3D strip_root("CARGO_MANIFEST_DIR") {
++            Cow::Owned(rel)
+         } else {
+             dirname
+         };
+--=20
+2.43.0
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devt=
ools/rust/rust-source.inc
index 28c6d0b1dc..54502ccc9e 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -3,6 +3,7 @@ RUST_VERSION ?=3D "${@d.getVar('PV').split('-')[0]}"
 SRC_URI +=3D "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.=
tar.xz;name=3Drust \
             file://0001-Define-more-ioctl-codes-on-riscv32gc-unknown-linux=
-g.patch;patchdir=3D${RUSTSRC} \
             file://rust-oe-selftest.patch;patchdir=3D${RUSTSRC} \
+            file://cc-hash-object-names-relative-to-source-roots.patch;pat=
chdir=3D${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-ru=
st.patch;patchdir=3D${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch=
;patchdir=3D${RUSTSRC} \
             file://0003-bootstrap-skip-StdarchVerify-when-remote-testing.p=
atch;patchdir=3D${RUSTSRC} \
--=20
2.43.0


