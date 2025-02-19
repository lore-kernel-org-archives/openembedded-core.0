Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06925C021AA
	for <webhook@archiver.kernel.org>; Wed, 19 Feb 2025 02:28:30 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.13599.1739932104846738941
 for <openembedded-core@lists.openembedded.org>;
 Tue, 18 Feb 2025 18:28:25 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=41458e6591=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51J1ToWt026375
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:28:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgemv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:28:23 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51J2SNJ6014432;
	Wed, 19 Feb 2025 02:28:23 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44w00kgemu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Feb 2025 02:28:23 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hEjKf3bqujih2W3+gG40EI50tqA9qaasJXaMFywT8d0Oe37xkJrBJmqeNwbsIr4F5PxRpKwKtUhvhAaIvUS7GyB/Bl5c5eNooNFV7DsortHZ8RGRfONExNp2WQPlcjGqdi2gaaY14+vAcbmMka7EJ+zljqVd9Dz/S8VoexaTuipyDM/d4HG4ExCRmFZ84ej9F9AA2WgRzFHsnR+yNRGyMAsjdEcj5VYvpMCcTfBCWhrCOL1RqtILtb5CgbaN7yNF+BQu2IpO/OQNjhbM2FSJWDj5pcLJFomqwWOSs3p1XmeeM8Ynyra33RjYm3AkjIyCI6++BpEcyGtoYtVR0q9Ydg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sj9z0LgfNoH/5v8zBgohjhtcGPHuRGEvP/Dgz8JJUw=;
 b=uxznowp/K2v3BiVwa/9qed8WODxVkwg5A9PFT3AYPuKKXjL202ZXwtvdtxFQEycYAGeScqc4mLG3nhjGxRSEdYSM3kLbNaBtbmkErZ5rI5BGLw3XySmdXBPFYwS5dgD+v068O6PkXGufSGHVoZLWez/2kEvJ27v3ytc4DvZPg1xnmTb1TvxkyvCpfWIyqTB5zdJQNIzc/UZcXySFvjyygV6E/0YZgDsSnx5PmEYcbxF1ChoFseV4NNoz3jeDcF63vAXoUehnC7BTakGTc3FlLZ54o/ztKfuRljacVi8LrPzKeiZJmj2FqtEKfVhmXVav+k8EQkT3bQYZhxGRf5iO8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7608.namprd11.prod.outlook.com (2603:10b6:510:269::20)
 by IA1PR11MB8801.namprd11.prod.outlook.com (2603:10b6:208:599::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Wed, 19 Feb
 2025 02:28:20 +0000
Received: from PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e]) by PH7PR11MB7608.namprd11.prod.outlook.com
 ([fe80::ef64:bc9f:eb8c:e6e%6]) with mapi id 15.20.8445.017; Wed, 19 Feb 2025
 02:28:19 +0000
Message-ID: <7fcfd8dd-6740-4594-be52-4f841b3d85df@windriver.com>
Date: Wed, 19 Feb 2025 10:28:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [scarthgap][PATCH v2 2/2] setuptools3-base.bbclass:
 override default subprocess timeout
To: Alexander Kanavin <alex.kanavin@gmail.com>, hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
References: <20250218133736.2113804-1-hongxu.jia@windriver.com>
 <20250218133736.2113804-2-hongxu.jia@windriver.com>
 <CANNYZj-X7wLRf9rxMBgDZn0nSDo12ya7nbhGTr=FZj=MPLu7=w@mail.gmail.com>
Content-Language: en-US
From: Hongxu Jia <hongxu.jia@windriver.com>
In-Reply-To: <CANNYZj-X7wLRf9rxMBgDZn0nSDo12ya7nbhGTr=FZj=MPLu7=w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TYAPR01CA0155.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::23) To PH7PR11MB7608.namprd11.prod.outlook.com
 (2603:10b6:510:269::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7608:EE_|IA1PR11MB8801:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f6332e2-9f9e-4e21-5c74-08dd508d12b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?K2g3N0x6N2pOV3dJbVlLS3YxZ0RPN2YzcVZlVkRoMnljRUlNb29iemJIN0dh?=
 =?utf-8?B?M0EvSXhXeXBKeGZFc0NhQ2pTazIxUDN5dnFaZkFLQmd0V2ZKQjdpcHZ0elVl?=
 =?utf-8?B?ZnV5RHY3OWJmT1dWdFZQQi9nTG9UVHEyYnBldTJzelZqMnVUNm1OWWRkeExU?=
 =?utf-8?B?VTBZV1VCTWtzU2g2bVAwSG9iZUNmbHJablR6MmtiREF0MERzTjdmanZia0lN?=
 =?utf-8?B?bkp3MXJQN00xSnVUOHlIWklhQ0EveEtJRjlTeXArSjJuRis3c04rcmw1UUVH?=
 =?utf-8?B?SnVlb2ZDZHBmK2lSaS8vYXJYcW1VOURBc1NIa01LSnZFbmU5Y0NQZUdEc2lR?=
 =?utf-8?B?ZGMxVmViV1RUWWYyOUthWnptd3pKOXFiVEU3ZmtKcGd1cTc5OEIzVzRoMFdH?=
 =?utf-8?B?Z3pWUWV3OXdGT0dSMnd0RU9wa2tEczlLYzlYVVp4ay9FYlFoZkxzNk1XdFlw?=
 =?utf-8?B?WkdENXFCS3pENmF6U0FjNi92aUtnQlZGaEw0UWRVUWUvVHpBWGJRZXFZd1Ew?=
 =?utf-8?B?MTNOL1ZyOUJSbXpHdVRNcDRzZjBwSUJ5cE5PWDBMcDdQdGVnUkhEbmNoVGZa?=
 =?utf-8?B?SUNKM3JFdGZYZEVBNXU2TUswWTY3N21qUm81MndiRWtrTG1FUGNZNk82ZFY2?=
 =?utf-8?B?VVBrbWFBVWNscHYwK2w0cHVwVUF3akVoS1o5WklZVUdHRlJvU2VTL0VON0ph?=
 =?utf-8?B?WUhCQ2hOaEllc01DbitXM0ZXaitDZlpLQkRWb210dUFkVHVqeTZLVlNmdGNi?=
 =?utf-8?B?NVczaldkOEcwaWEzTVJGTDFTZDF3Qlowdmd6YzFzMmF4VFBFT3ZEUWRLbWoy?=
 =?utf-8?B?VGxLVmR0b0Q5dUpxYWZidnprUDYvWUlva1NCeVk5S0NPN2VmOUpOYmxuK2Fk?=
 =?utf-8?B?SEVzY3dvbXRqZUFPU0pPakJtbGh6NHRRaE9aQmJhZ1dBWlQrYloxc2lZY3hT?=
 =?utf-8?B?Y3FYQlN0dXVveVgzUVI3aktHMjZUNTRVck9iTExpU0ZBN1pvRWZXV1V0akdR?=
 =?utf-8?B?QkpoWkxrTkY3YTFBMzlvNmZVWkRkdytnUzlZOTJDUkM3RHRVTXkzRDB4b0tW?=
 =?utf-8?B?NFVkaFhQcnlGTFNndHZzQ1BUVXUyWHV6ZUt2VFFmMkR0NFVVdTg4WlM4alBV?=
 =?utf-8?B?REhNOE1Fb3FoZE9qZ0JBUlpMRk4xelI1MGpPeXlNQlNqeStXTW1OdThCSi9Z?=
 =?utf-8?B?c01qOGlPQXlEdmtNZThyZFg5cjZBcm5RQ2tJQzV6T2RuTFpCTTNHOStWeWVW?=
 =?utf-8?B?bWszN0FxVjV5MjgvbnIyNEw2TXE0dGdLb1NhRVpOQjNsek4rQ25GaDdMejAy?=
 =?utf-8?B?NVZWUTBCb0RLUDBuUVYyMFRZVXZJbU5iWGVpaUhMQVRMdWNzdUw4WUhsT1Av?=
 =?utf-8?B?MUtOdWVrV3JFcnJmSkpIQ0NvdVZUVkhDVmFzQVVnbno4VHJvTFljbDNFdHNx?=
 =?utf-8?B?UXUyUC9lN294aU5KSTh2Y1pPRFROTXMrblowN0xXdTl4ckhHcGxLRDh6RkZ0?=
 =?utf-8?B?QS8vRWlzZkE2ZmplRVJxRFlpcUQ2cEIycW4rMDZtdC9pWWoxL2JpUTlIeFVV?=
 =?utf-8?B?VDR4OEh1SHBxQkg4cTI5VFZONUUwRVE2T0N0M0drbXk4eGpLcDlscHhKSWJu?=
 =?utf-8?B?TElJL2FydVk0VU9lR0JQRkp5akVScGx6dWpaSDZZRjZZelBJRDZGNFVqdFNl?=
 =?utf-8?B?VThCd2wwRXJDTU9mWktER1BFeHR0eHp6K2ZnWjBaQ3JQMTcxdzVyTWswVFYy?=
 =?utf-8?B?RWtka1hUS0QwOWVUUFhEbCtRalhIcEVQa1FtTVBWQnJkM0N1Yk1wOEhibHNu?=
 =?utf-8?B?dXY3RE9nenNzWUJ5NFljYURVNVc4aXFhaHdOWkdZUk4vVUp4cFBqYVhkdjZC?=
 =?utf-8?Q?eM7FOLVa3bmc+?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7608.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?T0tZdlMzK255QktIT25KZjdrYThXdEh6S1orbVNiOFpmTm1PcitGSWp4Rit0?=
 =?utf-8?B?QmdyR2ZmcEs3aE1COHhpelh6UTVDU2EzTEhOVTVaZzJrMmdvSnFHZU45Yzh4?=
 =?utf-8?B?N3JXWnhQeU1BdWFPZ1Y5NlZscXkzVVdrTEwrdXZWMWFRK0cyUW8xQWF6MllH?=
 =?utf-8?B?cjMxVldnTE1TQmQ1enY1TUdZTkY2NXVlNFlKVTBjZFdNUWgvdXNxdUM2WWhI?=
 =?utf-8?B?eHFpazc0eFU0YTFMMHhIazRCbWpsU0htZm9qSlFQQ2hhN29NcUYrODBHZC9j?=
 =?utf-8?B?dE5KSWtCK2Ira3JGaEljRGMvNFJCMW9TbjlKUXlVYVJTcE1XM0Raa0NMYkdv?=
 =?utf-8?B?VU9hUjFUUS9ZODIveVMycHg4VUZRVGdFRllvZHlYVmNUaGVyZXNuRklxSGtn?=
 =?utf-8?B?cjF0MWlYSG9PS056OGVIQUxkQ28zLzF1RkhZQXNPWWJidERpTU5xeGY0Mmto?=
 =?utf-8?B?Qy9DOWg1ZzZ0TzJ4aHdNY0cxc1RoN1Y2L21aWUdCRG9uWDFPL1hsbUlJYUN6?=
 =?utf-8?B?VGl6c2RWeDFHeUZXTFdMdkhuTEVrMlpSTWRtZjBPV3NMWnhUVk5nTVZEQXNN?=
 =?utf-8?B?SU80czJsZitGZG94dTVHLy9sNjJGN0ZVbDc1VzhDdXpWZTZleGxYeEkyTFNM?=
 =?utf-8?B?TXk5Tk13MnU2UDdGNkE1V3ErU1ZseThnelgxaWQvK2xEaU1ycVgxOHNzTHZN?=
 =?utf-8?B?bXB5YW8zYTF0UUlYeTFvbWE3Y3ZxNVhyQzFjaTRielZSb20yamoyWW9hdWtm?=
 =?utf-8?B?MGVxeG5CdkVXN21xUTl6d0tGTDBpYm95Slpad2gzN1J6aHI4MEtUa3BQdnJR?=
 =?utf-8?B?VW5HY08rS25tM1pieGJYRGw2SGt3ZHZNTUQ3bGtyTmdrQjlsdllOeG9CVS8v?=
 =?utf-8?B?NW95amRlSU9KWk5ySmFUYzFFNW13bmc4Wi9NRFhodFFPYXFCTjJPSEFTTCtX?=
 =?utf-8?B?R0dGc2p3QkhLSFhDVm51eWR0ejQrOG43eTRJbVczS1BoWmxkS3NWYlpZZE9X?=
 =?utf-8?B?ajBibDdvbUpCbWRpQVcvdDd4aUsrUjVST2V3QmszVlNPMWpZNmhvZk11TkZH?=
 =?utf-8?B?OFNmRG5EbFVkOUtkUUt0WmdZWDNHYjRmRTBIWkJJalZDc0EvaXVZMzNtMEpE?=
 =?utf-8?B?SldOTkh3eS9KRmdZWGNmcmhiRVBsQlBIeFk4cG0yaGJmVGU1Q1RjQzBLNkV2?=
 =?utf-8?B?VzhWWlRRUjhYYzVodEQ5TUlZTmlZSmhZSTlXYWQvNzJZRmNESDh4dTNwSm16?=
 =?utf-8?B?TytGVk10QzFSWk90bUVrZmtOVWd6cWRBN1p4TjcrNWs5T3BzOUIxNVdwSWYy?=
 =?utf-8?B?cE5USzExU2NtajJuR2N6akxnS3BGRk9YNEFWRkhDM01DTkhqT0lBckNZaWEv?=
 =?utf-8?B?S04venV1akw4QUVyY2xGOUVMek5ITDd6NXBYay80Y3pIb0hYdTEwZVkzQjE2?=
 =?utf-8?B?QUt4ZytyaUpCMUpIWlNGcUJnRjdqYVVUODlkWTh0bEhHTzZpTExFSVdqZGZY?=
 =?utf-8?B?SnA2VnJRNWdFK2tQdG5TRk5NRUhYOVVRNVh1emcydGh2dmIrVE1GcFRYcTI0?=
 =?utf-8?B?ZGpwZDhseWNxS0J5T3dsbURrUkZQc1JjemlIYVBtSHhCOUFab1BwamJEak9X?=
 =?utf-8?B?QzF0TW5MTlVJMW1VcTRiRWYwQXQwVFNNYm5Cd2FMbTZTaG00T0RaZktFZ2lQ?=
 =?utf-8?B?WitVK3Q1bHFCcUhaVy9UbkNhczlrM1JwS1U4K0JlOUpncUgrRHRQcmRlNGkr?=
 =?utf-8?B?Q2NVMXNxd0RnUmFNdzZ2cXRIMTdzRFBsbnY4dDBRWGdTK3VlLzhkZ2FXbnB4?=
 =?utf-8?B?R2h0WUN2Q2NQVW0zYllCbXpvTEh4YXRlV043RFZkQWlHQ1RXZ1lUNUdaQmZF?=
 =?utf-8?B?WFBPekdseHd0M2RsWHRwZmxHWTZkMjlVejY5YmJSZ1R4Wm9nZWZjMzlPMHNm?=
 =?utf-8?B?bUFoWUpnTmM5b0NxcXlLeFY4VWFYVytRMCtuS2YwQmRuRWZNQVdhbGtrdW1K?=
 =?utf-8?B?VlZ4SG1pTzlGZ2huTTVReHRMdEZPMHZHMXlJQnlkd3JtOUEyUGRnZmlCZGpR?=
 =?utf-8?B?ZzZVUHNOSmhrQ3BjMWZtQytadXNjZmlRMkNhU1BIcVNDcTVJSXcrczFjanRO?=
 =?utf-8?B?bDZkczJtakx5QUZpbzJ3cmZqT2hYaGNGaG85dmVYd0hsRlNMUExkMVNsallo?=
 =?utf-8?B?ZlE9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f6332e2-9f9e-4e21-5c74-08dd508d12b4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7608.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 02:28:19.3348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x8OI1OG7Xe0EvisTIgGH7X7Bd/6SKWA0nBFTcrJkGEMEiCqvVzScs6GVpqsbWidj0LN4qJERlfWivk3ZvVLNNOKkyRG+4t36Xoo4NsKMS8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8801
X-Proofpoint-GUID: 0GzuKvy4CsapeBA48HIGx5gvzE_25xDB
X-Proofpoint-ORIG-GUID: EzvNvT8fXoYP6WYhjulym6tvPl2r5FLz
X-Authority-Analysis: v=2.4 cv=BvtnwZX5 c=1 sm=1 tr=0 ts=67b541c7 cx=c_pps a=19NZlzvm9lyiwlsJLkNFGw==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=T2h4t0Lz3GQA:10 a=bRTqI5nwn0kA:10
 a=Q4-j1AaZAAAA:8 a=VgN9oKS-aMa3qjBxz-gA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-19_01,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 mlxscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2502100000
 definitions=main-2502190018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Feb 2025 02:28:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211661

On 2/18/25 21:47, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Tue, 18 Feb 2025 at 14:37, hongxu via lists.openembedded.org
> <hongxu.jia=eng.windriver.com@lists.openembedded.org> wrote:
>> Explicitly set variable SETUPTOOLS_SCM_SUBPROCESS_TIMEOUT to 600s in bbclass,
>> and we could override it in local.conf
> This hasn't been accepted in master yet. And there's a strong
> opposition, as this is felt to be something needed for misconfigured
> CIs that get I/O load beyond all reason. Can this be kept as your
> local tweak?

Sure, we kept it as local patch

//Hongxu

> Alex



