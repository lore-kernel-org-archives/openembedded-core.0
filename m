Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A323E94121
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:42 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64844.1767104195180303987
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=dptNNAEu;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUCnB663577351
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 06:16:35 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=BMDicyTVcK6sWHn+54LoPXMjrKB3Qad2dJR4ZxwUYFE=; b=
	dptNNAEuSyHT8az1L50h+otZs0Yq08TwlL5hRCAsx2Rkj2fPEXPm082/TzcQVT5m
	vn+PkEnDmlRVrAzTXbRLHDjW5kmrJEH5Dvwibh6q4IuGsrmNebIkHIZxdEjSXxUK
	yDruPjzRTaH/l9B0MpXdYWHJxQaCWeWo9u6mT/XekvkECry0begCa4C+1r2juZGx
	3LrhJVb5ZP7RiBwPdkWx/HcOjghd71jN++R8gDmO8Hlv/ZCZobSKnG3tghP1M//8
	X0f0FIicDLY8A2G4Mzx5A7WpRi1R6tbBeCS40Hr1Iy54blq+AdPlilyRjIxemYTt
	rHftkWxUCHGwI1uEBW7Ecw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010052.outbound.protection.outlook.com [52.101.193.52])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4bafukamqj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 06:16:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=twVMsDbtu9ovNf8lRb9D31susTizOOUtqmom7oC98WNBt2BN2kVHTaaxcgPzLhtHlIyrB+15NJxUPx0zF4pjiOXVv2w2iHHmzP3dd++2ZPOoDoyNTn7VjH2eML5dAm/TmRR7vw6VVL9mOBVypdw0SbxgxmciWvtRg0QZGyd9802dLpmX8F7Q4gYlDq7Iy+rk8rJL3vfblJ6d+S7xWi8+wCB7PoZuv8bDeErs/LkntYTCf8sYZ7oqpGo9o7r9tXSN7ssrX/SMUl0Zy5BFzjen4RBoykJFSTfS4QWcpuEtR2pePzL9Z6jd/TNJ9sLO9xWCLLDL9PcsobJyYcEGr8wflw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BMDicyTVcK6sWHn+54LoPXMjrKB3Qad2dJR4ZxwUYFE=;
 b=HC6E6dbq9U8TMtsoa4Tg5aeh89aQv/XO75HeO2qxEbFZRVc/OXiYBLtzbQ18lwgmaxSMTgOQtBNf4GmnKTNs0OyrDa0P4F14mDa4Y3UpZv4HFL9YZBdMYe/7qclo8pKDGYNSN5N9InurkXl6WB1xF07ht+ljnLSRQRg18qvfv4jE+vtgZGsk3IltUI0qAIzglAbpC3VanNpA1kAqwlgEZ5YNzB5alin9mIy1jvG86D5YDIvhxgA/eTuExjza8krLYqHk/zqKnEr/dCnaybmsVOkNlmErsI7eDQ1kKl3216ZN/J9I4WuWSm8rEMRarbbRo7MmPojTHCI8LFwIrlBrAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:30 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:30 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 06/15] linux-yocto: enable Rust support in kernel configuration
Date: Tue, 30 Dec 2025 06:15:31 -0800
Message-ID: <20251230141540.1974380-7-Harish.Sadineni@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
References: <20251230141540.1974380-1-Harish.Sadineni@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To CO6PR11MB5651.namprd11.prod.outlook.com
 (2603:10b6:5:356::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5651:EE_|SA1PR11MB8859:EE_
X-MS-Office365-Filtering-Correlation-Id: 571d2f79-6343-48fb-119a-08de47ae06fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?WKojtMPmI1hfzx5777L9oEN3PxQ2Y85kAGFtTGaSf4VJ2bfdH9pfTwRmNqE4?=
 =?us-ascii?Q?ES73cehiUz5pKxUk9WNte3qprMVKM9zVBWvXKVIl3dxUeAH0oklqtiX9GXDt?=
 =?us-ascii?Q?XgbvfcAv5w/rY4pY3jataunAhjBVv5XgZLjeQAbTE2SXESBc2I9M1tsaagjw?=
 =?us-ascii?Q?XMU71VMX8a8C24bROcwryhgQFudWpUI6BzPllurLkovqIAUPs0LEHgbvCYmh?=
 =?us-ascii?Q?e9nzNpFuI3FQrV7K5jtPrVMs+fpTd0JbHtdtN1gk1VAP6cbH8ZIa2+g7a9bE?=
 =?us-ascii?Q?bjLLsRMQmPLMgiN4ub+EQR+b9xUfc+QbwwCT5I6PKCkW2S8KAN9mirjT4GpF?=
 =?us-ascii?Q?S6Q0xNLqFqlppS8GQphfS/XlxImjY5OTYnKRx9punFziQLtTfJmQVmVK37V5?=
 =?us-ascii?Q?MuG96tZG9RP8uXWL0HESieb9E59p7wQDhVE6Gqlhm9FWo3PojnC0mMj2P6AG?=
 =?us-ascii?Q?4i1QLFba4QOEDEkEsILF8qBb+d1GdvO0/jJoiBQWzpx/eznvCNn9AMCWWw2b?=
 =?us-ascii?Q?lFuGk3I655q/kAVFN8dc+utVxohGMWJhNX0J9s6CesHSiE2HcYn+C9UNe1x7?=
 =?us-ascii?Q?AKv44ZSVf4wkx0a9LjvZ3RW3Sm+7wq4eHnrWaMzCkT9hHhWR6mdseU/rZ+Nt?=
 =?us-ascii?Q?VPMAs3GACATk5srgU0r5iPLvCoEA6w2oszWYH2t/AcUvf+ntC0HjIApAi9vd?=
 =?us-ascii?Q?khuQT4XT9/smZTkKkK+nXbKxM71/7CYfjv9Qt1TdljpT1hl9sW3bKiqa9ghv?=
 =?us-ascii?Q?H5lWmLB28YB0kQ8BkaKv8ittMBT9k/lLTKtSNIqzlEDJh+yIs/cqu0PdlpMP?=
 =?us-ascii?Q?sacB+fsWfmxM0W0AgjGyrjN2yqc/1mPUeXXYh8IPzPyvD1vhAv9Ox9Wd/5Ys?=
 =?us-ascii?Q?tVTi7/w3YplyB902ptt603OWai1HSZxYAJTeuvviofvgLWOjBYkayK4OvK5E?=
 =?us-ascii?Q?AyfxykuUWjjfrzrMu2wR7DUOBp/iAlTNBv38lqM/A6WGPEV5DuUyCf0rjYO5?=
 =?us-ascii?Q?LkjJBBhTN2OzM6jcRUW/A+zRBPh4sxgjcrV9LMaJhVpWml2r4MaDOjFaWAYL?=
 =?us-ascii?Q?KA6Akjjnqv0Lo5wMOJ7/MLec0Ccd2fLip4QkNiu6mlDdcrtwft/+5Nca32yD?=
 =?us-ascii?Q?eoMecI/WPDVJ/ool2+Wk/LrQOe8m7uGiTYxihjR+H047Qz2dGMF3w0nJQd4S?=
 =?us-ascii?Q?HsL5/qoZLoLxh+17UG4VJCkClh2HD8WR9vXMnVbmTQYVPR3yjz8/G4ZWg6NH?=
 =?us-ascii?Q?8KqrgTa7F+gXw2Sm/NItKEJOCXUnNLUpyK2Lj1i39pDRdExgjXn35Q8kFcTT?=
 =?us-ascii?Q?7VsDZuQMlhN2SOC92IYAfIfCi4HHq8WxO7I2Jv7xU0ARk4RIUaN+ZU4QvBHj?=
 =?us-ascii?Q?Ta3cfK1Ot3N2uABQYNNCKPxZzRVn+RYuK+dzRlxt6oLLEJSqYtFev6Mt6mV9?=
 =?us-ascii?Q?J+RzU0Cns2fdLTboPThfJdLpap+SYW1tHkiwUO1kqGo7ZWb2tT+06F8Ov8Lk?=
 =?us-ascii?Q?doXdPJ1Oel3KX7l+yMPWUHddsMJ7/mOE3503?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?T8TMadYatGYhbb/s18dPL5DbZg9OqxBHXspf1Wqh9HpHklmfH2uXZfpa8ZM+?=
 =?us-ascii?Q?qpLwuhR0y6KOsMm6/ipvZ2R4z/1waES3Ye4eKndv8IWE5TtDR/xoOp570PqL?=
 =?us-ascii?Q?93LGcsl/ljppVSs/A9vCU9IWrt43pS6msxMM0l54fSlVCFEHDmsPTGutaNqO?=
 =?us-ascii?Q?f6cKwtfAsg30KRa1E9fYCbXNVbS7sCrq9b0lpcHyxznzf0w63tC8VUrIhzJG?=
 =?us-ascii?Q?SxUdhwtrLcbN/UPMxBBA/KyzskRuROxtkH8tl4TT2NOMlCMSsIiaxOAg1w+w?=
 =?us-ascii?Q?tlsshI/kc3XvMuSJhYjvi+12LXxqx5DmTvl/DzytzF8nbwybn44/zr9Jk6Bj?=
 =?us-ascii?Q?VYT+OZNR3nHnLPUKukNBcwMXb6DWVoEqFOS3DMrXiV/wx+CHThlt5BeTqm0R?=
 =?us-ascii?Q?n8Gx7s6i7B1gZtuzJCnptxtqqOYh5Fhepg/rEr3ceiHEqjZVYHzv9OLXxzyY?=
 =?us-ascii?Q?WojGHVtgR5Qyh9AV0xpd4EnvUeF1B7E1x9FAnJB5avZjLJ0NBPWzh/u3lzMi?=
 =?us-ascii?Q?Q2aJ0fhcpwiERH5o5ialOVGwUdHGfJbRsKeix2hHN7Gh4KKiqTEQSo2itY+y?=
 =?us-ascii?Q?Kuo+jNyOXhOiRBHURcqhMqTkm4bawGkHvJUKWSTnmrHorzjEMIvrFsGxGnF3?=
 =?us-ascii?Q?KORnCOArmwc/7i1ox7hJYhnvVH+X9GX4MV62hhdhGEpy9WCH8VyyOhBgo1DD?=
 =?us-ascii?Q?TH841j0XJBC3HLt8G8wUFB68g67efRKYf+Ul4r5R8hvGf8R2UuTJEnjH+kst?=
 =?us-ascii?Q?m7sR6mAzcTaFjql/7TWfkqSc8mQzvd8+e6X2G5U1s12f6PbBJ28KmuTJ7yl3?=
 =?us-ascii?Q?SzPEmJ3JzX7XVpgGJFBvCjgHw3Td3PR9X+0322vaO0dti0fe/EQrYhuUHA58?=
 =?us-ascii?Q?5uSj+S+M6foyivOqj4iH4NL4C+FvI+lHNxNzJW6Dn+19UdVTZEZVymgMkb34?=
 =?us-ascii?Q?edZQDuDVCKC0afVsYjrqjS/eNiBXRg2LLRBpmhNGz5+f5T4tU6h+HGpsyuvd?=
 =?us-ascii?Q?uMgTQWthojZIn+vNpW3KMm6A3g7koQ85viDgRYOxrI7kicjN9P7FfWMsulmA?=
 =?us-ascii?Q?0rp4hqWXVkyS2zgehrhyaeN/Rps+jRsdBS+dfxbWAsjM82y994/vpWUMEvmt?=
 =?us-ascii?Q?q81DiWbNCfm0Nr+G/aUJXHe9zSKfNzLlVeg816sMSGGRPAGtmfl2oqU1nSod?=
 =?us-ascii?Q?hovBkXVgyn7Ux0ozBcFgsWoPGpc83cY8AQAETJvg0Rp2jlmeHuLL+MvNHum1?=
 =?us-ascii?Q?sswBvxdnUfSoh4tOcetCGg3qH4HbSBM2LAwJHtbBhL0H10JH8h5yWVqFffXP?=
 =?us-ascii?Q?y/vutg8wuqplU6QdZu+5Q1cI09DwIM7HnlX4ZtHkDmjJLH/Dxzl/100nrr/4?=
 =?us-ascii?Q?m7s5PFd1rJqv2GNa8dvK+b0sg5WtFetktzI07ZMh+kynvQUf1jEyJlBLo1Io?=
 =?us-ascii?Q?JKAglbiErc5VEUhxY4zA8x7It7mAjq3GpW4KteIwTHfCZFu3LQwg8O3KSVa6?=
 =?us-ascii?Q?qRKORT1jdimA03GdvJKmiwEZ9R5zSzIHl0zZI3l/SGh2EKQq7Smq5Dc1E+w7?=
 =?us-ascii?Q?KyqkTIy1vALJ4DTA214VTjJiszQMvkAcPmJDjXkZUW/CECEMR2rkYp9GH7ED?=
 =?us-ascii?Q?m1aGpHgF94vmTmQZQJiAVWXVgkj6/PH8P/DVCfr2lGJAJ7TI2RQKjEmmimN7?=
 =?us-ascii?Q?qAvESt0IcqykDcGUBEoKoNVBxMqUVwatFxoEt1p/J8zZRW0PiEOQy8uFTYhH?=
 =?us-ascii?Q?BOk6mV841jc9eTbLmLiCi1arVL4ugR8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 571d2f79-6343-48fb-119a-08de47ae06fd
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:30.1125
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OSZCoUkBAbtkbpYcGNzuLyzGQ9IcEnsNOLODvCWpLhFpD8CBO0+cQ/AI09nv6zPwR4j6knJXdIBrEdxmaFla4MoTQ03D6nCEixxQIiXjbDk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=ccjfb3DM c=1 sm=1 tr=0 ts=6953dec2 cx=c_pps
 a=N8fQrVaeAljVkTo8kKJ49A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jmWgeBySreYrfzyKUjkA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: nhBE5m79tmt29EAt4pNKzCf44ZIjcR3t
X-Proofpoint-ORIG-GUID: N5be9fGvMbNCuHUsmuY3fQnAhG4IRNZA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX+Yq42cluJYg1
 EX9tmnbs7jjSIxNaoTz9vG6/8ovRlHguQNpESIZ5bg1Rm9xci9uQZf4yoIHzQ6SAQAOsnuU1G65
 4T64p7JHB+oztg+gtdE7FC31INke3XTvkslBgvQSII03FqMXO8/qAa3ryQ9BbqWdNiNhA62cAED
 yUuABYmo3GxQZRkXwRm/e1BgF0w290NQMW14OucSV4aZMxbBCshF42RgZVV/a9V0DFJsuCb5X4r
 fkwYOI/3tCqATtbX9J96SB6yGtaiW1mV8TbbQ82fFIY9KAXPE2JxJIArvM/ek4c2mgSE5Wl8X5M
 77VlFW2IqUtRQ54zAhn01oqyZRsxPfr03TgcQrIsIt/oTlyTG7Ebij1vgyn8zAeo8oDlkTfvNMK
 hMwStUYrSbBTAYSveDlhHn9wtTVKY2IR5hBFKSg28Lb47iDV9sNCCzbd4237cLRxZG77McgJc6y
 pIu597O+OwW6YOSXw3g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228672

From: Harish Sadineni <Harish.Sadineni@windriver.com>

Add initial support for building the Linux kernel with Rust enabled:

- Update `linux-yocto_${PV}.bb` to:
  - Append `features/kernel-rust/kernel-rust.scc` to `KERNEL_FEATURES`.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/linux-yocto_6.16.bb | 1 +
 meta/recipes-kernel/linux/linux-yocto_6.18.bb | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/recipes-kernel/linux/linux-yocto_6.16.bb b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
index 408f14b451..e468fdc0d7 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.16.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.16.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.18.bb b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
index 562a997020..0b9e5279ee 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.18.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.18.bb
@@ -77,3 +77,4 @@ KERNEL_FEATURES:append:powerpc64le = " arch/powerpc/powerpc-debug.scc"
 # Check again during next major version upgrade
 KERNEL_FEATURES:remove:riscv32 = "features/debug/debug-kernel.scc"
 INSANE_SKIP:kernel-vmlinux:qemuppc64 = "textrel"
+KERNEL_FEATURES:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', ' features/kernel-rust/kernel-rust.scc', '', d)}"
-- 
2.49.0


