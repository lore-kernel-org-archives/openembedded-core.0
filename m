Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E512EC433F5
	for <webhook@archiver.kernel.org>; Fri, 25 Mar 2022 14:15:37 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (EUR01-HE1-obe.outbound.protection.outlook.com [40.107.13.89])
 by mx.groups.io with SMTP id smtpd.web12.5920.1648217734865174612
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Mar 2022 07:15:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.onmicrosoft.com
 header.s=selector1-weidmueller-onmicrosoft-com header.b=A3Eaa+de;
 spf=pass (domain: weidmueller.com, ip: 40.107.13.89,
 mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=USPLBySRJQqOB3emqCFi45x4/GMVCZoLOKSZ1DT2g96SugXStPtjUVaGmFWJD9diHNl6PHiJ3rMS70vtk1PnYpw5kWIWypgNbaPDFQJ289o8bWjvk6UAXRRqaD3lxRdz8qaMkqLP2dbuRsWkGWLUu9PGX54UapwUjIOc7JnyyzCyz7dRODN6uKPgvwYn8qf29f3e1GARewq9IAmRegifmFJZVyMzLiv5GBjqsUL0wVwjkGpaEoXrXcWHjffShBB6WabUlhPpecKTIFyPd4edUlhg/CAXyYpj9CJTe72s+aTMI0uSt+Yo2KsCn5/Sd6jcXon/K5+Mn8l6bB9nYNvIow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8hFbYSII5kYBr/iKZWmJyh8rd8GGq7V+hyxiJ0bUpuE=;
 b=C73rNQucppOSApdWt3k4wK9TDhzJvigGcXe8shkYYEr2h3Kwifoml30TppR4zx6HahVVWKvXORxHdprfzESKLY3bSd9CiXF24LLMwFIwyfLTCN688Yk0fqg8iyBI1emQnI2pRTtmZrBFgzrLA2stp3yXotaL3TW/QPHV38vv+fBZF7T1rnvwDZBYcXzCCtSQo2QGN2gpXuUWVSaIzpJBpnKLMmythc1w/D/LLmQBreRYv0F+Yrlr99U0vJ1WyYl6D5AWgAGCZZczpdBCghW1Hm5LaQ9KLubJIIz1NUpfltd6t5wxcXexG7mc++lT7LHXoeFKSQHV8PvAnQ19L/Wy4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=weidmueller.onmicrosoft.com; s=selector1-weidmueller-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8hFbYSII5kYBr/iKZWmJyh8rd8GGq7V+hyxiJ0bUpuE=;
 b=A3Eaa+deJ3oS6UqNKTH1xJdCPzCFV+SLpYqem2xv1p/BPeOHOFiHsrLL+voZp5uDIe42kzXSbclpfsJKhYspTHIgitiiehr61IRFSSW6zTDp0TsynfeWCqDCiebWZe3KilBljvmyoI2ojI1RY+PuQtJDdsqOZSQc3Sd0c6tVrL4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com (2603:10a6:102:1d8::23)
 by AM5PR0801MB2019.eurprd08.prod.outlook.com (2603:10a6:203:4b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Fri, 25 Mar
 2022 14:15:30 +0000
Received: from PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba]) by PAXPR08MB6969.eurprd08.prod.outlook.com
 ([fe80::21c3:3ec0:a144:68ba%7]) with mapi id 15.20.5102.019; Fri, 25 Mar 2022
 14:15:30 +0000
Message-ID: <535e521c-cfff-8d7d-ab78-f43a1b0063ee@weidmueller.com>
Date: Fri, 25 Mar 2022 15:15:29 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [OE-core] [PATCH] zstd: add libzstd package to minimize runtime
 dependencies
Content-Language: en-US
To: Alexander Kanavin <alex.kanavin@gmail.com>, Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
References: <20220325101831.1451-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <CANNYZj9htpDkynv-8hcJPA_MU18TtH83bbu_e15rG37z_+RfnQ@mail.gmail.com>
 <1a104385-ede3-53df-37f9-141de5e191cd@gmail.com>
 <CANNYZj8vQhVntJbCdH4i+okyRXUVwFLRJ4kzO8=_F6QO5omreQ@mail.gmail.com>
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: 
 <CANNYZj8vQhVntJbCdH4i+okyRXUVwFLRJ4kzO8=_F6QO5omreQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AM5PR1001CA0033.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:2::46) To PAXPR08MB6969.eurprd08.prod.outlook.com
 (2603:10a6:102:1d8::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c169a3f9-6e5e-4dbd-9eb0-08da0e69eafe
X-MS-TrafficTypeDiagnostic: AM5PR0801MB2019:EE_
X-Microsoft-Antispam-PRVS: 
	<AM5PR0801MB2019079554FDC2E77DD4B896D71A9@AM5PR0801MB2019.eurprd08.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Cnoy4u9eWkiYYfcOhQ+C9ODY0o9WaZmU+EqFZx97TJGHgLRcIcGI78B/mFExc0m0kFXuFQXKuW5QbZ4Dv5UHqjYt+O2pqUhhBPFXj/1nhptWm1JT2S1Ot4iA4S0e4/o3ypFxQQbQpp/MoXTaXbGty4quFpfzwnc9r0l82e4i78Zlu2iMzBpPU6lhD94JcCrFeDQMQ4R8OB1AdOxV9kjTv1027pQ96n4E8hGj0uhtomTW0WoUinUdfAQfrzWDwCv1FUoaoaa4uZkrJ9br3BMqxiwGjFv6vYBaptMDUgu/vm3I5kZ3TVlZaNnBGad0FTuhcqLd28pmsoA1KQrAQlgUdHJdUKOUq+GY3ykO58cUXJnzzBijdi3GNFUw9c6gVGKE1KhMz7cK2bDRNeqdWZ3mmsePfhLHIc+gZUmrSrfkaKZz8kTkxVpNNEkogGat3fWSt6SkK2FJ4D28tIcgPJWTMwBg+mTYBqXovA6sULDnYkr6xOGr5lG2OI8ZKPY7jWX+Gf+0Q2vMGdxnLaDNvobsFPM4ATvIxML8yWcq0CYT3aQwdV5HidNOfkPV+vIgPKZfScuAENbe1yMFOS2qJKAjZiYtjd+LPqRNtzQFkqNFWKZAYZwTu+ZpHMI/pk11ocimX+jyvgbjxIF8wKtmYELuiNU1RYeYVsUxKucYB06xbTIrlFtmDBWbCOiyfHWLPgme3kO+KUiI74tMwR95BPNSxaR6SXsbKpjn0WIt1j6emf0lk7lwh4417kPVaWP+LX9ZIyomKtu75YfYhCClHZ46vg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR08MB6969.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(6512007)(66946007)(4326008)(6506007)(66556008)(2906002)(54906003)(8936002)(31686004)(316002)(110136005)(36756003)(66476007)(186003)(31696002)(86362001)(508600001)(107886003)(52116002)(8676002)(38350700002)(6486002)(26005)(4744005)(2616005)(38100700002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?S1JIN1RrV0pTYkxXNFNManpNR0JkbTh6TzVVVWhYbXFxWERlbE1iS2pCeUV6?=
 =?utf-8?B?UXYzN1NsdWR5ZTV1WVp3M28yNkNHZ2JQTHQ3NStKYkU1cENMNXJHVWFXb1M1?=
 =?utf-8?B?dlVDdElMOU56ajBjdzcwQmNYanpnNURSeWIvZWdWQitxWExqdDNzMjdkRkhn?=
 =?utf-8?B?aUJERkxQR3l5MERud05BVzZ3V09HRFF6Slh4Q1lkeHM5QWpvTWZzaVp6ZFZU?=
 =?utf-8?B?S0pEWGxneVpnRXE0MVJzR3NzSHJKNFVLUUN1b3c3MTdnWjVqcUg1dFcremp0?=
 =?utf-8?B?T1lROUxjV2Y1YWwrZU9NeG5yQmo1L3FJeWpPOHhRaFlqWGY4V3NBYWtveDkx?=
 =?utf-8?B?NVUyMnlzVUpHWlQveVhYVWJUcmordE9ZeW16Mk5ocTBZeFJNa2dPeUZQNEMv?=
 =?utf-8?B?dldLVGhhLzdlUnh3cGw3TGhockNkU1dBOXI0aURHbUYzWEZpRU0vQWtuK3Zh?=
 =?utf-8?B?VEp4Rjl2ODNyOWM5U1FodGlSMERTNDNERzBnck10c0FLWjZpMkVSOGV2S2FZ?=
 =?utf-8?B?Tzh2QlVOc3Y1N1U1VG9CQVNyeGN2dktoYk1TVHVNcXU0TkR5RHhRZERnVG9j?=
 =?utf-8?B?YlpDWFZFaFMzQXVGRXlQampPZWNPY1l1RnovYWxJK3cxVjN3VDF3aW5XQWtO?=
 =?utf-8?B?ZURENjhzaFpCaDc5QmdpanhzYlBFVkFNVDVOODdXVDAxZEpLNS83bi9PR0Z4?=
 =?utf-8?B?NzBlREJ6ZlR2SENSVGlJVW1oNkhLampYYU81YTRPa0I0Rm10UHlmTFNlR2Jy?=
 =?utf-8?B?MHU2MEUxcjkxa3I5bHF4NFlKckxVcitTUUgrNmhiQi9BVmQ2alRWQ0lnMVNa?=
 =?utf-8?B?T1NiL2NxSDRBMEN3ZXZaWjlGVDBhTEFSTThwOWhwOTNSdkRtZnVSM05OejF2?=
 =?utf-8?B?d0Jodm42bm12YzNJaXZWbWFDOUxTbzhBczNMcVovdU5jcVNXMURTNjhDZzFS?=
 =?utf-8?B?VWlQcEU0MStnWEEvMG9HalBCcmd3dzhFZTh0YXdZTW80TUsyRncrK0R1a3J6?=
 =?utf-8?B?U0gvaDZ3QlJzc29KZnBiRnNjYzJQN1k2ZmRLcnRSb0xNQVY5dUZMN3dheThj?=
 =?utf-8?B?K3hYRUFxZG4xUUhmZzhISXdKMTc0cHB2UUhkRUJuTDVUZ3ppYmt0Zm9CNFNV?=
 =?utf-8?B?WWxlZ0gvcENuZFB0TkxodVEwR28zQlViL0JXM3MrdTNRbWl5N2FlTEh2cy8w?=
 =?utf-8?B?RTNLVHNhcU9rU3pOd0E4Rm1yV0pXeFgwZEJKZllSeEVISXNmN0tMUzNOVjhs?=
 =?utf-8?B?aWx1MG93THVhcXZ3c0NoejlRcHV6VXBpSmV4aWxDR1EwaW94c01wVWV6dy9X?=
 =?utf-8?B?cktVQjNpbm51ZStzbUFBK1lWaUpBSldkUFVqU2FvL3FCYlRscFhCM2JLMzdi?=
 =?utf-8?B?cHZISGRSdHdxMlBja2o4ZXl1Nk9wSk5jeWtPRzk5MEhpNldHL0E4MXZtZStv?=
 =?utf-8?B?RjY4dlorQ2crQmsyMU5VL1RqYWVOb0Z1YUtodFk5WVMvZkRQaVRsTXpSZm5T?=
 =?utf-8?B?aUNtbjYwb3NjZ21kajZQeVdhS2VWRURtSHQ4L0V6UWJDendEQUF3WWZiNzV6?=
 =?utf-8?B?TjNjR3FydVZZVExqbEphb3hCaVpaY2IvWXNRb3Fab0J6Q1phUkt6R1VTcWtX?=
 =?utf-8?B?Y3hKR0ZiSGpUSnBiN1l0TE9lT3VnYlpjQkNjODBCV0ZnQUYwU1FoZGNQdmht?=
 =?utf-8?B?dmFtYjZibExMU2hSWncra2k2MEdhN1pYYm1oQVZicmtCUHdOeW5vcXVlcUpS?=
 =?utf-8?B?ZzZRbXNvZUdxcWxOVjk2d0lFdllhdklxRW9RUzJRRUVxK1N0cVFMNjJRQ0xP?=
 =?utf-8?B?K1c3NDdDVWZnSm1kUS85Zy9LYnpzdGFLaTZSa3RFTGxtM0wzdnBVUU5nakVI?=
 =?utf-8?B?VWVabUJ4cXFjSzBORThSTkhNVVVOd1NIam5zQW9yZVNWc3RyVHpvYnRJSXFF?=
 =?utf-8?B?aHltNHVodHlMeFZ2WlNZYysrd0VJVXgwaW1aUVlWekRhaThkZnlYOVcxUnpP?=
 =?utf-8?B?UEFyejZRRHNqSVIxSXVZZStyWWRSOW1YdmwxTUxpUCtJNFd4UTYzanJIRHdD?=
 =?utf-8?B?NmtmK2x4OTcyRTcreHAxV290emZiSlR2NkRQL1RqcEdqc0F4WGhDWkNoVTl0?=
 =?utf-8?B?NEYyRzJTR2ZQa3lOcHVqRHVReFBpUHFaTmNDU0Nsc2Q2YVVqaVQ5TmNKZXpC?=
 =?utf-8?B?R0w5RjNqUFRXOWowOFlDUTY2WkMxU1A5a3NCVnhxcm00anFPUVRIZCtFNXc4?=
 =?utf-8?B?L2J4ZHIzdFM2L2o4cEpyS3ZLcG8zZC83cXQ3WFhyWnd3eEtMWUZxNFBaUkRC?=
 =?utf-8?B?MUxRYkZiUEpjb3ZjeUpBRXltMXVTaUx4NUtOd1M4WFhoclhCWmRnWTVQUFpX?=
 =?utf-8?Q?alyTAju1I8RUs9Pc=3D?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c169a3f9-6e5e-4dbd-9eb0-08da0e69eafe
X-MS-Exchange-CrossTenant-AuthSource: PAXPR08MB6969.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2022 14:15:30.8412
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 1URkC5aZ62mzTf83GA/s8519oxgRDTuLwIJ6cetyu2D9B+z6cHPBzUHRTsLrO8Bb+FxJvdjD2rukBi5xRt3y9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Mar 2022 14:15:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163642

Am 25.03.2022 um 14:54 schrieb Alexander Kanavin:
> On Fri, 25 Mar 2022 at 14:47, Khem Raj <raj.khem@gmail.com> wrote:
>>> The standard way to do this is to inherit lib_package.
>>>
>>
>> that is appropriate when main package is a library but it also has some
>> utilities accompanying it. This case seems reverse, where its tryin to
>> create a fine grained packaging and separating the lib out instead.
> 
> No, it's the same here: most (or all) of the consumers link to the
> library, and utilities are mostly for interactive development.

We have examples for both solutions. xz has a liblzma package and brotli 
a brotli-bin package.

