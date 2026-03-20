Return-Path: <Qi.Chen@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50773109317E
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:10:41 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7100.1773990639465839624
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Fu5ru2o/;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7539c51d7b=qi.chen@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62K6X4NI736683
	for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:10:39 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=TaTKop4hAmyYWsrUT7eKCP+yp8MtjsB2t3+nN6CP+8I=; b=Fu5ru2o/EP3Y
	2VXhP1mW8aKY49v8ADfPnBchqmyJ/wgFGuSnZXm+8ejVyOzZ0raAjFpTza5w5T/0
	3MiUOCoMklT6MOF2w1VPOuwh535G52d2f/D/Jz9UNSPZleVg5zg8FJVFNeIvP35e
	azYWLQw3tEbKf4cxGkyLFk109VyV3uzInJrF2YTL86niOCC9pQdBEzPmxuT4qhO8
	Zg8HyxK7TuNyiabCVl3a1IcIqk/OAIR1k38YEOtdBrTYb379q3uJ6qDPf2NLuSyU
	Fl+yGKiS60jNn0n1+drHD6O0M7IyYsKmt8Od8zEl5m7cmVUkoFWMfnXNjZ9kvcxl
	x+YYgEeJRw==
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012040.outbound.protection.outlook.com [40.93.195.40])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4cw2y17mtb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 20 Mar 2026 00:10:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=enj7ExFPo8PuM4taVn4JTmcn8AXpk0E++OB3soAOnJqZlWF+fLQ8ITDSQCPuvqQlRPHFcvajvbNA/QTwtSwUTaKtatEisoVC6edUAt4i+lB7qZFczVMJ25UuFSdK7T49CQxFISuR6LJBJ3eD8648Fi/hCDuyRzIYZ6UprAFqdUJWI+2kzZ7jrw/PuWach+jnYwmqCfBf/s/GaiSuQOr22xY05lF7MN16RQ3R4SUMFd5gOxjhtxzMLgWOSmuoJE6oOAdqN8qAmL041go9p35rrVnOlxOpRZdWjjZrRtf/wk/zAMlX/ghNB9JryMPuI5k5s4YG8ig92ECXumB/N7XWpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TaTKop4hAmyYWsrUT7eKCP+yp8MtjsB2t3+nN6CP+8I=;
 b=GKQqmW7pCu4/317yrBGdTA1Krl5nktHJnpoWNY6kz4ZkQiVt/gct00GWmFeEuMtEuLuvGOw6ktKJZRtvMJL2GduRl7anLUO7I7u5A8czkPQHdoSs0Z7KW9kfuAaqsCnh6KLgRDmJ1Kd13GPqQbXSJY+YJGkWIyH0h7bAH8Km29bbEI/FElf2GdT9X2e3vxs4l12q8njZASh7Wvu4myR26zUYuORkrMSVpgCenqnFfdoCDFDkoSdJ5/U4i0EYoYyI3DhUm/1dvH/GHxAO84E8TsYHDzhj2bKNkqyxyM+zceZ0LORSom264NprbAb0aBLErxzSNdSkJSrI8ZiMgX7D0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5602.namprd11.prod.outlook.com (2603:10b6:303:13a::5)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.9; Fri, 20 Mar
 2026 07:10:36 +0000
Received: from CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62]) by CO6PR11MB5602.namprd11.prod.outlook.com
 ([fe80::5ad6:8f90:b01d:2c62%4]) with mapi id 15.20.9745.012; Fri, 20 Mar 2026
 07:10:36 +0000
Message-ID: <e281940d-e275-4257-80c8-f534d688cbe6@windriver.com>
Date: Fri, 20 Mar 2026 15:10:31 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][PATCH] fixup! runqemu: restore support to run inside
 SDK
To: Paul Barker <paul@pbarker.dev>, openembedded-core@lists.openembedded.org
References: <20260319043625.3641522-1-Qi.Chen@windriver.com>
 <e1af42a047ada9dd736c4382b0a7b23fe15e14ac.camel@pbarker.dev>
Content-Language: en-US
From: ChenQi <Qi.Chen@windriver.com>
In-Reply-To: <e1af42a047ada9dd736c4382b0a7b23fe15e14ac.camel@pbarker.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SEWP216CA0132.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c0::18) To CO6PR11MB5602.namprd11.prod.outlook.com
 (2603:10b6:303:13a::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR11MB5602:EE_|IA3PR11MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: c9d452d6-486e-482a-c4e7-08de864fc88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	SfroNfnPGM38vz82AeJXx+pk6gsSPYawL5GM8rbwPRSqPm2uu/aIur8uYxavyM71/d0ttidLyVfJfOstrK9qeM6uI6uMv5ZnffusSQuaTnkZJqGPAnImYePe54iDxLEcfGaoA6phMPdh7MMAUar6neqit0wmeQmddxR2qmUgB7o6l99TuMfRYTw7AhHDNC7NZzqrd9WVyTWkKAJfg81RH/g+yXHIUghVLbudSADSKxfmpJyg940+745K9L6elixfHy+VMOCEKsIL5+UbOcmtaoyczW331/24smT31wR4Pf2V3T61YJwuSUaYzhM5uKlXpqMj6TbIpYK0vD2JKX0B28HOfNo73Wvo447gJkygJ1wgFcMnn9U5B9XpRt7I1t5d/HVYWHiz+yj3KSf6ilLTP46ziqIx5Ehupd7slVi4ThPIQSHtHOhoS/3OwY5HdyI36iR8XKldAOmpZkcrcOqfU8BxNfGiD9GUH7XNaii41jAHexuDSEfR19nPoC5yv4bYbOXtzsVnoBh754OofDX442QaWfPGq0EG+g/H/8bnAbjHqB2yVVQtQtAfF8J/5Yz5cg/pibVemP+Ow3y1SVCBSoeO7ly3rC4dUFfTo1ZGFbdK6aaAgldcPWnDCMC422FLDprixW293N8TijyEhFpFeg6I9UBYkT9rivp6rWHrKNlk2hrxsqdnrkiNu5RFJlv2YG+bseTN/GYDeb4Z/xoSjNM+YbkKRYbWanOcY/vtAZ4=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5602.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?b2JtaG84RjZaelJBVFRQWjdVellWZkQyNTNEV0dtL1paZTNzM2ZQS0pPYnBn?=
 =?utf-8?B?VWxjd3J5Ym9iWnQ0L2d4bzBXVUZpWHpGVzNndzJna0hGREFvT2g2Rjh2ZjNC?=
 =?utf-8?B?V1FLK1pGdmZlZWF5bVlpbFNmbXdNSFJJSzQrZm16R3hlUVJlQlM0U1l6RlB4?=
 =?utf-8?B?MHc2dCtmajBCZWZkZlo5S0FsWTRFdFRBejB4RHRMSjlGT2YzNittaTRleDJD?=
 =?utf-8?B?M1lreHZpKyt2V0dxZWMyZ1FIRE1vNjQ5eHc2Qys0OGh5eWVJbXB4aTlvd0JS?=
 =?utf-8?B?WjBHamNESE11M1FCdG03bG5Vbm9WN1lxYVpvaURXZ21XTHpzVTZsVkdlNGR0?=
 =?utf-8?B?b3RuVGYxM2pieHZIMC9ITmNUSlBkNy95bVlkOWlxVHpxTWJEWGJiQ0VlM1Zk?=
 =?utf-8?B?QnREbzlCa2M1M0JwTTdBc3BoWW1LUkY1SEEyVk5NS1QyNUo0VkVhZHoweWdo?=
 =?utf-8?B?b0MvVkV6RG1mdVIzeHZ4eVdyTjVnUnprSmJBcGhtWDQrWUJUS2VGckgvR2x1?=
 =?utf-8?B?dnVsT2pLQUxzdTAzbnczbEJ5Uk5YQ3FQaFhqQlEzZVgvYm1MKzRFU3diZUVY?=
 =?utf-8?B?YmpHYlNpdk9nTDZyTzU1R2grdWlOMTlTdkxIdU1TbVdVNloyL1JWSHJpNW1T?=
 =?utf-8?B?TWlrc0pMVHFHNHg2SUNXZkV6VVlWR3RWdCtDS3NFL2lqYjV6WE1wbVM4R1Mw?=
 =?utf-8?B?WXB2U3ZkdHpnWmRKWE0rZlNxQ1U1ZTcvNkhRVGhYL21ORTZFTHd5dUt5Y3RO?=
 =?utf-8?B?T3dDRjRSSHpteFZkb1dIQTlvWVBRdjRCb1VnWUVFSXJ4YlRuZVROZm9hS2NW?=
 =?utf-8?B?ZW85SDZCS0owT2tBY1doUmhhQlBLTW9ndVM5aHV1L0c1VVBpc0V3NUNzd3hq?=
 =?utf-8?B?NlJMczE1MitPemkwaWVkUTVRb2VVeW95UmVXTTNPRVBoQUFVdEFQOWw0WFdh?=
 =?utf-8?B?d24vaVJ4RTNVTndOTGJMWkpITjF3VU5EbXpMYUUzY21qdHBwRzFBb1J1MkQr?=
 =?utf-8?B?aEdXZGg1UG5nQmtLSXM1S1k1bTUxR2REeWlOVVJxZC83c2wxSFlNQVhFbEs4?=
 =?utf-8?B?NXNKNjBoVjNvT3NoRENpS0RVeDMrdVpjQmt3a1QxdUROSmRZQzNPbHZIdlp6?=
 =?utf-8?B?bXQ0NnpDK1pwcUNkallKbTA4UEUxcXRZa1luZ2g4UDhsUDRFUWdkbkNmUGsw?=
 =?utf-8?B?c0tkSGRSckREYlpRcDlTZmhteHBVaHpOR3JvSUhwUVNCdWZDM0RQcDFVaHRw?=
 =?utf-8?B?MDI0TGliYklNVnRkWk14N2IrcXBhRzFUN1pLeWZGWXlONHRpS3hJSm04Y0lC?=
 =?utf-8?B?MzFpRnVlU1hUQ2h2c2xNNWpLZ2lrWWl0MGJ5Yi9mU1VmUHNGRVdWbTc5OCtn?=
 =?utf-8?B?V2ZXcnRyd3VrVnNQT0dJZDFaOXJFc0tKeWdoQ1ZpT0p3MWRBdk9OaTdEUm1Z?=
 =?utf-8?B?bXFHTEpMaVk3N3R4WFMvZDk1cEllc285TVByNVlNZ00wejc4RnhVUVBzM3Q3?=
 =?utf-8?B?NjhGeXpKOUZ2cG5ydGk1aDlYR2hxbitGbkQrTWxOYnljY0dzVUdrbitabUVB?=
 =?utf-8?B?dHhoWmZ5REc4NHM4S2kzN3ZKVjlJSWFKaGNhYllKL2xxSFVEdCtlYkFrUFJL?=
 =?utf-8?B?aURnYU5jeFRDVWFFalZpaE5ObjdNbHlEVVBGTlowY2dXazUwcGFqUmpWcWJN?=
 =?utf-8?B?UmoyNytpWjU4bFFZLzQxRGowQnMxenh5UjFMeFdiT2htVjZoL0REQUZ3QVBM?=
 =?utf-8?B?aFpxNUh2SWJidTN3NlpxcGV1a2R4YVpWQktFQnp6WWxBR1ZBT3BQaFQ4UG5N?=
 =?utf-8?B?dklvVkFMeGdBWXBJNDg4azVvZEIvQnE2K1Y5bVRwYit1ZzVFZ1I4TFJVVCtY?=
 =?utf-8?B?V25taGY3UFUyaDFpZWdYTDRpYnFRdG13TGJWY1VQQXpXckZ4NHpaMVJFOEpQ?=
 =?utf-8?B?SHZ3SHJMKzhNdkZqalFxSE80SGdhYTRKZjM1TmdGa1JGZ3g5OUFGOTZxaDhr?=
 =?utf-8?B?YnJTUS9raUMybnhVYXI0aGhUbUI3ZE80UHJ3Y21NY3JyR0dVN2tjakwwS0tz?=
 =?utf-8?B?SGNLVzRZWlJXbGp2YkxzZmNZRlBhTXVtYm1yaktPcy83ZERSTDVhQ2N2bksz?=
 =?utf-8?B?VFJVckxYWXdWa1hzdnZqRzFTbEVzVDZWbFRtYXZPR0lndUc0a3hLejJZZkcr?=
 =?utf-8?B?UGh4QzlkaVhickQ3c3lINzFCRTlNU0hVM3VPUDRXSiswVFdSRDd6bC9UbWxv?=
 =?utf-8?B?K3ovdFNCRnQzREFFallkdVpKdFAwRjczSHpta1VVVmx1QXkrdmY5d29hUzBG?=
 =?utf-8?B?OXhQTW9sMHkvZHBqRXdCUFhtN25UVW10MCt0VDlvWFlFSlVIUGR4UT09?=
X-Exchange-RoutingPolicyChecked: 
	gmMxKDtmYfbtv448GRGPFkrNX5Ex83t6rHQITJZ2ZcpZ2p5gXLP1wZejMRH3EStY9LcquOApJdwkiiwzrjl5zVYRqyWT4ZHHEBkqUDbPd1BZIvlJrM31POE5zy32myMgEKJFDSgubQRVZZkB2e1Mc5cBkfDaaJa0+QG2W0Vjds96t6oOzGFNhK03E0gPOgxa8CSsoEB66Bqxa45kfrFOlAUMdXSpBbMR83110evQQyBYQ9/MrmggwM4USQl/Tm/U+3efdAns4WsMfA0Ie6CAfsI+TjZ/W9Cm+/xme+yUj6TSIGajZ0ROSroRu6t71DxXiLiClomT3OcjfOriC7MMIg==
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9d452d6-486e-482a-c4e7-08de864fc88c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5602.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2026 07:10:36.0344
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vsKBK9hPyTNOxWZmMg9H+Zor8AdlS2Yv1CsvVBNoREFaXkhaRFa04rIhlwbXMHMGaMnMAhdZelSOJ9vbwVvaOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=CekFJbrl c=1 sm=1 tr=0 ts=69bcf2ee cx=c_pps
 a=zWRuVz0++A3eh/KBGeICZg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=bi6dqmuHe4P4UrxVR6um:22 a=HK-ge7EqtdluswH-FwHe:22
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=AZRkHHjkGcgD9vWM6poA:9 a=QEXdDO2ut3YA:10
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIwMDA1MiBTYWx0ZWRfXy1YSJnSuAwCN
 3gMVibdxVVn6ggq/mtTU908GyqwmA6YDm4AZS6BaLwKA1vxNp+GOh3t59lAB5DG4xJJXzebxOJe
 06hvE+7xm8zimUsutiAB/JGL8iblsRvvLQQ4T75Btq2Y41k05NtL8H8VhedV1VzTwWIPkFUXZgE
 jbH/NAqKUR+mAME2GWpp99hGwS+fynTOEhCO6otyr+A5mHsAlb/ERzFON9yOq1WRqkfKjZFNuhS
 abvluQCWjmzcIHbu57dsNcJOusdukJd2l4+cMemTrECCGFP3l1G2cSUDNOGguSphY+cjuO02mwB
 /u6Lt/zHlTuVpbeBlbCuCzYi2GlU1dhwZ8jJRD7yOY2xqRpgaAKNx8sM//UCCakFseLurKXTFCa
 2A+eNrMh2dYU9qnvoOQ26P+nKSV04noODfRg6+NhM7VpKxOgwcbmHL2vTibmU4oNDP1ghHkEa1N
 LaCbk7/LNypXV4MnfgQ==
X-Proofpoint-GUID: O4P3gVMxoHhdnuP44KFpzB88rUiyIf9s
X-Proofpoint-ORIG-GUID: hdUouuQmqcgxI2yU8JyzKCW__3NL328A
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_04,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603200052
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:10:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233579

On 3/19/26 19:38, Paul Barker wrote:
> On Wed, 2026-03-18 at 21:36 -0700, Chen Qi via lists.openembedded.org
> wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> In previous patch[1], the os.path.exists was accidently called twice.
>> This is incorrect.
>>
>> [1] https://git.openembedded.org/openembedded-core/commit/?id=972155bbee02dd8061fee9c07a40f8e9034b9a3c
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   scripts/runqemu | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/scripts/runqemu b/scripts/runqemu
>> index 5587d47865..d84c6fdc1e 100755
>> --- a/scripts/runqemu
>> +++ b/scripts/runqemu
>> @@ -1005,7 +1005,7 @@ to your build configuration.
>>           # If the STAGING_BINDIR_NATIVE directories from the config file don't exist
>>           # and we're in a sourced OE build directory try to extract the paths
>>           # from `bitbake -e`
>> -        havenative = os.path.exists(os.path.exists(self.get('STAGING_BINDIR_NATIVE')))
>> +        havenative = os.path.exists(self.get('STAGING_BINDIR_NATIVE'))
>>   
>>           if not havenative:
>>               if not self.bitbake_e:
> Hi,
>
> The commit title contains "fixup!", please could you re-send with a
> proper title for this patch?
>
> Best regards,
>
Got it. I'll send out V2 with another title.

Regards,
Qi


