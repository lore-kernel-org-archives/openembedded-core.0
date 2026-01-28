Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 656D6D3566F
	for <webhook@archiver.kernel.org>; Wed, 28 Jan 2026 03:19:39 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5326.1769570370049189611
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 19:19:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=cWAhagCv;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54881801b1=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S1LZQQ3967458
	for <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=uXEX8f+VH
	/pLwL8aEdpc0mcbVBN9Wv2A98YFHRPv5+Y=; b=cWAhagCvIBVM9gIGoO0933mM3
	P6R79kCW3GsH7eaa7yS1FNPeyrEoBXH/Nx0biNrSUEqYdAjebFq4LNprkHxBR+/C
	ys7xxO2HpVqfqbp4JkylH16Yba/H/B+PatSw3VDEMT9pzgIFLG3/EThPICX92/Do
	1CY/lTcVML0IjJdlwFdOo95c12103sRlwMbVHP8ZylHFaXVYEI3yRCP6reNTuPhx
	XmNpFwb9UD6Lzose3/L6LlbcjrkzXIH4Al7J1+fJjO5i9AEskGVJYOGCatg9QJwr
	+n8M3dF7LgZRH1jLpz9gWxizTnpG9Tx5PwMQEr+iYJaoxIsx41AOaggqQ/I8g==
Received: from bl2pr02cu003.outbound.protection.outlook.com (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvn28cc10-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 28 Jan 2026 03:19:28 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w8U454Mf3s0itpHpN82B5oh0HLLohOu+KQ3fi6XyB9HoErcRJ5Kami//BKts925qkl7SKe5wFpXzuJQzhDJQTAKPhMMvHJSXnz0uh0l1aOGS4Ris0xpfgWRna8RUI7tDZzMsUAiR02hY9Ne0kx5bFHCzoyzTXqUO+0J8RScqlqmiaTetYEdBhsOR5qH3+zi5a2kCY8G1EQfr/2X0KUHlINk1Bj/gUZirDdUBB6PrqxK5JadFpTvmSP2A/8DA0Z0VQfsNH4FhShd7Z7oOpZEw64go94ta1triRbHetaXYnR5pVQSCRufjX3/oaBcrl/8rdku304gvEEnMXltA27eFqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uXEX8f+VH/pLwL8aEdpc0mcbVBN9Wv2A98YFHRPv5+Y=;
 b=baNWnrZ4Zvjjk7EVMqi/rJ4Rmvcqxm5NFFA2amOcyOrxc3b7VBS6qD3r+quOJjGREH0Rs3COTRiT2aHhz9Sg16QXuIhXjhi0/eux3NLlgW8dd7o7ap6cRvHchtUSMHsdAYeQaskzOIzTx1jlymcljTkdXTAExuLGFYSLP+Yxf6U9LViW5vBwB1oUEmW1NcYXwk2EKkHvXu6DxHl4a5cwkVeJhnj8AyEVM/XaMFOtEh0mbW9+3bw2tP5ZfUioIOqICBHFhmmpHgdQF6hbMBNq0JFMOHIhX40dUFdps60SIJL8PJ3dESFNH4eMgJVW3xOaIFma2Pn89EpOqVTDfFND/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 CH3PR11MB8751.namprd11.prod.outlook.com (2603:10b6:610:1c1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Wed, 28 Jan
 2026 03:19:26 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Wed, 28 Jan 2026
 03:19:26 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 1/2 v5] blueprint-compiler: add recipe
Date: Wed, 28 Jan 2026 11:19:11 +0800
Message-Id: <20260128031912.227891-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCP286CA0154.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:383::19) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|CH3PR11MB8751:EE_
X-MS-Office365-Filtering-Correlation-Id: 56264b0a-6726-49b2-c2b0-08de5e1c0a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?JlVo/crC/tSMawB802K2fAE7tj2Cuu097MMZXjVTjyf5FyeScXm4fmXiHrMJ?=
 =?us-ascii?Q?TEYuRm1o4RMvVyD8KMCvyzYsorkhRxqUTwVCkHOyZihTXN7faojOnmxq+e5Y?=
 =?us-ascii?Q?V7ar0rjrNK/rbA+z9IGtJAke5Mm+V4EuXZnfN/djet9dhb9/Wwk5ab7y0Ocx?=
 =?us-ascii?Q?tzh8/nl8h1eKjSaHsxchgQaJn9UGDFPKFQX9vi4jgm2PLZtBtgIZf12HRBM6?=
 =?us-ascii?Q?wlhFJ/DLVvAChBL6DERWKXmjUk2RlMpN8zeTl3owde5Fg0B/UAUAjFGm7rcs?=
 =?us-ascii?Q?7yO0ZVnXrVDUos4mRc43ym7fvGS5crSjKCoFbQ9SS1pSlaTtToOQz8p37IyF?=
 =?us-ascii?Q?PLMsyuCFWCMPhOa1VwUdVFX6chS8UMbHBQSwi+C+ZalNMJIv9ZcdC9BKMsVj?=
 =?us-ascii?Q?pMykd97ibyvvN5gGZdvTybN3dsW1pM34er0ORGSFYuQgB1YKl3rOtRro5xuD?=
 =?us-ascii?Q?Y3A4EzXsIFBR5wYMQe7B4OKE46fd3VfoNfsDqe0jY4yCv5xL+7vRdrI38Tzr?=
 =?us-ascii?Q?TfR6/VBxxpsU0LFtGWNQ44NCaSMlQfw2C6/vbCdt3hYtzdZk/JXw7l+NOIeK?=
 =?us-ascii?Q?V4rBNqRvaARJaJeMNxAfY5UNDy+qXoiZcQJXypJSedaa/pkaOAdDW9oQ6pMh?=
 =?us-ascii?Q?lp/qB0Sf/NKWBA5Nz15jJY8UdTaN7UoHJDnvZtEwb3yVBNTe7dWbOMyTkd/U?=
 =?us-ascii?Q?cS0ibUB8qBr6K9SztMGZedUHRtMu8Wyt91s38aGJmqSlUZNWQVQ7gSfbJU/S?=
 =?us-ascii?Q?pnxT7ZzmznBkqhYwp8iEiYtARrqVw50vsPQNunPc0qZttpyVLSuTsoqp5/bl?=
 =?us-ascii?Q?4wcb/RgjpURrDNcm9hcZ61pjnOh+aIdKEDFCjsE3xboMI09RRA5YP/QWalNh?=
 =?us-ascii?Q?gWuhHymT+Ci5CyPa4/jeRXkAlRx0QhhmsHjXI3lpqV5WwPyXceSOAnCQX0/q?=
 =?us-ascii?Q?pkc46jVCbdTke9KGovHXYuSimLfTY/S9kGqIDVSsS2DB0h2gteXsLaIdGcvK?=
 =?us-ascii?Q?YOCVmPZgUs65P0ogK2W/zYHQmlMigtPdd8wc7B1VpVDxrTh8uS4CQhtgdfMu?=
 =?us-ascii?Q?ZxJZKbEzpMuZZUWWiKe+LYPCHAxZm+7zKfcKD1EBbVAlD1S7sLbiXGaRgw3R?=
 =?us-ascii?Q?4KlEzuqhILfJ7PmHw3t1WOMDn+Ad1pISZQQNaon7Dcpebr9lzIySr8e7cYTq?=
 =?us-ascii?Q?+eKrPhIwKlohN/TaMA3FcJ05n0eWaART03KdDsUTYBLgrhZrmPbiGpSS+IPP?=
 =?us-ascii?Q?ZKrPjhMo4ViOcNmYoaFp9bL8RyUWpPSAE9w+aJLO/eVN+eutse8hXx4WorQd?=
 =?us-ascii?Q?J5G4Wfr2Gntvha/l2UsnjI83P/wYS6kcDCfHV6aHm5IbRqwmalkKcLhZ4n26?=
 =?us-ascii?Q?nVAUL41kOlXFcH1X3FPzzjRciulzFO6tTfKNAlrAbyh7Xe07nAkpl+wMqN15?=
 =?us-ascii?Q?NeQ/lyPaSeCkjKT2B21PjfjGZ0QOK4H0YwU4nvuvzK+NMMEVmapswpvO2uuQ?=
 =?us-ascii?Q?icHf9h6Ppk0vay7hg5s7kcVrL200lS+89ngPitAP+N8Lkm+tcf/KaR7eSBDK?=
 =?us-ascii?Q?WKDsYcUmp9PQzU0PXekh5zxtCY37Try5ccekp9SYWEdnl8fNvTW1BWPEjK17?=
 =?us-ascii?Q?7B3LXDKjzhUIsa4ICFzo++0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?WGIgCI4/8gfwJyqejoVDleimxtLHl7MJe82j06U+uQjThBH+YONUAyUojfxJ?=
 =?us-ascii?Q?s4f2slBfACSLlfX7ZYAnUkjPKVzXC3yaqOLjT8B4Wve17M5UYXX0KkPBf4zo?=
 =?us-ascii?Q?YIjKVNloKGYH6AuJmQE5vc1+pr15OmsmzWsmAbAamzEF1ZFdguj7+9baZTMm?=
 =?us-ascii?Q?FvUkE/BZzxF2MpVebkeAYhivqGyNnwMdRnZvLPsGjSgLJllwfZ4fyGnwSlcD?=
 =?us-ascii?Q?KDaUcYzOc0jZZgxM1/NzRov3Rm2vzPUBsbXmwzkfJGyAgSMAJLpoOJBcmzfi?=
 =?us-ascii?Q?1ihwzKsbxVka5zaX/4gz2Xih5AoWPUTm8K4hHnWGy5E2GWwcHheefW+LKigh?=
 =?us-ascii?Q?JsfOn9kc84Rxti3wrkQztSlfePFNs/ZITMXJIT9wPbp0FGpLIog3MzWGuGzY?=
 =?us-ascii?Q?P+c+qDrjZBotCADZSK+wtiVNHJNMyLgM7+xL7tw0uDrmjiEtPfFa0C2/B1N8?=
 =?us-ascii?Q?f/5ToxcLPvJuOXnwhqpZUK01C6Ck4E2KCu3QTDEkniI32Y5i9HtBG7JGf3nt?=
 =?us-ascii?Q?4fd9HHoseMULgY90rg/V7Zb1QBZ9BR7JQA4Bn/UA47iHvYW1ZHJJfS/J1UpT?=
 =?us-ascii?Q?kGpbKXLX3trmZNRSNFXjaPSexuurrXKyOqlHmyFx9qp0MLG666UiOW8NlEdF?=
 =?us-ascii?Q?3rzv+GXQtmvzA8fB91TnZX87+EVLMCMNi4GZp402fBrq1DvqQbGE7ZnAhXqG?=
 =?us-ascii?Q?f64fPKcNlZB0grb8ZFt73dK0Cq5h2pYi6X1beyvqcGEI35iytlwtIOUYmNqw?=
 =?us-ascii?Q?t59vv/C80+hgRTGqeWbLeDeUfbbODB6bv/fWR1RHqKC4c/fEHO/d2g1OnxZZ?=
 =?us-ascii?Q?SqnRIsXnc9VUYvNX9yBi1hNL10EzuRrMbPPdRbSdQAZDtZQqKbmWtGbGH0yB?=
 =?us-ascii?Q?aoqQAx2o6o0qrP+kWKE5gFP1W24UADMnoQbZk3tVhaCWoWVwgt0YB+GEvNZ8?=
 =?us-ascii?Q?aACGs+gZ0NhBDZ43gIKRKqSrvJNTbCYA+JQc7V/nKjFxH0wEVBvIRWezfuXr?=
 =?us-ascii?Q?FuA9KaMi1miO+y+jaAvi+L4EYWZW9CH/hT+y7T+GkzIaBfRXz9gKMapDQ8ko?=
 =?us-ascii?Q?dA8QC7mVpdu5E9D4dPqYRk9J3LvVcgGqVmI1MtBbXfalzpfmYVQa2hm8yixZ?=
 =?us-ascii?Q?O3Jq8N2JrAhBgiaNFJXokULEND6COclk8wpaH4bbLAdgS6jceCOKCOZ7Z9dN?=
 =?us-ascii?Q?hAX5e+GezRV0Ic39VOOjkE2MXNrwZ3C3f0XI7eu/08tq4WYL3mr80hq9fpOW?=
 =?us-ascii?Q?O3iOBvegSDARYw+xjopDLtVyp36bx1cvUFpZg/j+jJLu9Pn4Z0ueRTUgY0+b?=
 =?us-ascii?Q?2XBs5nwhxDo+KOnyVoeuSCJmYksUyjs0grz1B6KdC10F3Nfchdy40qSn9STQ?=
 =?us-ascii?Q?iVV5GB2pkx4PS4v8aKRr8lrlia+i5pFDv6wynsFVGPvZM5LgveZlhGfemH0N?=
 =?us-ascii?Q?ASy8mmOviOsFq2RTsomi4KsB+iXo1W2dqlsEpJI7kFJH7pq6PkqfdCSbm6k8?=
 =?us-ascii?Q?24/b65Jga32StjvhpG8aYwbEwHvKjVrDtKCBIjEkgAEzVXSHuA3bHVfXn4EU?=
 =?us-ascii?Q?2j0dp5YscBL+2xqi2ZfEMjmwHvSLDr8bxlG7+a3RlgV2y4TYAV47b1u7E6qA?=
 =?us-ascii?Q?RSxnsaqkfC33DCOuVd/Gu3LEfy23zDBWFicQq3odyfPD2JJIVnljEOBNGv8s?=
 =?us-ascii?Q?ilK8BDhwxBr78c6dqLvf7NaAg4etPaM8KK7i/jl95NtJCnqZuGcxhGoE9NOa?=
 =?us-ascii?Q?YiU8lkwZWQ=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56264b0a-6726-49b2-c2b0-08de5e1c0a5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2026 03:19:26.1217
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUrSVAfB3KaXRudC5UiALPvnH9mOdB+Rqqw3n6jKgD/o2PFXYNkfpz87rPYBZb8BVTaCrAf1ALgg9fS8Cxv4Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8751
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDAyMyBTYWx0ZWRfX6xWZSiNJlu68
 Z/5a6EoRKSTptHv0fG2G4pBNQ+OCKJycMk7ZCFP5+b9c73z6HQW+xKCvcoTvEQaRknrZ96gD7iM
 oU4jYFgx9ogCEuYlcT620F7zZVHcPiQ8UjpXaS9H1rGpd+vB0q0PKyvbwwT79s3ARpzJ+W0xueG
 Bi3VcCt/eaRIsuxJ7O+47voNiMACItYCu2H74uBmueeaTaqhEVQcpeDcfebyWOGD+8NORwPMoaF
 C4w5dawWZ0ThAL85m0Za6IWaLDeTSLKRF+6WZo9rcuIkOr+2TvNEy0zrMWe3ryj2/08XX8n1bkS
 5TiAKDWfeGlg2BPPwiGM5g9gBrDLC+t28rniqSfX+R1kTkVmboHFeMirc+sO8MzWm1TBIIwrxzn
 crtPRzD4xzuXTEu7Dk7CnXbAAedPzMubJRe5JSdGzfOHiZKVXGaB/IT9lGwrHuo6t/6d0rPemYn
 sBoz19GONNzVWYXGkYg==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69798040 cx=c_pps
 a=AyKazF/bLMNy1/nXoCkdcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=2X12lZP5CFuO6KqQosoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: oQOV_kGsixKeLRF2mOOWRDvzx6hJhqpg
X-Proofpoint-GUID: eGNl8kSuDeZKVAOS4Fcd8-lOKmCwkk9t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_05,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280023
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jan 2026 03:19:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230073

Blueprint-compiler is a markup language and compiler for GTK 4 user
interfaces.

Move it from meta-openembedded to openembedded-core as it is required by
epiphany 49.2.

The original author Liu Yiding, is willing to continue maintaining the
recipe. Add him as maintainer for this.

CC: Liu Yiding <liuyd.fnst@fujitsu.com>
Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
v2 changes: Add tag=${PV} in SRC_URI
v3 changes: Fix python site path when enable multilib
v4 changes: Fix python site path according to Alex's suggestion
v5 changes: update to 0.19.0

 meta/conf/distro/include/maintainers.inc         |  1 +
 .../blueprint-compiler_0.19.0.bb                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index e830648945..b231daf485 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -71,6 +71,7 @@ RECIPE_MAINTAINER:pn-binutils-testsuite = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-binutils-crosssdk-${SDK_SYS} = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-bison = "Chen Qi <Qi.Chen@windriver.com>"
 RECIPE_MAINTAINER:pn-blktrace = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-blueprint-compiler = "Liu Yiding <liuyd.fnst@fujitsu.com>"
 RECIPE_MAINTAINER:pn-bluez5 = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-bmaptool = "Trevor Woerner <twoerner@gmail.com>"
 RECIPE_MAINTAINER:pn-boost = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
new file mode 100644
index 0000000000..6e2ebd741d
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.19.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=${PV}"
+SRCREV = "de8e15f7791bd6243279cef1efc27edf4cb93674"
+
+inherit meson pkgconfig python3targetconfig
+
+PACKAGES += "${PN}-python"
+
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python = "python3-pygobject"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


