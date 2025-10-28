Return-Path: <maganuru.jayasurya@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35D5CCF9E0
	for <webhook@archiver.kernel.org>; Tue, 28 Oct 2025 13:02:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11019.1761656539679745145
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 06:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dyCh+/pP;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3396387246=maganuru.jayasurya@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SA1Z8C981143
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:02:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=Sd34zfSaN
	AuhwOI7bDg7eF4fmQSDe2um8qxA9tWP4Gs=; b=dyCh+/pPGNqhbImwcshEf8H/1
	fkt+FNom9NTRhqukZ+MWDt9fDMiVcfff9AIyRP/jtFT8WCJocQ7AJKZG300NQWpM
	gfFpg4VCno2UTYuTukKQzJuT/wbtXd0OPqWkjM/bEmaIbTUu6JHdB2kpw8HrCBFe
	2f43pzHNIoMCFeJF/H3CZb5MV7ZgjCf0C5MCXWsrt81BDTZoEM0GpMh6BeKLD4Sm
	MXg031yffMtySV6u8YkWSOVRL/wsCqzAyRAG7c/rbm4b+vqW469F2dwWXRPNRofK
	QEB7Qpm07d/FrUe4Izt5jbchS66X5aaYSMEwKFuju8y/fUTaSN34yttrJv5FQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012032.outbound.protection.outlook.com [52.101.43.32])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a0ks038dx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:02:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6/9dbGxu+IuE/CrI2uZm9t25NS90Q8pX4oyo/W5T8j7qEFYOX34vObA77VRlEt6hS0iZUe04mkilzEnBE3dgvLJI2domOUNRM4e3TOJyrkxTLs95QtObDFjwpNUj6536P2gnAgjg8/WbSMMpIxNO07RtPaUT77bWc/rzElYk2QAikKW3jOVDVpmsAk3nLBZ99unNDpn9Y5kHWqyCov7uMwPoNIKS3/f0H4eyvsCqWXLg28WPWnCvXB1MGBoeQvsILWkutauP23hDT3i79v2Vv1FyLoCrrVwebBpS0RBA3p2YoSUAQ/6IqbY6+Ji1iKcM6JaYsyoiejEOCO8xasJBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sd34zfSaNAuhwOI7bDg7eF4fmQSDe2um8qxA9tWP4Gs=;
 b=A2LT7x32CiWjGG95ncJ5MGf9OvrZUmujOyxnCdxBOewLlQ5mwI6Q5u9Dysc+95thLJJ9mOF1e/fBqxVG3nUYtVsNxFPZrrd5glqysuqAjSYikTjlFJe5F2i9fdmp//pVd6tCcPNcVejX5zWHF/HoOKij4XAgt2ER0kjEKNmlWzbfZb1soyA+jIaZdehEnuvI/rsVB32Yuq5uBL63AYtfk6t3XP/O7Ptj6xYRbwQQXxkbBeX78Kjb//BlZC1V3kpK0C4kfF3sXy5Ed8CE+K517kkH8USReaR1Xql6wzspkm8aGSWQp2Ln8ifPEexb78tJFl/PF3yqZqnaV6DSecr5jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB7753.namprd11.prod.outlook.com (2603:10b6:208:421::19)
 by DM3PPFCB5A2AEE2.namprd11.prod.outlook.com (2603:10b6:f:fc00::f4e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 13:02:13 +0000
Received: from IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8]) by IA1PR11MB7753.namprd11.prod.outlook.com
 ([fe80::82c8:53e:89e4:43e8%6]) with mapi id 15.20.9275.011; Tue, 28 Oct 2025
 13:02:13 +0000
From: Maganuru.Jayasurya@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Sundeep.Kokkonda@windriver.com, SunilKumar.Dora@windriver.com
Subject: [walnascar][PATCH] spdx_common: Fix invalid SPDX downloadLocation for Rust crates
Date: Tue, 28 Oct 2025 06:02:00 -0700
Message-ID: <20251028130200.1651850-1-Maganuru.Jayasurya@windriver.com>
X-Mailer: git-send-email 2.49.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY1P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:5c3::15) To IA1PR11MB7753.namprd11.prod.outlook.com
 (2603:10b6:208:421::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7753:EE_|DM3PPFCB5A2AEE2:EE_
X-MS-Office365-Filtering-Correlation-Id: a6165b93-16dd-45d0-bb2e-08de162236a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|1800799024|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2BfYIUYNsPyioGkvvXE8KfDISl4KnTBiiPWFh8lTtm4VM9A/uyyW/d6pR+Li?=
 =?us-ascii?Q?yPmyAHhnjAd9UAYjYtUYIWwvFq4oR0tS+Xg4vaebXOiYevEZ8qaREksNxflZ?=
 =?us-ascii?Q?1i6WhpUHPjjXd4825RfxkZXo541jZFZgi9cOxOIKac3Wo2MVgQk1SSZJrA1E?=
 =?us-ascii?Q?rHeIo7lPSg09D+hEvLx8aZtN6pZEUamKsTU91Y7FUH8sG22RL0FeS6v06/ov?=
 =?us-ascii?Q?U4v9wNE3L0WRLUmNgM8CtcCHwsu84U1u+bW+4FTFQne+FlvPw/CzWXkHgCpz?=
 =?us-ascii?Q?TX8Xt9RBklAxBXeYwePJEQLFIXxUqh3LmYBcLpyC/9bCwYBiCt7yVlme4gqS?=
 =?us-ascii?Q?Nx1rbGU0iiipsC9khWcKlpI9U2aWZU04ZqB+9JN45ZGXOv8YPmFwK/LzT1cW?=
 =?us-ascii?Q?NoDkdc46yS5E/ticP9RDZ+zsl23GO4EcHcvl/rjPD580EsmfqOR8/dM+bI/4?=
 =?us-ascii?Q?qEkgAfOf9TW6IfzamS3RZfcaexkUa9VgruwCZkP3jMeMN69pz/NqKu89RIRt?=
 =?us-ascii?Q?d2ula9xRPcW3A5abSxZYqVBVp7cn418pWIF0VAWq0MGYOkyTVySrRgDYJYs7?=
 =?us-ascii?Q?rLnKiR0T3XXvuB+EfkbLk10nUt6E+Qg/z6kVuujJrE3zcgnYxe7Sh8X8y4Rn?=
 =?us-ascii?Q?5Wws7ly1eXuV0Wli7FwnICr880Jqvty4JIBn5l4w91i8HGNcWMN3N9WOKHMR?=
 =?us-ascii?Q?QTJPGv7gAjRPHCmhlpEFgYxTCDlj3PZLgTXnB0bg+B6q2hd2UAVuLNK7xjm9?=
 =?us-ascii?Q?4CeXWrcHXmnjjao7c8Bu9UMG0aw8T64OK4YFYNzsxXHH/rSbqwcNDXG6KhwP?=
 =?us-ascii?Q?Nfir+somLdFxRHDKJhKISgLQSfQJLwmBH7BP+SAlP0nAHT88VWXs/wcR4Np/?=
 =?us-ascii?Q?89M2ZPuRf0RIgDYhHyT5AZ1mGutc++74a3aZcmoeV8Vb9wNn/SAM1lliLjp/?=
 =?us-ascii?Q?Q4ohS1lWnpHxoGc2UNGnWsoIpEM4pOjVTLoVSjr3x2oEl5qkmtl/+uHa09i4?=
 =?us-ascii?Q?nSGMtii9AwBe1QjOwXTUAaQJuS9UKUJxJ1WbtVJ7A/pErj0Mn1EQw79GBkQV?=
 =?us-ascii?Q?DBU4KG32CXnfOwLmTccWsWdWGSXoA8ei+yWHrXqu2cBNxW4ueF/oFkOWhRyr?=
 =?us-ascii?Q?kXPRnoLM1kJ7QM19OflClHqO21Bmd+n+cu2u/w5QxkTlxUXrX0TkaadGOth3?=
 =?us-ascii?Q?OeoVvbSMmtEo6pmMRKdjfySxg//QO3UD+oWUkq9lNc/Vavb0fRFc3+iH4KTb?=
 =?us-ascii?Q?72yQ1tIeBeXQb0k41qmyvQrNX3Vm+HDJXUALzSHUncI/QWSgtRr37d3YGh74?=
 =?us-ascii?Q?zJbnKCiTI7mowFTcH4ybedrbu/WD5e1NN0g7dN3P04nrvnWUcnW2mKt4tova?=
 =?us-ascii?Q?KAapBiItksjtrsjYzCB/+YKtxCAz/6qeTb+LUHwyx/9ewiJO4D0+vTyUV65O?=
 =?us-ascii?Q?n3YoWTgmr4Ji/neqX52FvCYJL/3P9lFVoVIy7lxjz9t2uHkx6Cj1Uw=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7753.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?UNRLLvfDdONWpqD4kePMS3gb1j8HFvtBDw0RWBc3j5ktFT5njXzMdYmi5HcJ?=
 =?us-ascii?Q?AXTNM/vpz8TRlfQfpr7K5X8vDT2t4kX9xoL0vcwMKMizJ5VhqxzUaGpJi9dW?=
 =?us-ascii?Q?wbKlxXCTPAhaAMuxk1yjSTsIPnAaRmhA5SDXv73TRTiyIgPCbpx1C/zA1Qn1?=
 =?us-ascii?Q?+OxDP4tXdvZxqghvKs+hn8Zqod/gWZvhr4DBGXK9rzyNwOX/uNAUsL5+jeQ2?=
 =?us-ascii?Q?BOfjcjFTZedrBhTow9ggxJgqs7A6iu2JpkeWHfUFtHonw66jAH6pgaphNXPf?=
 =?us-ascii?Q?xzWt1t/uEf7yKi4oGVkog/qxTezTdiZIaxroFRABtPd7Ex2WYXEgApIxIH3B?=
 =?us-ascii?Q?taE10EHGO1EZ7Zvkdy/9KxDyiGROZMkGRzsmXr+CjYHXQfrKdZVi5e2n+H/g?=
 =?us-ascii?Q?CQ8x3EIjnYbVvNRVYISFXhGdP7BYBSgz923sJRjgJF3awzkcl6rhoApEbYzP?=
 =?us-ascii?Q?i817zVCXdEkAkQAnRKiYK5GzZ0mBmS2mSEjOJontfJWZvGN18pTI8H3iWPVO?=
 =?us-ascii?Q?sI2/qFQGRd/fMv/JpQWWgbKaLJdegyVjIRvL8TabtdlXHvxIGanCdKKvRMIe?=
 =?us-ascii?Q?Gsy8D+HSE7UL0ZizOig8AMfCEyeGnXrCeRLjr/Xd4MDEyKo+vPhorRBKZl/x?=
 =?us-ascii?Q?kA+pN06kKB5TcNYm7gST6uYev5YuABODlFLV3M8EcDGv7DxCBEh07vHpVY53?=
 =?us-ascii?Q?I5RGFEuo2I6MVQ8eZpOjaq7xz8dOsunibJSzDK/z1OzQtVNV9l5Xscc5tdEA?=
 =?us-ascii?Q?u+1IzzdwVJQq+iAs8deONTagMCR62d4k4/5aXvazHvZheSGmLSvhYiAG/cxm?=
 =?us-ascii?Q?l9IPd9E3ALmU7MPv9dIW2IF93UAt5mod14hQ2bErBJ6suooTHOjSPvpYOi0F?=
 =?us-ascii?Q?rNP0rdVEIAmwDhET9K9OH0brqEuueEJan06Go+60gxU4+biqqH1Y5/26VDLD?=
 =?us-ascii?Q?EqjsJCHXHmbTE4odxHh3sLjPggxXYoPhbRJ5YurtQcsCDNDb9U18HUzqKOX5?=
 =?us-ascii?Q?89kxogiVceOWXHklttR1TQqOMtFzIIQ5ZQ7WjNaEZOGphk5d+rPMrUJ4IZRJ?=
 =?us-ascii?Q?Y0Hh1fkEbCTB2rHVeNiCb39FD5Hgv0gxvp9r/jcQ0uBlTqIUTcMebw073+86?=
 =?us-ascii?Q?RPJVUVYC5LzSJiFUxtMxOj/eJB9w29reH1AEo1UAaOZcE98VTBQId6BLqPNu?=
 =?us-ascii?Q?qmpWvkts6uqaFaDTSiRAkssiaHuto+4annB02xEB56m2a5eDOiNNw0kppNjl?=
 =?us-ascii?Q?TCNmRBykoGDYeWBxlN+Y1dNQYiPBKMTnKsSP/Fv/BimJkfCyDKRpcMdD9BtP?=
 =?us-ascii?Q?ikEtAip5dIE6kAswemZ2VUHSMWuBpboQ8n4RApOtDhcxpoyxneE/hGSkJ2/f?=
 =?us-ascii?Q?y18Y0RYMlnrT7s7+jysBFv3yZb9MlnUNwmTLFqE4uMtexxkNm4U+RNzO5XZy?=
 =?us-ascii?Q?3MAFrSsI2SdKrm/0ZFSK6ToEVsuqEfLHZuhXjgjWRaFTl6KxPnEBkVr7wPZa?=
 =?us-ascii?Q?flYWCCeCk5xkIdSFXB1B7Il3Y86tYQw1K5jiJwClZFSfVilEw9iQzmCHXgnu?=
 =?us-ascii?Q?o2bF/ZMXx4mW+S9+iJes62ScSYZ+xgqz+qcIoGNdKhfuHXexTaaZJt0aDoTs?=
 =?us-ascii?Q?RpSMlLbIG9W7n1Z/e+T6fts=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6165b93-16dd-45d0-bb2e-08de162236a6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7753.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 13:02:13.6357
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g1tYrCRoowTWu/TyTgGQ4T6EMi6bKfJSn6QLt7vl0BidSNuxWecJd2ismyYgxzZw8tdANkF7sv9Yl88oRXO8BKnSR0Br66N4dLVZdIlCWmGkfHF/xGvROFDAmZguoO4r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPFCB5A2AEE2
X-Proofpoint-GUID: shW7jJe8uQ6WNuftS6dAYNwJDLiBVCRs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDEwNyBTYWx0ZWRfX19Y8SFIpKSd2
 LES4ZgJ/9rSocpfh0ebF3bHsLb+ZuBDUxRPMJEnY2baQOXS+6tXTprcqncE/oUJwjs9JIfp04N7
 aki+zBr3UC3rxpGUlti96Y8mxYUlmOb4kROKOPqNJfXGgBIPfkj/YmLegh6/5BLYehk7PFR9a/a
 I8airZjAeTL9T4Qima6OYdZC5XLUQoW7Y7yi/cvBMGY3Cz3wDG2Y2IkGWyytsOzwGJ81GFAxSrW
 gXpoXB2oRyF1iMuUgB/B1rA5OVWIRiUqxM8BOU8AW2AKseYCGkpPd2/Q+BdTXO81BAB/Z7dbkII
 +9x9994oecFc5FnwBIkkWMHkK5vcH7vaVvmwqkC85H4Zv2Mw3QYJueC4CIFykWVj+4KVg7w6Fpy
 iWYHIEFfYR1V2qLkrEvAbdx29JyNZw==
X-Authority-Analysis: v=2.4 cv=CIknnBrD c=1 sm=1 tr=0 ts=6900beda cx=c_pps
 a=KOMCkPMYLpCa0saNKAKAdQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=OcE5tU-iAAAA:8 a=iGHA9ds3AAAA:8 a=t7CeM3EgAAAA:8 a=AkuDUe9G3ANPW9psv_wA:9
 a=qwkNQZnGtIHGNKTLT1RO:22 a=nM-MV4yxpKKO9kiQg6Ot:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=poXaRoVlC6wW9_mwW8W4:22
X-Proofpoint-ORIG-GUID: shW7jJe8uQ6WNuftS6dAYNwJDLiBVCRs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_04,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 13:02:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225399

From: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>

Fixes [YOCTO #15909]

SPDX validation was failing due to the use of `crate://crates.io/...` as the
`downloadLocation`, which is not a valid SPDX URL as per the 2.2 specification.

This patch updates `fetch_data_to_uri()` in `spdx_common.py` to detect when the
fetcher type is "crate" and instead use the `url` attribute, which contains a
valid HTTP(S) URL in the expected format, e.g.:

  https://crates.io/api/v1/crates/<name>/<version>/download

This aligns the SPDX metadata for Rust crates with the specification and avoids
validation errors in tools consuming SPDX documents.

Tested with the `python3-bcrypt` recipe and verified that the
generated `spdx.json` contains a valid `software_downloadLocation`.

Reference: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15909

Signed-off-by: Jayasurya Maganuru <Maganuru.Jayasurya@Windriver.com>
---
 meta/lib/oe/spdx_common.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/lib/oe/spdx_common.py b/meta/lib/oe/spdx_common.py
index 4caefc7673..830d26fcf8 100644
--- a/meta/lib/oe/spdx_common.py
+++ b/meta/lib/oe/spdx_common.py
@@ -230,6 +230,11 @@ def fetch_data_to_uri(fd, name):
     Translates a bitbake FetchData to a string URI
     """
     uri = fd.type
+
+    # crate: is not a valid URL.  Use url field instead if exist
+    if uri == "crate" and hasattr(fd,"url"):
+       return fd.url
+
     # Map gitsm to git, since gitsm:// is not a valid URI protocol
     if uri == "gitsm":
         uri = "git"
-- 
2.49.0


