Return-Path: <li.wang@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA04FC3DA4A
	for <webhook@archiver.kernel.org>; Tue, 30 Jul 2024 02:06:46 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8786.1722305196814868869
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jul 2024 19:06:37 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=8941a4b62c=li.wang@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46U1D1K1003331
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 02:06:36 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mqv62cj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 02:06:35 +0000 (GMT)
Received: from m0250812.ppops.net (m0250812.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46U26Z4g011267;
	Tue, 30 Jul 2024 02:06:35 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 40mqv62cj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jul 2024 02:06:35 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fyNgusPQMMf98KHyUmBQgPZ2rZ3Mzas7GvHpDVXBXZmIFQgxqU16ZCh8BhwNWZlrDdOz37fSY5XTMVs2MRMI7ygOHDYv5Z73qi4/gfjDkPrP5yudRzAVLZRBwN9SBk9Ipda6dtFooQYlg8vQc4wOioLC6IUu6TeaBylTtRTT4wLDLxSPbv/4UqUAmNzcgqccsJCBzVKDado2j6bLeirM8XKiUc8ZDCX9y9Cd5WrgjsmhZ3Hckq84IaPX0mWYvL52xEttT0MlOILRcLPMZXX9eKxKZlFxLREd2Num8MYYeU+R5uaeOLThKJG+Sm/YGxbp27DryioM7ESnROFQ2twPYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qiwrDOSCHGGS6mRMGEA8zgDKYU6EgE+87BNm/ubSLCc=;
 b=doTknH+hAMhzLnRFAYJw7b9mnhFTqZ7UfQ8YA7jraNxTYhDMQRrqlWVdY51FODO/leHBwTsre+pNxq2duqTSqY+j5QbizlJ9IgWp2fD2ZjldLjUt5DRN0W4ECAgKwzL/WqY1bP4iWVmb2ED5MXA7hFFs96QuPUMYXV4m7wugDspG2wvoPR1TmIpsyUU4wJ25ftYpHO507PuWA43N7lNGTfVdMLvmLc5TQgVtiOqpPC1Z6KGEwIrPPLN4IykeIkhVRQIMoJ4muTpwPZe/2LEjrf6PnabbGbcACXCmUjWslb/jMdW2Oiq6zc9Axkfv26yRLvWUblBHdglixICHQar4yA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from LV8PR11MB8697.namprd11.prod.outlook.com (2603:10b6:408:1fe::17)
 by CYXPR11MB8753.namprd11.prod.outlook.com (2603:10b6:930:d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Tue, 30 Jul
 2024 02:06:32 +0000
Received: from LV8PR11MB8697.namprd11.prod.outlook.com
 ([fe80::19f:bad3:70eb:42aa]) by LV8PR11MB8697.namprd11.prod.outlook.com
 ([fe80::19f:bad3:70eb:42aa%2]) with mapi id 15.20.7807.026; Tue, 30 Jul 2024
 02:06:31 +0000
Message-ID: <cd90e9bc-b6ee-405e-92fe-42507c7adb88@windriver.com>
Date: Tue, 30 Jul 2024 10:06:24 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [openembedded-core V2][master][PATCH]xinetd: use
 monotonic time
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240729144434.153005-1-li.wang@windriver.com>
 <CANNYZj9boK0816ap5hN8LqmpeyThanWjoYjjT=FtfpEjp-9R4w@mail.gmail.com>
Content-Language: en-US
From: "Wang, Li" <li.wang@windriver.com>
In-Reply-To: <CANNYZj9boK0816ap5hN8LqmpeyThanWjoYjjT=FtfpEjp-9R4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR04CA0009.apcprd04.prod.outlook.com
 (2603:1096:404:f6::21) To LV8PR11MB8697.namprd11.prod.outlook.com
 (2603:10b6:408:1fe::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV8PR11MB8697:EE_|CYXPR11MB8753:EE_
X-MS-Office365-Filtering-Correlation-Id: 6beb9039-bab1-4cb6-b6fb-08dcb03c3aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?WSszTGIvQ3hLRkNxeUxIVGljbHgwT3JlN3BwcEswbVUrRkI5UzFaMUkwYytt?=
 =?utf-8?B?Uzhpc1hNNmFVWHIrQUlPeFNqYjJjV3BVZU9PODRNNjd5d2Z6VFVBL1piNGFW?=
 =?utf-8?B?MlkyeTgzcnhMYldNQ2dwdG1XcjQ0VFhhQWlIdkJHVWs2QVU1OGpJTlZuZ3ZP?=
 =?utf-8?B?NXVReXZvQ05HQzRzMUpTbjdmdHNnM2xqNW5ldDk5dnp3V1lUWXg3N1VMUkVn?=
 =?utf-8?B?TWZmOUdzMXcwcS9lTmlWaytEN2pyR1F5QmhYQXFrRGtVR2w0MnFQQTZVMkpy?=
 =?utf-8?B?bTd1NGdyQTVHN2NnamNBaVZxRjhzTzUvKzJRNHVkZnhYVWV6ZE5tMVZ6eGx3?=
 =?utf-8?B?RjIrck5GVUFsYjQxZ2kyK2Z0Wm11czBPV3RVaGVoSml3T1g3YXhsMEtZN1V3?=
 =?utf-8?B?ZGZjd2xzZlpWalRydy9iL1NHYTVkRXBoaXA5bFpWSVhQeE1rL1pCNXE2cHdy?=
 =?utf-8?B?T1daSVJVMlI2eU1Od0pjOWIyNE81V1Nadld0QjUzbkplemp4YnAwVWRhWTgv?=
 =?utf-8?B?YVVraGFEdVFoN1Jxdmk3c0praktub204M0loUXdQSFF1M1MyWUQ1VTQyeU9F?=
 =?utf-8?B?ZnBJR1FKeThUK2Exc0E5Y1RIVy9mbjZJczNIOW9razBEN2s5TFQ4QmtQclpT?=
 =?utf-8?B?Z2J2UitFU2h2c2RDcFBEWEJObHZKS3ZBSGpZekVPVWxtSW13bytRdGRtSWp5?=
 =?utf-8?B?WVVyeW0yeGpsVXg0Y2tTK2kxZGI0T1RpaFRLRndMdzBKQy9uYXhPUnBCRmNU?=
 =?utf-8?B?WE9MYVVxNm5LNFVHNGpkUmRjZkZFSE00Z0JJUHNtM0JuSXVSS2hraFN3VEpt?=
 =?utf-8?B?dVBubFo1QXdva0NHNGcwWFY2a3FKcmlTbm51OVQ2clBvVUJia2VZT1o3UDNy?=
 =?utf-8?B?akp2QWo0bjFZQzB0d05obzhqZm96RjFiUWRrSnplNmlFOXgwTnFodThZb0F5?=
 =?utf-8?B?R0lQNFlPVHZoNkpDcU5CTy84UFJMWTRuMklzOGFnWjlJaU1RU3VHYVZVSDhZ?=
 =?utf-8?B?T0RIa0VjVWk2N3hTZ0JtVEtCWkFFWC9VYUNsN3dFWk1iVkhkTWRzZE1rWXJt?=
 =?utf-8?B?akhlOE1iZ1pacGRqY0g3bnhFWXdYc1BraFFvZForV3JVL0ZWNDZqeHZ5ZG1C?=
 =?utf-8?B?cW9aSGJrQ0xkQkdIS3BGaGliUUhWM1lMQUE0TXJ4UWRKOWdjeG1VM2FMN1E2?=
 =?utf-8?B?OXRvYVhZaGFvQktjTDNNWG05R2FxVzJoVWttSjVTQndYSVFCVHNDcmVxV3ZK?=
 =?utf-8?B?RVNPRWl3M1d0OGtmZjRLM1FqclNnRDhWWXlvWG9DY0twMFV4b1Q0anIreGVK?=
 =?utf-8?B?QXRDTlh3Sno0STdYUVhQUmk2QmhWMHppYm9OVHpiNy9ueU15dkswTENiNyt2?=
 =?utf-8?B?V21HeDZDNmRiQ29sMk1USTZSZ2dueFl5RUwrMWs2QlU3amJJMlRVSm1XWGRK?=
 =?utf-8?B?cmI2bHZQcEZrRWdBd05yaFR3YnpBN2hXZ3ExdmZIRGY4TGFxNENkaitsMmpJ?=
 =?utf-8?B?U0ZDTklyeGxIQ2d1R0x0SzVKeE5vdUowTDJzalFiY3g3V3F5QkhEUFRVMDRn?=
 =?utf-8?B?eXQ3TUQzSTVqRkN4dEFIY3NMaVZqTnQxRWpmaHEva1ZlTFJvbEJXMU0rdnlC?=
 =?utf-8?B?aWpvZmxVNUhJdHgvSkdxU0FBa0cxS1QwbmZHRVBKdWxBQnB4eWdNRFJiUXNj?=
 =?utf-8?B?eWtqY1A1Mm1qMnZqWlp5a0JpSFdSSVhTMVdsbk40NmJwQmcxZE1aWUlhaE9D?=
 =?utf-8?Q?DDzo3nqufz6blZPpvQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV8PR11MB8697.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnBMRGZWd2NGY0tablgzbVY4YnIzUGl2a3hRNE1iQU0yS3ZaWHgrNHM1U0VS?=
 =?utf-8?B?b1BpV2xaQnY4NlFKMmh5ZWhDSzJtTGZKVjdlVEwwTXhPcUQ3MXVzWjFSRUU2?=
 =?utf-8?B?TGNFQ2FMaTlZaUg0bFdJeWN1KytVYjErRCt6dDdkOExpbnpZTzIvaDh3SHgr?=
 =?utf-8?B?NHZBTS9rMkdWMUFzVW9saDR2SzVVdUNiOWxOaFVLVE5JV05UTG5PcEZ5K2lG?=
 =?utf-8?B?TGs0ZEcwaVBqaEY1SDNqY01WY3crS3RzR1RlUjZZRTBjS3VKMldieDFIRGhO?=
 =?utf-8?B?KzJpdy9RYjh1c0RXaTZTS1NGRnUvUjdxc0JuclBMZThSMHFuR0V1eWZoNkIr?=
 =?utf-8?B?bEV5dkxuOU0vMGhIcTJHcFhTS0NoRGcxUzRyYkFtVTAzRit0MkRqMkg3VERM?=
 =?utf-8?B?R3krSm43VDQzNjhrQ1d1bjVXblppcXJFNHozZlhLL05GL01aczRPU2F1MEg3?=
 =?utf-8?B?WklzTzNTWWt2ZFdzOXkrdW5KZXJWMEVpYTFJcG9RejFiMUd3VTVjYWJJd0dL?=
 =?utf-8?B?aFI1Q2NnSFNCMXAxejFoRDE4bEdIeVFXTjlpMExZdzU5QWVRZzIybDZORUpY?=
 =?utf-8?B?UUVJTVFyMHZ4ZXo4Q2wyR3J5QXo4bjJIQUt4aHVPM29ENHp4eStPMlJCZ2ZZ?=
 =?utf-8?B?Z1hzTTZ0L0VKZ29DWFg4S0NMdWJwd2R2dnBQYXJySER2dnltMFJoaG0rZGJy?=
 =?utf-8?B?UFZSYmhJa0hmamRmeXhWQ0QzVTUvWHFaUmVTeXE1KzlNSXM5L2RFSjlaWWxZ?=
 =?utf-8?B?VFJLWWsvc0Ixdm5BaEtRem4zcW82TVh0Ly96TjdlUStpcXMrUkZwclFsWTVV?=
 =?utf-8?B?OXhIVnlWNDZ3elFaQXdpcGhIOFZlM2dRSWxqZFdjYXBkUVAzcDlLd2RHcXd6?=
 =?utf-8?B?ZGh1bjAzTnJzc3lqaG9McHROOS9tTlUzbTdsaG90b3JKMW1vWHZkUFR3SEhJ?=
 =?utf-8?B?N2Irbm5TRXF1VzQrQzN5bFM1RUJzQVNKTStReUFvQnZrUEdoeWFMWUtkc1Az?=
 =?utf-8?B?ZW41OGROUGs2MW82cGNmUGlWOE9IbEY2OHFFTFhNREtESkprSThwRWtnV0J6?=
 =?utf-8?B?bE5CTDVCMjVKa0ZMZERXM2hobm1neDhGWUI4WXFmdmcrY1RvYVZMODRpWldo?=
 =?utf-8?B?dmMraS9yQjNaZWY1SFBRYjBZc2kwcWNlNmRqa1Rhc2k1Slg5Q3lCWnZGNnQ2?=
 =?utf-8?B?a0Ezb3pMRlE1dGgwWWpWWlc4NUxNSVBWM20rZWpMZFl2OEU0OG42QmJTQ0Zn?=
 =?utf-8?B?NnNwN0M5TGZCQ1l2Rmd4RUozUVdvQWphQ3hDY1pHcmJVVzlFbkJBNld6bnZX?=
 =?utf-8?B?VEJHS0RYcnpvYzFRREhnLzU5UkNsN3haelVmR2VBU1dIRDhwZjkrb2Y0WXdj?=
 =?utf-8?B?N1loQ3ZtYlNrNm9aRUlmOUZoM25rSzQ5OWhBdEZIOGF2ZDBQK3BhSkgybW9o?=
 =?utf-8?B?UnFhOTFDVXI4VVg3Z1llTzZjWEh5Rys4MWdRcG9Na0NZTHJVbjFHYnZLOXdW?=
 =?utf-8?B?N084TW5ERngyaWRpSlN3N0RDZWlDOTBCaG9jOUxwNEZiSzNZbEZDU2l6RnE2?=
 =?utf-8?B?ZE50ZEJVblBzQWFyRG5OVGUwTE03eEhBcE0yRzNLSDlVR0tiYmcwN25Pbk9i?=
 =?utf-8?B?bFpFNldDQTArTi9JNnl0S2NkZUtyWGdnSDRZUXdSWi90MFhQRnhGdVBpQ3RZ?=
 =?utf-8?B?MW5SdS9tWld4QXllZFJtamZqYVpJRmdvSWVsOEhvQ0FzL3JjQm0zNFVDQStY?=
 =?utf-8?B?bm4vai81ZjFoMlZjamxYcFJhZUp3RE1WbkNxcGJQbTFCSjVjbEFYY1VCM2hz?=
 =?utf-8?B?Uml3eDVYK0IvVFk0eXcvdXBRL25iSkF2elRyQzhWMElVNnBZdjF6YWFKWDBF?=
 =?utf-8?B?MDhUZVUxaFVoQ21VMUZwVFB4UHVBTTUxWGdBSHRaTER3Yk4zSHFaV3NnMGNV?=
 =?utf-8?B?TlBacGJ3UGRwZ2lIYnFiVWk4SzdjTWhnQ3U3UjJESnFmbXNTZFdMdjdIWnY0?=
 =?utf-8?B?Qm53OUFjRElGeEpwQ1pVOG1PU0lEcDdvN3BEWWUyVWFnMUdTekZlUHZnYit5?=
 =?utf-8?B?aytaRy8rQjg3dmVyVm5abUxIYUV1Q1NlejdtM2lBdEJ6ZkpxY2dOVi9MOFpw?=
 =?utf-8?Q?BiY+CgR6fD+IxEXzGu4HM8g6V?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6beb9039-bab1-4cb6-b6fb-08dcb03c3aa9
X-MS-Exchange-CrossTenant-AuthSource: LV8PR11MB8697.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2024 02:06:31.2268
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wPdbgzmcPfyiqMsJMZuUBzCilLs/uoSJ7naJ6gdD4IrLVv61bR1mk9t3jJ9Zhfz9G7QAtfOFUy8b/ePAfOVwCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR11MB8753
X-Proofpoint-GUID: J8qXmvRVIzAJ9cdeX7Jy42vcIUCNc6fO
X-Proofpoint-ORIG-GUID: 2JgYZ4aVaSQRZ527Px-6kzxzOMZFYUig
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_22,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.21.0-2407110000 definitions=main-2407300013
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Jul 2024 02:06:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/202665


On 7/30/2024 02:50, Alexander Kanavin wrote:
> On Mon, 29 Jul 2024 at 16:48, Li Wang via lists.openembedded.org
> <li.wang=windriver.com@lists.openembedded.org> wrote:
>> when using xinet.d to limit rsync connections and time is set back,
>> the connection limit is reached very quickly and rsync gets deactivated,
>> if time is changed again, rsync is never reactivated.
>>
>> date -s "xxx"
>> xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
>>
>> the timer of xinet.d is based on time() function, and it is affected by system time.
>>
>> Signed-off-by: Li Wang <li.wang@windriver.com>
>> ---
>>   .../xinetd/xinetd/use-monotonic-time.patch    | 246 ++++++++++++++++++
>>   .../xinetd/xinetd_2.3.15.4.bb                 |   1 +
>>   2 files changed, 247 insertions(+)
>>   create mode 100644 meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
>>
>> diff --git a/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
>> new file mode 100644
>> index 0000000000..2144c3cba2
>> --- /dev/null
>> +++ b/meta/recipes-extended/xinetd/xinetd/use-monotonic-time.patch
>> @@ -0,0 +1,246 @@
>> +use monotonic time
>> +
>> +when using xinet.d to limit rsync connections and time is set back,
>> +the connection limit is reached very quickly and rsync gets deactivated,
>> +if time is changed again, rsync is never reactivated.
>> +
>> +date -s "xxx"
>> +xinetd[xxx]: Deactivating service rsync due to excessive incoming connections. Restarting in 10 seconds.
>> +
>> +the timer of xinet.d is based on time() function, and it is affected by system time.
>> +
>> +Upstream-Status: Pending
> Is this patch taken from here?
> https://github.com/openSUSE/xinetd/pull/45
>
> If so, it has an incorrect upstream-status. Please fix that.

yes, but the upstream does not merge the patch, yet.

in this situation, what should I fill the status?

Thanks,
LiWang.

>
> Alex

