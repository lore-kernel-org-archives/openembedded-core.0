Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34047CA5FC4
	for <webhook@archiver.kernel.org>; Tue, 20 Jan 2026 17:54:28 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12467.1768931665575420172
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Jan 2026 09:54:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=TbbxmyWu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=548098e00b=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K5Y6hq3683153
	for <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 09:54:25 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=; b=
	TbbxmyWuaB68tJD6MO7HZQLZ0/a2aXiqrRc2MbEOb+uLCd2Sz7RtpbSWRpIrp0rf
	iFF4ShXzgcAuEuFB/odiMizxa3oq/v1AfsrhbIXI7ACVETsMUQMp5hhjqhl5bMWp
	Q61gKJrvbWsuON2U3NIype1fWXZx/dWrgWbNDSevzpRuRompGOT3V7/G5PVTz+bS
	khPyorPUdCwyRuGKyfbdQjhBE7rpDOXK8CI7pob8daPfuKMJiGwxI4WyH7tHdNxe
	VK2uNYYbyVX1zgUIqChMlcvTsKqDsndrN/a578OW7LM75bnaReFE1uqovpmuHvA6
	aiQ1PLAHn/01VFpg0k6XJg==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012069.outbound.protection.outlook.com [52.101.43.69])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bratgu24g-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 20 Jan 2026 09:54:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rhuKDQ9bhpIIqUchalqD2RyaJl181G/4x2RYesIgiMRjmlV2ZCvrs4uip1S6j37t2ptAqke2C0Bngvm9UyVSMCFJsWlF3tcAoHetxl8prLYQ7ZNIwdUWG7kdUFS8imxnPRDiin882ONHS7SVXQ5oW+FvYK8oO1HKB74nxGvW3WVCLZzkWYwMEnzlle7aMGttFNKOPLeSfLFM/kEymsK80HeVgZRkLQt8Z6pVDoHxMo2zhPbAKqdgtpQDR0cPTBgwnY0p/SKeVw/Bxw5gIcaE7HnnampDTRWZ5l6VRKOFRDWAOT7LmcvmK3gdY0j/Y1g+LEJXGIPS5B0YEcG0Qi22Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q03ENCxJr2evbQg/Y6d7h08ksp9CU0M847CXD18e2Gc=;
 b=lyzAQLM5xjppfj1SEKOWSVcxlTuGBmMX8vWFRB32vM+SbR6m3i814tAOrTwbfVcH4O0LcKUJ0BZmtHtjWQJ2E38b7dex5aXdp1Ozomcuo6pc0ZEiLa8AGqA+utdwFhi7awltBxz/pzn0FhM4RKjhejzIDBVWaenLgDUEhS1hN84CLKc0XsSErEeLUtPb6ApOt/yopUtibp5gjo3Gx2pkfLId1wb+wby7bFwnCqhkKuT12dq75gDjmi1igAiK+qSgj2ScFDf63Wp34nuV9Ah5rWwx1GnJg3VYz1ybpeOF4DmzjQ4x/ehKTVIM5HU7kAC6eN7HgsOWzZpjXU+oNUjwEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by BL1PR11MB6027.namprd11.prod.outlook.com (2603:10b6:208:392::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.12; Tue, 20 Jan
 2026 17:54:23 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::6852:6964:54d3:49c9%4]) with mapi id 15.20.9520.011; Tue, 20 Jan 2026
 17:54:23 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, alistair.francis@wdc.com,
        Sundeep.Kokkonda@windriver.com, bruce.ashfield@gmail.com,
        richard.purdie@linuxfoundation.org, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v3 08/16] kernel-yocto.bbclass: Disable ccache when rust-kernel is enabled
Date: Tue, 20 Jan 2026 09:52:38 -0800
Message-ID: <20260120175246.2052341-9-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
References: <20260120175246.2052341-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:a03:39e::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|BL1PR11MB6027:EE_
X-MS-Office365-Filtering-Correlation-Id: bfabc19b-829a-4583-8027-08de584cf139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?2l11ibUSXg4bfsaWx6BzS2USIo7QTuVEVBiNsOlLpWfKX0ZFPLLpgWNEK79f?=
 =?us-ascii?Q?FSxrGeAH1TNhlXY8DOWAPSx+qbFLHu9n6395iMGHXm3B/T2mvqmnY5X/EWUu?=
 =?us-ascii?Q?NMs5OFJK5B/7q94ywMitlqTxpA7yFfbsppcBHyuy8bigvm5l/tYJWbC/H5GJ?=
 =?us-ascii?Q?M+bx1HERD6DZxVshOt7mm+qpuGhSWQ5TZZpJJhzTLbs1cEcjp0jRlb9d6osn?=
 =?us-ascii?Q?bTpRDg/118iOj2vRK5olYvduAqIUxZ5/twsbqVBMOp3DafOk3z78v2EhUxXN?=
 =?us-ascii?Q?ENM3ZLzZmU8MO5NDmGg4Jkpww3Euwj800xQhiBCxxzxOxJSpHflIYH/Esgy0?=
 =?us-ascii?Q?iqLVf6m34XRvwROiGsVe++EQPmX3jQOvE6k3yG5LDe+v5cp1ayaKNn2Ubats?=
 =?us-ascii?Q?yNz1x4bKqRRsYCCXJ5Uxfhjjvw+t4gQbOlXgqTB7z0EIbYEwghxtk19iIvX7?=
 =?us-ascii?Q?oAj7ySQB1wVDB50nuU7XwfIRhZDdLNi1MkhcyTxqBgRJxFpKKg2EVvt25y7O?=
 =?us-ascii?Q?PLYS4KW8UcjYMPoecwNAuPNV09yZQa8BUvBWvf7BDfb2VrTqu8vzVGyR8moD?=
 =?us-ascii?Q?xxjshrcP+XyRmVyy4KfMyyzwG0m17bg0dwtQw1abHaBY12ZPisQeoDpDH3at?=
 =?us-ascii?Q?0KTO8s7dbPjBtF4i/WTnfLP0QUaWYSUGXQWkVDH9/yrFPmugVxRrJwFe45X7?=
 =?us-ascii?Q?J6moTRpAf3A0u6uvVhOfnm6aOCy8KmO5xJ+UZXiBHTmi6n6WR5/arUQc2bmM?=
 =?us-ascii?Q?IjXNGprhlLLQUaEITQv4YwIQLhBWq1IPaNeSYH8wlecZq9iNs3KNJUrgknDY?=
 =?us-ascii?Q?5n9z6prfMT3vdA8KfixKdVmJQMfwCP3f64cnvsMaND3hY9IZdxbZBTW1Q5lU?=
 =?us-ascii?Q?pHPgb8ot1yL9tmsubVaTmPuYM9kd2es4ocrAx9MicN2yjE2l702u+LZkDtAZ?=
 =?us-ascii?Q?6dhblbeD1kizdGbj5y1IvBRBhBdo8TGyyRXKlIHA/yL9by4oOmgGvhw4fu6e?=
 =?us-ascii?Q?y31ptlaaJZg1Ne6SJxCb4eru3hRJzba4Pv5BYV/9h1COmW2/ImqktcT0PM1W?=
 =?us-ascii?Q?989evbE7+FteyJc9QaIe3UC7av+WnGdUkYfmQ7A0KBwid1/vCZG7RAzKNbrT?=
 =?us-ascii?Q?so1uzfgSYDTh97L7yGC6P/EDp9RxEmCnMPx2ZbmKEEHkuA4gbII2adod80kd?=
 =?us-ascii?Q?xcqxNtwtjuIJhl1GaFIFofQm+I30RXqSsJBelOmVKmFICa1DRP9E1uzqUqdI?=
 =?us-ascii?Q?XAWngQTX/AlL3wcfJ7LvXUBuOwBx+BUEGUBeji6uFYPRGV3Qk8CE/IjyaqwH?=
 =?us-ascii?Q?X1oi2IlJ4ZmpqVI920l3DuCZlnMxjp0GNPk/a6nQs5xzmTFMIVFSJN26KLHI?=
 =?us-ascii?Q?mNB0XuAwXiBIS6WxCgCfhHHCCowPlQCAtH21xlDwQhhTPgzEdOIsPO3vIB2X?=
 =?us-ascii?Q?sXmfONqxZgDlHZkWOZ3Gu4lBtYGG2/Wl1+AAAzusyI43rjgtXS6uGmJWjKSd?=
 =?us-ascii?Q?ebiDcf8Zl6JI2T1HPDRK5E/u7JPCsLt4ghmN+Rf28Z+Y8z8KtW+gcMWBaiwU?=
 =?us-ascii?Q?KSis6jBbgv/QUO5X7UCZD0h480IhW69UFkIlZYYQjaK6PHVO96zJ3ymUv7gA?=
 =?us-ascii?Q?ociq7h7A/QUT7Ao8mgfTbEY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?N7CIUVjGkm1D7SsLV4wbz3JkBcAcd9OR2Kbiof/EqdfvLodu38ufx8WGhgil?=
 =?us-ascii?Q?QDLpix1pNDvGJHWSL2PZVC4fDg4yj+eIy01Ac7OoQabtb8PCnYhEQejVpt0g?=
 =?us-ascii?Q?SNMyZDZ5EWcu0dxUg3DVi7mTvSz2IadmwOLU93VAGeQgIAkjL/0W2nkUlB99?=
 =?us-ascii?Q?Ih/MW5mzNtFf8MHMPAiisKnKS/8HYONKIZ9SI1bvW3h+tkkGpFEDPcvjQK0o?=
 =?us-ascii?Q?cfQ8N8x0fg01MYjf0LjLDT6/Lokm2FB9JGNC9V6ewtRCGJN1wzx8/FiF/WOL?=
 =?us-ascii?Q?9J8Jeb7Z1XP5ultpr0Trj+Oa72jNtLjKbnl8jOs0HCxEVaa/JsWrQlv7zeXy?=
 =?us-ascii?Q?KT5UaCH4Oqra2dadkfr3TjIzeAvZj5GdtENpV9E1cbef9vljbnWsr7trD4C7?=
 =?us-ascii?Q?TKEhmveZ0pwOoCWkkfdIYESwFxlwVXKfQFQMxJJEWzeaCu3wS7Xxsx8rAVnU?=
 =?us-ascii?Q?t6aHVq0mscKvHa2nTdL91geBR5qOurQ7FbGmWnSUsU8j9iesczg5FfZYazpb?=
 =?us-ascii?Q?z5PT55DAiC5pKWA/PM9xhnxjI9mDwB2dMqdntM+uZTqmJi1Rt2XbvhK7LJ3J?=
 =?us-ascii?Q?sV2g5Qds6Z+1CHX8+w0pDd2SkHlu97NN853bF2Z8ds7VXpm7uhVodW3V3IkQ?=
 =?us-ascii?Q?b58fUSCN+z/SVyZUGVNQkCIBf/RWy551Iu1K6GMAsItpu2+7euHPimB9oTQc?=
 =?us-ascii?Q?iVWye3HneVdMomIxUQ/KClgzMQNkZEThx+yStuYjX5KoSq//j0953DwFOhDu?=
 =?us-ascii?Q?a/iHQMYY0+O/W/tk89gpCefEdjvj7zjVJU2upFq1NaS+wz5wDoSCvt1b8GsJ?=
 =?us-ascii?Q?i1LKzQPoaMHczUsFMAor9M+DOW9m2inK4zKPGHb2qez3Z74zWLezE+IK64H2?=
 =?us-ascii?Q?YmmRqoeqLRsw92CZJueuCGcNzm1oHimTDytb8BCRvGXZPhtxAOBhx/p3YlND?=
 =?us-ascii?Q?2lFnrNZaIpLxR5UwOLs+19opa+U6EHTnUd4rYlaqnPp7vAeZMyy0qHq+YIGb?=
 =?us-ascii?Q?4EeGhQLpQrLbIs8DK/VwYhc+xEFCD9ki+Ssy8Eq570a1wzS7VkXvzF5BzDsx?=
 =?us-ascii?Q?5CsJQ4diEMuKHEs4VVSJ8DrJsMnXbDihIiuV8E/sgOEDxzSAUiQLtmM2eetX?=
 =?us-ascii?Q?wZpeuyMPXxrpNpx4wk229K7Aa9Bhln9vIXv/j3mFCrdcaLKdvvWns6j6M0Px?=
 =?us-ascii?Q?Iojz5owEz1f+BvS25qZ3qLXOQCsc7HAoCWB6zWhwwtXxceXGzdL6rCB+E+uY?=
 =?us-ascii?Q?LVI/stexPQP9VSvtBIiiH8h1bT0rLsDzqwFBL4uNxrm8MyKxs1yjHEqJwes8?=
 =?us-ascii?Q?Gd4FuXPS4X4t43mwn3UxtYMPP6liUaxjkDK4WVDEMhJnuXqorQRkDFBT5kNj?=
 =?us-ascii?Q?7UQmoXCdfNTcwPyMNJctDQUGpqUSGC6qzOtyvU8HUbqLtNaBBe1GwLUlRLEo?=
 =?us-ascii?Q?OGaJ2AVvf+3I7S/myIC7gzhrlgxBKhC60TVccJnfcPLrKMuj+B7I072qAmLQ?=
 =?us-ascii?Q?688xIIh+Gs/wU1IHlw6xd+gzFlkor6cwsMuo5VMEzmaXfiMhiypQnpjhF5Wp?=
 =?us-ascii?Q?BodEglPXmoZ8+xTErHna5tJhMIFYM4nq6xMupA533FstjRC1Cr9FCN6D4zWh?=
 =?us-ascii?Q?bmWATjvvGJEFjlU0bEC5dX861SOuObb9NfR6s+sa2pOZD4x0HalOcKqSeM3K?=
 =?us-ascii?Q?OwCkL+PQL0zJF16YKeqAvK4Xd9/GHxpT0+/c9VQlXAHnifoIPRG8zzK8fq7T?=
 =?us-ascii?Q?qCVP6s9lyQbCta2sMJ3ipV+VR2g5uqs=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bfabc19b-829a-4583-8027-08de584cf139
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 17:54:22.2696
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XeBybOqRpmpd9PESTdgTjEssBX4BUbcwZ+5Y6QMWrwRfcOKaSYxdykfiLVeu9jF7tqkX7DTXYxKn2TFPtg41gtFjyMUDL/ZEtlUgEQ//JGY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6027
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: zAcrGN3caF1smueGEuC1EQ_leB8uKdJ9
X-Proofpoint-ORIG-GUID: bqKwdyOgPTxfyK4AiKyXkccuEvoHCRvq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0OSBTYWx0ZWRfXytIvlYz8+Epp
 Y1J+PdOuHdtNaI8dHw7J8bxtNN8l4dguNlfhmebFSLpCXrkSpEzxMhOWUajiwtQ9AxXksNKdK68
 +WNoyp1pGxJfhLvPJlDneoQFMkXT451xqkmzJhClE7Lo0ZcY3IcTtkXU+c0BPaMUhwNyNt8Wqfa
 LCdXThzZEBH531fRYKjJSdkcj4UKYCnGnou/uFcnqzxF7uAMA5sQ1aMwVJRZ4Yb3mnlQy9nq+44
 PM0dtkTjA2gIVJajJ5w1R+f+MFshBglYj+dGxdVtELBLBO5kV7HBm14qcit1yZpwFLG+ucimRV5
 L96dpvfwGuCD0orfDmb8K4W5qqqBG0k1pDrimdtsI68L6fDabDbUxMzUAjptyfwf7wqUMU0/uDW
 GWWpySSW6lFeztNLzkTyPiqOmmbG4YYZpP5/XslaUz8x4Oe2HsFFAa7KR4ylo3f3P5LBTXj/pm8
 wHoYIX+PtjVWl62ERBA==
X-Authority-Analysis: v=2.4 cv=DY4aa/tW c=1 sm=1 tr=0 ts=696fc151 cx=c_pps
 a=gkvpKNK0ht0eUS52gBn1PA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=1kRfWWIhwYc51yMvilMA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_05,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601200149
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 Jan 2026 17:54:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229755

From: Yoann Congal <yoann.congal@smile.fr>

Currently, a ccache enabled build fails with:
  |   HOSTRUSTC scripts/generate_rust_target
  |   HOSTCC  scripts/kallsyms
  |   HOSTCC  scripts/sorttable
  |   HOSTCC  scripts/asn1_compiler
  |   TOUCH   include/generated/gcc-plugins.h
  |   DESCEND objtool
  | error: multiple input filenames provided (first two filenames are gcc and
.../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)

when using ccache, value of "HOSTCC=cache gcc" when this value is passing
to rustc, It is thinking gcc is a input file. when ccache is not used "HOSTCC=gcc" is passed.

Disable ccache for kernel build if rust-kernel is enabled to workaround
this.

Signed-off-by: El Mehdi YOUNES <elmehdi.younes@smile.fr>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/classes-recipe/kernel-yocto.bbclass | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/classes-recipe/kernel-yocto.bbclass b/meta/classes-recipe/kernel-yocto.bbclass
index cd5daaf33b..bfdafbee8c 100644
--- a/meta/classes-recipe/kernel-yocto.bbclass
+++ b/meta/classes-recipe/kernel-yocto.bbclass
@@ -34,6 +34,11 @@ RUST_DEBUG_REMAP = "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '--re
 KRUSTFLAGS:append = " ${RUST_DEBUG_REMAP}"
 EXTRA_OEMAKE:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' KRUSTFLAGS="${KRUSTFLAGS}"', '',d)}"
 
+# TODO: rust-kernel enabled kernel fails to build with:
+#  | error: multiple input filenames provided (first two filenames are gcc and .../tmp/work-shared/qemux86-64/kernel-source/scripts/generate_rust_target.rs)
+# Disable ccache for kernel build if rust-kernel is enabled to workaround this.
+CCACHE_DISABLE ?= "${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', '1', '0', d)}"
+
 # returns local (absolute) path names for all valid patches in the
 # src_uri
 def find_patches(d,subdir):
-- 
2.49.0


