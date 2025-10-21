Return-Path: <deepesh.varatharajan@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5002FCCD19F
	for <webhook@archiver.kernel.org>; Tue, 21 Oct 2025 06:09:22 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.4943.1761026953243518503
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Oct 2025 23:09:13 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@windriver.com header.s=PPS06212021 header.b=RXBIaHsl;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=2389fbb31a=deepesh.varatharajan@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59L5KlR93608373
	for <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 06:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=5o9XCesOgJsH2j33la+LMXF2NfAdlyqTELNpQhIF/ig=; b=
	RXBIaHsls3ZN105OrF3ThH2eb8NWMLaXf3MH8gkeYoAvtBZvo8TfqgGGUtnFu0xU
	FAjupcAfvSnN6eFjHr8udH0w1trmjvQbCnnyfA/fDSgY8CSs3btBz2VkopZiksVV
	z3DwSi8f/h2hfzCX4TBRmRUuRBLgiokgIT3fF0amXDMbhvsWTT0aDe4iu1KM0Bbg
	5Q1DWNA6TlgQdFub4+SQa94H5seMJp75ViIUSxqlzByakF1l1ny2fWCSptIc93w/
	e51jmsEqh3Jq+PTLNUyHUVFbcZ9EWmhYJSIU7g8Hsk8t5ZujpceWadTW+prYSQhI
	+yiesxNPQNj1KLoKhpQ25g==
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013025.outbound.protection.outlook.com [40.93.201.25])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 49v1v5ar6m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 21 Oct 2025 06:09:11 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AoPEp7jN43atPOwHvELE2Jg4F3oLo+8OBq27kxP9TvV6lJ/RhquZr5wUvl0LCFnySDS+I/VRITYXh+yo1Alb+YtrI5kJVdE27baabv99rOs+DjPb2qqWudt18Ugaer+fJMKU6JneduVECcNHqJK/J6HlfaTEnc7dIX46CgRI40IVohnP5hewPfkV6uCZNzbouvde34hOzb64t7BZQY8Wh16ivezShlEwKD3k2Qatcj9n8j90lcPY42jOf9ohTg9O3/0fCkzWOCoWxRUyDayPvCJGPbo+1MUUMcsH6bHmsDiWDushKQEO1s34ELgpETfE6p3qV7CeWwkJJLJl64+7aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5o9XCesOgJsH2j33la+LMXF2NfAdlyqTELNpQhIF/ig=;
 b=gLYl3fMrmE7leEExQzfOLSmx3MJggXpXNY4HLef3G842yPUyOsUeXsX+u0mjQrnYEuUKv1EnBqHla8EKfc2OM+F06Q63fx/KN3jdqsuTvrCMj9rEX/iYG592LsvyE/zv891txSDrb705RqNYHRtd5n6ij4T4uljBaQ6MVQdvTg7P5/pJnqnIhp5fpwJelMyn0d1FAPFbV7fd3q8KqoTdx3WffyQ/F28RTvgafn7oaRSnAuqKYoK1oxPZrOtFHa/ZfDiczoiboppU7VVOjlzSaxUHS5zPLBEE+PUNZWGj8uPfnQvWpILS2fym4ii4gl3FrR6qqnMCvtyJpBj0UZCa5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com (2603:10b6:a03:302::11)
 by DS7PR11MB7834.namprd11.prod.outlook.com (2603:10b6:8:ed::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.16; Tue, 21 Oct
 2025 06:09:07 +0000
Received: from SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f]) by SJ0PR11MB5648.namprd11.prod.outlook.com
 ([fe80::c784:dce5:4b7b:54f%5]) with mapi id 15.20.9203.009; Tue, 21 Oct 2025
 06:09:07 +0000
Message-ID: <a7fa6f8f-eb65-46d0-89e5-a2db234afe55@windriver.com>
Date: Tue, 21 Oct 2025 11:39:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH V5 2/3] rust: Use llvm instead of rust-llvm
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, Sundeep.Kokkonda@windriver.com,
        Ross Burton <ross.burton@arm.com>
References: <20251015095914.2120664-1-Deepesh.Varatharajan@windriver.com>
 <20251015095914.2120664-2-Deepesh.Varatharajan@windriver.com>
 <CAMKF1srz8kTxsfHKj_GtGeaEOj3tut_gGSakz+F430aAZRxE5w@mail.gmail.com>
 <c1b70447-16ed-4609-ba02-02c2318a55e1@windriver.com>
 <CAMKF1srTD1Hx_E209=RsjZCAEmsod3TNZA7k6D=jM9=LL87GAQ@mail.gmail.com>
Content-Language: en-US
From: Deepesh Varatharajan <deepesh.varatharajan@windriver.com>
In-Reply-To: <CAMKF1srTD1Hx_E209=RsjZCAEmsod3TNZA7k6D=jM9=LL87GAQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: TYCP286CA0305.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::16) To SJ0PR11MB5648.namprd11.prod.outlook.com
 (2603:10b6:a03:302::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR11MB5648:EE_|DS7PR11MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: 4987388f-d033-4aae-89d2-08de106857fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|4022899009|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MnJ4M21oSFBtbXlnNUlLdDdjOWhUbzNmMG9hbFBxWmFOdWNEaHkwb0tEWis5?=
 =?utf-8?B?eEtOenU0bXNNQ0RxRlB6QU5ZcllHYmF1YVBhZFNVdXp2QUFOR2cyeEV0QnQw?=
 =?utf-8?B?Qzl0ZjhrMW1yRE5aWjJTUEM1SEVGRHlULzY0cEd4U1FjZGtWMC9WcXRPdmFE?=
 =?utf-8?B?ZkZnVHNKU2ZPM2k3SWlDUDhUZjgzc3RUeGljQzF3alRkZ1d1UmcwLzJhaTda?=
 =?utf-8?B?MmFlaUc5REpITG5wUDhoWGVzalZsS05aV2ZJYTNOSTI0ODVSR0pXejBwUC9J?=
 =?utf-8?B?d1RVSUo0NTNJN0VuVlFkNVBtYlFBWGpmZDI0U3F3aTVtdCszN3ZmZThJNU1R?=
 =?utf-8?B?UzNMQmxsUTBGaHlWVEluYTdLKzRKT0w1VFN5UDNhdXJIYWQvY1NOZlYxN1Ar?=
 =?utf-8?B?ZFFZV3lwbGdqd1ArdGUxTW0yc3YrbkYrSktkZXR5S21TaGJGb1NUeUZKbldx?=
 =?utf-8?B?Z3N5V3B6Mm40QVNWZjgyVnF3Zm1TUDFRalJlUi9nS1ZCQWlma0lBaUhxRHYx?=
 =?utf-8?B?NXJqNlZFS05YVmxjUzVhZW9qSmRsVHFGKzVUcDllbHdWVnJlTGxlMGU3QXJs?=
 =?utf-8?B?d2tkZnVJMXhYVlNnajBSdlRvWnprQ3pPbEU3MjBHWndkSDl5Vm45RG9VRHBK?=
 =?utf-8?B?T0RoNlE3WmQ5NHR1WU9EQnh2cG9KR2o2RTJESUtHeG5wZHR6dDJHQ0o0NXRo?=
 =?utf-8?B?LzR6MXQ4V2FZVGNrN0N6RnRSd1JHS1BQb2U0bk5LSU54MjUzQmFxcjZ1OWJz?=
 =?utf-8?B?V2tDWmtQYzVESDBPNlErVExMTHlWMGZDZEdZZklXQ2Z6R0dkQnZnSDVPMStn?=
 =?utf-8?B?NkNzYW9OQ3VCZnVpZ1pXaVA0K3VXalM2OThKM2JQYjUyby9KYkdKMkNyNjNH?=
 =?utf-8?B?ZVF2VnpBQXVRV0hMVzRtdk5mVWFqY0ZLRUhpMGZMRzFvUzkzR25oTnBHbnFw?=
 =?utf-8?B?VzRndkxuYmdyeHhPYjBrVVJoYWhaOG1RZGVWbENyaTEzUUlkNGxFYWdENUJn?=
 =?utf-8?B?VFk0MzA1cWwvL0RhTDczOVQrUUNZa3lvT0xpNk1mKzBsTEJrUHJORFNTampX?=
 =?utf-8?B?OEFtaGFxSGxaTi83V3pPY0VtQ1JmcHBVYjIxcFVoeDJyL0xCKzBqZWlRdyto?=
 =?utf-8?B?SHNvTHh2UEc1cEZ2bXFRNk95ZVVwcDVxT3NFRXZ3bUU4dXlod0RWMmJHSGNq?=
 =?utf-8?B?T1p4RHB1NDUvNWZsOW83aGp2NmNKVko2b3RIcEFsOFV4cnVqaGIzUkVwMFRX?=
 =?utf-8?B?anI5S3p3YlkxR09iQWg5dEJqME9xeVBZNk9IekVKbGxGam1FYUh6M1BFRlFs?=
 =?utf-8?B?ZWs4NGlVT2lFcTFaVkphSlBWREFNSU5uVWFBTnRXbHpqbGc2K05uTzE2L2Nu?=
 =?utf-8?B?N3hpV3JnR2dYMW5RV2VZSkptS080aG1NYTF3ckVLbkJEMlgyU1gyV1I0R0hh?=
 =?utf-8?B?OHhPUnlHN3JzYm16WExlZ0pUY3Z1TEI0NUkxcTUxRE9zQWJWejRZMjAxaW80?=
 =?utf-8?B?d3Y3QzZOdTl3cFpSeUNGbzdhbG4zcXZ5aUIwUWpiN0Evd2dJc211VDN4aWxD?=
 =?utf-8?B?alFNV1VjcFZPVitUcjZUU0tvL2NrWEY1M0loU2JySCtiWVRWeFBhZnFDaEM4?=
 =?utf-8?B?NW0zSzZmRkZ5UXc5TlRDTFprUWpiRUZQczdaYzE5amJlT0d1L1c1UDhvUS80?=
 =?utf-8?B?eVNQWUZWbmk1aWVjZXh0S3crMDNJWCtST3V6KzVWWXlUZHRlM25hNFppSyty?=
 =?utf-8?B?eXoxM0pXVndYT1BGTFIvdWtRWDdZcG40dktJQllHdEdVNWdqRlUxVVZXSkJC?=
 =?utf-8?B?Y3BENjE5czhhUnRiZkFvVVpMQ09JQStGNXorUVpUOHZOM25QaTJ0T2hGcnda?=
 =?utf-8?B?VnEwTHF2WUdNMklMZzlRTHJSUnBIWUpXSjk4eDNhUUREeXc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5648.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(4022899009)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZFFrcWlpQUxJRUVqMllVbC9YSTN2V3YzU21rN2lrVjlGU3RiN1E5MlgzU0h4?=
 =?utf-8?B?c0FEYnhLMUVzRXRnVStRSDZaUllOay9uTkUyNWptclh5MnNyVHJVN0xIMFpp?=
 =?utf-8?B?TTRPSmE3d3VLUHZSOHdhOVg5ZUpBN2JHRkltakNFNlFXR3IvU1dCbU5VTHR5?=
 =?utf-8?B?VWdPZHcvTXlQMU5XczlGTUNpaVMxMHJ5VDczNWFJYzNGZTRCN2Z2ZkZaNnpJ?=
 =?utf-8?B?dC9FRFlSRUhMLzh2U2dqVWl4Q0lqLzkvSXVkb2VwU2F2UnZXQmZ5cEg0Smgw?=
 =?utf-8?B?Q1U5QlMvTTR6RitzdUk3RmdVS2FZczNZWCtsa0dtdHprNjJ6ZmluZXhlb0x6?=
 =?utf-8?B?bDNTSzM4NHh0Vm1aQmxZTDBnZlZuZmFrZ090a3M0VVN4WGRMaUtBQmNNcWwr?=
 =?utf-8?B?cE5PVVEvenY4Z2RpVmk4WVE5YWlTa1ljNnRDbUFidU1RYlI5cTByMjZKMGEx?=
 =?utf-8?B?N3RRUVRmU3RRaUUzSzBRbU5ycUhJTWxzazJmTUl4ZmRUS05IV0dyVXllL1A2?=
 =?utf-8?B?VDkxZlZPMFFyNWp6WUhYaFZDVDc3a0JmeGp4dk5IVDVIWUQwcXdtR3MveWRk?=
 =?utf-8?B?U1NyNlhxelcrOEhYV3Q2RGlacGFaRzJpWHh0K0tZR3ArL3NiaTE4OHJGUHF5?=
 =?utf-8?B?L21CNkJqSmg5cXpLWUZPUGp6Um43WjluTVJjRDZWazZWSU1DOW1YaDFrL0Rz?=
 =?utf-8?B?OC9kblZ0WS9PdXZTK2lmKzNCVjJKNjg1ZmtwMGszUnBYMTZvN2tIeHNZK0JS?=
 =?utf-8?B?T1Y0KzRpTGpqeCtXazlPRlVOak5RN1MxKzkrV1ZBVVlBVCtENDRHTE5KbVpQ?=
 =?utf-8?B?WVRYZ3owRnlJczBPaW1sTjJUVkZpOU9HeEZvVzhJcFdERExSaTNSdE5IVjBm?=
 =?utf-8?B?VldtcC8vSlcraUltQTJTL2cvWkcwRTU1emNDeHlwdmdiR2dmSkhEbUxBNnhX?=
 =?utf-8?B?S2tSVzRuWEFWWkMwd3duZEdUelZGWS9mc0x0ZmlET3p1cmcvV3pFRy9vNDR2?=
 =?utf-8?B?OStvejNvQnMwTjQvT2NPcjBiQ1BCUlM4Z2FnL05IeUhCUmVlZUQvTFQ3Tk1N?=
 =?utf-8?B?cmhDVDVtWkRpQkFQZ2pXRHRwaCt4a0lEL0NJNWpCVVU3b1hKTlRNdnp0MzlL?=
 =?utf-8?B?VXRDYm9VUUw1dkU3MitVcTM0SktIVmMrYmtab0NoLzFmWFFBS1orcGVCQ21S?=
 =?utf-8?B?SFhpQU10NGwrbTVRdFBObGpvYTZyV1pJWGZjbVAwdXM4UHMrR3p5Q1FTWVNj?=
 =?utf-8?B?QTJPbktZVFcrVUU1QWpLYTVxRi90bjZwWXo0TjBHVW1ZVzdHQVY4R0JLdG04?=
 =?utf-8?B?cUFXUkdjZ3Rsbi9icUFCK1M0VTVFSnpCTjFsUE40NjM4UW4wTDVFWERRbW94?=
 =?utf-8?B?UDJtdzhBSnZLSzNRS0FObEZONGdJRkZFdDhKaHVWWmxuRFZKWWxaMXVKZHBY?=
 =?utf-8?B?d1RlNitBS1ZwNmpickRETU8zMWZvcThjOEQ1NVRjQUtlTUZxRDFTYk9JZUJm?=
 =?utf-8?B?VXcvME5yRzZVaW1OTnhTYm5LSld2d3FZZmNqd1lkbjNzNW9DSlpjamFlcHBH?=
 =?utf-8?B?bEVtdDl0bXZBeURaQVUwVGJxblg0bUlScWhtWkZuZzQ0MHJPOWFsWFhOazhr?=
 =?utf-8?B?NEdQNElRVG1XRFBibjNXMDl1Z01UOVU0cHh0SUpXbnZnNnFyTlJtMXBKY2lw?=
 =?utf-8?B?UG9kNlBaSlpiUXRRczVIb1VVN1d1QXloYmhZYkVkeUFJeDNtTE45UmZJdnhB?=
 =?utf-8?B?TWhjdXNoYkpVZkQyQUYvZjVFVmhxQkZQZlp1QVQvcHFrZEZITTVPYWVaWlRC?=
 =?utf-8?B?QWIzRTRYMGNWeXMrbCtFdklHYTBlUkpZYWFYWWJjSnh4R3U0M2x3WGczbDdP?=
 =?utf-8?B?a2pCeTJPSTN3Q29LcUtDdWlLWVJOZmYxeTdPeUNMZkN2a0NOYVRpRmM4TS9N?=
 =?utf-8?B?RXBNUDRKMkVibkxWSCtFd09JazkzeFhxdzYyTUtLWXc5aXdIY21kVjg1Rjc2?=
 =?utf-8?B?RFVZbG1ZRFNTdjZhRU1YK0k4M2JieU5HMzIxZHV3SFBxVEU0QjJ3TlVQUlVj?=
 =?utf-8?B?ekRXckRScmkvYlVhYnU5T1VPaWQ4RjhwYis0bUFudzZJKy9nTENHWUpLK1Mz?=
 =?utf-8?B?d1ZDeE1aZjc1cytuNTJhcG00bmVkREJQSnVlaWRQN29ZTnNYM0hyWmt2NjU3?=
 =?utf-8?Q?ImmJUdDqpQEOoB3Plbq6IAI=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4987388f-d033-4aae-89d2-08de106857fb
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5648.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2025 06:09:07.5418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PJv7QNmgcO60W5w+tERlnMEPV87343OU+mYHQ9p1oYio4lUIYMh8wKyVUKESZIzu5LD9NOvhY8NsV+qXIsQ64Ej0fMXQE39zcXWjPYYatowgH8VHF4dh8Sh+TwdhDYF2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB7834
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDA0NyBTYWx0ZWRfX91gn5Jb2apkB
 rsBbNAgyzhKr10GNWSQWX8QZQ4naH2Oz3Rl2SZEEEfRbC2C1GPmqzPcCr2hU7I0jd7F/LYU23UH
 9EzC2mwMDSp1xdBYteZQSR46SDx0XJx9Q5eQj8rUyN9cpYfPsX5UzT1Hky0Z+fGlOJr6vVy/B/k
 ISedbxhXfaIRRqx6tekpDBfb5SUVcZAb7LujF55+obT/edklC3mgQ3qGOcTCYVkIW0mDYSOBdpf
 ZTmQTYp1F9bBm7ULb4w/v81RUv9VMgrhLuhC7lyvfW4BxXlxxbuR1Wo412EUMFFIXVGu4qH/KtS
 Gp7JRD+Qf2ikTfNsVGoubQnPVrC80kK0J4igakBNTZkjn9WwIcjwyJAClU3hLgP5niJUYHHn3eO
 tEHK+1aXFRVHZ79Hybc7cojx9RZalw==
X-Proofpoint-GUID: I-_BP2X2Ms3NgMscQqONSy4Y18D83tTc
X-Proofpoint-ORIG-GUID: NCjAva5InXTSQGbeQPyBRjXl6Cq8XAwJ
X-Authority-Analysis: v=2.4 cv=ANdmIO46 c=1 sm=1 tr=0 ts=68f72388 cx=c_pps
 a=7LdyZ4/2TJtu80KvlWUjDA==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=iGHA9ds3AAAA:8 a=ei4SEBeUAAAA:8 a=NEAV23lmAAAA:8
 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=QnZsAn79WY5I1R1nNn8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=Hqou25T6mLgA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22 a=8zIOOLb7Ym0NljyPXbuS:22 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510210047
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 59L5KlR93608373
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 21 Oct 2025 06:09:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225142


On 18-10-2025 22:41, Khem Raj wrote:
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender =
and know the content is safe.
>
> On Fri, Oct 17, 2025 at 11:42=E2=80=AFPM Deepesh Varatharajan
> <deepesh.varatharajan@windriver.com> wrote:
>>
>> On 17-10-2025 11:31, Khem Raj wrote:
>>> CAUTION: This email comes from a non Wind River email account!
>>> Do not click links or open attachments unless you recognize the sende=
r and know the content is safe.
>>>
>>> I am seeing a build regression when using clang as default compiler
>>>
>>> https://errors.yoctoproject.org/Errors/Details/885430/
>>>
>>> PREFERRED_TOOLCHAIN_TARGET ?=3D "clang"
>>> PREFERRED_TOOLCHAIN_SDK ?=3D "clang"
>>> TOOLCHAIN_NATIVE:pn-rust ?=3D "clang"
>>> TOOLCHAIN_NATIVE:pn-rust-native ?=3D "clang"
>>> TOOLCHAIN_NATIVE:pn-nativesdk-rust ?=3D "clang"
>> Hi Khem,
>>
>> WIth the above mentioned conf in local.conf, I tried building rust for
>> qemuarm and qemuarm64 quite
>> few times and the build completed successfully without any issues for
>> both native and target. Do I need
>> to add any other layers on top of poky ? Do you have any branch where =
I
>> can clone and reproduce the
>> issue ? Am I missing any step in reproducing the issue ?
>>
> Yeah, I missed a setting which I think could be the reason
>
> TC_CXX_RUNTIME =3D "llvm"
Hi Khem,

After adding the above in locl.conf, reproduced the issue. I've looked=20
into the issue and
here=E2=80=99s what I found:

Currently, both rust-native and rust-target rely on the natively built=20
llvm-config binary.
However, upon inspecting the runtime dependencies of llvm-config, I=20
noticed the following:

$ ldd ./llvm-config
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux-vdso.so.1 =3D>=C2=A0 (0x00007ffdec9eb0=
00)
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libstdc++.so.6 =3D> /usr/lib/x86_64-linux-gn=
u/libstdc++.so.6
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libm.so.6 =3D> /lib/x86_64-linux-gnu/libm.so=
.6
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libgcc_s.so.1 =3D> /lib/x86_64-linux-gnu/lib=
gcc_s.so.1
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 libc.so.6 =3D> /lib/x86_64-linux-gnu/libc.so=
.6

As shown, llvm-config is linked against libstdc++. Meanwhile, we're=20
enforcing Rust to be
built using libc++, and this mismatch is causing symbol resolution=20
issues at runtime.

To address the ABI mismatch, I tried building llvm-native with libc++ by=20
introducing a
dependency on libcxx-native. However, this leads to a circular dependency=
:
 =C2=A0 =C2=A0 >llvm-native depends on libcxx-native
 =C2=A0 =C2=A0 >libcxx-native depends on clang-native
 =C2=A0 =C2=A0 >clang-native depends back on llvm-native
This cycle blocks the build.

One possible solution could be to create a separate llvm-config recipe=20
that builds with a
dependency on libcxx-native, and have Rust depend on that version=20
specifically.

Do we have any alternative ways to break this circular dependency?

Regards,
Deepesh
>
>
>> Regards,
>> Deepesh
>>> On Wed, Oct 15, 2025 at 2:59=E2=80=AFAM Varatharajan, Deepesh via
>>> lists.openembedded.org
>>> <deepesh.varatharajan=3Dwindriver.com@lists.openembedded.org> wrote:
>>>> From: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.com>
>>>>
>>>> Updated the Rust build to depend on llvm instead.
>>>>
>>>> *Summary of discussion with the rust upstream about using latest LLV=
M instead of Rust maintained LLVM fork.
>>>> https://internals.rust-lang.org/t/can-we-use-proper-clang-instead-of=
-llvm-fork-what-rust-uses/23489
>>>>
>>>> *Upstream LLVM is generally compatible:
>>>> - Rust does support building with upstream (vanilla) LLVM, especiall=
y the latest
>>>> major release and the one or two preceding ones.
>>>> https://rustc-dev-guide.rust-lang.org/backend/updating-llvm.html#upd=
ating-llvm
>>>>
>>>> *Impact on Yocto Rust upgrades:
>>>> - Rust upgrades shall always check for updates on rust forked llvm a=
nd backport
>>>> the relevant patches to llvm.
>>>>
>>>> *Regarding the rust forked llvm local patches:
>>>> - There are no local patches on rust forked llvm other than the back=
ported fixes
>>>> from llvm master.
>>>>
>>>> *We are copying the natively built `llvm-config` binary into the tar=
get sysroot and running
>>>> it. However, this `llvm-config` has compile time dependencies on var=
ious other arch's LLVM
>>>> libraries because native-llvm is built for all oe-core supported tar=
gets.
>>>>
>>>> Attempting to work around this by symlinking the missing libraries f=
rom the native sysroot
>>>> into the target sysroot leads to mixed architectures in the final `.=
rlib`. Specifically,
>>>> the object files extracted from those symlinked libraries within `li=
brustc_llvm-<hash>.rlib`
>>>> are built for the host, while others are correctly built for the tar=
get This results in linker
>>>> failures due to file format not recognized.
>>>>
>>>> To resolve this, we now build llvm-target also for all oe-core suppo=
rted architectures in
>>>> addition to the native-llvm build. This ensures that `llvm-config` a=
nd all associated
>>>> libraries are built for the correct target, eliminating cross-archit=
ecture contamination
>>>> and linker issues.
>>>>
>>>> *We are enabling -DLLVM_INSTALL_UTILS=3DON to ensure essential LLVM =
utilities like FileCheck
>>>> are available, as they are required by the Rust build.
>>>>
>>>> Without this, the build fails with an error as below:
>>>> | thread 'main' panicked at src/bootstrap/src/core/sanity.rs:315:21:
>>>> | FileCheck executable "poky/build/tmp/work/x86_64-linux/rust-native=
/1.90.0/recipe-sysroot
>>>> -native/usr/bin/FileCheck" does not exist
>>>>
>>>> *We now add these flags "-Clink-arg=3D-lz -Clink-arg=3D-lzstd" becau=
se of this following
>>>> diff otherwise we will get errors during link time.
>>>>
>>>> Setup in rust-llvm
>>>> -DLLVM_ENABLE_ZLIB=3DOFF \
>>>> -DLLVM_ENABLE_ZSTD=3DOFF \
>>>> -DLLVM_ENABLE_FFI=3DOFF \
>>>>
>>>> Setup in llvm
>>>> -DLLVM_ENABLE_FFI=3DON \
>>>>
>>>> *When multilibs enabled:
>>>>
>>>> llvm-config expects static libraries to be located in the lib direct=
ory rather than
>>>> lib64. However, since we are copying the natively built llvm-config =
to target sysroot
>>>> and running it and llvm-config doesn't know anything about lib64 exi=
stence. To accommodate
>>>> this without breaking multilib behavior, we are creating a symlink f=
rom 'lib' to 'lib64'
>>>> directory.
>>>>
>>>> Previously, when we depended on rust-llvm, this worked because we sp=
ecified:
>>>> -DCMAKE_INSTALL_PREFIX:PATH=3D${libdir}/llvm-rust
>>>>
>>>> With this setup, llvm-config was installed inside ${libdir}/llvm-rus=
t, which included
>>>> its own bin and lib directories. Thus, llvm-config located in bin wo=
uld correctly find
>>>> the libraries in the adjacent lib directory.
>>>>
>>>> Even when multilib was enabled or not, llvm-config would still look =
for libraries under
>>>> lib in this structure, so everything functioned as expected.
>>>>
>>>> Signed-off-by: Deepesh Varatharajan <Deepesh.Varatharajan@windriver.=
com>
>>>> ---
>>>>    meta/recipes-devtools/clang/llvm_git.bb   |  2 +-
>>>>    meta/recipes-devtools/rust/rust_1.90.0.bb | 39 ++++++++++++++++++=
++---
>>>>    2 files changed, 36 insertions(+), 5 deletions(-)
>>>>
>>>> diff --git a/meta/recipes-devtools/clang/llvm_git.bb b/meta/recipes-=
devtools/clang/llvm_git.bb
>>>> index d2b060ff88..2f47af8d7a 100644
>>>> --- a/meta/recipes-devtools/clang/llvm_git.bb
>>>> +++ b/meta/recipes-devtools/clang/llvm_git.bb
>>>> @@ -27,7 +27,6 @@ OECMAKE_SOURCEPATH =3D "${S}/llvm"
>>>>    # https://github.com/llvm/llvm-project/blob/main/llvm/CMakeLists.=
txt
>>>>    LLVM_TARGETS_GPU ?=3D "${@bb.utils.contains_any('DISTRO_FEATURES'=
, 'opencl opengl vulkan', 'AMDGPU;NVPTX;SPIRV', '', d)}"
>>>>    LLVM_TARGETS_TO_BUILD ?=3D "AArch64;ARM;BPF;Mips;PowerPC;RISCV;X8=
6;LoongArch;${LLVM_TARGETS_GPU}"
>>>> -LLVM_TARGETS_TO_BUILD:class-target ?=3D "${@get_clang_host_arch(bb,=
 d)};BPF;${LLVM_TARGETS_GPU}"
>>>>
>>>>    LLVM_EXPERIMENTAL_TARGETS_TO_BUILD ?=3D ""
>>>>
>>>> @@ -37,6 +36,7 @@ HF[vardepvalue] =3D "${HF}"
>>>>
>>>>    EXTRA_OECMAKE +=3D "-DCMAKE_BUILD_TYPE=3DMinSizeRel \
>>>>                      -DLLVM_ENABLE_BINDINGS=3DOFF \
>>>> +                  -DLLVM_INSTALL_UTILS=3DON \
>>>>                      -DLLVM_ENABLE_FFI=3DON \
>>>>                      -DLLVM_ENABLE_RTTI=3DON \
>>>>                      -DLLVM_TARGETS_TO_BUILD=3D'${LLVM_TARGETS_TO_BU=
ILD}' \
>>>> diff --git a/meta/recipes-devtools/rust/rust_1.90.0.bb b/meta/recipe=
s-devtools/rust/rust_1.90.0.bb
>>>> index 5d804c7398..0319d73b93 100644
>>>> --- a/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> +++ b/meta/recipes-devtools/rust/rust_1.90.0.bb
>>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3D11a3899=
825f4376896e438c8c753f8dc"
>>>>    inherit rust
>>>>    inherit cargo_common
>>>>
>>>> -DEPENDS +=3D "rust-llvm"
>>>> +DEPENDS +=3D "llvm"
>>>>    # native rust uses cargo/rustc from binary snapshots to bootstrap
>>>>    # but everything else should use our native builds
>>>>    DEPENDS:append:class-target =3D " cargo-native rust-native"
>>>> @@ -28,8 +28,8 @@ PV .=3D "${@bb.utils.contains('RUST_CHANNEL', 'sta=
ble', '', '-${RUST_CHANNEL}', d)
>>>>
>>>>    export FORCE_CRATE_HASH =3D "${BB_TASKHASH}"
>>>>
>>>> -RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_LIBDIR}/llvm-rust/bin/llvm-=
config"
>>>> -RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_LIBDIR_NATIVE}/llvm-r=
ust/bin/llvm-config"
>>>> +RUST_ALTERNATE_EXE_PATH ?=3D "${STAGING_BINDIR}/llvm-config"
>>>> +RUST_ALTERNATE_EXE_PATH_NATIVE =3D "${STAGING_BINDIR_NATIVE}/llvm-c=
onfig"
>>>>
>>>>    # We don't want to use bitbakes vendoring because the rust source=
s do their
>>>>    # own vendoring.
>>>> @@ -188,6 +188,37 @@ python do_configure() {
>>>>        bb.build.exec_func("setup_cargo_environment", d)
>>>>    }
>>>>
>>>> +# llvm-config expects static libraries to be in the 'lib' directory=
 rather than 'lib64' when
>>>> +# multilibs enabled. Since we are copying the natively built llvm-c=
onfig into the target sysroot
>>>> +# and executing it there, it will default to searching in 'lib', as=
 it is unaware of the 'lib64'
>>>> +# directory. To ensure llvm-config can locate the necessary librari=
es, create a symlink from 'lib'
>>>> +do_compile:append:class-target() {
>>>> +    # Ensure llvm-config can find static libraries in multilib setu=
p
>>>> +    lib64_dir=3D"${STAGING_DIR_TARGET}/usr/lib64"
>>>> +    lib_dir=3D"${STAGING_DIR_TARGET}/usr/lib"
>>>> +
>>>> +    if [ -d "$lib64_dir" ]; then
>>>> +        # If lib does not exist, symlink it to lib64
>>>> +        if [ ! -e "$lib_dir" ]; then
>>>> +            ln -s lib64 "$lib_dir"
>>>> +        fi
>>>> +
>>>> +        # Only do per-file symlinking if lib is a real directory (n=
ot symlink)
>>>> +        if [ -d "$lib_dir" ] && [ ! -L "$lib_dir" ]; then
>>>> +            for lib64_file in "${lib64_dir}"/libLLVM*.a; do
>>>> +                if [ -e "$lib64_file" ]; then
>>>> +                    lib_name=3D$(basename "${lib64_file}")
>>>> +                    target_link=3D"${lib_dir}/${lib_name}"
>>>> +
>>>> +                    if [ ! -e "${target_link}" ]; then
>>>> +                        ln -s "../lib64/${lib_name}" "${target_link=
}"
>>>> +                    fi
>>>> +                fi
>>>> +            done
>>>> +        fi
>>>> +    fi
>>>> +}
>>>> +
>>>>    rust_runx () {
>>>>        echo "COMPILE ${PN}" "$@"
>>>>
>>>> @@ -199,7 +230,7 @@ rust_runx () {
>>>>        unset CXXFLAGS
>>>>        unset CPPFLAGS
>>>>
>>>> -    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP}"
>>>> +    export RUSTFLAGS=3D"${RUST_DEBUG_REMAP} -Clink-arg=3D-lz -Clink=
-arg=3D-lzstd"
>>>>
>>>>        # Copy the natively built llvm-config into the target so we c=
an run it. Horrible,
>>>>        # but works!
>>>> --
>>>> 2.49.0
>>>>
>>>>
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>> Links: You receive all messages sent to this group.
>>>> View/Reply Online (#224888): https://lists.openembedded.org/g/openem=
bedded-core/message/224888
>>>> Mute This Topic: https://lists.openembedded.org/mt/115768136/1997914
>>>> Group Owner: openembedded-core+owner@lists.openembedded.org
>>>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsu=
b [raj.khem@gmail.com]
>>>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>>>

