Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAC51D1AD4B
	for <webhook@archiver.kernel.org>; Wed, 16 Oct 2024 11:52:46 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.76])
 by mx.groups.io with SMTP id smtpd.web11.21192.1729079561603266915
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Oct 2024 04:52:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=M1bP+bZk;
 spf=pass (domain: cherry.de, ip: 40.107.20.76, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LzT5KMJq40yh64NZofI5izGrwJc9AwnkecwXed6OIBGKthuNDea55WIsgkVtCXwYXLEUKgPGIAsIlsv+eDPbWLQIz7Wcm7kylDzLUjPpC6SpVKeFNaeRSwads+Ri3YW4DU2m3fkDHxV27I5bJMlNuj0fCJXpbZ+NxgQUVL6IwOI+JVMxaoJ1AYmJ5MqbYjJFnyIx+Q6CxeAMd0QC4UadaiE09Tg4tgYX7C0l7q/4k/UZmgG5xvFZ/MMeIuk/qmhPm+q7b0EtnR/GfYV1erA09Dh8NHRvVd5RyRRHAfMs97Ntpzfv4TnjtVuglw0szRn0qIUrJtcIyBFlrfsbfNe7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IggX0ctGbiU3mUCgIUkxepkA7nxzAc0KeWmSCb4FjhU=;
 b=oyJ6BhevKR009g3RtgdIxu1hnG8+KM4DkVLFPnfoasvAtiXIe6GExvjQ1OgcRCT0zsYhIwiH2Ljwdj4mktvl326YeXE5+qDg7BKCFU5qcKZoCJMrIUmoaAwttws9AZYMbkcfXxrJXhPqksAcoWtAnh1efvUoBhuee0MW8EQBZw8rPx+yTaegsiZZDadqBReyURt/R8Gt7mgH+5C0/MCy+urW+WhSevIFM3htKRvYXAnU1ibXIOiun0iSGOercpvypd+eyN6XuTrBecEupcrg/QqlsFBQu4lHJWKAnMXWnp1IfSLcJ5oMQmNf+8g2eet0CJyDRcryGdlO6mMP1LBUDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IggX0ctGbiU3mUCgIUkxepkA7nxzAc0KeWmSCb4FjhU=;
 b=M1bP+bZkM6KjEH1JubW8r13J73VWjOzXSQiSaXAhdiCPGkunFb9Ifo0xe5YwaoKL5OtUcErLZwJW/Ci+ocw3I4NH+HGbc4SSsChErs4ONr3J8YIdsh0WlswE6WLOYkTHcT4UusYQHUUR95TKoBhVyRqMVpdLgRIhEvMtFTHKe0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DU2PR04MB8677.eurprd04.prod.outlook.com (2603:10a6:10:2dc::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.17; Wed, 16 Oct
 2024 11:52:33 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8048.020; Wed, 16 Oct 2024
 11:52:33 +0000
Message-ID: <aad59733-8f84-4194-8693-b5046d2b02b7@cherry.de>
Date: Wed, 16 Oct 2024 13:52:32 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] bluez5: Fix the files installed in the obex
 package
To: alban.bedel@aerq.com, openembedded-core@lists.openembedded.org
References: <20241016101442.1566155-1-alban.bedel@aerq.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20241016101442.1566155-1-alban.bedel@aerq.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA0P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1::12) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DU2PR04MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: f816fa22-34d6-44ab-a453-08dcedd90578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|366016|4022899009|10070799003;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?eSsxZkxZdVpkVzRDMkZXSjBGK3dvV0tRb1J5SzRqNi9ZWTVnN2ZZQ2xFa0pa?=
 =?utf-8?B?VTdHZ3k3WTlWMXRINkF5MVBWdCtRaXBhd2xoN1F2OStCS2RGZlpqZnR0NThL?=
 =?utf-8?B?eENkMHFPYlFza1QrNTFCckUxVElaRDJHN29TL0RXK1dKbjkzUU5hWVZWL21x?=
 =?utf-8?B?eDU2Z3hmNFluRTA0V2FDR2JWMDB0N3QwTVVidmJ0dUUxMTZ6UStUOFEzQTl2?=
 =?utf-8?B?THlnNGdEdXhlU3l5ZXBpaGlBYkk5dkNTRXdDZzJ5UzZaME8wa2VzczNXMjJs?=
 =?utf-8?B?SCtiTDBUVm9JSVhCOVFKRUN6NnoyTlFBWVl1RCt3b1NRMmlwUGhWTGMvUDBW?=
 =?utf-8?B?SU5BZ2QvcldKQ3p4RlZ3bVZUMmRaTFNPSjZwZS9WODdTNjJ0azZIVnROYXVU?=
 =?utf-8?B?VVNXYzNEWEJBTVZyNjdmL3ZTRmRiUUxwVXovYTVWdkhIbUhxREExUzEzK283?=
 =?utf-8?B?NTJiUkwvSVEyNmhZQTFwd2xNQ1pVeXlVREFicnkzaG1PMUsyd2h0T2R1enN2?=
 =?utf-8?B?SXcxOC8xT21wb2RSOFpTOFlYNEFXZVNjeVllcWt4UUZRTnVteFNwTWZnRU5q?=
 =?utf-8?B?T1c4TEhudkc4V1lqcHo5VmlpdThXR2Y0cUtuR0QrcFNLTnppak4wU01RZmMz?=
 =?utf-8?B?UGhRUUhyc1p2cmJmMGdibHRSWGNQcStDVlRVVnRQaStNTGNOd0lPdFNDTFBx?=
 =?utf-8?B?bklVSXdEVHRYSUVKcEpta3BqSjNvdGs5aDBOM1JqT2ptTWtaRXdrd25JOHFT?=
 =?utf-8?B?K0lBUVRQUlI0aDlYRzhGNm5DV0NvNWh6SEJ6QUIrTkZEOTJEdWhBTkVOdm9L?=
 =?utf-8?B?SkE3TEREMFIvd09MV3M5VzF1bmJBQU9DNkhQeUlrSHFBMHZGeDRVYnYrK1R2?=
 =?utf-8?B?Slg1bWFZOHJrazlNZkZqVVVLNHVRdGZxRk1aL1crL2F6anJpY1Y3WWdha05I?=
 =?utf-8?B?Q1JTUFlsY0I0bzV2UkVzS2pTRW1sWnFvZUpIcnpodWlab2RndG5IM0RwSXV2?=
 =?utf-8?B?OXFaU3h2U3BWaGxRand5VmgvbUQ1RFVDNnhWN2NoamRZeXAwa1ZTbDl2ZnBx?=
 =?utf-8?B?bS9WUjhuQ1Y4SXROVGVQWVpIQUp0N2YyMUw0b1l1Nk5sZkhhUWNTOTVOQXFN?=
 =?utf-8?B?bHdCT1BCSCtRd3cyQks1dEx6R2N1K3RVUk1ZK0lDUlRFKzd4KzYxSVZqc2NK?=
 =?utf-8?B?ZTN0aDZFT2dPcGdJa05LRjBUdmcyWUJaLzY3Si9EbkNwaDNwR3NUaXJOZEdC?=
 =?utf-8?B?K24xM1o1N3NtV0U2YW9UV1pWazB2L0srV0dLb1BtVWZTN3lhajdNRVp5VzBj?=
 =?utf-8?B?TUF0UGEweDU1MEswMWVWcEpxRVlQU0RZejc4Z2tva1VDWThyOHRPaFBCSnpp?=
 =?utf-8?B?ajN6VnFuK2V5UzJORE5BSThhdWw2bVdXMWZWUldEdWNJVVVuYzNjak9ISHlt?=
 =?utf-8?B?aU1CNjhlYjJWMEt0c1pYTDFubTArb2F6eGtxSXZTZFRFaFd4RVRKYXI4R2VL?=
 =?utf-8?B?emR6Y3F6TVROd1A3bnNGNURHajVFT3VCT2RKQ3h6Zk5teWxYYURKRUZGU2JD?=
 =?utf-8?B?dTdhczQrblNwU2Fya3NLWTNwOCtSQVBlYVpmZ25WSHpBdytJQmRJVWVxbVls?=
 =?utf-8?B?cmFmS3h6VG9aRTRyTFdXUXJCZHovMnc9PQ==?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(4022899009)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Vmp4T08xOFR6dy9semlrMm91TWE0anNwdEZXYUpSdlVKRFNxVWs0ZHVJZGFj?=
 =?utf-8?B?QnphZGUreis5NmtuWHVSM3dDYlJlR21RWXZiTGUwYTJ3ZW9KRzhObkZFYWYy?=
 =?utf-8?B?OHdIZ0I2azVYNlBLZVpLV1UwL1JvbENLSUZhdWRzYUlWSU9kTFMxTEUvSXYv?=
 =?utf-8?B?YTB6T3hHZE1EcTc0TG1VMzdON3cwU1Y5b3liTVJYMEVMK2crU3lYRU9MY1lo?=
 =?utf-8?B?VnVpdVprZVpoQjVlOXgzMHNBZ2xZYXdMdTVKL05qanVMT0JnRVdyTDBCWnBY?=
 =?utf-8?B?Q3ZCaFRxWHVSN3lvUXAwS1F2LzIvVWJFY3VLbHozZllBR1lEUjVOTWtoNlZw?=
 =?utf-8?B?elhEWnArSTU5N2VLdnc5N0xldDhJNTU3ZXBiakhkMkhCRHFqVUZXRE9kYU0w?=
 =?utf-8?B?Q3pKWUxuQlBSZE5xOFV2WjFvUkZzQnlncEVrZWlzQW55azNxNHNTaU1UcWxK?=
 =?utf-8?B?a2pObnh1bG5qOEc0U1lYbktzcXM4NEIyQStENDdNaFNLMEQ2YW83Q0RJOHlh?=
 =?utf-8?B?MFBJTW1QTUl1dHd3YWVrUFZteTZEdWdKdHBZTGpVNjJ6dzJiYTdZMHhlZzRW?=
 =?utf-8?B?ZW40ZmhCcnNBYm5GSDN0QlpWZFU1L0dYaHdpQktjME1hVEhTQk5vTEdyc2d2?=
 =?utf-8?B?RmpLYzVBQjJ2T0V3STNRWktHY1VYM3lGRlpkQXNLZHdmZzF3dkpvQ3dscEdq?=
 =?utf-8?B?dzVLM3FKNVJRVVVIdk95c2RuMVkzUkd2MFY5WDBRc3pIQkpXalR3aXoyK05W?=
 =?utf-8?B?Y0pkY2l0RkdQdHpHZnYwSm9SMDcrci9GRHRrYmExYkFmT28xTmh2cE9RTk9E?=
 =?utf-8?B?NEZicmxrYnQrNUl0cTNOR2pCSlZhR1RRYTBZbklMTTFDUEx2YllGblNwTjNO?=
 =?utf-8?B?N0M2RDdxTW14cWNvVDh1ZHB1ZTg2NWdzaTdxeVlaTGFMdkYrdWtzdFRNTzhJ?=
 =?utf-8?B?R1RRWmxRaTQ0SHEyd0FwUmlHblh2dFUzdlFPYTVSSkxuWWV6VjFYZkg5eTA5?=
 =?utf-8?B?RFowa1VnYmU4ZUhLemp2MTMwMzVieHZ3U3JrelFFeHlFeEprYlRPeFdnK25E?=
 =?utf-8?B?VzFQVzQzNUxQR0dpVUxTdlBaWVlNY0VuaERuM3UxK2w2NWRsSWZVUEJmZEhF?=
 =?utf-8?B?cUY4djJoZjZLRlAvTmp6Z1psdndpNUdZMHNiUWl6VHEzT1llSkU4MVJRL2JD?=
 =?utf-8?B?UTREWnRGMXFtMXpxVmFMQ1pzZ0NGV1FSRHVIODA2Z1hKSCtkQkN1MDlTUFU2?=
 =?utf-8?B?MHpKVm9rdVdPa1dGckRWUGpyM2YzS0k2QUFVVnVWT0VUYlF2SVgra01SQUw3?=
 =?utf-8?B?SVJQeU84OFBsSEJSOWZKckhUWVhwSm05N01POVlLY1dhdzZsbHBnNit5d3Fu?=
 =?utf-8?B?R2NIeFRJTWQ0RzV4TFkzcTkyclRXMmlQL3RuWDY3Yk9TTEhzZjY1MFh5eFRq?=
 =?utf-8?B?enNYK1BGbFQ4b3hhalI2cmJNY1dQbStkaW9xSTlqZ0lVM0w0VlJpN0h0SVdq?=
 =?utf-8?B?USttcUFZQ0JhN0xFN1VYczJaSjdWY2RhbVo0TnovWUhFNFFOVmZKUWVBM3lE?=
 =?utf-8?B?UjczSkxqNzRBVkxINTFURDZ4aEp5ZHJiZ3RrNkxsZ3RMcDRseXJXa3c0SktT?=
 =?utf-8?B?TnJIYnZlTU1pbjBtMGVJR1BWVkZReTBIUm9yQ1VBY0xXc0tPMVBBRDRnQXpv?=
 =?utf-8?B?VFhQbE1BRHRYc01DWFFPY0xGSnpoVUVJRWorR21NM3A1ZHEwTTVlN2ttZW5q?=
 =?utf-8?B?LzJQNDhya3Q1MWR6WHE0L285cXZZQkRJcHowelZkRFg0TUNNenB1WkVWUzNZ?=
 =?utf-8?B?bmN6eXlGOXRlWStycnpuZVNOUTlPYW9xdzZsZ0R2NTc5UGtTVTVvS3VYcnB6?=
 =?utf-8?B?dXAyRFhFLzUzc09aNGNvNWROeTh0TXFMZW9BaFBFdU44ZlVXREdseUI5VVhY?=
 =?utf-8?B?d2RRaHowRmVQS2tQZ0xSOGh5THVTVENCQmRRdDZPWXBiN3ZiZkxQYzdmT3pI?=
 =?utf-8?B?Q3J3RERvdVloZytsYmovU05mWjVQRVRSN3NBZ0JSdytPeGhMcHAzdk15TW1Z?=
 =?utf-8?B?RTh0eHpyWDBqNzB1VVZwSThPNyszTGlDRlVHbTgwblhjSHZHWVlvWlpHR0M2?=
 =?utf-8?B?bHZGZmdQaGJ3T2lPVm16akRqZzR5OENXWENOYW9PV3dTQUcrdXJYemtuM0pU?=
 =?utf-8?Q?Qq5OzWq4ItbNg+hOpSEWsoA=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: f816fa22-34d6-44ab-a453-08dcedd90578
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 11:52:33.6718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3U+LLngM7iH77O6z8ynqM3F8dcISomysg9/gZkMfKI3qLFotKg2mBqB2fpoq0zHkd2MpcWRsIluEZkxY5O1EwtQ4Zc7WM8kAVLHtP4xRTY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8677
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 16 Oct 2024 11:52:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205964

Hi Alban,

On 10/16/24 12:14 PM, Alban Bedel via lists.openembedded.org wrote:
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#205960): https://lists.openembedded.org/g/openembedded-core/message/205960
> Mute This Topic: https://lists.openembedded.org/mt/109041163/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 

The above is the entirety of the mail I have received from you (same for 
your other patch for util-linux). This will drastically lower your 
chances of having reviews or even the patches merged.

It seems like you did send something, c.f. 
https://lore.kernel.org/openembedded-core/20241016080520.1532567-1-alban.bedel@aerq.com/T/#u 
but the patch appears to be an attachment, rather than the body of the 
mail like expected. Is there something you could fix there so we get the 
patch as content of the mail and not an attachment?

If you figure out what the issue is, could you let us know, maybe 
there's something we can add to 
https://docs.yoctoproject.org/contributor-guide/submit-changes.html#sending-the-patches-via-email 
for example!

Cheers,
Quentin

