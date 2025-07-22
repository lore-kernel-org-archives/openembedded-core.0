Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CFAC83F27
	for <webhook@archiver.kernel.org>; Tue, 22 Jul 2025 13:00:03 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.35])
 by mx.groups.io with SMTP id smtpd.web11.11994.1753189193724382301
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jul 2025 05:59:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=izxJkZm9;
 spf=pass (domain: cherry.de, ip: 52.101.70.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BRF8Zffu1nYgGxva7l/p6rwnMKBnBA1FSlQeegODvxwJ+U6k/A3NRBPx9B9btxbiUHPO+bTmDipKG1FrJ72v4lTffkSawex5A3k+lfqNaKN+QbCpxjtFSVfnBEallEQBmJmZiQiQYw4DXBWKSjlAfdjm3BShuPV69aPGCaGLMVCQRTtD9TBo7DEjZujdvhw8eAeu8EfGZvEog5mJUJoq97oF+yhf46Fkdzgz7Ms0gjyoo3bfhAuikU/7tmtXoTdMKwCERA9HCc6mlh+5rwnTiVcVQ35NxdlsKTFqnjDQw+ZOVFKB9sgut8KmK5lZXv9tAZaksayeLVq6f6UEQRp4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tbmh6kbi6aIw8hf9FJSej6aMCVA+1RegfIMpoquVyVY=;
 b=NYhu2hCBR0rxYWD20rdiZYOngHHHz7FwN5tGLEQO9iIX9ot6yp+EgUsaDWb7rE23IxXP5qlMi3nuYcz8ikaEm7uxHFMa28ujkjbfcBeQIXvOUKRn/ANLnLI50FGwjrjL8pPSApHY1ILhNlr5s/u2hz7tRnnOZIw1YIzxQnVgoCiorXCnELnIh9w5AcIhqCGpSiCQsugxuiT2KuKpqDk7pi3FN7FatzSwH+mkLp6zZXX3tPOwIXPyUp0VvD4TogqcKHXdO0JQpqdkT9RP1tIW5XKiJ/DO8HcftQwzGjwwGgdmaCDebpg3ofjcFrTNCaLaim+p6nIl5q3+uls/daNo0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tbmh6kbi6aIw8hf9FJSej6aMCVA+1RegfIMpoquVyVY=;
 b=izxJkZm9RRYsN/nP+wjtN8Ol0ZS+3qRl25jRtH9xq7mx0vy6Di5tdmRrVGYOju4MvlxVPTOWZIQYx+w5W87TkfJwQ1wl0faZ15yyFu/mF/MPxrPR/poUTSNxOzrfoVMuZM35+UIdYANa+ZBAByG27W+LQulXsR7kyVT1j2n7OBc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DB8PR04MB6921.eurprd04.prod.outlook.com (2603:10a6:10:119::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Tue, 22 Jul
 2025 12:59:49 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%4]) with mapi id 15.20.8943.029; Tue, 22 Jul 2025
 12:59:49 +0000
Message-ID: <e2ec3859-2fed-435a-8d08-1f5457da3bab@cherry.de>
Date: Tue, 22 Jul 2025 14:59:47 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 2/2] classes/toolchain/clang: depend on
 lld-native if ld-is-lld is set
To: ross.burton@arm.com, openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com
References: <20250722125041.3301907-1-ross.burton@arm.com>
 <20250722125041.3301907-2-ross.burton@arm.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250722125041.3301907-2-ross.burton@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR09CA0145.eurprd09.prod.outlook.com
 (2603:10a6:803:12c::29) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DB8PR04MB6921:EE_
X-MS-Office365-Filtering-Correlation-Id: 55f9fb01-f6aa-41be-d444-08ddc91fa3d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?QklrSzNqemhZb3pUT2V3WTNsYzIxZzJwdlE4bU1NNlBReXl4YlhLYzBYZUlD?=
 =?utf-8?B?ZGwxS1JqUVJabm9uUGdqeVU0WHVrSms3Vkp3NlViMkZxSTFvdld1YjNwTW9a?=
 =?utf-8?B?dDg5eXVSelJOdEcxVTlsbW0rNWJxR2JDZHVPVXZrZk9rQ211UWVQWi9TRUJJ?=
 =?utf-8?B?a0xkcXVIQzI1c0w4bGQzR0dsVXB0QnVJOHJTMDc4OU8zdWg1ZWgwOXhHK3Y0?=
 =?utf-8?B?OFZMeGh3TndmemZ2SlpCbmdKZ2taUWZ4Q080eFp3ZXB1NHZMc0Z6MVYvajdw?=
 =?utf-8?B?WDQrQzhFMGt6cnRJWHZqMXJpMWVNZURsWnZUY29aY1VGSE1hZ1dNS1lhb0hi?=
 =?utf-8?B?aHZ5Ti9hcmZ2TElVWDJzQUVMVzJmN0o4cThRaXpHK0NwQ1ROZFRudzBNN0Ew?=
 =?utf-8?B?dlFFUDVxU3gweFR2YUs5T05Ta3BzZnc1K3JMdW1JcG01TGtxR3M1VG9zYXQ4?=
 =?utf-8?B?UUZTYnBBeHFRL0xJSkRtdFpTcHZOcDdpRnVoZlk0V256b1FKQ1lvQWpLaSt6?=
 =?utf-8?B?QWFkdlhLSHc0NWxWSWNpVzE5U01iY3FyMlZ0dFBzR2JrVUJkdzV0dzVGeWVz?=
 =?utf-8?B?dG9tYmcxcSt4em9TR1VTbDNSVkJpczZlNGZ2THcrcHVtaXRzQTY0VldDTmJT?=
 =?utf-8?B?SjJaaWdZNEVyZ0FZUUp5MU1wdENrQ3lpNG9HSmViZGlMVmhIYjJmRGN3ZzVy?=
 =?utf-8?B?dXRwaHJoMHZjT3V2VndMSFlLdVlwODlsL25nNnBMRFZTb2dMVEtuaExwclI2?=
 =?utf-8?B?Q0IyN1ZSRXp0OHl2QWhsRnNYL084MnhudzB0YjVlenlsSllqUDIrd0pNVmFT?=
 =?utf-8?B?b0d4U1lTb2ZjQ0hDS3BWSnJyQ2JwRk9OdjlNdm9ISUQzR3FiTXpGL2RXb1JJ?=
 =?utf-8?B?OGRXSnI1dVhmOW42MHBub1NaM1VVQ1kvdGh4VlVML01GTVFBbWk5ODVmZ3lK?=
 =?utf-8?B?TWhiZEwwbnhNaDhsdUxYdm13V1lnQ0UwVjY2RjVCczNjNUZSQ3YyempBc1FW?=
 =?utf-8?B?ODJFdGZrY2Nvd3RTQnQzSS9HYXkzd3VCV3U5VTVNbWwrL0prbGdIbzdjM25z?=
 =?utf-8?B?dWxnb3NBRjBxdFdhWkdBWGpKaWZlWDFYYWR3aFAxd2dTc3JXN3RuUGJQZCt5?=
 =?utf-8?B?Y0g4SWJlcXRNcVdTczJGUjNYR3RxdHhWMEIwcDMzcC9vMnp2Mm1teEE4ZVI2?=
 =?utf-8?B?ZktUZGpxMVdYaGMzMU0zcDlUalc3MzlWWXNoeGxpeHVWSElsQjVDL1l5Y29F?=
 =?utf-8?B?eTg3ZHhvc1Q4VG1TVlVQSTN1aDB1Z243dmRUYk0rN2lkK0ZidHArM2xzRVRm?=
 =?utf-8?B?dnlvYnVTZlFJVjF4UkNINmhvZHZKVzVpcTVsZW9MUk04eFhyRWpOZGNRN2V3?=
 =?utf-8?B?a0JKS0Q1aWxyY05qWDhLbTR1WVpZTVJxb1BBc2cyYXpTQ0dsZlNCeXVIeDlO?=
 =?utf-8?B?Rmd0VjRONk92TG44ZnMrcE5sanJwa0hhQnJka2w1UHczejRKM3oybnhUR1k5?=
 =?utf-8?B?bzdjdXRpMWtGcDR6S05GNmhGanNkYW5hdUNHdHJPS2psaW9EUytEY2x6cFJG?=
 =?utf-8?B?R1ZoWnJPZ3Z6VU9XL2YzdS9pZGlXQXN6U2Q4cktyMnZTU2VURHc2NnpTQktT?=
 =?utf-8?B?RUlXSHFxcUZrNklIK3BSRENLTHRQODNEK2JuQWhKd3hsOVFSUjNiR3ZPTjJn?=
 =?utf-8?B?blJpVm5PWVJLVUwrbkl3UTdMbDV3T0dhVnhxQlJFd0trSUppTTlTNTdFcEpt?=
 =?utf-8?B?Vy9hSDdDb1hsc0M4aGRxVEJHZTBGaXU3UXlFY1NBSmgvQVVXUmJ2TTZQcTBp?=
 =?utf-8?B?MU1veHJpMWxucTNuTEFIbnpLVnFpU0xGTWpXc1Vlc1pUaEFJV2kvbVF3bG8r?=
 =?utf-8?B?RUp5Z2NMMjB0dHNWQjZlbkkzVXZIZlZpRlRBVnBjYXcrQVE9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?SXNNVS83QzdSQTV0Z3dCMjVVbWR5eVhvem85eVlEdm9ScU85VjI3N01sZ3hw?=
 =?utf-8?B?NzlDRVNpU3VCZW1mUFpYemt2NzV3WmpVeERTbUduUlRZOGZNeDdDV3Z0OXhn?=
 =?utf-8?B?YWpzaFlmdk5XQ2NkWnVYbCsrQUhKUjQ3Ris0aVlPcnpoL0VUUFpMQkgrZHQv?=
 =?utf-8?B?dk1tM2tJV1VNZkhkNzV0U2Yzc0FTRHprb3dqVEloVkZGVXErK2kzVjZGaldY?=
 =?utf-8?B?VkcwbzdpakFuWnA3ZURSL1JaMnhXV0ZBWmVhVmNGcGVpYnBKUFNxRm80WmxL?=
 =?utf-8?B?YmNjcXZMTytEWFBTMHlrMFFmTWliTkJQNVcva3JlQy96eXpoZEpCa2hOTFY3?=
 =?utf-8?B?MUVYeGdKVzJKd2VzdXM3eXZoTGM5N0toWkRsNTkvTWFSRFlVVElucjV5dFlm?=
 =?utf-8?B?V1ZOT2FxR3NLOE83MTBpaVJZeUxQRzlpUGlIMUhpempIb1ZVUnRkSGp4WVZM?=
 =?utf-8?B?S0RSUmxVcll3NkN6bnBtK2gvSHNCeEFPQzg1WG5vZGJ0VFVPRExkMkRCbVc3?=
 =?utf-8?B?Q29tQ3ZMWEdjdW94cmpxWkhNWVZMYmx6NkhrbTlnblpKcGNBbGRtb0F3azZu?=
 =?utf-8?B?cGlFWUFzMGZBYVIzMkF2ZnAzTHQ3Y0ZkZnRYNFUya0IrSW1vdzhTb3RNWlox?=
 =?utf-8?B?RE5pVVZQc3VyYmR3ZmFnRHhjWTBNbDBPaGVscm0zVkVZcTk4ZUJGbGF1bXpB?=
 =?utf-8?B?WG5MSjI3SUJPZW45dktNekVYYVp1eDBGdmZvcmRYb25MdjRFT2k4anJQSlVU?=
 =?utf-8?B?VXV0UExYYTBaSkxpTTkzTlVKNzMvQ1ZYQXE2eUR3a2Fia3E2UW9SVnRJTkRZ?=
 =?utf-8?B?WkZQL1k2ZXdFUCtNTVBXZ2xCaG1jb3YrTTB1cEgzcGpkbEhkMzd4Y3pzeHVM?=
 =?utf-8?B?T1VXYkI1TGJNU3JYb1UrT1RNeVRSWVkrNVRCL1c1b0hOUmxCTTZiVkdWa2hP?=
 =?utf-8?B?UFNSWTFVYXF1TWQzMy9tNCtkM3RmRWV0MmF5aURrbFp2NUliOXE5WmVTRldy?=
 =?utf-8?B?WVlhM1VkQnVqVk5NcVlXTzhlY0lMZTRCR1lFYTNoMktFbVlESkJUZTZwK1h4?=
 =?utf-8?B?Mi9EM0Z4SE9TL1FMRXM0c2NBcVVvMDNiUXRTK2hYSnNrRmpwMnMvVit1MGdP?=
 =?utf-8?B?KzJjb2taV3VOMlN1RFkza1QraThGY0swM1JVcmptT1hzM3Nsa1MrUG5jTUNC?=
 =?utf-8?B?Y3o5Wk9vOWhSVVdSZ1NldVVrSFl1TWN4OGxnWlVydEFIZU9hbXlDK1hGeVdS?=
 =?utf-8?B?VWJIZi9md2ZwZ25zVlk3VHdjMDNONjc2VlZCeVNMRUFYaXBUNlJPbDRLeEdS?=
 =?utf-8?B?cXBxUGdEUFo2YTdoWVU5bytpMkVhZ0R5RlQ0SE9Ec1dLNzNQQXQ5N0w2RXE0?=
 =?utf-8?B?NjB6NFNnNnI1aWUvR2M5aGc5MDJhWmUvY1ZLbEdpcUg5ZnJpSWxkb3NOcEFY?=
 =?utf-8?B?QTJKbkdQdzJtWVZMZ09NSWZXWGtta3B4YmFaUTNtVm1WczVrUTd2dzE1TG9E?=
 =?utf-8?B?N0IyMytUUzlKN2FtS0gyVVNOVjFMdGk4bXVYcFkrSjNRNzFndnRWbVJSRVdR?=
 =?utf-8?B?cFhGVkpOangxZjF3VEJ1eVB5cmtIdFBuTWFBWlNKd3VwSlNaSmdLdjdncUI4?=
 =?utf-8?B?NW84YlQxNW9XbThtbEpOQ1pEdnJjYXpYRFV6OTdIL1owTUJLV0tlMU9LUklr?=
 =?utf-8?B?SGptOTU1c3U4UUliWVJ0M09hMjEybWF0a3J1V2JTUjFJQm9MM3NJUzU5UHUr?=
 =?utf-8?B?NjBwclR6aTBmQ2V1TGhGWXZhRWxHd3RNMzlwdUVGTGNwQUZUb01RelVMeCtl?=
 =?utf-8?B?SUF4VnE0K0hSQ3JBU1RXUjY2VXpIR3RTRmd1UmFCLy8vNGdJL1lYc3FTUkxw?=
 =?utf-8?B?d1pXVit2YjM5U3FraktIRXRrREcrQjlWMllTWEdOV3lCT0lrWEpUdUVSL1RD?=
 =?utf-8?B?UkdkOFlSNWVMS3lyODRoejN1cmc3ZWJNVnJ0QyswQnVOaGhpbi9GNUtiV00w?=
 =?utf-8?B?enB3aG8xcWVlZGJUbEpUaVVheHI0RWVNcFQ5Sy9sNnVPWHJ3S0pZeGQ5WVpQ?=
 =?utf-8?B?c2VYWXJtd3Z2Zm1UekZ0djFZOEVFZDNtNnlPMUlpVWtaZTQxcUpZTm5XUTd5?=
 =?utf-8?B?ak11YldWNjFQM3pCWisvZEg3TUN4ZFlTeTdGblhuMWx0K1U1Q0syMjF4N3FJ?=
 =?utf-8?B?RkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 55f9fb01-f6aa-41be-d444-08ddc91fa3d5
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:59:48.9860
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5/Y74xYSHl2eQ4v3VvCssFrnI8+FPl76WOuioHVChg3A01+KiuGsehUmjyh3hVBOzNxnybJY9bZOPWhuhsqHK2Mz+FzqFfGJcGbw4YubZU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6921
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 22 Jul 2025 13:00:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220743

Hi Ross,

On 7/22/25 2:50 PM, Ross Burton via lists.openembedded.org wrote:
> As lld is no longer part of the clang recipe, also depend on lld-native
> if ld-is-lld has been set.
> 

This should be squashed with the previous commit to prevent breaking 
bisectability and make it easier to revert the previous commit if we 
need to?

Cheers,
Quentin

