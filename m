Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AFCAC00A8F
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 12:49:39 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (EUR05-VI1-obe.outbound.protection.outlook.com [40.107.21.52])
 by mx.groups.io with SMTP id smtpd.web10.146778.1698151768963935939
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 05:49:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@vaisala.com header.s=selector1 header.b=D7zxicsa;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: vaisala.com, ip: 40.107.21.52, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YjBr2kSNTWCwNKOis237yWB8KqJ7dbdalfNj/E4TOjrDg9WoNy6ibH89t67Et2rBira6c2R55RTxD2qEoHA0Hvzf9mSBd4LjqTbp9xOqJOeWlRDsLxQRUFM+aXRiUywm+w5OzR3scsJODAHKJqbE7MJ8tZV227f+q7gZb1ypATimWpCnd8/4x036QqTV1HdyLMRcYalVlYJrJ7nz9VwfupG7lrdJeIvuFWhhb6bWlgMEOsV8zeGcxMGPof1tlkeJBsInqISqO2MvwrbNkm8crUCAK/47Kyl/ckzAoclz74eINyeOZFeGX5CdBIpkSJxLfTUuFNBD0q1iLlUsWAsWnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H9K8tvBiC3Lu0Joz+tChYwWkKS3sXzPVhYL42zuIzYo=;
 b=FVGFrkE2BTmUIJ5ilEsi5QtDVc+BWKVsXZKha2GeggAVrBxoOUCG2s9U9t2PWDjxAI4hdFjFAQrib9xHrAaTAo+q3KUa08Snj+xDI6LXTBWBFwKv3ttwO2yYc8eJmuPOQ1K5ywsb5M0iiEMsV+cCIUJkqW8KvlnVjIguALdulVH0rMCxyUnSixNA+IUR8iz8zLqwxrmm6clnLWO5MVbaF6PsKXLbZ4I1VyR0ZMEY0LYD7Tx+PiHoqGTKSRzsuNbcx4qc0mP8CnGEf6c60FK5uhRcEHJI8vF8EnDP70d4X67+CFtJpdr2fQRM/IImAgytiVv2fA5F3FITOzq/5n+FzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H9K8tvBiC3Lu0Joz+tChYwWkKS3sXzPVhYL42zuIzYo=;
 b=D7zxicsaVvgKAPjJLiVn8wrJu7yPFxjOt/jh55+gf2HiTeAZDyagI1d1iz5ST+KRma54sbqA551ALwl8jB2AMuJSNuRVKUSu7tuYQSU9JZqaXW7PhNTvHWHoLjoMKO+p/dJIgIDL5F63u8pY512sVzTdPm4wA1+UndereuZ9uxlyLeIGz+NG4NZzt5LRpk9ndYQ9/sbDNl+/m8+5ypm0DV0KCHBDWTTEJYgNP3eMymKP2k8LD0+yFGOx5Qifuvs40EYQGXhBAD1azycKUIr6aMpbYK8CDJFBXpue5HrcAd/BAu9b2SOQ2TC+nWmYl+0DCzuukdkLwz5y7g5jn/DWvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PR3PR06MB7116.eurprd06.prod.outlook.com (2603:10a6:102:85::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.31; Tue, 24 Oct
 2023 12:49:25 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::746a:49b5:ef81:9ff9%4]) with mapi id 15.20.6907.025; Tue, 24 Oct 2023
 12:49:24 +0000
Message-ID: <befadde7-70bf-4042-876a-f00377aecc4a@vaisala.com>
Date: Tue, 24 Oct 2023 15:49:22 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 4/4] package_rpm.bbclass: Support compression
 override
Content-Language: en-US
To: Khem Raj <raj.khem@gmail.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 openembedded-core@lists.openembedded.org
References: <20231020124450.9736-1-niko.mauno@vaisala.com>
 <20231020124450.9736-4-niko.mauno@vaisala.com>
 <d53085e46d3b3af2071bc3c1b4cfdb0f6517b1a5.camel@linuxfoundation.org>
 <d96313a1-5ed6-4ea5-977f-84c21ba0c37f@vaisala.com>
 <6190e445-52d0-441c-b105-809429c23f3a@gmail.com>
From: Niko Mauno <niko.mauno@vaisala.com>
In-Reply-To: <6190e445-52d0-441c-b105-809429c23f3a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: GVYP280CA0012.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:fa::10) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PR3PR06MB7116:EE_
X-MS-Office365-Filtering-Correlation-Id: 884b60e8-2c44-4354-b312-08dbd48fa69c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	3AL+zi8goksT6X5LGhGu87kICQ0pm4T7khJptEyyzc90/vjfE1LZnoxT7mx0JyRw8f0Wi/puaV4K+OBw+oXumA6HKJsqpHmLLamcRJ1SOTZreteaUa8uLOQdMsQcAxlcyN9wkXsCmuC35GMpk+1c3ZJepAnjglKNX0rogqpQuqkLxINloliwSLE388hR048FtY3e6Uq0jSnLxn+ijUnBI7MjS94doPv3yxnSjEG4lmknvj9crDpSzUjHaSEUPjrGYN+jB1is8LH5E5kov4fHt18+2WO20EyMEZclFksUFgj5XlCu0REwK9Pa126b1TLuyD7s4LH5PDmmZfqEKS9AvKo2gHBaAltn1frr4iCVSROv1sI6zywXDg9C//J2fgjHXkb9+XfQvr9qDdEYKiVEeATzViAyuQQh/4UwAxlsIsSXhV3mwQsPp5afK2Bu+LzNQrGXnTErbOWAl3Tg+hUCsUps3Z+fUdlmWh8YJ5Iwn9jiX5OFDrrXVrh3RQt5oljq2HqPaNAMjXDRgJSQq/6ngC7wnT/5EB78MwL3+zazhtUOGC632scaoKMy6uNKdDEDuNr1pcPe4v1+LApF2a6mhJdmi5Agwl/EBrph5IAlYRUDt8eVlLu1AzY8xU1w2BXhKMkSIdsrQe+gcGo4p0FA3w==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(396003)(346002)(136003)(39860400002)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(31686004)(4744005)(2906002)(41300700001)(38100700002)(5660300002)(36756003)(8676002)(8936002)(44832011)(66556008)(316002)(110136005)(6506007)(6512007)(86362001)(478600001)(6486002)(31696002)(2616005)(26005)(66476007)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SGJla2o5VmRZUEZtb2poeXhidTJrRXhOSFVuaVZiM1BWVGlBSnB6VUcvbVpO?=
 =?utf-8?B?SkpyYk91bTluWXhoRS9pV1lsc2FUZ0ttTVhSbHc1eG1NUTkyeHY0NFhGTTF3?=
 =?utf-8?B?WGc0ZEQ1aUdwV21SRTQvVmtSVDZOUVVBZzFRaDRlVXNoa29OTHI5RGdBdEpF?=
 =?utf-8?B?SGZRU2tyYVNVZ3kvdktxbUlOMUdGMjJFaHF5TXk0VUJnVitKdTZLaHJQaVli?=
 =?utf-8?B?TFBQTWZsOXBObUt6SXhOUFB6YUZNR3h2QTgreEt5Qy9jMURIVFVnbUI5ckxN?=
 =?utf-8?B?VlNEU2ZzS2ZWVzRmcmlKU1F2YmZmTlYrNktaTlJiaGdGZW43b21rQUZoZkFw?=
 =?utf-8?B?RlBaRm5VTk02QndOZ3RVbFRMczFFNlhkbjdBMWtPWWFEOW9wcy9GTk14VTlS?=
 =?utf-8?B?YjVnUGtqdG1rY1ZWbVJZOGhHQ2lRL1d1Ync0K1c0amhmakx2dktEYzI1cTRa?=
 =?utf-8?B?bDZWbldJSUR5Z2U0aEpwVjNOVno2MWg4MHNQM0ZXdTdhbytPVEg2bFE1aVlZ?=
 =?utf-8?B?TTZKenROeHEyV1lURTdMZFMwL2d4SGFFRlJrYlNsQmxMRGZmdFZQckd5ZFRT?=
 =?utf-8?B?R3A3cm9Pbmluc0l2Mi9zWHR1aXpSNTNHV0J1ZGlCUkxCK2NTWXdianVjUmNu?=
 =?utf-8?B?bkVQSXNDcDdid3lpY2xqYzRYNHpHRnkrZWV2Sy83OERuS2VLR0Q2VDIyZ0ps?=
 =?utf-8?B?SERBZ0RoaTZxd01ZcHA3UG9uQlBNdHdBT0UwUEpMUzlCQklwaE04VkNVTGdr?=
 =?utf-8?B?S1oyaStJWXZXVzRuLytDRXcveE9FM2ViUmJNSEcvSHc5T0pJU2dUNUdUOHJ2?=
 =?utf-8?B?RFVkd0Z5Nk5CZDF1cEs5bzVnTU1lZURWZ1diS1B3MzVNV3djcVlmOFJxK0Fv?=
 =?utf-8?B?NEsxN29YWmhjRFBibVhYQzl5RUJYLzNGZm4zU1lUbDZPaW5mV2V3c3dSZE13?=
 =?utf-8?B?WENNTzBBazVDcmdIRDUzeHpTNjJoR2VTWlVkUmp2TW1YY2EvV3dDWFZpblVT?=
 =?utf-8?B?NU9QOExBQitmZkZ2REVQYWhQalJ3Yy9jam5KMEk5THBJRXRiOVNyUkdoMGJC?=
 =?utf-8?B?WTE2WU1NbStEQmZOcTlPVVBqSFhKUEJsTUIxeWNtNXR5WjNrTU1zcldkRzFY?=
 =?utf-8?B?VkhmcmE3OW9WbzZRN2xuQU4rTmhBcWVGeE5DYTlJVHloaDB1Vi9aNmhuZE12?=
 =?utf-8?B?b25HUXNwYzdFdWxUak5oQkY2TzNSL04vMzZtT24yVm9xaE10Q0JWdkc3SHVl?=
 =?utf-8?B?cU1sUkVEOXo0ZzRxZFMxNmUxL3JaSTUycTYwRHEyZzY0TkVqaHJyZmd3bFJW?=
 =?utf-8?B?UDFuYjQva1VJdWlUT0VTYkl6UjhZZ3pTVnBYb2tObENZNUlNNWhEcnJBVHJV?=
 =?utf-8?B?aHF6U0htY29WMUhmbFpha3ZwNXZLMUxTcFduZzZyTWc2RmV4bTdsQVZWOWls?=
 =?utf-8?B?OXkxVUNZaDY3czU5cWRXRVVyNXYxM1B2Zk1YalJRak9lUjhzWmQzS2JUcGxr?=
 =?utf-8?B?TTJlYjA0ZThFRG4zRkZSMDVaU1lCT09SZTdtQS95Zks4NDRTNTgrV25JeUdN?=
 =?utf-8?B?WkZXeTZWQU9PZDlOQ0pHcFNrMzFwYWIvb0ZmMllyamJrY0lLR1MwQS8xbDRT?=
 =?utf-8?B?b1hQYzFWblRUNVlSOWhqZ2RQVkFyUVhaOWJqSFZCb25tRDU3UEg1ZlN0Y2dL?=
 =?utf-8?B?ZEhnUGVnWXQ4T2FyRUpQdEJyOFVxUzZZUDJYQ1l4TkNhdWdOOFhWNTZvREV1?=
 =?utf-8?B?emRsalZXdUdrZHNyNS92N21iMDE0WHlGZzJWejc0dDAwK00wL2I0bEp1UXY1?=
 =?utf-8?B?QjhscjJEc1NQOWN3d3NyZFZGWjFEMEN1dlJlS3ZNSVRRT1lsUVBCUjIydkJI?=
 =?utf-8?B?YjZmcWkxUEpnK3Joc2tVL1FJWDlrRjloZlREYU1UQVdpSitHVlRsVEd4VWti?=
 =?utf-8?B?NlN1OXdLUnVTVE5mVnNxYU5haWxTdzVkTzhGNml2SlpWWm5BV3hFZHhuTlpE?=
 =?utf-8?B?byt1UGxKbkp4QzlFSlo0VXZKRHFUZnp1bUVXRUVhNEJpRVVFMDVCVXQrU2gy?=
 =?utf-8?B?NkJqNkczb2p0WlVva0t0SnYzNENhVW5WSUkrNG1OeEJtSC9tV2c5blhVY1N1?=
 =?utf-8?B?VGtVQTNhNXdkTFRRR0pPc2kxNS9XL0REai9Lb2U4dmgyOXo5NGVSWkcxU0ZO?=
 =?utf-8?B?Znc9PQ==?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 884b60e8-2c44-4354-b312-08dbd48fa69c
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2023 12:49:24.8001
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KryKwS011TCA/2bSHox6Q8yOoa35e9b3LyEC3pdG7uIthZodSkEx3Ujq0tKmOHjz5vmWHeqKcptvRTwU8wcKrg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR06MB7116
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 12:49:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189644

On 20.10.2023 19.34, Khem Raj wrote:
 > it seems you are quite sensitive to size, I wonder if opkg backend is
 > better suited for your usecase than rpm.

Hi Khem, thanks for the idea. We used opkg a few years ago, however
certain technical reasons were in favor of rpm which we have used since.
Perhaps we have a bit different view, smaller image means for us
spending less time building, booting and flashing firmware (i.e. not
just disk space consumption alone).

-Niko

