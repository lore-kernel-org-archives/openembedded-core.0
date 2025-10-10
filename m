Return-Path: <stefan.herbrechtsmeier-oss@weidmueller.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F6BCAC5BB
	for <webhook@archiver.kernel.org>; Fri, 10 Oct 2025 06:28:04 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.136])
 by mx.groups.io with SMTP id smtpd.web10.2830.1760077676124338371
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Oct 2025 23:27:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@weidmueller.com header.s=selector2 header.b=0Wx9ioZ1;
 spf=pass (domain: weidmueller.com, ip: 52.101.70.136, mailfrom: stefan.herbrechtsmeier-oss@weidmueller.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=es4u6PMwy7b168OGjxvP8vkhlRfOCX1BlAKgFqVAoXcjnq5lihjaSuvH0VHcViPgxYOb6GYHKzC8C65Kn4iSktEuUXmqrpHQRRyVP2GdS4CM06RIGIAkOOPaykawDYYbnNW9iC0URySa2wVEzSz2gw8KB1aoXec2ClrPNyc4Tcbw9KG97PubOO1Xsitx3qDu+QeBfQgNPdW3p51e/LQTU9karYAPSSauoPoLFzOjYHm6Lcy2bJf2YRPyk91a1Jy6dik2Au+K9e/d7JZu3Yf2tpK3XamGgExe6+uhakp/scY0d3qDeBawipbGEyX15Zms/ua/zhBdPozPekId6LxvBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gghBISiLcN9WEFuDWCVXdI07L4fX0lgAZGdKPThgfn8=;
 b=DBYMadaOUvvY7QMXYvQT+5cAy+RSX3IvrXdEfEcWgkg9m+E2noIEbLYW+labPgnrzHFEAA+fiyuptDbUsc8qxcgwVWEcIsNOkC59EgIhE7jZGKgjE4PRABvx7T/HUcTiiveXQeS0FxnD8+Qw62LQmxINq37/aVyugKjtpeNB4QWY92dLARoeu+Ug5Q+fS7X40TfVbdS7HivfeNOUT1Hj7m5ZtP/stC1jRkHAgxBuUAk3ez/CHuRyFJHhdXqiHOEWsEjIBR5ft0Xs7lgrTo6vyDtdGY2wKmLDDCcyOL4iqzZE+DcRVuI/GgyEkjLJZ+D7GSKwyYRVB2+QiFGjBQvTqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=weidmueller.com; dmarc=pass action=none
 header.from=weidmueller.com; dkim=pass header.d=weidmueller.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=weidmueller.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gghBISiLcN9WEFuDWCVXdI07L4fX0lgAZGdKPThgfn8=;
 b=0Wx9ioZ1vIy1Cu6huXE6uX2kOBHni/Yg31Bcz1AstVoKHIEvxnOKQD7x0bhXyFz2XNpcuzPHFm/4BiJKe/XhXtXdngmQmldwgsdS7ID9jZGU4m4qoV+xcobkad7depk4T4f+npme92tUb23awBKkNhPmN9NplTXWnUwxo8UNLO1NXaow+j7ssnEGJoUxayipXhKIQog0dmRbysagLT5UoonPdrbmM9FiR4Eu9fdD9My/w0RdutKtxdwkUa4P3fF8aPQdygfFvgOgEmFJwnT0dzIPQRTm/0XIxnhXz3tBqaxNnSGSuvE29h4H6EOwDUc2Fzz8QIPhxZWPwhCqYyFeKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=weidmueller.com;
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com (2603:10a6:150:8a::17)
 by DB9PR08MB6332.eurprd08.prod.outlook.com (2603:10a6:10:258::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Fri, 10 Oct
 2025 06:27:52 +0000
Received: from GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013]) by GV1PR08MB8426.eurprd08.prod.outlook.com
 ([fe80::f9f5:b4bd:9e01:9013%5]) with mapi id 15.20.9203.009; Fri, 10 Oct 2025
 06:27:52 +0000
Content-Type: multipart/alternative;
 boundary="------------BJtjpyyRBWQEJnicEnr6exzd"
Message-ID: <6f3eedff-44c0-48ca-86dc-c1ea8aecc9e0@weidmueller.com>
Date: Fri, 10 Oct 2025 08:27:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH] cargo_common.bbclass: use source
 replacement instead of dependency patching
To: Gyorgy Sarvari <skandigraun@gmail.com>,
 openembedded-core@lists.openembedded.org
Cc: Tom Geelen <t.f.g.geelen@gmail.com>
References: <20251003213000.2256939-1-skandigraun@gmail.com>
 <211549e4-c4c2-464d-9b63-88c27d5bdf18@weidmueller.com>
 <049f87a6-2e45-43b2-b04a-7b96e6cdb096@gmail.com>
 <54596a81-b725-4d78-9c35-ff851e4b1113@weidmueller.com>
 <239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com>
Content-Language: en-US
From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier-oss@weidmueller.com>
In-Reply-To: <239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com>
X-ClientProxiedBy: FR0P281CA0124.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:97::13) To GV1PR08MB8426.eurprd08.prod.outlook.com
 (2603:10a6:150:8a::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR08MB8426:EE_|DB9PR08MB6332:EE_
X-MS-Office365-Filtering-Correlation-Id: 7470a72e-6e07-4707-c53c-08de07c623ce
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|4022899009|1800799024|376014|13003099007|8096899003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?TWZKb3R4dDZsdWxZbEZVekFlZGFZWDhtS1ptMGR1UlBRaE1pcExWT1B2aEVJ?=
 =?utf-8?B?UDBmcFFpZndTNnU5NmZnVDF5M2RScm4xSVBqb0V5WTBIQjlQV3ltZnlIbVpT?=
 =?utf-8?B?YTBZUllBWE9UZU4ramNWQjhOc2VCM0xLc1FQNmY3RlNaZHJMbmd5TEFGWVdL?=
 =?utf-8?B?K3pNb3Nta0ZiV2VQeGo4dHEzTEJ5VU82cWsvSmNDMzl6RVdDeENOd2hqSlVD?=
 =?utf-8?B?UTRCWnRzYjVZc0ZDTkRZZzZLMFZDdzhLSE1MaFgvMkEzdGluL1VxOVo2eDM4?=
 =?utf-8?B?UjdBYkY3R29hTnkwSkhFZ0pwNEdtcnVtcGFKb1VJd1RHSFhYMjUrY09UVFJx?=
 =?utf-8?B?K0llMDVjcDZIZzZVbkRpVTBZUDJ6SmdiOTVXbXl1NUUvc1JKMkpGdE5oVCtl?=
 =?utf-8?B?WXAzTzhUdkV1VE5hRzNzblNYMFhScnc1V3FZTTA3RnROSnpwREhudmZjVkFI?=
 =?utf-8?B?OXhKTjUvaGdEbTJQaU9Kamd1OVVFZFZxcGxTWTFINFl2eUkwRGZ6emdTQm9m?=
 =?utf-8?B?TEpGL0ozUmw5ZU9mMXRnbDVkbDBRZG0xSFhqSFFJelhCUHB3b3BEZ3BJbzlT?=
 =?utf-8?B?QVl1TVZJRnFaekU5NFpvRktEQngwMWFzS1VCNU1MUjR3WjFLNkQ3ZXl4SW1B?=
 =?utf-8?B?NUdCOEZSTGZrZ2FvKzBXYWNKRjArS3Z5Zk9jb3d5TFpjb2FscnF4OEpydk1w?=
 =?utf-8?B?ZUNtOGp4cUZxakJ3VW9uUVZUdXRrM3NjZ1E5U0R0QmtUNS9EKzFzcUdlbUNQ?=
 =?utf-8?B?ZFM2TDl2bzQ3dmFkdVBMZnBrS3pyS2VkMFQ2cFpobEhNY1ExYXpiWVR0UEEz?=
 =?utf-8?B?QXhQcXM1bjZ5QnlIeDh5YWpaSDBQV2x5bzR0a1oxN3BXR3lHaWRXUkNiMG1w?=
 =?utf-8?B?a2NxVnhFNTExSFZtZVZWZFdYQUJZTnppaFZaT1ZYTFc4VUVNenlJbGRseFpv?=
 =?utf-8?B?R2o0WXdxQ3hqMm1kdzZvNlZaSkVlczZ6SFVhZFBBekhuaWovMkg1L2VLS0dp?=
 =?utf-8?B?NTJZS3doSDZvK25ia1IxNmZPK29zU21jYmZ5RE5ZRm1Cb2phNWxxOGp2RU1s?=
 =?utf-8?B?UTA1d3ZBcVRzb0JQWW9VekJKMmxyalRSam5JVWtNTnROU3hUb01IQU9lUFZk?=
 =?utf-8?B?OHRKM3ViQTZaNkVQcW5ITUlEOFcrSDNMVW1RbDRJNFdiakV4TDZ1ZG0xUnNw?=
 =?utf-8?B?R3BkMXdhWlJvUm0wZk51MmxlclpoREE0cnNTUWpFeDlPck9TeTVBWVQxTXVp?=
 =?utf-8?B?YktOZTN2dURqa2VxRzBXbUtrSXVodkswYjdoKzRzN0FSdDJKWVZnbE1Ma1dY?=
 =?utf-8?B?Q09FWGVGak9BcUxNUVIwZW9mdmdLbGx2RFRtSUZ4YWxaSXFoM0J2V1k4b0dS?=
 =?utf-8?B?UGw5cnlSQ3ZGV2xMQnI1d2lDZXgvRThZRlRDRGlvM2RoK1pIUXFmVm5HVTNW?=
 =?utf-8?B?ZDNxRFl0dWZ4VmtxMG9EVmcvSnJJT29ZRWQ0alZRT3lMWDJ0TWo5UTlEZFhz?=
 =?utf-8?B?TGdzSGw1TmVqT1pWMy9rakk3clJTVm5zV21xckNSSXN2OXB0LzJBeWxWdXJ6?=
 =?utf-8?B?TlhyV1lTb1F5cmt0UGhuVGtSUTNjZXZIQnBBRFQxM2E3S0NIWnZuNmFsd3VZ?=
 =?utf-8?B?NW5xclNvU0ZPMlBSNTBFdXIzVlA3ZUZ0V2tqUSszRHppV1kvc05nK08wemxW?=
 =?utf-8?B?UW1DendIY2ZUWXFIVVhqSjFndUlEZThaOG9mWWtsNHRVdnY4K3drVk80YnlM?=
 =?utf-8?B?R1YrdFN5T1h2VHhmdnVzZzgvMFVoUXBNeTlaUXBscVE4cjZLQ0VGQ2dQK1pC?=
 =?utf-8?B?ZGw5S2lMbDFmMEIvS291MENuOCtJV1Y5U1dNcDU0ak5aZ1VaODF6Rmc4OEdx?=
 =?utf-8?B?TUVQQWMyOGxYSHhmR2dBSHdrMUhjeGNFblRjVXRhVjRBTFE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB8426.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(4022899009)(1800799024)(376014)(13003099007)(8096899003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WEZFUVhZUk9aR21oTGlMN1ErenU1amxaLzdleUUxYmtSUi84bUZONHRlcmJJ?=
 =?utf-8?B?ZEN1SUZZZ2VVREZMaVNKdFlUaHg4cTN5WjhiamFHa3hjVUwvSzFZNXp0aGds?=
 =?utf-8?B?TUczR0dQTlFvbGZmTGxReExtNy8zQXo4THpCTlI4dityVjhOL2haa3FWYWxl?=
 =?utf-8?B?M1Q4U1lRdjFacTUyTVNkZHhXa092c3VGcHdyTjNrZzJoV3NCekMzNStqQVky?=
 =?utf-8?B?OENXNlJpSEtIbnZVaGxENzNZSlkxQmRlNE1SdGdvSk5zNGw5cDdERUQvREY5?=
 =?utf-8?B?bUJCSmE0ZGkzSGNrWEVNRXZkWCszMHBHUUo1RFFVZzdKeWRqcU9weW02QXpT?=
 =?utf-8?B?MEc4Z1ZJSTh6U1RlYm1ZUWZnN3E1S2VhcWQ0SDhtWnBIVlkyalFOUWxjSjky?=
 =?utf-8?B?RUw0QTdrZEJZaVN6NTFNQWs4QTNWSEFlc1N1T3N4SXNTaWxzcTkvWUVBNy8z?=
 =?utf-8?B?WnVoM1dFMk5yMVp0WkhBVDJvanVvcWpCcDdwWm9YT2doS1RidGE3dXJKaisy?=
 =?utf-8?B?UmZZWUFCSzRmQzRnVElFdXc0bHR5cGhQUU5teHk4T2NxWHF2L1dUTXdHTUhT?=
 =?utf-8?B?aG0xdE1CZGJ3aG0rQ25OUHY2L2ZTandhdE5MRXpuVUoyNldpRHp3dnBNb2t0?=
 =?utf-8?B?dkJBU3I3Wk9sZXJ0dUIrZGEzRDJrRHZRV0h1TTNCVVhxaGZVQXlQOUdoY01H?=
 =?utf-8?B?Q2JqZk0wOWc1MmorZmxMcDBxZ0Z1Y0xHS29kQW1uUGhrbzFOWUNnNk5kd1N6?=
 =?utf-8?B?U1RCTm1aM3k4eDVuOFVVZVVUeUV4MGx6V2hOTllSOVJEUEVVTE84eWVsclZ5?=
 =?utf-8?B?V0prZmVGaDY4OHRTN0Z4N25mMnhzMVd2UHpuRUp6OUZhdEh5SVpOZHZhbkxY?=
 =?utf-8?B?c29oUStSb0RhenRWdS9NYU5kSkdhNWdrN1U1akh2NnlFZVZuaWdmUW81ZHhB?=
 =?utf-8?B?MFZCT2ZJOW4yS2xHQXYyQ3Z4LzZxVXhOWEdyUzBXSDdyV0ZSbURTVUgyVm9C?=
 =?utf-8?B?RngwdnFzZUdMZktBdzkvL3J3a3ZWK2p3MDJKeVpsRFoyTktnVTRWd29xYzc2?=
 =?utf-8?B?MjJESW1CRjIwMEtLdHhRT2NERW9UQmdRa3ljNEt1RVZHYVJLdG15YzZ5cDV6?=
 =?utf-8?B?bkZDVEFlREFpZHVVUlV5c1djeW1udFpTZ3RkOWdFcEI4RWQrV0FyYm44d3RR?=
 =?utf-8?B?YTExM1NiUk1GWHBvZHhPK3E4SW13bnJRempWWENYZjVsNWliK3NWelNzTmFT?=
 =?utf-8?B?b0Z3QmluRnpXZldLSXRINVlCeUtDajVxYUg2dXR6TVg1SDhQSlQyMENtalF2?=
 =?utf-8?B?RDRvdFJ6WGErR1FPWmJDZnZyUjArUHQ1MU5JcXZEOXRicTBPNzNGZEw5MURG?=
 =?utf-8?B?UU5KemI1R3B6RnRtejlhTTdYV0VtV091L1pMK0hpVzEwQnAzbWJRdytyTFBs?=
 =?utf-8?B?OWpsMm4zdDZkMm1ObGpZZDI4UzFGa1dhVDh4bko1bmJzZzRtUWtMMEZDZXBI?=
 =?utf-8?B?WU9HVW5EV0ppMEhEQitIcVJXcGtzeGdGbmxTRzlWUDdYcVR3Sk1YNDR6U1Uw?=
 =?utf-8?B?ckhCNnUwd0hadUwzc0FTRk1SeVIvTjNGL1RRZTNKMzkzakY2Qyt2dHVWWllu?=
 =?utf-8?B?eFVML2NtcnQybWFqUEVUTXJlUzNra0dUQlIrZUZpaHBCdk1Ya1FWYys2alNB?=
 =?utf-8?B?N3NXdG5pOGtpR3dsWlordXhjUmc2YnRDZmUxUUloT2VZWSs4a0xOMGx6aFZ1?=
 =?utf-8?B?K0w4ajZadUFUczZVcWVmVzhDYlFOUnd4eFNBNzF1Q00yZWNaRHBvNWIwajNv?=
 =?utf-8?B?Q2FZbmdTMEx5N1ZvVnl5eDRFQzArM1dLZ204eFJWWnNlVzRsSGNhNnVtZVRC?=
 =?utf-8?B?WkpuMDhzMlRLZXI4NXZaQXdtY1JhYi9EWHJUeXQ5NFYvZVlKQTJ1bndKSG5M?=
 =?utf-8?B?L01DWGJMSjdGcEdRVDVUYmVVaTlSTU5TY1ZHdlNWY29nRks2a3VVYUV5OFR2?=
 =?utf-8?B?bDNtTm04Y1AwN0kwT1NnNGIrZGlkU1k1NUtZdWw1OFFXYVFzMWhyajV6cVFj?=
 =?utf-8?B?S3BpVmtkN2MwVGJuNFBRY1IvY2Fpc2lTQWtxNjdrbmErRjBVSEFZWUpkODNt?=
 =?utf-8?B?cGtoakN5TUZxR290VWQ4alEyeEgzMzZmKzJ2aExjVnE1UlVPYmdiVHlHc1Vv?=
 =?utf-8?B?K0E9PQ==?=
X-OriginatorOrg: weidmueller.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7470a72e-6e07-4707-c53c-08de07c623ce
X-MS-Exchange-CrossTenant-AuthSource: GV1PR08MB8426.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2025 06:27:52.1633
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e4289438-1c5f-4c95-a51a-ee553b8b18ec
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ickKZXoeCXafJGN3XTBHuj2PjkCigOv5l/MfI9V0c6jLj9VIY8UhOMxlmJSm2OBcyytXfrVLnSihhYxA/9n9YA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6332
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Oct 2025 06:28:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224664

--------------BJtjpyyRBWQEJnicEnr6exzd
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 09.10.2025 um 16:30 schrieb Gyorgy Sarvari:
> On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
>> Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
>>> On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
>>>> Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
>>>>> Cargo.toml files usually contain a list of dependencies in one of two forms:
>>>>> either a crate name that can be fetched from some registry (like crates.io), or
>>>>> as a source crate, which is most often fetched from a git repository.
>>>>>
>>>>> Normally cargo handles fetching the crates from both the registry and from git,
>>>>> however with Yocto this task is taken over by Bitbake.
>>>>>
>>>>> After fetching these crates, they are made available to cargo by adding the location
>>>>> to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
>>>>> that can be found in the SRC_URI is added as one source crate.
>>>>>
>>>>> This works most of the time, as long as the repository really contains one crate only.
>>>>>
>>>>> However in case the repository is a cargo workspace, it contains multiple crates in
>>>>> different subfolders, and in order to allow cargo to process them, they need to be
>>>>> listed separately. This is not happening with the current implementation of cargo_common.
>>>>>
>>>>> This change introduces the following:
>>>>> - instead of patching the dependencies, use source replacement (the primary motivation for
>>>>>     this was that maturin seems to ignore source crate patches from config.toml)
>>>>> - the above also allows to keep the original Cargo.lock untouched (the original implementation
>>>>>     deleted git repository lines from it)
>>>>> - it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
>>>>>     the separate crate folders are copied into this folder, and it is used as the central
>>>>>     vendoring folder. This is needed for source replacements: the folder that is used for
>>>>>     vendoring needs to contain the crates separately, one crate in one folder. Each folder
>>>>>     has the name of the crate that it contains. Workspaces are not included here (unless the
>>>>>     given manifest is a workspace AND a package at once)
>>>>> - previuosly the SRC_URI had to contain a "name" and a "destsuffix" parameter to be considered
>>>>>     to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
>>>>>     Having destsuffix is still mandatory though.
>>>>>
>>>>> The change does not handle nested workspaces, only the top level Cargo.toml is processed.
>>>> I use a similar approach for my Cargo.lock fetcher. In my case the code
>>>> finds the crate on the fly inside the a git repository because the
>>>> Cargo.lock doesn't contain the subpath.
>>> By any chance, did you manage to solve the workspace problem? If you
>>> have a working solution, feel free to submit it, I wouldn't mind if I
>>> wouldn't have to debug mine :D
>> I haven't test a workspace project. Do you have an example project?
>>
> I have attached a sample recipe (that is very much based on Tom Geelen's
> initial work). It depends on at least 2 workspaces.

Thanks for the sample. After switching to my cargolock fecher and 
cargo_vendor class the project build without problems. Your git URLs 
need a parameter to inform the config generate that the source contains 
a rev query parameter. Additionally you need to add the revision to the 
name and destsuffix/subdir because it is possible to use crates with 
different revisions from the same repository.

>>>>> Signed-off-by: Gyorgy Sarvari<skandigraun@gmail.com>
>>>>> Cc: Tom Geelen<t.f.g.geelen@gmail.com>
>>>>>
>>>>> ---
>>>>>    meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
>>>>>    1 file changed, 108 insertions(+), 50 deletions(-)
>>>>>
>>>>> diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
>>>>> index c9eb2d09a5..79c1351298 100644
>>>>> --- a/meta/classes-recipe/cargo_common.bbclass
>>>>> +++ b/meta/classes-recipe/cargo_common.bbclass
>>>>> @@ -129,6 +129,44 @@ cargo_common_do_configure () {
>>>>>    python cargo_common_do_patch_paths() {
>>>>>        import shutil
>>>>>    
>>>>> +    def is_rust_crate_folder(path):
>>>>> +        cargo_toml_path = os.path.join(path, 'Cargo.toml')
>>>>> +        return os.path.exists(cargo_toml_path)
>>>>> +
>>>>> +    def load_toml_file(toml_path):
>>>>> +        import tomllib
>>>>> +        with open(toml_path, 'rb') as f:
>>>>> +            toml = tomllib.load(f)
>>>>> +        return toml
>>>>> +
>>>>> +    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
>>>>> +        for lf_repo in lockfile_repos.keys():
>>>>> +            if repo in lf_repo and lf_repo.endswith(revision):
>>>> Does this works if the URL contains a "rev" query parameter? This
>>>> happens if the same git repository is used with different revisions.
>>> I *think* yes, since I query the revision from the fetcher, instead of
>>> parsing it myself (and I use both the repo and revision for matching the
>>> cargo.lock repos). But will test it specifically, and make it work if it
>>> wouldn't work out of the box. Thanks for calling my attention on this.
>> The problem is that the source replacement key contains a query
>> parameter. The query isn't supported by the git fetcher. That means
>> you have to remove the query from the SRC_URI but add it back in the
>> source entry in the config.toml.
> You mean for dynamic fetching, from Cargo.lock? This patch still relies
> on the user adding these dependencies to the SRC_URI.
> Otherwise I might be misunderstanding your question...

Please check the source inside the Cargo.lock:
https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302

It contains a rev query parameter. This query parameter must be part of 
the source key inside the config.toml:

[source."git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878"]


>>>>> +                lockfile_repos[lf_repo] = True
>>>>> +                return lf_repo.split("#")[0]
>>>>> +        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
>>>>> +
>>>>> +    def create_cargo_checksum(folder_path):
>>>>> +        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
>>>>> +        if os.path.exists(checksum_path):
>>>>> +            return
>>>>> +
>>>>> +        import hashlib, json
>>>>> +
>>>>> +        checksum = {'files': {}}
>>>>> +        for root, _, files in os.walk(folder_path):
>>>>> +            for f in files:
>>>>> +                full_path = os.path.join(root, f)
>>>>> +                relative_path = os.path.relpath(full_path, folder_path)
>>>>> +                if relative_path.startswith(".git/"):
>>>>> +                    continue
>>>>> +                with open(full_path, 'rb') as f2:
>>>>> +                    file_sha = hashlib.sha256(f2.read()).hexdigest()
>>>>> +                checksum["files"][relative_path] = file_sha
>>>> Do we really need the calculation of the checksum?
>>> For source replacement AFAIK it is mandatory, otherwise cargo complains.
>>> (But I'd be happy to stand corrected)
>> Have you test an empty dictionary for "files" and NULL for "package"?
>>
> Are these valid states? Currently the checksum calculation happens for
> crate folders that have been actually copied to the vendor folder. And
> that happens only, in case there is at least a Cargo.toml manifest in
> that folder, so the files dict shouldn't be empty. Otherwise the
> checksum sub iterates through all the files it can find, it doesn't try
> to validate it against any manifests.

Do we need the validation by cargo? The crate fetcher skip the 
validation with an empty dict and the same works for git sources.

>>>>> +
>>>>> +        with open(checksum_path, 'w') as f:
>>>>> +            json.dump(checksum, f)
>>>>> +
>>>>>        cargo_config = os.path.join(d.getVar("CARGO_HOME"), "config.toml")
>>>>>        if not os.path.exists(cargo_config):
>>>>>            return
>>>>> @@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
>>>>>        if len(src_uri) == 0:
>>>>>            return
>>>>>    
>>>>> -    patches = dict()
>>>>> +    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>> +    if not os.path.exists(lockfile):
>>>>> +        bb.fatal(f"{lockfile} file doesn't exist")
>>>>> +
>>>>> +    lockfile = load_toml_file(lockfile)
>>>>> +
>>>>> +    # key is the repo url, value is a boolean, which is used later
>>>>> +    # to indicate if there is a matching repository in SRC_URI also
>>>>> +    lockfile_git_repos = {}
>>>>> +    for p in lockfile['package']:
>>>>> +        if 'source' in p and p['source'].startswith('git+'):
>>>>> +            lockfile_git_repos[p['source']] = False
>>>>> +
>>>>> +    sources = dict()
>>>>>        workdir = d.getVar('UNPACKDIR')
>>>>>        fetcher = bb.fetch2.Fetch(src_uri, d)
>>>>> +
>>>>> +    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
>>>>> +
>>>>> +    os.makedirs(vendor_folder)
>>>>> +
>>>>>        for url in fetcher.urls:
>>>>>            ud = fetcher.ud[url]
>>>>> -        if ud.type == 'git' or ud.type == 'gitsm':
>>>>> -            name = ud.parm.get('name')
>>>>> -            destsuffix = ud.parm.get('destsuffix')
>>>>> -            if name is not None and destsuffix is not None:
>>>>> -                if ud.user:
>>>>> -                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>> -                else:
>>>>> -                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>> -                path = '%s = { path = "%s" }' % (name, os.path.join(workdir, destsuffix))
>>>>> -                patches.setdefault(repo, []).append(path)
>>>>> +        if ud.type != 'git' and ud.type != 'gitsm':
>>>>> +            continue
>>>>>    
>>>>> -    with open(cargo_config, "a+") as config:
>>>>> -        for k, v in patches.items():
>>>>> -            print('\n[patch."%s"]' % k, file=config)
>>>>> -            for name in v:
>>>>> -                print(name, file=config)
>>>>> +        destsuffix = ud.parm.get('destsuffix')
>>>>> +        crate_folder = os.path.join(workdir, destsuffix)
>>>>>    
>>>>> -    if not patches:
>>>>> -        return
>>>>> +        if destsuffix is None or not is_rust_crate_folder(crate_folder):
>>>>> +            continue
>>>>>    
>>>>> -    # Cargo.lock file is needed for to be sure that artifacts
>>>>> -    # downloaded by the fetch steps are those expected by the
>>>>> -    # project and that the possible patches are correctly applied.
>>>>> -    # Moreover since we do not want any modification
>>>>> -    # of this file (for reproducibility purpose), we prevent it by
>>>>> -    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
>>>>> -    # here is better than letting cargo tell (in case the file is missing)
>>>>> -    # "Cargo.lock should be modified but --frozen was given"
>>>>> +        if ud.user:
>>>>> +            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
>>>>> +        else:
>>>>> +            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
>>>>>    
>>>>> -    lockfile = d.getVar("CARGO_LOCK_PATH")
>>>>> -    if not os.path.exists(lockfile):
>>>>> -        bb.fatal(f"{lockfile} file doesn't exist")
>>>>> +        sources[destsuffix] = (repo, ud.revision, crate_folder)
>>>>> +
>>>>> +        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
>>>>> +        cargo_toml = load_toml_file(cargo_toml_path)
>>>>> +
>>>>> +        if 'workspace' in cargo_toml:
>>>>> +            members = cargo_toml['workspace']['members']
>>>>> +            for member in members:
>>>>> +                member_crate_folder = os.path.join(workdir, destsuffix, member)
>>>>> +                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
>>>>> +                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
>>>>> +                member_crate_name = member_cargo_toml['package']['name']
>>>>> +                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
>>>>> +
>>>>> +        if 'package' in cargo_toml:
>>>>> +            crate_folder = os.path.join(workdir, destsuffix)
>>>>> +            crate_name = cargo_toml['package']['name']
>>>>> +            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
>>>>> +
>>>>> +    for d in os.scandir(vendor_folder):
>>>>> +        if d.is_dir():
>>>>> +            create_cargo_checksum(d.path)
>>>>> +
>>>>> +
>>>>> +    with open(cargo_config, "a+") as config:
>>>>> +        print('\n[source."yocto-vendored-sources"]', file=config)
>>>>> +        print('directory = "%s"' % vendor_folder, file=config)
>>>>> +
>>>>> +        for destsuffix, (repo, revision, repo_path) in sources.items():
>>>>> +            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
>>>>> +            print('\n[source."%s"]' % lockfile_repo, file=config)
>>>>> +            print('git = "%s"' % repo, file=config)
>>>>> +            print('rev = "%s"' % revision, file=config)
>>>>> +            print('replace-with = "yocto-vendored-sources"', file=config)
>>>>> +
>>>>> +    # check if there are any git repos in the lock file that were not visited
>>>>> +    # in the previous loop, when the source replacement was created, and warn about it
>>>>> +    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
>>>>> +        if not found_in_src_uri:
>>>>> +            bb.warn(f"{lf_repo} is present in lockfile, but not found in SRC_URI")
>>>>>    
>>>>> -    # There are patched files and so Cargo.lock should be modified but we use
>>>>> -    # --frozen so let's handle that modifications here.
>>>>> -    #
>>>>> -    # Note that a "better" (more elegant ?) would have been to use cargo update for
>>>>> -    # patched packages:
>>>>> -    #  cargo update --offline -p package_1 -p package_2
>>>>> -    # But this is not possible since it requires that cargo local git db
>>>>> -    # to be populated and this is not the case as we fetch git repo ourself.
>>>>> -
>>>>> -    lockfile_orig = lockfile + ".orig"
>>>>> -    if not os.path.exists(lockfile_orig):
>>>>> -        shutil.copy(lockfile, lockfile_orig)
>>>>> -
>>>>> -    newlines = []
>>>>> -    with open(lockfile_orig, "r") as f:
>>>>> -        for line in f.readlines():
>>>>> -            if not line.startswith("source = \"git"):
>>>>> -                newlines.append(line)
>>>>> -
>>>>> -    with open(lockfile, "w") as f:
>>>>> -        f.writelines(newlines)
>>>>>    }
>>>>> +
>>>>>    do_configure[postfuncs] += "cargo_common_do_patch_paths"
>>>>>    
>>>>>    do_compile:prepend () {
>>>>>
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>> Links: You receive all messages sent to this group.
>>>>> View/Reply Online (#224426):https://lists.openembedded.org/g/openembedded-core/message/224426
>>>>> Mute This Topic:https://lists.openembedded.org/mt/115578466/6374899
>>>>> Group Owner:openembedded-core+owner@lists.openembedded.org
>>>>> Unsubscribe:https://lists.openembedded.org/g/openembedded-core/unsub [stefan.herbrechtsmeier-oss@weidmueller.com]
>>>>> -=-=-=-=-=-=-=-=-=-=-=-
>>>>>
--------------BJtjpyyRBWQEJnicEnr6exzd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">Am 09.10.2025 um 16:30 schrieb Gyorgy
      Sarvari:<br>
    </div>
    <blockquote type="cite" cite="mid:239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com">
      <pre wrap="" class="moz-quote-pre">On 10/9/25 11:31, Stefan Herbrechtsmeier wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Am 08.10.2025 um 13:01 schrieb Gyorgy Sarvari:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 10/7/25 16:59, Stefan Herbrechtsmeier wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">Am 03.10.2025 um 23:30 schrieb Gyorgy Sarvari via lists.openembedded.org:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Cargo.toml files usually contain a list of dependencies in one of two forms:
either a crate name that can be fetched from some registry (like crates.io), or
as a source crate, which is most often fetched from a git repository.

Normally cargo handles fetching the crates from both the registry and from git,
however with Yocto this task is taken over by Bitbake.

After fetching these crates, they are made available to cargo by adding the location
to $CARGO_HOME/config.toml. The source crates are of interest here: each git repository
that can be found in the SRC_URI is added as one source crate.

This works most of the time, as long as the repository really contains one crate only.

However in case the repository is a cargo workspace, it contains multiple crates in
different subfolders, and in order to allow cargo to process them, they need to be
listed separately. This is not happening with the current implementation of cargo_common.

This change introduces the following:
- instead of patching the dependencies, use source replacement (the primary motivation for
   this was that maturin seems to ignore source crate patches from config.toml)
- the above also allows to keep the original Cargo.lock untouched (the original implementation
   deleted git repository lines from it)
- it adds a new folder, currently ${UNPACKDIR}/yocto-vendored-source-crates. During processing
   the separate crate folders are copied into this folder, and it is used as the central
   vendoring folder. This is needed for source replacements: the folder that is used for
   vendoring needs to contain the crates separately, one crate in one folder. Each folder
   has the name of the crate that it contains. Workspaces are not included here (unless the
   given manifest is a workspace AND a package at once)
- previuosly the SRC_URI had to contain a &quot;name&quot; and a &quot;destsuffix&quot; parameter to be considered
   to be a rust crate. The name is not derived from the Cargo.toml file, not from the SRC_URI.
   Having destsuffix is still mandatory though.

The change does not handle nested workspaces, only the top level Cargo.toml is processed.
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">I use a similar approach for my Cargo.lock fetcher. In my case the code 
finds the crate on the fly inside the a git repository because the 
Cargo.lock doesn't contain the subpath.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">By any chance, did you manage to solve the workspace problem? If you
have a working solution, feel free to submit it, I wouldn't mind if I
wouldn't have to debug mine :D
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">I haven't test a workspace project. Do you have an example project?

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
I have attached a sample recipe (that is very much based on Tom Geelen's
initial work). It depends on at least 2 workspaces.</pre>
    </blockquote>
    <p>Thanks for the sample. After switching to my cargolock fecher and
      cargo_vendor class the project build without problems. Your git
      URLs need a parameter to inform the config generate that the
      source contains a rev query parameter. Additionally you need to
      add the revision to the name and destsuffix/subdir because it is
      possible to use crates with different revisions from the same
      repository.<br>
      <br>
    </p>
    <blockquote type="cite" cite="mid:239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">Signed-off-by: Gyorgy Sarvari <a class="moz-txt-link-rfc2396E" href="mailto:skandigraun@gmail.com">&lt;skandigraun@gmail.com&gt;</a>
Cc: Tom Geelen <a class="moz-txt-link-rfc2396E" href="mailto:t.f.g.geelen@gmail.com">&lt;t.f.g.geelen@gmail.com&gt;</a>

---
  meta/classes-recipe/cargo_common.bbclass | 158 ++++++++++++++++-------
  1 file changed, 108 insertions(+), 50 deletions(-)

diff --git a/meta/classes-recipe/cargo_common.bbclass b/meta/classes-recipe/cargo_common.bbclass
index c9eb2d09a5..79c1351298 100644
--- a/meta/classes-recipe/cargo_common.bbclass
+++ b/meta/classes-recipe/cargo_common.bbclass
@@ -129,6 +129,44 @@ cargo_common_do_configure () {
  python cargo_common_do_patch_paths() {
      import shutil
  
+    def is_rust_crate_folder(path):
+        cargo_toml_path = os.path.join(path, 'Cargo.toml')
+        return os.path.exists(cargo_toml_path)
+
+    def load_toml_file(toml_path):
+        import tomllib
+        with open(toml_path, 'rb') as f:
+            toml = tomllib.load(f)
+        return toml
+
+    def get_matching_repo_from_lockfile(lockfile_repos, repo, revision):
+        for lf_repo in lockfile_repos.keys():
+            if repo in lf_repo and lf_repo.endswith(revision):
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Does this works if the URL contains a &quot;rev&quot; query parameter? This 
happens if the same git repository is used with different revisions.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">I *think* yes, since I query the revision from the fetcher, instead of
parsing it myself (and I use both the repo and revision for matching the
cargo.lock repos). But will test it specifically, and make it work if it
wouldn't work out of the box. Thanks for calling my attention on this.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">The problem is that the source replacement key contains a query
parameter. The query isn't supported by the git fetcher. That means
you have to remove the query from the SRC_URI but add it back in the
source entry in the config.toml.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
You mean for dynamic fetching, from Cargo.lock? This patch still relies
on the user adding these dependencies to the SRC_URI.
Otherwise I might be misunderstanding your question...
</pre>
    </blockquote>
    <p>Please check the source inside the Cargo.lock:<br>
      <a class="moz-txt-link-freetext" href="https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302">https://github.com/astral-sh/uv/blob/0.8.19/Cargo.lock#L302</a><br>
      <br>
      It contains a rev query parameter. This query parameter must be
      part of the source key inside the config.toml:<br>
      <br>
[source.&quot;git+https://github.com/astral-sh/rs-async-zip?rev=285e48742b74ab109887d62e1ae79e7c15fd4878&quot;]</p>
    <p><br>
    </p>
    <blockquote type="cite" cite="mid:239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com">
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
</pre>
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+                lockfile_repos[lf_repo] = True
+                return lf_repo.split(&quot;#&quot;)[0]
+        bb.fatal('Cannot find %s (%s) repository from SRC_URI in Cargo.lock file' % (repo, revision))
+
+    def create_cargo_checksum(folder_path):
+        checksum_path = os.path.join(folder_path, '.cargo-checksum.json')
+        if os.path.exists(checksum_path):
+            return
+
+        import hashlib, json
+
+        checksum = {'files': {}}
+        for root, _, files in os.walk(folder_path):
+            for f in files:
+                full_path = os.path.join(root, f)
+                relative_path = os.path.relpath(full_path, folder_path)
+                if relative_path.startswith(&quot;.git/&quot;):
+                    continue
+                with open(full_path, 'rb') as f2:
+                    file_sha = hashlib.sha256(f2.read()).hexdigest()
+                checksum[&quot;files&quot;][relative_path] = file_sha
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">Do we really need the calculation of the checksum?
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">For source replacement AFAIK it is mandatory, otherwise cargo complains.
(But I'd be happy to stand corrected)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">Have you test an empty dictionary for &quot;files&quot; and NULL for &quot;package&quot;?

</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Are these valid states? Currently the checksum calculation happens for
crate folders that have been actually copied to the vendor folder. And
that happens only, in case there is at least a Cargo.toml manifest in
that folder, so the files dict shouldn't be empty. Otherwise the
checksum sub iterates through all the files it can find, it doesn't try
to validate it against any manifests.</pre>
    </blockquote>
    <p>Do we need the validation by cargo? The crate fetcher skip the
      validation with an empty dict and the same works for git sources.<br>
      <span style="white-space: pre-wrap">
</span><br>
    </p>
    <blockquote type="cite" cite="mid:239994b8-47de-4394-bcf0-16dc91ca654e@gmail.com">
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+
+        with open(checksum_path, 'w') as f:
+            json.dump(checksum, f)
+
      cargo_config = os.path.join(d.getVar(&quot;CARGO_HOME&quot;), &quot;config.toml&quot;)
      if not os.path.exists(cargo_config):
          return
@@ -137,66 +175,86 @@ python cargo_common_do_patch_paths() {
      if len(src_uri) == 0:
          return
  
-    patches = dict()
+    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
+    if not os.path.exists(lockfile):
+        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+
+    lockfile = load_toml_file(lockfile)
+
+    # key is the repo url, value is a boolean, which is used later
+    # to indicate if there is a matching repository in SRC_URI also
+    lockfile_git_repos = {}
+    for p in lockfile['package']:
+        if 'source' in p and p['source'].startswith('git+'):
+            lockfile_git_repos[p['source']] = False
+
+    sources = dict()
      workdir = d.getVar('UNPACKDIR')
      fetcher = bb.fetch2.Fetch(src_uri, d)
+
+    vendor_folder = os.path.join(workdir, 'yocto-vendored-source-crates')
+
+    os.makedirs(vendor_folder)
+
      for url in fetcher.urls:
          ud = fetcher.ud[url]
-        if ud.type == 'git' or ud.type == 'gitsm':
-            name = ud.parm.get('name')
-            destsuffix = ud.parm.get('destsuffix')
-            if name is not None and destsuffix is not None:
-                if ud.user:
-                    repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
-                else:
-                    repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
-                path = '%s = { path = &quot;%s&quot; }' % (name, os.path.join(workdir, destsuffix))
-                patches.setdefault(repo, []).append(path)
+        if ud.type != 'git' and ud.type != 'gitsm':
+            continue
  
-    with open(cargo_config, &quot;a+&quot;) as config:
-        for k, v in patches.items():
-            print('\n[patch.&quot;%s&quot;]' % k, file=config)
-            for name in v:
-                print(name, file=config)
+        destsuffix = ud.parm.get('destsuffix')
+        crate_folder = os.path.join(workdir, destsuffix)
  
-    if not patches:
-        return
+        if destsuffix is None or not is_rust_crate_folder(crate_folder):
+            continue
  
-    # Cargo.lock file is needed for to be sure that artifacts
-    # downloaded by the fetch steps are those expected by the
-    # project and that the possible patches are correctly applied.
-    # Moreover since we do not want any modification
-    # of this file (for reproducibility purpose), we prevent it by
-    # using --frozen flag (in CARGO_BUILD_FLAGS) and raise a clear error
-    # here is better than letting cargo tell (in case the file is missing)
-    # &quot;Cargo.lock should be modified but --frozen was given&quot;
+        if ud.user:
+            repo = '%s://%s@%s%s' % (ud.proto, ud.user, ud.host, ud.path)
+        else:
+            repo = '%s://%s%s' % (ud.proto, ud.host, ud.path)
  
-    lockfile = d.getVar(&quot;CARGO_LOCK_PATH&quot;)
-    if not os.path.exists(lockfile):
-        bb.fatal(f&quot;{lockfile} file doesn't exist&quot;)
+        sources[destsuffix] = (repo, ud.revision, crate_folder)
+
+        cargo_toml_path = os.path.join(workdir, destsuffix, 'Cargo.toml')
+        cargo_toml = load_toml_file(cargo_toml_path)
+
+        if 'workspace' in cargo_toml:
+            members = cargo_toml['workspace']['members']
+            for member in members:
+                member_crate_folder = os.path.join(workdir, destsuffix, member)
+                member_crate_cargo_toml = os.path.join(member_crate_folder, 'Cargo.toml')
+                member_cargo_toml = load_toml_file(member_crate_cargo_toml)
+                member_crate_name = member_cargo_toml['package']['name']
+                shutil.copytree(member_crate_folder, os.path.join(vendor_folder, member_crate_name))
+
+        if 'package' in cargo_toml:
+            crate_folder = os.path.join(workdir, destsuffix)
+            crate_name = cargo_toml['package']['name']
+            shutil.copytree(crate_folder, os.path.join(vendor_folder, crate_name))
+
+    for d in os.scandir(vendor_folder):
+        if d.is_dir():
+            create_cargo_checksum(d.path)
+
+
+    with open(cargo_config, &quot;a+&quot;) as config:
+        print('\n[source.&quot;yocto-vendored-sources&quot;]', file=config)
+        print('directory = &quot;%s&quot;' % vendor_folder, file=config)
+
+        for destsuffix, (repo, revision, repo_path) in sources.items():
+            lockfile_repo = get_matching_repo_from_lockfile(lockfile_git_repos, repo, revision)
+            print('\n[source.&quot;%s&quot;]' % lockfile_repo, file=config)
+            print('git = &quot;%s&quot;' % repo, file=config)
+            print('rev = &quot;%s&quot;' % revision, file=config)
+            print('replace-with = &quot;yocto-vendored-sources&quot;', file=config)
+
+    # check if there are any git repos in the lock file that were not visited
+    # in the previous loop, when the source replacement was created, and warn about it
+    for lf_repo, found_in_src_uri in lockfile_git_repos.items():
+        if not found_in_src_uri:
+            bb.warn(f&quot;{lf_repo} is present in lockfile, but not found in SRC_URI&quot;)
  
-    # There are patched files and so Cargo.lock should be modified but we use
-    # --frozen so let's handle that modifications here.
-    #
-    # Note that a &quot;better&quot; (more elegant ?) would have been to use cargo update for
-    # patched packages:
-    #  cargo update --offline -p package_1 -p package_2
-    # But this is not possible since it requires that cargo local git db
-    # to be populated and this is not the case as we fetch git repo ourself.
-
-    lockfile_orig = lockfile + &quot;.orig&quot;
-    if not os.path.exists(lockfile_orig):
-        shutil.copy(lockfile, lockfile_orig)
-
-    newlines = []
-    with open(lockfile_orig, &quot;r&quot;) as f:
-        for line in f.readlines():
-            if not line.startswith(&quot;source = \&quot;git&quot;):
-                newlines.append(line)
-
-    with open(lockfile, &quot;w&quot;) as f:
-        f.writelines(newlines)
  }
+
  do_configure[postfuncs] += &quot;cargo_common_do_patch_paths&quot;
  
  do_compile:prepend () {

-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#224426): <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/message/224426">https://lists.openembedded.org/g/openembedded-core/message/224426</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/mt/115578466/6374899">https://lists.openembedded.org/mt/115578466/6374899</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:openembedded-core+owner@lists.openembedded.org">openembedded-core+owner@lists.openembedded.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.openembedded.org/g/openembedded-core/unsub">https://lists.openembedded.org/g/openembedded-core/unsub</a> [<a class="moz-txt-link-abbreviated" href="mailto:stefan.herbrechtsmeier-oss@weidmueller.com">stefan.herbrechtsmeier-oss@weidmueller.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------BJtjpyyRBWQEJnicEnr6exzd--

