Return-Path: <Jinfeng.Wang.CN@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DB4BD1119F
	for <webhook@archiver.kernel.org>; Mon,  4 Nov 2024 02:55:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.49401.1730688940337677100
 for <openembedded-core@lists.openembedded.org>;
 Sun, 03 Nov 2024 18:55:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=10388ffa1b=jinfeng.wang.cn@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A42YhQq024456
	for <openembedded-core@lists.openembedded.org>; Sun, 3 Nov 2024 18:55:40 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjh1fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sun, 03 Nov 2024 18:55:39 -0800 (PST)
Received: from m0250809.ppops.net (m0250809.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4A42tdAd021786;
	Sun, 3 Nov 2024 18:55:39 -0800
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42nkkjh1fp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Nov 2024 18:55:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UJhaSbSO//qzzJSgfv+/KsfRyNMAqeyQXS0Swg1wW4ubNaa4pq0Pcp08zcxfgjocwruRMhWuwbiUHtjYCrTQe52i8X1yLFhWnVlypk21LZZLTz3QrTWyhjgwZWGAY/AJ7HT7Az7FMKpUl6W9xScRd6MqvcAiCLcCEkDFy3iTJFZRNwBAOmSTAnCB8XSn4GVcNlv+BVl4wPKTWxkfaV9TDIZX9jjoFq9HNChajQGUhJZsZ3iwj38WokBiexifl5t7/fyY5zmp2HdLEb2OA84oee76xOhDeQbTozy795DjcoPvYbdEF+MDVogLZXdV+dGXVjMd7Akr6579PGQHflDwLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4V86fevw0C8iCRQXnMyVUzQer4qAc8xE3dVqStDbSVM=;
 b=bCHnTLXEg8PGuGRTeFjZQF3+lmMHj0EwIC/ms1ai/b0UAb1c85axjJAZZX8VEkdhzW3k9xpGjKYaTt1XgP4ehirG8cyRIhrQ1gwsqxZCMuNU9WJX6fakNRbKcmK5/2uY+iozFT344EpUO0BmF+9F2Ttevria7htLDEWGO2jReyhEci7JPfmVoIWl2+y9hXPb0aFDgJPiVFaJEQCXp/0GgZc7ZwxvM6L9wlpOntmkUgRbCAwPX4gZGivWJ6lfJZNQsr654Ec3QUf2geLrtXKUGxYIDBx3QB2X+CSOVWlkIvVXT9Dtq+26jzFJnwQcefUOX7CR+rUZeSDf0FLjxAGsxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DM4PR11MB5533.namprd11.prod.outlook.com (2603:10b6:5:38a::7) by
 LV8PR11MB8583.namprd11.prod.outlook.com (2603:10b6:408:1ec::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.28; Mon, 4 Nov
 2024 02:55:32 +0000
Received: from DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd]) by DM4PR11MB5533.namprd11.prod.outlook.com
 ([fe80::8ce3:74f6:33ca:3dfd%6]) with mapi id 15.20.8114.028; Mon, 4 Nov 2024
 02:55:32 +0000
Message-ID: <46442961-0fd7-4ce2-83e4-857e83800694@windriver.com>
Date: Mon, 4 Nov 2024 10:55:25 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [oe-core][PATCH 2/2] glib-2.0: fix glib-2.0 ptest failure when
 upgrading tzdata2024b
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
        openembedded-core@lists.openembedded.org, Ross.Burton@arm.com
References: <20241028080425.2232475-1-jinfeng.wang.cn@windriver.com>
 <18028F3A690769AE.20159@lists.openembedded.org>
 <b039e834-4deb-49b9-80f1-267174c7d942@windriver.com>
 <8df0c30d89b34b9e0a01dd68450b401b42cd0c1a.camel@linuxfoundation.org>
Content-Language: en-US
From: "Wang, Jinfeng (CN)" <jinfeng.wang.cn@windriver.com>
In-Reply-To: <8df0c30d89b34b9e0a01dd68450b401b42cd0c1a.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0298.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c8::12) To DM4PR11MB5533.namprd11.prod.outlook.com
 (2603:10b6:5:38a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5533:EE_|LV8PR11MB8583:EE_
X-MS-Office365-Filtering-Correlation-Id: 72e90b65-998c-4ef7-6328-08dcfc7c244f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?a01rMnJlY2EwdUUvK3Z0aE5hdVJzZmpDTWlpK3lmcVhsc2RwQVh2QW5FT0pB?=
 =?utf-8?B?cm5SKzV1VThyZXdlR3VGdFNaSldIRW5BNWJXOE0zTlJxdFFVaGt4Z2JEeDVZ?=
 =?utf-8?B?YnI3bjg3TWxScWZoWUw0UER2dEQxaGpyMjJxQXRlSFFwK29YaG1lV056dGFP?=
 =?utf-8?B?ZkFQYWNkbXIwamVBTkRiNnE1QlJ5cGZ2eUxaRmZSNzA4Ny90b0xhQ2FuUTlV?=
 =?utf-8?B?QXFTRHFoVDJGQ1BmTldId0YxdGRZYTdkMlp2MTQ0bHdFRUhjemFYWXpVTHJi?=
 =?utf-8?B?V2hTTW9jeUgzRUM0cUk4djk3UGVkTEFuVWNXYi9XQnJ2TThZVEF1dHNIbTBk?=
 =?utf-8?B?Y3BCMjJTalFmbGdHZVVHY0NtQXFXWDZzQWxJNUUxNzFkUG5iTEhBTXRULzBJ?=
 =?utf-8?B?MU9BUWM0aU14bHRxQWRnZEdUUjdMYS9KUzRFZ1IreVdpaDhLOUhxSkkxdkpo?=
 =?utf-8?B?RVdDWENyOTRGemJKWllqdDZUZ1dPSjJidUhubUFURlVDSTBqa0FnWWk3azVa?=
 =?utf-8?B?bFZmQ3VUaW11UzdkUFU1SGxqUnpCVkVkNldhSXJpOXBnOW9Bc0JYbUhtcW4z?=
 =?utf-8?B?em5wUUN4Z2YyVjRmQmRtSzY1SUhuSmFJL3JhQ2JDK2pYQWVvVUpzUzd0T0N5?=
 =?utf-8?B?T0VDT2p1ZGhMbVZzQkVNR0hPK3dodjA5VWdIUXVHUXJsY3lMV0JRWEpNQ1RH?=
 =?utf-8?B?VktNMDFwNTJaUlpQcnlIZ2wyTU1QY05xb0lYK1V3V2hEVURJOFlORzlnZ0hp?=
 =?utf-8?B?Q1R3STc0RC9jZUtEODFSR25Dd2poWGttRElxQ1RhWEZ0Q2luUjErZkkrcU5u?=
 =?utf-8?B?b0tYbG9NWlRkQ0k0SWhhYmp6Y2tsaDBvRjBUWkNTYlRMcVd6S2hzVFFHM282?=
 =?utf-8?B?dk5sd1RTVEd4RmFhZmQ0eWF4ZU1lTEEvR2o5RzllSUVFS0g2RmNHeThiaWpU?=
 =?utf-8?B?NGNhN3ltTFhXL2UzUmdrQnZDVHQ4N1B1ekdzY0xrWXhzUW9IbHYyTzF3YTlq?=
 =?utf-8?B?UnlRUmZxTUhPbnk2Q2xaR2sxOFErem1wWHBhSlR6c21aK2xHTzNoQ2VFMHdi?=
 =?utf-8?B?RXJoLzFGd0wwN3RWQk82WmlIN2pXQ04zT1ZReGxsTUw1MENrT1k4QlBUTEtl?=
 =?utf-8?B?SVdnTEJpNUJYcWY3eDFPUVNVaTI3NFhLaEUwL3VYZC85S1V6ZTJnTkhtMjZj?=
 =?utf-8?B?OHRqL2J2QmZ3Z29ILzkvRXZ1UDh6cXl1VUNXQ05Qa2RjNXJoR25aRHUzYTZS?=
 =?utf-8?B?ZHlva3JobFFjei94bDAwOGxxTGZVYStsOEh5eWxhbm5LQVhMaE5pcHdQM0FS?=
 =?utf-8?B?Q09rejFiWDJ6dzRaM2owa2wrVmEwbHp6TFhmTXMxaExUMkNGLy82Vi83RzRF?=
 =?utf-8?B?Qk04VTNNdEVwVkdHdEFwejhCZjgrM0lweUtpWEJyVnVycTkwWWpuRUFtVmhv?=
 =?utf-8?B?eDlKbTRZbGhWUWw2V3U1OEJOUy9FKzFuSms5ZElOT21STytEUXhxMXZhMTFk?=
 =?utf-8?B?RFRPTGJWUjl1ZzdsU1hNMTZHL0V0dThLeHpZc0VOZXZVU0hSTUJPVlRFQUZH?=
 =?utf-8?B?TUVoVXdwdjJJN1lDRHlYM0VNemtMTXhKd1h0cDAzVmlXbTVzTlpiSm8rejUz?=
 =?utf-8?B?Tm44Q3BBRlJjdHhIRldtMWRDYUhaamlPcGtvRFRpdVZhbVVsZnQ2ZGRXWUNj?=
 =?utf-8?B?SXA3Mi9EcG1RdUZVQ0hvNnFYbUJVdVo0YlpBMVd0Q2FjSDlmZkJlOTk3VndW?=
 =?utf-8?Q?qF62TvzO0J1tY4MD0s0XYt5SdCH5UmLZSfBVeQD?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5533.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M2VPRlI4d2M1dHpwM0xhL2VaV1JjWEVueHNZWDRnNnpnOUZaSlFIaHJ3MGpz?=
 =?utf-8?B?QVh5cXMvYnE3TVhxMkRtZEdCMTl1aFNoOS9EYVJ4RGZyTUJ2cXRnMUx3c2RR?=
 =?utf-8?B?SEFPTU9TSTJ6RWttdWxmdzlHbEdRY1lxdyt0Qkc0YnJKQ1d0SHZmMzJwMzJT?=
 =?utf-8?B?Mlo3VllpWEIwRzNmVUZKeG96WGFiNTRwTTlGQUJTTzFjd2UyQXU2SjM3V2pF?=
 =?utf-8?B?RFR1UTZmem9rYTEvS1VzZml4V3NMKzRSd3ZiZVUxejY4N2ZvUTJyTitENWdq?=
 =?utf-8?B?TmtqaWVCVFJia2tnMERKbm1QUzF6VTJ6eXNyd1F2YkxZbW1HMnp1emI0Unlz?=
 =?utf-8?B?b0lJR2N3bmE2UXhpd0ZkQzhuU3NRKzRGeUNMNElWbnFjRXpBcE1ieUtZMTdo?=
 =?utf-8?B?UUYvN2U4TU96L2RiMTNPR0lEd0lKQTh2ZWZCY2t4TzhkMXgxNnZ2RHZiME96?=
 =?utf-8?B?K05wRUpibFpXOXB2L0pCQ0lFSDdyZy8wWkNGWE4xQjcxK3FqejZISGtMSFN5?=
 =?utf-8?B?WVduaStUeVpZc0lUY04zZXJtWkIrbVFMTCt6a2RQUDhMMVZMc0pxbkJvc2kr?=
 =?utf-8?B?anFPektONmFoTjk2cjBRY2NNRzlxd2N5M3ZxVHptNlhadi9mcmRwRDd5TElO?=
 =?utf-8?B?ckg5SGk0U0VmQzEzY3p2c0JjQ1h5TFJrYW9kYi9DNnhuVzROR1dxaThmRXBn?=
 =?utf-8?B?VHRLdWt2bCswZDl2aG9KdFN0ZllrY3AwUGZRM2JUbnBSNHh6YS9TSjgxSDZL?=
 =?utf-8?B?M3ZCMHlQMHVBYWY0N0JvdjRxWGs0MlhHZDlOd2FBN1AxVWhPbDE1c29uQUZD?=
 =?utf-8?B?MVVSTW0vcEQ5czJJQ1RMd2VLL0x4bkg2K1EvY1BMdkk3MWJVbWpscHpobDhq?=
 =?utf-8?B?ZVNhT3JvU2lyb2lZZFFkRjZFTnMzK0RKMG0xVVlTQnlENHFzTnJaNEd1eTFB?=
 =?utf-8?B?QnBsbXdMTGpQT3c3QURTVXFWdFI5Y1h3TnBUcTRTR3l6aEw5bFlmRTE4MzBo?=
 =?utf-8?B?WWYvYi8xRTNOd3hWUVF6OEVwTEExb1hWblQvZmorT1dTZ2JpVWJVUkRjK3F2?=
 =?utf-8?B?bzVUUzhlNDZuSFhERittOHE3ZnRPbk5mdjFyVjF1RmVLcFVneEttVitVZGdQ?=
 =?utf-8?B?M3A5aTBqREhLMjRFNFd1eW5rUzdvQ1IwQnVCRVVXQTN1SHZLYjRpaEs4T1pm?=
 =?utf-8?B?eGUzRk0zYUdSSkJGdHRuWmRTMFA1bDNQNjBTZHNwQ0hGNHF4dkVxdEpoSDMw?=
 =?utf-8?B?M0JSdWkxQnNGaUNQT0V5N2dJTDRZSzBqc2ZrekpGV2pGUU8zT3htWUprNmxp?=
 =?utf-8?B?UnFxVDY3TEo1NkFpZkl1eHloN0M2YjJTSmZHM3E5R0NYL096ZlVoU2lqZ1JF?=
 =?utf-8?B?WStEMlhhZXpSd2lGSjRvcWs1WmpOcFl4MXRXblVhVm1oRVgwdENsMDBhZnNS?=
 =?utf-8?B?UlNjUTNLSjhLS2taZ01XclNCWVlaR2FRdUdNNHdtVlg0eVNDaEV2NUN1OXZ0?=
 =?utf-8?B?VFdWWlhZNVQyVDVJV2d4MEd2K2tRZUkvR25VejZ0dk0vNVQ3bWlDNnJZVVhj?=
 =?utf-8?B?RUpTVGhTRExWZUtIVGJuSGxUMDlRMmdpNDEzY25vaUk1Q3JoQmhGNFBpaHpk?=
 =?utf-8?B?S3F3clZ2ZnB2Zk9pVkYxZ1RESmZqeTd6YUM0YnFiUmN4L2ZETFphZnRiT3gx?=
 =?utf-8?B?VXFBOXJ4QVhCSGRoSlM3RTB6dXd3b0FoVUhtTmFQNi9MbEd4MC9VMnYybWF1?=
 =?utf-8?B?VlNVcE9xdUtDMjVWZGdNNTZOaVVza0FraWhGb0N0QWpGUTYzbHJFdG1XZ2ds?=
 =?utf-8?B?N2U5blE3RHYwTGkwMmJUL1lwWmxDNThLTTkra3EvRkFYVHhKd2l0MjltazNv?=
 =?utf-8?B?RzZ4TDZJRXpmdG1mSWV4QnRueVluQW9ETEtaTWUzRExVYzUvaGY5VVRtMTl6?=
 =?utf-8?B?b3liSTMxbFhXemhOUUNKaE95VUZCOWgzQzI0aHZKcGFreTdxSnJUYmlQNnow?=
 =?utf-8?B?TGN3ZnhKclZ3SWk3UTBEK2R5Zk9ERmZ2THZ6b2t3ektWYTdOcndmZlIzNkM1?=
 =?utf-8?B?dUplWEpsTFlkeVZ5Vi9hdjBZanpxakY5YUhEZkVxMU8yRlpjeC9hOUdWOGxS?=
 =?utf-8?B?VXhtQ29xMnI0QXQ0ZlE0SGhQbElRQlV0WWZHZnlOQnNxMWRsMFpXaDlyUDh6?=
 =?utf-8?B?b3c9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72e90b65-998c-4ef7-6328-08dcfc7c244f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5533.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2024 02:55:31.9734
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mrkUbR4PeVM9cPT23VqfeEc8+oB09erFA4IZjjuUloUfvai4y6LM8N2PMfqc8ZLWWkgO65QJHA+z7lGJi0WSvt3A2rx466YckDaDkAib9r8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8583
X-Proofpoint-GUID: h7QqhT7wgHZhfcEz1vAnzm2znTljzkgO
X-Authority-Analysis: v=2.4 cv=YvBdRJYX c=1 sm=1 tr=0 ts=672837ab cx=c_pps a=GDxOUaUasxmcDRSC7gC2IA==:117 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=VlfZXiiP6vEA:10 a=bRTqI5nwn0kA:10 a=Q4-j1AaZAAAA:8 a=wX-RjXp6v9ljd8XxwBYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-ORIG-GUID: tU-W9NTTYsMt-4azXFZ0JWkijXfIfTcP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-04_01,2024-11-01_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxscore=0 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2409260000 definitions=main-2411040023
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 4A42YhQq024456
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 04 Nov 2024 02:55:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206670

Hi all,

Sorry for my mistakes.
I have mistake in cherry-pick. When resolving the cherry-pick conflicts,=20
I modify the codes according the the newest codes.
In fact, my modification includes=20
fe2699369f79981dcf913af4cfd98b342b84a9c1 and=20
c0619f08e6c608fd6464d2f0c6970ef0bbfb9ecf.
After I manually modify the codes, there are two lines missing:
 =C2=A0=C2=A0=C2=A0 g_time_zone_unref (tz);
 =C2=A0 + g_date_time_unref (gdt1);
 =C2=A0 + g_date_time_unref (gdt2);

So v3 will add the above two lines, and have more details of commit=20
messages.


Thanks.

Jinfeng

On 11/1/2024 7:53 PM, Richard Purdie wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, 2024-11-01 at 10:03 +0800, Wang, Jinfeng (CN) via
> lists.openembedded.org wrote:
>> Please ignore this patch. I will send a V3 later.
> Could you perhaps mention why? The v2 did pass in testing so I'm
> wondering what the v3 is going to change. I will hold off merging.
>
> Cheers,
>
> Richard

