Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED1A1C87FC9
	for <webhook@archiver.kernel.org>; Wed, 30 Jul 2025 09:20:48 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.0])
 by mx.groups.io with SMTP id smtpd.web11.30922.1753867241368068817
 for <openembedded-core@lists.openembedded.org>;
 Wed, 30 Jul 2025 02:20:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=i6qis6y7;
 spf=pass (domain: cherry.de, ip: 40.107.130.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c35lvu3oZhBSdzM38cmPzdXPsgMB2TwAMkKnJ2neNC8wh32LyfrSJR/I7Cr/AVL2/aeZjyfeORDGU4YVZKYWaIh3x+VsimZ3eWUq54EmfiURdA7WHENnecVN1jdeZEI4WkLUgyf1zuq5TnM5zy8jjKRZdU7NBqAKpkDIZB9L3FSA0lN/NG6ubKT2Su2uYrYchOyW1qCffFLdtsr1MqltwxARv+Loi0WzaVesb4rxGXu8ys0r5cd2VsIuq+2X1DBmoQF1/wKG8An6YTfej7AvXTsg895tx5uPE00AebAuTOhqoeO8ZyfsFd8b0XiwvaEMAjJW/bkcvGyGOwet0e8j3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2f3zMFUIG7GxU5ohIO6EdQISH4HwUVxN9DVpEurk4ms=;
 b=tP/3fce7rOr4ZXFO7QZLxRX+jKm8Xj8q0P8CyLrXV30GHq41jCnjqazCPM9Bm5QvIELH+uR+0nCZjSk3/Rl188XoEkLgUOm81LXQn1s1U68KapjMU5oTpPojVpfVqMYHBoPOR/VxWGCWQAYZfgnbZaoVc2nb9Jw3RpDsRlWbXSYyCRWMaRJ7D3p/zjYWmiaCsFP70HJF5Hu2oRUw95ZdUd6uR42IQ0XHJMFJDLA2w0CLhPw2k0aMcAHbhUpuIzAsV8gm2vMeZZ2XFqhair32O00fA0EB5aLlsKQGTWMEVvgV/u+NnHYAMm2BT+qE6lj1PQjZE5vB13e2HN6ClCq54g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2f3zMFUIG7GxU5ohIO6EdQISH4HwUVxN9DVpEurk4ms=;
 b=i6qis6y7g1LuhelHFK3GrngfN6kpg3Bd2Ant7finiNSGX0fd2Gaz09ovvLeq9SeEVl3+nEgqVeIYfFiCBjn3hWy9cegyASMGM5uOSRgKIFDvD4rsFCHHnu2SzYG5hg5Oc2AP7ab/JoTo9zeR8rQHr7AiuJiMAHOV44+IKdjQLms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9596.eurprd04.prod.outlook.com (2603:10a6:102:23e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.12; Wed, 30 Jul
 2025 09:20:37 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 09:20:36 +0000
Message-ID: <549ab43e-1d0b-4142-b3c8-bc1ad56faf97@cherry.de>
Date: Wed, 30 Jul 2025 11:20:34 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 6/9] mesa-gl: drop egl/gles from default
 PACKAGECONFIG
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Quentin Schulz <foss+yocto@0leil.net>,
 openembedded-core@lists.openembedded.org, Markus Volk <f_l_k@t-online.de>,
 Trevor Woerner <twoerner@gmail.com>, Ross Burton <ross.burton@arm.com>,
 Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <20250729-mesa-libclc-panfrost-v3-0-42559ddc93ef@cherry.de>
 <20250729-mesa-libclc-panfrost-v3-6-42559ddc93ef@cherry.de>
 <t7yu2iynfa5vewdnzliamq7u3b5ufppjpanm53n46m7pqhtop2@a2y2gfbu2lud>
 <8df98858-1aac-4314-ac6e-b43b7593aee5@cherry.de>
 <CAO9ioeU7ZLuh4GgizRestPgq_ztRjh6we2pnAEQ2Q_BYit_otg@mail.gmail.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <CAO9ioeU7ZLuh4GgizRestPgq_ztRjh6we2pnAEQ2Q_BYit_otg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: GV3PEPF00007A8D.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::60a) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9596:EE_
X-MS-Office365-Filtering-Correlation-Id: cae1ead2-7a57-4991-9661-08ddcf4a57e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|13003099007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?ZU9UeWxxWXBUbHc3RWNVd1g4OXZ6bEFJMktLL3MrdmIwVmsveVZpa0JpQS9q?=
 =?utf-8?B?WjZ4V3lNMHlTWjBObHQ4S00rRGJzcERERFovWTc3QUhFRk9zWkUyc0p5My9a?=
 =?utf-8?B?MWI5dDlzVUdWQnYrNHpJYUVvRVdwb2xHcFVWRFo5MlJxN3ZmTDlBWS9tQ1NU?=
 =?utf-8?B?NHQxbTFBUmxLZStwRHJvVWZ6cURLU0VOWERiaEpESmlIU3pVNWZUdVYrN1hh?=
 =?utf-8?B?MTdWUzYrVmdWUXRMRFpqN2VZUUQxU0JGUkxiZ1dXaEV2b3hjM0xKM1lNZEFz?=
 =?utf-8?B?ZmxmeWppWEpyU0lhVTIwYUVMQUdmek1UcU1HY09ablpUZHY1QjFydXRLY3Fi?=
 =?utf-8?B?OHQ1b3JGTTRsbFZyUjlnNlJRSUkrUkRUS01KcjdRQmg3TDdHT0xFYnVvQ0d3?=
 =?utf-8?B?SDBKYWZybk5oclRSOFFSM3A5Uk9EY1R6c2VTUm5sRFFiVnZ0cms3MEZCcmNn?=
 =?utf-8?B?ZEFwUCtsTVdjQnI4ZFdHRnBRN1hqejJYckVJejAzckJRbENkaEhnVVJkaEJz?=
 =?utf-8?B?RVN1L3VLRUZWbmF6Z01FaXltYnZCVjUzMjFMVWo4N09WZm1QZkNKMkJzT3BH?=
 =?utf-8?B?R051aUlDZ3lLRTh2bTdUMUQ0S2Q0RXpXY2d3VEJQWkE3RDRINTFsOC9BcGUv?=
 =?utf-8?B?amxDQ3BRaEp5UzE2UXIrczhZV1JtOHR2QXdpZFNQdTdUOXg2YkY0dDlkamdR?=
 =?utf-8?B?OVdSWjFPd0wvRzhsMmRXQXg1TGs2MkxCR3JaazlZVE9ldXhMVWpDL1I5ejJO?=
 =?utf-8?B?dkh6bWtyUnRYcWNFdlFXVkxqd1RKb0JreHpEa0trWFpzODhvWHJ4UlNVMHIz?=
 =?utf-8?B?M3ViMThqVlR0NmMwQmREMzZtaUFxTWhlNGplZnU1alk3MDNZazVWcnpLQjUz?=
 =?utf-8?B?ZEt5a040ZFNZN1JveGo4dmtIY1hzNGJkeXBZUU94clJjNlVkQ0xGQW5WZTNO?=
 =?utf-8?B?dFpDb3psVUwzb2ZSVG9vZS9hVzl3dUZrL09MZEpzc0c2YUVlNFFFVkdTd0sv?=
 =?utf-8?B?Z2xVMDdvcHdDSzA3U0JuVmgzaUlHZlBUMVdLMzZvYkdhZmNaVjVaUTBRTklF?=
 =?utf-8?B?d3hmWVZXU3V6MmJOeTlwYUVOSi9FdExoSCt4Uk9ZRHcrMmV6ZGhhTElJWm5M?=
 =?utf-8?B?c3VvTU9tVmNVY3JTU3NwMnFDNUxqZmRHa1NDVHlWV3FTMTlnWXVaODc0aUZx?=
 =?utf-8?B?ODkwQ3VIdTc4REZuR0x2b1Z3bmh0aElEcUR4NUtnRC9RdW8wMXpHOUJjQ1kv?=
 =?utf-8?B?bExqdE8yYnFFemxzMW9BTFp5UHF4aFdBRmEwd0VXbEZZMkVIdTZUQ3E0c0pj?=
 =?utf-8?B?MDQrUTVBRHcvcGQwa1hkVkd4OTNDMlc1NlczMDl5eTRxOGkwZDNQQkRQa0xa?=
 =?utf-8?B?VS9Fb24wQU9DZGpZOFFSdFBKczVBNVFJOEtUQUFaMGhLWjFBWm1lYzZEODVu?=
 =?utf-8?B?L242Q2UzaS9wY09BT3dTOFRPRnp4L2JTa3pZdWgxWXdyRTdDMWxnTHpQV0hM?=
 =?utf-8?B?aWU3ZEo2cExqWXA4MEEvY1FYVjR4VkN6bGtVMWRnS1ZUK2dQamV6Z0I1OW1h?=
 =?utf-8?B?VGRlS292S2V0NytyZU9aTC9WUCtuY3FYV2krR3pzUnA1Y1VnL0RUWXhESnhw?=
 =?utf-8?B?bVY4ck50azBydWYxQmVldEd2M1N5SjdTd1VWZzN2Tk9YNWNuRHJuOThhVVpF?=
 =?utf-8?B?cnRlZTdaUjI4Vk40L1hlM1dCc2JBNTVNTTN1WTAweTJZSG8raDRqVm1jU0RN?=
 =?utf-8?B?NHlLbzVINEdOcksrZDNkdTVPRWtjdGZSL2lHUUJPcWUzSmY2N1ZKNDZQT0dK?=
 =?utf-8?Q?3Htl9z/EgoWx0eFbCi6as+D6DPpEWJoZ7Sp/4=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SkpPQVdkMG84MFN2blpNWTRscHFLVlcrSStPdmE4enRIK3J2Z1BNTjI3c1d2?=
 =?utf-8?B?SWhJNjh5blJyc3lyY1VISmozbEJSQzlDbnJxRUJNaXhyQ091U3hLSEFHZmF6?=
 =?utf-8?B?dytOSlFJVWN5NytZSkRoWklxOUdmV1J3WHZMVGF2bStoak1DN0d4ZXNmOWpR?=
 =?utf-8?B?emFiY1NmcGNSaVlJYXNuaUttbW9FWU1EeS9KYlhtK0MyaVowMXh5anRYQWhp?=
 =?utf-8?B?T1c5dlZqdUk4cy9kQVNkZXdKZDBXaDcvaHdJOTl5Wjd5MXErWGhtRjY2emxT?=
 =?utf-8?B?elZ5UkVhWDgvNWYwSVA4eFV4RUNTMzlhQVlYVGdnZlZmTUI1Z3VzK0VyZVlN?=
 =?utf-8?B?cWF3MFE5S3FIa1diSlhCeDg5TUFSV3FmSGp6OUlHaXN4bXVDY29ielN2eXhE?=
 =?utf-8?B?bzlsOWhCLzJsREFUUURmeXovV0VJM09Yd29mUjdBYnlWZ2NHMXRrbThLdDl2?=
 =?utf-8?B?VTE3WVlqV1NBZlRTa29SYlh4NWhkTWNPc1dqOGQrZlo0b3lmckFGbjd3N3pG?=
 =?utf-8?B?dGI0bS8wTVFnV3N4Q0g4ZGh5eENMN0VPZFN4dkVzeVdWQStxSGVkOGc0UjRk?=
 =?utf-8?B?cWxvTGhoYnU4V29pQjJLNE4zdEJUV3NOWHBYZ1h2bE92SGR2NjBQN3orU1Bu?=
 =?utf-8?B?SEJkZXJ5c252OEhMbjhxYmdib0JFT3NseE5KTGFHalRPZ1Fqb2FpRjRHU0Vj?=
 =?utf-8?B?TkNSWmZ1NDdBMjBtbmpBdVNjNGdtdHQ0YlV2dG8zTjRUZ21tOWRFRnFpdkps?=
 =?utf-8?B?WUZUa3NVdi9ocWlLRmFQTGljTUpYTTRHcmJaVEZCZmJQelQxQlBNVWVWL1JN?=
 =?utf-8?B?K0dNbStQNHJNTjRldXFFWkQxMld2RDQySTVoVTRkYU5VWEphTEk2K1hXTUVM?=
 =?utf-8?B?c2kxenBwWllaM2VUSVoyZ2hYZWZWTlhUVEF1ZFk5UktZR25WOUQrVXFEVzNt?=
 =?utf-8?B?eHNEU08ydlFScDFJQkx2TVNhQzBhQmNRUmdzbmNLano2eU1uYSs2WnRtd2VC?=
 =?utf-8?B?OWxqQkpUNFJzNmlnZ1hUd1dxSVVzaHVhMWMxVDE0Y29BSk1oVjNjTlBEOUNk?=
 =?utf-8?B?T0VYN2w5U2M0NkdnUGkyazFEY25FcXhGZXZZdVJjeHNaVGthdi8vcjgrYlRK?=
 =?utf-8?B?aW9ielFlZDhyUHY0emdIWVZ4Y3Y1ams3UDBmRmZmQm04Ukh1QkFXZ1VnTDZV?=
 =?utf-8?B?YTdWK2R3cDhSbENmTXAva0ZVUEd4OTdaYWY1Wk1xUCt6RytWZWowVnhLbU9Q?=
 =?utf-8?B?M3daYlhBZFh3NE1EV0JGR0xZaEd5eDRrWUFheGl3VlQzWUpZeVhKRWhIcjJs?=
 =?utf-8?B?amhvWEUwUkpiQkZBeDBpU0RuaUFjcWh1MnVlNFN3eVJPTWRhbTR5MFdoQyt0?=
 =?utf-8?B?VHVPeGNPaEJMMTd1TFA4QjVDeFFnbGgzQTgxNzFnSWVNaG1TUk5UeXVVVW52?=
 =?utf-8?B?bEU3eUUxTkRmTTRRZDZmd3NNRitIT3hOaGwwTzVvRHJHa1llZ0lvRkdweC9i?=
 =?utf-8?B?MjRtN3FxVnRkdmkwaWxpdURQZWdLU3R0ZFVVSXJqTEZjd1ZWYjdnRExUTEk2?=
 =?utf-8?B?MEpFOHZ0ZisrOE44eEprak84TkIxb2Y1M0JRaXhiVlBjZFA1Lzl3MjNWYVl5?=
 =?utf-8?B?MEVkUXVoVlRYZElLelNzMzlLV05NbDREaVNnSi95dGRpVHZyb0FxMGxURVV4?=
 =?utf-8?B?VU9XbzI2NVYrL2szQ2Zic2xrVWlpWjJyV0JJLzJTaGpEbUNXQnVta0E4OWRp?=
 =?utf-8?B?UFNEemVXeE9qcW40OGxwdlhiM0VmWVlBcDBEMUxOYnpGbzJHc1laRGlpd0Yx?=
 =?utf-8?B?RWpWdllhM1BCUytwUU90NHFyNDViVHhPbnFXNVNiNk5jQ2twdTVhNllPMnc3?=
 =?utf-8?B?SjVacXF6Tk9kb0N1ZXk2L2FuZ3FNSFlnOFp4Z01HRHdiNC93UHQxamhWTWN6?=
 =?utf-8?B?bEJHVUJvR29rM1ROaE5BN2E3RjZwbWJjMDkyZFVzNGJnVkp6eG9oNHhaUnp3?=
 =?utf-8?B?NlorVzRTc1VEOGRRL0xMQ0cxYW44Qm5IQkJvSHgwZmJjYVhBUm5JZjRrT09O?=
 =?utf-8?B?SXd1dTlCRFJrTW9qMWhvSzI0bUtjbkpwbVlhazlVRlZGMEN1bzNoblgyR0ln?=
 =?utf-8?B?NTRDQm1rMlRybEMrb1VRb0ZGSS92UllnejhPczkrOVZaMGpveitVbExhS2RE?=
 =?utf-8?B?Mmc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cae1ead2-7a57-4991-9661-08ddcf4a57e0
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jul 2025 09:20:36.7050
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mqZn8atjvtjQxAi4HKd8C+S7nO88SRcOcXxDBns1jQHzERbPhEv7qnYwluiCsNelczk9eyTQ/Zrw9UOFHfklQK3p/3HtPdo5DFvTWaistIg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9596
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 30 Jul 2025 09:20:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221113

On 7/29/25 4:46 PM, Dmitry Baryshkov wrote:
> On Tue, 29 Jul 2025 at 14:07, Quentin Schulz <quentin.schulz@cherry.de> wrote:
>>
>> Hi Dmitry,
>>
>> On 7/29/25 1:02 PM, Dmitry Baryshkov wrote:
>>> On Tue, Jul 29, 2025 at 11:36:27AM +0200, Quentin Schulz wrote:
>>>> From: Quentin Schulz <quentin.schulz@cherry.de>
>>>>
>>>> According to the introducing commit log[1] and Dmitry's recollection[2],
>>>> the whole point of mesa-gl recipe is to provide GL library in case there
>>>> are vendor-provided GLES libraries.
>>>>
>>>> Therefore, let's remove EGL and GLES default PACKAGECONFIG as if people
>>>> really need them, they likely should be using the full mesa target
>>>> recipe and not mesa-gl.
>>>>
>>>> [1] https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
>>>> [2] https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>>> Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
>>>
>>> Please squash this into patch 1, otherwise you are fixing an error that
>>> you've just introduced.
>>>
>>
>> I've not introduced it, it's been like this for years already, I'm just
>> moving things around in patch 1.
> 
> Yep... Maybe then this can be a separate commit before #1 - fix
> mesa-gl PACKAGECONFIG.
> 

Actually we can do better I believe. In patch 5, I remove support for 
native and nativesdk support, so I can make :class-target the default 
without an override and remove :class-native as well.

Essentially, we wouldn't modify anything in terms of behavior until we 
remove support for native/nativesdk recipes (hence no need to actually 
fix the PACKAGECONFIG value for native/nativesdk). Does that work for you?

Would look like:
"""
commit 0656461de69559057c7c5d49f124ac2702920e0f
Author: Quentin Schulz <quentin.schulz@cherry.de>
Date:   Tue Jul 29 11:15:23 2025 +0200

     mesa-gl: make recipe target only

     According to the introducing commit log[1] and Dmitry's 
recollection[2],
     the whole point of mesa-gl recipe is to provide GL library in case 
there
     are vendor-provided GLES libraries.

     Therefore, let's make this recipe target only by removing the
     BBCLASSEXTEND variable.

     Because it is a target-only recipe, we can make class-target overrides
     the default value of the variable(s) and remove the class-native
     override.

     No intended change in behavior for the target recipe.

     [1] 
https://git.yoctoproject.org/poky/commit/?id=015cb13a67c672de30f5384dab5ab4b8db305281
     [2] 
https://lore.kernel.org/openembedded-core/5ebxxyvkcur3zpef5krvyizomgdgtls4qau7s2i2mgcmvs2loy@ilcud37qk6sn/

     Suggested-by: Ross Burton <ross.burton@arm.com>
     Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
     Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>

diff --git a/meta/recipes-graphics/mesa/mesa-gl.bb 
b/meta/recipes-graphics/mesa/mesa-gl.bb
index bdb4920572..e4e66a762d 100644
--- a/meta/recipes-graphics/mesa/mesa-gl.bb
+++ b/meta/recipes-graphics/mesa/mesa-gl.bb
@@ -6,19 +6,8 @@ PROVIDES = "virtual/libgl virtual/mesa"

  TARGET_CFLAGS = "-I${STAGING_INCDIR}/drm"

-PACKAGECONFIG = " \
-	gallium \
-	video-codecs \
-	${@bb.utils.filter('DISTRO_FEATURES', 'x11 vulkan wayland glvnd', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm 
virgl', '', d)} \
-	${@bb.utils.contains('DISTRO_FEATURES', 'vulkan', 'zink', '', d)} \
-"
-
-PACKAGECONFIG:class-target = "opengl gallium 
${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}"
+PACKAGECONFIG = "opengl gallium ${@bb.utils.contains('DISTRO_FEATURES', 
'x11', 'x11', '', d)}"

  PACKAGECONFIG:append:x86 = " libclc gallium-llvm intel amd nouveau svga"
  PACKAGECONFIG:append:x86-64 = " libclc gallium-llvm intel amd nouveau 
svga"
  PACKAGECONFIG:append:i686 = " libclc gallium-llvm intel amd nouveau svga"
-PACKAGECONFIG:append:class-native = " libclc gallium-llvm amd nouveau svga"
-
-BBCLASSEXTEND = "native nativesdk"

"""

Cheers,
Quentin

