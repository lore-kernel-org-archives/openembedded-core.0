Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66FA4E7716C
	for <webhook@archiver.kernel.org>; Thu,  5 Dec 2024 06:00:31 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.4491.1733378423207090994
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Dec 2024 22:00:23 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=20698dddd5=changqing.li@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B54oMJn032555
	for <openembedded-core@lists.openembedded.org>; Wed, 4 Dec 2024 22:00:22 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7wh6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 04 Dec 2024 22:00:22 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B560LXK002545;
	Wed, 4 Dec 2024 22:00:21 -0800
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2044.outbound.protection.outlook.com [104.47.56.44])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 437xv7wh6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 22:00:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LrKTqd/uS6lOEIq+IvRetYflCekGdM3dvX0NIg9x9H1Ie3QYFXb9RXH+OFm9LfiY4Ev10P92MEVkUIN+8m4DZFZsqU2RfFc9I6NvaNkhsmh3i0htAI5m8/Taw0efTVzN8vXrJ8CqpECgFHzb9fA7ROV6JF6GaODEElYI7UyijwrFiC3r03bxHLM19tbT73amygCLovevroaSDwdN/XBY0Q9SwD8rLCgmi0ho/amYiboNitW7aqYQOHDDIDOE19WqYqmwAwg32xsZA7wUZfIFF2hrcWKvwJyAlYlibCuAQ0XcjhdKNm/cb7NnKYybnz5RbgZS6XessBAmDRJfm/X7yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkyvhBFW4yCBVg1JOL7L+gkjkRrM9DAoobbp7WTPV4A=;
 b=jtRjJVQUk6UZbjOGK9KJyJSZ1PGHNGFpYmfOk5nns2bXrfWRGTX/iOXlk+7/ODzm7ITyBRKfUFMRBi11TgVxceLY5WngxRbCfgNPM5bWPirSoUe1o5B5CulvvYVk/BViTT/4iFhfKC+sSizKPLoN1tMsU4+yFPUDxACgmv4sCUzQjwAbfOAxHDtQca6LxLIbYGiViKx6zEySn1r/FJU29wQJejM7Qn1Ig+zDLzAtpnizyuhQSINFbXqgjGJuzS/8PLV/0UILvBHZz0CtHg+5VZ8CNqKGpzWXFkEX77VxZ+9dKzBKkAY9CiETDQATgg/hKJsFIg6bW9Azif/SuXkvyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS0PR11MB7312.namprd11.prod.outlook.com (2603:10b6:8:11f::18)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Thu, 5 Dec
 2024 06:00:18 +0000
Received: from DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c]) by DS0PR11MB7312.namprd11.prod.outlook.com
 ([fe80::8436:b2d3:31a9:1c8c%7]) with mapi id 15.20.8093.018; Thu, 5 Dec 2024
 06:00:18 +0000
Content-Type: multipart/alternative;
 boundary="------------nK96Z3b0HJIBNUaeYDLunYKN"
Message-ID: <b589934b-ff38-4e86-ab69-3ebd9cb0b6d9@windriver.com>
Date: Thu, 5 Dec 2024 14:00:11 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] sysvinit: upgrade 3.04 -> 3.11
To: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
        openembedded-core@lists.openembedded.org
References: <20241203032605.2651655-1-changqing.li@windriver.com>
 <D62YXQ3EDJGJ.12OTUUX79NSHM@bootlin.com>
Content-Language: en-US
From: Changqing Li <changqing.li@windriver.com>
In-Reply-To: <D62YXQ3EDJGJ.12OTUUX79NSHM@bootlin.com>
X-ClientProxiedBy: SI2PR04CA0014.apcprd04.prod.outlook.com
 (2603:1096:4:197::18) To DS0PR11MB7312.namprd11.prod.outlook.com
 (2603:10b6:8:11f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7312:EE_|BN9PR11MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: f2c09798-7686-4a8d-ff00-08dd14f21848
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZFhTVXVwWUkvVENRdHMzQlkxRXBmL0NZdit0b2xGd3hkRXZFd0l3eEdZZ29y?=
 =?utf-8?B?STMrVDMyTW1lMC9od3ZnREUvcjFxQWFxWTd4VVFMYmhvOWRnUGdIVGMrY3I1?=
 =?utf-8?B?ckpqTFZzcmhGZWd0TS9MOWVZZFJLY1lsYjIxRzBwUzd5eFVIVC82dkJ5bCtv?=
 =?utf-8?B?Z1p6UHYxblM2TnY1dGRFZmdRdThxcHpRZzk3Mk5oMGJoUThxY0J1bmpUOS9S?=
 =?utf-8?B?TVpCQm5lNXlEUDJENHM4Mk9zOWw5NHhQVDZubWcvcnlXRWpuaFJjTXFETGI2?=
 =?utf-8?B?L3RNank5QjBPNTc0dVNWWjFkL2VZWFRSU1Y3OFpVaHYvVC9STWFMU3JkM1Ru?=
 =?utf-8?B?bmJwQ2I0c3Z6WEs5WEQreFFMYmFpdXY3WmZ1c25qQmJLNFhwb3daVG16ZkNx?=
 =?utf-8?B?dDdyQUJjeFZWMFlEMUtUYWp6eWp4ZU1UQ0NkRm5adDBZajJYSzg5VitHeU0x?=
 =?utf-8?B?Qk9UbFRpaTdrQi8xSGpIci9nNjFTdjJCdlZJbFpqRlZEQVZJT1NPMUJ3WmRY?=
 =?utf-8?B?UkxwSDQ5cFdWbTlkSnJCd3NETTMvSVl2K0pXYWI0bVk0UHQydC9wcU15cm90?=
 =?utf-8?B?UkxyMGJSQktnZEV5RU9rNm1oYnBLZUhNV0QxV0hEekp5bUJjYWg1ZmM4aDBr?=
 =?utf-8?B?ZURVZVVaajFTelZhWXBuWDlPK0l1RTZyVVhrUXRvYVJxOWgyNjIrcEcvcldT?=
 =?utf-8?B?a3F3YzJIallzd01wZkUyMjlVNG1UVytsdVNMdmM2TlFOa0JuOW5sMitFRVZD?=
 =?utf-8?B?eWZld0ZOclFXRlY5eFp0Y3hxMk5tc3NpTVQ2RDJ4WEowMzBpV054ZzRwRE5i?=
 =?utf-8?B?T0JvMk1GTlBtR2J0d2hZL050YVNLaDVtT2Q2WWQ1RkVGNzBLUmxrRGZIQy9a?=
 =?utf-8?B?TXJndzdwczZIUXFvUTVONi9vK1g5ejNHRjJ3OTVnQzlFaFNXWXUxd3BkcjdT?=
 =?utf-8?B?bGpwMUZNV0djb21OT1ZueG1iQmFRNVJNRmJMTnRLMzNJUFZZMlFpQUxDbjQ2?=
 =?utf-8?B?WTdhSFpHdmYrVzQydE5mQ21vMkhFYWV6dDZnRzRwNUU1WWNkME8zL0hoZHA3?=
 =?utf-8?B?RS94VTJHajNFdjlQTElXNHZIR3U1eVdKbU8yTE9HcXdHVHY1amRTYUVRUWVl?=
 =?utf-8?B?dSsyc3dxeFRtaFRxR3Jzc0l6NUhXUWNJdWVWSGlLdXprc2xMcksrN2FsSDZN?=
 =?utf-8?B?WUgvWHFJRHJnSWlmTTlnL0UxRURYNlpQdWhjZjlCRm1xKytlN0RGS3VOcGVH?=
 =?utf-8?B?WUJSeXdOSFRCbWpuMXQ5OVErMVFLVEEyem9VNGNIZU1vQkN6d25LRjdOR1Fx?=
 =?utf-8?B?b3dYK3daYTBidmpSUHlWL1MvSHJYK0VsdVFBTDRVLy8wODliYlhxSnc4MC9I?=
 =?utf-8?B?NStoSXRQVlRMUW5TRThYMTQ2d3V0cUxGelpoY3FBR1QvQ0dnQ2RBZUFnZ3BS?=
 =?utf-8?B?akVGODhSTkhLQ3ZSSzFqN24xRFJCdldGRTdtTE5WVjNGVktXNVRyNmNDS1pW?=
 =?utf-8?B?c3BKMUUzczJGTmJrdWFHRnNPbkQxRUpCZ1FNd1I0M09OcjZuOFQ0VVJvR0x5?=
 =?utf-8?B?VG5xNGhicUpDNEpRQlhPcWxXWXVWSzNVZW1NVjJnNlJSS1JseFZjWlprODBs?=
 =?utf-8?B?RS90Q3ZYMTZRUVBPRVJzN1hZY0o5N2RHZThIY2tUQUtHZ1d1Kyt1WnBGVzJy?=
 =?utf-8?B?dGtGbmNhZDIvbElSM2hOdGpJSHFxMDdvWFBZTmd2ZFdWQWo4WjhnSkNIZitk?=
 =?utf-8?Q?30zpgiERMy2ONqbHmU=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7312.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(8096899003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SS9HYW9JVm5JZk05VWRYRkhXaXRjOEhNOVhKeVhJMFc2NFlpZjJldm53Y09N?=
 =?utf-8?B?Y1JMQm52SFNDckhOd0lWVEQxdjF6emErc1JEenRLNi9FUnJsM2FHY3RuVTdH?=
 =?utf-8?B?b2JaZDR2ektKL283Mjh6SHZZZG5BQ1BWSFJUbHFLcU5JbjBJTWlQUVNqcUhq?=
 =?utf-8?B?eXZWNlFsQ2szL0s5SDYzdFRySnlndnlaNE9oYmVHNm92dEpEM3FXZ2w3MFRI?=
 =?utf-8?B?TDMwOGlHRzhrQW1Qa0xnYVhrWk5yRWFpd0VEYnczcVJob1NDL1RBWE8rWkFv?=
 =?utf-8?B?SXN4Y01OcGQ3bzZ5SjRrNFROcytHdkhoV0k0b3A0QnRzVS9oNGVSSWNoM1Ji?=
 =?utf-8?B?Rm1ack52aTNLZXEyLzZRc1JuOXM1WDlKbGt2YzNrWEZ1bGJWWkZRd2oxNFJm?=
 =?utf-8?B?NmpXUjdBQ1lTNzAzYmJ5anhEVlpadjVEVjZZTUpIRUxyVkxyL3drakYvTE52?=
 =?utf-8?B?cDBRbXZUekZrbEI3NnpWcDZaakhpNTg4QkZWRHRBbm5zNkdhT1VCeXlMVi9Q?=
 =?utf-8?B?NUlUYXJmZWY4TGxjSWZCdTBGT0Fma0d6TlplT095YlJzdFJmR2E3YzIwVXBD?=
 =?utf-8?B?VXBobmc5UmR3RTNqVVNVM2EwYzFFSlcxNnFMczMrOG9RTTJOckNGdmNNaWEw?=
 =?utf-8?B?WmtRQUJVNXd2YkE4ZWNtVjU1VERVQVV5WjUxZVdrZ05kTFFSNy9MUWoxOVdQ?=
 =?utf-8?B?NDMvYy9aOHlNeDZQVGZGVlRnc2F3WU4ralU4cUhlNmJsUm4vOUZSdmVTVDN4?=
 =?utf-8?B?SWs2dWplV1VydUtsclI4S2xWNjhhdXV3MEc4d0JTWGhzRFhtVW9CbDNoODJy?=
 =?utf-8?B?L1p3TDR3MUdrditEWkprbkxLdmFXd2xyNkhMVDJuN0toTWM1Y29tQWRFWFRM?=
 =?utf-8?B?L1VuOGFUWEw3cmRVRWtseEZuRXU3c1VlODNMcXBJejhXeHVIT0JWd2R3OElQ?=
 =?utf-8?B?Lzlqb3dyQVA2N0RUZno3QytZYVhCdGNmZXRld3VZQllPWXJjK2RVRFB5UndY?=
 =?utf-8?B?NGR1NWxCL3RjVjJOVU1qRmJZZjQ2WWNZbFg0OUYvZktrcEUwOWVCNUdHNE1u?=
 =?utf-8?B?cXZtWVV3WkZHMFhaeDdJb3JUTTVNM0VVWHNKRGhIeHd1NnhnalZoYmthbndX?=
 =?utf-8?B?Ym9QUXFlNmRZeWVIZGU4VWVtTkNjemx2M2RtK3c0OWI5Z2wyZGtnNkVEK05v?=
 =?utf-8?B?K0dPcWRKSFc3cGJLM2UweTNSUTJQRDZqcnYxMWI3SHAxT3d0a20xTElXVmhB?=
 =?utf-8?B?QVdUdzdVeDJXa1pHU1U4aVR3aE9JQy9lbXV4U2hUMExDdTZpeU9MVlc4SHBH?=
 =?utf-8?B?dXJnL3JDZjl4RXlJQWllRTRVRk4wMlIvMlh0c2I2SCt0c2d5WkZXc01HMzEx?=
 =?utf-8?B?YWo0VGtHVHdWc1JGZnlxR1B5eVBRNmhoOVgyb082L1BqdkE5S0VrSWkrTWhz?=
 =?utf-8?B?S0lQN0ZrVEwyWi9sS25MUDdiUnRaUnIrdnJYNkhtTUh2RGpvTEVNc01adTdi?=
 =?utf-8?B?UWh1VGdENHBIWDBZZ05KRXJQRS9ZbjM3bGhaNFRTaCtQa1VQODBsZmZXUlky?=
 =?utf-8?B?V0Y1ekpsWU5ZUm9ad2Ziazk4MjM3MFJoUCtBcDNFTXJ0QW1IOXlJRGNmNkxl?=
 =?utf-8?B?QUxpNmhoeGRGSGtsdVpROTRleldGQ25IVFNoZ08zRmRmMGRpRVRlaGplWlF6?=
 =?utf-8?B?NG1wWTU4Zm1BUnB6MGJtOC9XRGtzejljOVBHaVMweWIwb2ZROW5jczJKbGd5?=
 =?utf-8?B?ZWk5TTNhUFJoZFA4dnNIbFpWLy9KYkx2Z3dnVkN2K090YWd2T1dPVDBPMzV6?=
 =?utf-8?B?b0ZlSjBkemJRVkV0OEhOaktyKy93ZStIa1lYS2V5bG1mWXJuUzFVTGhzMitr?=
 =?utf-8?B?QjhEL2crYnNOSk1QNS9Hdkw4akorS2RRMm01cHV5R0dtYTJBQTVqdmt3TkZ3?=
 =?utf-8?B?MDhGemg5anZQdWtMbDZwN1lBUkNGOURpWTZERUwwRGdnemZHTkw5U3hCTm5h?=
 =?utf-8?B?ZG8rUGFRcEd3WEEzRXVwVklINXVyN2F1Z0dKenAxYVRRN25ZMHdENm1VSERB?=
 =?utf-8?B?YlFKOG02MXJNSld5YUJMdk1taG5kNmF2dWJtbmptTW02cWZDL04rTm4wbW4r?=
 =?utf-8?B?QVh3NUhCTVYrYi8vYktSSit0QmQ1V3JIK3VyaGJHdStFeUM2bmhFclBnOEZD?=
 =?utf-8?B?ZGc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f2c09798-7686-4a8d-ff00-08dd14f21848
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7312.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2024 06:00:18.1772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZGTB6GtlSINwruifGuf0SU7mGE+VtRBA7wPnn/C3pfIeKf4maSb0VUC0QotuKiWQsni+hi0sdxS0dB76ZmORh+ZODMbeLfJX/jxvDrtkiPY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
X-Proofpoint-GUID: b3qC5NOQhxEU7QYtHnWM3ZpxirSpcw-3
X-Authority-Analysis: v=2.4 cv=RpA/LDmK c=1 sm=1 tr=0 ts=67514176 cx=c_pps a=kSx+wkOqrR7DBdLtetN7AQ==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=iGHA9ds3AAAA:8 a=P-IC7800AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=Er3FX-vRko5DhiUXue8A:9 a=QEXdDO2ut3YA:10 a=wvPkM9v7g1_ikmSEda4A:9 a=gxuFYtugvegcmR0j:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=d3PnA9EDa4IxuAV0gXij:22
 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: O7FeN9-fTyFqV3Z58J2RRlqTDXfczheQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-05_03,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 suspectscore=0
 priorityscore=1501 mlxscore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2412050046
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Dec 2024 06:00:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208363

--------------nK96Z3b0HJIBNUaeYDLunYKN
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/4/24 21:59, Mathieu Dubois-Briand wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue Dec 3, 2024 at 4:26 AM CET, Changqing Li via lists.openembedded.org wrote:
>> From: Changqing Li<changqing.li@windriver.com>
>>
>> Refresh patches:
>> crypt-lib.patch
>> install.patch
>> pidof-add-m-option.patch
>> realpath.patch
>>
>> Drop patches since upstream already include these changes:
>> 0001-hddown-include-libgen.h-for-basename-API.patch
>> sysvinit_remove_linux_fs.patch
>>
>> Refer:
>> https://github.com/slicer69/sysvinit/releases
>>
>> Signed-off-by: Changqing Li<changqing.li@windriver.com>
>> ---
> Hi,
>
> I believe this patch is breaking the qa-extras2 build on the
> autobuilder:
>
> ERROR: sysvinit-3.11-r0 do_package: Error executing a python function in exec_func_python() autogenerated:
> The stack trace of python calls that resulted in this exception/failure was:
> File: 'exec_func_python() autogenerated', lineno: 2, function: <module>
>       0001:
>   *** 0002:apply_update_alternative_renames(d)
>       0003:
> [...]
> Exception: FileNotFoundError: [Errno 2] no such directory /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.11/package/usr/usr
>
> https://valkyrie.yoctoproject.org/#/builders/26/builds/579/steps/25/logs/stdio
>
> Can you look at this issue, please ?

Sure, I will check this.

Regards

//changqing

>
> --
> Mathieu Dubois-Briand, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
--------------nK96Z3b0HJIBNUaeYDLunYKN
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#cceed0">
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 12/4/24 21:59, Mathieu Dubois-Briand
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:D62YXQ3EDJGJ.12OTUUX79NSHM@bootlin.com">
      <pre class="moz-quote-pre" wrap="">CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and know the content is safe.

On Tue Dec 3, 2024 at 4:26 AM CET, Changqing Li via lists.openembedded.org wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">From: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>

Refresh patches:
crypt-lib.patch
install.patch
pidof-add-m-option.patch
realpath.patch

Drop patches since upstream already include these changes:
0001-hddown-include-libgen.h-for-basename-API.patch
sysvinit_remove_linux_fs.patch

Refer:
<a class="moz-txt-link-freetext" href="https://github.com/slicer69/sysvinit/releases">https://github.com/slicer69/sysvinit/releases</a>

Signed-off-by: Changqing Li <a class="moz-txt-link-rfc2396E" href="mailto:changqing.li@windriver.com">&lt;changqing.li@windriver.com&gt;</a>
---
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Hi,

I believe this patch is breaking the qa-extras2 build on the
autobuilder:

ERROR: sysvinit-3.11-r0 do_package: Error executing a python function in exec_func_python() autogenerated:
The stack trace of python calls that resulted in this exception/failure was:
File: 'exec_func_python() autogenerated', lineno: 2, function: &lt;module&gt;
     0001:
 *** 0002:apply_update_alternative_renames(d)
     0003:
[...]
Exception: FileNotFoundError: [Errno 2] no such directory /srv/pokybuild/yocto-worker/qa-extras2/build/build/tmp/work/core2-64-poky-linux/sysvinit/3.11/package/usr/usr

<a class="moz-txt-link-freetext" href="https://valkyrie.yoctoproject.org/#/builders/26/builds/579/steps/25/logs/stdio">https://valkyrie.yoctoproject.org/#/builders/26/builds/579/steps/25/logs/stdio</a>

Can you look at this issue, please ?</pre>
    </blockquote>
    <p>Sure, I will check this.</p>
    <p>Regards<br>
    </p>
    <p>//changqing<br>
    </p>
    <blockquote type="cite" cite="mid:D62YXQ3EDJGJ.12OTUUX79NSHM@bootlin.com">
      <pre class="moz-quote-pre" wrap="">

--
Mathieu Dubois-Briand, Bootlin
Embedded Linux and Kernel engineering
<a class="moz-txt-link-freetext" href="https://bootlin.com">https://bootlin.com</a>

</pre>
    </blockquote>
  </body>
</html>

--------------nK96Z3b0HJIBNUaeYDLunYKN--

