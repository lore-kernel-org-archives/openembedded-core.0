Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA9DECCD195
	for <webhook@archiver.kernel.org>; Wed, 15 Oct 2025 09:59:41 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.12234.1760522374061394719
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Oct 2025 02:59:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=YRkRNkWO;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2383958093=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59F5o1oi1180701
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=XCWTI7oaOFIB+Pe2fOA7f2Kn9RtWED/ms6vbrOngkGw=; b=
	YRkRNkWOchTovPrm6idxtWC5ZDJtXUFLLgdCS2bWRVyz/ysqkS6o9m1Vgo8fXCnx
	6VCTrSOM0R0FHWwQJm3OoOy6npjh9c4TCBgxZ69ghuM0GCZrVR2/fEWNjQNZiAkB
	CiuQIlkx+9Xo/GdNEbD16v6YYAjz9Aww9Mt7qOmbzTvNm4akpDK/yoZ+m7CVRyVQ
	CdxlRkgd3040GIIEvXxlsseZIY48dp9zbPcS6uS+ftLpMxZeLsSRXhO8n0G3U4un
	VwxbhR9YCYQ/ViCOc3c45HkbElfYlN2/9u9pjLFEFiWHFx+sFMczbAoci6JImBVv
	rWPH+BNly9jkD0Pm5L4V2w==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010038.outbound.protection.outlook.com [52.101.46.38])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49sthh96kq-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:32 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fbq0Y+0oTJpGrdOdC4auSjWpACzR6JNondYgnOiKlBdfbQSc4MIfovVNNNVN+ySZF5lZ++jUdXw1GZFEiVAR9wDVE9AX4HZH8OEiE3AUQ2q+SPLPAmEos3aN190TAuef0HQZfcDV9FTHpKmC5IaNTcozfr2LBBiDbdp0+Fo6RHI9HHMx/iYccjL8Xzq7onOSLGNWsGhGrsjQy+qrCeFZcJvjI4cd9TwGz7R84hMm3lfQmnn0A86CciCFqsF3UQcp/NpKLP8NhW0L+JnBp/jk7P4mpdK8oZUQ9s+NS9QtgbUoL7bdrkHoGKQ2LR8dZyIWiVZXdzYxri8LNM1hoAo6og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCWTI7oaOFIB+Pe2fOA7f2Kn9RtWED/ms6vbrOngkGw=;
 b=u64BhgRdufTiEqEQZVatDKBkD4Y01at23daASRpdU4OYOCSAvZZX8TzseeGqbz/f8sQFwJjcA3a1BgxD6Ky9taknuvu+o2L0ogxEL+U5Ug0xAyybao6h6DeI/CCPybEYp9akkh/VNLIMVuW/W65IXGNhLMfKb2bx3kadmQDIJbl6bIaebFRg6QVLznRFPTdTGohkrFSRBOVVt1if5nBDVe0GRNnjGoFqsy3W3XqOTgb/HNR6EtDIzIRG0XeEU25b8MxFgy9tVoKQ0y3MNr8KXHhE3TrRk+7rWfFRoSoIxL1wU5BpMmDRwr+2cVGgmy5z2UN1XO/01k3RTtjfNzehvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.9; Wed, 15 Oct
 2025 09:59:31 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Wed, 15 Oct 2025
 09:59:31 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com
Subject: [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
Date: Wed, 15 Oct 2025 02:59:02 -0700
Message-ID: <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0046.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::21) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS0PR11MB7958:EE_
X-MS-Office365-Filtering-Correlation-Id: 097f80f2-cd8d-466a-098c-08de0bd1893a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JZKbM0/N3XMa47v+Cnc1s3ZliOmXpif6+GdctwbGGHpd74yuv/FHwdz0uUWB?=
 =?us-ascii?Q?fTyrL2hKeg3wqbH7mnxd7naoxojiLxzM8PtbbUHGjTfXWsRyj1lBtypXQ53s?=
 =?us-ascii?Q?9QG/23WYTiEXi7J9J58xstWLpcU3hokM4BOveb2/Rb+2KcdY0LeXvmNhyR/F?=
 =?us-ascii?Q?XREUHSaklusO4XTjcyP+DXuixoWlUCiraeh6+KVMq1MnP7VOrYZIAwoi67B/?=
 =?us-ascii?Q?aS2heFcv3cTtQU+jgR9bVzw9tDiLcFAlJobozt8WbX+NcMQFmB9/Op96T/sU?=
 =?us-ascii?Q?of5v7EblTxY/u7NTcCtEUH1OKZW5hnacgP+5StvJIfL8OHBGl3V5gAxuMTqX?=
 =?us-ascii?Q?zmyYEoXiEXaxaEiRsNtpLb8cwWP5CnlcMSlMujxHkX8ZLaPudy9o7XlyHT1B?=
 =?us-ascii?Q?sP/uf/uMZnk2LuURpBDIrC+67IPFLdoZL4n0XuoNBmpADiCWv5KAC5yM9Vk8?=
 =?us-ascii?Q?x/cuiTNvchdG4BPJyVDmNtfRGjzjjMw8RnffTBMnRtsbr9mUn3cdAtWc7E5H?=
 =?us-ascii?Q?huQ9osPkKA/FVAprE5FzpqSSgKjC3PIp7C1BZgxfJSuvY+h55mMcnDuI6922?=
 =?us-ascii?Q?ldEK10ZGc1dFebaAOgU0GLlBRHtS7Enro+5FeygfuRYfIUEmop0l6CM4ZbUl?=
 =?us-ascii?Q?nbQaykjW8OULQLSYB/cWmhAkQQ9szx9SiuKRrrHqLP6vsUNjSWyZImXb0nVc?=
 =?us-ascii?Q?pwwVW1Vn9oC0+2dJjywl7W+x2CAsGQLU0kYnW8DMLfhZPxHC+NCYf6fwZRk9?=
 =?us-ascii?Q?X3CjEbNE04QjJMICt4h+Ztm3oWFjV7c+ore7KNo2ZYuVNcDDuPvAYs9q1diR?=
 =?us-ascii?Q?At6hBHcJlcQK9HHTtEaldxYAQOQLk03B/SeSkrzoWtApTunGvsdmSS3Ngy+N?=
 =?us-ascii?Q?aKOCQ2a8UDZQLNXgRdqLfw+PYcY2lDHtjslmP1A1nPQiP17ucvnbSUXFNssM?=
 =?us-ascii?Q?RcauFJmfvTiVLYEdGsgXZmHMBK/wzha1g3CopcZS70JbxZajr630EEFjHauX?=
 =?us-ascii?Q?EsbWlgj9GzMt0k4Q+jum4FDBF8cfWYK5QZb0LFKcD64162BOnYeG3RJjAYLj?=
 =?us-ascii?Q?KF4Y6qkxp9VbjdbL1XCM2tUFNgMWg5T6Q7ac09ZiOuUFUsknEhyNI/JasR7D?=
 =?us-ascii?Q?IggPgYaKKS7TOeORiUsQg6K7B2v9ZP2RaXfBOg6hL4FAt7fBFbe35MGJgApp?=
 =?us-ascii?Q?/aabyn71THqHmncxpvtQABe7vEvE9MtOKS5cEp8Wq/k4BlHoHQbdchPlkDlk?=
 =?us-ascii?Q?eqkUQ1FhmnpDEkfd+CgSLTd4XCMl/wiDnpRhQSxA++2PgJzuUs13uwxjuuAX?=
 =?us-ascii?Q?21m6IkgqFCfa7srrXkxr7SMLI9PCAvHqHiZskAyzitpHGbr/GWvLr0RND2Y9?=
 =?us-ascii?Q?a7RwVvy/5au6oFen4sC9QGqVtAy77IEcjNXfO7o5Joe1eLSaSeqOqlCj2eb+?=
 =?us-ascii?Q?jQPAaCrIuWMxo15di38pbQMRIQBo9beUm0/CBei6Codj1H8d8SugbQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?/lreB3mzbn+kJvji0WMNrzyg6DVAUKZ6aV/TsP2fXiPkErNMRcpofkZLwnFi?=
 =?us-ascii?Q?nb5gGE9DF3CAiMjIfpkFlPr3RtcfhePPo9L9DpJsCVxXaC24Y4UaNIDVJeBu?=
 =?us-ascii?Q?U5FGDPAl2yh9u7YO1UViAEJqKtX+NyvaSKHWK5wm+CRZQ+oWf8cQy5A46wEA?=
 =?us-ascii?Q?pgumjJHH72DNH8MFpZCrcRBUPeOrx0lP2z/49YJwpQq78FeBlDT5RIj2R6tZ?=
 =?us-ascii?Q?dA8qYcO+83rYjzhrlkbs/m9FmBYsW4mdHU9RAdsjt61LVhGj4F8DJm1pfbiz?=
 =?us-ascii?Q?dOPr6AtdZR4yN+lgoq58SkORcOnt2uDxQhrzi4UKkCf/lo44lGsGTJ6k99F+?=
 =?us-ascii?Q?hGW9xspw0qqH5C4YXfEf2ViAzmrwLu2/L/Tqsrh/9VvC9cTC5P1O/hbIEmPZ?=
 =?us-ascii?Q?Q1/MiOMEjExHeKoxvAVqFXE6qNIg4bQ0VBR5JbG6pBVHKMuIsYvK6jJBwhND?=
 =?us-ascii?Q?iwoTdxc6AxeeRbBLXDo8hW3cin0EnYpH8CMP921Ke3OpNlw/t6D/0Q7JhYbG?=
 =?us-ascii?Q?OwpS2W8lS/GlT/guXCo+ArH5d94SIr3aiLUbqv6J3EBWCvgCyNrhOynrBZqZ?=
 =?us-ascii?Q?wNIhS5/W8zJNON5mC8D6qftw3p4jnPMB66u+zdZeo8zXM26NZylNMHaXE7T0?=
 =?us-ascii?Q?ybIV6dmuDhhSx3qr90Frd4zgGyFDHgMEe9ZnbFVTZtRGWIn2x7geIyKU2DWg?=
 =?us-ascii?Q?BepJHjsDykoTsTMwCz57KLY1h6TCDQnkOy03+d1GlWK89YI77h+ahT6Q96+V?=
 =?us-ascii?Q?HQQHzQhOSXqDgLQUbU905WnIjSNi8+QVQTiP10+asSUhmCZCt1voPy/8RDDE?=
 =?us-ascii?Q?2Vww/cWm8t/rEHtWFS3sFeo8JMbW72ue4/BchB/OHKXL5vCYJMfVs7vbOORs?=
 =?us-ascii?Q?TXM7gW2fAeCHtYjHuUBQ1Lp1nYIYaAgG28f+XKcVyYQzB0SeX2gG3YVeCKfg?=
 =?us-ascii?Q?k3jBqpcAXBXrJCvojY32hPRjQfFhZmDtrc2TsW3WGr+0UwFYfzJxvWia8GgO?=
 =?us-ascii?Q?yqGHOp+ZZkMA1CjYzZtB2Ol8DTc/QjZXD/erLGrHxU/A77x37/EiBMLt1zYC?=
 =?us-ascii?Q?OOY9wWYsBU+4kezZehL029+NglHgFX9QWf2QuJdJZcdIhGtt6Xl6NhYfnM7Z?=
 =?us-ascii?Q?o9jW4LN4c8agtMDGoDh2jg1TDOaAYobYZ+wiFepcP2xUJ34KS2zpXVtOL6ZH?=
 =?us-ascii?Q?ro8uLtqfNq6JWJ0rFfqcC5OdTMqS00OAvKG3UpEKsgbY3Q3IuSKo7eOySLZT?=
 =?us-ascii?Q?zL0U9RTdyDa4OUksWIjlpJkB0vhKkW3OIl9ADA1C6CwSQWkX6d803BVWThep?=
 =?us-ascii?Q?QJ54yDTHc35QQ+xJ+EgFEx5HDjIJo3r1FYDYC7wAK4d6RLlDFd2YOHIBzbzZ?=
 =?us-ascii?Q?w16TI8FO7yvqml6mhJWaCyfu7XH9Ld1i3c75ikXFnNc1JRo9sdc5JaP8XHRN?=
 =?us-ascii?Q?qAPADCZuDRkdyJSjscvLfGo8asuW+Q9i3wxAlYQqeSax04BafSVD/nhJixe/?=
 =?us-ascii?Q?3y+wgSTW0MehRKSEZ2ZMgE44vxLo0IDgJadyOMVhi45hLeUAEdCViD2wBzcA?=
 =?us-ascii?Q?1Rp6/iWsNx+ZnP0I9X2FXuYHv2SYv1ZlXieHxSPEp0fG9C9L8259amgnDweP?=
 =?us-ascii?Q?tRyP6oOkpwn3Cq4QiC4cs5M=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 097f80f2-cd8d-466a-098c-08de0bd1893a
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2025 09:59:31.2361
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZnYayPlEnWi2TglpswfGdfMViwyJOdfyQpulbzwC6xr2j6y9JBS+rCNiD/vvQl2zi+X6Q2Rj3Oqu78vB+Puu2JK+Zt+EJR2d6ObhWJDFnUD/jXH/4lIIYQt3kqW9xbMq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7958
X-Proofpoint-GUID: 37cCztiLeZ7GxZzicLJpSUHuBYJ7aqB1
X-Proofpoint-ORIG-GUID: 37cCztiLeZ7GxZzicLJpSUHuBYJ7aqB1
X-Authority-Analysis: v=2.4 cv=QLBlhwLL c=1 sm=1 tr=0 ts=68ef7085 cx=c_pps
 a=aFbGVCYh9COm6MyaDWiF6Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=ckCNTkt6AjYl-fCN-5sA:9
 a=Hqou25T6mLgA:10 a=8zIOOLb7Ym0NljyPXbuS:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE1MDA3NyBTYWx0ZWRfX+hD1Gc+LR7mY
 bFCSMuuqMXc+YHz3a5OAB1fKSLGdir/7t/nf923ambHpBaXXctBMdcXAsHTOTyPuu/rcdzB8jNa
 saGlNDW6O5NJkgAnf3dEAhyTngTTDrT4yNZptj7F1jAbHZ4fimef2ZrDPP0TgPZPtCNoe/cPhB7
 mHjnQ8dzrAMfGvlpLSErTOkcnSz+YFkKIAwq+w74axLS6o8g1lQ5HxfWkuJsQCkAVhYeRahwBXK
 4YnsLKEQuIb5Th5weD+5MJhUs0j2q2gEpVz37VJzgmQGShF6KHuXHSxiSLmGABV8Vj0yOnwCPHy
 bxD8rrVRNpWCV0vWAu14Jcqq30T3KoWRV0g6pIU6D6PLk/dUH1FKHhU4r/xAnDvCT6/4L20CV/2
 2K8PFXxrUUP2QoqXQPWEX2HM7MfK7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510150077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Oct 2025 09:59:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224888

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

Updated the Rust build to depend on llvm instead.

*Summary of discussion with the rust upstream about using latest LLVM instead of Rust maintained LLVM fork.
https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of-llvm-fork-what-rust-uses/23489

*Upstream LLVM is generally compatible:
- Rust does support building with upstream (vanilla) LLVM, especially the latest
major release and the one or two preceding ones.
https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#updating-llvm

*Impact on Yocto Rust upgrades:
- Rust upgrades shall always check for updates on rust forked llvm and backport
the relevant patches to llvm.

*Regarding the rust forked llvm local patches:
- There are no local patches on rust forked llvm other than the backported fixes
from llvm master.

*We are copying the natively built `llvm-config` binary into the target sysroot and running
it. However, this `llvm-config` has compile time dependencies on various other arch's LLVM
libraries because native-llvm is built for all oe-core supported targets.

Attempting to work around this by symlinking the missing libraries from the native sysroot
into the target sysroot leads to mixed architectures in the final `.rlib`. Specifically,
the object files extracted from those symlinked libraries within `librustc_llvm-<hash>.rlib`
are built for the host, while others are correctly built for the target This results in linker
failures due to file format not recognized.

To resolve this, we now build llvm-target also for all oe-core supported architectures in
addition to the native-llvm build. This ensures that `llvm-config` and all associated
libraries are built for the correct target, eliminating cross-architecture contamination
and linker issues.

*We are enabling -DLLVM_INSTALL_UTILS=ON to ensure essential LLVM utilities like FileCheck
are available, as they are required by the Rust build.

Without this, the build fails with an error as below:
| thread 'main' panicked at src/bootstrap/src/core/sanity.rs:315:21:
| FileCheck executable "poky/build/tmp/work/x86_64-linux/rust-native/1.90.0/recipe-sysroot
-native/usr/bin/FileCheck" does not exist

*We now add these flags "-Clink-arg=-lz -Clink-arg=-lzstd" because of this following
diff otherwise we will get errors during link time.

Setup in rust-llvm
-DLLVM_ENABLE_ZLIB=OFF \
-DLLVM_ENABLE_ZSTD=OFF \
-DLLVM_ENABLE_FFI=OFF \

Setup in llvm
-DLLVM_ENABLE_FFI=ON \

*When multilibs enabled:

llvm-config expects static libraries to be located in the lib directory rather than
lib64. However, since we are copying the natively built llvm-config to target sysroot
and running it and llvm-config doesn't know anything about lib64 existence. To accommodate
this without breaking multilib behavior, we are creating a symlink from 'lib' to 'lib64'
directory.

Previously, when we depended on rust-llvm, this worked because we specified:
-DCMAKE_INSTALL_PREFIX:PATH=${libdir}/llvm-rust

With this setup, llvm-config was installed inside ${libdir}/llvm-rust, which included
its own bin and lib directories. Thus, llvm-config located in bin would correctly find
the libraries in the adjacent lib directory.

Even when multilib was enabled or not, llvm-config would still look for libraries under
lib in this structure, so everything functioned as expected.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
 meta/recipes-devtools/rust/rust_1.90.0.bb | 39 ++++++++++++++++++++---
 2 files changed, 36 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-devtools/clang/llvm_git.bb
index d2b060ff88..2f47af8d7a 100644
--- a/meta/recipes-devtools/clang/llvm_git.bb
+++ b/meta/recipes-devtools/clang/llvm_git.bb
@@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH = "${S}/llvm"
 # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.txt
 LLVM_TARGETS_GPU ?= "${@bb.utils.contains_any('DISTRO_FEATURES', 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
 LLVM_TARGETS_TO_BUILD ?= "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X86;LoongArch;${LLVM_TARGETS_GPU}"
-LLVM_TARGETS_TO_BUILD:class-target ?= "${@get_clang_host_arch(bb, d)};BPF;${LLVM_TARGETS_GPU}"
 
 LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?= ""
 
@@ -37,6 +36,7 @@ HF[vardepvalue] = "${HF}"
 
 EXTRA_OECMAKE += "-DCMAKE_BUILD_TYPE=MinSizeRel \
                   -DLLVM_ENABLE_BINDINGS=OFF \
+                  -DLLVM_INSTALL_UTILS=ON \
                   -DLLVM_ENABLE_FFI=ON \
                   -DLLVM_ENABLE_RTTI=ON \
                   -DLLVM_TARGETS_TO_BUILD='${LLVM_TARGETS_TO_BUILD}' \
diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipes-devtools/rust/rust_1.90.0.bb
index 5d804c7398..0319d73b93 100644
--- a/meta/recipes-devtools/rust/rust_1.90.0.bb
+++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=11a3899825f4376896e438c8c753f8dc"
 inherit rust
 inherit cargo_common
 
-DEPENDS += "rust-llvm"
+DEPENDS += "llvm"
 # native rust uses cargo/rustc from binary snapshots to bootstrap
 # but everything else should use our native builds
 DEPENDS:append:class-target = " cargo-native rust-native"
@@ -28,8 +28,8 @@ PV .= "${@bb.utils.contains('RUST_CHANNEL', 'stable', '', '-${RUST_CHANNEL}', d)
 
 export FORCE_CRATE_HASH = "${BB_TASKHASH}"
 
-RUST_ALTERNATE_EXE_PATH ?= "${STAGING_LIBDIR}/llvm-rust/bin/llvm-config"
-RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_LIBDIR_NATIVE}/llvm-rust/bin/llvm-config"
+RUST_ALTERNATE_EXE_PATH ?= "${STAGING_BINDIR}/llvm-config"
+RUST_ALTERNATE_EXE_PATH_NATIVE = "${STAGING_BINDIR_NATIVE}/llvm-config"
 
 # We don't want to use bitbakes vendoring because the rust sources do their
 # own vendoring.
@@ -188,6 +188,37 @@ python do_configure() {
     bb.build.exec_func("setup_cargo_environment", d)
 }
 
+# llvm-config expects static libraries to be in the 'lib' directory rather than 'lib64' when
+# multilibs enabled. Since we are copying the natively built llvm-config into the target sysroot
+# and executing it there, it will default to searching in 'lib', as it is unaware of the 'lib64'
+# directory. To ensure llvm-config can locate the necessary libraries, create a symlink from 'lib'
+do_compile:append:class-target() {
+    # Ensure llvm-config can find static libraries in multilib setup
+    lib64_dir="${STAGING_DIR_TARGET}/usr/lib64"
+    lib_dir="${STAGING_DIR_TARGET}/usr/lib"
+
+    if [ -d "$lib64_dir" ]; then
+        # If lib does not exist, symlink it to lib64
+        if [ ! -e "$lib_dir" ]; then
+            ln -s lib64 "$lib_dir"
+        fi
+
+        # Only do per-file symlinking if lib is a real directory (not symlink)
+        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
+            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
+                if [ -e "$lib64_file" ]; then
+                    lib_name=$(basename "${lib64_file}")
+                    target_link="${lib_dir}/${lib_name}"
+
+                    if [ ! -e "${target_link}" ]; then
+                        ln -s "../lib64/${lib_name}" "${target_link}"
+                    fi
+                fi
+            done
+        fi
+    fi
+}
+
 rust_runx () {
     echo "COMPILE ${PN}" "$@"
 
@@ -199,7 +230,7 @@ rust_runx () {
     unset CXXFLAGS
     unset CPPFLAGS
 
-    export RUSTFLAGS="${RUST_DEBUG_REMAP}"
+    export RUSTFLAGS="${RUST_DEBUG_REMAP} -Clink-arg=-lz -Clink-arg=-lzstd"
 
     # Copy the natively built llvm-config into the target so we can run it. Horrible,
     # but works!
-- 
2.49.0


