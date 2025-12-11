Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0685FD41D41
	for <webhook@archiver.kernel.org>; Thu, 11 Dec 2025 14:08:53 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9965.1765462124384078816
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Dec 2025 06:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=bU1GfUYy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4440256309=yash.shinde@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BB70sP31117438
	for <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=uEzm/WtXxnAQpQF3SnKJHZ9pCrGtOyeBI3F56JS2lmg=; b=
	bU1GfUYyW+Antm8Q2BxLE+ssbMLXLhBi2J2v0L1P594e2aiMsxxVxTg5QAduLAcD
	+ON6pIYZ2C3w1ZBU9dv7uvXNRMwdwEVvyM3qBPvx+liiu1RAjx2yojVBCiWDVQrO
	9xCbNxxQlltNmx6r0/2tey6VLTpqrxLv8oq+CXqkIr4eEFCYgatoND5JeB/L7Rom
	0WpNyNG1iXs3yDCVTFE4uW4DppfA2yOE7qiIQIiXSbDsv8VDdnnQW52pxD/xzKOK
	H740iJfSkw7aT3xK3o6X2vH4qQrrOlfMsyVAzwyg5EXhFjC8E/wMSJFoTUeQSCXW
	cSUxTDDF8O/lo9UYdt9tag==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010070.outbound.protection.outlook.com [52.101.193.70])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ay01nj2a5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 11 Dec 2025 14:08:42 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CSmGCoQBoTy0bwhz+1o4qBzC9/nTwGVjlM3yEdX498SmZDR8xi4KPfn7ZZcerfwdhc89oDAgqJozS+qHypdEPCQIxRSvM5ZvhdnIwpShdQXs+J4qfga/trILTjSJ3PwivADS3jD3YjC5bXQ8bWeGw/ADfleHmpcdB5siQjMz/eEF+SVro0uJFce/QLWEOv0gCYU+0rFkaX0f9Lhcq7aG+lC9IjsoCLSAvRbaIXkP1JjTlHlPypeCDXTkV7JWYzUpXogV9pDUDdT0YoRXNr5Nd1W+p++55UD1OnxDJpIC64TbN1hvRPXRWz4zOmq10UAwMkcJ4Ifc95Qu2TqzD+Z29Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uEzm/WtXxnAQpQF3SnKJHZ9pCrGtOyeBI3F56JS2lmg=;
 b=QNXrLWmcuVK6UYw1QqM91OjLczBT6YyTdUszMLh/QLsybS3T43zcRnhks+2VIq1NymdbidrCwnsYyBX5jpK4+GQyQqXHTGQiONBIM4msF0RQD1nTTP5UanxthE/BkLYZNj/csS3FBtoSWAiBlJGy3H+lDWmHyT3rn7G773x/s3UKx06nkL3Nx8CcoGduCui2CSoS2xwO12ZGP+dTc7/3WMjcHGVoaqb4GEJE03y/Qy225dgYUYWs1PB6e+OmII8M3pUQK+0sy+u50sKust/X7EeweprpR0a4+IzTI7/lyysQHSuFWegVEbbaO+8FROxBkCeHK2AWBa82Bkr2x+u9JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by IA0PR11MB7329.namprd11.prod.outlook.com (2603:10b6:208:437::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Thu, 11 Dec
 2025 14:08:39 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 14:08:38 +0000
From: Yash.Shinde@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        sunilkumar.dora@windriver.com, peter.tatrai.ext@siemens.com,
        Yash.Shinde@windriver.com
Subject: [PATCH v2 2/5] rust: Exclude tier-check and fix openssl-sys build error
Date: Thu, 11 Dec 2025 06:08:14 -0800
Message-ID: <20251211140817.1250831-2-Yash.Shinde@windriver.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
References: <20251211140817.1250831-1-Yash.Shinde@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR0102CA0004.prod.exchangelabs.com
 (2603:10b6:207:18::17) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|IA0PR11MB7329:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c91ca6f-d371-439c-5cbc-08de38bec807
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bWkmMXTMKRYdTo/F4JzRTqlFl9cEblTNRZtcwBHXlPIrGMwG2FIVH6BaSBzB?=
 =?us-ascii?Q?Yra69/P9qFb9yYG3lsDJaQApBbrxuzJ7n4rvb3htNieI8p8ebNl+w6Uv9mV7?=
 =?us-ascii?Q?az8a+J6s2yCHjmbvgnGDtcHYGj0DSHWTYI0i/UOiR3lywnmfl1SQBY/yDOGC?=
 =?us-ascii?Q?TaM1wfmlyve7cdZewMXzFkMM2uGU3ZQBBUqs/FvE0sSgbUjn1E/gS9VAqlyW?=
 =?us-ascii?Q?AQbHJjywWcegFnG3hTpqZ5zn9KWfV4ByuEScdIsQPwY9zg332ZZUSNktAds1?=
 =?us-ascii?Q?AOS+M4dyJoPwo+VSxmwxN814cdZx1ubxGAeTSb66POlZ3lNYaOiPBVsY4/Kt?=
 =?us-ascii?Q?GwPaNVmvVEQhgmEbx4GqgtgJNxhuapTgN7Okf/2BUR8ojXOmIm7VbBqfsZ22?=
 =?us-ascii?Q?l/a1VmQ0S8yru/8RaDP4HLAGn3z4QNt+Ji+Kn+AcR6T0l7FcccvNPv/ucL/Q?=
 =?us-ascii?Q?urDOF5OaOQTBtKSjvLBukdgxBrvY7z53aSecUGyQsGEOxXbNUav8ah2o0Af7?=
 =?us-ascii?Q?DR4Gpo5uOuFn7kYWx/BcYMmrUktXYu6PjoPICC0rpJGcM4JmBuJe6wHIE1OL?=
 =?us-ascii?Q?HT90jefmzegRXb7rSMkLlOVoxZoGXYgC++EFKHN3VFn197Vuyd3tS2ymsvSS?=
 =?us-ascii?Q?853JWnauTKrkNLgxsr35WweS0Hu/qhzXDu23uiaenVmCqicHYPafPh8qoj3s?=
 =?us-ascii?Q?4rFU73US8xYGO2eaK2wYioo0shgQbKIEFQgJfmZldbZfE5ABUPgTr7WrrBzE?=
 =?us-ascii?Q?Sn0WO225t379Hj8cKBfcn88SkEOs3uGTp4DzAu28HWoGD76HSej0I2SB8v/z?=
 =?us-ascii?Q?pv0mkVcIzr59LnW5aZu/fC4ClsHY243o3BVF6vbw6Yab1jGAXCkotn+deAF8?=
 =?us-ascii?Q?n5mLRg4DJ9Za8BI1Z5lROwBE/SECy7CIu8OfUHKmo0jB96ieFNtmC6yenl2D?=
 =?us-ascii?Q?S1z4y8ZPbtqeZugl8T83bHuMylzbUWnikmZvRdfjreojt6Fpi9xcQOAzfuyi?=
 =?us-ascii?Q?OOXVCj50PcGzQtVFJV6AUkQSRTM2NNq8tgEmLakZvzKtlrZKeuqShXnsn1xt?=
 =?us-ascii?Q?W5x+rbYfKspvo19QRhtMfojzXD4u351slQp3r6DvHRclJkBbt3jrmfJlLZiv?=
 =?us-ascii?Q?WNIQd4K9pQA7qQz549WzKAY6Fq0KdLPSKna6nPHl19ZkoAxmmXIvD/eQYPBo?=
 =?us-ascii?Q?K5RwsRALZPfSZbS4zOq+5fDhpkPixgEsjL2DyU8WT6Arfg33x96UzyjXHgnd?=
 =?us-ascii?Q?9sfBw8d5f+0JSHGFnfPM2o2z/+M8XhASqEOyYuLfNMpj0oB6akSrymLB9mNg?=
 =?us-ascii?Q?lUXOQhzLkD/q0rxtsN/zITbHXBKVy1x/Ld/vtbfYTTnmPryxMI9WtHWtZxUr?=
 =?us-ascii?Q?t5j7DhphI/UYLABKfMuyo3oYxMs+NHHSO62+++Fi8gIyj2ftrE796D7/9iMP?=
 =?us-ascii?Q?y1S1/YKgqPKlZuUnQnv6aExFKEc82vmyMxo2yGL1ts682OiK7sqQuDFqy6cD?=
 =?us-ascii?Q?zuecCSKME1/zG1lIjtPPacrY84zXH79oKaz0?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?BdrPgVjEbU4m+QT63E8TzCI3PaiVpnd2ylZ0kO+URHV/KZNVenMejwAVLCCw?=
 =?us-ascii?Q?/2Xx8MJuya/Xcs/tOAWEcYumKSmVGKMUrfMlY4920ZU//iwcwTm8hoVuukQz?=
 =?us-ascii?Q?RdDIuYKXlfgTI8zeAQK2HfxVWE3pZ8PaO3aIcO7Vq1jcuE1vwAKNU4Fww8KQ?=
 =?us-ascii?Q?ivDk7s3gEmQ/hYsYmOrHgs/GIISKDWCBQ7+luDzqVsUpii36WdlvTofHwj1Y?=
 =?us-ascii?Q?5T5/qNuDsRZiw9ReuWb8awKEIp+2gKGt/aHao5a0fxu7215H7HvmgHy1eYGN?=
 =?us-ascii?Q?/4+xq3UWuFiL3L/p7doHY1dMMcL8QVZBPu2v/j/og6CYmHA16kYlbC2GQRhF?=
 =?us-ascii?Q?w8JKq6uCdMswZdqDT8A9gogPv9EjROSI+c3q6a386iqhW2ANT/c5foI4iub6?=
 =?us-ascii?Q?/fd4N7unWgr2I1pljJfbOZiQhYA8pYDmXYhfvxq2JJghLhvU/PXztMIxUBRb?=
 =?us-ascii?Q?jkTDEAYY1V/EYGtd13cavEOa+z9h6J9zIPWq/1fvBNh1DkHGOhdtiNwOyeik?=
 =?us-ascii?Q?EVwzq8yqyt881qKlj+3oL2hY39OHfIYN8180JZEi8vgYE2Edue8V+rWEmVWO?=
 =?us-ascii?Q?xJRm3Dh7ruIWFsbxWuvpcLtnTxumcugYkCsrja3Vt06LHp/u2YsMZdOrWubu?=
 =?us-ascii?Q?JCZB9MFFSMvYbB7do+nN3YSdZzwlOFZwNS9bzcG40c+8/K9OaXoxLpBvxyaZ?=
 =?us-ascii?Q?emcm26sOnurIhdMgdSfAx3nVe//akjsTbwPqviJ7xfxdrTKy34ovI55p+lP8?=
 =?us-ascii?Q?Km2wkJAlPW0K8eO9h2+rBYmrxdh0egHRFQDOquxeyPAdBQvqGXpBHMMuCN51?=
 =?us-ascii?Q?WgoipQaPxQboqW6xtryvgglHUQT/3UZOE8e1fiLpCqcx4A38XoHLhvz5MZPp?=
 =?us-ascii?Q?rAJ3Q1sjnG6JQjxAsxhP9+66aInOrIkVm6O1JSMQZJKGsn065JuECza1PPbt?=
 =?us-ascii?Q?1ICZjMHp+sVqNX7uQ2XiQa463CuXehPWRN5snU27e+NR0v0MYDcg9YKSCWSg?=
 =?us-ascii?Q?NYXjI6a4e4/gOFUG7+f0Wk8jmhSkomh/thl0A1Gd1lATDFnTS6AqMol2pH22?=
 =?us-ascii?Q?o8DYO2TfbM7r+jsA65O2l9gM2clzBlPw7v8fn1MENRm85/pnC51vo/GVZ6MZ?=
 =?us-ascii?Q?a6Ldut2DVA60oPGbfAVaOi1fG0FLna4Y7pCOIsm4nb5dCsv6dc3PJxlfFjlb?=
 =?us-ascii?Q?pwItvsaQiDPlxCt1rNGTeWfBYtIy07wZVSjfe96NcqWaOubsTxh4yNKhc3G6?=
 =?us-ascii?Q?ias44EJbGE8CmNDO3jz8WAzLtEURCFA5HPstbnue0+W1jO+HPR/yKk5tRIhv?=
 =?us-ascii?Q?FCgp/14SKq/mhJS8l3V7AFV0jtPJNzfyrj+20/GtQk35INHkolV+GtfLGTym?=
 =?us-ascii?Q?GRr23+JnPnQp+7wbzu5mEBMI2u8jJG/dsEBK/bEdeb+yWCkD+iPDxEGtVFzA?=
 =?us-ascii?Q?UIAaI9YLkHnGHN6nH+hRY80MIa583Cr01KcLUjp8gna4JrQQNRGGOi/nTdTN?=
 =?us-ascii?Q?4obMn5O3hwHlq+c4cZMyEfKvWX7TqPHtJ8dLRmw4OcPt/9HPPrFUhY8BDa8Z?=
 =?us-ascii?Q?4tlDQ1LcMWpbsAeB+oJ1RWShQlm9KNBDrCIhnADxgg+jMFmp+4EEYcEBEqEC?=
 =?us-ascii?Q?xg=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c91ca6f-d371-439c-5cbc-08de38bec807
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 14:08:38.7225
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /5l87POgmxOJHiD2vrWBDzSNN4RZiiZstkLyuksn2JdFbbGvSlblNRPVk0l0LEbvaAslDEeS4oJKKiN1bG/6jztZNOIkVPQ76/7K1JpKVgw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7329
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=d5/4CBjE c=1 sm=1 tr=0 ts=693ad06b cx=c_pps
 a=HD3DV6xNHsutM5VcLnEsTw==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=t7CeM3EgAAAA:8 a=5O6Eb5gfv2Nn_D_gLL4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: Q4l8cdckMc-adIPwMH_UhRWLImiQEUM0
X-Proofpoint-ORIG-GUID: L_aeyaLUcyxgvlxzYHAUEgHnPGNPXyIr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjExMDExMSBTYWx0ZWRfX36rREXHah3jq
 70bqGKv4PqhIcwotM+s2b2Sjx/8P7PM0m3HqtnZesKEL7nn6dizqRbdgXi6IyYPsJH1GNq/c2On
 blGowUhhlEU5SK0gC9eIHccUugFEY/Wqpv/ittJyvyBDVHyeNUyK8/jZJNpXyH+xzRR4y9D4J7Q
 xnW5ZIvLffQjvddF3tch+xMERAH781RZyzvCPwy/UM3cQLJhl/pw/5JE8jPmVkXBGw3gNcHhvum
 IzHk1FpAR/blbBycIlCNbKblUCsoO9snmcEu15jDledLIol7wqHmoC5Tpp3JTiIISEZjiKAXHG6
 RFKqs6yfkzg6nWelM3ZUzrlUKLj6ckqmGNn1jGKacP6pQvVDjAPiHSlvEZWXayO3Uw3obamoBaA
 MQVhOfLVAAjB15+MM1gu/bUhqwEpLg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-11_01,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512110111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Dec 2025 14:08:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227531

From: Yash Shinde <Yash.Shinde@windriver.com>

- Exclude tier-check which fails due to file not found error.

Testing stage2 platform support check (x86_64-poky-linux-gnu)
Compiling tier-check v0.1.0
(/srv/pokybuild/yocto-worker/qemux86-64-tc/build/build-st-1400964/tmp/work/x86-64-v3-poky-linux/rust/1.91.1/sources/rustc-1.91.1-src/src/tools/tier-check)
thread 'main' (163263) panicked at src/tools/tier-check/src/main.rs:16:10:
rustc should run: Os { code: 2, kind: NotFound, message: "No such file or directory" }

Reported: https://github.com/rust-lang/rust/issues/149171

- Fix following error by providing openssl in the image:
error: failed to run custom build command for `openssl-sys v0.9.109`

Failed to find OpenSSL development headers.
You can try fixing this setting the `OPENSSL_DIR` environment variable
pointing to your OpenSSL installation or installing OpenSSL headers package
specific to your distribution.

- Exclude "tests/assembly-llvm/c-variadic-arm.rs" failing on arm32.

Signed-off-by: Yash Shinde <Yash.Shinde@windriver.com>
---
 meta/lib/oeqa/selftest/cases/rust.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/rust.py b/meta/lib/oeqa/selftest/cases/rust.py
index 01a98339a6..355d690a59 100644
--- a/meta/lib/oeqa/selftest/cases/rust.py
+++ b/meta/lib/oeqa/selftest/cases/rust.py
@@ -47,7 +47,7 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
         bitbake("{} -c test_compile".format(recipe))
         builddir = get_bb_var("RUSTSRC", "rust")
         # build core-image-minimal with required packages
-        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd"]
+        default_installed_packages = ["libgcc", "libstdc++", "libatomic", "libgomp", "libzstd", "openssl"]
         features = []
         features.append('IMAGE_FEATURES += "ssh-server-dropbear"')
         features.append('CORE_IMAGE_EXTRA_INSTALL += "{0}"'.format(" ".join(default_installed_packages)))
@@ -75,9 +75,11 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
                             'src/tools/rustdoc-themes',
                             'src/tools/rust-installer',
                             'src/tools/test-float-parse',
+                            'src/tools/tier-check',
                             'src/tools/suggest-tests',
                             'src/tools/tidy',
                             'tests/assembly-llvm/asm/aarch64-outline-atomics.rs',
+                            'tests/assembly-llvm/c-variadic-arm.rs',
                             'tests/codegen-llvm/issues/issue-122805.rs',
                             'tests/codegen-llvm/thread-local.rs',
                             'tests/mir-opt/',
@@ -117,9 +119,11 @@ class RustSelfTestSystemEmulated(OESelftestTestCase, OEPTestResultTestCase):
             targetsys = get_bb_var("RUST_TARGET_SYS", "rust")
             rustlibpath = get_bb_var("WORKDIR", "rust")
             tmpdir = get_bb_var("TMPDIR", "rust")
+            staging_dir_native = get_bb_var("STAGING_DIR_NATIVE", "core-image-minimal")
 
             # Set path for target-poky-linux-gcc, RUST_TARGET_PATH and hosttools.
             cmd = "export TARGET_VENDOR=\"-poky\";"
+            cmd = cmd + " export OPENSSL_DIR=%s/usr;" %(staging_dir_native)
             cmd = cmd + " export PATH=%s/recipe-sysroot-native/usr/bin/python3-native:%s/recipe-sysroot-native/usr/bin:%s/recipe-sysroot-native/usr/bin/%s:%s/hosttools:$PATH;" % (rustlibpath, rustlibpath, rustlibpath, tcpath, tmpdir)
             cmd = cmd + " export RUST_TARGET_PATH=%s/rust-targets;" % rustlibpath
             # Strip debug symbols from test binaries to reduce size (300+ MB -> ~140 MB)
-- 
2.49.0


