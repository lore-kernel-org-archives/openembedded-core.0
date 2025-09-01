Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92E14CA1002
	for <webhook@archiver.kernel.org>; Mon,  1 Sep 2025 11:12:09 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.13])
 by mx.groups.io with SMTP id smtpd.web10.48663.1756725120689456379
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Sep 2025 04:12:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GSfkrvvN;
 spf=pass (domain: cherry.de, ip: 52.101.65.13, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fpyquQZWZ8aeQvnaPoydgSHDdyO4r/f5dHQMt6AzS5QkXxZYwFDDXngcWKCtot6dmb/9MN5OcyjnIOq3HUrxkZWBiFBM9QgOOqslp+LFNlrOOZqmwg1IwsHfhblD2a1x1s3HLwiKrxaPMkJyfdFaXtKfcIDWwLZOn0FMGF4Tx2+VOsce932u4n+9kvsED42MxSs88ulhBQ6L/2VXICZ4vaeBOpGQX6hKhYf2u04OMTwb89MqBVlWDAXaMEaE3cEXU2IaGv5cVBm4+foz6rfePK+i/mtaLroC88H6zuziRVqENJjtF/G43jlGlq4px+iHwmf0+hOcXAJsTK43raDkXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wXICceh2hjAj2fJEbA3LTsC0m00W/peoIHmMmd+lQIQ=;
 b=dTFTjTg/evu0fpiJ8vDIEBP9jcborhgxmudWkYw40dLpTy+F8ut4AxivN1NAi4UTN9nfsk5v9redQlWG5q7RyA+9f3VSrnvSJ0a28f7N2IbOUr7SsG9jkTioTOLbX56xJYxCkJ8sQ+xr17PWxWah0uhsk+DhDHJMm/xHF829KD2/j+9qXdslp8Obe9w6UiC3KOMvNXrWGTzKE/YzSB5fvUT4cOFlUjSDmRUrhprTI20Pi6VyeignR6o0OF0TZfy9WovRJqCjQxxT4HjhXIL6TngIgx83fPEQOzy7levXDxGCUhdJC6ds1bUHqUn2YIBWFqUgcLjotTnxTu8crCRoUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wXICceh2hjAj2fJEbA3LTsC0m00W/peoIHmMmd+lQIQ=;
 b=GSfkrvvNik5SVjixCOa5Kx5YoEhPKiU3yZ/27wf9kQwlfIkK03eRqeNoqHofi8oTxSyLcYfhJKYPZb28sYmnqIjZlM/ZmGsx6XT22to9x+57uA0nEjD4KwVeoT8z5m9MFkAj8i8w49DYxO2Z3KfR4IBFKXT+sOUrqq6NQ3WHzMU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI2PR04MB10715.eurprd04.prod.outlook.com (2603:10a6:800:277::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.12; Mon, 1 Sep
 2025 11:11:56 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%5]) with mapi id 15.20.9094.015; Mon, 1 Sep 2025
 11:11:55 +0000
Message-ID: <65f861a0-e097-4a61-bf75-091a2a6a691d@cherry.de>
Date: Mon, 1 Sep 2025 13:11:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] connman: Revert removal of no-version-scripts
 patch
To: peter.tatrai.ext@siemens.com, openembedded-core@lists.openembedded.org
References: <20250828104401.3627-1-peter.tatrai.ext@siemens.com>
Content-Language: en-US
Cc: Ross Burton <ross.burton@arm.com>
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250828104401.3627-1-peter.tatrai.ext@siemens.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0063.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:93::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI2PR04MB10715:EE_
X-MS-Office365-Filtering-Correlation-Id: 31d8e208-4443-41e5-c1bc-08dde9485c97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|4022899009|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UmlOaldoTSsxQWhhRDNqNDNiQ1VzTy80NGpGaTZZMGhUUVphc205V0RtUmxa?=
 =?utf-8?B?dERDMTVsenF3Nm1mOWRDakZGL3kyMjFOa0w1WU8zbnN4MXphL2RBaWtjUEdX?=
 =?utf-8?B?T2xQZ0ZxWitDRnpnT3grZUI3aG1LM0hyOUJlek5TZGFZaHZiZ3pGOVczaHBY?=
 =?utf-8?B?cisyRWdVOEpzR2JRKzJUY21QV0kzSjZHRmsvcmRBVldwZFlhRE5vTG5JN0Jz?=
 =?utf-8?B?OUFFbVRYT21wczkycWZvcExjbFcyWFVkVUk5T0lnemUxZTRKUi9ZazhGVDBN?=
 =?utf-8?B?b2huYlBRb01PeWZ1YTZ0SGk4N0FFNklSR2dGODZENy9nMzJ2eHl3ZE5JOHFW?=
 =?utf-8?B?TnFvSmN4MkkyOW96RG9sRU9nT2c2S0lVY0hWTWVDU1BCUGZObW1QdU9IL1Y3?=
 =?utf-8?B?d3FwMmVLZVVHeVl5SkJ0NzV1YXBkYlc5K3hTcE1HWWV2Q3lMOVV1eVpVUTNP?=
 =?utf-8?B?ZXovb2RTWWFheHVheFFuYXhYMjZXbkM2N3ErQzVzZlNLek5BMlppbTU1OUlF?=
 =?utf-8?B?aVdaRXFmTElTUit0VTRDdXZwYUhnMEdGMThDZUYwZVFlU0hTRkNablRDaUor?=
 =?utf-8?B?aXc2RXNNWXpKdnNRY0hyQmxQRmhhNEdzazhCN29tYnJGUVN3bHhpMzI0OXRo?=
 =?utf-8?B?N3QwLytYbW5ZdXh1cm9jOWxESDNjblNvTnNlZFBHRjdOS25KYVlZbmVkZ3ll?=
 =?utf-8?B?dmZaVGtPR1l0ZE5RaG0rR3M1d2NlTnYxaVQyQVhNV3BqL090Y1BqSy9Sa09s?=
 =?utf-8?B?cEJGWGgyTCtNWDFDei9uUWJUdFlhUTIvbUNlY3NNdzM1bVk5WXF3bmJEbG5G?=
 =?utf-8?B?ZjV6V2tKeDBhekxwMUpzNGQxZTllekxzYmJmbC9YK05nVElxS0hWN1JBWERB?=
 =?utf-8?B?cExIV0pOcnhoY3cxWjFLcTA1VnVvdTZKV204dWwvOXNDQm1TQ2o1S0Z2OEwv?=
 =?utf-8?B?M29XOGR2M0NCVU45bHA4MUZRRy82YWh6SWxVaXZjTHhNM0pobWlqUFNBVVJw?=
 =?utf-8?B?WllrdGFUS0N2YWh1cDFVdTZFdlZWRDlDcEMzUHFaeFdtbDhNQVZQY0FkYVhQ?=
 =?utf-8?B?ZGljQWYyNXBYdS9hRUUxLytZaGQrMzRjd2xWL3MyYzlsV2VTb1ArSkZGNDFK?=
 =?utf-8?B?OHZvd3d6NVVJMGpScHpZZVpIRkR2cy8wTUQ5VFYyTUZmb2pQeTNWUFIxUnoz?=
 =?utf-8?B?K2kvREdhempNdUQwOGZIcjJKNHdsZzl4elhSemJFUjBUaDhuZ29EZ29NTVRt?=
 =?utf-8?B?NXppd01BNzUvMXRXdWZ5RFlDQ0hlQWZONzNMYStPdTIzaU4xNHgxSVF1S3Ba?=
 =?utf-8?B?ZnJUVG9ZZjllSGxJd2d3cks2a1FQRC9lNStlUi9xREJncTYveUlTNlJ4TjNZ?=
 =?utf-8?B?RjMzdkEyWFJZbm1aN0h5TVEwY3lDMnNPVGpKc3l0OFdHNTJPcUZyNFp3bUVU?=
 =?utf-8?B?a1FMQWNNeEVUam9qSUtKeXFzendRWVE1SHlJWVJzd0lNQ0dMd3lHcFJsL0Qr?=
 =?utf-8?B?cSthNUMxblJHendLUjgydEY2RHh5UWNZWVovVit6N0Eza3RJMEFLN1lzWXJa?=
 =?utf-8?B?djJwSy9FcDhGaWQ1TXpBMWhNTlpmOGZXaE5TSGg0djRhSituYmxFUllSV3Fp?=
 =?utf-8?B?MThGVDlwa09XbUhKbkNOMExwOWJ2QUV2RXBhRjVOMlNpdmxvSG5BTXpzc1Ru?=
 =?utf-8?B?MWU2b2Z3em8yOFpYVFZRUStKUi9vTkVWNVZmbjBjUTJMdXplZ3ArQk43ZzBt?=
 =?utf-8?B?T1ByMGRxNWZtQUplc3g1ek4yZ3E1dEpzWWhodC9RSk1nNWJGaUZ6OUQ5TjJw?=
 =?utf-8?Q?O2tyFegzCzfLIv7hm/m5NyTggqaIgKMNvC08c=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZWdMRmE1Y2FKWWMyZzNGVENjemZ0MnpRczJxc0RkNXNLdWdMZHdkdkhUL3ZQ?=
 =?utf-8?B?aEFKTHJ4aStYblNwZUl2MjJhS082WnhnaW51ZkI4cnhQM2RWRFpwZlBYUjlR?=
 =?utf-8?B?KzhLZ0ZqSUh1Z2dCaVM2bWhzTUFoblhNd2NqZkM2MjVDN1gwVDFUSjJzYTVy?=
 =?utf-8?B?NTg2a0hoVHY3SlRwL2FiZ2dGYVJwRFFYR1YzMUpwTzNXMFZhcFFPRE5OSkR0?=
 =?utf-8?B?NTY3U0dONDFhWnV2bnM3UDNBM3RJSFVVcmVpVzhISjZjbzJKZ2wrUVhtanJZ?=
 =?utf-8?B?dWNMNTZrOHlDU3RFYk5kMGNLTU1aSVRLVmZZdXppaGVZNnJMQmhRc0Zack1x?=
 =?utf-8?B?UVNHUVdFbitxenVQRXAzR04rdTlXZ243dGlyUjJEZnM1ZXJ6ekN4aDY0Y2R3?=
 =?utf-8?B?WTV1MjJNb0tQQzdjNHhncWd5cGEzNVhJMDJONk04SVpxUHcrM0RpMkI0bGx2?=
 =?utf-8?B?bEJZTWtMdktNcFVWMFNnMm9uYmdkcytVL0JDalhlOW0yV2tkMmtlR1JqNGJZ?=
 =?utf-8?B?S25LdU1mb2luQU5Iei9nT21NSjNOeml5a0dKK0NYYk9OWHg3a2dYTWo0NktB?=
 =?utf-8?B?OUJ4N3BSZE1JajI5YW9JR21qaTRXYVF4eCsvNTZKOGJyY2RTM3IzQ1dVV1BS?=
 =?utf-8?B?eWJYOFpScFk1cU1VZW1jcWNBTzhuTVpGcmI5TDh0eGF1aEN6RHFGL0MyUlJW?=
 =?utf-8?B?enU0UHo3STBwRGZPRnVTMkYvMkVhK0NGRjUzSXArYko4KzRrNW96S1hBS2Ix?=
 =?utf-8?B?WXlSSFFsamtQTWZCYXNaaXRhNjd4MUpaZFMrUUdPMS8rUTBVWVdzcXFsMnky?=
 =?utf-8?B?OEpGdVE4MUh6YmVTYU5RclZlZnQ4SWFLYS9SUnNpTE14TUdlZitRc0tLY3lZ?=
 =?utf-8?B?a0gzWFRTVUVtTXZDQ0pFQWdsSnZYSGtza2NxOEVWWTNINGRqNi9mWTd3WU0w?=
 =?utf-8?B?N095cWF2NkpnMVM3c2F1OTA1VHNQNm9QMDFyRG9TVnprMXZzNlEyRzZnQ2lF?=
 =?utf-8?B?dWhhYm1ESzhvcUppNkZxNUZnWTllaXJnSjcya3lsZnBKWmRMUGg0NDJMWFlO?=
 =?utf-8?B?czdJdHlUTVpkcGlqaDhhVnZzLzRRUFFsQ24waE1YUHc3eTQydDZtQWVhbEtz?=
 =?utf-8?B?VnhNQUN5UlU1V3BGT3hweXdKdFNuMnhJUmFxL2twZ3pDb0dNQ3QzSkphakhs?=
 =?utf-8?B?bU1lUFl5S3F4UlVRUkhFSGZMU2tpNVNaOTk2M015NW9NZ3h3cFdidWV2Z2Yw?=
 =?utf-8?B?Ty9SNG1IQ0xwTHByUHVKak5iV2J2Q09PMTlTaTlEZVllTkJNdEw0eEZKTzI3?=
 =?utf-8?B?d0cyV1piWkJ1S1NabUdVY3AxZk5UQlN0SHJ4VkFENjJXaDRSUzcvbnlmbHZW?=
 =?utf-8?B?NnNxWWR3SFdEeXFWdjFvcmVqVW84OHVCZ0hTQ1U2R2RVbUw2TmlHSC8xckI1?=
 =?utf-8?B?NnZNZEZZdGdXR0o2WnRiMVVlb0k0U3pUMDVjWEo0UTRtQTI5d05Walk5WXhZ?=
 =?utf-8?B?bG1oUTVsei9hckV5MXE4a2NYSjZFWGtIZTZRS0RWcVJsbEVnbUxiRUhqTFhr?=
 =?utf-8?B?aGZaaXNRTjRDK2t6aVQzWXpLMUxOQXE2bWwrVHE5Z1Z6b1JKZFowZFh0d1Q4?=
 =?utf-8?B?RCtiV3JPS3NOY2dLckFxU3AweHpEQlZ5REV2Nk95Y2JGTG92S281ZkprQXhs?=
 =?utf-8?B?cUJxMjJYY3NBNlloZTNZdjgvcWQvYllLNE9oUm5McnJiS3VnSEFxVW9nRURL?=
 =?utf-8?B?eVM2dTJ1UVRUMm1WWGpOOEdKSkhHYW9Za1gwM1hqNWFNdCt2ZGxFWXZuTlhv?=
 =?utf-8?B?a2hZTlRnVzNVRXlKek02U0VFSGcxVVpqcDlqcndzeDBjWWN3RWp2UWc3UzBt?=
 =?utf-8?B?Syt5MkFreU0xUm5pcHgxY2QxTVp5NVZGM0E4b294T1pKNjl5MFhEOHUxTVRz?=
 =?utf-8?B?M0c5YlZ4ZUswTU90NC9jbTB1UmlMbHhkUnB3eENZYzJBV3E0WE1odHphd1lF?=
 =?utf-8?B?bUNrWTBQRGpvUGwvK1VxbllvNFpkZDRJRk1tVXo4MmtmUzlvNCttbk5UWkNN?=
 =?utf-8?B?cTcvZnBjUEJ4STFVZk1qOEkwQUZZcDBsSkN2M0UzUkFXSW9UWDVpRE1xRld0?=
 =?utf-8?B?ZVNDY2ZpRkJIUTVYYk5DNFpVMG5OYzlRTWxZVTdIbTA1MGw0M2ZBOExjS2dQ?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 31d8e208-4443-41e5-c1bc-08dde9485c97
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 11:11:55.8894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ezd6VD6z/JY0YaSasfAegCBdS1ANEhPK6xCsMG7Ss9CVguLcUvS1xHKYkp0ypLcEWxx2zMthl7lv7wj0/cKi+pph9H4H5vO1x1DA9a8UzDA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10715
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Sep 2025 11:12:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222658

+Cc Ross

@Ross, considering this has been contributed with your intel address and 
9 years ago it may be a bit of a stretch to ask this: do you remember 
why this was marked Inappropriate so we can make patchtest happy with 
Peter's revert?

Cheers,
Quentin

On 8/28/25 12:40 PM, Tatrai, Peter via lists.openembedded.org wrote:
> [You don't often get email from peter.tatrai.ext=siemens.com@lists.openembedded.org. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> 
> From: Peter Tatrai <peter.tatrai.ext@siemens.com>
> 
> This commit restores the no-version-scripts.patch for ConnMan,
> which was removed in the commit (5c269ba9a396832af3f8139ecaa0cfd9f7d4d1b5)
> as part of cleaning up gold and MIPS binutils workarounds.
> 
> The removal of this patch caused runtime crashes (segfaults)
> on the powerpc target due to symbol visibility issues with glib
> and stdio. Re-adding the patch resolves these crashes by disabling
> version scripts in the linker flags.
> 
> Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> ---
>   .../connman/connman/no-version-scripts.patch  | 48 +++++++++++++++++++
>   .../connman/connman_1.45.bb                   |  1 +
>   2 files changed, 49 insertions(+)
>   create mode 100644 meta/recipes-connectivity/connman/connman/no-version-scripts.patch
> 
> diff --git a/meta/recipes-connectivity/connman/connman/no-version-scripts.patch b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
> new file mode 100644
> index 0000000000..c96ab311e5
> --- /dev/null
> +++ b/meta/recipes-connectivity/connman/connman/no-version-scripts.patch
> @@ -0,0 +1,48 @@
> +From 67f37aafcc8ef5d2eb006387e7bec21f74518727 Mon Sep 17 00:00:00 2001
> +From: Ross Burton <ross.burton@intel.com>
> +Date: Tue, 9 Aug 2016 12:12:02 +0100
> +Subject: [PATCH] connman: disable version-scripts to fix crashes at startup
> +
> +With binutils 2.27 on at least PowerPC, connmand will crash on `connmand --help`.
> +This appears to be due to the symbol visibilty scripts hiding symbols that stdio
> +looks up at runtime, resulting in it segfaulting.
> +
> +This certainly appears to be a bug in binutils 2.27 although the problem has
> +been known about for some time:
> +
> +https://sourceware.org/bugzilla/show_bug.cgi?id=17908
> +
> +As the version scripts are only used to hide symbols from plugins we can safely
> +remove the scripts to work around the problem until binutils is fixed.
> +
> +Upstream-Status: Inappropriate
> +Signed-off-by: Ross Burton <ross.burton@intel.com>
> +Signed-off-by: Peter Tatrai <peter.tatrai.ext@siemens.com>
> +---
> + Makefile.am | 6 ++----
> + 1 file changed, 2 insertions(+), 4 deletions(-)
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index 3dc3bb5..3be5ccb 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -143,8 +143,7 @@ src_connmand_LDADD = gdbus/libgdbus-internal.la $(builtin_libadd) \
> +                       @GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
> +                       -lresolv -ldl -lrt
> +
> +-src_connmand_LDFLAGS = -Wl,--export-dynamic \
> +-                              -Wl,--version-script=$(srcdir)/src/connman.ver
> ++src_connmand_LDFLAGS = -Wl,--export-dynamic
> +
> + src_connmand_wait_online_SOURCES = src/connmand-wait-online.c
> +
> +@@ -187,8 +186,7 @@ vpn_connman_vpnd_LDADD = gdbus/libgdbus-internal.la $(builtin_vpn_libadd) \
> +                               @GIO_LIBS@ @GLIB_LIBS@ @DBUS_LIBS@ @GNUTLS_LIBS@ \
> +                               -lresolv -ldl
> +
> +-vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic \
> +-                              -Wl,--version-script=$(srcdir)/vpn/vpn.ver
> ++vpn_connman_vpnd_LDFLAGS = -Wl,--export-dynamic
> + endif
> +
> + BUILT_SOURCES = $(local_headers) src/builtin.h $(service_files) \
> diff --git a/meta/recipes-connectivity/connman/connman_1.45.bb b/meta/recipes-connectivity/connman/connman_1.45.bb
> index cfc6114712..85f14eb80e 100644
> --- a/meta/recipes-connectivity/connman/connman_1.45.bb
> +++ b/meta/recipes-connectivity/connman/connman_1.45.bb
> @@ -20,6 +20,7 @@ DEPENDS  = "dbus glib-2.0"
> 
>   SRC_URI = "${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
>              file://connman \
> +           file://no-version-scripts.patch \
>              file://0002-resolve-musl-does-not-implement-res_ninit.patch \
>              "
> 
> --
> 2.47.2
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#222558): https://lists.openembedded.org/g/openembedded-core/message/222558
> Mute This Topic: https://lists.openembedded.org/mt/114932653/6293953
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [quentin.schulz@cherry.de]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


