Return-Path: <Yash.Shinde@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DD1AC54F30
	for <webhook@archiver.kernel.org>; Tue, 27 May 2025 14:43:00 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.53710.1748356975135280331
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 May 2025 07:42:55 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=7242073f8d=yash.shinde@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RBndq5018827
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:42:54 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d42m7w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 07:42:54 -0700 (PDT)
Received: from m0250810.ppops.net (m0250810.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54REgsFI021546;
	Tue, 27 May 2025 07:42:54 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 46u9d42m7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 07:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aqcOkDlJgQfS4JHSeAN1VRUwjBbqW9x+HA8bY/ueji016C/hOT/ALhXKrD8eX780MESJnVcyW0W4g5bQqQnHtcACxDML7yhW2ZrKAqRR1MYEr69Qa82BR4MV32TuH9PRjsPjjbOt0cvBt0okZLc+jsgRAfogd7bXtKz+Hvd5KmDAvAykIxW/EheEC4stXAF0JC24mNzChe2m/5LhLxbwQ+iIfCirrJ0fKnpQlnyrGd85kB34GQ13odwq5Q9AwfayUR4hu+1YBPnMJBVGaaKNOnRZgZ2aNzI5Ln/ahFuZgtxoXcSa9KIH3yX8T1NsjeISxfSRdfwzRO8e5KJ/g7iS2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgM2mnsz3MQJQ+Ul7PjQNzy5rkV4CQX/mdmUXu1wAeI=;
 b=o2ccbce20vDp43FRgReJfmm7ol+Ia/ye1OhXRa/4PCcMPD6H9jY1+7F901Hp37VWfAtxz4bzY6XZXcUl798PuKS+tgfnSve0REQEJiCa/H/Wx7uSyNbGhpq37I64b3+UZc+QOiQxYH2r646wvJF8a6RmyXnw0ai8twVvl6rmaQwMIQ474YYbvYaQq0Gxu/zvKqsml6qxIseclRRgOsID/t/CBK7BVuIkAep1hnIwF5O0J67njsENaSImGHzxOspIK2pFON6NeMRAjghVjY4pbs0vXoPdkbGTlYpmKQyS8SYGz3UA54Hg42zXxRt6bwp++4/3hD1lb6gjLITXwBlq3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH7PR11MB7593.namprd11.prod.outlook.com (2603:10b6:510:27f::9)
 by PH7PR11MB6548.namprd11.prod.outlook.com (2603:10b6:510:210::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 14:42:48 +0000
Received: from PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc]) by PH7PR11MB7593.namprd11.prod.outlook.com
 ([fe80::2688:e731:421b:5ebc%5]) with mapi id 15.20.8769.022; Tue, 27 May 2025
 14:42:48 +0000
Message-ID: <47ba1f68-f67b-4c58-b788-63e06fdf4816@windriver.com>
Date: Tue, 27 May 2025 20:12:43 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC] rust: Upgrade 1.85.1->1.86.0
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
        "MacLeod, Randy" <randy.macleod@windriver.com>,
        "Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
References: <83e0d268-ec47-4f3a-bf05-2aee4e58e749@windriver.com>
 <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
Content-Language: en-US
From: Yash Shinde <Yash.Shinde@windriver.com>
In-Reply-To: <CANNYZj-BmEXJVc1rdVPGu5wz87AW1RvbX+WhgicAfEby7kjUhw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR05CA0021.namprd05.prod.outlook.com
 (2603:10b6:510:2cc::9) To PH7PR11MB7593.namprd11.prod.outlook.com
 (2603:10b6:510:27f::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7593:EE_|PH7PR11MB6548:EE_
X-MS-Office365-Filtering-Correlation-Id: 613099b1-0072-4d9d-e176-08dd9d2cc057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QmpNMU45QXJIWTVpZ0t3Y3h1VEVyZlZaSW9BSVV5TExKZ0dxQm9FTU1TZnpL?=
 =?utf-8?B?d0RwZkVTdm9KR3J4eldhLzJQSG90RU84cDZXNGhuZ0VZaVRtR0I3Ly9NRjBF?=
 =?utf-8?B?MXI4bUZwOG1JSmZEaXpGM0Q2OUlnTUl2Q3J1UEw3eDJWUmVhT20yYmMzL25M?=
 =?utf-8?B?Q3BpN1BQeHNGMTFRSHhCbEg0Q05IZzRNb1lxOVpyS3pSRFB1SE5QRDE1TEhO?=
 =?utf-8?B?Uzl3M3YyUHhNV2crd0NGang4ZTZtaVVzd3Zzc09Va2ttQlRQQWNLTU5MRDR5?=
 =?utf-8?B?eVRRSUlzUTJvdFNmM21QcXVWa1B1MlVjN2dhVnNzSUFCZmJyemE5bDBLYW5D?=
 =?utf-8?B?ek52VGk5Z0lKM0ZVVWVWcXcvM2ZMOUk5RC9oUlhlL20ySlpYbjdwVW5NeE50?=
 =?utf-8?B?SWNFT211SVpocjNPRXB0OGhibVpsTVJjSUgzRlErZW91YWEzdVB5YkVWaWRL?=
 =?utf-8?B?cVo3S0R1OTlFaFF6RmtNQmYwSWdBQnl2S29FMmpKbW02eG41eUdvRFp3R2FV?=
 =?utf-8?B?UEJJZjNVTUdBaWxYanpVbVB4WjVYUysrNFE2dXhseHdjUERocExXMU1MS3Bv?=
 =?utf-8?B?S3FPbHdST21TZ2JWTk04b2V3NytmN3dnUVpWOVczbzBWWVV1Y0QxMEtGcGNT?=
 =?utf-8?B?RStrODkyWS9VSlU4MllWaDNIU09YV21HNzJJb1JyYjFMQUNTTFBuV0JEMDN0?=
 =?utf-8?B?UFVvVjFUSTdlbThlR2dmYm1zU0xxWGVMQjVveEpLcWFCZDRHb24yVlBEUjFo?=
 =?utf-8?B?Q3BSN21uMTBlQnpQWERmOTdpOUs0ZVk5Wk0xeWlqUnlkQ0x4SkxiS244M3J1?=
 =?utf-8?B?Smh0UXNMbzF4Z1o5RjJDdVh5aGxtRjFZZCtrWFRVUVBlYVZHWHZMenJ4ZmQw?=
 =?utf-8?B?WWY5dlRtL3IyUm1nelcrRjhpa0RIMmhSTDNTOFdzd1c2MDZJWXJpQlYxUDkv?=
 =?utf-8?B?aEZxVzVqcFFneGl1ekVPcFRnWEN6VlArcUNmQmhlSldYNlV4YWlmN25JdmlV?=
 =?utf-8?B?R1lzWXRIYm5IbDkrYXREV2dIV2VUbWlrK3RiVjNXMVFaUGR0WGFud0huRGkr?=
 =?utf-8?B?TnVpZHExaW10RGgwQlNUUDJITVlObVcyUDBoU3piWS9tYjBoNGJ1K2FjVzdF?=
 =?utf-8?B?dWRrajZheW1DNS9SQnV4VTBuRnNwVjUzTlo3V3hRY2YwNkZoaUFQQ05zaGtI?=
 =?utf-8?B?R1pQVng2aDNBYjU3ZThSaEpsZ2FqendxVTdyN0w2WXdFcjVuNWdveE1aYm9h?=
 =?utf-8?B?KzRERWxWMjVTMTY1L1p5TVNFcW5SMEtYU25hVm9vRlJ1RU1vM3pLbkszZVh4?=
 =?utf-8?B?RjlXWC9vNzNaMGp4ZVkvT0JuYzFPQUVmS3ltSVM5RkRCWm1iVWVyNjFiTG5V?=
 =?utf-8?B?NWdydG94aGRHOENndEhPM1RRdXo0SWYwN0dGalg4aWFVWFN2V1lKb3NGb25U?=
 =?utf-8?B?ajcvbTgwQ3NnVlJjNktIcUZkYlFpVk9WRE4ycEFDRkZhY0FvOHJpVHY0RFJB?=
 =?utf-8?B?czBiMzJldjJPcFByeDhZcUVLN05Tekd6TVJBMGQxSVpwTFgzbTlQdEt5ZEI1?=
 =?utf-8?B?SUpMamdWK1d1L1ZEUUJnaldXMWFjQ1ZpcXE2ektVbHZGOEU1RktzVTljMHBI?=
 =?utf-8?B?VXBkWVJXQVZrQlpWcVNYYTI0anJnNUFtRkxTK1pIUEs0Skd4Z0xNOGdiTWxi?=
 =?utf-8?B?NWVhYWU0QkozZmRtYXFtMmJFanppRmloNmJsb3NsNkJBMSs0Z1hocW1ZbTN0?=
 =?utf-8?B?ZDRmcCtXVW56Y2ZYN0NDZFB4cDZ4ekh2N0RidGhLK0JQM2lJVHg2bTFVcmJZ?=
 =?utf-8?B?SFFqTXBCMVI0SHJGeHF1eGcxeHVWS0x3bzA2dmtrQ2xQMWpWWkNveWpscng5?=
 =?utf-8?Q?QWdudKPmz4xCV?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR11MB7593.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UmM2YSt1N2ZaeGVXRklOYk5iNjU2WnBDeXhzTUJveVVkQzlUWWF3WmVjTGNU?=
 =?utf-8?B?b1RtL2ZaRkJzVzRiZEM5d3UyRlA4YjYwZDhDeis4SVVWUWlJenZiWUJqeVhG?=
 =?utf-8?B?YkUwKzNBQ2FUY3hneWlQQ0piV1cwallkWlp5azdvWmpSMlpRaElzRnJ4Rjdq?=
 =?utf-8?B?ZFY2aGkraXlaUE9FeTJwd0NkYnl1bTJWT3dEbDdBWms0amlOZlJ4Vm5PQWQ3?=
 =?utf-8?B?Y1ZhZDBZbldMR0dSR29UcXIyRWtQNU51NzJMN0JtUUlESXBZRythUDNCQmlm?=
 =?utf-8?B?WitGYjZhNXJrZERaNWdTM25QeWlOOU9BUUQvMlU4UmQrK3dBTkJ5clNwM0tK?=
 =?utf-8?B?WE1QZ1NCSFRCWkJRZVY3S1YzM1F5blo3ZnVLRjlURDhpS1dHSGdKSEwxTFlP?=
 =?utf-8?B?Q2hDODIxVmE4UXc0NWc0QU9UY09DeTE3YUdTMjRUbjVrWDQ4QXRzdWlJM2ZB?=
 =?utf-8?B?QVlUM0UzbGtsbUJMcjgyeGZyK3FlS2g0VUFaUVMzbEtLRGJXR3B1L0FmaDZR?=
 =?utf-8?B?eG9MOGpVQVV0WCtPS1hHRG5hL0RqelpSNis2ZDViMVJwR3MxTS9sSVZzRHQ4?=
 =?utf-8?B?cHhRRDcvaU9LbWNBOWFPRExla2hQUTdRMTVEQjdmWkVtQlNwbDBtNFpkZ1R5?=
 =?utf-8?B?ekJzelViSEc2OGs4T3VVVjZJMWV6Y012VThzc0E4MUJwUGJ0U3JoL0RrZjRy?=
 =?utf-8?B?RjZzQUF3RWVzL1pETndORHU2aTlobXZ6eG9nQ2tUZWVWZG03VDlJd29oYXlF?=
 =?utf-8?B?aU1rUThIZGhxbnd2bWRYeG96Q201a2pzR0oyN0Z1dnpjOHNsUWdPc05TM3JR?=
 =?utf-8?B?MGVlbEpHVk9zRDkyNDRNVnYvVGRmdkt3eXk3TWhuaDhtVnIySGdDQVNLQ1hZ?=
 =?utf-8?B?aGtOeEE1NjFuUjZJR1p6NnhVNU5EWEI4S1ZEbEpUUklPdElrSkMvMVorREph?=
 =?utf-8?B?NFU3M2p4OVhiRE9jRnJ1M2hHeEVobTJqOERUZThLU0VhVWt3NWhmN0hPZWtB?=
 =?utf-8?B?ekJrM2t5Z3JnR2FmY1RGQlJUNXkzSFJkdmNMSUhmckJUdjFOZVBzLzVmRGVz?=
 =?utf-8?B?dFM5SlhtMnJlMU95RldHZ0NNUWh0ZFlYcWw2WXVUNllNa1lPNCsvTjMvVSt0?=
 =?utf-8?B?RUV4VXFsbmx4MXhEcDlFUWg0SWRVOVV2NFBBV2VRdEo2RDEvQWNPYTRxKzgz?=
 =?utf-8?B?djJLSjdOVjdPZlFycUlRcnBYbHBteGNKUWZ6REIwc1N2Q2ZmNWlPTmdxSzl5?=
 =?utf-8?B?TFV6NEtJWUdxSHM4SmFVTlBaUERmTnlCbU1IWkNHc1hnU2NLL05aQVNkVGs5?=
 =?utf-8?B?a3VHT0c4ZlZpcnN2R016Nnk4dVZWUkFDUFNPc1ovWDJUZmdtU3QzRENDNUlt?=
 =?utf-8?B?eDdXUkxxV1Q4VUkyVExObnFENzdJbCtHV01UOEt6ZXo0YUdhNHhvWFZMMmdC?=
 =?utf-8?B?OXo4RnRtK0Y4OVljQU1SUFdUOE91bTNUbEh6ZmYxZXhNVElrK3QrL3BZdWRR?=
 =?utf-8?B?VWJzcGExRDJqYU1MZnpmNFp6ajRzelc4WGNha1h1Ui9GZTdKb2Z3MGFsbVJR?=
 =?utf-8?B?bHFTeW9jL1dlSFhwNWZZcmNPejF6eFhrbHFQa296aCtjWCtLVTc4QmNhM0Vn?=
 =?utf-8?B?K1VXdHN0TEZtNEgvU3l4U1h2cXFCenhhR0I1WS9uSDhHVjh6UDdLay9NZEcw?=
 =?utf-8?B?Z2NkQnBKbUNRcytlcUJtWHA2SXY2V3lXalhuVFFqSWdhVzFQNGJrd01yWGlm?=
 =?utf-8?B?MDQ5SE4zUzVwb2IxN1Y1U2pBdENWa0RaQWtrejVYcGRjWjhNMWd6UUU5VU80?=
 =?utf-8?B?OWcvRng2b09iWm9BRFZiakVGUE5FRDNjei83SStQYy9YNnRxd3FXSUpoNFZ6?=
 =?utf-8?B?K0NJLytsL2JnVWxZNWRzU3Z1RHdzZnlrYWNreEZkeVV4T3JjcFpYVHFQK0I4?=
 =?utf-8?B?WXZreHVQNnZ5cENPUnhobjdFZHJKUXBad0xTT0d4bXExWGw2V0IycUxBdTF4?=
 =?utf-8?B?TGxuRWxQM1RERlkxcHJLSXRCUlBwb2dyQmVyeWF2cjQ5VENmYmo3dnM5MHEx?=
 =?utf-8?B?OUNaZGg1cm81NnBxMkVGL3UrVlJYS1QxVmpGa3Q1aEVoL0lYSE83clQzdzdI?=
 =?utf-8?B?d2JzS1R0dVBXUUV1ZDMxL0lSUFhQTXVMTHlmMUJCMGNMeG9YWG0vbllvbFFR?=
 =?utf-8?B?ZXc9PQ==?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613099b1-0072-4d9d-e176-08dd9d2cc057
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7593.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 14:42:48.8683
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJYMSjN8bC6YaalS+SjOhqD5yzvhFCk8VbqiZkmQkPceVkg7hKiDsaJj4N79MrbVoMf+LImw0awWkmddw3sDwS3FoCL1p/Xek0DiUXbLVY4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6548
X-Proofpoint-GUID: 21_UQcdDgW_4wqRVjvmX56rEw466oa5l
X-Proofpoint-ORIG-GUID: BGup8PDjAKCd3OixoOD8qxY7zxabQhUL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDEyMSBTYWx0ZWRfX0sh6ocFWEezh /IWYz7NOmb/vrEKltJaszWqVHfmScZAVjg1JFDaUOnJQdqaNQMQjLYvv9BLX8GdYdUAQFwMK+yJ jQ+RHiXPgqyd9HBsWupM5dVovsxq1u1a7wv/XpoRy6Zu/jO7FXQ8n0hkAoUT/4DY+5s69M3PxnW
 ZTP417ZX0NICOQr+SzQCJElqoZs9zgCdypClZTWvYAvopMe5Kr1EuQvIolMB0x0jfsJba7NAHNv MPZHAFyyGXAHqetha2ddt51RMEoCH25IvUdbH4XuTKeV9yz5UBlNdhY3YUe3z9KjkGmZ1Hj49dl uDh4hinRk/vKaZz4OHbMuBvQuddDTiM0LW8CG/Wm7Sh+8smt+AS30a/HS+mzrSmzCC2pr+IpPsX
 wgCRVKsZt0Y8GuqHhMH18HIrMuQY0u7zAAxDOc6F6G5TtlgktuHEyWZnJlr2uSns8/bGt+ML
X-Authority-Analysis: v=2.4 cv=fdCty1QF c=1 sm=1 tr=0 ts=6835cf6e cx=c_pps a=L/hALDhYQ2kaG+m2YXDVcg==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=iGHA9ds3AAAA:8 a=Q4-j1AaZAAAA:8 a=Xr2hE7S9_7OQjp37qjsA:9 a=QEXdDO2ut3YA:10 a=nM-MV4yxpKKO9kiQg6Ot:22 a=9H3Qd4_ONW2Ztcrla5EB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_07,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0 mlxlogscore=920
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2505160000
 definitions=main-2505270121
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 May 2025 14:43:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/217309


On 27-05-2025 19:36, Alexander Kanavin wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender and know the content is safe.
>
> On Fri, 23 May 2025 at 18:22, Yash Shinde via lists.openembedded.org
> <Yash.Shinde=windriver.com@lists.openembedded.org> wrote:
>> do_package_qa: QA Issue: File
>> /usr/lib/rustlib/x86_64-poky-linux-gnu/bin/rust-lld
>> in package rust doesn't have GNU_HASH (didn't pass LDFLAGS?) [ldflags]
> I ran two builds (1.85, 1.86) side by side and this happens because in
> 1.85 rust-lld isn't installed into ${D}, but in 1.86 it is (along with
> many, many other things that weren't installed in 1.85).
>
> This is probably related to the drastic increase in build time too.
>
> Hope this helps,
> Alex
Yeah, that's the reason.

I am not sure how rust-lld is installed in ${D} now. A similar error was 
previously resolved by using:
"+TARGET_CC_ARCH += 
"${LDFLAGS}""(https://git.yoctoproject.org/poky/commit/?id=cc24a0ff76f2e227cc3a0f478d078b2158299a80)

LDFLAGS are explicitly unset in rust recipe. 
(https://git.yoctoproject.org/poky/tree/meta/recipes-devtools/rust/rust_1.85.1.bb#n194)
I attempted to remove the "unset LDFLAGS" in rust recipe and exported 
TARGET_CC_ARCH as above, but that didn't work.

Is there some different or recommended way to pass LDFLAGS to rust that 
I might be missing?



Regards,
Yash

