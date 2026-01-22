Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2D70D2ED14
	for <webhook@archiver.kernel.org>; Thu, 22 Jan 2026 01:59:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28405.1769047154440281703
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Jan 2026 17:59:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=MT2PeYed;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54826ed0b6=yi.zhao@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L1WYtn3154130
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=FQSHvhac5SpXNFMRJrLA
	jm97V0R9QCOkX8BC4zdbewo=; b=MT2PeYedEpf04juNWbBwsy07aLzSGK+A/mMM
	pa/WA5Zl8lm96WAC5VXMg7t8EDLmlllTc/nbhNbiakxE836jaGG0ZUsDqtmuL5/n
	z5x0TU5pmn4Ux82g0Bfvu1qip+nNAsqI3vxVia6F0NTGKIe+FdeOc1OgethRaed1
	aAOU0bhua3W6893XJN1kOvt14b+Ygn+nyZn/zK4pCLOTbWIjXs1nFcc9zUOnFh4W
	hEsPlbJPxm0FvyBMyFLHyLAqzIarb7SL2//QHolLcdU27FCeRXSIDXN2gKX/uUFK
	XzIYnFkqtowcewVN/t0uO5G1ZgEgzlAqK0CAwNFzICaUTBo4SQ==
Received: from sn4pr0501cu005.outbound.protection.outlook.com (mail-southcentralusazon11011058.outbound.protection.outlook.com [40.93.194.58])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4btn74smvw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:13 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ALwgTa99aV2NwW58Jq8K+mU+tZjXIPDtWC2fXJ3hHflFmYJKeTV6cgqJRB9kmmyK2cncBU/H0OiyBBtlrSxnRJfP5k5OS7ryX7M1tw8n4lta7y0yEaXRugHlXjJUY4Ppd4Ts4PsiGfSWlscfG6tKMD69nDrKoE8efc0903sTfp/Xyu5dQH4T6rjCdYe2VQSNVSgpMlSt17D2SCW/pC1SfDKyn5OTlKy8PoTDOVosKnZe7CfhumNr8N2I8vtFXgYHtzqqIjU6sp7kKnGVXox2wtffLkt//HvBc+2nC6O5sm0VyrsYNAiOuqw1ec2c+z5+FOzjXfUuIk9S7y6vNp2/+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQSHvhac5SpXNFMRJrLAjm97V0R9QCOkX8BC4zdbewo=;
 b=uzO2Iqv8NNLa8RleVwMIRKs3c3BscwNo+0PuWzfK1Tbdta23kvYixr7MOhzH2MQyVNDVrJ4m7zzQRj1XJb3a5wUWNbGBOYXeo5ILK7YOKY75N8L5tSegwwnI2xE8rIgEFllvoj9GOCLatsL9QmCwfO1FZL8GDWeCrVFYW7go2G/gkf4rDbb/lBCHeewEoUHbMBQQUo/SNDeFXZZZGXVIXI8Tw5foQUhT75R/Tn5BWoVUukEeWdQPD6iQZndf53SO3rNVUYyjM2FxtUJyQIo/pKzLg3YUjCLR2/NHhx6GWwiR5vnYdLCBJqqhMaQ2+q22ygst9NW1ow5Eyz4rDyVAjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA1PR11MB6396.namprd11.prod.outlook.com (2603:10b6:208:3ab::10)
 by SA2PR11MB4875.namprd11.prod.outlook.com (2603:10b6:806:11a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Thu, 22 Jan
 2026 01:59:11 +0000
Received: from IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4]) by IA1PR11MB6396.namprd11.prod.outlook.com
 ([fe80::73cc:6f62:3c66:cef4%4]) with mapi id 15.20.9542.008; Thu, 22 Jan 2026
 01:59:11 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2 v3] blueprint-compiler: add recipe
Date: Thu, 22 Jan 2026 09:58:54 +0800
Message-Id: <20260122015855.2022014-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0085.apcprd03.prod.outlook.com
 (2603:1096:4:7c::13) To IA1PR11MB6396.namprd11.prod.outlook.com
 (2603:10b6:208:3ab::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6396:EE_|SA2PR11MB4875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9297a898-f60a-4c9f-a262-08de5959d5fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|1800799024|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?cyIqc/nsdyUdYD7HYZd8ICNJJDbxwQjX08HL04OuyqG1eGQ2N2t1Ybd+j7SA?=
 =?us-ascii?Q?f6ltEbsCkSBcp7WaApYDRSXWfGs46fKtgRHJk0t3DhPgZGM6cTlM54iANOYg?=
 =?us-ascii?Q?Fqto+GY0ulg07CDmpJi5nSqjLbLWmW0lJgyVEtyui9OPxwNRl//YyCQOxI/B?=
 =?us-ascii?Q?Nwqs2X2AxEJ4eL8TVziCYLaQbWB4uF7lstMN97AiC5geHYaKn+d8xpvDkwBH?=
 =?us-ascii?Q?7DTbe4wApi+NbQIb1n8xAyWPTQqAevlXSi7j8EFBJMgNcAQqjKDQdl876CbE?=
 =?us-ascii?Q?Fn1D97o5nrM4aqc3KOVe3lWZ2BuFy+vrjjB02p4w5XVaFkwEztmBxGmSVxGp?=
 =?us-ascii?Q?azw+0qRIRuGSzOMm0apUuW3X4kOLAayAakXjIzkgd6EtFracIzoM4c1ByYMt?=
 =?us-ascii?Q?blf6o+ubIKSnpobwAUf0sbcMDeWVFJtNGD/pspa/gcKZTQRuRwUvf/xNHRKl?=
 =?us-ascii?Q?79yw08gNYumxFG3dejgqkfFejh5JHldPAxhikT4KSBUScT0WVV7AVo6sgh6U?=
 =?us-ascii?Q?sgN3IVDDUPtA2hM1t2LLW6WXwcyemuFXPCKvwAktKKjyHp+9OvBhPJxfxRoE?=
 =?us-ascii?Q?CRq9sZWgpVKpd6nPDsGVaCx2Cl2oi/E1RIo4SqSDNjACJPasHCiqMiosqS0d?=
 =?us-ascii?Q?i7PlYWxRaj+h5djpqBJsTCE2bfM103udfDOMxgMcWqEIeVPfnCBGFb3ow6Ml?=
 =?us-ascii?Q?qPUgMfBLK4t23k8KPjiUPnDsOhzM5WQCJcVOz836ikc93iF/bdNxl7ebJ4Kv?=
 =?us-ascii?Q?7VBePgrCVh5/gVmFxEHXSeparWPyv5+o3jOvMWsDa67WLxIH1EkdOnU5ATJG?=
 =?us-ascii?Q?jqUCDoZK3rF/mMH4XegKOMnliEtZyg8n7P+CeRKutvQINyOwCCEPDviOQeEh?=
 =?us-ascii?Q?lrFJrj1WYk2BEMcBVwDTZDck5G543tZK3U6FaOXOiNhh5RTskU0xvbTuCWNU?=
 =?us-ascii?Q?hJbI3gQNBh0GZyxfOSdh+u8ZGoHHFSKUDeyQ8ctwDhCY1fTqSW8T9+VfVVRq?=
 =?us-ascii?Q?PUZDL1nAta1dOe+of2fNNfJ4EfyH4G9gds3fkPkF49YVuvqFITK1Ed0+Hm6c?=
 =?us-ascii?Q?KaQd+kfAKs8rXFV2PICQLb2X71L69hfb4O7pb0m3/I2ock4bZ1kJqcs7yG5g?=
 =?us-ascii?Q?XYcDUnzrJCVvCTdzMbTN11hIOH+xSrlnzu8tcg+S3MzZDS1gB6QEUVyMSzSu?=
 =?us-ascii?Q?jx9ggLc4zbACXetGbeDmuVoLEaKMCfYlV1joXztBdJppopwOyvI0HNKClT3h?=
 =?us-ascii?Q?C40OGH/8dSBA6Ub7fRAa53qIZ0SBWvrgJj6W8G1qWM8cwbcCGPUDiSSbPq2D?=
 =?us-ascii?Q?zUU2u0Ww1aWwRkqGLO9YiUYpV/7fHQM3JdC6CIv7q2nXsCdNYtaGxFo+YVIB?=
 =?us-ascii?Q?YP2k4dtQHMTK2845NSAFRa59UeHe5om5kWLzWAXDGQRQ6iTxvrDwLTSn15fL?=
 =?us-ascii?Q?7q1xNSWnTtVzapiBA0qKzShPeS0AAWutnNHdO49GY+gh2+LE/FSl7dhr/qD1?=
 =?us-ascii?Q?ddJhbkEHl+31tq0ldYncKV0PSj/aoanokUT/DQ+EiBEq4bS/fgcYx0i20NbW?=
 =?us-ascii?Q?eD+j5sldOphLFmJx/H3lI+Ct1b/lI7knEGMjUIriOC1bygmNRcsGdT3hTGN5?=
 =?us-ascii?Q?2i2o8eLeSN0JwEZp2SqQlAM=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6396.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?d0qfriC3mH0QR2wEymE3gtVkqJhpyilVyXs65gCboSOZmp4JXFmnUzhSWets?=
 =?us-ascii?Q?IrIRxwGFTvt4MOVhCyJ75l8+LjIm8HsQlL8T8X+cphUacxzWaOwcsbb/mS9z?=
 =?us-ascii?Q?J9qPjPI5vrehyU6U004ZZh7YAM4/m+razdUYnIrlgf82oKrU0Vehe+Q2gYX5?=
 =?us-ascii?Q?aNqhYYS2f/Sd71ZxYkQi9QY2jI+CYoFQZeVyMpc1gJY08DfAvvUUbQ+4Keu3?=
 =?us-ascii?Q?Bcdzv10N3vMkvJh9vfAvZ9Gbdqc+9lFBzLlyr9Nn1fosMOf+kCD9b3XiZKAB?=
 =?us-ascii?Q?V6C+WDcRwDQZttblE99cA3H1vBSCWWm/ZHDXEJHGjUCr+33zSPrcA+HSE67K?=
 =?us-ascii?Q?hrc0vySdXCcy/vJaI3zAB9U43j1+h9SLqXAkMVg825+wTgKKq3RvDOLl6n/2?=
 =?us-ascii?Q?ziFvfW9QcUhIxGN0KM+hj3vNpVy6BphUiRq7yjoHHE5ygyovAzTDpYAIYBZ+?=
 =?us-ascii?Q?b1pcNA2m8Swail5ua2i4hqKVEuMqe3aRIYgj5eJmV6cqggHVPesYP8enXX6+?=
 =?us-ascii?Q?Zo6AR3yWP/OBlxRl17fdy1sEE/AtOvSEm6FxqsCwlEe5yd8cAMKU7S1Ugpog?=
 =?us-ascii?Q?VuZvo9HlNUIQjLNeoBG1knjS42fEjF6jtGcMLlAuYg0jaR0ToQY/2sNquu3J?=
 =?us-ascii?Q?2K6nqCJIBbvEzEoZde2XT6B1BMmQ5fmWN6mjqMJlOjfXEfS4/8FjhZQ4C4Nf?=
 =?us-ascii?Q?KDQzJp2bu5NvnhU8HLHlTi6z/s2LcfsAHJC+5Ob0M6pxzUugBOI0Mpcz1N0B?=
 =?us-ascii?Q?d+R7PPSYdABpBrN2H1Oj1nr1ufDE1O08atD/DTZDQF+lEWf5EvmsfblW8GC/?=
 =?us-ascii?Q?LmFUUBx17O1U186Ml62t3mS4UgUFoY6M7xQMI7ziDfPRMgv2XGN9A4akLNbn?=
 =?us-ascii?Q?7WK9CxqpjrzBJ7nmXwKSZJVFe6/D/0eBVGAxrbWJ6/qqIIgOoPgjLm6rTrhj?=
 =?us-ascii?Q?a/aokGUp/Z8Gj/gFO9mntFmUG2ba2SWqz/xLJbFR4Z9stPTQcbKe4wFW6hJZ?=
 =?us-ascii?Q?nTJ3bfrup7Z6HbzDFhAsVmyYwlJwqgeqZ/uaY2t7gZna6WwrMHRiVGfebYvm?=
 =?us-ascii?Q?16heAD5AQr0Zie/DwZuG5C74C+cA9uWDO7OvQRj0CxaxoaPZqjxMN954SO/N?=
 =?us-ascii?Q?yfc7CdM6dZXJFByrKeoMOGqA1swS/8NGfhck+ZpzgM3ayFG8JZlzhLNwWBR3?=
 =?us-ascii?Q?92dliXN8+VPn1vyH7o9OwwahPGGuA0r7i2MScLXh7q7YQX2R2nPl7oXane1d?=
 =?us-ascii?Q?TGCr30iv+cr78hNhWZFpJtJHpXfPf76CCuBnqZz+0kyqBTjFWJkCR6i0HYBD?=
 =?us-ascii?Q?GhiIvGI0LAMQirIT1BQgDn6k74LlZQJs1R3A15uGSxSzi3LTD/MWtkjXRUAc?=
 =?us-ascii?Q?JlEXAMX87GX+I8qmL+WMU0rMZ4qhL7meUOCFTgwoRXkNy/3Qf+BRehTCyRsr?=
 =?us-ascii?Q?LTtZnTNuGe2g+U54lIrsqVj132i2dZCiJL3riXhoUWMRs9AfR2QLqHNh7r/S?=
 =?us-ascii?Q?2NXlNBc+LPDQ9a+DL9lGp3Sk/KDqRfh2oU9qKImjF6/bhonrD/U+vmZgtEB4?=
 =?us-ascii?Q?78l3Epv8B/6zoP3Qrvi2r+Wdj0OfM5iuQlaGs+lG57IHzssAq86EyzMuIom4?=
 =?us-ascii?Q?dh8+OEJOpUDD7ASg5y77f6NN5lo46+0XTB3D/gI2/5kjnuVX7iA6chN/WE7M?=
 =?us-ascii?Q?ATUdDb9x9chWBed3CP2hW+6qyI+StzIbK6E1tugoxY+qxdgyxVbQNpIhiKHO?=
 =?us-ascii?Q?v3LaFehHew=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9297a898-f60a-4c9f-a262-08de5959d5fa
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6396.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2026 01:59:11.1556
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ajqlx/6mZDCw/6fr1DU+s5v7W4+6zlF1WsCNulaQ5CeitbTLF2GTYcEXJt1tkxXIRFoh6rfgLVkWhINkmQPYuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4875
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNCBTYWx0ZWRfX9CFeh4zzvMX4
 WOKQJERTlmSo2vQ/6u/JkMZX/icvDq71lwTgDtYF+WmGa2eJWJyrO6SAVUxKHZNaegNJOGcsHqO
 7YGJjVZoYtzVRDgAY9Q6M7686qJrXKBsWPlLRthdldrIOU69tBEuBAt/ZrkzJK5AdNBKbYbq6rE
 axX7Gy8eX5/2H/Iwa4EWlRRlNGvup6he0lhlZi7JSIi+BzwkSsy64xAu4Qu/AkVPvbB//UAilLP
 o2ElxqwbEj91s7uUedqrfjZpkk9URmk2zKEYW+m7ePi0qtMDxhZaqkD4n7pO95AgwnZXfnczF3E
 CJOr03dQbKt9fGOuN3XhZp/oVxciQD67mIuPkRzNSQNSMHd6AOF7aBrenVbViw7watwTFTR3Sfj
 7s8PjJrOOrW1BN57Gii0gplK/KHf0d7+NlKmmMNYDKJ0K5pwWM7i2/UfU1kwnhVRbDilVyXj9of
 4II20diYYHvOuS6Harw==
X-Proofpoint-GUID: Vhugtjw_N8RUDebbYHWP81nQrqcCcXq4
X-Authority-Analysis: v=2.4 cv=C6rkCAP+ c=1 sm=1 tr=0 ts=69718471 cx=c_pps
 a=ZGXiQjv6iMHL+sQqMZfKuw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=CGgLeAM4nBUBg5_px1sA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: Vhugtjw_N8RUDebbYHWP81nQrqcCcXq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601220014
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 22 Jan 2026 01:59:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229829

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

 meta/conf/distro/include/maintainers.inc      |  1 +
 ...1-Make-python-site-path-configurable.patch | 62 +++++++++++++++++++
 .../blueprint-compiler_0.18.0.bb              | 21 +++++++
 3 files changed, 84 insertions(+)
 create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compiler/0001-Make-python-site-path-configurable.patch
 create mode 100644 meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb

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
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler/0001-Make-python-site-path-configurable.patch b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler/0001-Make-python-site-path-configurable.patch
new file mode 100644
index 0000000000..19113457cd
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler/0001-Make-python-site-path-configurable.patch
@@ -0,0 +1,62 @@
+From 3339e2e8c6324fde73a0c5b292fc9f2e5c86931d Mon Sep 17 00:00:00 2001
+From: Yi Zhao <yi.zhao@windriver.com>
+Date: Wed, 21 Jan 2026 20:45:30 +0800
+Subject: [PATCH] Make python site path configurable
+
+By making the python site path configurable, we can set the correct
+installation directory when enabling multilib.
+
+Upstream-Status: Inappropriate [oe specific]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ docs/meson.build  | 4 ++--
+ meson.build       | 4 ++--
+ meson_options.txt | 1 +
+ 3 files changed, 5 insertions(+), 4 deletions(-)
+
+diff --git a/docs/meson.build b/docs/meson.build
+index d9ad736..4bf2a9c 100644
+--- a/docs/meson.build
++++ b/docs/meson.build
+@@ -15,5 +15,5 @@ custom_target('reference_docs.json',
+   command: [meson.current_source_dir() / 'collect-sections.py', '@OUTPUT@'],
+   build_always_stale: true,
+   install: true,
+-  install_dir: py.get_install_dir() / 'blueprintcompiler',
+-)
+\ No newline at end of file
++  install_dir: get_option('python_site_dir') / 'blueprintcompiler',
++)
+diff --git a/meson.build b/meson.build
+index 405ed10..2a8d324 100644
+--- a/meson.build
++++ b/meson.build
+@@ -25,7 +25,7 @@ config = configuration_data({
+ if meson.is_subproject()
+   config.set('MODULE_PATH', meson.current_source_dir())
+ else
+-  config.set('MODULE_PATH', py.get_install_dir())
++  config.set('MODULE_PATH', get_option('python_site_dir'))
+ endif
+ 
+ blueprint_compiler = configure_file(
+@@ -39,7 +39,7 @@ blueprint_compiler = configure_file(
+ if meson.is_subproject()
+   meson.override_find_program('blueprint-compiler', blueprint_compiler)
+ else
+-  install_subdir('blueprintcompiler', install_dir: py.get_install_dir())
++  install_subdir('blueprintcompiler', install_dir: get_option('python_site_dir'))
+ endif
+ 
+ subdir('tests')
+diff --git a/meson_options.txt b/meson_options.txt
+index c3c5661..5e71bfa 100644
+--- a/meson_options.txt
++++ b/meson_options.txt
+@@ -1 +1,2 @@
+ option('docs', type: 'boolean', value: false)
++option('python_site_dir', type: 'string', value: '')
+-- 
+2.34.1
+
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
new file mode 100644
index 0000000000..a61db3c4e2
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=${PV} \
+           file://0001-Make-python-site-path-configurable.patch \
+          "
+
+SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
+
+inherit meson pkgconfig
+
+EXTRA_OEMESON = "-Dpython_site_dir=${PYTHON_SITEPACKAGES_DIR}"
+
+PACKAGES += "${PN}-python"
+
+FILES:${PN}-python = "${PYTHON_SITEPACKAGES_DIR}"
+RDEPENDS:${PN}-python = "python3-pygobject"
+
+BBCLASSEXTEND = "native"
-- 
2.34.1


