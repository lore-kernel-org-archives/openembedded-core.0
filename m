Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0774CA0FE7
	for <webhook@archiver.kernel.org>; Mon, 25 Aug 2025 16:50:59 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.43728.1756140656973754420
 for <openembedded-core@lists.openembedded.org>;
 Mon, 25 Aug 2025 09:50:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=tFQzV+l6;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=0332533567=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 57P9HhCo232568
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 09:50:56 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=ceS84c7Z2
	K6mU9eI27W4GliKOfg7vpXgqzJhM4VfPY0=; b=tFQzV+l6nV3VEPyxziKPh9Wjx
	wCeUv2oqttIcb81T+EylNGxZA/eoQhnRVsA1EP7Z5YqhMtgXBkSqbQfesaBvph6r
	4O41NsDwjg7a3BgZWdm8B1OTNDjqWcO5azsjUH8bKZkDTQs0/1cyKeIHI0q5wzHK
	VH8vJ9bFku4rIHuZDH7lmQx11lMmd80kSxPRjR0VNnDS/od++mI7euS58LBFqdx5
	S6PjQ1w/pzT1DDdI4DuBnu5W435kdRDi2Od/OM1gAJrAD+/n7C4e3KV83sF9hfK9
	l4Er+aCOG75TESZnifFQSXpwEpEAcqM4dLXNjjx2laYtaHQcKAwCk1a8bWjyA==
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11on2080.outbound.protection.outlook.com [40.107.220.80])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 48q8x21wfd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 09:50:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D4Sez210fmd5Zor/bTIM2BOqk3PTi4LF480VwfsoPnj2UyJ+HpMFGtb9NHVAvpDS0b3o5gApPdTSW5n+z6FtGZZ10kmjkIVcXdtcTKFX7UL8yKhN8FU9lbTVZjgmT8zuZFwskreTQWJKq9FKYGcWx01oBSh/a5gdt7uG5wnTCVeuS1uqzSsEml3LtPAoOFEWUSm8P2jM8CrIeZ1geDbS76Glt20ZFBkTn1jzNHbivCKvkMtjodJCK9aL5VHhkevQzVj+VTR9wwLjeeX5IqK5BzsrvyhQvDNXxKLp7tmGKZwKF2OGh9gwlzf/wIDaUUFeNyYdkJGpeUH+Z8Y7++AUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ceS84c7Z2K6mU9eI27W4GliKOfg7vpXgqzJhM4VfPY0=;
 b=h1pJu7S/d0lfDhgrNZuTwTbaoYF9g47rdJkFz2e2FK1pUWHKevBuN03TWdcBzyc1tK85NF9LQGake3tpckpiaXCmMwaiRIqtS99B39UPObPqECBLb7zEXqE42l6pTzDuHgeLCzzmv7JrtohYfOoVQrpuwF4fj8EZ5tx+bj9BtQm7HvPCSqLw0gdzbrKoElYlh8b4wciR8kA4C4UPzoTpAsCYNu1qGqwLYLGM1WY2qkPfsKePFgzrZoUq5yipCafdKosFLaJDGkw7NvCjdj/NCut+BalOr1LHbN+gOSvtFwJbjouXdpq7n1xTSFzxzbgZd8KkHpH0/wGOLmrkVlET7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by PH7PR11MB6425.namprd11.prod.outlook.com (2603:10b6:510:1f7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Mon, 25 Aug
 2025 16:50:52 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%7]) with mapi id 15.20.9052.013; Mon, 25 Aug 2025
 16:50:52 +0000
From: Deepesh.Varatharajan@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, Deepesh.Varatharajan@windriver.com,
        SunilKumar.Dora@windriver.com
Subject: [PATCH] gcc: remove .gnu_debuglink from SDK toolchain binaries
Date: Mon, 25 Aug 2025 09:50:26 -0700
Message-ID: <20250825165026.681972-1-Deepesh.Varatharajan@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0304.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::12) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|PH7PR11MB6425:EE_
X-MS-Office365-Filtering-Correlation-Id: f707ee24-e47e-44b7-4f67-08dde3f78ce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?auG0aLDSQLR9mXY8nDebPJIyygmaN03kT8rxfvbjdB+RyIEzv8tJfmgskFS+?=
 =?us-ascii?Q?/o8xqMG+EeX47Qr3R/fl06PdIoxyK2PuBJaPt9Ks1tThj37iF+i9vDZoSofD?=
 =?us-ascii?Q?dOfveqV8NjIMzowlMW5hlM1g+xdPs7NqzVWw7IVJCyCCp5bBzrrzUKpo0E1n?=
 =?us-ascii?Q?jGK6/Wu9q6c4UpSGVr3ZXXpzOx1LivHFUch2RO95E/qBarmKtOQhAcTby0Ae?=
 =?us-ascii?Q?fhIPqJy0nB/39GMTO8c9LvyrCvauyUwFdVj2lAVQW1HdStwznSMuoTk0Xp1x?=
 =?us-ascii?Q?a5eKrOByUOmsUrxywHCKiHgMebxqKe1zeDGr8Bv5EtOT3frfUreXtw0/VHgt?=
 =?us-ascii?Q?59fqflTtJiymg5o21uKdxyIybE7Oh9hBepYKdnWwTsvuluUsnEJuBEM8zchd?=
 =?us-ascii?Q?cZ4xsDtJIq4ZAMzqjrMgqoxc3f3XFLXervKyzMdTTdeWb4aNAKwHRAwpdjE5?=
 =?us-ascii?Q?mKhlQyqTVkPcm9gAsqJVslaWNDEtIFkLFhtzAI1hqzVifLmLy7F6ToKF1LNz?=
 =?us-ascii?Q?sn3IAWq0VDepvd/2wNlqJbd2OUc6IDG8/VjweemLfg7Ky8OtxUh6R0ivS8KZ?=
 =?us-ascii?Q?RCPRFekq5qkPau/jTsXXi0w+Jp70dZMgQOpRBUgtc4AN50sV5Vl1palAELbx?=
 =?us-ascii?Q?2cB98rZuAL58/S6NHtT0KSbkvESuKhFCVDQ1qGk4BgiVs0Zr9m6BokY4q1xH?=
 =?us-ascii?Q?wwn9A7B1zNdMuiBz3PTu7fjeVb+1mnsC+ONP+r0p339UQ2JcfmvBrgGVHPhf?=
 =?us-ascii?Q?vc52fbmwgeICgwgTmbi7c88eZYqiR+yVom9sP995THScb9l4iP8+Z/xKkqqC?=
 =?us-ascii?Q?fMXDWscCqGq1t95JJ+XULN6YMF0jsDyWXcVBH2dCH7x8hMhk0LU89AGyzr60?=
 =?us-ascii?Q?iaNd0LapqNWyJNUkW8riKkq6IR6WoSLpERigyF23GUaeMsCaCmF2KvIpg8nC?=
 =?us-ascii?Q?aV/kYTKX0mgLFUyRt7YjKPVywuY/HhN1OG3xd3F7QLcf3K814pTtyChBfNn8?=
 =?us-ascii?Q?jl+cXkh+c+eywl154OWE6ACqqA2oQnKI+qsYxv4u1HekML2/2Yuh7T0zu5Xf?=
 =?us-ascii?Q?obzoE6I2OvVbZbZcfZC+e+gJZGuksTScreiX0HU3gBc+kmZB04kCe81p1z+F?=
 =?us-ascii?Q?HDeiDDwgMVQpL7kopXhmTrDG4Cd9pZZ29vmuqOahQtzfFGd54oHfSWYje2W+?=
 =?us-ascii?Q?DPelLOhTA2bPEMxQI7TXCizewlO71GJoee9wJPrgaTyYIIz/7ld7hRpgH55b?=
 =?us-ascii?Q?BNc+wE189CdGxs22Oa1Wfsv4R045PoW0wXYp/oQTWNH6fCFs7f8SXYohVsds?=
 =?us-ascii?Q?e7s5aqHFJ1z1lIKgoyRvn61brjKEzN5nADS/ICTN+ZgEHuSGeAemxdjJyPlP?=
 =?us-ascii?Q?yhv6n5KCv1TtlKuAO6ob1wSZfWNW1YMxvBjTRTh6h9DT9XHI+t7T8d0yJIGz?=
 =?us-ascii?Q?+UPE/l39OEONlaA/TVDG+pRA9BCDVx8+N9ScqimoUGwPvIHMs4E0kA=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FXhGHeN5uFZiBnpwm6grFjtr3Uo3VwNalqfjyZ3t6wOhh+gb8cufYCR0DSti?=
 =?us-ascii?Q?SRGf4d930iiiLYH7+WfVqw48AM+7/qQsyUkoRc4lrxWjpuel9pdkpqcn3ed3?=
 =?us-ascii?Q?lEzgAHK79fCC3uJ5XzDyypT1nfEXbYaAxKbpgVYdoaRMf3WTRtJivLOYfxyd?=
 =?us-ascii?Q?iG7wPJDIW+li2FAPPekdd7U+hXDToxscp+rZguXmo7hxgR6XYv8VDyZkHBkG?=
 =?us-ascii?Q?NsxWXn7L+VmQ6pGV3gfN/49rXhDUAiQQluO+T1kLksTSjxUsMBSs6oqfG85Y?=
 =?us-ascii?Q?PPFz8Fn4BcgTNbN/fWocKvcBR5N7MEgPLHaEVU+dRA9JkgwBaAtR1UX7kzau?=
 =?us-ascii?Q?e1O2tOUiRx6C/rjvOUwZ/4OVfPfai/V3WJ8Wuug+rw7CHfgSEcd51PZsoBMW?=
 =?us-ascii?Q?Du+/yt46MXOpvFWz6FlOJwZ9AleI3i4ObRxiZs4cs2vYrqxEpb2tdF8wp5Da?=
 =?us-ascii?Q?3RARl9ScVmkKLYHdOceFtD1sa+y0F3Zh2R397jxN6uTwrm5W3qndskdcNFxR?=
 =?us-ascii?Q?Vw0Dmf6ih/0SPziq+ThoMgzBx9GKbHWimHc3j5HEYE11mXr4OZqb8UKcSFh3?=
 =?us-ascii?Q?V5HLLHvYnxgKFTAb9j7ojBHYlZGI6pwWOOxPtXx6XQ/0gxZrh+e37SmoRmVp?=
 =?us-ascii?Q?qZYaplZKzjL8kU5kLdejW5fac9joEhyg4nIEFFmvq2vAB943HQhBg3gUI3E1?=
 =?us-ascii?Q?UCFppQkl2bspEikOIfI7+Sa3cJQkwU8JwJiCpLMa7nL9qGaTMfDKZgWMNW08?=
 =?us-ascii?Q?OaLpu3/vQ4olmp687NEzaNhAdx+l9wJIjVoG4LhZ9/nHMsqdtwXNdfbqymxm?=
 =?us-ascii?Q?6/CaSwZqwzEkYkBD3FuXX7Qx/FYxnlkE/dgo+PWx0Fs18ma78d+M0hG92Fln?=
 =?us-ascii?Q?O6dbJu5IgakIXwyjvZzMB5peFfv5wpKhM0VSYe/m+C7VpxeMMAYk1fO2eDeq?=
 =?us-ascii?Q?OMgYnvLMiH58/hh8anel+S27vWJQExRGJkuwgGoKPIA5j6OOGAHxE5QctryR?=
 =?us-ascii?Q?06YAnUyix4Xd3pAx7nwp7+Hqn9TkQgnd0ifRtcV/DWg46c+4VX4hYg6RutlT?=
 =?us-ascii?Q?UCNYaJTbLZ6KZaL2B/efNkj3Or8NebviAw+Cf8wzhce0o5GscAaV6at168aA?=
 =?us-ascii?Q?KgW69SY8U1I9v2mdOVHwD4juNlyTIKyrHT9IaYxoBNE4rLfB7qi5Jbg9dBD5?=
 =?us-ascii?Q?v+1JfG8e8A6MRmAo21zYZYDSJ49SSRoYK9YCALpdy1U12ZT0NZiB1ZwGpBsO?=
 =?us-ascii?Q?1DtkWHYXTlh3EXoUNTqyuTyItfAOUfidZC2y6U5PJQhJe3K0tHTboa1xz6bd?=
 =?us-ascii?Q?nNsQlLddpUcHhEnqeiPkySv2c0X6p+PEhaHqmfLnJQLgOm1lwzOSjhZivD9u?=
 =?us-ascii?Q?1Mne1Zbyles8oLlQnTehC8gbCxRLf+GfRjqP0rHvLRdUnTn4K6YLriX3ouvI?=
 =?us-ascii?Q?GC3VRXzamRM//eXezwEbBnQcXGDSn4EEI0hzJmRYueII0ATZ9brfjDpbtfxp?=
 =?us-ascii?Q?bjhkzAUHw3Zexii5poSWdQq2m8dcUb4v8/ypfHFvtOszi5C5/pjUr656ADss?=
 =?us-ascii?Q?OQBM2DuFbsWtO/V4RMBmS2R2Jqh+hoEIkALnEAot2UuVQbcSjtv/Laybw95H?=
 =?us-ascii?Q?9RCo4FgvYDhoz289nl/+//s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f707ee24-e47e-44b7-4f67-08dde3f78ce6
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2025 16:50:51.9483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rQwgN+9Fd7pQiOBeC0aUgpDNCKfLmMD85a04XTTbFw34zwgENhBxE5/XJGXtjk38w35Th+w+uJ6BtRD/letSUr/dAZcUWlHkHCQNsfnhAqLGiq6Xb+iNtVY2tn2TYK2K
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6425
X-Proofpoint-ORIG-GUID: Q2qP8Xb7LxmKSmeruQUN65D-1IrJuDHi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI1MDE1MiBTYWx0ZWRfX5EOJwZCLdH39
 uhFjOuDJ+Boa7n1bJsXvF6mi9qAZYH0kYn1neTPEa2g2kG3S7DQd9Up/fL6abUS8fczRaPg/p7g
 8Di9CelJWTPbFQqnbAKx02bT527G7OH31xPXSxfTxjpQbZctwMIMLyBUPD6h+7AAyZGdI2r9MNG
 duncOEBCA56FY/R2kEpkPf1ZF/GcgWuYy+Gmp9Re6ehKQIR/htGnrf68+j1ydiDyAFzYBq9tpDu
 xLgrUFQafuxLOmcovoACGffTTaKxeA6eXFDY3tkl7TAkceOMxyQTzjpgX6ZGLBmgNFoTjVGeZhQ
 OfORlZN3mQErFZvKLgp6Q7EULvtZY09suIE2P9sNbGtmxpZIjlln7s314Rf7WI=
X-Authority-Analysis: v=2.4 cv=JfW8rVKV c=1 sm=1 tr=0 ts=68ac9470 cx=c_pps
 a=BibcfRyhcQbbDCdhKLe5VQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10 a=t7CeM3EgAAAA:8 a=76WDL9UpPN5piYbPjR0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Q2qP8Xb7LxmKSmeruQUN65D-1IrJuDHi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_08,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 25 Aug 2025 16:50:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222417

From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>

SDK toolchain binaries (nativesdk and cross-canadian gcc) currently
contain a .gnu_debuglink section pointing to separate debug symbols.
These symbols are not required in SDK builds, as SDK users do not
need production debug information on the target, only the compiler
and headers for development.

Including .gnu_debuglink increases disk usage for distributed SDKs
without providing any benefit for SDK consumers and so removed.

Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-common.inc | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-devtools/gcc/gcc-common.inc b/meta/recipes-devtools/gcc/gcc-common.inc
index 8d95698743..3793aff0a1 100644
--- a/meta/recipes-devtools/gcc/gcc-common.inc
+++ b/meta/recipes-devtools/gcc/gcc-common.inc
@@ -144,3 +144,8 @@ remove_sysroot_paths_from_checksum_options () {
 cleanup_installed_include_fixed () {
 	find ${D}${libdir}/gcc/${TARGET_SYS}/${BINV}/include-fixed -type f -not -name "README" -not -name limits.h -not -name syslimits.h | xargs rm -f
 }
+
+# Disable splitting debug symbols into separate -dbg packages for SDK-related gcc builds
+# (covers both nativesdk gcc and cross-canadian gcc)
+INHIBIT_PACKAGE_DEBUG_SPLIT:class-nativesdk = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT:class-cross-canadian = "1"
-- 
2.49.0


