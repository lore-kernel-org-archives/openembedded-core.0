Return-Path: <Kris.Gavvala@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC676CC6B2D
	for <webhook@archiver.kernel.org>; Wed, 14 Oct 2026 23:16:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.27625.1792019759575598899
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Oct 2026 16:16:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=LlOWwdeg;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=474780c42a=kris.gavvala@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69ELrWDi1065392
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=1TlGEQ8zi
	fSQ23StrYFalWiAkobGhTUraV0CatpHyno=; b=LlOWwdegQdTJk8D3h8C9QiXf+
	MCshGwO7fM/dFmq10kwmL55UD/btGZ6yqaJLUe69MSKmAOoufbosg95LYHyGKVkc
	vWcQbotcSO2UVNzFJu+a0kC+mRbyzq8KOG3jUjbDlQ14061xN5pNXFymd2YfUHPG
	hv55uZd+RbCBIANELLn3WVOffOon1Ce5IjB0/k6pap7NhBjooPjP6j3ropKtiAfG
	YM87bMTVJFTqCh8LuG/lMPXYGYwziIOhxGRWbd6/OsCwc3mlaGfgX9Z5+tYeWsnf
	hMmQ4O32w483Bt6zSYQ99WFJ5Bzb8zgIqq27YPJLah1tkKFwi/5ZOS9Z/ibPw==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11020098.outbound.protection.outlook.com [40.93.198.98])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4hab52rvau-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:15:58 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kyd72AgCnd22tx9jSqBTHPRObF3L0taMmSom/fdbU5jruwybndbCucnbUg7CGWXJCAWVgFo5y8E3LPardxRmDEatmJemHoGR1s3l6q80odNzQPifyP1rvztmR0kRv8quOSz9/U+JFuebCyTUrWvdHJ7uWp8jH+4aQxJUKWV4+q7CT4AS039qa/VL1J0eiODxLF3DwV0zT0CDoiM/m9WWFt0rOJqoNXsE8wt2LYzOX/Zb6sBk2AVwoDeJCtAtKtH+R6xM32U03dowYgHUTW5dgOnyTuv7TxKlhxsqnkuIBRwuII2Q8MHumrO+9hKYR6K4JO7qU5Gjra+5iNDFKeDrnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1TlGEQ8zifSQ23StrYFalWiAkobGhTUraV0CatpHyno=;
 b=k2E0axXybm1tKwowWACK1yWf67KGU3dnNtiPAscUMN61yNBQCsG6Xv/YSIxQiLwaX0IKVP/yW0Q/IQkb4tIcpC76udBfT30w74cR5hl+FrSP6E4vjug5Nswuh7R3ACy3xy2qL3D1Wf67ZUDeK0nwAV99UITDe6Ra6Qn9Y6pQyidJsgnWvDfyDGZKUb20e0tY9rq2m6lOZKQPnm02bxtP6xJBLgfMXI5/PzVnocarV5BEHcfcF6EHCKKPklVUMZqXf3CYIXwyfeKE+vnHb4HBcPSg1CwtZXDdQvKThXKX4IhjOGNLidWpiT9OrmY0fw6D94BqYNQKm07kctoF8tqFIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=windriver.com;
Received: from DS7PR11MB7783.namprd11.prod.outlook.com (2603:10b6:8:e1::17) by
 CY8PR11MB7685.namprd11.prod.outlook.com (2603:10b6:930:73::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.12; Wed, 14 Oct 2026 23:15:55 +0000
Received: from DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1]) by DS7PR11MB7783.namprd11.prod.outlook.com
 ([fe80::aa04:56da:f40e:96a1%3]) with mapi id 15.21.0522.012; Wed, 14 Oct 2026
 23:15:55 +0000
From: Kris Gavvala <kris.gavvala@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: kris.gavvala@windriver.com
Subject: [OE-core][wrynose][PATCH 1/2] nasm: fix CVE-2026-6067
Date: Wed, 14 Oct 2026 18:15:36 -0500
Message-ID: <20261014231537.1030409-1-kris.gavvala@windriver.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH7P220CA0085.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32c::26) To DS7PR11MB7783.namprd11.prod.outlook.com
 (2603:10b6:8:e1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR11MB7783:EE_|CY8PR11MB7685:EE_
X-MS-Office365-Filtering-Correlation-Id: 518c97bb-f4e1-4ac1-3939-08df2a49190e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|52116014|1800799024|23010399003|6133799003|10067099003|18002099003|260925021911599003|260925022911599003|12006099003|3023799007|13003099007|260925021311599003|261009223027099003|11063799006|56012099006|261009221227099003|38350700014;
X-Microsoft-Antispam-Message-Info: 
	a3ROC0ENZil0xQ5TwVlDt31cldB28G3XRTAoi42r4H97R3EtUxyXzvG1r/Dq35wmUiKqWsh1PLnTvRhf5cn3N2tWM6Kse/mU1e3nNxYecgNQAH35K2m6gnGJ2xaIeXhTqqbqfMV20CrRI6bPfDEhtdjZUko8GmcVq/osm4b2OZusfryj56qIp8B6l8giuYz7ALaxUbfUBXztw6p331mtEl8ktN+lPH4srW9md9IYAyW3cM+xslu8EZWnZh52MlvwGnQBLImQSl2g2th9TNOz+40M7gE8ramhigMhebTiYdsl8enVhr5IyPLGsv3K73JydRez/8vrnijgPOrOKlB5BbMQmHho65P74NIYffoW01/y+uJq7oQGNdwHr43IMkr5QNp4tI9QYYwSJlYkAuyy0NfULQ33XC3a2XmT73yHpvjylYUxCN8jZKTgw+STCja5LAEQmPGGKbdn/xuK8y6zxIpMTJNvD1WvYBS+tHV90yRySm1Ro1u7qFkVeHMDh8PcclZXqK5qVjmDxBLaqLiJkyFxoHQ5HssAfMO9JpMaUgjZYtbrVHiV8TuFeVmWN+2cbp0SvZPf74nTUtlxli8+52br6rPwxYLkeoWzFegckFX3vNdsR+Z12R3v3ysJPFaCcs0Arit3Rdp7+rjPcOflULgMnCN9WfbB26FXkawBmpY=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR11MB7783.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(52116014)(1800799024)(23010399003)(6133799003)(10067099003)(18002099003)(260925021911599003)(260925022911599003)(12006099003)(3023799007)(13003099007)(260925021311599003)(261009223027099003)(11063799006)(56012099006)(261009221227099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?V5MrFaYI/1Z6mWGgtgdyWiFLx76hjAF3mJgWNKGtCg13xiX3YyUAZnI6ddjq?=
 =?us-ascii?Q?u4BkBBtIlN2VrSaQz8QI0lIIA1Hm36lxu0IkWlTxCXw+KlJRgbdu3rpPTmC3?=
 =?us-ascii?Q?E/CFE7xTee17UjUkQaU1cxVXOo0XWCaGb6Nnst9TLbAMplGdi6VxBvmYLCvs?=
 =?us-ascii?Q?xUYsDVzaaOh9ADI6eJkwoqPCej/iCTHG7P08JHB8lAvx70hBriNeQacAQzAN?=
 =?us-ascii?Q?kDBbGHI2XD9jgztzac5czVzYGERDnVIDaMCTCi9Au8fq/ebdu9TexnxY3OrW?=
 =?us-ascii?Q?ZUm2TpBUJHoCIOvwx1IGE3mK2G/sDB5bQ5W6o1AIkRJ7C+ctwlgySh9t9SeS?=
 =?us-ascii?Q?MYEiUQPmP1M8HjIzgxy+l1ucyU1faL7ehbwqm/PXaiYSqo4Mevc7entAiJJy?=
 =?us-ascii?Q?gYgwvObqarrqAqPAFqT2Fs98PvH0IQyYuMiOb++8TpB+v3YH2aZmhFSZ7nyr?=
 =?us-ascii?Q?T2tM3NgOGTWGv/Gt2uQmJApyUAcrKb+9tKt2JjJLcvECrx4ZjS2SxN0bbgOR?=
 =?us-ascii?Q?rRE6FJ6ny/fvRIHXbRkZRInzMlbqDBVL+aSAbVtz4K7dRp15xmXWLaFgCSb0?=
 =?us-ascii?Q?7TUk58mNkfYlfh5fSH37O0NOvJe6wgAB5Glhh3G9jusX2dWlqs+PHNYBo46Q?=
 =?us-ascii?Q?f4raFNNflmt5KZJc/nnpA8+U6XpTc1N4GLQOQ0wBu1gcvfcBw5J+Yu/jx0ZA?=
 =?us-ascii?Q?1PwoDfSdFib0IyFjd0RGRfd5L5prTaEXZILm8hM/DzSiiARUL7/sUNRNiHCa?=
 =?us-ascii?Q?XH67zcoqPmhTuS/V3GKx3CwPjH0ELBLGVxxwPnGyIDSwDEcEawE1Sd2ieVM/?=
 =?us-ascii?Q?VcjbBduz34btFIS+yFFsu6aI5sG6ebqPFgymFhcR+MlWObS3FMJTkisMBp2L?=
 =?us-ascii?Q?LpapLC0Z/UecHAGe9XzMFVhB8rzHNkm05Nqa1BWVJvY/7qm4P8Kda9/T8yy4?=
 =?us-ascii?Q?S/NssXUttPtLwpRoysGzeXOCBOj5kOZvRzfhDV6gSPt4EeCenwVkAV6a9hTr?=
 =?us-ascii?Q?XX/tSwvBfP3FFC9p7DD5koIVWVw9JfkOIC7PqsD6/4xHfALnycQrBcEHj+c1?=
 =?us-ascii?Q?pGDM2pzz7s31AaIWnjJR+wiLwybX5DHd71FZvf+LWaAjSy5Rpjnso27TfvTo?=
 =?us-ascii?Q?RuHW7jpAr894ND3YlN0XE+qjv7K8BfD+WfC52coCH50VRxSlSNW9+i0PWku+?=
 =?us-ascii?Q?GzC1dm1Vw9AN+tnzCWhP7zCFy32v3EWG8/jehIcTNLwZo8+YSEyWPLuRVKS6?=
 =?us-ascii?Q?SvH9sMfObXQX4k6IJ7DH/rCC/TLFmw+RCbutROjK1eJMApF/YBbFm/4sT+9z?=
 =?us-ascii?Q?CDemuyA1fAkGidYnxA8MAcCKE8FGaXNH7BAhT7VjBW0yN+6CdnlreXU5hTTx?=
 =?us-ascii?Q?jd+3IS38NOeptL0EHNUK/vDIT00dDH2wXtdG4CmKSpn0ASovwBcMUfYFiDiA?=
 =?us-ascii?Q?n6Sg8rDD4CFzAeNVR47/NSy/glS7/aQpIp3tRyp2As/fKkq2DFQpoQI1wACT?=
 =?us-ascii?Q?RIEUprrgOiOoJmmT8cQUxywtY367zya21+0YwmYCUjg3Dj3GncFvYdvFurYN?=
 =?us-ascii?Q?BfAxBdcNcCOWFMJ+pm57NBEyDdTvQKroq1ySo/eW4NHyKwFKoIegZxlDJpNk?=
 =?us-ascii?Q?QK2JWGkcwS09d+GRdx7xBeBrY1LzHERwoEEMI1miegwLy0KMAdOGwKHMSEaX?=
 =?us-ascii?Q?3K9ERCQGesMJuLhYbAxIVi/6RfoAJIepbtZ3k5auBFXylSTMgE0JACznsA2Z?=
 =?us-ascii?Q?9rCns2kH9XpxTOWn0G3BbReQTR4xEhc=3D?=
X-Exchange-RoutingPolicyChecked: 
	kN1Rij/HE7jqVEdb89+K/S4o8x350ShzJH3swGZWhkVnpV+0JlindoJ+wvv7rlHfkAB3SnIQ+aX3hSQEokyfUi+wO4JqRlkUq/KssX7uSABEgey4lV+M2hozqKSmqDZHQuzoFt5RLnKm4+qlOFb+zVe11dHK5XZIMu96Hbw3KGu41T2fvfPNVYSupMAQSEzRFeKFeayo6zvU+5L4Mn+s9kIcq6vW1pXiWM7tjd5/RxQIrx7xZJqbeq2/E36RqQLI6iR6KGCuPxaYSk0hyOOhYAVFjCIG1xnxDNXPXSWeldGORYpOCpZg6OQZHMYEx9IT51hKZ/JobHPcgvpSsnZ1gw==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 518c97bb-f4e1-4ac1-3939-08df2a49190e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB7783.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2026 23:15:55.2418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XWPIWjFRMOivWiJ+jpeJILEkVbd/AoYTWNoByeC4d0diN3X39ZSbjbdB9po5YXxn/vBwyxRvAOanQXjqpWErAURJQHC4aCNHqjCClaGersQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7685
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA5MiBTYWx0ZWRfX82FKrkr+jEM9
 e6eIvHyD0RXPmf/rOj0NJdLH1O1oHvfwTVVWhJpaxfOksHA2dE66Y4Ogdn6WE6rU2Q1NOm7lS4R
 mB5IIHSBoZGcRMbDp//G4Jj5rQk9BcvWDnUK1hLtQwK3kRZihrM6Xozbxt3G275UH799PwzO72m
 jl15hLwvmVfqI96rPgzvTSkUi0L5dsKjK4602PDcFe6InlvBV1E+NreZbR88SPbEFPROCwTZM0M
 CQwypyGtYTlPCj+kqYaXaQ4kXKGXYidEgsTwT4EcatdJ+yJviPUOyMlmOwxxffzD85vRaEzrM/3
 OpnygiNEEeAjhP/oAwja09m5LoFcKNaXVX5u0aZFPykCe+8jl2OLeV5ZJerzn0MIIg1JuD5d+JJ
 t447fSj1NEfzTAQlDFBVQ6yPrUtbFOYjpcSAwSvNczQ61L4ZI0eJ/pX5zDXdeOOpjT40YDXAeRE
 5y/txP9wC41+QZnzGmg==
X-Proofpoint-GUID: _eOUgmLOr43lGUwxvmnv-0WWikeJtZDb
X-Proofpoint-ORIG-GUID: _eOUgmLOr43lGUwxvmnv-0WWikeJtZDb
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA5MiBTYWx0ZWRfX3jpO9HJtHByo
 dOv8cZO/0YPiHSpfAbELAZcjYuezm172m4LJeqvW0HlsLS7GQ976SZ8F7q4TBOfDV76TRaKwOiz
 HxrFrY2ORe25opc20+ifmXPMXf+RaS1L37N/VPclGywgOrmxWWy/
X-Authority-Analysis: v=2.4 cv=Q6NHcI2a c=1 sm=1 tr=0 ts=6ad00d2e cx=c_pps
 a=5WG37Iiv9zZuKkK3l3Cj4Q==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=bi6dqmuHe4P4UrxVR6um:22 a=klDOsUkWDRETUCZYPvoE:22 a=NEAV23lmAAAA:8
 a=PYnjg3YJAAAA:8 a=IGX8wMYuAAAA:8 a=t7CeM3EgAAAA:8 a=oGMlB6cnAAAA:8
 a=Fq7EjvoDB9BJ_1Yaxh8A:9 a=MyEMWE6lpU7D9y2mAhno:22 a=FdTzh2GWekK77mhwV6Dw:22
 a=NdAtdrkLVvyUPsUoGJp4:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140092
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 Oct 2026 23:16:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247795

When using obj output format, specifying more than 256 segments in
the GROUP directive of the .asm file causes a heap-buffer-overflow.

This patch applies the upstream fix given by the commit in [1]
to address the issue in [2].

[1] https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94
[2] https://github.com/netwide-assembler/nasm/issues/203
[3] https://nvd.nist.gov/vuln/detail/cve-2026-6067

Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
---
 .../nasm/nasm/CVE-2026-6067.patch             | 36 +++++++++++++++++++
 meta/recipes-devtools/nasm/nasm_3.01.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch

diff --git a/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
new file mode 100644
index 0000000000..e43aafc7ee
--- /dev/null
+++ b/meta/recipes-devtools/nasm/nasm/CVE-2026-6067.patch
@@ -0,0 +1,36 @@
+From cc006a1d57bebb6ea49db488539a1613014c062f Mon Sep 17 00:00:00 2001
+From: Nick Clifton <nickclifton@github.com>
+Date: Mon, 29 Jun 2026 13:53:14 -0700
+Subject: [PATCH] outobj: fix buffer overflow when too many segments in a group
+
+The number of entries in a group was hard-coded, but not enforced.
+
+CVE: CVE-2026-6067
+Upstream-Status: Backport [https://github.com/netwide-assembler/nasm/commit/8890d723d0aa9ed1a790e2ce1c55eee8dfa0cf94]
+
+Reported-by: <BreakingBad6@github.com>
+Fixes: https://github.com/netwide-assembler/nasm/issues/203
+Signed-off-by: H. Peter Anvin (Intel) <hpa@zytor.com>
+Signed-off-by: Kris Gavvala <kris.gavvala@windriver.com>
+---
+ output/outobj.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/output/outobj.c b/output/outobj.c
+index 685c5933e..9d8bf83c5 100644
+--- a/output/outobj.c
++++ b/output/outobj.c
+@@ -1736,6 +1736,10 @@ obj_directive(enum directive directive, char *value)
+                      */
+                     continue;
+                 }
++		if (grp->nentries >= GROUP_MAX) {
++                    nasm_nonfatal("too many segments in a group");
++                    return DIRR_ERROR;
++                }
+                 for (seg = seghead; seg; seg = seg->next)
+                     if (!strcmp(seg->name, p))
+                         break;
+-- 
+2.43.0
+
diff --git a/meta/recipes-devtools/nasm/nasm_3.01.bb b/meta/recipes-devtools/nasm/nasm_3.01.bb
index 1e4719000f..e8079732d4 100644
--- a/meta/recipes-devtools/nasm/nasm_3.01.bb
+++ b/meta/recipes-devtools/nasm/nasm_3.01.bb
@@ -9,6 +9,7 @@ SRC_URI = "http://www.nasm.us/pub/nasm/releasebuilds/${PV}/nasm-${PV}.tar.bz2 \
            file://0001-stdlib-Add-strlcat.patch \
            file://0002-Add-debug-prefix-map-option.patch \
            file://0001-compiler.h-Backport-C23-support.patch \
+           file://CVE-2026-6067.patch \
            "
 
 SRC_URI[sha256sum] = "7a7b1ff3b0eef3247862f2fbe4ca605ccef770545d7af7979eba84a9d045c0b1"
-- 
2.43.0


