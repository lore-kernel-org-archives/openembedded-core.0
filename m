Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1EF2E9270B
	for <webhook@archiver.kernel.org>; Sat, 27 Dec 2025 11:34:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.6450.1766835240498321496
 for <openembedded-core@lists.openembedded.org>;
 Sat, 27 Dec 2025 03:34:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qAVTHldc;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=44567337af=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BRBUxrB3818817
	for <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:33:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=; b=
	qAVTHldcGIoqPC00t03u+GTthYXueLSL7Lx6Z0rRY7pALxa1KOem/D0b6vDgdfJG
	L7XHzzGq8MWxmL3Q4IIAbcn2ICn+eK1/GMUXCPo54xME3Kg8HeHtbHZe+9yDqfS6
	w/R/uW3kVJKKXgPQK/XuXxUhvn4u4r41vNuYeUuKpwNykP+p8vqQ4vwbNBBVHgxQ
	GTPTgQpKeSVv27xo+50/Vr0cqigQYNn4zBpPUPY6BCO7aei6yKdqe51/JbMDZaeZ
	IoGK/er2vKMkaiag4jkJ/AR7FMnQqmccY2FVRkYHeV1MOVHLklqcMIXg4cc1t7O1
	s/h38S5eK+G3KBq5NAlUvQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011015.outbound.protection.outlook.com [40.93.194.15])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba4nxr8mp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Sat, 27 Dec 2025 11:33:59 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GSkgea8rlpALpqUiFmey8NuUQTCUEm4aVugsXFwEtlOqrbze8QHGd1/fJO+ElB3V1pm1nxva7PKXrQfn9JBr6jv53Pr6SbHzjnqoGrUxBBiYAxn1+D+/0UXefLhr9xHfv00O+Pr2PtSPfPFgnS/81KDXMrU371JwCzyefTl3Cnqcd+04aXqWR0X6H6l93vGSt85JutBTp8NAWySgXPTjVlgX30n7Awtyw3ynYriP+nayBqZQKGW5jOuBIsDb8X/w3eS7trMIhvGqzBQlL+g4etW7lK9j+8Rofaenwb4BjwYtSwAOQKq4bBcWMw7M2HFNR9k1W7n9LrNaZ9xoQNRDlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pau3AsfzCCP9W3LcRcRR+Cz4e+XcKdZW9ZtOMIuC1dw=;
 b=qNURWmTIIFKPUx9l6fgheBFJpOiFMukN2YTpBAkp21ZyEbuqwNSE+Fz/nocGuWoWqA7sdX9ML7gcTQ5nBExAi3VgkJUsqIGl5ZELSOUTyEQ1MS59LFa4BIWIZVYup9gWhPzyZxJzFbB0Ja4JDyxh8aADCLd7yHD0jN6wgHfgqMZJoXo8NUtQIhFG+cw5+cs7ytP0u3QmGHoLqa2hL6qmx6Cq2QADwiss431vikXBdWfPvqju3pl2Vw/vVhCQM2llT5kroqruyh5cilOEpDIpjmJOigryuEtoVLcVwhBhMH7ZGU7QV1RtqNa+DX0cZ9pyGTifwd7+jMrSIvfzSAGlWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5658.namprd11.prod.outlook.com (2603:10b6:510:e2::23)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Sat, 27 Dec
 2025 11:33:57 +0000
Received: from PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0]) by PH0PR11MB5658.namprd11.prod.outlook.com
 ([fe80::f440:269f:9645:29c0%6]) with mapi id 15.20.9456.013; Sat, 27 Dec 2025
 11:33:57 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH 15/16] meta-skeleton: Add rust-out-of-tree-module recipe
Date: Sat, 27 Dec 2025 03:32:50 -0800
Message-ID: <20251227113251.773795-16-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
References: <20251227113251.773795-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0049.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::24) To PH0PR11MB5658.namprd11.prod.outlook.com
 (2603:10b6:510:e2::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR11MB5658:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: ae629854-7a91-4434-10a3-08de453bd2bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?3hcAXdbbfXa1WuEMgRJ5ABpFzRi1OMdnANkgoSqchjYA60FhFJADyxQMiMz7?=
 =?us-ascii?Q?pyY1MQNDZ3Po89k1hCC+vowgKtv9JrrlfdcNKPx2LS6SLZa9Rhq4ULWWhRXV?=
 =?us-ascii?Q?KzUyq1hIENXuT2xfhW17BdGp+vpe9eFm7LnfqaraKJo4uy4CMhLYMt4mi0PJ?=
 =?us-ascii?Q?+2XLHo90h3HitzoH8DKtXJEEstI7cgY8XKbCCJ0faikxBfWG8HA+qSzESG4f?=
 =?us-ascii?Q?YvN+YoOuyeHvvXzmMVLI7DlndU+inK5yUqf83tQM+YA+dcxQ54j5Yyw3adn3?=
 =?us-ascii?Q?m40TYr3e196Si1FL8FXYtgynN3NwtgIZDJ8OxwJ3dpabLV7hOpujU29YqFPM?=
 =?us-ascii?Q?v4srAUtsTMZZHj5vdumieqkBTJGl0xIWHHkKhViFoB/HbjZOkRZ/KeCHa7zP?=
 =?us-ascii?Q?HOi4DRqjjwsUgxu47IEsemfqjFZCBoqALamsG1u+1DUywaoVWnABiXe74nHO?=
 =?us-ascii?Q?EvnKBRMdz4st/4Jv0e455xrm7OKhzRybIvO3WSCeAT+3ARpEsZ5ymMFnJBTv?=
 =?us-ascii?Q?8ASGhjRU0ZWMNAE1WldFzEss4Q+uwcX8mLQqeAL28pZlblgZh5gaX6UQT2g8?=
 =?us-ascii?Q?vJ/lbA3UEJdYoV/Jo/MHp764tnwiiK/w1hPCr/dfwY+P+nzwGaEqO4kvckLQ?=
 =?us-ascii?Q?liijuAcY1bgLUarktG1Fn6GdeVyVeD35i5ypGtj8e7ZK/2LT7UlqKcvqXBwd?=
 =?us-ascii?Q?hUAgz4kud3zoDcnaz/GmDLjSm4ry1jn34+Rq9F+5M3RX8lxNXZKljb5aNOVc?=
 =?us-ascii?Q?ecb52YVbHXmMJv2uX3CycYsm/TDYDmJEdE9+HfiHVeyFsu0lxz0GvKlhwmh3?=
 =?us-ascii?Q?sLPbuv8PBUR/QVIEH4852vDEC1vweeMRpvckkw/87QWwN2ZVHsjuUm2j0n8M?=
 =?us-ascii?Q?YoODcDsmOtdPw9W+32i2oFhwAjjdW/UWh6s6eCmeZINuRs6UVJrF3rxLpuHV?=
 =?us-ascii?Q?a32lnZjfQUmd9hM3aQNvXve/yHeEB5zEEDoZXKOTLJDDiNPZIRCOrRhnjA46?=
 =?us-ascii?Q?CIj0mL1SYk98BAB4/DHTqEQcYhudCScyNQv9OdYZy7IlAtUkA3MuNuk6qT+M?=
 =?us-ascii?Q?zVDZZl0VShW00BQ2nKJisiVm5GGpYMycQ2jnJ66ViDcrwWWoTlAfntmB/Yl5?=
 =?us-ascii?Q?d22FA5ccyuUal+aXhy9LLKb4FfALEYq7vmpbD1FrQsjxIGyfmsjGJmQhcbe5?=
 =?us-ascii?Q?cmjWZALb/DFNs0rrC2o8Hk0H/2D/Kdh+Dw8DQJiGfp9fy98XWEaox3hyNDw5?=
 =?us-ascii?Q?xWJ7Q5JpsI4DhfcW5l7aExR4dB8DOycxh1clF7jaj4NOpGDq3UvwsnA+qHpy?=
 =?us-ascii?Q?RvTdWPtl3c9DdHcUNL8FDC6tdKsdRKyB+Nt5+jxJbMPfWxTcNtiHffL5BOdq?=
 =?us-ascii?Q?BkUcek0osB26nixJJqramjqfQWHEuxhA7UAIHV8AAgscIC7p5wv4Lfsk1z3a?=
 =?us-ascii?Q?62sQBjsBikYhgxqbcIG/huAXp63ahIWtzMChEXl7CPSdZuzjjD+nO6iqPgf0?=
 =?us-ascii?Q?QubPGgojwaS0sG5Cm687uwTNKbHvQ8EToVgc?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB5658.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?FIYKrxbsVIEGmbtFkRN6DzJ5AJTgZ69sLVGLFgs6Kt1YnJuRzr6NLAlMVa/V?=
 =?us-ascii?Q?4pAQ7Cro3gvrSvLpwnenS26QAWjDjLqsf03UlNPRM5z3iQ1HoRb41JpUhKEt?=
 =?us-ascii?Q?46+MJuhI8i8ETdcmzfUDdrnVT+8XmheUyS7ZZgByWM8J6ic6cu+CouhH+UGZ?=
 =?us-ascii?Q?5y01MooykHoGByQi9MrQ5+IX4hi2wDHkd63Omlmdtwd5ZJhJAQvoa+qMUQsB?=
 =?us-ascii?Q?8Zz8QLcZKg+GAhMVY9bPnfEmX6RXJI9dR/GlH0gjqvVCR/jSVom52tT98VsH?=
 =?us-ascii?Q?NiaszahED6eRvTTmDlCt3MoeGTbi4vmbFXTwh4WfrR06RBn5udrQhTNaJO/C?=
 =?us-ascii?Q?ctjRzOPwyGCJeNMmdsGuNwbvMLnZbGpSnzgjbXUEzRiPAD3GALrLnYT800K+?=
 =?us-ascii?Q?xTqVMj/PLp1D8wGeQAO9ua9rkWffc4hlJhAVYVPiqNJVnYrosVVgNyglDEze?=
 =?us-ascii?Q?ZZ+uiantiDFKZbkemzHQrsTZ+TTyPegNEiofgo+sQanSekaL/GXiUIxUyCx3?=
 =?us-ascii?Q?uIrAaw1Q9UYNRowFgV0rEpg7J9roLBESezVm/zPKvz1wRnbDEU3vSknNebrA?=
 =?us-ascii?Q?WzB3fvwPRCUeaZOQdjPyDO6jwyby2pVl+3F+JyxHZYdSaDPaA3FTJGwgw88E?=
 =?us-ascii?Q?j5GQXGZyrCKJFFkI+Pgy7eFK75E+yyzfsZwCeejIndrHjphIBuX0xWfpd5vo?=
 =?us-ascii?Q?cJVSdaJSfN9sGbBOjAcHWxLdkms+UuCa5P6j2jq2TezoEeAxRIMqPj2Yszaq?=
 =?us-ascii?Q?1thC8U74w3NSpaTrkvboowfy0VUv5Vp/KhI6ggqGmIDXjPS+KpnG/VjWiXG0?=
 =?us-ascii?Q?//74K1L4EGCeoEbGU958sikB+aC4h1TAhprcLjqMyf2Mosmg0odTPVMOF6qA?=
 =?us-ascii?Q?+HQLpeZVfLElvr6L9SKiOzuNttWEqM9XaVnUPRXInmV3W1V3BPMGCl/0pV5F?=
 =?us-ascii?Q?hODYuDpD+8tfY7hspIfMW/Ab7ZrpXl2QW+G5fk42wrprmXZDGOS4hObmDVzz?=
 =?us-ascii?Q?BN4Jv36BccQMHJCDtxVZGQIITq1kRditwFZpe+aULW2Hoo/mUEqQJwXRloa2?=
 =?us-ascii?Q?hbQavjIFSuHAL6USX9ZdNxv3GE6DUIjh0GfO0bRLqHsvToQ92Qosh7e66IaL?=
 =?us-ascii?Q?MkxVKDyIP0dUY/xobhhD8x8EElWr3s1A2anAvtEsZb/a21TyeuBMnvJREbXK?=
 =?us-ascii?Q?aO4dR7hY3+OaaeSAW8WDXWtPNXO+ghi0zeySzr03XoSQUtAb6WDvbaijhKE0?=
 =?us-ascii?Q?GGpiHyWJzktzdBw4nPOANisomq7SMdxBFNN+xCTZvoV6GgEXbhoeGcvde/2m?=
 =?us-ascii?Q?4dbJwy9KPLQKHJey32D82UrgMIwUu9oS2X+HroTaDnhGSKBevKAodm4zzTXZ?=
 =?us-ascii?Q?/+m4QRiMXRRQRiPwG1jPVLBaR/Xs7YZU+27jMyjxgXyeWBZyNoQMfR/xEFrl?=
 =?us-ascii?Q?hd6y2EElCQztw3jjLY/Sv+hF+7E7TMnBpMX3LHdksuaFzLASnvpdNnoZT9pD?=
 =?us-ascii?Q?AMWBdI7qidhUVwqqE14Z/JYnb88iFA4o0nbEF4ONGkzNKYFVMoZBMbId1x3g?=
 =?us-ascii?Q?iEnlNPfyAxnCX/w+SjQc186qoD9qEUZJy9RXhxu5vgQA0Y6KjcrTk7PF2t9h?=
 =?us-ascii?Q?YgjgBprogtEdN63u1js8VXsggO4B61zyMRHJEea47wCevq3i3QR215jXBZSC?=
 =?us-ascii?Q?nHVt9gse8L7GawGwBA7IrNZ7Bq8gfuySlYXGMrWCLh8PD8n0mRVM1hyB9k/i?=
 =?us-ascii?Q?ukJtEbs9l82TkUy04zysSEZ9yGeRlhM=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae629854-7a91-4434-10a3-08de453bd2bd
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5658.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2025 11:33:57.5085
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aKJm0Gbc0H+SFx2FrHzd18Ze1VVshPcVWjobnvPdb0fs4L+GGdUQwQoXmlA7g63cjqm2BXUSPMWFNXQE4P8sH70/CcwWDLhlR5lSJ9vM+Do=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI3MDEwNyBTYWx0ZWRfX21ykler82pQW
 eP2jAjQ4AgBaFBL1v6VYEMItfu+wKXyxS/K8GO3rCgl66zTMErqCtjjHZ9lEnCv4p7MFrVXnqYG
 fjNbMNC1SlEXOAzzfuUNhbn47Zz7EhJ0T9cVHElW6B8h1EInM4G2vFjQlLLvjT2k1NHYBpvRYnv
 8kAyy+EXBzajeUig0rPNXY63XJNUjhjtL+gusQP0k/NakZgbm+wSCVwAFXpQ0imiDCTOtrxeSsE
 VePWY4w3Q/ZUqJ5NbLc9O2OX9lEJlth6W9NcpKevJQD88uXmD2fq+PfvT6Sq/M52J8QWlaiNRKT
 Tz3nWaLbpBYtDFy6NE0W6Df2ajgeL9z3wKUJO5/sJc2pdAEGyu1ie33Hob3cpogZOWtLG9k9Rgp
 2kVD+eBFVnOsH2RbiXnlWuiv+Q2vRrfkw/LY5pl+6ALoatMoSPnjyIO04YE+AHoR5NT44QgaZ2M
 rCr9HbSewyddei5VCIw==
X-Proofpoint-GUID: NwXlmlHYSTe3foLJlv4174e7uNeixohq
X-Authority-Analysis: v=2.4 cv=OO0qHCaB c=1 sm=1 tr=0 ts=694fc427 cx=c_pps
 a=awRqKgK+okXhs1gjjWqUCg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=dFuh8EWA25_V8OYOZC0A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: uXIz_DvIYDaIaQntgCjXhk7NyuMBbjQm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-27_03,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512270107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 27 Dec 2025 11:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228569

From: Yoann Congal <yoann.congal@smile.fr>

Basic template for an out-of-tree Linux kernel module written in Rust.

Mainly to test Rust integration into the kernel.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 .../rust-out-of-tree-module_git.bb             | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb

diff --git a/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
new file mode 100644
index 0000000000..642fa80319
--- /dev/null
+++ b/meta-skeleton/recipes-kernel/rust-out-of-tree-module/rust-out-of-tree-module_git.bb
@@ -0,0 +1,18 @@
+SUMMARY = "Basic template for an out-of-tree Linux kernel module written in Rust"
+HOMEPAGE = "https://github.com/Rust-for-Linux/rust-out-of-tree-module"
+
+LICENSE = "GPL-2.0-only"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+
+inherit module features_check
+REQUIRED_DISTRO_FEATURES = "rust-kernel"
+
+SRC_URI = "git://github.com/Rust-for-Linux/rust-out-of-tree-module.git;protocol=https;branch=main"
+SRCREV = "00b5a8ee2bf53532d115004d7636b61a54f49802" 
+UPSTREAM_CHECK_COMMITS = "1"
+
+EXTRA_OEMAKE += "KDIR=${STAGING_KERNEL_DIR}"
+
+# The inherit of module.bbclass will automatically name module packages with
+# "kernel-module-" prefix as required by the oe-core build environment.
+RPROVIDES:${PN} += "kernel-module-rust-out-of-tree"
-- 
2.49.0


