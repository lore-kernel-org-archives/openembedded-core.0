Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B326CD6E4A
	for <webhook@archiver.kernel.org>; Fri, 29 May 2026 13:03:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.9732.1780059787640834663
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 May 2026 06:03:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=edZ5PfdE;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0609487ba5=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64TA0ptc4120323
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 06:03:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=gdio/2TRB
	tPorJ4TuRD/IijF3BgZn+AalPP/vfmCSaY=; b=edZ5PfdE1uYzRO0NHYCUa8vzt
	pgJFfZ0mW5vl2nz9jBsnLch92XiZaF5d301g3BxWsnRbPiFBSm5olTKorLgPtTvP
	bFrq2AL40VK+CqMgnOFTcn8wtqoXSZ5GofenQS8FPKWTDavAPE+5bRdv15A6B3Ou
	kh4v3eMxQ+FoPCMjfREhQghkCXpBwHPTye94Cc1fPqfuE3aO/xXgQOzz57yNHYKy
	B4UPusJI5w4K8u+UZdGn9B8nBnoVUFsKCHhYBAZbiCOArDm+d5RtKtoQK75MeXwb
	mrdg29elJKjGVEJLrDRpSwseJ8xpAPxWn1FH8Y77E0HyWRes5F0u+Bhi+Z8xQ==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013020.outbound.protection.outlook.com [40.93.201.20])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ee7x6tfr0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 06:03:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ytX2BjjQs+iFVUkvPG4gf+YSH5W193bhtgEQrlmhmmD+cLpZQahqcYhhWCm5BAUn9U5KVb1o13yTikROopDga6GIFVZEO7pOy36U+c6ZE+S8fB1weZXeBgOPWZjvccqN7eC46Zde2l2Z9TyJIA52lf41rov7BcMP9FmT0/uPAp3o5WZ2szWtJZQuJ7F0FL2Lf4pk3wC48h0CbkPMvJggi995zo5QgvIlsHeTYqEnScIwPZ447qngbf/4aFe9sOUVrK3ZDmpcBGaVigAZ8bsEcY/ObJGPqGd6CznnsWCIG5f2rAsX3bkqciUlt/OLpXMGCk5BTvBCjmI7e6ko1yeJog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdio/2TRBtPorJ4TuRD/IijF3BgZn+AalPP/vfmCSaY=;
 b=ljXB9lO4OpHugn8jcc8NEJUY0UDI3BXjPZURi9uXBgMzlWCdCUNsaqpJA9Z5fG+sdg58K1Tosii9+Sl/whjizKq09IZcQacSjKJJqzrr1vPhRwm/2LW2vs3bXpN1WBGzwgmRiU+CDmM2nPF9sVv3V00TIvgZ5ntKAASM9JfW56xwDLZgGpwW2B3ALhL/CVzs1XtIg1KSTifrIJodmvHkySAUS3BYSTD8YSqQwCh0o54pghW2m10kfhDqo1UL6kEb4u/ZS3HVP26IlCrAq8VK/llZhwjM58SMCzrX3y34wFSQa9bu+OszRvrcwf5fBBpA06hNTSkvnOrqKt6hU2Dv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DS3PR11MB9842.namprd11.prod.outlook.com (2603:10b6:8:366::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Fri, 29 May
 2026 13:03:04 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0071.011; Fri, 29 May 2026
 13:03:04 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.Macleod@windriver.com
Subject: [PATCH] rust: Upgrade 1.95.0 -> 1.96.0
Date: Fri, 29 May 2026 06:02:41 -0700
Message-ID: <20260529130241.387818-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0574.namprd03.prod.outlook.com
 (2603:10b6:408:10d::9) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DS3PR11MB9842:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f37723a-2049-40f2-6e41-08debd829e99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|11063799006|5023799004|56012099006|29003799003|3023799007|6133799003|12006099003|18002099003|25016099003;
X-Microsoft-Antispam-Message-Info: 
	REVTzgCsNyXCqSBi8yWIkiO+KN1AhdqjdRriOHMefmNE6jNsN/B1TeZDkRZyjs7NgAC/HrO5VmuYwzehZGZx1AUSMiDJdxqIvmeoc00e6TlQgdUD1/JWGedYtZIa1PDtSQ9T38N+oqEWNvGnY6VeAy9q1kQiHTY+ggPnzpU285v1jOkPJ5tAmOt5Hf5kK5ZbXZ75hjUkVGYfW/vGanfA2vwk9BGF16Rxu1/h0MjU99TD42gC9ok9yi0bXHUFTqwCi0WU63KOBQaUJvkGLKbQ+EeFNoq2ir02YhAyuFj/gDx/XplPoT6PshP8xQN9vaUGrLOsG/nAFj74Wmwe6hxwAwYnR0DmhZUjEY/7XYuaUdoBEwqXrNUurbAYHKxEUPW1lLOBJAVAwyDKlIcc+zhD4TwnAuFI6SilFHtOWZHRvuSJW0dNfdySknyAG8pK0kOEeS/1xpjeH/dc04jVMMvpFgBGhyhx8+lCCpShFNOcKMQC790Vg1DIhw9yfExkiMuWEkxp2x4K19b5iukjDCm7TJLP+oPipJg5goLIyO7GNlttAq2k6Gi0CtUL8Z6E0pjDg3Ej9HCokPi5Vne+47RHmsKuJNWpdyf5eqEuX8g5l9fGEsSFXW8opxO4GOkqovhucKUoRKn1k/srJYWty6DrfdL7cGCbD0ZR9154P6uYLbQxUmfGvt/GGxXbyOyjO9BP
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(11063799006)(5023799004)(56012099006)(29003799003)(3023799007)(6133799003)(12006099003)(18002099003)(25016099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?hgZ4ka4YhSG3QxgMDzPFaPgc32DtQaa23UhWr2Oro9UWf2WaNr8ncTVKpFpi?=
 =?us-ascii?Q?uKzoUAjuYXT8XQvNZZ/5Dt1oh4oaAxg+xpX4esdHaPSaO1TsQ8Tdz1hyfEIT?=
 =?us-ascii?Q?cjnvn9z8XNcfyrZML4p7MFpltTj2IPWgTW7zuoQq1E112Sb8UbM1urO13CSd?=
 =?us-ascii?Q?vBBozGVP5D+EPkVArPrD35YGyEQVyKhPHZ4geTSYe6Icl9FSQdtpPrH1EpMb?=
 =?us-ascii?Q?Fc5JCTle4dcJOqi3N63x7twwK6VlrdUJ5+SylojC/OrJTyAVmu80xgYhYOvd?=
 =?us-ascii?Q?QNPfXF/7eu7hjEN5RDa6TcGfKCd+g+pKkkZoypqL696R1QPF3zL2iOwwTiIG?=
 =?us-ascii?Q?3YPQiWCBxZMsPq+Tuf0t+/5oyLSH0Oejmb9pNZOb4j6OOlZcvs5Nak/7YbZB?=
 =?us-ascii?Q?ZlCTKOt6kV178DdjxaPf9T+13Mwzw2Xko4Q/AChQCXGMhTSuM8AFNZfrKvfy?=
 =?us-ascii?Q?rUMKBp+0spEh/AgQmg07lJkHtypSjUe5VNl55lHAEHvAID8q5F1TXLqKVG8k?=
 =?us-ascii?Q?8azE44eiYtWOfdJ6+NlAzR0pdfbjhJJNRu0mkYTq7tVOVWi3CdLYHlksdz3e?=
 =?us-ascii?Q?4v3opFug4qJ66m8CbNenShFmnSwzyX2hxsd+wiZSAsdubfGMXxgbymaeq+24?=
 =?us-ascii?Q?1wychsoQUVa7yXXhDuu3CKHjaOidib8CWS9jf0WbDnOBj56KZk1J5ZgMu5NP?=
 =?us-ascii?Q?Qj8g2iQtzzWKDiqecQE+jV4S1qwdmP6JvefUn/KxeV5+VaZvJp664k+w8wW0?=
 =?us-ascii?Q?AVq1iH9PnP+BanIypTMPZ9TjcytwHr4zh045RFwja0KmFCUMItFHrlFJjuSD?=
 =?us-ascii?Q?pyExYsDtGe9kKPvO/1dP3/2e0vKRUlUvbV+e4n3394qHyeNQjWID2aElYXK2?=
 =?us-ascii?Q?t8E5p6CgF2Q/QO/pr9No9KBQkOGV0e5trd7puaSJ0UCDLp1pnTqgYTkWyVIQ?=
 =?us-ascii?Q?r0etWnMPkktPUfNNWzfYYU6IIUPz8fScNkrHaHTt6o/umrJd1+93zUwgCkRY?=
 =?us-ascii?Q?Vfp3CFB2YY5/c8CdF+oksk57tb18MvtTqxjzElcx9YDjLzz6eoeG+r7V9loT?=
 =?us-ascii?Q?Kzzjxb/jO9OTaVWrlyP6oMiHyLZFAhGecY734plPCN274TW4cA0LmVJWpgN5?=
 =?us-ascii?Q?9avFquNXIySXxSBxJg/A/VwViLEK9bBBpEVgd28R+P6kD6dWjUFsVsYHbGmU?=
 =?us-ascii?Q?z2c763HyJfKVYb+1rG5E/D9E6UqRhD77InNaqZfWjvBIeoHECnqgVdX9+/2S?=
 =?us-ascii?Q?HKcSCJH7fKfHU5fvOGgXysbacpYmUUeb4On5Ftmqx27LJOeKlcSsxv2R+DRN?=
 =?us-ascii?Q?voQfObAaZ5B50nLqjwdHZkVJNXNaRYWCG9T+S91ROvgqQRY3OEsvLkYZ5RyH?=
 =?us-ascii?Q?ZvF3qpM/qTAuly0FDRHxztrbwBdhuLADc1q8QGIaJcGelOwV3G+JuvMuuEpp?=
 =?us-ascii?Q?ngNfHoXqRChqyCwbSAbVb0A9/oKgTUKuXzV5CO6/G2EmYWyIc8kdIKMv1YTn?=
 =?us-ascii?Q?fbxuFxtR4IjRWitm1L3ck2ALBUGAsR8Wq9cmj/JkwWX9V/xEF8ahm5aGhNjr?=
 =?us-ascii?Q?Me3VehfoQkvyA2qC+BUVHFdHof6aQkZxO+ifhZ3Ue6915IPIUkF/QeGcTEto?=
 =?us-ascii?Q?SMPx21BWpO2K+GJa5Hy8DzOLUZMNdf9aimjQ940dc72YE49nr5d7498lzFQD?=
 =?us-ascii?Q?F+SnnJAP3a3CVp4owgkFEL/K1v2nDp9VQQgiVNhsGFtI47os68RnN2lM2ybN?=
 =?us-ascii?Q?Sb4JDFpEjVC0rUoIE7Cf/NIIHPRsky3nNdCvKaWCumRCLhFn9gYD?=
X-Exchange-RoutingPolicyChecked: 
	KaSl4kWn9fit/VzSx7mfKqYJqT11pYJPk7qLhwimK6xX/IZTRfHZ6yKLbU356xUVbKcDvB/d4oneIpcF0rqef5VJ8NSIkJ1D6o8Qkripl0DgV4JiXX5VeD57sQiDQuZyq/sKTCcBdECCfZhX/lked2A+z9dbOA/SVCW0wq9uIBLap7Ik20RfzQz1UaK4y9k+4baCwwjIh5EntvLV5ezol6e2LdlzLJjR53nxD7XuYixwt/psSbQ7j/+yRvesx1eifQBPfZbwkCH3WLYINC/TsKIvfPlIBR5b4lWs4iY8f4Utzlym6cFq1i4vdQWfEqwrufFQh0em/xHh6+KaecJLSA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f37723a-2049-40f2-6e41-08debd829e99
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2026 13:03:04.1191
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NQZLLotziX8PZT1upuAUdeiKEGa4XR5HkBWqATPVnFoFppH5YF+kxChB5tzE0c8QzaMWBuqu+4qYEIfPeJZF3a3qJ24RD12+bKx/GtmtzPUNQRnfa/eFo69rItnJ0kre
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS3PR11MB9842
X-Proofpoint-GUID: mDVt-bjO7XggyJz9pyIjsrMOqSeoK1DR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDEzMCBTYWx0ZWRfX7AWoWccYhIs8
 Tf6doV14UQejf97f85V42HRFsbrRnELZ4rucUGYBPJi112FcnvVGznGybbylwpYAEu7aiA6b3v7
 8Mn7w4Aemu+GwaGWCLy6hpAC+3WWXri7l8wn7WNKVI3Sn0bMyar1cmH7duQD1Cni7e9qJkBdfoE
 y9EDTEVUqF31/H/Gi4bJimPkbp/EMez5Wvo4PjaMsWa9tp6m+IQUQUGIpAR7nTBi7J0sRA6sVvZ
 wQEoo+vHwmAxspk2oUPfWdOj6eqDawAW1IjK1nl8E0x0+0tKesvPTRnAYZnQKRHOMLElL/wn88c
 YHWBbUeUPCltAwEF4QuE1g+H06iTckk9DM+q+XDW4zhIzLGY7RWtWkcdsGqiXIoNVir9tGgOqMA
 RQaCWrDrUlADPxWFIVlKgS2R8oo/8roXIFdL4Uar+Cac6OzQNsNp8wGYLhCtfcevDCNOjMoin1O
 MRl0QM0qVD0NvtV9hrw==
X-Proofpoint-ORIG-GUID: mDVt-bjO7XggyJz9pyIjsrMOqSeoK1DR
X-Authority-Analysis: v=2.4 cv=FcEHAp+6 c=1 sm=1 tr=0 ts=6a198e8b cx=c_pps
 a=H6CWIJr9C+/oc5/J52O/6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=iKiJcTA2PjBS6x5JeXcw:22 a=j57RdskLAAAA:20
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=_fNYhuag-04cYfqooLgA:9 a=cO8TMzxgm8iXXAZu:21 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290130
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 May 2026 13:03:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/237752

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.96.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-196-2026-05-28

Drop merged patches:
0001-Update-call-llvm-intrinsics-test.patch
0001-Fix-multiple-option-or-permutations-test-for-big-end.patch

Updated patches:
rust-oe-selftest.patch

New patch:
0003-explicit-tail-calls-disable-two-tests.patch
Backport two commits that disable two failing tests on LoongArch.

Selftest Changes:
Ignore one failing test for riscv64
tests/assembly-llvm/riscv-redundant-memory-stores.rs
https://github.com/rust-lang/rust/issues/157074

Excluded tests:
+--------+----------+---------+
| Before  |  After  | Skipped |
+---------+---------+---------+
|   39    |   40    |   +1    |
+--------+----------+---------+

Test results:

rust v1.96.0
+-------------+---------+---------+
| Machine     | Passed  | Skipped |
+-------------+---------+---------+
| qemux86-64  |  22436  |   732   |
| qemux86     |  22190  |   978   |
| qemuarm64   |  22262  |   906   |
| qemuarm     |  22172  |   996   |
| qemuriscv64 |  22216  |   952   |
+-------------+---------+---------+

Test results difference (1.96.0 - 1.95.0):

+-------------+--------+---------+
| Machine     | Passed | Skipped |
+-------------+--------+---------+
| qemux86-64  |  +249  |   +43   |
| qemux86     |  +261  |   +31   |
| qemuarm64   |  +268  |   +24   |
| qemuarm     |  +262  |   +30   |
| qemuriscv64 |  +261  |   +31   |
+-------------+--------+---------+

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 .../rust/{cargo_1.95.0.bb => cargo_1.96.0.bb} |   0
 ...ion-or-permutations-test-for-big-end.patch | 121 ------------------
 ...001-Update-call-llvm-intrinsics-test.patch |  86 -------------
 ...xplicit-tail-calls-disable-two-tests.patch |  39 ++++++
 .../rust/files/rust-oe-selftest.patch         |  21 ++-
 ...ibstd-rs_1.95.0.bb => libstd-rs_1.96.0.bb} |   0
 ....95.0.bb => rust-cross-canadian_1.96.0.bb} |   0
 meta/recipes-devtools/rust/rust-snapshot.inc  | 104 +++++++--------
 meta/recipes-devtools/rust/rust-source.inc    |   5 +-
 .../rust/{rust_1.95.0.bb => rust_1.96.0.bb}   |   0
 11 files changed, 111 insertions(+), 267 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.95.0.bb => cargo_1.96.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
 create mode 100644 meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two-tests.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.95.0.bb => libstd-rs_1.96.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.95.0.bb => rust-cross-canadian_1.96.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.95.0.bb => rust_1.96.0.bb} (100%)

diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 33d3efd845..c0d9f8fafe 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -12,7 +12,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 GCCVERSION ?= "16.%"
 SDKGCCVERSION ?= "${GCCVERSION}"
 GLIBCVERSION ?= "2.43%"
-RUSTVERSION ?= "1.95.0%"
+RUSTVERSION ?= "1.96.0%"
 
 PREFERRED_VERSION_gcc ?= "${GCCVERSION}"
 PREFERRED_VERSION_gcc-cross-${TARGET_ARCH} ?= "${GCCVERSION}"
diff --git a/meta/recipes-devtools/rust/cargo_1.95.0.bb b/meta/recipes-devtools/rust/cargo_1.96.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.95.0.bb
rename to meta/recipes-devtools/rust/cargo_1.96.0.bb
diff --git a/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch b/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
deleted file mode 100644
index a36089cf3a..0000000000
--- a/meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
+++ /dev/null
@@ -1,121 +0,0 @@
-From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
-From: Ryan Ward <rwardd@users.noreply.github.com>
-Date: Tue, 28 Jan 2026 12:21:35 +0000
-Subject: [PATCH] Fix multiple-option-or-permutations test for big-endian
- targets
-
-The FileCheck tests for Option::or on slices assumed little-endian
-layout. On big-endian targets (e.g. powerpc), the Option discriminant
-resides in the high byte, so LLVM emits an lshr before the trunc.
-
-Add only-endian-big directive support and use BIG/LITTLE revisions to
-cover both cases.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/151780]
-Signed-off-by: Ryan Ward <rwardd@users.noreply.github.com>
-Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
----
- .../compiletest/src/directives/directive_names.rs     |  1 +
- .../issues/multiple-option-or-permutations.rs         | 47 ++++++++++++++++--
- 2 files changed, 44 insertions(+), 4 deletions(-)
-
-diff --git a/src/tools/compiletest/src/directives/directive_names.rs b/src/tools/compiletest/src/directives/directive_names.rs
-index 9813ac7ff500d..334b2dda343a5 100644
---- a/src/tools/compiletest/src/directives/directive_names.rs
-+++ b/src/tools/compiletest/src/directives/directive_names.rs
-@@ -218,6 +218,7 @@ pub(crate) const KNOWN_DIRECTIVE_NAMES: &[&str] = &[
-     "only-eabihf",
-     "only-elf",
-     "only-emscripten",
-+    "only-endian-big",
-     "only-gnu",
-     "only-i686-pc-windows-gnu",
-     "only-i686-pc-windows-msvc",
-diff --git a/tests/codegen-llvm/issues/multiple-option-or-permutations.rs b/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
-index 9ec4ec8eeb159..8756d45eaa03e 100644
---- a/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
-+++ b/tests/codegen-llvm/issues/multiple-option-or-permutations.rs
-@@ -1,4 +1,7 @@
- // Tests output of multiple permutations of `Option::or`
-+//@ revisions: LITTLE BIG
-+//@ [BIG] only-endian-big
-+//@ [LITTLE] ignore-endian-big
- //@ compile-flags: -Copt-level=3 -Zmerge-functions=disabled
- 
- #![crate_type = "lib"]
-@@ -70,8 +73,16 @@ pub fn if_some_u8(opta: Option<u8>, optb: Option<u8>) -> Option<u8> {
- #[no_mangle]
- pub fn or_match_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
-     // CHECK: start:
--    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
--    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
-+    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
-+    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
-+    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
-+    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
-+    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
-+    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
-+    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
-     // CHECK: ret i16 [[R]]
-     match opta {
-         Some(x) => Some(x),
-@@ -84,8 +95,16 @@ pub fn or_match_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
- #[no_mangle]
- pub fn or_match_slice_alt_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
-     // CHECK: start:
--    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
--    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
-+    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
-+    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
-+    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
-+    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
-+    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
-+    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
-+    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
-     // CHECK: ret i16 [[R]]
-     match opta {
-         Some(_) => opta,
-@@ -98,8 +117,16 @@ pub fn or_match_slice_alt_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
- #[no_mangle]
- pub fn option_or_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
-     // CHECK: start:
--    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
--    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
-+    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
-+    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
-+    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
-+    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
-+    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
-+    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
-+    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
-     // CHECK: ret i16 [[R]]
-     opta.or(optb)
- }
-@@ -109,8 +136,16 @@ pub fn option_or_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
- #[no_mangle]
- pub fn if_some_slice_u8(opta: Option<[u8; 1]>, optb: Option<[u8; 1]>) -> Option<[u8; 1]> {
-     // CHECK: start:
--    // CHECK-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
--    // CHECK-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // LITTLE-NEXT: [[SOME_A:%.+]] = trunc i16 %0 to i1
-+    // LITTLE-NEXT: [[R:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[OPT_A:%.+]] = lshr i16 %0, 8
-+    // BIG-NEXT: [[SOME_A:%.+]] = trunc i16 [[OPT_A]] to i1
-+    // BIG-NEXT: [[OPT_B:%.+]] = lshr i16 %1, 8
-+    // BIG-NEXT: [[A_OR_B:%.+]] = select i1 [[SOME_A]], i16 [[OPT_A]], i16 [[OPT_B]]
-+    // BIG-NEXT: [[AGGREGATE:%.+]] = select i1 [[SOME_A]], i16 %0, i16 %1
-+    // BIG-NEXT: [[R_LOWER:%.+]] = and i16 [[AGGREGATE]], 255
-+    // BIG-NEXT: [[R_UPPER:%.+]] = shl nuw i16 [[A_OR_B]], 8
-+    // BIG-NEXT: [[R:%.+]] = or disjoint i16 [[R_UPPER]], [[R_LOWER]]
-     // CHECK: ret i16 [[R]]
-     if opta.is_some() { opta } else { optb }
- }
diff --git a/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch b/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
deleted file mode 100644
index 9fa91c0002..0000000000
--- a/meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
+++ /dev/null
@@ -1,86 +0,0 @@
-From 1d678f6b0859ea25c2abc22eb4104a025a5737e4 Mon Sep 17 00:00:00 2001
-From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
-Date: Mon, 2 Mar 2026 04:22:23 -0800
-Subject: [PATCH] Update call-llvm-intrinsics test for Rust 1.94.0 IR and
- multi-target CI
-
-Rust 1.94 now passes constants directly to llvm.sqrt.f32 instead of
-storing/loading via the stack.
-
-- Updated the FileCheck pattern to match the new IR:
-    // CHECK: call float @llvm.sqrt.f32(float 4.000000e+00)
-  The test intent is unchanged: it still ensures the intrinsic is
-  emitted as a 'call' (not 'invoke').
-
-- Removed unnecessary local variables and Drop usage to work in
-  `#![no_core]` mode with minicore.
-
-- Added required crate attributes:
-    #![feature(no_core, lang_items)]
-    #![no_std]
-    #![no_core]
-
-- Replaced `//@ only-riscv64` (host-based execution) with explicit
-  revisions for:
-      riscv32gc-unknown-linux-gnu
-      riscv64gc-unknown-linux-gnu
-  This ensures deterministic multi-target coverage in CI without
-  relying on the host architecture.
-
-- Added `//@ needs-llvm-components: riscv` and
-  `//@ min-llvm-version: 21` for CI compatibility.
-
-Upstream-Status: Backport [https://github.com/rust-lang/rust/pull/153285]
-Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
----
- .../riscv-abi/call-llvm-intrinsics.rs         | 26 +++++++++----------
- 1 file changed, 13 insertions(+), 13 deletions(-)
-
-diff --git a/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs b/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
-index e72a649a530..fb520d38df3 100644
---- a/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
-+++ b/tests/codegen-llvm/riscv-abi/call-llvm-intrinsics.rs
-@@ -1,17 +1,20 @@
-+//@ add-minicore
- //@ compile-flags: -C no-prepopulate-passes
--
--//@ only-riscv64
-+//@ revisions: riscv32gc riscv64gc
-+//@ [riscv32gc] compile-flags: --target riscv32gc-unknown-linux-gnu
-+//@ [riscv32gc] needs-llvm-components: riscv
-+//@ [riscv64gc] compile-flags: --target riscv64gc-unknown-linux-gnu
-+//@ [riscv64gc] needs-llvm-components: riscv
-+//@ min-llvm-version: 21
-
- #![feature(link_llvm_intrinsics)]
-+#![feature(no_core, lang_items)]
-+#![no_std]
-+#![no_core]
- #![crate_type = "lib"]
-
--struct A;
--
--impl Drop for A {
--    fn drop(&mut self) {
--        println!("A");
--    }
--}
-+extern crate minicore;
-+use minicore::*;
-
- extern "C" {
-     #[link_name = "llvm.sqrt.f32"]
-@@ -19,12 +22,9 @@ fn drop(&mut self) {
- }
-
- pub fn do_call() {
--    let _a = A;
--
-     unsafe {
-         // Ensure that we `call` LLVM intrinsics instead of trying to `invoke` them
--        // CHECK: store float 4.000000e+00, ptr %{{.}}, align 4
--        // CHECK: call float @llvm.sqrt.f32(float %{{.}}
-+        // CHECK: call float @llvm.sqrt.f32(float 4.000000e+00)
-         sqrt(4.0);
-     }
- }
diff --git a/meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two-tests.patch b/meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two-tests.patch
new file mode 100644
index 0000000000..7df6800c45
--- /dev/null
+++ b/meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two-tests.patch
@@ -0,0 +1,39 @@
+Backport two commits that disable two failing tests on LoongArch.
+
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/fb9e970c1f9377fa6c093f18aabab76204a18ea4]
+Upstream-Status: Backport [https://github.com/rust-lang/rust/commit/250beb317422dad63d9bdefee9d82c55a732ba60]
+
+Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
+
+diff --git a/tests/ui/explicit-tail-calls/support/bystack.rs b/tests/ui/explicit-tail-calls/support/bystack.rs
+index ad1e082..b0ac29e 100644
+--- a/tests/ui/explicit-tail-calls/support/bystack.rs
++++ b/tests/ui/explicit-tail-calls/support/bystack.rs
+@@ -36,9 +36,11 @@
+ //@ revisions: loongarch32
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none
+ //@[loongarch32] needs-llvm-components: loongarch
++//@[loongarch32] ignore-llvm-version: 22 - 23
+ //@ revisions: loongarch64
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
+ //@[loongarch64] needs-llvm-components: loongarch
++//@[loongarch64] ignore-llvm-version: 22 - 23
+ //@ revisions: bpf
+ //@[bpf] compile-flags: --target bpfeb-unknown-none
+ //@[bpf] needs-llvm-components: bpf
+diff --git a/tests/ui/explicit-tail-calls/support/byval.rs b/tests/ui/explicit-tail-calls/support/byval.rs
+index 965c63c..d29d0d8 100644
+--- a/tests/ui/explicit-tail-calls/support/byval.rs
++++ b/tests/ui/explicit-tail-calls/support/byval.rs
+@@ -36,9 +36,11 @@
+ //@ revisions: loongarch32
+ //@[loongarch32] compile-flags: --target loongarch32-unknown-none
+ //@[loongarch32] needs-llvm-components: loongarch
++//@[loongarch32] ignore-llvm-version: 22 - 23
+ //@ revisions: loongarch64
+ //@[loongarch64] compile-flags: --target loongarch64-unknown-linux-gnu
+ //@[loongarch64] needs-llvm-components: loongarch
++//@[loongarch64] ignore-llvm-version: 22 - 23
+ //@ revisions: bpf
+ //@[bpf] compile-flags: --target bpfeb-unknown-none
+ //@[bpf] needs-llvm-components: bpf
diff --git a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
index 0ecfc7cad4..44fe7723db 100644
--- a/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
+++ b/meta/recipes-devtools/rust/files/rust-oe-selftest.patch
@@ -152,7 +152,7 @@ diff --git a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs b/compiler/r
 index 160af8a65d..686f4607bb 100644
 --- a/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
 +++ b/compiler/rustc_data_structures/src/tagged_ptr/tests.rs
-@@ -39,6 +39,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
+@@ -43,6 +43,7 @@ use crate::stable_hasher::{HashStable, StableHasher};
  }
 
  #[test]
@@ -195,7 +195,7 @@ diff --git a/compiler/rustc_data_structures/src/vec_cache/tests.rs b/compiler/ru
 index a05f274136..0e69b4cb98 100644
 --- a/compiler/rustc_data_structures/src/vec_cache/tests.rs
 +++ b/compiler/rustc_data_structures/src/vec_cache/tests.rs
-@@ -17,6 +17,7 @@ fn vec_cache_insert_and_check() {
+@@ -53,6 +53,7 @@ fn vec_cache_insert_and_check() {
  }
 
  #[test]
@@ -219,9 +219,10 @@ diff --git a/tests/ui/linking/executable-no-mangle-strip.rs b/tests/ui/linking/e
 index cc283dc53..73cbab9c0 100644
 --- a/tests/ui/linking/executable-no-mangle-strip.rs
 +++ b/tests/ui/linking/executable-no-mangle-strip.rs
-@@ -1,5 +1,7 @@
+@@ -1,6 +1,8 @@
  //@ run-pass
  //@ ignore-windows-gnu: only statics marked with used can be GC-ed on windows-gnu
+ //@ ignore-wasm: wasm, for better or worse, exports all #[no_mangle]
 +//@ ignore-powerpc: this test is not working on powerpc
 +//  bug report: https://github.com/rust-lang/rust/issues/144777
  
@@ -279,7 +280,7 @@ index 89c61cd..144ea0e 100644
  use std::process::ExitCode;
 
  // A note about jemalloc: rustc uses jemalloc when built for CI and
-@@ -38,6 +38,7 @@
+@@ -41,6 +41,7 @@
  #[cfg(feature = "jemalloc")]
  use tikv_jemalloc_sys as _;
 
@@ -287,3 +288,15 @@ index 89c61cd..144ea0e 100644
  fn main() -> ExitCode {
      rustc_driver::main()
  }
+diff --git a/tests/assembly-llvm/riscv-redundant-memory-stores.rs b/tests/assembly-llvm/riscv-redundant-memory-stores.rs
+index acdb69d..2220e6d 100644
+--- a/tests/assembly-llvm/riscv-redundant-memory-stores.rs
++++ b/tests/assembly-llvm/riscv-redundant-memory-stores.rs
+@@ -4,6 +4,7 @@
+ //@ compile-flags: -Copt-level=3 --target riscv64gc-unknown-linux-gnu
+ //@ needs-llvm-components: riscv
+ //@ only-riscv64
++//@ ignore-riscv64
+
+ pub struct SomeComplexType {
+     a: u64,
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.95.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.96.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.95.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.96.0.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.95.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.96.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.95.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.96.0.bb
diff --git a/meta/recipes-devtools/rust/rust-snapshot.inc b/meta/recipes-devtools/rust/rust-snapshot.inc
index d914cfd081..dd28f91d3a 100644
--- a/meta/recipes-devtools/rust/rust-snapshot.inc
+++ b/meta/recipes-devtools/rust/rust-snapshot.inc
@@ -4,58 +4,58 @@
 ## The exact (previous) version that has been used is specified in the source tarball.
 ## The version is replicated here.
 
-SNAPSHOT_VERSION = "1.94.0"
-
-SRC_URI[rustc-snapshot-aarch64.sha256sum] = "7261b2fcdb88aef8b21f4b9f915d9a75c959674193f5b38e13fab4569684fc5b"
-SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "c781b3ef4fefa5508fbe05820eddc95e46351d905a30921cc020febd9c596a2e"
-SRC_URI[cargo-snapshot-aarch64.sha256sum] = "d57ab7b23b52cba46e58c78327904d0c7db19892988677b0d59495c8af4bb790"
-SRC_URI[clippy-snapshot-aarch64.sha256sum] = "f7450c414e394450b53be602d37c374e2a2c5a2f51be2b54faf3d1e3272160b1"
-
-SRC_URI[rustc-snapshot-i686.sha256sum] = "4d399ca0126adf0225340dc291623a47256b39be1d2567ad76dcd8990c2d6935"
-SRC_URI[rust-std-snapshot-i686.sha256sum] = "528c1dda491b25bb855426f48757773f4740c75d3c7271efffe7412c2fd5730d"
-SRC_URI[cargo-snapshot-i686.sha256sum] = "8699cfc772af3f651bf61e84a5b292e2ea62de9e1ab12d70e1384e57a5e91690"
-SRC_URI[clippy-snapshot-i686.sha256sum] = "54a3219f0541c080bc8e600c3cfe63d60963eb361c79fd645dd1b171019c4dac"
-
-SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "5392936010d422d7b8e5b83ba6c314da16f0d2b33fe57fdaf340b1e8a4a3a0fa"
-SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "a42ebd0c280f987f8c604fcb4549886f8954e7d025d54da3e63a5621ed268dd5"
-SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "83bda8ec4b506646eddab2b7b67e67f2fd9fccb74693a2558383868d82b85668"
-SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "98de442bc183acef748ae1f177498045bf8cbcf03ece6e75c2befa98fae8841b"
-
-SRC_URI[rustc-snapshot-powerpc.sha256sum] = "443475d3e1ec21d1f34b09f0cd6d1f10551535a736048ce7e21d7fa4faeb63c3"
-SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "23e32cab484d7787b7966a0508c49baf231bcdb4a79a421ee85ca69e81f2a06f"
-SRC_URI[cargo-snapshot-powerpc.sha256sum] = "3274ccfb125035dc5846649b0bdce855f15c7a1824507360840c6a152599e4cf"
-SRC_URI[clippy-snapshot-powerpc.sha256sum] = "3a38eb50a04557801e50e2ab04e9e5db8f3f8f22dfea53d9a483efe1ea251129"
-
-SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "89874c3bebc35ace3b0d0dd225154e583a88caafe2c3d04476b21e4a6650f715"
-SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "7713b676a37fbd0a52a711c2e3c205a917f8b05614e17cd9f7f37874a88469a3"
-SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "3c618a93585244a6fd70a857061b781590262f5f430f710f3687d5eaf54940bd"
-SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "209d292768bf89c8fc65f434257f7be39a7155e2b4590d917f3d873ce7f35fd3"
-
-SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "7fcdb850568508c0737e9079383f2aade49b1ee159620e67e041d0b756bfe4b5"
-SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "094f3955828d6630b70a9c7c71e3165c3ffc7a301929601dde08501def623347"
-SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "6b44ebc7f08464e3a60ff16580729a99e727c7d4c2368a2d4b62d1acf4fd5c11"
-SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "11dc62c3b286dad9e22d9f0005dd75dcbb527da02b44f0729351dba5277f39c8"
-
-SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "ad0e35e45ceb4e874653444c393bc3b969da78729d92dc3d8852b0fd2eddcec6"
-SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "32e9b7006f1269e48fb65af6298f6e8a222e1a8a2a20b112528bfb3dad2f65a8"
-SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "61795ca964c0b08faef359db32c3409e3348ed2bd7b4cad481b3c8cf8654b5d6"
-SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "c6ca11e8d361fcce46c684239ea2debfc53b97def7db0c2ff7014894de22b220"
-
-SRC_URI[rustc-snapshot-s390x.sha256sum] = "9167f4a85ef250d6e613bdd3993d723fd225df67665fd2dbe61b0c780009c8e3"
-SRC_URI[rust-std-snapshot-s390x.sha256sum] = "ea69833addbc9521664464418c7468871f7a80b16fd2c385f6213a6c99cedfe9"
-SRC_URI[cargo-snapshot-s390x.sha256sum] = "f32f72efff179de4871fb5f5a3e030092d279ca70a71f0a4e49b3c8f69ef7ac4"
-SRC_URI[clippy-snapshot-s390x.sha256sum] = "8195f54d3ade3cbb7beb51df21cdc8ba30b6c72dbb9d9106eee10ea781a15062"
-
-SRC_URI[rustc-snapshot-x86_64.sha256sum] = "31a0d3ac9383dfdeb4fce86eeed5ade3230131c635264c0eab7252dbf235f28e"
-SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "dd33653107c36e040082050d9e547e64dac5b456ba74069430d838c00c189a05"
-SRC_URI[cargo-snapshot-x86_64.sha256sum] = "8e17624f3de39e079845bfb25ed15a042f4b50ceca78e37c56c4b9b15949b9f7"
-SRC_URI[clippy-snapshot-x86_64.sha256sum] = "935529b0b9150084fa9cc1734c6598efe86b6e7d76f31ad3f8d4bb79ebf6031a"
-
-SRC_URI[rust-std-snapshot-i586.sha256sum] = "9347cfdc1383f4d71db1d63960f289977abc93ee575ca84748516995a05fac94"
-
-SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] = "f0b68c16c81b96562e039ff298dbf6a833cab112340c3b4bbd44dd3b45db6a31"
-
-SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "8f611aa779732057742fa289e7581bde48af1c97014c1f92fd21b5682eff1a16"
+SNAPSHOT_VERSION = "1.95.0"
+
+SRC_URI[rustc-snapshot-aarch64.sha256sum] = "0fe3689eeaed603e5ef24572d11597d3edadaefd2cb181674ad621260f2501d2"
+SRC_URI[rust-std-snapshot-aarch64.sha256sum] = "3a21b271b1ff973b94d69b25e7a39992f9fbcae1ab6d9475844a23e6ad3908ac"
+SRC_URI[cargo-snapshot-aarch64.sha256sum] = "7c070aeba9bbf12073646995a03f36c346bb5f541d0078ba6d9dc2a7adaaf6af"
+SRC_URI[clippy-snapshot-aarch64.sha256sum] = "fb021e0c0fc2238be9266d7614f4a26bc372544c4cba3528d729ab24ad229fc9"
+
+SRC_URI[rustc-snapshot-i686.sha256sum] = "420f8fe21a8f668112d452b9d9533591c7dbb534fb13bcde9d5c8e56131b4456"
+SRC_URI[rust-std-snapshot-i686.sha256sum] = "527c5d5249a7f77b48d3c9da3ac512d27b47f43d08dbe3c6f82a3d5b35d8aa27"
+SRC_URI[cargo-snapshot-i686.sha256sum] = "5292abf16427edd5e759f15177a3275ad21826e7a19fec58bf2ed6fd0b301f20"
+SRC_URI[clippy-snapshot-i686.sha256sum] = "8a6484dd4dee723a043006b9bdfc7b8440f83cff8662321ff28fa941d6f45b1e"
+
+SRC_URI[rustc-snapshot-loongarch64.sha256sum] = "b1d248bcccbaf5a53a335c8882022af4f40879ac11ea85c1bac0500ed010fe33"
+SRC_URI[rust-std-snapshot-loongarch64.sha256sum] = "eaf2c37c3293eea742e7ab20f25718ab19c93bd381df8823113fce70460c19c3"
+SRC_URI[cargo-snapshot-loongarch64.sha256sum] = "7203c690167b73dbe4c7cce03d302b437c1c422b6c3258a7c46d7fc1515820f8"
+SRC_URI[clippy-snapshot-loongarch64.sha256sum] = "fa0e8be99ddf2aca72aa7a911ecf43da80243a9a400d8c9d9c9c3ea994848bdb"
+
+SRC_URI[rustc-snapshot-powerpc.sha256sum] = "a0c42a1dc1aa7e06db4f17cdcce6a150c803e99118923ccddf88d66677acf48e"
+SRC_URI[rust-std-snapshot-powerpc.sha256sum] = "59e0abbaa246502521e37c55b8d6cf88d5b8a697b0c70c61ec189937308f7246"
+SRC_URI[cargo-snapshot-powerpc.sha256sum] = "71ef5259df76102d0380c2a912384ac61ea280211fc4e2087744c476f2c8694b"
+SRC_URI[clippy-snapshot-powerpc.sha256sum] = "b12ffc360997ed6ee4b93c1e3bfccea84ab034d657f4411bd34ae4494b685c51"
+
+SRC_URI[rustc-snapshot-powerpc64.sha256sum] = "946a84e6e9d6e13df5d6361578d9202714c08c2ebd3e09734df7cf4afaec60fd"
+SRC_URI[rust-std-snapshot-powerpc64.sha256sum] = "cc7fb9aa289ff1756502ae16a05e2885289165f01ed94a7c2db6576b3dae74a6"
+SRC_URI[cargo-snapshot-powerpc64.sha256sum] = "e9909e9dd0c33e833dbd9c6b677aca49eb4ed2c09a30f1577c91aae70690674f"
+SRC_URI[clippy-snapshot-powerpc64.sha256sum] = "4e7c7d14165c2aef1275aac109092c2cd85396a483756b8084a5ab729b4580e0"
+
+SRC_URI[rustc-snapshot-powerpc64le.sha256sum] = "5333b31e79482c71337cae23074483cb392e708528e383d587a9cd160bfb63fa"
+SRC_URI[rust-std-snapshot-powerpc64le.sha256sum] = "2370d9266051a0b23346d42e43a00f91b2daff22a963fb03e28ae50cb0b76c50"
+SRC_URI[cargo-snapshot-powerpc64le.sha256sum] = "a7744cab4bf40d78ff8344d320bb7a41fee4af1f2fbb6eb67aebcc13b30a49e0"
+SRC_URI[clippy-snapshot-powerpc64le.sha256sum] = "2d29ef33a42d2f2291fa0107e48ffc35b7be0d318ad6bfe231fb1b751a0fe214"
+
+SRC_URI[rustc-snapshot-riscv64gc.sha256sum] = "04752f3ad26bf07ddbe70b1dc759aafde75226dabd4fc6cff3d0b016e293b990"
+SRC_URI[rust-std-snapshot-riscv64gc.sha256sum] = "50fe7869e166bb4c990a0e1664366b1ffdbe669664b7663cd03c079bd0efdcac"
+SRC_URI[cargo-snapshot-riscv64gc.sha256sum] = "240d7ff48881232b78ea31648621832b36a401872499d0a3a1419e4a9da5c43b"
+SRC_URI[clippy-snapshot-riscv64gc.sha256sum] = "e72e423ab27da0f0f38b71ff622b357028206d551d10b62cabf6845111805701"
+
+SRC_URI[rustc-snapshot-s390x.sha256sum] = "4f3812e0371d8eea904b0fbb08b94043d2ba7227632239e94ce7b35ef5285c2e"
+SRC_URI[rust-std-snapshot-s390x.sha256sum] = "31978c1286afff9a0bb7f01c2ae4a39f40727b6100a82b6d934f146b06cde510"
+SRC_URI[cargo-snapshot-s390x.sha256sum] = "01f2854ed29843949fb5baab852316c36382e9df6d39166508006c1dad830f08"
+SRC_URI[clippy-snapshot-s390x.sha256sum] = "39ca2e54ba9945ca94ffa4ab9a276f192d993be331ed25a53ab0e1039dd60528"
+
+SRC_URI[rustc-snapshot-x86_64.sha256sum] = "8426a3d170a5879f5682f5fbdd024a1779b3951e7baba685af2d6dc32a6dfc15"
+SRC_URI[rust-std-snapshot-x86_64.sha256sum] = "047ea7098803d3500fa1072e9cee5392697e21525559e4458128a2bf874aa382"
+SRC_URI[cargo-snapshot-x86_64.sha256sum] = "e74edd2cf7d0f1f1383b4f00eb90c843750bc489e2ccf7214e6476678a907425"
+SRC_URI[clippy-snapshot-x86_64.sha256sum] = "ac779bc9839dd47180806b133e4e2563c4a34716284cd5b8fede8ef289f452ca"
+
+SRC_URI[rust-std-snapshot-i586.sha256sum] = "dc5187f4062d617561e0d7885ecd4d4d3f995435b38d8c53d6451b56808946b8"
+
+SRC_URI[rust-std-snapshot-riscv64a23.sha256sum] = "87f3cee68f0522e0c2b755d3f9683473a3f51064e58d9b02f21350d5fa7af9cf"
+
+SRC_URI[rust-std-snapshot-sparc64.sha256sum] = "88619b2413d218c119a2060e583a9e835fa5f9cf6ac038070eec10b02c191056"
 
 SRC_URI += " \
     ${RUST_DIST_SERVER}/dist/${RUST_STD_SNAPSHOT}.tar.xz;name=rust-std-snapshot-${RUST_BUILD_ARCH};subdir=rust-snapshot-components \
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index c5771e1932..55c43ffd6d 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -6,11 +6,10 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://repro-issue-fix-with-cc-crate-hashmap.patch;patchdir=${RUSTSRC} \
             file://0001-src-core-build_steps-tool.rs-switch-off-lto-for-rust.patch;patchdir=${RUSTSRC} \
             file://0001-riscv32-Define-plain-syscalls-as-their-time64-varian.patch;patchdir=${RUSTSRC} \
-            file://0001-Update-call-llvm-intrinsics-test.patch;patchdir=${RUSTSRC} \
-            file://0001-Fix-multiple-option-or-permutations-test-for-big-end.patch;patchdir=${RUSTSRC} \
             file://0002-Fix-rust-build-failure-with-unstable-options.patch;patchdir=${RUSTSRC} \
+            file://0003-explicit-tail-calls-disable-two-tests.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "62b67230754da642a264ca0cb9fc08820c54e2ed7b3baba0289876d4cdb48c08"
+SRC_URI[rust.sha256sum] = "b99ce16cdf0ecfc761b585ac84d131b46733465a02f8ecd0ff2de9713c62ee09"
 
 RUSTSRC = "${UNPACKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.95.0.bb b/meta/recipes-devtools/rust/rust_1.96.0.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.95.0.bb
rename to meta/recipes-devtools/rust/rust_1.96.0.bb
-- 
2.49.0


