Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E690CCD1BC
	for <webhook@archiver.kernel.org>; Thu, 23 Oct 2025 11:27:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.17686.1761218833815615220
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Oct 2025 04:27:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=kWKuD+1D;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=23915c5530=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59NAQDlt960424
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=V2Cm//I7BAwJ4uZ6OH/T2qz/UFASyjUzKiU0FXnwm3M=; b=
	kWKuD+1D+uhetMRdHS4JurrylgU+TthpbDyypkUbZ3MFurtRu2FXbV0Xmm4hpZY4
	0t1cMTKQfD0Sw5LqHIsiL66pHbIOg940TFQuYHbjzbumpNYSgFz+q2y0vRcLQgE+
	tdJn1S4Nv8DNSMB17gMHOIczjrx1oiXmEcu3oJ3CSh6tXPMhaXjh5U7Fs+Q02tIo
	NvyvGUn07Oiug/upqxC5Gbr3FbeUSMQ7A+96ywLmAc3kUgdODqnlP8uNC4Gwmc1E
	38g18EIKzOGjXk7B22lNQt0jzgh9fzbxup0yILVOD7dCr6c9fC1YXQHbjXy1DY/F
	0jN+zliSPdlK11j/PCQhcQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012043.outbound.protection.outlook.com [52.101.48.43])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49y8atgj6p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:12 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eZjnl786FuQlOm9ac5w2v7K9W3Z2qLIDTfBTDdV338EGljfEbmpWFH4Wq48YzXZNW8+4R/n8qSnzNAJXXm6Oeq7M0cjIfjSvWJLsxVEXuQzoeVWniuYXLn/ohrO3fw+hDNpafDNlrdOGKNcSkrhWeWwLGD10TU/vATskafc5i1VjSJ6uEMmjxx+0/9B5q26H1qGK/8CPX52p9YfXyepqALUFRc2f7/XDSPcNYFrmabn5jruhGVDmCh+7rZ+O8B/NnTlwDGNqUlHaZ7JsU9fOTAJUnNdkBR/pzREesrkUNVYHaX1IHn119rt4DqqjwMJf2hkf45JzJVvv2x/jF/qKEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V2Cm//I7BAwJ4uZ6OH/T2qz/UFASyjUzKiU0FXnwm3M=;
 b=mAb9ZUkXyUcgfmlVBe+9Y2Ms1xSisCWN9WvkRttgEBnzxxFeqZzxjbKD2Y1zDNAs2Rw33HGWuxVlHyuyOcLvGm2Cdrizp/EFNyaPCoDOu2rLp4kHRCRGiCb8CDiVrJ0RGiLK17C0zhqcU5VKF8rQxG6GK+k0HD84VhXU1RKmaSIIh3b/Sg3okX3J7d9vEzhaDejGWqNDujOlBu4K30tY1o/5X/gKbo+W4ZhEwv7jZfoHC9UgI8lVZjWTeGzt00BF5rcgCIiMTsRPUB0ko88V1qXxvsNpS5H+JIqAkbxcVydvpdcBfI4dxg4OawqeyRqp5KNZhlaWeeG3N8TTjPGSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ5PPF8B3F23403.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::842) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 11:27:11 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 11:27:11 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com
Subject: [RFC PATCH 5/7] kernel-yocto: add rust support via make rustavailable in do_kernel_configme
Date: Thu, 23 Oct 2025 04:25:45 -0700
Message-ID: <20251023112547.4044904-6-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
References: <20251023112547.4044904-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0091.namprd03.prod.outlook.com
 (2603:10b6:a03:333::6) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ5PPF8B3F23403:EE_
X-MS-Office365-Filtering-Correlation-Id: 723bf735-7918-475e-2689-08de12271b94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zKCnBRDYBFjpAznnA5Nm9WrzPSXhp08RWRFtwlrNv0czw5jfUzYmcX5olBfl?=
 =?us-ascii?Q?iF2Vh1pSUccGMK0Lbo5of6y0KuvRLNOmtFMKqPrrFwLSmswp9A9+cAhdNs5n?=
 =?us-ascii?Q?eHmcHUEFC0E/Pee/E/Q563FMBvnfz3b7QTx7iWLkcAmXbvkzhrdsJ1MWvGEB?=
 =?us-ascii?Q?rJJfRLzvFKYmPrSbjKyzzteVBFJxt8cxRk1L9NBM0NfBCvZlOOWkrCRm5Ysh?=
 =?us-ascii?Q?OHAMg8uyrv6f0DJ6M86jsMNkun0tcabv9KvboVGDDwAzgUKksJJGexhRD+LM?=
 =?us-ascii?Q?CqAvf/fm4UPdkOysgoVWv8Fx2p23P0KdX8eN7OpRbNxaimlAhxXW/DSr11uG?=
 =?us-ascii?Q?c/zi+Wk9YzD59zztqWBedsjSL5H4UKQXmg+y/HvgELtNMKiw/xBn74vqthC0?=
 =?us-ascii?Q?BGXAUNZ0ITCcfIIy/59wBoZXeuT3GEQxy8iiEAOr7UxtWJN94Ss04HIWzifg?=
 =?us-ascii?Q?1DLewFaL0XQBHWddaucDNLd+URY9b3Yr51wVUiKub1f9VhtfvFdlY6OcIAZk?=
 =?us-ascii?Q?tiSWh+deznc/JJTXWTGCMmNNOE5GkYFBT2DNQfH9JpDNRYmayiqo3OtzKicl?=
 =?us-ascii?Q?uWn1d3ZT2ByyyefDxUFTyBg+/8OPjDeHzexQNvXaDqvYp0abi7kWD4Am+yFB?=
 =?us-ascii?Q?ZB+zrc/Z+RryYw4qsx5KwrWO8g03f2YC5K4tzLOxbN0srs67FF0enUWR9VL9?=
 =?us-ascii?Q?TTdhvcDB6+fD75u3qHR3Mb0YeuCc3Cc7knI/aCRrnodbum6fGtrJpN7T0UqC?=
 =?us-ascii?Q?kkfQu2zNIHnCCgjshtnkjCaeIlAxAOB7EiE8O4KFzpE+w5ZpAkMyyiIUb49E?=
 =?us-ascii?Q?+zoctyhwv/vZNMavKxo/4vfRTyZctj5h5wCgcM+8S1fIysIug0VgO2ecfrVu?=
 =?us-ascii?Q?figcnJt1GEOOBLNuMYVVnYI420dpqPg0O7YCYHzwi/nOJfagaUYFmNZh6mKy?=
 =?us-ascii?Q?HoBU1eMEdc0Dt2MHnlOzpMP6t+JIwsxz65EWYid3qTJ6SPE/CCL4sFvXcsPx?=
 =?us-ascii?Q?LfM2mZDMR6G/ym7esmJQa+pHYcXVL4uB8Yy3BIheNZ+4iSbcyje3+xeflu/9?=
 =?us-ascii?Q?VnRMuU9DbG8x7ijQ0y7lKnlj/VLTWNdq1d2VHjy7Lwoh77nfw4u0Ml6DzCzg?=
 =?us-ascii?Q?ntPDsjSVTVYtxiPvjFLaLLXdqIdX29wpWM7s8cLmYAQAG2NVmgGepv0BAVOL?=
 =?us-ascii?Q?FhwLmzSe40xndSvbspAu4ck0aSlV59bt46ck4B58TCzJMCj0wDQpYI3cw9H5?=
 =?us-ascii?Q?uPbdoJCDT6arQta/+8OtAArzt/QYAdKy2SNLrMe5csLtIbSbENFMcJVTJm1n?=
 =?us-ascii?Q?b3Os2qraDNFuOZEJjilQmwRBZCDULmXXKeWIVk5k9iHXBizvqveAxlHiMGr0?=
 =?us-ascii?Q?nXGzivR7o5yZxBvmhknETrO+zrtAc1zVdVBYXR5r2vx9NhUMalJ9eV6aHnZY?=
 =?us-ascii?Q?AM088MhxOzLg8LkZWyak9j6IPLh2b4VLl4H3VWCJmxuggC/5Vovat9OXWm29?=
 =?us-ascii?Q?ixWHp5SAZRaLS4HBUvL8iroh5JVgYy0E8yFv?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?+yRa7NQeBnkGUdyaCRNkIOV9DxnjoQssFjy4kgnfWcpZ1zyjSEe25sacFiQ1?=
 =?us-ascii?Q?36dZDsEHMkgR8LEOOP4k8o736dqoaU19/+LqxpZc7UArvBSAM86Ig0tVowAt?=
 =?us-ascii?Q?1rAaKPrI+6R9KQ7EDWUzGuknkq8BMPkh/IwMixaSyHk0Go0EsiiUDxOnddVR?=
 =?us-ascii?Q?5JrLW4X6N4uOiBy8a8db7BNewqaoDGFeNRbYvg970+1jmTdgi1dYo+q/+8h3?=
 =?us-ascii?Q?XG2PT8oFITbZMGUq6QUH2aJuBGJCLf/4sYB7sdU0jL4b4bnzUbTkn2q/Jgbg?=
 =?us-ascii?Q?HUEjGPRoG8QN1v1G9FDPhjtDcQDPejcp6mA5AL7BqCpW4CkGcEU0uVHA+9N/?=
 =?us-ascii?Q?neXzGcT+n0WGOIPViCrbzoGk3knpTSRIRtVyg4AvEMS8cZjlHPjPnNZxoPJi?=
 =?us-ascii?Q?UgQaq//eV63IRwy66bI98thT50r9zaWUBHaGTs6l9TPkyDKN12fHWgqZ5wtm?=
 =?us-ascii?Q?p4EU+r5Q0TatlHT8N+pGmGFCQy5lmnc6UqRs2lQMWr7MxjRnIgL4mgQk61gF?=
 =?us-ascii?Q?txcnGE0uIRDX1UrMmFu+JQVi7siIlQsvVhleUudAvqYnAC4yk4x7qTJnVJIl?=
 =?us-ascii?Q?VNfFwBE/WhHUZgFYi4ql4q7EmcIuaOqE+8wkKj2wQ8fSBdPF3gtPpctqKBEX?=
 =?us-ascii?Q?skiDHshoE/94OHn9og1wBlKjB99kCs//kZdchUnFFo4s6tSg4+GB+rWabVfy?=
 =?us-ascii?Q?M9v94aJvYeB1i+1TE6HOkiqq8fKEbuqiWd/8BH+Uo8K03e3vHIsawHcZHNmJ?=
 =?us-ascii?Q?ohDlekLI22YsrY4zLGJSR8zLjmsSjL93Vi2iPY767BqLFqF9T1GkxIClKOEM?=
 =?us-ascii?Q?NQI/kjKPsW6o+ObrKh4Iz+LcQ0zHLjBDOpkiEWBXIjMr11nd9QdVExgjozTq?=
 =?us-ascii?Q?qAXVGMhnl9XEbPo9wlLHcUd+iYpRvqb3zaeOYJidkNBNmfp4ZF7pF/tcJUev?=
 =?us-ascii?Q?1xgnZaGkJAnyoNeoVn2sMgaf7iNcMxowlaIFXAzqX7CwQRzXbg/MCucBDsUm?=
 =?us-ascii?Q?usBQkjfCpCu4Sm4XFmVigl4l3fMaKrYt/1FTRdCNqoOqaN/SqH+goHuHeJ68?=
 =?us-ascii?Q?DDELTh5R2F7aj6M9qP9MUWp90J/qWoItKxkPB1EY4rv/S53EQhaHWRyYwtAh?=
 =?us-ascii?Q?IgWQY33ppCEhp2bRg83+VR9fwNkvNSC1Bk2OtHHdb7drr3Y2U8OipKLcKSR0?=
 =?us-ascii?Q?pMhEyIJiZ+Alf+yRIpsol3pvEm94THmfpHygy80RUC7bdcRMmVTLln/wHCfY?=
 =?us-ascii?Q?cBluKabZxerbuISjC31ltSwRiW53OPB5qbQxHzs34pG3e0hac38Wl1ReaHvU?=
 =?us-ascii?Q?qdc9oU8NxZMXdSdObzLsHEh3Gh4Iw2dvTSciDSquuYUxE9VlLE5nx2cviDQx?=
 =?us-ascii?Q?TnNFQf7S1SnP5tm0L11irSSzv4djwQelpjNzbgtO2TmUPz/RcMgRRApTZKp1?=
 =?us-ascii?Q?8wbJRaFmFe0O/2PqxfmTcDMdaXR8nIIjeo182h4Zmc9CY+xHMYlIe8ydmuxj?=
 =?us-ascii?Q?QyAEk3otrHg629BBvP2xX2GXvJ7vV+NbLh1P1RdeiedflsCQIhcwq3gFJWRc?=
 =?us-ascii?Q?xFUanHjaWQYkm4ggmUa4rHrU0XC4ySNl7YYXUlMAL7fB6i2tlaGFHu6J588a?=
 =?us-ascii?Q?IQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 723bf735-7918-475e-2689-08de12271b94
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 11:27:10.9763
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wO4qkS5JpX2+vVmgytPmkPiOTyY0l+6fds+TVQZZRCmfT5JlPnOBwyW/ExuQaV3Vk7lfPqH6ORl4gJ96XDUAeNO0j3eZzIHvM0JOMLrpRsY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF8B3F23403
X-Authority-Analysis: v=2.4 cv=N9ck1m9B c=1 sm=1 tr=0 ts=68fa1110 cx=c_pps
 a=5ROfPwdIRWh2zNeQ7OwrBw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=Vyd0EuI7JbdUIqhbzdcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDEwMyBTYWx0ZWRfXyJLgTDqva2zd
 KQOkvvsOY+CKqYZfVmZdKeElMMSMQxjeXFOyHCkboJH0ecjjnsLlLYARfn12p9QtoczvkZytsoH
 XB5/luxYwo86W6QK7X6QjU+04MPm9qHfjr8KvIbcFwtLWoYsKPMrKUwR7XsbY7193gG+9sNGM/w
 7MTeIJQyqMWc7DEF6rNbflVPBvPqktFwFi3ish+sbLdYKlZOSeJMj+d4Qlcq+081nyqfBmWiDw0
 2pEwdUjG+4Q1LDi1O14cMtZoiuhKRPDnXjdm/f6hs0sFbTg8KelR5e7yfsZ0Nugul6t/94txCYG
 RVf8iKJRfFdMDs9s5+9GiJdXUTFHCUvHwgZ1Q1mT4r6b70NGT7MuVzyEVrd3I71K4n2lRkzILH0
 kRz9bVCY2IeAwlBgtgfQySgF5ZyCvw==
X-Proofpoint-ORIG-GUID: 909JRj2C__QUTXsh54tsu-YBSEPUYs9g
X-Proofpoint-GUID: 909JRj2C__QUTXsh54tsu-YBSEPUYs9g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510230103
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Oct 2025 11:27:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225241

From: Harish Sadineni <Harish.Sadineni@windriver.com>

To enable Rust integration in the Linux kernel build, this patch:

- Adds `rust-native` and `bindgen-cli-native` to `do_kernel_configme[depends]`
  to ensure required tools are available for Rust support.
- Invokes `make rustavailable` inside `do_kernel_configme()` to prepare
  the kernel for building Rust-based modules or core components.

The `make rustavailable` target requires the Rust standard library sources to be
present under `${STAGING_DIR_NATIVE}/usr/lib/rustlib/src/rust`, which is handled
in the `rust` recipe via shared staging.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index e53bf15194..1a212b9be9 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -463,6 +463,8 @@ do_kernel_configme[depends] += "virtual/cross-binutils:do_populate_sysroot"
 do_kernel_configme[depends] += "virtual/cross-cc:do_populate_sysroot"
 do_kernel_configme[depends] += "bc-native:do_populate_sysroot bison-native:do_populate_sysroot"
 do_kernel_configme[depends] += "kern-tools-native:do_populate_sysroot"
+do_kernel_configme[depends] += "rust-native:do_populate_sysroot"
+do_kernel_configme[depends] += "bindgen-cli-native:do_populate_sysroot"
 do_kernel_configme[dirs] += "${S} ${B}"
 do_kernel_configme() {
 	do_kernel_metadata config
@@ -492,6 +494,8 @@ do_kernel_configme() {
 		bbfatal_log "Could not find configuration queue (${meta_dir}/config.queue)"
 	fi
 
+	oe_runmake -C ${S} O=${B} rustavailable
+
 	CFLAGS="${CFLAGS} ${TOOLCHAIN_OPTIONS}" HOSTCC="${BUILD_CC} ${BUILD_CFLAGS} ${BUILD_LDFLAGS}" HOSTCPP="${BUILD_CPP}" CC="${KERNEL_CC}" LD="${KERNEL_LD}" OBJCOPY="${KERNEL_OBJCOPY}" STRIP="${KERNEL_STRIP}" ARCH=${ARCH} merge_config.sh -O ${B} ${config_flags} ${configs} > ${meta_dir}/cfg/merge_config_build.log 2>&1
 	if [ $? -ne 0 -o ! -f ${B}/.config ]; then
 		bberror "Could not generate a .config for ${KMACHINE}-${LINUX_KERNEL_TYPE}"
-- 
2.49.0


