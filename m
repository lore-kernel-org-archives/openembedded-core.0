Return-Path: <peng.zhang1.cn@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05C2C282D1
	for <webhook@archiver.kernel.org>; Sun,  9 Mar 2025 07:32:08 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11591.1741505522174132665
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Mar 2025 23:32:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=51630b0c60=peng.zhang1.cn@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5297W1vo003746;
	Sat, 8 Mar 2025 23:32:01 -0800
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j278r2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Sat, 08 Mar 2025 23:32:01 -0800 (PST)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5297W0pR003716;
	Sat, 8 Mar 2025 23:32:00 -0800
Received: from nam04-bn8-obe.outbound.protection.outlook.com (mail-bn8nam04lp2042.outbound.protection.outlook.com [104.47.74.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 458j278r2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 08 Mar 2025 23:32:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B10OofnEonaGmH8mETpn+Q76JmrdI063uat2d9gJ7dKnrMFdnW220+jvj3rCvJzZI28lbD40lvncS6j0AR9Umh+zUD+JTkbQavm2GdB15HkOp+3pWmKz38ZKcJ2XnXCtDl0sJoeF7rLOOHRRxVSFpHXEtZWrnf3mupSeSMipbt+cVVxdk0euAnFwfD7mJCL7fuAjozgEcHEfVSmNOpsa4oTqin3CegPclTu7bkZuRsGCm3eR3fu3dNiOZ1uHsC5oj0kArYaSB6pA1nerwpXAhBEiJzYNoHUU6Zlzpzgga0OrAnJU751WQAokkZAYdP81qijIWCUn7gNZRsXpWPHFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuQowIoAUGGVGohWuNfrSkS/4SnAKGk9Ka8Wb4kHQV0=;
 b=bl0cO+HJI3KOSgBSr5v6d+NdFTmKjYlXThaQDvOzZs65tju4zVESXt57fhF8tmqNWl7tQaG18NIShzpotNkl7kuFrtoWx1JX0MkIGQ19LKiYXhLtzKzSvwQrtX5Qx+RxJCLri1QPni8Ft/WDWLrcLOAnN3TN8pmazjM1NbKwzraSj27/4YKJ61Y/4WyNXUonxqnpz6ShCcSjXvZ8KxTozU94nKPM51vM4qkUP5unElfPZc5NilOnS7wXZFSYFCkx9HE8zAIUTJTCF/hbIABXX3B1wi7kjFHusEbAj7s9IJIer70omVK1X1auqAEt6500ZIJlkUFbgtF8T1MD4F7+sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CH3PR11MB8562.namprd11.prod.outlook.com (2603:10b6:610:1b8::13)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Sun, 9 Mar
 2025 07:31:56 +0000
Received: from CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f]) by CH3PR11MB8562.namprd11.prod.outlook.com
 ([fe80::24c6:f8fc:1afe:179f%5]) with mapi id 15.20.8511.025; Sun, 9 Mar 2025
 07:31:56 +0000
Content-Type: multipart/alternative;
 boundary="------------kBPoBOrna8JoLJPxBxdTgjb9"
Message-ID: <38e6ea6d-4d1c-4419-834a-29c305491f6a@windriver.com>
Date: Sun, 9 Mar 2025 15:31:50 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][kirkstone][PATCH ] libtasn1: fix CVE-2024-12133
To: Vijay Anusuri <vanusuri@mvista.com>, steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
References: <20250307103950.3859258-1-peng.zhang1.cn@windriver.com>
 <CANQUz18GwO4HEGP+BK10wjJoe5=MZvyqANS-Ye1FBbyf1P9s9Q@mail.gmail.com>
 <CAOSpxdbuJ39w-P9C9b+GpOjudn1h4n9-XnGvHGk=hC2US4Wo9Q@mail.gmail.com>
 <CANQUz1-d8E6UOUu2s-wtPOAZEj0pAqYs6ZJZSniVm+cijoQAog@mail.gmail.com>
Content-Language: en-US
From: Peng Zhang <peng.zhang1.cn@windriver.com>
In-Reply-To: <CANQUz1-d8E6UOUu2s-wtPOAZEj0pAqYs6ZJZSniVm+cijoQAog@mail.gmail.com>
X-ClientProxiedBy: CY5P221CA0060.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:930:4::12) To CH3PR11MB8562.namprd11.prod.outlook.com
 (2603:10b6:610:1b8::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8562:EE_|CO1PR11MB5041:EE_
X-MS-Office365-Filtering-Correlation-Id: dc5086d6-0953-4c9a-ca8c-08dd5edc77f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|10070799003|8096899003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?dHVjQ0tBbllnbGNWWVg5V3NFQjNXa1d4Zzh1RnpPMzUvb3ZMOTlNaDFweHhN?=
 =?utf-8?B?OTk3TEU5RDhJbmFZR0Z4bndxOVl5cEVOTmc0c3ZlMnV0emxscnBnTVJIVGgy?=
 =?utf-8?B?QXhsNmNRZVllVUJ2R1pvUE4rZXBlbnZkay9NYUw4ZVl5LzhQZnU4VGRyT1VL?=
 =?utf-8?B?UFk0N2RvZlJDMlBkQTUrWnlmcTM2by9zU1BWM0FhWXVUd2lUa0htS3hOcFlH?=
 =?utf-8?B?d2M5a0sxT2FuTSsvemVaRk1NZXlmOGkzczlPRW1nWExhY0Z6dk95UWU2cTM0?=
 =?utf-8?B?UVpiS0ZzdkxKNTNtMkpybW0xWVZmYkkyRHYwdzFoK0puOXBPb2ZmWGpvam1r?=
 =?utf-8?B?M3piTEhKV2o5a3M2cFY3SWpaNTJqV0NvTHhBWmJrVnVaQTlLRXprTThmbVZR?=
 =?utf-8?B?UUlBZWE1ZFN2OTRsU2Jjc0V3YW4yeUdCZFk1VVFDdUZLYzhMYS9iclBYdWxz?=
 =?utf-8?B?SXNZVGJvUmJMcVZoODJEbHYxN09INjZ6TmVUSWdpTlRyYlA5c3I0cU4zTGYx?=
 =?utf-8?B?ajFzb2l0UnlnWEllOGtBVTdEZW5xVjhpVStCT1B0MWExbk84ZWlWOWxKWDI1?=
 =?utf-8?B?Qk1od1p4UnFIZUpoQk0xSXFoZS9WUTZGSHc5YURoUlRZUjQ2YWVKUm4vcGpK?=
 =?utf-8?B?N0NxWDBSZjlBSmV4UjExZlVKVlVjVkxoTENXb0N4NEh6eGd4Nlo1emZtc2FZ?=
 =?utf-8?B?OEt2cjkxdDBVT0RVdFNSWGhrMVhEQ1JqNk5Pc3Q1Y2VmZWFvMUZBMHV2MmNR?=
 =?utf-8?B?VjZ4T3Y1eWxFNVhxNVFmYmVYL2tveHVSdTRya1YxUnhSWnljeWZyYWVaL0xR?=
 =?utf-8?B?dkFkU01uczk1T00yenk4UTlqZ2c3N2V3K3FCZU5iRVE1ZjVrTU5nQ2xJTCtU?=
 =?utf-8?B?ZUhaTU1aKzZnSHJyZWhTalhBbUI2N0hPek5PakRoMytOQXQ5ZFNZR3FIMkNo?=
 =?utf-8?B?ZTJqN2wrUGpOZjNDbWFheTJWV0tHWlNBYXZwdSttZ0ZDK3FRTERPZzFOamxx?=
 =?utf-8?B?eUwzaXVteE9UcXFKanBhdVNBOGtiMTA0d050T3RCcUZlZUFqRnpCVWlZUTBD?=
 =?utf-8?B?c1pybGV3OXpWbFp1dlp4ZzJNaEE2Z013WVJkUmMrK1ZVUi9oSzhOTkY3di9s?=
 =?utf-8?B?MTAyS0wzTllSL3RNL2FzRkFMMGRxWmVDMk9CUEMyaC95SzhKR2gzN3NwQlpJ?=
 =?utf-8?B?bFAyVWd3V21vT3lEZnNOYWxTZHA0emQwTDR3Uys5MWN6S3VZNmZ3dUdPbHpE?=
 =?utf-8?B?cVJROEJ1VDhKMXFER0JLQTR0M1A5MlBhSTMzTmsyZGRvUEVna003aHlJcjdz?=
 =?utf-8?B?M01hTDltbGtidmhmZUdKYjBYbTVNQ3dncU9aWVJjanNRSUo4Z0JJSkhwYzZ2?=
 =?utf-8?B?OURzOENHZ1hHbDZLU1ZmNXBNSGtrMi9CV0pJalFuaTN2UVZmRVAwWG9yckJF?=
 =?utf-8?B?SUdPTU5tYjhPeUdUZVdIazNZbmYycmhzU25VR0dRVTJlTW9Vcmd0RFNLMHBB?=
 =?utf-8?B?OVlLdFlMTXV0QmpDZEh5VmtHeHhiMzBkYnU5OG94cDd2VHIxWVZmTEIvdkc5?=
 =?utf-8?B?cHoyTG90UnYzUW1OUDBWcHQ1M2hVV3F0VS9oTE93bXgzNDh6T0t5eFhQUnB4?=
 =?utf-8?B?SmdxWjl0NUVJWWRldU9ERWxIL1lRWFU1MkNOd3VWOVhYZmJ5dDJuZE9FMlkr?=
 =?utf-8?B?ZW11a1JWMzMxWlNLcUZXWE9WTzBQVVhUQkNMYlF4UWVXRjcwZlVwUlZaS0gw?=
 =?utf-8?Q?tGx1W8JPnUNX7zGZRRsPpUyO3E9Vre4SydJ3N80?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8562.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(10070799003)(8096899003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?YnhHRlJhM05LVEM0amNTN2tkaW1IMHozb0FvL29KdCtnWnNYbjNQSXRWanJX?=
 =?utf-8?B?RkI3RTg4YmxlZVBTUkx0UE1wWFFscHYyb0FWYjQ0OUxZeWNBZ0ozK0k5bkFG?=
 =?utf-8?B?YVZBT2wwRktNOGVpNktmdCtJYi9yQzlobUY2MnprL3FxeTZTTHRFUmRDa0tQ?=
 =?utf-8?B?N0tWaTEzdWtQeURybVh6OUZOZDJUdytLaVd5Mm1oSEdqYlBzWjJ1MC9PMTNT?=
 =?utf-8?B?Tksvb2hySXB2OWtEOGh1SjBKUlhFd2hSVXZQOW1VTnJ6RkM0dmd2RHowU0k0?=
 =?utf-8?B?Rzg1L1ZIRVBPUW5ZRE1DcytoRjBCUVFMQXJMMHhQMlVaSTNBbFBzcmd5QVBI?=
 =?utf-8?B?NzhyNjRXQWZZRElrb3NHYW9KeU0xbElrQndoTFRqbGY1MmVpOFVyTnd5aElW?=
 =?utf-8?B?dHp2V1l2N2x6WXhEYm1pcTYrcGMyYUJod1llMXhEY0NWYzU1MmNVWnRUWUw0?=
 =?utf-8?B?Nk5zR0N4ZGtBNzdrc2kyU3VXTFV5Sy9wbU9DK0wrbXFVOWlIRmFLODIrNm5U?=
 =?utf-8?B?ZkVLTUZLNVVDM2JWRW5KVy93OE9GWlc5aVJNWHIyMWFEbjRKRUFXSk8wSW9q?=
 =?utf-8?B?WFZWYzFxbUhwS1NDcklla2ZZZU5nbGNsdXRjamtZVEt1Q2dlcHMveSt4b012?=
 =?utf-8?B?c0hlcUhXRWJvNkdOWEVyajE3L09SdUV3ZHYzVzhWNUlhNEtDVHpVSGs5QkFE?=
 =?utf-8?B?UHMySG1LcGdMTUtjeTcyQ0VZa0x2VzVUYTg2RitaN3RIMS9XckdFQ1BuV1lr?=
 =?utf-8?B?NmhhbFBmbkVGSXFHNHpTZjdTM1AwOVdhK0s4STh5ak93UDFWc3ljbC9WZ3cy?=
 =?utf-8?B?RHlFRHNkWUZHNW9EV1BtbGVac3g3OXUrV3JjdERBSnFPbUUzMnUranVEZnhq?=
 =?utf-8?B?UUExbFB4TzRERWp5cllIdDlWYTBKcVIySEFjbjVHdkVaUjM3b0krRmF5d3RH?=
 =?utf-8?B?V1hKWXJ0T0VvQU1wVVBsb29GUEwvNlFOREFVb0pZSUhsSUczdXBwRVIwRjRX?=
 =?utf-8?B?amUyUHd2WU9BS0lMdnVuVnNWNVdTMmJKRVQvemtJMlFITnQ1cStrR0gxRklY?=
 =?utf-8?B?RnlUZ3YxSHpmSDdPZVFvTHlFMUJoRVZDM2ZodXdXVXpxQ3lER3l2Q0wzMlhT?=
 =?utf-8?B?d0lXaUM0TnhFc2x4NFZlenVMRzJjdit6dENka0tnZk9iOWpZVHkrUFQxTFh0?=
 =?utf-8?B?NnpCT1FwQTlBWnduMFhNOEhlRjJQOGxoK0d5WVpGRi9MRXBzck9xNkd4TTZY?=
 =?utf-8?B?ZGtHZW9aeVZ1M1F1Qlk4MzF1enQvQlZmdjJzMWlwb0JDaWF3YXpyclB2TExV?=
 =?utf-8?B?SE94MEdsV2dPOHhKZHh5b3BzVC9Ua1d5T0w5akNVZ04wcktYYVZTR2h6bGY1?=
 =?utf-8?B?bTFtN0RqejBZWlR5QU9rN21OVytVMFMySkZLaDAwU3pSWTZ3YlFWVlpBQm1H?=
 =?utf-8?B?RkZuMDZZNk1qLzRGRkMwckh0RjAxYXJtQlZkbUtSN1RVTVpqTUE5NjFrWml4?=
 =?utf-8?B?V3loRGRXbXRSUlg5cko4a0dOOGpGcnIwZE5mei9TUkVvUVQxSG1hRExmZnM1?=
 =?utf-8?B?N0FzbUtjcEVNNXZ4Qkh4U0hEcFd2TVo2N0hCZjRCaXBWSCtuazloZk52T0hM?=
 =?utf-8?B?UCttL3VrTjV0NXVtbHNZZnNMSkhqcCtxdXRRWkk5a3FHYXBtVEZsZk5Fai9G?=
 =?utf-8?B?VFhrQTJHK1crYWRsQXlnVWNvc0FFU3NRQVBLSXFRR3QrNVdRQWdMbTl2amZk?=
 =?utf-8?B?NVJaSnFTTkx3N3Z3QXhSa2Y3SFI0Um9pTk01c0xmM0wyc1RMczlFSnNvRUtl?=
 =?utf-8?B?K1VPS3BUeFM0QUFxMFR4aVdEYjFaakdXNnA5bi9IOXdPTFMzQnFUMEpVZGVz?=
 =?utf-8?B?MVVNbWFGVVA3ZWJsTlhwRVhCQ3NXQTlVZkNJYWg2OUUySTZmU0xEMzI3L2hE?=
 =?utf-8?B?b3ZMTHhESVZNR2x6ZCttbndpMnlPRVk3bDF3aXVibk5ZQVBIRGQ4VjVhYVY2?=
 =?utf-8?B?ZCszcFEwZFZ3NWpSaUNTUDQxQ2E4bUtic29DaVVwS1B5ZVJjODRTSmVsdWxM?=
 =?utf-8?B?UTQzMis1Wk52dU5nakcySzNHd2IwWUc0dlJtMEVxeUo2YTlSTFgvYWlnMEhr?=
 =?utf-8?B?T2pBNE9zYWpyek9kL3cra2xhTzFKMU5YV00wVkx4b1YycUprZlloUXBPTnVU?=
 =?utf-8?B?ZjBvS1J4bnNWa3lpZzh0OGVpYlJlOHNkZW4rSDVQektVTzZlczVCU1lqMGdm?=
 =?utf-8?B?QVN2MVRuS3VCdUtHS1VjV1FIVTd3PT0=?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc5086d6-0953-4c9a-ca8c-08dd5edc77f8
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8562.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2025 07:31:56.0391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0q4MWcAChOES1Elbma+yq+rwMG8prIqiDxmw4SdFh/JSkZNTZOd7XpO5sO06IBlSYFoBErJGJ+TKWlZd0opRfY/fT7KYegCiYJBw63HtyNE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-Proofpoint-ORIG-GUID: -t8FfVrFaUrMzR-BH3Hu0LPcm6KP3G_k
X-Authority-Analysis: v=2.4 cv=WNuFXmsR c=1 sm=1 tr=0 ts=67cd43f1 cx=c_pps a=CZyBIZNk7+VlD+/eRBofeA==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=Q4-j1AaZAAAA:8 a=e_rVToSkAAAA:8 a=PYnjg3YJAAAA:8 a=p0WdMEafAAAA:8 a=0zhiEtMHAAAA:8 a=t7CeM3EgAAAA:8 a=mDV3o1hIAAAA:8 a=H2kMXXDjAAAA:8 a=fk1lIlRQAAAA:8 a=rLo3Pwt-Y8QtsaUQCrcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=h0CFQEqI0dcA:10 a=pGLkceISAAAA:8
 a=-wK7LhDLjI_nyE48qoIA:9 a=7oBImkf4TDMVNoKU:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=9H3Qd4_ONW2Ztcrla5EB:22 a=-apfV7JZ--ObHKUXg5fw:22 a=v7CeC1Rd8Ef7gCqLsajQ:22 a=FdTzh2GWekK77mhwV6Dw:22 a=UQGQp_6C1EM-8DAw1ZOj:22 a=U75ogvRika4pmaD_UPO0:22
X-Proofpoint-GUID: lVxjiPe5NEaKZudoJsz-MFE9jq2t5OcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-09_02,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=884 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2502100000 definitions=main-2503090058
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Mar 2025 07:32:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212477

--------------kBPoBOrna8JoLJPxBxdTgjb9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5297W1vo003746

I also found no 'kirkstone' tag in=20
https://lists.openembedded.org/g/openembedded-core/message/212059 so I=20
sent the patch to 'kirkstone'. I will wait for it to be merged.

Thanks, Vijay and Steve.

//Peng

On 3/8/25 14:14, Vijay Anusuri wrote:
> **
> *CAUTION: This email comes from a non Wind River email account!*
> Do not click links or open attachments unless you recognize the sender=20
> and know the content is safe.
> Thanks Steve...!!!
>
> Thanks & Regards,
> Vijay
>
> On Fri, Mar 7, 2025 at 9:34=E2=80=AFPM Steve Sakoman via=20
> lists.openembedded.org=20
> <https://urldefense.com/v3/__http://lists.openembedded.org__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoFIlOSvg$>=20
> <steve=3Dsakoman.com@lists.openembedded.org> wrote:
>
>     On Fri, Mar 7, 2025 at 3:09=E2=80=AFAM Vijay Anusuri via
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL=
67rtPM63XColx8VOQoFIlOSvg$>
>     <vanusuri=3Dmvista.com@lists.openembedded.org>
>     wrote:
>     >
>     > Hi Zhang Peng,
>     >
>     > Updating libtasn1 to 4.20.0 from 4.19.0 will fix the CVE-2024-121=
33.
>     >
>     > Upgrade patch was already sent and now it is in the master branch=
 .
>     >
>     >
>     https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b=
9f522e0be31c08790a3f2050c6d052d93
>     <https://urldefense.com/v3/__https://git.openembedded.org/openembed=
ded-core/commit/?id=3D3a8633b9f522e0be31c08790a3f2050c6d052d93__;!!AjveYd=
w8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67=
rtPM63XColx8VOQooqWZmqw$>
>     >
>     >
>     https://lists.openembedded.org/g/openembedded-core/message/212059
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/212059__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6f=
Ru6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQrgYj7CFg$>
>     >
>     > Later it will merged to scarthgap and kirkstone branches.
>
>     Looks like you only tagged it for styhead and scarthgap. I'll add i=
t
>     to kirkstone too.
>
>     Steve
>
>
>     > On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul) (CN) vi=
a
>     lists.openembedded.org
>     <https://urldefense.com/v3/__http://lists.openembedded.org__;!!Ajve=
Ydw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL=
67rtPM63XColx8VOQoFIlOSvg$>
>     <peng.zhang1.cn
>     <https://urldefense.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!=
ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63=
XColx8VOQrRiB3nFQ$>=3Dwindriver.com@lists.openembedded.org>
>     wrote:
>     >>
>     >> From: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >>
>     >> CVE-2024-12133:
>     >> A flaw in libtasn1 causes inefficient handling of specific
>     certificate data.
>     >> When processing a large number of elements in a certificate,
>     libtasn1 takes
>     >> much longer than expected, which can slow down or even crash
>     the system.
>     >> This flaw allows an attacker to send a specially crafted
>     certificate,
>     >> causing a denial of service attack.
>     >>
>     >> Reference:
>     >> [https://nvd.nist.gov/vuln/detail/CVE-2024-12133
>     <https://urldefense.com/v3/__https://nvd.nist.gov/vuln/detail/CVE-2=
024-12133__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtat=
BZuH8GMStodprk96FL67rtPM63XColx8VOQoM0ZuTRA$>]
>     >>
>     >> Upstream patches:
>     >>
>     [https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546a=
fddf7780fc4a51f75a
>     <https://urldefense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/c=
ommit/4082ca2220b5ba910b546afddf7780fc4a51f75a__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQr=
uFLlQxQ$>]
>     >>
>     [https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dab=
cad84e1c22545ffc3d
>     <https://urldefense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/c=
ommit/869a97aa259dffa2620dabcad84e1c22545ffc3d__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQo=
R8tbYcg$>]
>     >>
>     >> Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >> ---
>     >>=C2=A0 .../gnutls/libtasn1/CVE-2024-12133-0001.patch | 43 ++++
>     >>=C2=A0 .../gnutls/libtasn1/CVE-2024-12133-0002.patch | 235
>     ++++++++++++++++++
>     >>=C2=A0 .../recipes-support/gnutls/libtasn1_4.19.0.bb
>     <https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoRfAGovw$>
>     |=C2=A0 =C2=A02 +
>     >>=C2=A0 3 files changed, 280 insertions(+)
>     >>=C2=A0 create mode 100644
>     meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>     >>=C2=A0 create mode 100644
>     meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>     >>
>     >> diff --git
>     a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>     b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>     >> new file mode 100644
>     >> index 0000000000..d843b6dc92
>     >> --- /dev/null
>     >> +++
>     b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch
>     >> @@ -0,0 +1,43 @@
>     >> +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon Sep 17
>     00:00:00 2001
>     >> +From: Daiki Ueno <ueno@gnu.org>
>     >> +Date: Sat, 19 Oct 2024 02:47:04 +0900
>     >> +Subject: [PATCH] asn1_der_decoding2: optimize _asn1_find_up
>     call with node
>     >> + cache
>     >> +
>     >> +If we are parsing a sequence or set and the current node is a
>     direct
>     >> +child of it, there is no need to traverse the list back to the
>     >> +leftmost one as we have a node cache.
>     >> +
>     >> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
>     >> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
>     >> +
>     >> +CVE: CVE-2024-12133
>     >> +Upstream-Status: Backport
>     [https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546a=
fddf7780fc4a51f75a
>     <https://urldefense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/c=
ommit/4082ca2220b5ba910b546afddf7780fc4a51f75a__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQr=
uFLlQxQ$>]
>     >> +
>     >> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >> +---
>     >> + lib/decoding.c | 9 ++++++++-
>     >> + 1 file changed, 8 insertions(+), 1 deletion(-)
>     >> +
>     >> +diff --git a/lib/decoding.c b/lib/decoding.c
>     >> +index d2f6dea..1e0fcb3 100644
>     >> +--- a/lib/decoding.c
>     >> ++++ b/lib/decoding.c
>     >> +@@ -1570,7 +1570,14 @@ asn1_der_decoding2 (asn1_node *element,
>     const void *ider, int *max_ider_len,
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0move =3D UP;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (move =3D=3D UP)
>     >> +-=C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);
>     >> ++=C2=A0 =C2=A0 =C2=A0 {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* If we are parsing a sequence or=
 set and p is a direct
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0child of it, no need =
to traverse the list back to
>     the leftmost node. */
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (tcache.tail =3D=3D p)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D tcache.head;
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 else
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_find_up (p);
>     >> ++=C2=A0 =C2=A0 =C2=A0 }
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> +
>     >> +=C2=A0 =C2=A0_asn1_delete_not_used (*element);
>     >> +--
>     >> +GitLab
>     >> diff --git
>     a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>     b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>     >> new file mode 100644
>     >> index 0000000000..a3a6af2920
>     >> --- /dev/null
>     >> +++
>     b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch
>     >> @@ -0,0 +1,235 @@
>     >> +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon Sep 17
>     00:00:00 2001
>     >> +From: Daiki Ueno <ueno@gnu.org>
>     >> +Date: Fri, 8 Nov 2024 16:05:32 +0900
>     >> +Subject: [PATCH] asn1_find_node: optimize "?NUMBER" node
>     lookup with indexing
>     >> +
>     >> +To avoid linear search of named nodes, this adds a array of chi=
ld
>     >> +nodes to their parent nodes as a cache.
>     >> +
>     >> +Signed-off-by: Daiki Ueno <ueno@gnu.org>
>     >> +Signed-off-by: Simon Josefsson <simon@josefsson.org>
>     >> +
>     >> +CVE: CVE-2024-12133
>     >> +Upstream-Status: Backport
>     [https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dab=
cad84e1c22545ffc3d
>     <https://urldefense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/c=
ommit/869a97aa259dffa2620dabcad84e1c22545ffc3d__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQo=
R8tbYcg$>]
>     >> +
>     >> +Signed-off-by: Zhang Peng <peng.zhang1.cn@windriver.com>
>     >> +---
>     >> + lib/element.c=C2=A0 =C2=A0 | 56
>     ++++++++++++++++++++++++++++++++++++++++++------
>     >> + lib/element.h=C2=A0 =C2=A0 | 10 +++++++++
>     >> + lib/int.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 +++++++
>     >> + lib/parser_aux.c | 10 +++++++++
>     >> + lib/structure.c=C2=A0 | 13 +++++++++++
>     >> + 5 files changed, 90 insertions(+), 7 deletions(-)
>     >> +
>     >> +diff --git a/lib/element.c b/lib/element.c
>     >> +index 850bef4a..528df418 100644
>     >> +--- a/lib/element.c
>     >> ++++ b/lib/element.c
>     >> +@@ -33,6 +33,8 @@
>     >> + #include "structure.h"
>     >> + #include "c-ctype.h"
>     >> + #include "element.h"
>     >> ++#include <limits.h>
>     >> ++#include "intprops.h"
>     >> +
>     >> + void
>     >> + _asn1_hierarchical_name (asn1_node_const node, char *name,
>     int name_size)
>     >> +@@ -129,6 +131,41 @@ _asn1_convert_integer (const unsigned
>     char *value, unsigned char *value_out,
>     >> +=C2=A0 =C2=A0return ASN1_SUCCESS;
>     >> + }
>     >> +
>     >> ++int
>     >> ++_asn1_node_array_set (struct asn1_node_array_st *array,
>     size_t position,
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 asn1_node node)
>     >> ++{
>     >> ++=C2=A0 if (position >=3D array->size)
>     >> ++=C2=A0 =C2=A0 {
>     >> ++=C2=A0 =C2=A0 =C2=A0 size_t new_size =3D position, i;
>     >> ++=C2=A0 =C2=A0 =C2=A0 asn1_node *new_nodes;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, 2))
>     >> ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;
>     >> ++=C2=A0 =C2=A0 =C2=A0 new_size *=3D 2;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (INT_ADD_OVERFLOW (new_size, 1))
>     >> ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;
>     >> ++=C2=A0 =C2=A0 =C2=A0 new_size +=3D 1;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (INT_MULTIPLY_OVERFLOW (new_size, size=
of (*new_nodes)))
>     >> ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 new_nodes =3D realloc (array->nodes, new_=
size * sizeof
>     (*new_nodes));
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (!new_nodes)
>     >> ++=C2=A0 =C2=A0 =C2=A0 return ASN1_MEM_ALLOC_ERROR;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 for (i =3D array->size; i < new_size; i++=
)
>     >> ++=C2=A0 =C2=A0 =C2=A0 new_nodes[i] =3D NULL;
>     >> ++
>     >> ++=C2=A0 =C2=A0 =C2=A0 array->nodes =3D new_nodes;
>     >> ++=C2=A0 =C2=A0 =C2=A0 array->size =3D new_size;
>     >> ++=C2=A0 =C2=A0 }
>     >> ++
>     >> ++=C2=A0 array->nodes[position] =3D node;
>     >> ++=C2=A0 return ASN1_SUCCESS;
>     >> ++}
>     >> ++
>     >> + /* Appends a new element into the sequence (or set) defined
>     by this
>     >> +=C2=A0 * node. The new element will have a name of '?number', w=
here
>     number
>     >> +=C2=A0 * is a monotonically increased serial number.
>     >> +@@ -145,6 +182,7 @@ _asn1_append_sequence_set (asn1_node node,
>     struct node_tail_cache_st *pcache)
>     >> +=C2=A0 =C2=A0asn1_node p, p2;
>     >> +=C2=A0 =C2=A0char temp[LTOSTR_MAX_SIZE + 1];
>     >> +=C2=A0 =C2=A0long n;
>     >> ++=C2=A0 int result;
>     >> +
>     >> +=C2=A0 =C2=A0if (!node || !(node->down))
>     >> +=C2=A0 =C2=A0 =C2=A0return ASN1_GENERIC_ERROR;
>     >> +@@ -177,17 +215,21 @@ _asn1_append_sequence_set (asn1_node
>     node, struct node_tail_cache_st *pcache)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0pcache->tail =3D p2;
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> +
>     >> +-=C2=A0 if (p->name[0] =3D=3D 0)
>     >> +-=C2=A0 =C2=A0 _asn1_str_cpy (temp, sizeof (temp), "?1");
>     >> +-=C2=A0 else
>     >> ++=C2=A0 n =3D 0;
>     >> ++=C2=A0 if (p->name[0] !=3D 0)
>     >> +=C2=A0 =C2=A0 =C2=A0{
>     >> +-=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p->name + 1, NULL, 0);
>     >> +-=C2=A0 =C2=A0 =C2=A0 n++;
>     >> +-=C2=A0 =C2=A0 =C2=A0 temp[0] =3D '?';
>     >> +-=C2=A0 =C2=A0 =C2=A0 _asn1_ltostr (n, temp + 1);
>     >> ++=C2=A0 =C2=A0 =C2=A0 n =3D strtol (p->name + 1, NULL, 10);
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (n <=3D 0 || n >=3D LONG_MAX - 1)
>     >> ++=C2=A0 =C2=A0 =C2=A0 return ASN1_GENERIC_ERROR;
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> ++=C2=A0 temp[0] =3D '?';
>     >> ++=C2=A0 _asn1_ltostr (n + 1, temp + 1);
>     >> +=C2=A0 =C2=A0_asn1_set_name (p2, temp);
>     >> +=C2=A0 =C2=A0/*=C2=A0 p2->type |=3D CONST_OPTION; */
>     >> ++=C2=A0 result =3D _asn1_node_array_set (&node->numbered_childr=
en, n,
>     p2);
>     >> ++=C2=A0 if (result !=3D ASN1_SUCCESS)
>     >> ++=C2=A0 =C2=A0 return result;
>     >> ++=C2=A0 p2->parent =3D node;
>     >> +
>     >> +=C2=A0 =C2=A0return ASN1_SUCCESS;
>     >> + }
>     >> +diff --git a/lib/element.h b/lib/element.h
>     >> +index 732054e9..b84e3a27 100644
>     >> +--- a/lib/element.h
>     >> ++++ b/lib/element.h
>     >> +@@ -38,4 +38,14 @@ int _asn1_convert_integer (const unsigned
>     char *value,
>     >> + void _asn1_hierarchical_name (asn1_node_const node, char *name=
,
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int name_size);
>     >> +
>     >> ++static inline asn1_node_const
>     >> ++_asn1_node_array_get (const struct asn1_node_array_st *array,
>     size_t position)
>     >> ++{
>     >> ++=C2=A0 return position < array->size ? array->nodes[position] =
: NULL;
>     >> ++}
>     >> ++
>     >> ++int
>     >> ++_asn1_node_array_set (struct asn1_node_array_st *array,
>     size_t position,
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 asn1_node node);
>     >> ++
>     >> + #endif
>     >> +diff --git a/lib/int.h b/lib/int.h
>     >> +index 4f2d98d1..41b12b0b 100644
>     >> +--- a/lib/int.h
>     >> ++++ b/lib/int.h
>     >> +@@ -31,6 +31,12 @@
>     >> +
>     >> + # define ASN1_SMALL_VALUE_SIZE 16
>     >> +
>     >> ++struct asn1_node_array_st
>     >> ++{
>     >> ++=C2=A0 asn1_node *nodes;
>     >> ++=C2=A0 size_t size;
>     >> ++};
>     >> ++
>     >> + /* This structure is also in libtasn1.h, but then contains les=
s
>     >> +=C2=A0 =C2=A0 fields.=C2=A0 You cannot make any modifications t=
o these first
>     fields
>     >> +=C2=A0 =C2=A0 without breaking ABI.=C2=A0 */
>     >> +@@ -47,6 +53,8 @@ struct asn1_node_st
>     >> +=C2=A0 =C2=A0asn1_node left;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0/* Pointer to the next list
>     element */
>     >> +=C2=A0 =C2=A0/* private fields: */
>     >> +=C2=A0 =C2=A0unsigned char small_value[ASN1_SMALL_VALUE_SIZE];=C2=
=A0 =C2=A0/* For
>     small values */
>     >> ++=C2=A0 asn1_node parent;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Pointer to the parent node */
>     >> ++=C2=A0 struct asn1_node_array_st numbered_children; /* Array o=
f
>     unnamed child nodes for caching */
>     >> +
>     >> +=C2=A0 =C2=A0/* values used during decoding/coding */
>     >> +=C2=A0 =C2=A0int tmp_ival;
>     >> +diff --git a/lib/parser_aux.c b/lib/parser_aux.c
>     >> +index 415905a0..4281cc97 100644
>     >> +--- a/lib/parser_aux.c
>     >> ++++ b/lib/parser_aux.c
>     >> +@@ -126,6 +126,7 @@ asn1_find_node (asn1_node_const pointer,
>     const char *name)
>     >> +=C2=A0 =C2=A0const char *n_start;
>     >> +=C2=A0 =C2=A0unsigned int nsize;
>     >> +=C2=A0 =C2=A0unsigned int nhash;
>     >> ++=C2=A0 const struct asn1_node_array_st *numbered_children;
>     >> +
>     >> +=C2=A0 =C2=A0if (pointer =3D=3D NULL)
>     >> +=C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +@@ -209,6 +210,7 @@ asn1_find_node (asn1_node_const pointer,
>     const char *name)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p->down =3D=3D NULL)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +
>     >> ++=C2=A0 =C2=A0 =C2=A0 numbered_children =3D &p->numbered_childr=
en;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0p =3D p->down;
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (p =3D=3D NULL)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;
>     >> +@@ -222,6 +224,12 @@ asn1_find_node (asn1_node_const pointer,
>     const char *name)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0}
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0else
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0{=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* no "?LAST" */
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (n[0] =3D=3D '?' && c_isdigit (=
n[1]))
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 long position =3D st=
rtol (n + 1, NULL, 10);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (position > 0 && =
position < LONG_MAX)
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 p =3D _asn1_n=
ode_array_get (numbered_children,
>     position - 1);
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0while (p)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (p->name_has=
h =3D=3D nhash && !strcmp (p->name, n))
>     >> +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node node,
>     unsigned int flags)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0if (node->value !=3D node->small_val=
ue)
>     >> +=C2=A0 =C2=A0 =C2=A0 =C2=A0free (node->value);
>     >> +=C2=A0 =C2=A0 =C2=A0}
>     >> ++
>     >> ++=C2=A0 free (node->numbered_children.nodes);
>     >> +=C2=A0 =C2=A0free (node);
>     >> + }
>     >> +
>     >> +diff --git a/lib/structure.c b/lib/structure.c
>     >> +index 9c95b9e2..32692ad2 100644
>     >> +--- a/lib/structure.c
>     >> ++++ b/lib/structure.c
>     >> +@@ -31,6 +31,9 @@
>     >> + #include <structure.h>
>     >> + #include "parser_aux.h"
>     >> + #include <gstr.h>
>     >> ++#include "c-ctype.h"
>     >> ++#include "element.h"
>     >> ++#include <limits.h>
>     >> +
>     >> +
>     >> + extern char _asn1_identifierMissing[];
>     >> +@@ -391,6 +394,16 @@ asn1_delete_element (asn1_node structure,
>     const char *element_name)
>     >> +=C2=A0 =C2=A0if (source_node =3D=3D NULL)
>     >> +=C2=A0 =C2=A0 =C2=A0return ASN1_ELEMENT_NOT_FOUND;
>     >> +
>     >> ++=C2=A0 if (source_node->parent
>     >> ++=C2=A0 =C2=A0 =C2=A0 && source_node->name[0] =3D=3D '?'
>     >> ++=C2=A0 =C2=A0 =C2=A0 && c_isdigit (source_node->name[1]))
>     >> ++=C2=A0 =C2=A0 {
>     >> ++=C2=A0 =C2=A0 =C2=A0 long position =3D strtol (source_node->na=
me + 1, NULL, 10);
>     >> ++=C2=A0 =C2=A0 =C2=A0 if (position > 0 && position < LONG_MAX)
>     >> ++=C2=A0 =C2=A0 =C2=A0 _asn1_node_array_set
>     (&source_node->parent->numbered_children,
>     >> ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 position - 1, NULL);
>     >> ++=C2=A0 =C2=A0 }
>     >> ++
>     >> +=C2=A0 =C2=A0p2 =3D source_node->right;
>     >> +=C2=A0 =C2=A0p3 =3D _asn1_find_left (source_node);
>     >> +=C2=A0 =C2=A0if (!p3)
>     >> +--
>     >> +GitLab
>     >> diff --git a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>     <https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoRfAGovw$>
>     b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>     <https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoRfAGovw$>
>     >> index 5fb8b54c06..d5bc1e408e 100644
>     >> --- a/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>     <https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoRfAGovw$>
>     >> +++ b/meta/recipes-support/gnutls/libtasn1_4.19.0.bb
>     <https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8=
EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rt=
PM63XColx8VOQoRfAGovw$>
>     >> @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
>     "file://doc/COPYING;md5=3Dd32239bcb673463ab874e80d47fae504 \
>     >>
>     >>=C2=A0 SRC_URI =3D "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz =
\
>     >> file://dont-depend-on-help2man.patch \
>     >> + file://CVE-2024-12133-0001.patch \
>     >> + file://CVE-2024-12133-0002.patch \
>     >>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"
>     >>
>     >>=C2=A0 DEPENDS =3D "bison-native"
>     >> --
>     >> 2.43.0
>     >>
>     >>
>     >>
>     >>
>     >
>     >
>     >
>
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#212453):
>     https://lists.openembedded.org/g/openembedded-core/message/212453
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/message/212453__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6f=
Ru6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQpbPFwCsQ$>
>     Mute This Topic:
>     https://lists.openembedded.org/mt/111565382/7301997
>     <https://urldefense.com/v3/__https://lists.openembedded.org/mt/1115=
65382/7301997__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTy=
BtatBZuH8GMStodprk96FL67rtPM63XColx8VOQodEvG9qA$>
>     Group Owner: openembedded-core+owner@lists.openembedded.org
>     <mailto:openembedded-core%2Bowner@lists.openembedded.org>
>     Unsubscribe:
>     https://lists.openembedded.org/g/openembedded-core/unsub
>     <https://urldefense.com/v3/__https://lists.openembedded.org/g/opene=
mbedded-core/unsub__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoU=
RbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQrW4QaMAw$>
>     [vanusuri@mvista.com]
>     -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
--------------kBPoBOrna8JoLJPxBxdTgjb9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 5297W1vo003746

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p data-start=3D"53" data-end=3D"242">I also found no 'kirkstone' tag
      in&nbsp;<a class=3D"moz-txt-link-freetext" href=3D"https://lists.op=
enembedded.org/g/openembedded-core/message/212059">https://lists.openembe=
dded.org/g/openembedded-core/message/212059</a>
      so I sent the patch to 'kirkstone'. I will wait for it to be
      merged.</p>
    <p data-start=3D"244" data-end=3D"270">Thanks, Vijay and Steve.</p>
    <p data-start=3D"272" data-end=3D"281">//Peng</p>
    <div class=3D"moz-cite-prefix">On 3/8/25 14:14, Vijay Anusuri wrote:<=
br>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:CANQUz1-d8E6UOUu2s-wtPOAZEj0pAq=
Ys6ZJZSniVm+cijoQAog@mail.gmail.com">
     =20
      <strong>
      </strong>
      <div style=3D"border:solid #9c6500 1pt;padding:2pt;background:#fcfc=
03"><strong><class=3D"msonormal" style=3D"line-height:11pt"><span style=3D=
"font-size:11pt;color:#000">CAUTION: This email
              comes from a non Wind River email account!</span></class=3D=
"msonormal"></strong><br>
        <class=3D"msonormal" style=3D"line-height:10pt3"><span style=3D"f=
ont-size:10pt;color:#000">Do not click links or open
            attachments unless you recognize the sender and know the
            content is safe.</span><br>
        </class=3D"msonormal"></div>
      <div>
        <div dir=3D"ltr">
          <div>Thanks Steve...!!!<br>
            <br>
          </div>
          <div>Thanks &amp; Regards,</div>
          <div>Vijay</div>
        </div>
        <br>
        <div class=3D"gmail_quote gmail_quote_container">
          <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 7, 2025 at
            9:34=E2=80=AFPM Steve Sakoman via
            <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZ=
uH8GMStodprk96FL67rtPM63XColx8VOQoFIlOSvg$" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;steve=3D<a href=3D"mailto:sa=
koman.com@lists.openembedded.org" moz-do-not-send=3D"true" class=3D"moz-t=
xt-link-freetext">sakoman.com@lists.openembedded.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            On Fri, Mar 7, 2025 at 3:09=E2=80=AFAM Vijay Anusuri via<br>
            <a href=3D"https://urldefense.com/v3/__http://lists.openembed=
ded.org__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZ=
uH8GMStodprk96FL67rtPM63XColx8VOQoFIlOSvg$" rel=3D"noreferrer" target=3D"=
_blank" moz-do-not-send=3D"true">lists.openembedded.org</a>
            &lt;vanusuri=3D<a href=3D"mailto:mvista.com@lists.openembedde=
d.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-f=
reetext">mvista.com@lists.openembedded.org</a>&gt;<br>
            wrote:<br>
            &gt;<br>
            &gt; Hi Zhang Peng,<br>
            &gt;<br>
            &gt; Updating libtasn1 to 4.20.0 from 4.19.0 will fix the
            CVE-2024-12133.<br>
            &gt;<br>
            &gt; Upgrade patch was already sent and now it is in the
            master branch .<br>
            &gt;<br>
            &gt; <a href=3D"https://urldefense.com/v3/__https://git.opene=
mbedded.org/openembedded-core/commit/?id=3D3a8633b9f522e0be31c08790a3f205=
0c6d052d93__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBta=
tBZuH8GMStodprk96FL67rtPM63XColx8VOQooqWZmqw$" rel=3D"noreferrer" target=3D=
"_blank" moz-do-not-send=3D"true">
https://git.openembedded.org/openembedded-core/commit/?id=3D3a8633b9f522e=
0be31c08790a3f2050c6d052d93</a><br>
            &gt;<br>
            &gt; <a href=3D"https://urldefense.com/v3/__https://lists.ope=
nembedded.org/g/openembedded-core/message/212059__;!!AjveYdw8EvQ!ZzeGfovm=
8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VO=
QrgYj7CFg$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true"=
>
https://lists.openembedded.org/g/openembedded-core/message/212059</a><br>
            &gt;<br>
            &gt; Later it will merged to scarthgap and kirkstone
            branches.<br>
            <br>
            Looks like you only tagged it for styhead and scarthgap.&nbsp=
;
            I'll add it<br>
            to kirkstone too.<br>
            <br>
            Steve<br>
            <br>
            <br>
            &gt; On Fri, Mar 7, 2025 at 4:10=E2=80=AFPM Zhang, Peng (Paul=
) (CN)
            via <a href=3D"https://urldefense.com/v3/__http://lists.opene=
mbedded.org__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBt=
atBZuH8GMStodprk96FL67rtPM63XColx8VOQoFIlOSvg$" rel=3D"noreferrer" target=
=3D"_blank" moz-do-not-send=3D"true">
              lists.openembedded.org</a> &lt;<a href=3D"https://urldefens=
e.com/v3/__http://peng.zhang1.cn__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-Xwk=
lfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQrRiB3nFQ$" rel=3D=
"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">peng.zhang1.cn</a=
>=3D<a href=3D"mailto:windriver.com@lists.openembedded.org" target=3D"_bl=
ank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">windriver.c=
om@lists.openembedded.org</a>&gt;
            wrote:<br>
            &gt;&gt;<br>
            &gt;&gt; From: Zhang Peng &lt;<a href=3D"mailto:peng.zhang1.c=
n@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-=
txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            &gt;&gt;<br>
            &gt;&gt; CVE-2024-12133:<br>
            &gt;&gt; A flaw in libtasn1 causes inefficient handling of
            specific certificate data.<br>
            &gt;&gt; When processing a large number of elements in a
            certificate, libtasn1 takes<br>
            &gt;&gt; much longer than expected, which can slow down or
            even crash the system.<br>
            &gt;&gt; This flaw allows an attacker to send a specially
            crafted certificate,<br>
            &gt;&gt; causing a denial of service attack.<br>
            &gt;&gt;<br>
            &gt;&gt; Reference:<br>
            &gt;&gt; [<a href=3D"https://urldefense.com/v3/__https://nvd.=
nist.gov/vuln/detail/CVE-2024-12133__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-=
XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQoM0ZuTRA$" r=
el=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">https://nvd.=
nist.gov/vuln/detail/CVE-2024-12133</a>]<br>
            &gt;&gt;<br>
            &gt;&gt; Upstream patches:<br>
            &gt;&gt; [<a href=3D"https://urldefense.com/v3/__https://gitl=
ab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a_=
_;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMSto=
dprk96FL67rtPM63XColx8VOQruFLlQxQ$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">https://gitlab.com/gnutls/libtasn1/-/commit/4082=
ca2220b5ba910b546afddf7780fc4a51f75a</a>]<br>
            &gt;&gt; [<a href=3D"https://urldefense.com/v3/__https://gitl=
ab.com/gnutls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d_=
_;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMSto=
dprk96FL67rtPM63XColx8VOQoR8tbYcg$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">https://gitlab.com/gnutls/libtasn1/-/commit/869a=
97aa259dffa2620dabcad84e1c22545ffc3d</a>]<br>
            &gt;&gt;<br>
            &gt;&gt; Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:peng=
.zhang1.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" clas=
s=3D"moz-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            &gt;&gt; ---<br>
            &gt;&gt;&nbsp; .../gnutls/libtasn1/CVE-2024-12133-0001.patch =
|&nbsp;
            43 ++++<br>
            &gt;&gt;&nbsp; .../gnutls/libtasn1/CVE-2024-12133-0002.patch =
|
            235 ++++++++++++++++++<br>
            &gt;&gt;&nbsp; .../recipes-support/gnutls/<a href=3D"https://=
urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8EvQ!ZzeGfovm8rs=
91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQoR=
fAGovw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">li=
btasn1_4.19.0.bb</a>
            |&nbsp; &nbsp;2 +<br>
            &gt;&gt;&nbsp; 3 files changed, 280 insertions(+)<br>
            &gt;&gt;&nbsp; create mode 100644
            meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patc=
h<br>
            &gt;&gt;&nbsp; create mode 100644
            meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patc=
h<br>
            &gt;&gt;<br>
            &gt;&gt; diff --git
            a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.pa=
tch
b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.patch<br>
            &gt;&gt; new file mode 100644<br>
            &gt;&gt; index 0000000000..d843b6dc92<br>
            &gt;&gt; --- /dev/null<br>
            &gt;&gt; +++
            b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0001.pa=
tch<br>
            &gt;&gt; @@ -0,0 +1,43 @@<br>
            &gt;&gt; +From 4082ca2220b5ba910b546afddf7780fc4a51f75a Mon
            Sep 17 00:00:00 2001<br>
            &gt;&gt; +From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">ueno@gnu.org</a>&gt;<br>
            &gt;&gt; +Date: Sat, 19 Oct 2024 02:47:04 +0900<br>
            &gt;&gt; +Subject: [PATCH] asn1_der_decoding2: optimize
            _asn1_find_up call with node<br>
            &gt;&gt; + cache<br>
            &gt;&gt; +<br>
            &gt;&gt; +If we are parsing a sequence or set and the
            current node is a direct<br>
            &gt;&gt; +child of it, there is no need to traverse the list
            back to the<br>
            &gt;&gt; +leftmost one as we have a node cache.<br>
            &gt;&gt; +<br>
            &gt;&gt; +Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:uen=
o@gnu.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">ueno@gnu.org</a>&gt;<br>
            &gt;&gt; +Signed-off-by: Simon Josefsson &lt;<a href=3D"mailt=
o:simon@josefsson.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">simon@josefsson.org</a>&gt;<br>
            &gt;&gt; +<br>
            &gt;&gt; +CVE: CVE-2024-12133<br>
            &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/commit/4082ca2220b5ba=
910b546afddf7780fc4a51f75a__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fR=
u6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQruFLlQxQ$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">https://gitlab.com/gn=
utls/libtasn1/-/commit/4082ca2220b5ba910b546afddf7780fc4a51f75a</a>]<br>
            &gt;&gt; +<br>
            &gt;&gt; +Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:pen=
g.zhang1.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            &gt;&gt; +---<br>
            &gt;&gt; + lib/decoding.c | 9 ++++++++-<br>
            &gt;&gt; + 1 file changed, 8 insertions(+), 1 deletion(-)<br>
            &gt;&gt; +<br>
            &gt;&gt; +diff --git a/lib/decoding.c b/lib/decoding.c<br>
            &gt;&gt; +index d2f6dea..1e0fcb3 100644<br>
            &gt;&gt; +--- a/lib/decoding.c<br>
            &gt;&gt; ++++ b/lib/decoding.c<br>
            &gt;&gt; +@@ -1570,7 +1570,14 @@ asn1_der_decoding2
            (asn1_node *element, const void *ider, int *max_ider_len,<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;move =3D U=
P;<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (move =3D=3D UP)<br>
            &gt;&gt; +-&nbsp; &nbsp; &nbsp; p =3D _asn1_find_up (p);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; {<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; /* If we are parsing a=
 sequence or set
            and p is a direct<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;child of =
it, no need to traverse the
            list back to the leftmost node. */<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (tcache.tail =3D=3D=
 p)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p =3D tcache.he=
ad;<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; else<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p =3D _asn1_fin=
d_up (p);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; }<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; +<br>
            &gt;&gt; +&nbsp; &nbsp;_asn1_delete_not_used (*element);<br>
            &gt;&gt; +--<br>
            &gt;&gt; +GitLab<br>
            &gt;&gt; diff --git
            a/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.pa=
tch
b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.patch<br>
            &gt;&gt; new file mode 100644<br>
            &gt;&gt; index 0000000000..a3a6af2920<br>
            &gt;&gt; --- /dev/null<br>
            &gt;&gt; +++
            b/meta/recipes-support/gnutls/libtasn1/CVE-2024-12133-0002.pa=
tch<br>
            &gt;&gt; @@ -0,0 +1,235 @@<br>
            &gt;&gt; +From 869a97aa259dffa2620dabcad84e1c22545ffc3d Mon
            Sep 17 00:00:00 2001<br>
            &gt;&gt; +From: Daiki Ueno &lt;<a href=3D"mailto:ueno@gnu.org=
" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-link-freete=
xt">ueno@gnu.org</a>&gt;<br>
            &gt;&gt; +Date: Fri, 8 Nov 2024 16:05:32 +0900<br>
            &gt;&gt; +Subject: [PATCH] asn1_find_node: optimize
            &quot;?NUMBER&quot; node lookup with indexing<br>
            &gt;&gt; +<br>
            &gt;&gt; +To avoid linear search of named nodes, this adds a
            array of child<br>
            &gt;&gt; +nodes to their parent nodes as a cache.<br>
            &gt;&gt; +<br>
            &gt;&gt; +Signed-off-by: Daiki Ueno &lt;<a href=3D"mailto:uen=
o@gnu.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D"moz-txt-li=
nk-freetext">ueno@gnu.org</a>&gt;<br>
            &gt;&gt; +Signed-off-by: Simon Josefsson &lt;<a href=3D"mailt=
o:simon@josefsson.org" target=3D"_blank" moz-do-not-send=3D"true" class=3D=
"moz-txt-link-freetext">simon@josefsson.org</a>&gt;<br>
            &gt;&gt; +<br>
            &gt;&gt; +CVE: CVE-2024-12133<br>
            &gt;&gt; +Upstream-Status: Backport [<a href=3D"https://urlde=
fense.com/v3/__https://gitlab.com/gnutls/libtasn1/-/commit/869a97aa259dff=
a2620dabcad84e1c22545ffc3d__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fR=
u6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQoR8tbYcg$" rel=3D"nor=
eferrer" target=3D"_blank" moz-do-not-send=3D"true">https://gitlab.com/gn=
utls/libtasn1/-/commit/869a97aa259dffa2620dabcad84e1c22545ffc3d</a>]<br>
            &gt;&gt; +<br>
            &gt;&gt; +Signed-off-by: Zhang Peng &lt;<a href=3D"mailto:pen=
g.zhang1.cn@windriver.com" target=3D"_blank" moz-do-not-send=3D"true" cla=
ss=3D"moz-txt-link-freetext">peng.zhang1.cn@windriver.com</a>&gt;<br>
            &gt;&gt; +---<br>
            &gt;&gt; + lib/element.c&nbsp; &nbsp; | 56
            ++++++++++++++++++++++++++++++++++++++++++------<br>
            &gt;&gt; + lib/element.h&nbsp; &nbsp; | 10 +++++++++<br>
            &gt;&gt; + lib/int.h&nbsp; &nbsp; &nbsp; &nbsp; |&nbsp; 8 +++=
++++<br>
            &gt;&gt; + lib/parser_aux.c | 10 +++++++++<br>
            &gt;&gt; + lib/structure.c&nbsp; | 13 +++++++++++<br>
            &gt;&gt; + 5 files changed, 90 insertions(+), 7 deletions(-)<=
br>
            &gt;&gt; +<br>
            &gt;&gt; +diff --git a/lib/element.c b/lib/element.c<br>
            &gt;&gt; +index 850bef4a..528df418 100644<br>
            &gt;&gt; +--- a/lib/element.c<br>
            &gt;&gt; ++++ b/lib/element.c<br>
            &gt;&gt; +@@ -33,6 +33,8 @@<br>
            &gt;&gt; + #include &quot;structure.h&quot;<br>
            &gt;&gt; + #include &quot;c-ctype.h&quot;<br>
            &gt;&gt; + #include &quot;element.h&quot;<br>
            &gt;&gt; ++#include &lt;limits.h&gt;<br>
            &gt;&gt; ++#include &quot;intprops.h&quot;<br>
            &gt;&gt; +<br>
            &gt;&gt; + void<br>
            &gt;&gt; + _asn1_hierarchical_name (asn1_node_const node,
            char *name, int name_size)<br>
            &gt;&gt; +@@ -129,6 +131,41 @@ _asn1_convert_integer (const
            unsigned char *value, unsigned char *value_out,<br>
            &gt;&gt; +&nbsp; &nbsp;return ASN1_SUCCESS;<br>
            &gt;&gt; + }<br>
            &gt;&gt; +<br>
            &gt;&gt; ++int<br>
            &gt;&gt; ++_asn1_node_array_set (struct asn1_node_array_st
            *array, size_t position,<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; asn1_node node)<br>
            &gt;&gt; ++{<br>
            &gt;&gt; ++&nbsp; if (position &gt;=3D array-&gt;size)<br>
            &gt;&gt; ++&nbsp; &nbsp; {<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; size_t new_size =3D position,=
 i;<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; asn1_node *new_nodes;<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (INT_MULTIPLY_OVERFLOW (ne=
w_size, 2))<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; return ASN1_GENERIC_ERROR;<br=
>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; new_size *=3D 2;<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (INT_ADD_OVERFLOW (new_siz=
e, 1))<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; return ASN1_GENERIC_ERROR;<br=
>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; new_size +=3D 1;<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (INT_MULTIPLY_OVERFLOW (ne=
w_size, sizeof
            (*new_nodes)))<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; return ASN1_GENERIC_ERROR;<br=
>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; new_nodes =3D realloc (array-=
&gt;nodes,
            new_size * sizeof (*new_nodes));<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (!new_nodes)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; return ASN1_MEM_ALLOC_ERROR;<=
br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; for (i =3D array-&gt;size; i =
&lt; new_size;
            i++)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; new_nodes[i] =3D NULL;<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; array-&gt;nodes =3D new_nodes=
;<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; array-&gt;size =3D new_size;<=
br>
            &gt;&gt; ++&nbsp; &nbsp; }<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; array-&gt;nodes[position] =3D node;<br>
            &gt;&gt; ++&nbsp; return ASN1_SUCCESS;<br>
            &gt;&gt; ++}<br>
            &gt;&gt; ++<br>
            &gt;&gt; + /* Appends a new element into the sequence (or
            set) defined by this<br>
            &gt;&gt; +&nbsp; * node. The new element will have a name of
            '?number', where number<br>
            &gt;&gt; +&nbsp; * is a monotonically increased serial number=
.<br>
            &gt;&gt; +@@ -145,6 +182,7 @@ _asn1_append_sequence_set
            (asn1_node node, struct node_tail_cache_st *pcache)<br>
            &gt;&gt; +&nbsp; &nbsp;asn1_node p, p2;<br>
            &gt;&gt; +&nbsp; &nbsp;char temp[LTOSTR_MAX_SIZE + 1];<br>
            &gt;&gt; +&nbsp; &nbsp;long n;<br>
            &gt;&gt; ++&nbsp; int result;<br>
            &gt;&gt; +<br>
            &gt;&gt; +&nbsp; &nbsp;if (!node || !(node-&gt;down))<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;return ASN1_GENERIC_ERROR;<br>
            &gt;&gt; +@@ -177,17 +215,21 @@ _asn1_append_sequence_set
            (asn1_node node, struct node_tail_cache_st *pcache)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;pcache-&gt;tail =3D p2;<=
br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; +<br>
            &gt;&gt; +-&nbsp; if (p-&gt;name[0] =3D=3D 0)<br>
            &gt;&gt; +-&nbsp; &nbsp; _asn1_str_cpy (temp, sizeof (temp), =
&quot;?1&quot;);<br>
            &gt;&gt; +-&nbsp; else<br>
            &gt;&gt; ++&nbsp; n =3D 0;<br>
            &gt;&gt; ++&nbsp; if (p-&gt;name[0] !=3D 0)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;{<br>
            &gt;&gt; +-&nbsp; &nbsp; &nbsp; n =3D strtol (p-&gt;name + 1,=
 NULL, 0);<br>
            &gt;&gt; +-&nbsp; &nbsp; &nbsp; n++;<br>
            &gt;&gt; +-&nbsp; &nbsp; &nbsp; temp[0] =3D '?';<br>
            &gt;&gt; +-&nbsp; &nbsp; &nbsp; _asn1_ltostr (n, temp + 1);<b=
r>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; n =3D strtol (p-&gt;name + 1,=
 NULL, 10);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (n &lt;=3D 0 || n &gt;=3D =
LONG_MAX - 1)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; return ASN1_GENERIC_ERROR;<br=
>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; ++&nbsp; temp[0] =3D '?';<br>
            &gt;&gt; ++&nbsp; _asn1_ltostr (n + 1, temp + 1);<br>
            &gt;&gt; +&nbsp; &nbsp;_asn1_set_name (p2, temp);<br>
            &gt;&gt; +&nbsp; &nbsp;/*&nbsp; p2-&gt;type |=3D CONST_OPTION=
; */<br>
            &gt;&gt; ++&nbsp; result =3D _asn1_node_array_set
            (&amp;node-&gt;numbered_children, n, p2);<br>
            &gt;&gt; ++&nbsp; if (result !=3D ASN1_SUCCESS)<br>
            &gt;&gt; ++&nbsp; &nbsp; return result;<br>
            &gt;&gt; ++&nbsp; p2-&gt;parent =3D node;<br>
            &gt;&gt; +<br>
            &gt;&gt; +&nbsp; &nbsp;return ASN1_SUCCESS;<br>
            &gt;&gt; + }<br>
            &gt;&gt; +diff --git a/lib/element.h b/lib/element.h<br>
            &gt;&gt; +index 732054e9..b84e3a27 100644<br>
            &gt;&gt; +--- a/lib/element.h<br>
            &gt;&gt; ++++ b/lib/element.h<br>
            &gt;&gt; +@@ -38,4 +38,14 @@ int _asn1_convert_integer
            (const unsigned char *value,<br>
            &gt;&gt; + void _asn1_hierarchical_name (asn1_node_const
            node, char *name,<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;int name_size);<br>
            &gt;&gt; +<br>
            &gt;&gt; ++static inline asn1_node_const<br>
            &gt;&gt; ++_asn1_node_array_get (const struct
            asn1_node_array_st *array, size_t position)<br>
            &gt;&gt; ++{<br>
            &gt;&gt; ++&nbsp; return position &lt; array-&gt;size ?
            array-&gt;nodes[position] : NULL;<br>
            &gt;&gt; ++}<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++int<br>
            &gt;&gt; ++_asn1_node_array_set (struct asn1_node_array_st
            *array, size_t position,<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; asn1_node node);<br>
            &gt;&gt; ++<br>
            &gt;&gt; + #endif<br>
            &gt;&gt; +diff --git a/lib/int.h b/lib/int.h<br>
            &gt;&gt; +index 4f2d98d1..41b12b0b 100644<br>
            &gt;&gt; +--- a/lib/int.h<br>
            &gt;&gt; ++++ b/lib/int.h<br>
            &gt;&gt; +@@ -31,6 +31,12 @@<br>
            &gt;&gt; +<br>
            &gt;&gt; + # define ASN1_SMALL_VALUE_SIZE 16<br>
            &gt;&gt; +<br>
            &gt;&gt; ++struct asn1_node_array_st<br>
            &gt;&gt; ++{<br>
            &gt;&gt; ++&nbsp; asn1_node *nodes;<br>
            &gt;&gt; ++&nbsp; size_t size;<br>
            &gt;&gt; ++};<br>
            &gt;&gt; ++<br>
            &gt;&gt; + /* This structure is also in libtasn1.h, but then
            contains less<br>
            &gt;&gt; +&nbsp; &nbsp; fields.&nbsp; You cannot make any mod=
ifications to
            these first fields<br>
            &gt;&gt; +&nbsp; &nbsp; without breaking ABI.&nbsp; */<br>
            &gt;&gt; +@@ -47,6 +53,8 @@ struct asn1_node_st<br>
            &gt;&gt; +&nbsp; &nbsp;asn1_node left;&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;/* Pointer to the
            next list element */<br>
            &gt;&gt; +&nbsp; &nbsp;/* private fields: */<br>
            &gt;&gt; +&nbsp; &nbsp;unsigned char
            small_value[ASN1_SMALL_VALUE_SIZE];&nbsp; &nbsp;/* For small =
values */<br>
            &gt;&gt; ++&nbsp; asn1_node parent;&nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp;/* Pointer to the
            parent node */<br>
            &gt;&gt; ++&nbsp; struct asn1_node_array_st numbered_children=
; /*
            Array of unnamed child nodes for caching */<br>
            &gt;&gt; +<br>
            &gt;&gt; +&nbsp; &nbsp;/* values used during decoding/coding =
*/<br>
            &gt;&gt; +&nbsp; &nbsp;int tmp_ival;<br>
            &gt;&gt; +diff --git a/lib/parser_aux.c b/lib/parser_aux.c<br=
>
            &gt;&gt; +index 415905a0..4281cc97 100644<br>
            &gt;&gt; +--- a/lib/parser_aux.c<br>
            &gt;&gt; ++++ b/lib/parser_aux.c<br>
            &gt;&gt; +@@ -126,6 +126,7 @@ asn1_find_node
            (asn1_node_const pointer, const char *name)<br>
            &gt;&gt; +&nbsp; &nbsp;const char *n_start;<br>
            &gt;&gt; +&nbsp; &nbsp;unsigned int nsize;<br>
            &gt;&gt; +&nbsp; &nbsp;unsigned int nhash;<br>
            &gt;&gt; ++&nbsp; const struct asn1_node_array_st
            *numbered_children;<br>
            &gt;&gt; +<br>
            &gt;&gt; +&nbsp; &nbsp;if (pointer =3D=3D NULL)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;return NULL;<br>
            &gt;&gt; +@@ -209,6 +210,7 @@ asn1_find_node
            (asn1_node_const pointer, const char *name)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (p-&gt;down =3D=3D NU=
LL)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return NULL;<br>
            &gt;&gt; +<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; numbered_children =3D
            &amp;p-&gt;numbered_children;<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;p =3D p-&gt;down;<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (p =3D=3D NULL)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;return NULL;<br>
            &gt;&gt; +@@ -222,6 +224,12 @@ asn1_find_node
            (asn1_node_const pointer, const char *name)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;else<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;{&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;/* no &quot;?=
LAST&quot; */<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; if (n[0] =3D=3D '?' &a=
mp;&amp; c_isdigit
            (n[1]))<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; {<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; long pos=
ition =3D strtol (n + 1, NULL,
            10);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; if (posi=
tion &gt; 0 &amp;&amp;
            position &lt; LONG_MAX)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; p=
 =3D _asn1_node_array_get
            (numbered_children, position - 1);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; }<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;while (p)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;{<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;if =
(p-&gt;name_hash =3D=3D nhash
            &amp;&amp; !strcmp (p-&gt;name, n))<br>
            &gt;&gt; +@@ -509,6 +517,8 @@ _asn1_remove_node (asn1_node
            node, unsigned int flags)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;if (node-&gt;value !=3D =
node-&gt;small_value)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp;free (node-&gt;value);<b=
r>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;}<br>
            &gt;&gt; ++<br>
            &gt;&gt; ++&nbsp; free (node-&gt;numbered_children.nodes);<br=
>
            &gt;&gt; +&nbsp; &nbsp;free (node);<br>
            &gt;&gt; + }<br>
            &gt;&gt; +<br>
            &gt;&gt; +diff --git a/lib/structure.c b/lib/structure.c<br>
            &gt;&gt; +index 9c95b9e2..32692ad2 100644<br>
            &gt;&gt; +--- a/lib/structure.c<br>
            &gt;&gt; ++++ b/lib/structure.c<br>
            &gt;&gt; +@@ -31,6 +31,9 @@<br>
            &gt;&gt; + #include &lt;structure.h&gt;<br>
            &gt;&gt; + #include &quot;parser_aux.h&quot;<br>
            &gt;&gt; + #include &lt;gstr.h&gt;<br>
            &gt;&gt; ++#include &quot;c-ctype.h&quot;<br>
            &gt;&gt; ++#include &quot;element.h&quot;<br>
            &gt;&gt; ++#include &lt;limits.h&gt;<br>
            &gt;&gt; +<br>
            &gt;&gt; +<br>
            &gt;&gt; + extern char _asn1_identifierMissing[];<br>
            &gt;&gt; +@@ -391,6 +394,16 @@ asn1_delete_element
            (asn1_node structure, const char *element_name)<br>
            &gt;&gt; +&nbsp; &nbsp;if (source_node =3D=3D NULL)<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp;return ASN1_ELEMENT_NOT_FOUND;<=
br>
            &gt;&gt; +<br>
            &gt;&gt; ++&nbsp; if (source_node-&gt;parent<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &amp;&amp; source_node-&gt;na=
me[0] =3D=3D '?'<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &amp;&amp; c_isdigit
            (source_node-&gt;name[1]))<br>
            &gt;&gt; ++&nbsp; &nbsp; {<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; long position =3D strtol
            (source_node-&gt;name + 1, NULL, 10);<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; if (position &gt; 0 &amp;&amp=
; position
            &lt; LONG_MAX)<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; _asn1_node_array_set
            (&amp;source_node-&gt;parent-&gt;numbered_children,<br>
            &gt;&gt; ++&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; position - 1, NULL);<br>
            &gt;&gt; ++&nbsp; &nbsp; }<br>
            &gt;&gt; ++<br>
            &gt;&gt; +&nbsp; &nbsp;p2 =3D source_node-&gt;right;<br>
            &gt;&gt; +&nbsp; &nbsp;p3 =3D _asn1_find_left (source_node);<=
br>
            &gt;&gt; +&nbsp; &nbsp;if (!p3)<br>
            &gt;&gt; +--<br>
            &gt;&gt; +GitLab<br>
            &gt;&gt; diff --git a/meta/recipes-support/gnutls/<a href=3D"=
https://urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8EvQ!Zze=
Gfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XCo=
lx8VOQoRfAGovw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"=
true">libtasn1_4.19.0.bb</a>
            b/meta/recipes-support/gnutls/<a href=3D"https://urldefense.c=
om/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-Xw=
klfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQoRfAGovw$" rel=
=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">libtasn1_4.19.=
0.bb</a><br>
            &gt;&gt; index 5fb8b54c06..d5bc1e408e 100644<br>
            &gt;&gt; --- a/meta/recipes-support/gnutls/<a href=3D"https:/=
/urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQo=
RfAGovw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">l=
ibtasn1_4.19.0.bb</a><br>
            &gt;&gt; +++ b/meta/recipes-support/gnutls/<a href=3D"https:/=
/urldefense.com/v3/__http://libtasn1_4.19.0.bb__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQo=
RfAGovw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">l=
ibtasn1_4.19.0.bb</a><br>
            &gt;&gt; @@ -12,6 +12,8 @@ LIC_FILES_CHKSUM =3D
            &quot;<a class=3D"moz-txt-link-freetext" href=3D"file://doc/C=
OPYING;md5=3Dd32239bcb673463ab874e80d47fae504">file://doc/COPYING;md5=3Dd=
32239bcb673463ab874e80d47fae504</a> \<br>
            &gt;&gt;<br>
            &gt;&gt;&nbsp; SRC_URI =3D
            &quot;${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a cl=
ass=3D"moz-txt-link-freetext" href=3D"file://dont-depend-on-help2man.patc=
h">file://dont-depend-on-help2man.patch</a> \<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://CVE-2024-12133-0001.patch">file://=
CVE-2024-12133-0001.patch</a> \<br>
            &gt;&gt; +&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<a class=3D=
"moz-txt-link-freetext" href=3D"file://CVE-2024-12133-0002.patch">file://=
CVE-2024-12133-0002.patch</a> \<br>
            &gt;&gt;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&quot=
;<br>
            &gt;&gt;<br>
            &gt;&gt;&nbsp; DEPENDS =3D &quot;bison-native&quot;<br>
            &gt;&gt; --<br>
            &gt;&gt; 2.43.0<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;&gt;<br>
            &gt;<br>
            &gt; <br>
            &gt;<br>
            <br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#212453): <a href=3D"https://urldefense.co=
m/v3/__https://lists.openembedded.org/g/openembedded-core/message/212453_=
_;!!AjveYdw8EvQ!ZzeGfovm8rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMSto=
dprk96FL67rtPM63XColx8VOQpbPFwCsQ$" rel=3D"noreferrer" target=3D"_blank" =
moz-do-not-send=3D"true">
https://lists.openembedded.org/g/openembedded-core/message/212453</a><br>
            Mute This Topic: <a href=3D"https://urldefense.com/v3/__https=
://lists.openembedded.org/mt/111565382/7301997__;!!AjveYdw8EvQ!ZzeGfovm8r=
s91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQo=
dEvG9qA$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/mt/111565382/7301997</a><br>
            Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@list=
s.openembedded.org" target=3D"_blank" moz-do-not-send=3D"true">
              openembedded-core+owner@lists.openembedded.org</a><br>
            Unsubscribe: <a href=3D"https://urldefense.com/v3/__https://l=
ists.openembedded.org/g/openembedded-core/unsub__;!!AjveYdw8EvQ!ZzeGfovm8=
rs91bVBHZwR-XwklfF6fRu6K5HcoURbiTyBtatBZuH8GMStodprk96FL67rtPM63XColx8VOQ=
rW4QaMAw$" rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"true">
              https://lists.openembedded.org/g/openembedded-core/unsub</a=
>
            [<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank" moz=
-do-not-send=3D"true" class=3D"moz-txt-link-freetext">vanusuri@mvista.com=
</a>]<br>
            -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------kBPoBOrna8JoLJPxBxdTgjb9--

