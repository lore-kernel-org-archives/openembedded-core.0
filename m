Return-Path: <Harish.Sadineni@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 655B4EE01FF
	for <webhook@archiver.kernel.org>; Tue, 30 Dec 2025 14:16:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.64847.1767104199801294304
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Dec 2025 06:16:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=F2tizBot;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=54595b53fe=harish.sadineni@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BUDVAQT915372
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=Sffjn1+zSoZ9CuVrsrOZKZra7hZVQSdHPJXhzQjXwRs=; b=
	F2tizBotTOICNVTKToZkAXhnGSM0+BC3WiYLQr+NwxqfUmHpiplNCGsR4rkA+8TJ
	+zOTuHIDeP3vLJdxaDIhAeG7BFOPqhjJE45onDBBWFlGGNzP1UpXR/vkV7TYVb1k
	/mV1qKiZjpyEuWBdXoZbFq5NBB4ALAOxLET6kjmuXuWUiKvTPstgFlRZxfF/SDhI
	/S0Cr1SAqlHeYkEMdyL3pU5zGSMkSl52HlpqDyUv/bf/85jsCjQOMk1B0cVwibzH
	sx2gOncNevfP1Obn0D+9KN42tzpRCz+vaAygt3LsXnKzEhiMtVEapIHI4yyXYaYb
	BMHf3+HwkJmLukHqNnxssw==
Received: from ch1pr05cu001.outbound.protection.outlook.com (mail-northcentralusazon11010027.outbound.protection.outlook.com [52.101.193.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4ba6e4tusw-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 30 Dec 2025 14:16:38 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DnH+B6KTrqijNcqiAxbjFfntrihLZuXqOvZfmEXxC+LO1hCXLn7z//jBRU2RFcPTGtbUD0slc+kEaABQrnAtg3AncqGBYfo7XjzR1en8VBf3nrup79X+u3L5QW+wg0qGo0ZOWnTjoy5+HDSfvK4PZwJLHzfCkJbkFwmmkmnbfhARYlBsESicTV7ZLbrVKVRNrj8m9/PJt7+2FjFq6THQcsSJAOwkCq1eDFcAzK8hiiwGTojjRODphwE01wc2+7mo3NWN31gSbvh9DwreArnBqvI8Lqu5M4y8NS4KlqObsfeZQr1ZZCzipDVXzWM5/vR7bqEsGAZ6auMRDlrKcvkXEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Sffjn1+zSoZ9CuVrsrOZKZra7hZVQSdHPJXhzQjXwRs=;
 b=TK4C3bdcblkVPAlNqkZQjoTBHLAeitt8ixVRg5EbNqdpYtgwQOOOvbQCiTLPeZ4g5VOW26DBbyw3z7MHh8gQOsjiMl7mnhAl5iZ9v7ItCbS0uvXBj2CkadAddWkJa9VYVDoJjNI//yygwkRF+5wr9MIF//Lnhys8hiivCPDtHY+5p826/V+sT4xDScvGmw6Y3S+QLm1lmBVuFy9DX2gc5IFUAF1CaQSU95+jMI5TkY302hC7ETDG6Wo+7ZBXvFJDO3gbe4N+QyLUw5Gg2+yWiNy7S8Zt2vpcbt9CsjuJ+5ngyEQGXUD5hASXmYYa2DV11iFJmbGuuDMpdjjNKtifxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CO6PR11MB5651.namprd11.prod.outlook.com (2603:10b6:5:356::20)
 by SA1PR11MB8859.namprd11.prod.outlook.com (2603:10b6:806:469::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.11; Tue, 30 Dec
 2025 14:16:35 +0000
Received: from CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a]) by CO6PR11MB5651.namprd11.prod.outlook.com
 ([fe80::ff15:8168:45e5:396a%6]) with mapi id 15.20.9456.013; Tue, 30 Dec 2025
 14:16:35 +0000
From: Harish.Sadineni@windriver.com
To: openembedded-core@lists.openembedded.org
Cc: Randy.MacLeod@windriver.com, Sundeep.Kokkonda@windriver.com,
        bruce.ashfield@gmail.com, yoann.congal@smile.fr,
        elmehdi.younes@smile.fr
Subject: [PATCH v2 09/15] kernel-devsrc: copying rust-kernel source to $kerneldir/build
Date: Tue, 30 Dec 2025 06:15:34 -0800
Message-ID: <20251230141540.1974380-10-Harish.Sadineni@windriver.com>
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
X-MS-Office365-Filtering-Correlation-Id: 40a21881-fe4d-4bb3-fb88-08de47ae0a4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|52116014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?gGyVSKklXDIEV7DxZW29F55ZMqCQ/sbjIsl0ku8SwPyKtq7kswhgPA6tKafI?=
 =?us-ascii?Q?25Ga1bvDATs7LQDV6ehe/I6QprfmqVVqGpvdrrX06ymA8byeTGZEqzKM6t7C?=
 =?us-ascii?Q?ivGu7BJCmZ8Tsf3jTD1xrESTVb1hooTVFGqqtsTX9mCeJc0ka08RbnZPeRvX?=
 =?us-ascii?Q?s/2ivK1VcKdCgl5B3LV/Vc6lg5FwtKuSQDLUxSTWkHVvOmR6YPvyQUcXP6k/?=
 =?us-ascii?Q?25gziu9MYeBf+ddC7WPrgsaKD+R0Ky/3l0HoHryoiJFe6dAK+EwA4eVa0rDD?=
 =?us-ascii?Q?YzriGwcc0hK83JD6LZKf812pdyKMFObTf8zJ5gUwkZOjbUJ5A8uF416FL2qm?=
 =?us-ascii?Q?1uKg05XZHBonf52765XNRnJoPNyIYbfhqFV44nYurlJOrU3YpcPA5WznNpY4?=
 =?us-ascii?Q?g9ZVn/K9W4sN7j/aRg1ElHodJhxGtqAZ6g0MKFqqJfVFAaUzC64htuPiTLTP?=
 =?us-ascii?Q?PjGvA1e/mUrpTVCOKiqlJqQ90UGaAmiIOGCQNudDeQBRSjuHKWooDj3GKS93?=
 =?us-ascii?Q?4NYbnzKKIAqJ4tB/aPw1YCJ3NCZdv2VWzB5TFLBWJ/j0yFJ5jcvHRTGkZVYY?=
 =?us-ascii?Q?V5hi3ySnOMqZWX9Yl1Bpo5FCmg84kNTgpZyKPhV8SEyUiW1wSyy5uvyosCgY?=
 =?us-ascii?Q?z4GS/C/SETNg9uv0rxzWjZxQKa5//0NiqinlOQQvW83w4WiEmGDky28HnADN?=
 =?us-ascii?Q?lQeNAy9P8jH7DK82K+b+yIv3a6AZLUJI0PKA/HchiJJbc92n3I306VyqKA4B?=
 =?us-ascii?Q?wrwXAQZXOqeanR1Fj2Qrc8fCswZJVW9vv4k6XGAXvhKRUGg/0vYyNbLD4PGF?=
 =?us-ascii?Q?+8Bp9nMLtmM6XpovayUqDaO8ZhGOaXGMrMqqx4ir6wya3ZbGTgw0+6QdGXOQ?=
 =?us-ascii?Q?pB/GaXB7b4fPqoQBEKDthBXnbaouxKYSDDhaDNUFegQOzsSVLoJL1Y/QctvX?=
 =?us-ascii?Q?OpFeH5wuvLEpiIX5jCww7DIR5o5kbO2kdms15AYQEgHZd3ybJykLLIVIP+hG?=
 =?us-ascii?Q?w1TnFGyeTtIJlomQXbAutUEe1BdnN7XxzvbcAxEwU83BXGtSYdK9XJQvsAih?=
 =?us-ascii?Q?0vCvBmtb+BnB4vFbfZCiIDyY26sUxhrUsujrEmikm0C+gV0sZi548AaWkter?=
 =?us-ascii?Q?rTUzx1RFLNPSJuibzESO7ks8XfVAs/P2cLmzgtEsnKYc1WdKbTpIVlTh887b?=
 =?us-ascii?Q?GhufnxFYfrVCsyODdz/fxDvarWPtbGJDDuB2E9g3NkRESjZG+rv1jgs10yv3?=
 =?us-ascii?Q?44QAYgKLj1A+gNUGugDSzyYzhBfIm8v6rxdr2zuxZ5Ci4MJ6EYXRSiWK8rpC?=
 =?us-ascii?Q?ljpzdVdeiZbytKbzF/6qdAn2Z2J48guPql4KBHnBk0TaVRlCbLM0jYGFFL6C?=
 =?us-ascii?Q?CEfwn2W677z/XSVKbGTl23/vjfv+JTanRoYCIE1cO58DqyA0PBHAoqMJCqab?=
 =?us-ascii?Q?2UPCA1hkvMojUDtjXj5to1gMbDh7yPyUW6wEUvD7sH+ArRKTQuARt41Sw0Ng?=
 =?us-ascii?Q?kWHMzvndnT3aHtJ7QH9BPisv3HxgVOZ66Zu5?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CO6PR11MB5651.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?yEWMmWQLdn2z8LGdiYX+ImAao+VE2p9/TYaGZOX8c09U2qUT/qcSLxe4Q+/h?=
 =?us-ascii?Q?PjPPgEvaNtYSJLDthADqBkVlpEU7nvtgO+LvtvwYDnSqdPNrKv1qLTaoEAwS?=
 =?us-ascii?Q?lAg5R+RQ5vPrVvTKDO+zWkFQjIh9mRDgn5hot5ua6i7u5wWDwHXVvZcoOYxH?=
 =?us-ascii?Q?K/2bEg3oNISPsGOVmhHW1LEuwI57AlpBKgdMbssC5d0+sE2/NkY/Q7ZcR6lP?=
 =?us-ascii?Q?M8YioLIuyasRcbEFRWw1aA3a9zGhWjT2lz7VLoJpoeFIO4CVOv8AEivuG4gf?=
 =?us-ascii?Q?QWm38OkRJNQWG9BIlssI4PNXXRyaQVJcur7sqWNGPtVnAowKKx+o5ttH5uI+?=
 =?us-ascii?Q?bFGtID29yapoNylJ++eXJa6dDNgJ3h+InZd7OieDtwvmvAszxEWCQTf3p8g7?=
 =?us-ascii?Q?y+6/ekWWBDu9wybpnNvMMKtrYFYO1rmh8MQDkm+Get/TMD1bDakgDdXAKcxy?=
 =?us-ascii?Q?fQ+R24vIfDQQtpNBBNdQuSzUlgzzJ5vDz/hwAyTSMOkYLuDQt7zq2ruolEBc?=
 =?us-ascii?Q?8zD6e5vorqUPcqRurNH/BvBTNe6TahrxXUZzJbZYLgULQxHR3plUJBqdCGzB?=
 =?us-ascii?Q?O6DR4C3m1nVAcHOzBdJ8dTpoybQnP7hgoBXcdkIQqyw+z1MZWnZIL7+eApIe?=
 =?us-ascii?Q?A+feV437ZpDVTW2QAg1PA1Vof45/W6Pv0KVUp4H+gYbaJZQxuvJ7VJdSGiMC?=
 =?us-ascii?Q?AB3bZxy13DXLcE8YJ6cCEWfmqyqQ1VyE8leXvYsYkFjs6+a1EhFCDzjShrPP?=
 =?us-ascii?Q?hELF1vRHVjGZhMyvdUSsuJ3IttMDX8keYeVxbDLjmNI76jhpqrUKicPD5VD2?=
 =?us-ascii?Q?1sBa6MoyndgO7QB76HPekuppIot/SMSrz5GzHt50sMzNQYTGtkSfV6zHGrVD?=
 =?us-ascii?Q?wKvXIacuEh1Ppu8AMGtXs66BotSrYC3bVnGONVCvfclbLWzYoY09i2oyQzs+?=
 =?us-ascii?Q?QyDTbtTE4T/T+pJsDfXtFYJNn420lQ6GWmiqrLbF5rEASgDYxQiSNWJhDu/i?=
 =?us-ascii?Q?te4akX1ilCYPJZDk3Y1HmSCdo4WRBWnvo/OUUvYKn5glTgvxWzrubTJOramI?=
 =?us-ascii?Q?7ITJCxeTEsYflzL4lftYBGKdjZMSHKZWLKu/SUPAE2AQZiQW+bgxOjwOSlKU?=
 =?us-ascii?Q?QlYLZhq0AeyLVJcbdVC8NszEmYCzNH/OA7pU9syTUaUy0M4Ad5HZqp+k2apK?=
 =?us-ascii?Q?4A5EQ8xv3h0mKmDs3Qe2nSG6feFnjHli6AdUhNBtLLfUJ9ieZWTLa0Kck/Vh?=
 =?us-ascii?Q?znl1jRVIBe9+Q9rsZjndoFBNt5SDRU1xyLJev+LORakXcV9yIq6M/eoOxW0E?=
 =?us-ascii?Q?y3hGV0dQaHFCqsOxbBKRtli0ar35DcquHE9wLQ4VsjlrtFZ+6lXqLKWDmchr?=
 =?us-ascii?Q?dUa1m3pXgLvUskbm6X6NVCx7v+RSddtaSp0c1kAEQRTUzjSK3HP7+PCPj8/0?=
 =?us-ascii?Q?Ef6TYU5eN1bk6bC4vHfLcLH7EvbbgdSSYiLSD/mojKsLdrMWb0BmaPXHEIeR?=
 =?us-ascii?Q?u89XqdFmN0z2QgPl2nxsFX3GV4APtj1NGBUepDPNX3BsloQrZkbYUlQjwwjl?=
 =?us-ascii?Q?CLHkW4Pm06bEQkYEkLr4236+pNXdgOBI0wfKWFCCf0shiGl9cMTD132UU5BY?=
 =?us-ascii?Q?vvZ6cVyMySzT+wwVduL9Ed1/20/BuBLI+L9styA/8rkQ8gMb1Je1zyeY579Y?=
 =?us-ascii?Q?ud2Mx2AHen9UzDzmdMAhzvO/37J9G9rn5hz77hlMOTt6a9qv4NIqG6OSzBPd?=
 =?us-ascii?Q?ZErAbHOWdSULPyZGw7Si9jDZ0Y+IcYE=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40a21881-fe4d-4bb3-fb88-08de47ae0a4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR11MB5651.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2025 14:16:35.6970
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b1KU3XwKQoF5Ne5v0CWdB4bLmKjXescSrCioOtYOm+vslPQ4qn+NrrUKjq9jxxn5UOLO9B2Ng1YaAAOAjcnHqUkq6sADVCwDSYhZhcdKsVs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8859
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: MlkSlSBX3EmFGL18cQU9ej4G3sXNFM6Z
X-Authority-Analysis: v=2.4 cv=V4NwEOni c=1 sm=1 tr=0 ts=6953dec6 cx=c_pps
 a=/qs4bcqls8FpsUBDM29/qQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=jGeDP5ryJtbC-vnzprAA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: fetgQcDLWZVjTEISOVosmbMrW9eo7r6L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjMwMDEyOCBTYWx0ZWRfX8fljyADX5XT3
 Rk+y/GuJWpkhCn4F8eGIdDV+IjrDpsSGzAL9I5gFGuEniQejvXSQKBT7f7jQhLKPDr3P7DJtR1W
 OJZTsPra6k+G4pAyHJR7i9vHK/jz4VCOcSrOZyp8QgmR/zxKIxG46s/jl16CksNKr+BCYtzHjJE
 D/IMJ4MdQV4tPjW5x10nYiKhC7iITT1r3pGcVXqwXFF9CwytJWdbWyQjMbm45KbnKG5wmqGSagF
 LDLk+FCJwmqpVAHtltLZvvqSl1biq7VWLxSwIX2isOJ4VJIHBzrioChwhwEUn8m6vzrtylIkcLF
 lXJUJ9t9D/az/hB6e33N59TMCqltoyTkxc5N3d/13/iTNb0zHejvJfo6s9PYNKAFzRE+DtAK4Py
 CQ37P4rUtPVX2s+D9S5khIsq0lMRqUCFKSAk/JzzJ1s+WsXXZBJfAvVrLTi4Mg/r2+arj4VGenh
 M8YAO17/eGWtCsjO8mA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-30_01,2025-12-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512300128
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Dec 2025 14:16:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228675

From: Harish Sadineni <Harish.Sadineni@windriver.com>

When CONFIG_RUST is enabled, running 'make prepare' in the SDK fails
because the Rust kernel infrastructure is incomplete in the staged
kernel sources.

The Rust build system requires a wider set of interdependent sources
during make prepare, including bindgen inputs, C helper sources,
generated headers, and other support files. These are all located under
the kernel rust/ directory.

To ensure make prepare succeeds and to support building Rust-based
kernel modules from the SDK, copy the full rust/ directory into
$kerneldir/build when the rust-kernel distro feature is enabled.

Additionally, when Rust support is enabled, 'make prepare' generates
.rmeta files (crate metadata in a custom binary format) and shared
objects (.so) that are required for compiling Rust kernel modules.

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
---
 meta/recipes-kernel/linux/kernel-devsrc.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb b/meta/recipes-kernel/linux/kernel-devsrc.bb
index 23a9093ede..485e671962 100644
--- a/meta/recipes-kernel/linux/kernel-devsrc.bb
+++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
@@ -139,6 +139,15 @@ do_install() {
         cd ${S}
 
         cp -a scripts $kerneldir/build
+        
+        # In sdk, when CONFIG_RUST is enabled, `make prepare` requires the full Rust
+        # kernel infrastructure. The Rust build system pulls in bindgen inputs, C helpers,
+        # generated headers, and generate crate metadata (.rmeta), and shared objects 
+        # needed for building Rust kernel modules. Copy the entire rust/ directory to avoid
+        # failures with 'make prepare'.
+        if ${@bb.utils.contains('DISTRO_FEATURES', 'rust-kernel', 'true', 'false', d)}; then
+            cp -a rust ${kerneldir}/build
+        fi
 
         # for v6.1+ (otherwise we are missing multiple default targets)
         cp -a --parents Kbuild $kerneldir/build 2>/dev/null || :
-- 
2.49.0


