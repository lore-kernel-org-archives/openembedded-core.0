Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7BD8F47CA5
	for <webhook@archiver.kernel.org>; Thu,  5 Mar 2026 18:00:04 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.26])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50692.1772733596307790634
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Mar 2026 09:59:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=UHoiErQD;
 spf=pass (domain: cherry.de, ip: 52.101.65.26, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSswd36HQbsQxukcW7ZSTtYNqnfa2e2WmR3HYHYnBEy7xd3mo6HcnzHaJ/rOuC5CF+9WYRvCq92EomXYAjcrxYiYUiIV6dkOkKsBUHxzsPpw9jev1JPQLS/hXPtAv7447fRy/XceyIgLGikMoq+FYludkITFAnkfoQ57qXElYQqpD8g0bRDcfLDCw3TOa2cybM7mB7odfrBg/jOkKOJihiXPNmmdb3fMY9CzEb7sjYQak97PL5FqMixuhofAqey8eRIQt+Mt0hqgSszPWDK0Xhh2E/xxZIXVMS1eVnsJ9yz3sH2Yjcv/zuwDwTEtkPgl0jg0UW1ZdSy/Y7EvRxLIFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CO6ID+su/6rIaYUQIYaimoN7m/CDIdKo5B7eBox5bnw=;
 b=PTXw4TpMSLHiQnXCDFU5MmIs95I2nI0zSnvdESJKb1ze7rBVYHUkHzWHlE4vLKMir7N0IF6HOWzqokm/30xDhwyqPsFK7cB25D3aHevZxSZMz9/GHjjmOd7ZIj2YS8oo+239jMnVmeYmRlNVi6qDBHDL4k4j4RcMwe7YovZYsRbtkUmfxsNWgqYi71/BLZKebKc54b4bZ/S9SuO0UYNt4R6a/Evr3jM+m2ZyNZqpLMf/DrSch3krvO21cmEirDFWR2RAPa2o+iPy1y3PqBpcqpM/0f1v9rPVflHBfAIvKObzDd8Z3ukBpbACJlfRCyI6T6dnvYunGCg1BlIioq0cog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CO6ID+su/6rIaYUQIYaimoN7m/CDIdKo5B7eBox5bnw=;
 b=UHoiErQDRlJxDnwG0gSx2OqdjPE79GQ2pJYO61h1pxEe9WYXch5i+LjvRp5N+zWDLlqwtJUpw5E/lBc+UIemDSWYo+OXIc30R4jL8niK/4DFtYAoRcbEO7lkCbjBOdRL3O+zsPaCp4bxRXVXqNIzIqycau/Q3p/MsH1emeCHYcE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by VI0PR04MB10391.eurprd04.prod.outlook.com (2603:10a6:800:236::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 17:59:49 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9678.017; Thu, 5 Mar 2026
 17:59:49 +0000
Message-ID: <b0d07d40-9345-4a2e-bad4-979c9966e1b9@cherry.de>
Date: Thu, 5 Mar 2026 18:59:18 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][whinlatter 11/12] b4-config: add send-prefixes for
 whinlatter
To: yoann.congal@smile.fr, openembedded-core@lists.openembedded.org
References: <cover.1772700454.git.yoann.congal@smile.fr>
 <d65310d181c4bde71d7f6821b0c2bfb27acb3a3f.1772700454.git.yoann.congal@smile.fr>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <d65310d181c4bde71d7f6821b0c2bfb27acb3a3f.1772700454.git.yoann.congal@smile.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0140.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b8::8) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|VI0PR04MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: 803e1781-f869-4c8a-6e9e-08de7ae0feae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	OY3u5cK7ut6yyxZ6UdnsydWEymsDWcMWw27jPOHLn6LRHYhOL7+FfJqoGRUpVKTVxBVReFdlRO0vE2extzK2OWeQf/79x9aapje4Sl3miJSbnnUsP4ErOF5L2p8JVhpJsCFdgVaT3Xm2Iq4QiQx5ttxrBSrAWBVf69GJiFTJkEXQv1ng5kR0w/+JXxkFAcEEzFxt72ngl5uNGLtl9V6NMZbN0RLHLImsCK48VjbhGlw6rJaxQ3K8JehOdUF4wk9eArSxiljbi+s5I77igY8L3ZKh9v/JeacQDjRP2acDSFju4OZWbCPAzcwIjCYe4wvdUzn6koIlS/TGftYgFAVDAztWxnH05nPB2ESbSaP2hpsCtUUI9mtftOtd7Gewb2NvdtLnqhySqpap/H3q3SonLxaHcxtEYGMv+4GJnroXopsw8hZN4VteF7cZa6RXfqPVeRrjI1vMoHWp8Eectw3xzSg/Iwf5YZV8Wn7mT7CspJc8xGHjmRXG/KUgiL9TFwnbCT/r4pyB5/ARZKC0GvlPNUKPNO9e4EjE2evc/2Z3UDtOCXSt10z0/i0ktszINAk0ny0rFnt3gIgTKJyC13pnGwRdgNAMESq5tkuNfCY7nUFrdb/WZBBTNAJoIpMmxNsRUODvCvKHYU+5wrITpuy0STX+IHZR+mMAopytlxsjQYJBGTwgZgFrhgFl2GpDXAWKOLIoKvekzCy3G1NsVPo77XzPM9mcz2WFjhkKzSMMImg=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?cmJ4MUZHdE01NjdNbVpic0lQM1J4dkc4S3VYZ0xUYWlzRjFmYndUNklxeVJE?=
 =?utf-8?B?SEFjaFFyM0pwRHJWbnk1U3JpM2hXMVJXaFR5eEFyYnE2YVlYUnhEZUFvcXZS?=
 =?utf-8?B?d2hVMmhjMUF3d2gzRmpYSm5laC81Q3VWY0pHeFFocXBvZ1RoVStGK1IxQmxQ?=
 =?utf-8?B?dzZSbVNuTytkQksydktFL3ZjaUJTK0FWdExLWHN1NVhxeXNtMTllSHBYazBY?=
 =?utf-8?B?UDFNQjM3SDBhRUxDWEZpS2R6WUoyT1FRSmVSalZMOTQ3b2RGQ3BWSUFPTWdW?=
 =?utf-8?B?bWFZdFpUUndveXR2R0xIU005U2VzQkdQODdRb1pVaFc3UVVkenN2ajFZNzky?=
 =?utf-8?B?RjNBMTcrR1NveEZCaEthZmxZZWVoMjVqSVlINXpIazh2T09MVmJsaFBWeEVK?=
 =?utf-8?B?cFUzRXQyRWt5eXdha0prZGZ3MUFaQlVwbFUxZmtZN3dMRmcxMWRUYmdFM2Q3?=
 =?utf-8?B?cGJJRWsyTEFMcHozV3I1SVVYK2R6M1VCV0dUaThCSWFWcXo4QXRhSWdmZEZW?=
 =?utf-8?B?ck1GWFNvK1E5a2NSWTBINFZFV1hBWHp1ZE5DOUEyOStWNXRvQ040VFRjR2xW?=
 =?utf-8?B?NEYzRVJIMmN1TUtKQ3ZWbEozN0xiV09NbkZMeXFxYy9QSGNmSEZxNE5tck9F?=
 =?utf-8?B?YmFnc01XYkpFeUovSFEreU9kWFJicitXZTA2YUM3MnZxN3dZQzBPZGdZNUFO?=
 =?utf-8?B?ZGU5QVFjV243S294QnVlT2xaQ1NxcEMwMno0VTE3dk9tSjVYSy81Wkc1U1g1?=
 =?utf-8?B?RkFkVHNBNlF5RFM0WTRpeCtjMlpFbnlMNmFLcWJhWktycWJVczJkeG5DTGln?=
 =?utf-8?B?MlFtRm8yK0Zhc3Nqa0owTzZ3MWZQdGEwZG9MTEQzV1FleG0xV1VpQjB6YzV3?=
 =?utf-8?B?d1RFdFlkVysrOUFvL0pWdEhvOVJCL0QzUmFEeWZzenZKQUNFb1phS0VyWTFM?=
 =?utf-8?B?aGk4c3V1aUNjYTlzajJLZW9KWW82dXBObG1sbGRRc2d2dXBXeFVXYXZneGk5?=
 =?utf-8?B?TDZ2bTFrWHBRLzBra2UwLzBoOERMTUNnNmFabEo2TDhRczQrbStmblEyUXA2?=
 =?utf-8?B?aEVtTnB2QUhnYWkwZTBoRWlBclUxRUVmRitHd3N5ZEtGU1VpUFJSbFJaRHlp?=
 =?utf-8?B?UXllSm54L2M0aHFlcGM2Q29tc2RYSEZhdVlLOSs3WlNEVlVCbjVxbGU5RGIv?=
 =?utf-8?B?RnYrV090VHJpcThuQ1lYYkRLeFdkS1dGdDd6VjBLODkyVWNaZlJXanZSQTkx?=
 =?utf-8?B?bVgvRW1mR3VGN1NJYW5zZ2RXR2NwaWo5T09WM2RJdC9tNDBuNU5mN1VUa0Za?=
 =?utf-8?B?YXhpS2ZmWkEwWTVJaG5QYVBmSE1haGh3T2RJUFk5V1hOUXEvaEdXUVV0QWl6?=
 =?utf-8?B?WkxPSWxtcVNmMzkyVU9MZnlrdkNZblAwMW5HK3JyQWxJWDNIUzZLZ0hnY3N6?=
 =?utf-8?B?ZGNmTmhjcE1zQSttY2NXRFNCS1UrQndXQTZPSWo0QlE0ejBaRFVaMWtQSGhi?=
 =?utf-8?B?VEZUNzM1dmMyNU5sb25MQmFBMGE5Z3ZyOUF6MVJGL3RjTnBETFVvK3pHdFNP?=
 =?utf-8?B?VnBXVnBPa3V2TWhqQVZJRVdwTmF0cnFJZG1DZG40WElURXk2MW1YZkx3MzFo?=
 =?utf-8?B?K1VjVWJRQXpIY0taL0ZFNzFhWkZFcnVFci9uY1pxOWJzK3dlN3NFRWJmaEh0?=
 =?utf-8?B?Ync3Tm1RdnMvNDRwRVdCdDBXdTVPSXRMeWpaQmFBdEFJajJhZ1U3Y0hndmdL?=
 =?utf-8?B?ZnV6eC9MbDBMWDVkVWtsSUlqeXZhOGN2THZZcFlVNmZKWW5TdXdPMEN1bjgx?=
 =?utf-8?B?TmdCQ0ZsTUdzK1BuSXo1UXFkQ2ZHNC9EdFpxakNBZThFU2FiRmlIMXJwVFZx?=
 =?utf-8?B?SDJDSnRPZEJrenRXK0JPS3ZWcFBGcGhNd29JWEcvMWVwaU9hL3RpRHh0WnZs?=
 =?utf-8?B?MEcwMDU2V2Q5TzdyWHozRDU1azljSXFQSjN5SFpPLzRyb2kvMkNPS2ZhNFl3?=
 =?utf-8?B?ODYyTkFmUTBRNUhsbEtYbHZ5Nm9SWVRabWExY3Frb3BKcDFUN1MxK1dRVWx6?=
 =?utf-8?B?SjBGVFZkcVg1YnZyeVBSc3c4Z1FnRi9YV3F0ZU8xQ2FKOTZtK0lmK1BHS1Zo?=
 =?utf-8?B?cW1EY2lvM20wRFdZWkhuV0E2NzRyU2FyVk81R29GLzhQenhEOGRUd21QWXJS?=
 =?utf-8?B?eFhHaUpGbEE0dGM1WUhIOGZiaThaRnRVQ1BMbm9jWGRDd0ZLY0RjM29rdHZ0?=
 =?utf-8?B?aEMvSkxxUVgvVVYzbmxLNVF1djdnbnhDQmE3RTJKYkV0alpwcDVqdHF0UmJY?=
 =?utf-8?B?blQ1REp4V0FGUjMvV09yc1J3V0orM2QrYzlGdmFYWHU2dFNmN0YrOHZXdXJE?=
 =?utf-8?Q?5RRrNFjQmG3BiU7x+gsIDam6Rv3CnrHahcyQe?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 803e1781-f869-4c8a-6e9e-08de7ae0feae
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 17:59:49.8752
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ur8DhFufV0Os+o4l0BbEFmJFp27jvWnw9et57+VgGnN1Qu+erVPbn1x6YYbRakAzJmywuKEIoX2ErsTtmlf/YBMPcABssxSjzaDqOXiMH3A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10391
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Mar 2026 18:00:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232502

Hi Yoann,

On 3/5/26 9:55 AM, Yoann Congal via lists.openembedded.org wrote:
> From: Yoann Congal <yoann.congal@smile.fr>
> 
> That might help new users send correct first stable patches.

Also has the benefit of telling us against which tree they based their 
patch (for example long-EoL releases like we get every now and then). We 
should do this for all releases the moment it's branched off master.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin

