Received: from NAM02-BL2-obe.outbound.protection.outlook.com (NAM02-BL2-obe.outbound.protection.outlook.com [40.107.75.47])
 by mx.groups.io with SMTP id smtpd.web09.6317.1611306163140077285
 for <openembedded-core@lists.openembedded.org>;
 Fri, 22 Jan 2021 01:02:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriversystems.onmicrosoft.com header.s=selector2-windriversystems-onmicrosoft-com header.b=og7Lzhww;
 spf=pass (domain: windriver.com, ip: 40.107.75.47, mailfrom: qi.chen@windriver.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ywet/zSXv6pR/AUXG0cnwCOurrQKrLHoqfQwfpFbfVImp+KU3/0Cn2/xz9prEV7j+Rh3HFs9O8hAcKLol+ZcBs+a+b8sKYtWWyI24cOp6OR2+EjO9/mBeEkrMp/e7Sz2Y5pUrRiitKpvpgeQIxMrm6ngRC6hIPMBjLk+AkUXXoCGkqlq39j3cdwIVMb8tw0UR1IaOSySQqlKJut6n/2fKjPF3kRYyBXn1HXXnVjlHVPPR5Ft1vkoYGPrOhEKmcJ8tPYg1rN0pwkv51vQimYOEE7ba/3T/TkKkyxosydeFVjXVKpwTQ/a6npHwOMdvRTH+AskYSXAgji36HNH7pMaZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrrt6pbLluELP9fcjseSeUSAdbqDrvhb5e7l+/6xnm0=;
 b=UaNsMMxUvRPNBZZhv8tg7YuG8PyVIRBtLVX2KEz4PiX6xNCz6v89755+78CmSu5fxEOtlZuRr0FuyCa1hHnHHLqO266fnQOHv76CWgXdkmLiENf866TMsV3MTclURgBn0BdY3M487qm69UKaipPO1ybQfCZigSMczq9+o/5NDscsbrzbc9b83sPT1b8VjugYC30xDIRzqlDK5CDVbSfht2KFXXGZFEAU0OAAAST9WSGN6UeGPXVTDObhhqJe2WGzDODWPLfu6/tV5HdYdQxIULglKxaS7llLIiqsDH8Mc8+sBZYbjfdSyTy1o6ZBEYZ2rIhuoVKn6RR+BOs8Ga2B4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=windriversystems.onmicrosoft.com;
 s=selector2-windriversystems-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lrrt6pbLluELP9fcjseSeUSAdbqDrvhb5e7l+/6xnm0=;
 b=og7LzhwwQmIMkza8jnKCB9Gn1JipyGz+C317YoR7FNmQ1dmGCqyWA6oVLSW+oAtBh8m2pN2xBvVsJpYbEHTGYLCNJzZSZq4ROx3FvalPaDumyB2r/vi3WbZGCl+Fcg/TdcMR9+hncXQ9D2/rzFMeP/nmnwKckbnr63E/R0MM5VU=
Authentication-Results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=windriver.com;
Received: from BL0PR11MB3474.namprd11.prod.outlook.com (2603:10b6:208:67::17)
 by MN2PR11MB4111.namprd11.prod.outlook.com (2603:10b6:208:138::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.12; Fri, 22 Jan
 2021 09:02:40 +0000
Received: from BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c]) by BL0PR11MB3474.namprd11.prod.outlook.com
 ([fe80::2548:a42b:4216:731c%6]) with mapi id 15.20.3763.014; Fri, 22 Jan 2021
 09:02:40 +0000
Subject: Re: [OE-core][PATCH] gobject-introspection: reserve less memory for qemu
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20210122044426.19719-1-Qi.Chen@windriver.com>
 <ca24a1e3892d838054450245f2f8c7714eafbb37.camel@linuxfoundation.org>
From: "Chen Qi" <Qi.Chen@windriver.com>
Message-ID: <73cefe63-2187-4b6f-ef9e-1296097884b6@windriver.com>
Date: Fri, 22 Jan 2021 17:11:23 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
 Thunderbird/45.4.0
In-Reply-To: <ca24a1e3892d838054450245f2f8c7714eafbb37.camel@linuxfoundation.org>
X-Originating-IP: [60.247.85.82]
X-ClientProxiedBy: HK0PR01CA0069.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::33) To BL0PR11MB3474.namprd11.prod.outlook.com
 (2603:10b6:208:67::17)
Return-Path: Qi.Chen@windriver.com
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [128.224.162.161] (60.247.85.82) by HK0PR01CA0069.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::33) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.20.3784.12 via Frontend Transport; Fri, 22 Jan 2021 09:02:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ef98e0c5-4bf7-45ba-781d-08d8beb478a3
X-MS-TrafficTypeDiagnostic: MN2PR11MB4111:
X-Microsoft-Antispam-PRVS: 
	<MN2PR11MB41110EE42C484DD94ADAB792EDA09@MN2PR11MB4111.namprd11.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	wkcPgqoFpGvFQhEdOxV9Eqym1wiBMlirQAhpWDRdzpxPkKws00fuHiAwb45eFd/7aEaf0pVP5wVD28fh/q9x1OT1aGdQwbYp7rc3nSyg+yIlpDowb0EJtgUk3mXP5IFt9Cmckmlivth9/oEPTYLMiFTOyTjjqDSjfwYuG4YAiN7Z4Pzrchq4ko2UjdpuWDJKvHGfjpc8TGtVXr49ySMpRMrtfzUrGogsxcAWN39gx22qEgIUEKDjtCDLY8lI6CE9QIGMk3AQGIceLUkIzJ8ZJS4pUTmo78OoWTv/AykF49qFOuykfGoi41syyFuZhY+jYwyaoZpRpgFQ2Ipmu6E82ublY1pwOcnjw44M2j+HRcB0eL/nZAglLXvvV+SLg3xQWRgupMwWO424nuRgNpY04N/Imcf5+dftr3MdZGBvjTJq0Es6Cb48zeLlN351EHUox1YoePDkBCByCOr5Ixnmayw5Ljfq8t9dL6J12+pFaVBKJH7kLopoHEefHaLUa6C+r6BoLJnWmwlJifkTkrtKWlCTqH+bWXffoOf1hewvW8bWQ7LfEmvfUNeMVQElisj/lK1eaz4qDhdSd+ApmTFctLENCDbY44EurlUfpugxAvc=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3474.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(376002)(396003)(39850400004)(136003)(8936002)(5660300002)(4744005)(66476007)(6486002)(66946007)(316002)(66556008)(31686004)(2906002)(16576012)(52116002)(6706004)(83380400001)(31696002)(86362001)(6666004)(186003)(16526019)(8676002)(478600001)(36756003)(26005)(956004)(2616005)(53546011)(78286007)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: 
	=?utf-8?B?cHJUZmdiTUVDcEsrUEZwTldjeWhldm5VYkhtU09YRFpXM0RZNTgvZVAyclR1?=
 =?utf-8?B?QWtVamF1bGY5YzdZalBYYnd5RTUreVNhcUF3RjRPMWhYZ3NZV2NRZUN5bjdu?=
 =?utf-8?B?MTA0NzdnRGFORlMrTURzaGhqZ3RZOWRBUzhKcDhOZ0Z5ODFWOWoyNnc3TXBq?=
 =?utf-8?B?VmExS3RuTnlCN044QzZLajJoRDl1Tm5FYzEybjh1NU14VTdScmRKdTlyTkFT?=
 =?utf-8?B?RmwxNzUvaW1nKzJLS2o3NHU3SU9aQ3BHajU1c2Fza3dUZXM2L0pYV25zdUVU?=
 =?utf-8?B?UHcrOXZSdnpSKzNERHVSRlA1cmduWHRkZkZXa1F1Q2FWZEl2a0tBUm5EV1NP?=
 =?utf-8?B?Q0R2U0o5bm4zTlVjMmI4N3QrdjdBNXRRWkFidW9FeGc2QkZOUmZtTy9SZUNZ?=
 =?utf-8?B?ckJjbkRaMTlESi9ibnJkUUhIZ29yL25vUmkxQWExV0JIYjc3S1ZxZkNLQUZr?=
 =?utf-8?B?M1R4WWRLeFQrYlJyK1BueTFDd0E5WnEwbmlpVS8vWGNzaGVLMlBPNFVDZ3RG?=
 =?utf-8?B?NTV1RTJxQURMRmhXRzB2aThiWkkwb0pZZlpmL0NkT1UvWDBlN0tvZ244d1Yz?=
 =?utf-8?B?dUhlL0R0QnJ5Rm52Q3UrNHUrSk00bTdkSmRlblRoRXB6ZTh2NzcxeVpjeDYv?=
 =?utf-8?B?VUxZeUV6dEV1aHhtdGpBUXpubGYveEtqOC9ud3RKVFZqbXprMWxkSW5tODY2?=
 =?utf-8?B?T2VQRzhFeFRCd01iWEs3M212S1hGelFWSzZzdkZDMUlNUW1BOXVxdmtDcjE1?=
 =?utf-8?B?dHF3bUpJck5CYklKODFyazJtc2FSWFpFTk1seFJhVjZuQ3VKbE1kVC83Qk8x?=
 =?utf-8?B?bTh5NTAydVlOWnFHMHNOdXcrWklIR3JuVE43M0tsdFFnRXBFZW5BYllNWjg3?=
 =?utf-8?B?V1F0cmJXM2k3djhGWnNMSXJUVnNmNjFVNXBkODZkd1A2NjJNaE9rMC83aENN?=
 =?utf-8?B?SC9aU2MzZnZtR2F6Ykx5SktQeTZ4THVhYlJHNlVZclRpYm9QVzhsc0xuOHVC?=
 =?utf-8?B?Sld3WjNpT3FDbkRSUDI1N055UmNFNmdWbTRDZVFmcWFjOU1ucTg1eElUTEM2?=
 =?utf-8?B?NUJtKzU3bTRxbnpYcmRqaU9uem5tYW9KMlBiZUc3dUIzaVBETUVZNkZ1UHR1?=
 =?utf-8?B?ZDhhL1NWTTkrL2syMWx3Wml1ajdNdUY1TXJJQURxUVc1ZnpQeHRUTG1XYnNp?=
 =?utf-8?B?MmptZDZBaXVDYTMza0VNTngxa2YvQTVsSTFpTGxJME1DMEdtQkZrZXc0MGR4?=
 =?utf-8?B?R3FhNko5RVFLMzJmeWh4bzduODc3UnV6WkM4aDR0NlpwZTl0endOQmJ4L0hT?=
 =?utf-8?Q?+wKTH86YOYiG51UW6VN8U+zDvQahS0Cq4k?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef98e0c5-4bf7-45ba-781d-08d8beb478a3
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3474.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 09:02:40.3663
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BJ89UgQOiJeVsBFvvrBkBs3oWGT/T1O9kw8XeL26vb740tl4P6g+ZmfGdLdZLhD8vkbGjR2UShx0tDGATJ48ww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4111
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2021 03:55 PM, Richard Purdie wrote:
> On Fri, 2021-01-22 at 12:44 +0800, Chen Qi wrote:
>> By default, qemu reserves 4G virtual address. It's too large.
>> We've met error due to lack of memory even on a 32G build machine.
>>
>> So change it to 512M to mitigate this problem.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>   .../gobject-introspection/gobject-introspection_1.66.1.bb        | 1 +
>>   1 file changed, 1 insertion(+)
> Are you sure its out of memory?
>
> Its only taking virtual addresses, it shouldn't actually be allocating
> it all.
>
> We did notice that on some of our autobuilder workers we had to change
> mmap_min_addr setting being too 65536 which solved out "out of memory"
> issues.
>
> Cheers,
>
> Richard
>
>
Thanks. I checked the server, the value is 4096. I've changed it to 65536.

Best Regards,

Chen Qi

