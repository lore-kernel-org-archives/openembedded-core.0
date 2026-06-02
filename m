Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61A07CD6E4A
	for <webhook@archiver.kernel.org>; Tue,  2 Jun 2026 11:55:06 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23197.1780401299916268004
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2026 04:55:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=c9PGangv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=061312c36b=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6529RfnA1307824
	for <openembedded-core@lists.openembedded.org>; Tue, 2 Jun 2026 04:54:59 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=UU50/vMex
	x2SAJDAZk6kyxOO9nGgXKLnulgo0fNf8p8=; b=c9PGangvMKGWnO4RFPlCAEYc5
	ynTrvZI4rrBWHPlAHbjDD6MfgTVCRMjkN4JcWjA9LH6SVCEfnsDiAkcD93F2lpsh
	x/Kq6+eX5n0lftGRxKV7+qd23pNH9IPjDDx5Vy8OV0DdvkwBec8JIixqTM7Fbsh4
	NpX8l6nqAJwKiwkRQXy+9mNiKRkWXN8nV0E8jDzAoPseR1i4VrPmOpPArgyZCXUS
	k0It+9R6A+K+F/beSzyUKQ7rcrNbwGiozGestjfpCYOluefRXvbsiPrczx1OZ3PW
	08RzELtyJeyn+FsJWUdt3He/axdm+ZBwTAk8V1q4SZTv24GKpzggiy+kQtaKQ==
Received: from bl0pr03cu003.outbound.protection.outlook.com (mail-eastusazon11012061.outbound.protection.outlook.com [52.101.53.61])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4efu61vd3x-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 02 Jun 2026 04:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e5vfpD5MaW8/vKwP8ToWUnO96otG3yG7lPqpw36mMOlp07T5I4T5Wo8VF5KByfYKy4lD9YSYJu5/5pJ1yvxGl+7yFN8jPmeX0cA4k4DD5i3as/nWJoounfGA3h/cZaAsMxP5egA01hos/Vzq4vYGKksDXCPZ6RZVPS94SGXDy0xttsBVlGlmfk1X47U85zgMMigcmj2bdwsoFZHLcZvyDcuw9Ds6Nhgil62czuUAysf4LeEJxD/G5tZubGT/yCPOy4QZewdUFk8rJshx3InOOHL+YW6zexQz5F70r8GFZaD0Yrh7S+SIJe+rATMZ3aBi2DSuZuA6pLYNVZIVwgGsfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU50/vMexx2SAJDAZk6kyxOO9nGgXKLnulgo0fNf8p8=;
 b=ttM+k4Qk+oxtw56suT2MwWYPPb1u5aqBHEQi4AcKdSGhlASDsE4bGoYd0eexExMoL488H7mHZEpiZEklrNBlmXyeC0K4pQ6dWxkvj8oCYr3qQ32KQ7Glzt2IWbXrCV/O2bMYxCMzW90UiR7si8cHHlR7sWK1YjnfKZeHgGm3ZE2ZRELoBw6tQndTkk0wb3c+lzqcNp7ID5W4/eRjQqUCf/dWXCdeNTEohIz/uRn8n2cdggQS5+utin/SEUGoA1jLqVty6xUC0L6zmmlf5pZjFOoNvxWIsfZrLu7av6vtCJX3YhLxa903hDLCOx6xhdCf+Pll0E/KE0JxtM9rREP9Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SN7PR11MB6677.namprd11.prod.outlook.com (2603:10b6:806:26b::6)
 by DM3PPF7468F7991.namprd11.prod.outlook.com (2603:10b6:f:fc00::f2d) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.7; Tue, 2 Jun 2026
 11:54:54 +0000
Received: from SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab]) by SN7PR11MB6677.namprd11.prod.outlook.com
 ([fe80::490a:519b:d657:99ab%6]) with mapi id 15.21.0092.006; Tue, 2 Jun 2026
 11:54:54 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        Randy.Macleod@windriver.com, mathieu.dubois-briand@bootlin.com
Subject: [PATCH v2] rust: Upgrade 1.95.0 -> 1.96.0
Date: Tue,  2 Jun 2026 04:54:23 -0700
Message-ID: <20260602115423.4093695-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0016.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::23) To SN7PR11MB6677.namprd11.prod.outlook.com
 (2603:10b6:806:26b::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB6677:EE_|DM3PPF7468F7991:EE_
X-MS-Office365-Filtering-Correlation-Id: f5cef50a-6f3f-4683-e951-08dec09dc2b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|25016099003|12006099003|18002099003|29003799003|38350700014|3023799007|56012099006|6133799003|5023799004|11063799006;
X-Microsoft-Antispam-Message-Info: 
	YuFOymIIyRn/ZDtDJAcT1GokBjPmWjFqyYO2DuQ9/spymqa7DUFZ/ULLSgt1CFXAc446wYXwFYdrC1AswpsJTgOP+gZTc+nkz399iEgIRjYPxYn2A6t4KJw1s4ZbjEJOVp68bFnGl1hxDu1ZhMoK6x1bZfTUcR66KaC4QjRucKMDoa0CXFxAvvPs6QGBK0okuPjaXpZNpaUGDOrTONlkvy3GDOq6ZKHXyAz1FPjKHDhh9tiWL4+00xkzYG69GlbtHU37dRjfA8GUA1/+sTvgDPt3NudZ8NkMd8szy8xxPcSMIHHdY2OzpSP6Uxs7Ofr5cvd0ZbDdJSY5eTQ6QzY4ou0wdRXcreAJBsY1U8PJ0FVXTNY08Pr5wUY4XCeTRs6DVz/bT0nlEnyhOm2X0HA91bLQjgjbP/mze8I3eYiINCoarSM+rKSTFKo8RtktDqm+7O7k8gZL5X06upgJzk5KOvdHqkYylRdqcoFkgJ4n9cSx9pLPztr+BSwXkzwmIIotX2fAsuJedXaCC2HRSAPJXafhB7l+OJBq/JqPQyxyw2il/JYvo0QbW4flSg1VKwCjnPUfNLTLlwnnsaN445HrTh4sCm5kbO32b8DqE1SZg7M0RvS34wcUx8DhimKicaeTc8F9LQbLB2Gz6O7by58ZmZe0mCTqSqiYfyCtEMgDqTHSx8AmQG5nDXPot2e4AkRT
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB6677.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(25016099003)(12006099003)(18002099003)(29003799003)(38350700014)(3023799007)(56012099006)(6133799003)(5023799004)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?eFM6blKzDEWx3v1vsOmJYPIUH6rVIpHF9r2yyoZ4XWMfwVcOSy/kzXV1SCX4?=
 =?us-ascii?Q?tY71a1loe19PoOpL8XozOv19P/UGrKXitvuoMYLWY9zdwhxSihiTmwEazZ0g?=
 =?us-ascii?Q?VfLILCiSvPRzmpzNKd1xcE/vFrTmCaZ3BHfpuqcyTMrVjGadsmLqhaQLqEGB?=
 =?us-ascii?Q?7/OlxXtlAC14NZ+RYReYqJkeDVwBEFotxOntj72DmWhWCViRwjENLkb1U9CJ?=
 =?us-ascii?Q?rJEtFnnsQRqw9d2BVJNSdtEiuwO6j0oyCkaHZs1KlRWi/64SgAunC/EaXeyL?=
 =?us-ascii?Q?p7ZxVTxLxr/yqIBFD4ZjuLIAG953R9ZHJpf9mFR3mMWwAcqhwcZVDvvvIQUw?=
 =?us-ascii?Q?J88UPAnZN7UnYV/cVx48DMkc0G7gEpHVK/mCEYiLKuiIM2Ixpwdc9xc5Ba03?=
 =?us-ascii?Q?W6HybRnqZQDVpUGgMNhlI+U0zJhpgMoO1CD1zF+ddqhqSNtNoQXMfdJ8h0Zc?=
 =?us-ascii?Q?ov1A9Z2xW/S/b2xAWNM6UmXaL1sFBbNgblxBYx9x2ISvuKkBZYjDumTogTH8?=
 =?us-ascii?Q?OPNnKRgY6uia6T5c09WYa2jRqrQ7kyJuM2+rCNm2hzMzl9q8UWQoUM6HEKmj?=
 =?us-ascii?Q?NGd1zgPMj3KKNOzJiNpAAGuHZqAQCNO49WnSBIBE4vJKJA+vfCNxdqbtW2vs?=
 =?us-ascii?Q?L5nZdHyYluSPqUhSR8QLVFoXoJGBiOiffyzK8xomceykt0vSuhv8ouQV4YDF?=
 =?us-ascii?Q?mlqMhKsJicpiUMPhPWw9y5a+VNA6ExxtMH7Kf1reytS03D1AjgTDwpqFKYOL?=
 =?us-ascii?Q?X7HspwW2XwkOL6xyv4N8jKezAUQXOpo5JEa2RjqHWIky1ADF6/y9p7uknony?=
 =?us-ascii?Q?XKkVdKcETQlOGP/yGTGZ7GpueQyEPk+4ZDfpd4QtzE3oB7pY6Z8XxZVoA66f?=
 =?us-ascii?Q?N2H205OdHGgwnbWc7qL3dEPN+Exy+/KHcqj8gK7XTSkaryIN+jKScfiwkkGO?=
 =?us-ascii?Q?KHVAq2SiJXUh2CRTNWaD97ggOd8rMQKDhgv1lFY/7VPb+qJycJylDqEb5Vtl?=
 =?us-ascii?Q?eoRsEh2UnX+nENB6xhR6ZOX6cVN1Ja7ubk94SlLSSh5FaEqGc9izxOCI5f60?=
 =?us-ascii?Q?YHs3WmlB8iaf1ADsFmioARqA4Ovq/KgoOn9ArdRBttlkRjY+WP3vvgcbzPu3?=
 =?us-ascii?Q?hwJOGjUrS9YyI0igZwQc257xrWXT5YF9658wyUK2cAKasIgBob/Hb+cxPO22?=
 =?us-ascii?Q?ZuNLG1E6+nJOzyFdtDzJ5QwolLQQaM7/7yIQBAnjeRhv/WI5dPvtFT2zBMmG?=
 =?us-ascii?Q?hjkpDpMHCv8hJyotaoEyrxXEB+dlLJ9bXnaPMRXLTLAuyHQtFfDcS1Dl6jGn?=
 =?us-ascii?Q?GOvJd+I0EHTpuDYDO9edcIyqF1sAoq51buoAJbnv5RYIpnp8YqF1TlNlxVTU?=
 =?us-ascii?Q?cLA8CWHIB/2VBGBeOzo1bCXqv7DOfwM36hjCsRce8MP4Fj1I1c0KJvz13VlH?=
 =?us-ascii?Q?qnmvS4VD3cy+ZnlcfXBaRmwITCkRxhas92pOOVOHVNjsIKTgJrjiiGof020T?=
 =?us-ascii?Q?48ZspIDj/Wt7E40O67KDI9wbOrFbGBFC6Dbk0AHOq2wr61fTijiilXdO6JGM?=
 =?us-ascii?Q?25BHC44nNLyrFdcWagkhXFToXwVG7CMiDQzTRdAQK/X6PK04oKwnsrSm6jg9?=
 =?us-ascii?Q?9SSS00sbKMYE4CJBk1YA4vs/eaHAWpPoRPpfUFhXwBsaiWNnInXFyB+xzi/w?=
 =?us-ascii?Q?V21bmFlw5mqs0UshyG/bPKTMPuBJq2a+t14NYPcc6oookIcz63QyMPUVTXjj?=
 =?us-ascii?Q?GG+rxxWVcxsstgcwTc5FBFWEwTZN3UTDyY0cD6H9+pSj8VjQPrzO?=
X-Exchange-RoutingPolicyChecked: 
	kkE5bG9JbbDTYScAO8DaM8h5fHnbpoBAuMRDvfnHk6lKxt9Ac0r1zwrDfJUv0yZUEFpDE78wVTz4bixmmYcQil+nbUnBOHLC/4A/Y8TnDMgB5jWzKC5UEFyut1w+MAvh4Z2zMQ0rN/bJdhcJRaxfarxY0efbl5vwZKChIiplIT7Nxaagrm5BfBAy6yjRxtK/7QXqkqeigrAyvh9ZjJwLdyloD7i7UKs1AnfjjS6CPRVDrZbc50fE2+fp1GuWL/8wu03UvQLdtWP2mGSDg2481reHTL/4zqq374rA4hUYH1NEFAKkxNDECtJjxqYhgKzR7C9YFBbTMzJkiQeRbe4TqA==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5cef50a-6f3f-4683-e951-08dec09dc2b9
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB6677.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 11:54:54.4579
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ik5sIX+K49JiwwXU2k+WMwLvgOMvTLNBvZN6c/yoz+h2XJnrbup9Dzma6IlotA/4/chxaIvAcSaqjAcY9aoiIeIPLeA368LnCALqwwb8ItgwsS2sWM/2W7dg2KNGp4pA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF7468F7991
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: pHo3u28j1u2EWelvXOogoCo_UCFw8IXz
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a1ec493 cx=c_pps
 a=HO36DfDzC3pv6rVb14NK+A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22 a=j57RdskLAAAA:20
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=a_U1oVfrAAAA:8
 a=T6Pbhl7C1x30cAAJUFIA:9 a=uo1pfzBel17Gc3YE:21 a=8zIOOLb7Ym0NljyPXbuS:22
 a=FdTzh2GWekK77mhwV6Dw:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: hkWjRUeWkirLOckAvdXp2i2rir5YEoYM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDExNCBTYWx0ZWRfX0G8LhpCnI4gd
 XfSw4M4SusKC/AL0LYq790UTvQM5HOAeH7PzJl4EaU6gOBgKVhI+xa7kfwsynhy3y+QGxyw2MvF
 88hoUFigvZsI7FM/x7C0NSD24vdjl44cedBbdLNn6ouELDQLr0SdQQlZoSRwe86qk8HSONcFXfk
 2j3/LYRj28cFLnA/rlBazWayhjxTygrWHzns8K8uQWQmPK1i8ZsOIYj6sX0jq5h8gFyX5zhQ+UP
 Qs1Pm3jULwfzKy/UkjDKqwswA+WD3dxkQp1nwPQk2+2W3TYLX5SFpcbblIDs1RFmJ80ehfNdQqL
 sg6aKILBuImqf8G4LqMnvjaR24TdfjrrNDUpd463ssf43+MWtJBOGHqDckZcGWITZkUm1dIwHkq
 kHcg1EMmlueMfHDTNvn3chRE9Yhkl+Kk1ciqM0qCSUtMm4Dfgp03256ccxKaAcR0uMd3zW0myXg
 taTIndWYSvDIDUh6kmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606020114
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2026 11:55:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238034

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Rust Changes:
https://github.com/rust-lang/rust/releases/tag/1.96.0

Cargo Changes:
https://doc.rust-lang.org/nightly/cargo/CHANGELOG.html#cargo-196-2026-05-28

rust-target-config:
limit llvm-floatabi to ARM targets

Generate `llvm-floatabi` only for ARM/ARMv7 targets and set the
corresponding Rust target ABI (`eabi` or `eabihf`) according to
`TARGET_FPU`.

`llvm-floatabi` is an ARM-specific LLVM setting (Rust currently
uses it only for ARM targets) and should not be emitted for
other architectures.
https://github.com/rust-lang/rust/blob/main/compiler/rustc_target/src/spec/mod.rs#L2619

Following upstream Rust changes that tightened validation of
target ABI fields, ARM targets must provide an explicit ABI in
addition to the float ABI configuration. Match the ABI settings
used by Rust's built-in ARM target specifications when
generating target JSON files.

Upstream-Reference:
https://github.com/rust-lang/rust/commit/40ebcc031da647d6a76deaf05c471b7a1d4aa228
("Rename target.abi to target.cfg_abi and enum-ify llvm_abiname")

Drop merged patches:
0001-Update-call-llvm-intrinsics-test.patch
0001-Fix-multiple-option-or-permutations-test-for-big-end.patch

Updated patch:
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
 .../classes-recipe/rust-target-config.bbclass |  11 +-
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
 12 files changed, 118 insertions(+), 271 deletions(-)
 rename meta/recipes-devtools/rust/{cargo_1.95.0.bb => cargo_1.96.0.bb} (100%)
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Fix-multiple-option-or-permutations-test-for-big-end.patch
 delete mode 100644 meta/recipes-devtools/rust/files/0001-Update-call-llvm-intrinsics-test.patch
 create mode 100644 meta/recipes-devtools/rust/files/0003-explicit-tail-calls-disable-two-tests.patch
 rename meta/recipes-devtools/rust/{libstd-rs_1.95.0.bb => libstd-rs_1.96.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.95.0.bb => rust-cross-canadian_1.96.0.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.95.0.bb => rust_1.96.0.bb} (100%)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 3469de2142..941fe19583 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -416,10 +416,13 @@ def rust_gen_target(d, thing, wd, arch):
     if features != "":
         tspec['features'] = features
     fpu = d.getVar('TARGET_FPU')
-    if fpu in ["soft", "softfp"]:
-        tspec['llvm-floatabi'] = "soft"
-    elif fpu == "hard":
-        tspec['llvm-floatabi'] = "hard"
+    if arch in ["arm", "armv7"]:
+        if fpu in ["soft", "softfp"]:
+            tspec['abi'] = "eabi"
+            tspec['llvm-floatabi'] = "soft"
+        elif fpu == "hard":
+            tspec['abi'] = "eabihf"
+            tspec['llvm-floatabi'] = "hard"
     tspec['default-uwtable'] = True
     tspec['dynamic-linking'] = True
     tspec['executables'] = True
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


