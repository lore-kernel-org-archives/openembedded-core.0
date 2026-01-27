Return-Path: <yi.zhao@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABE3FD2595D
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 15:16:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.13698.1769526951829849263
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jan 2026 07:15:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=FwhQ1ny0;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5487761cdf=yi.zhao@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RAEgqe713693
	for <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 07:15:51 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=PPS06212021; bh=T/WbYAsXL
	yYAm/nbeyo82E93S5gOr7PH7IXacaqdDio=; b=FwhQ1ny0vi779UX5T8dsB0LeJ
	ZLQGO1QGnB6raBAzT5G7DKuWbu5i2GfU3aLl0Ta9uu4u4lbdDLNicHuq+y5tMehM
	dfYgx5o5kDP1H+aqJa0M2XOw4AEVSeLkvtlS1cdqd5T7FA5hy4RILRdnr4yLL1Qn
	RehLlSS98JZrfFI1t8g1ahrGDSJt3ZOQRsbDPsK3cFW2CRbbnYrGMaCMbmYehEmO
	py+CndPyL6HyyXG+tSCDvya0oI4+3QXjO0W/gi15O9fjSO6FACPPHxOJVREpnT9j
	3KZZFcnn2zLjxeeztza6yuqpZacjlV/MIjxPPk8knrixL5rxM4VK4ojNYFIEg==
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012016.outbound.protection.outlook.com [40.107.209.16])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bvxfm31sb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 27 Jan 2026 07:15:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cz60shSV464zOOg+HmkhUl6/Pu2QbXUKKunTYo3V9+Zbz0DtwhqNoqjpXTPlGrRnd3EOlhqbR3S91LCt741k6h4eb+t+gX9iynoagsVwKnpVSzse1lr4jcgyk+MLTbB45T9tSrYMSEZDcneLIcTftDIthlQzmwi4qL2ATp6/RWmovDhIkLnRItZtPkAaB6vPBgq/II7wR4G48kZctwOMlVwDvk5qNlq01Nt49YleXnofGxZ2E3lZ3Z7+pqcsfZTUatt7LzxzR5k4fh+6Wbv4U+bOxKeUWrcLSIrfVlqYqz5WXpCJri/aCe7J4O6sWhZrZ0HdB/k4fxsQcf89T7tZeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T/WbYAsXLyYAm/nbeyo82E93S5gOr7PH7IXacaqdDio=;
 b=D+f4v2BR2oe5V/U1joADth55/sIZkVomeUMcJvPNCut+b+z5d3YjugReNTQXIu/ywwfCqL7tu5ic+FYY/Dp6IbzrW3a9Cq5PG9oul1b8ro0Jb/GZCX7+94cbzlUPJ5+9xD47qN/Zrn+dHlpoEScZr3cMvIYuSibInNzdcN0gREOGENstODFtlUyh0RsMroT5PA9srWcuSQSyU14KaEs/OkRlLrlTclr3Pwo3oCVt9FvrTic1ll+THB6lXDrPhUSXxpxTwXgd4/MIRqc1Hm9W6FAdfuD4+E4Ar2cgyx/GH54LcOdc+dRm8Q3TNOUUAV9pE4APxNw7EFYoNkEz4hHV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB6399.namprd11.prod.outlook.com (2603:10b6:8:c8::5) by
 SN7PR11MB7044.namprd11.prod.outlook.com (2603:10b6:806:29b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.15; Tue, 27 Jan 2026 15:15:44 +0000
Received: from DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831]) by DS0PR11MB6399.namprd11.prod.outlook.com
 ([fe80::3432:2eb3:d0a5:7831%6]) with mapi id 15.20.9542.010; Tue, 27 Jan 2026
 15:15:40 +0000
From: Yi Zhao <yi.zhao@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: liuyd.fnst@fujitsu.com
Subject: [PATCH 1/2 v4] blueprint-compiler: add recipe
Date: Tue, 27 Jan 2026 23:15:25 +0800
Message-Id: <20260127151526.788157-1-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TYCPR01CA0032.jpnprd01.prod.outlook.com
 (2603:1096:405:1::20) To DS0PR11MB6399.namprd11.prod.outlook.com
 (2603:10b6:8:c8::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB6399:EE_|SN7PR11MB7044:EE_
X-MS-Office365-Filtering-Correlation-Id: df71732f-512d-4646-aba1-08de5db6ee5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|52116014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?HfUIeHftxX9uSxK97B9WCwTI4QaZdq6TY7vv6Edsash8OznfCo0BiVDXZt2i?=
 =?us-ascii?Q?4wm+amQkuuuDD5HWINNQe0QyfNzc8LrMfsZRMwMSIaX1kRFxvYRiQMxGz34E?=
 =?us-ascii?Q?nnsrhmNE/2GYS1VxIl1UuXierAIn+dY55fl8LCTGsaNEusM/pz4H9Vn/gOoN?=
 =?us-ascii?Q?iosk5rPfuZLBal0SKs9LEUKPGjsN1B7BieRxrXHDn5QYtKH9f2Lu3bGTaHBw?=
 =?us-ascii?Q?AGLpuLu6Met9ddL/6VkXLHU3hX4kzYVTPSFW7/ov9w2yJu30RL6BotIvRhm+?=
 =?us-ascii?Q?6wQz/moOk86AKqcMfwNEHdH1o+YOGdD0QXMXvWoZG0IVYot0ro5ThqwGT33R?=
 =?us-ascii?Q?y++eu2ogvg4GLfZYPVNaCJaLNWNtv4td4LcIffXO2YL3Y49ldZpMTg7Qvo68?=
 =?us-ascii?Q?K6cvwjQSfn0+2nocqSm3ypVTD+MjzYQamjA0HYZs6OAUNBekRRIQtEVddIm6?=
 =?us-ascii?Q?4iWxnB69X4klw46r+m/T3mkUznaUhPF9k7O9Acuk2SgFetRc6xr0MaJcJZSp?=
 =?us-ascii?Q?gUO56bvl1/78DmWFbSjxZeAPBbvEND65fHQqa1+f8JbXkyE3GfSgd45d/2m0?=
 =?us-ascii?Q?XJWJwZkk3Ig3UgaNDf3DS6boAHCUdtwkrLepo2eG8AZRFeePKGAzJTW7sVhB?=
 =?us-ascii?Q?CAOtJswAqN3TrkeGuMztbMN3nDP1AKpR9+6Lu2jvt5/QeYondPS9K7hQVyYH?=
 =?us-ascii?Q?phUDJPk7zDwDZP055uPG+G9+rwXw3/of8iF+GwVOwjAkcdb2fL5LBE/n+qSw?=
 =?us-ascii?Q?NubC6ULtyVGdrq48e/sum3gOYAUPLlBxL6tVxWfQUWBvC6VS4h1QB+qV1M+P?=
 =?us-ascii?Q?A42G00gwI4ngPKqcH3md4P+MyOEyb20qd9NvXitB+3NPPZNz1TQLkJW36HpR?=
 =?us-ascii?Q?KGasWHyATD8E9es4uOguRhFMzYY7TZKzsRETempRyzRFQBcnMELyOu4D9Af3?=
 =?us-ascii?Q?RtUkZjm+j9DVoIbAcNgJpKVXNLLcYjctsAXXpYJ1fEqiTOcvg+mDDFh3KNAL?=
 =?us-ascii?Q?L4c6PjDVe5KAktxKmGdo77H3r61Z2/kfmvpHEZBhzP7Ri7wVvD2NW/JBEBgf?=
 =?us-ascii?Q?hivUy5vqCmejBQoR9VbWOWj3Lujrt0YF344Z2ZY/NI2YMH0THfqxRoQYLbEQ?=
 =?us-ascii?Q?6KSkNAd7kfjeDAQSJwd65ezf0lawWhUhnXqtng3PY9T4NXIlt383xhlCYsBo?=
 =?us-ascii?Q?51AeR0bSt5lRRyBSfxug3zbxR/I+IerOiOeEWE5OvZDqSsNOvsVW8WGVERYU?=
 =?us-ascii?Q?ppGfDLJFO68gj0nX57aPX/eKaABx/aXioJnWFfu0JEsWJS4vx5Gh+bsOnY9B?=
 =?us-ascii?Q?YyV8ELd9MSRsCAFamCdc3rzkTjegwgQIBhWSzzbm+20TMRift+yPOrMWKx/2?=
 =?us-ascii?Q?Zb7JtPuqvNsTHLNc+vwewhC41URDlRASYI0CbxnLcxnz4Fd96Rp4OjXxM6o3?=
 =?us-ascii?Q?Ovs+TjqS+J+whDuBWMC7gbD6owT9WVNi2vhYzpUEOr5ImbKJZKDmuBLXJuAo?=
 =?us-ascii?Q?duDQ3+yOWNVNY5wL5yiPRyWS1jjWOX4Zs8Yxkfln2PWgiUCceczyFGd6TQ2B?=
 =?us-ascii?Q?jZjYikUWAF1M7JgrFFmplDhRau5jJAO+SusF+HmVXJoZJ/o6NgSKFVIhnRxo?=
 =?us-ascii?Q?Yn2kiXgcRtWTwl3L0t70ir0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB6399.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?rrnwHxbqMzS64rjTw6ZipUEKfPZ69y7iSBZP9QivBpK27XfRWZ6aXvlSLosA?=
 =?us-ascii?Q?eZwNe2LW3bWq7nGGOnraBnzhuenAk3xF4R8OQeQPddu/BZ0wq8HCeIILVihi?=
 =?us-ascii?Q?rnXiMTvEo9qLiKYtTXcPZ0z5c61qGYAQ9uVUgvrK+a4SGwV9s7/DEAbk42dy?=
 =?us-ascii?Q?5IIzv/2rx8vcHnjbkS2YsfDJYkPPt3O6OCMmXU3LBN7U20za0UYndAzufoin?=
 =?us-ascii?Q?4qOSRb28PcXYJXjdgCDtadiHSiVeA570E6JDBlfKLHZjNGE7qxOHe7C/fdJ9?=
 =?us-ascii?Q?G5yHlkjs8nqVAXu2gWIv1Z4dHeeyWJgiw8IVeGQkNR+L4IN2VswbpP4gTmpE?=
 =?us-ascii?Q?PiQSvMTkcIar/IBkbRSnrwWyeRwi0Ixx68b/JJuSYEfxTOK7yUxBqi/7hHrg?=
 =?us-ascii?Q?D7/SUyi0oCbaQ4+/NfHi9j6VNl0+kfQcpgkRll5xePuXL6w3zjxp1AkYmA2H?=
 =?us-ascii?Q?MALgX6XAPML+UV7bkCp8CuSVpsIXo/gdn2/wphj+tPj7GS7W/3/nwD/ea4O7?=
 =?us-ascii?Q?GZRbhQ82ce00e4JzDoJqiwqbD8lwmL/zJFXzhh4ZvNyhNoWdtqy/Lai2L7oP?=
 =?us-ascii?Q?xH7CbztsAo3UPrWzNMUQkcePR4URrEn0lsad3ZEC1BQuCO/8uGQxVZE1iOF7?=
 =?us-ascii?Q?oAVRRKMWmsdoE1tkJSF9R/l4rJyNNfXlRgJyOiu+jyhB/pnOSfGZFL3DUq+w?=
 =?us-ascii?Q?cjjOpwGCM1l05Ln1pFOUw7UTsZycNplowT1tVHPt5j1EJ7qlT8s8ibbwFGDQ?=
 =?us-ascii?Q?QxGyCjCqrMO3tcgWpWoK6Nvir1Q/9tJS8I896FXg5fYz7WISn2z0G5hGJF8x?=
 =?us-ascii?Q?9BerovzeBUNsoCRWrfKXgH0CJHksf/GGAuezvP7KEsHCcsKfVeNbeTdtUEfi?=
 =?us-ascii?Q?uflrAV19v2jxplsH+/AUsyF1y4Art2kJ2vWCz8JzGrBntXeirw3wtV9wWb7S?=
 =?us-ascii?Q?65/bYv6+ItApfr1zbHA6Slv8ABBnkOUdbyu2TuDmg3+N7rFGCN/P9x9tMGWw?=
 =?us-ascii?Q?oFJELW/N1578y3eJ8V3M69PA728ocGxErGfv/GMErKW+HkEigOsGRKTdht9t?=
 =?us-ascii?Q?2yNezRjxlhs4HBxIvZ7Y4BMqHHWjFXfstmAP94ndlA6Mngs5SiXcysa58qML?=
 =?us-ascii?Q?3fuvkpCMuEXxWhpXaLthLhmjnGpKcCDzxNZGTYqaf7zudgngYHSjaI5/juXb?=
 =?us-ascii?Q?7LOhk6HPyDep3uuToGJ/KD4RlFgSVZymkBkLRfSF++ASFWqza5dyYsTcw+uI?=
 =?us-ascii?Q?DJsgwsfi0AeDhkrQBORyvMaJ2YYDmifrtYerB9Is1ApgN33G+qRfi4QG5qU7?=
 =?us-ascii?Q?LusAOQuL819UeBgqX5gGQtVtFcF8h3or8OHo7SgBkT4KKuP/HAxnixHOl0VF?=
 =?us-ascii?Q?1Sk2J8TMoGxiGou99t+bd5uNGAxDdBOJOj3n2AggOyY/mKoJlF61F/Z199B7?=
 =?us-ascii?Q?5DLLiWzpRCi/NaJNBwcljjgZvCpe9sFEWZjAiZqNLGysKECupFPHY3P0MeAC?=
 =?us-ascii?Q?XD1RxsDH9mVOErUsJg/pHLocNYOrk+yE1v5UeRrHPjIzJRf01zCYR1K1qE4l?=
 =?us-ascii?Q?AdMbe5UqNwW9pxoXthXjTQstx6yQt7+ZDQy551wEFQhKvPzKzGlQCxoMaj1z?=
 =?us-ascii?Q?BmcpxqNPwFAYFKgo7iUuDd2W4/ysKk6DHfYkiIH9KEVFHyA4vWCdcOOpifKA?=
 =?us-ascii?Q?Iqw1KDfrbugyOgIbDq3ZxKjNAiUJfi8uYHleXFEvu9tGeeLwaQ8qsEcYUF62?=
 =?us-ascii?Q?FSK3QHUJ/Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df71732f-512d-4646-aba1-08de5db6ee5d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB6399.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2026 15:15:39.9855
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uwn7HwS6VEThoAMyq7CE3VFuQmyFW6ItbksoBGcspX4iUvuQ5X3DETDO16+AkVSWpXj18HajUcCOiFJY5hcABA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7044
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: YHO3XANk0G7fbzU5z_y1RtdVpfVAmHkS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDEyNSBTYWx0ZWRfXzNdIsQniEwnX
 KYs9Cw6wCpOWi/ICd9esTjprUu48a/RiODa2CaohQ0ZN7ji1M+su1waXYj2HsuJ0ZM2pvHVKHCd
 aus8LwGJYMn/ODUKtld/ksrMsiGwqUWinWBc8DywF8bXH701lDGngOZSh5DTiayGSOGzj9VfitD
 n5JlcSDHsmXMW73jAEQTqOX5Kbx+/WEJ+QYWgDDJ3jLNVrhm/ZYBuKInzcIYygyOX+VQb/hJOTi
 KyTGZt1ZSpjcNRTekQA+maD9YCabCh0/vZo4KPjgtfAQAQgMXSpJkMtHwSXydVMEB/Iu76SNV/a
 GzpuXiAoYzndhXRW+uviGUe9NJbhuV1Mw1VuvqR1Le62HfhZcs82gA9wxQkb+cWDfnyYEDieaQz
 c5T3CLgNWydACkLauHg4fTOgI7IZox+FDymSF/meSTeS/vuoLRA1vF1Y5+s2VLnSJhwJsnloBl0
 mAB1X40Tzoss8Sfa/WA==
X-Authority-Analysis: v=2.4 cv=Lo+fC3dc c=1 sm=1 tr=0 ts=6978d6a7 cx=c_pps
 a=lV9semjb6HF4qJ8WeHToSQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=GHR8O2WEAAAA:20 a=omOdbC7AAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=iGHA9ds3AAAA:8 a=2X12lZP5CFuO6KqQosoA:9 a=FdTzh2GWekK77mhwV6Dw:22
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-GUID: hE2GBKQONJt0grr8Ey0Z6sJ9hcfs0RkU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_03,2026-01-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270125
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jan 2026 15:16:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230051

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

 meta/conf/distro/include/maintainers.inc         |  1 +
 .../blueprint-compiler_0.18.0.bb                 | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)
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
diff --git a/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
new file mode 100644
index 0000000000..2a6636d8ac
--- /dev/null
+++ b/meta/recipes-gnome/blueprint-compiler/blueprint-compiler_0.18.0.bb
@@ -0,0 +1,16 @@
+SUMMARY = "A markup language for GTK user interface files."
+HOMEPAGE = "https://gitlab.gnome.org/GNOME/blueprint-compiler"
+LICENSE = "LGPL-3.0-only"
+LIC_FILES_CHKSUM = "file://COPYING;md5=3000208d539ec061b899bce1d9ce9404"
+
+SRC_URI = "git://gitlab.gnome.org/GNOME/blueprint-compiler;protocol=https;branch=main;tag=${PV}"
+SRCREV = "07c9c9df9cd1b6b4454ecba21ee58211e9144a4b"
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


