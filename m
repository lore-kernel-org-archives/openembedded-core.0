Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57ADACF6497
	for <webhook@archiver.kernel.org>; Mon, 30 Sep 2024 10:34:40 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.89])
 by mx.groups.io with SMTP id smtpd.web10.51298.1727692476070599491
 for <openembedded-core@lists.openembedded.org>;
 Mon, 30 Sep 2024 03:34:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=egocLyhq;
 spf=pass (domain: cherry.de, ip: 40.107.20.89, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmkOb7xuiSEPWaVqEd8ru83n1Ti8Ijpl7XPbyhQYOunBAgHLf5O7sMf5IIu8s3TWpdRqI3qoYbrsBQhAxvD0duRJFynrurfRbXdQsFlUerFhXnj3FMcUOfRaIxxUYLjCqB9qADW6War/ygsoVGLMBuJEO2Wn9SuzmyQ9+a7uHCkTx90nEmN2cs058OwGM5uEtBX6oapuSp/HzZVzO6fea/ILRatBc23zak07jUgOJGc8GLQlhnqnnIqsIYsPg0cduz5M78iBYSBJObg/jsT/7p0FawH+uP+BEGm9w0fjRxbjwP81nHMPoKgzT5KL3HfKxQEGbjBTQic+VBWsRcei+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HKut/13hDNZFyl6ROj3hq/Eh4Ijl9DDQjKWcYZNsDdE=;
 b=N5je+oGq6vnzNvoxcEyrQEj8PGN4oU7bjOayMf4xWVxpQMhslZAZE+pr7nIa6zLKqOPzupmtNem+KeJIFv4gyxdvXfdYomnpraPbuvFbWlPWCs879SG+9X2xl63KIAtOzPTN6n9nd2Mb6nfeEMEhVe6X8GlZT3fgs9sxzUkjwFtCl+W78dMLVqtDuHPIukusJBcwT8ilKYWivznje5H7QnJqu0SxR9RdNBe4y0B8ueV/sY7tJbD3vqM5BW89kbv+57XcSXWqmaWgFrpSKpTI9CFBNhjYDuH30khlC5qzNbCDFpsjV1CQ2SgHRfA9ve5r/IlTorotGg263ckTJHeFNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HKut/13hDNZFyl6ROj3hq/Eh4Ijl9DDQjKWcYZNsDdE=;
 b=egocLyhqUFlHDsdno6rOXuDbrKLZsVXuiU32NppM8jmWk1aSA5gd2Yh7D6KrjDzR1AevGc2ffyRhI/hwJ1LzwE75B1erOfzAHdvESKt0RMIkmqE7GWAcYKBDrdhyLHB0qwAlyQbe306dQe2BeOj7XxGFtA0ikkp0CqUBts5OhB4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DB9PR04MB9553.eurprd04.prod.outlook.com (2603:10a6:10:2ed::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.26; Mon, 30 Sep
 2024 10:34:33 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%2]) with mapi id 15.20.7918.024; Mon, 30 Sep 2024
 10:34:33 +0000
Message-ID: <a62eba84-2420-46c6-b7de-870f0eaa48e6@cherry.de>
Date: Mon, 30 Sep 2024 12:34:31 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [kirkstone][PATCH v2] kmscube: Add patch to fix
 -int-conversion build error
To: Purushottam Kumar <purushottam27.kumar@lge.com>
Cc: openembedded-core@lists.openembedded.org
References: <20240930092336.2400258-1-purushottam27.kumar@lge.com>
 <d616f905-5ea5-43cc-9c78-13da1d8e93a0@cherry.de>
 <OF66ACE98C.D255BA9C-ON48258BA8.0038065E-48258BA8.0038065E@lge.com>
 <OF66ACE98C.D255BA9C-ON48258BA8.0038065E-48258BA8.00380662@lge.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <OF66ACE98C.D255BA9C-ON48258BA8.0038065E-48258BA8.00380662@lge.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0006.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::14) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DB9PR04MB9553:EE_
X-MS-Office365-Filtering-Correlation-Id: 17587c50-c0f5-488b-e9f0-08dce13b78fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RDJSaEU4WGl5MkpaZ0hIQVl5NE5PczZRamdRalR0VzNCbmY5Smp6R2xEZGZM?=
 =?utf-8?B?TDlGRVlvaHQzRk8wa0xxOXBBQ29zNUZOcnRvQ25hcjhlQ202bXJXVnBGRTJO?=
 =?utf-8?B?TkNaVEU3Rno4ajVVbUFkalB3Zkorek5Xc29laXg5a2FkUjlOZzZhTEZmQ2JS?=
 =?utf-8?B?V0dTbDZBbWFabndnYXpmWThmdGdDSTZhUEhIbW03djJYNGZpY2RUaFI0RmJW?=
 =?utf-8?B?MEdyeC9qM2x3SGNXRnlobVJBTVB2QThCQ2p3UlBmUHB5RURoVnNWRE13Ty9N?=
 =?utf-8?B?b1dWMHJQbFlwTmlMNGtmWDExZGN4U1ZlajRhUjJDbm1pb3I0VFY1cTdBZzRs?=
 =?utf-8?B?cFV2cTMwNGlNMlJ0eEpRY0l6eEVjL0grNUdWeXphZFVIM1VzTHJGKysyeWtC?=
 =?utf-8?B?WHlGeWJramtlaE1hT0xYblNFa094L1A0WUU4UHBZc1dPTGloWW9rVzQ4dXpG?=
 =?utf-8?B?Y0RwTWs3QTd5K28xNmYrK1ErWWF0all6ZWVKcW5zenRKTDFGSThuc2dod3Nl?=
 =?utf-8?B?RFhBaHB4dEI5cjZGNFAxcVBuSm9UUHU2K3hzZWhqOE5oWHh2WDRsakF4MTA2?=
 =?utf-8?B?RmlIYlZtemtXYjZSN2g0MEVFNW1xa3B0T2ZmR2ZjSzFhcmpPYVI4ZERwdmpB?=
 =?utf-8?B?SXpHRnN5VjRNMG5Ca0hMNlRHZzZmQlB5RVBpQXgyck9xUml2dFlYYUFOV0lW?=
 =?utf-8?B?ZExUNTRKeHFscUxJYzNtd1VnaFE2a3VONVVjWEF4eWdWeGNSQ2h0emxpV0Jq?=
 =?utf-8?B?UjFZNjNVTjNNMWtoRDBJUVJOYm4vbjRReG9XeWNLbVdBaFVIemhFMnMxZUk2?=
 =?utf-8?B?c2pEMW1yYVlKT1ZDNXQvNmNHRTVNN3JGbHdOc0UwTG9Ba1g4Q2t5dEQzTkND?=
 =?utf-8?B?L2ZweUU4SWhKQTY2MmZEMEtmYTVKUU5CeEc1Y3d5NXRqNWFVNjdkeExkYndv?=
 =?utf-8?B?RjRqYkJTUzh4eDZaV3g3dyt4N3J1TnV4MWNjYms3YjFDYlkrdG9Ga0cyNmx0?=
 =?utf-8?B?MXVHNGRKVWlHKzRWTEVKR2cwTXE1NzR5Uk9GL2x4ZVByMVgxemJiTStOK0Fq?=
 =?utf-8?B?NXhvMDB3WXJZRWpsdE11bS80RktJZnpYZktFaUF3SDFrSGtpK1ZmUk9PUUlU?=
 =?utf-8?B?N3gwS2hHQmZuWVZGOS85KzRTbXhPR0t3azFtaUlDelBwbC91NlBBTFNqRzY5?=
 =?utf-8?B?bStUU0xzL01BeUVWUmJMdVNueUdKRXh4cXV0UXFCeisvUEJpazFiTUZnM3M0?=
 =?utf-8?B?MEpWTyt0OXFiWm45dUUzT0dCM3RQZlB2MzlrU0d5Z3NmTVloelZxcHdkd3Mr?=
 =?utf-8?B?Y3ZhVm1Uenc2WmNIMGtmVVlZeWUzck5VUDU5ekVESG5ZSUxjMFY0di9QUEl2?=
 =?utf-8?B?RmZ0Sm0vcEs5ODB3S3hDYllka2NSNkQ4Wi9Nb1BjT1BsYS9DeWxyb3YrV2N2?=
 =?utf-8?B?RjNQVStXUWJud2w3b2E1QlNzY1lkbjJ1Qkx0Y2Jjc2txdG1ORTZtOVd6N04w?=
 =?utf-8?B?OHVMRDdGczQ0cFZqWGxXR3IxQjcwejFTMkZScEFWUHo2SWJxVkhQNzBiQVdO?=
 =?utf-8?B?T1U2UGdLWE40UWJaUTcyNHBYeUl4aGQ1MlZSODlQWXA1SWtVZTkrdENEc25J?=
 =?utf-8?B?Z2pjcEJrNVhkVWp5NEVSVEdhN2ZtcjZ5dmNDRG4vMTJlL2F6YlFLRmdvYUhj?=
 =?utf-8?B?bXBCOGtiRG1FWFEyazRYV1pwLzVoMUFCSzhDVFpWRXRjRWlPdnV6UEV3PT0=?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?Z2lXUjk0SGlXTDVtSGViRWdQL3ZTR3VDRkpEd0MzUEFPVTFaRmNsbUpMM29R?=
 =?utf-8?B?MkN0M1NnY1NJcS8zUWJkK3dnL3BTV3czU2svcENKcXA2OFJzOU5HQW8zd1U3?=
 =?utf-8?B?aThLVHBidGw4T2VNcy81OUpGajVpbzBvU2NON0hld29JYlIybFhmUzM3cy8v?=
 =?utf-8?B?Zy90MTRKR1V3ODUzNmxHbko0MGdYcmtjcTR2V013QzQ4UDNpZldnVnkrZkFi?=
 =?utf-8?B?N0Z5UlhPZmN4cllod1l6WUh0eFNSdTYwYjdzb0k1T0JjeGhOSW9va3dMQWpK?=
 =?utf-8?B?cmo1WjJNc1IyZTYxL3ZUc1NESTAxeGRydlZxVnZ6YXExVVI1UHNUbEg1N1c5?=
 =?utf-8?B?MGpOZGFSaHhsUS9RTldDSHZQeFliZ1hkQy9Tc1ZScGEvemZBLzVEOUtuKzZB?=
 =?utf-8?B?ZnhueSs2cGdXWFY1OWt3am96aVBNb1R2cFU0eDRWQlh0L1ZSckxSelJVeUhp?=
 =?utf-8?B?MlpBSmdGMCt4VldiVjdOYUx2Q0dnSkxDa1luOFNwWHZTZTFnSng4cFBZcDNr?=
 =?utf-8?B?Y2I2V3J5U3A4azg5b3ZuLzFONHVoQjdvckdkeWpyQlJHUm5SVnlMZ1Z1K1RU?=
 =?utf-8?B?UWhXL1pmTTRnVVdpblR5UW1wU0IrUHZIblB6NVVISDl6KzYzdjBtQ0RDK2sv?=
 =?utf-8?B?dFRGcDVMdTNNRUVMMFUzeWU2aE9Dc2J6am5ISWZtR0ExVUdmYmJFckQ1NVk0?=
 =?utf-8?B?aTZMOXJuT0pxeTFZajlydndWdGw0bGIxRkxLaWpROHVhVmoxME9LOGxjOFVM?=
 =?utf-8?B?QXJENlJ4RlM2TkdTTnZGYzk0TzVoQ2VaejdYOHNLcXNHZVN0a0ZBa0tIbXhS?=
 =?utf-8?B?NnhGaCtNUGd0aTNpaTdjS1VlSmkvb1d2VzRFSWZxTEdUNDVIL05abXNzTW1Y?=
 =?utf-8?B?ZS9jNC9WNllQelZpQ1JPZkJZNGxPWUV3a0xwcVNZTHhPbWR1MkFPZFhKYmxC?=
 =?utf-8?B?OHhpQzViRnN1WjFGcFVrRlhYbk41M20rK1dseE51ZW1LcDRNRktHTERKTmd1?=
 =?utf-8?B?MDVCMWgxSHRkVU15LzFIUndOelh5dHNJMVhINUVKNDZUa2ZyeFIxblR4OFEy?=
 =?utf-8?B?MTVTbndLYkNjc1JVYnpBeVgrbDZEYTI5QUMzaW1VMFdtQ1BvT0loYmFZaWd6?=
 =?utf-8?B?NmkwUmdMb1FiYitucEZGMTJaeGl6OC9YWGI5VEtUd2Y0TVlFeGpZMlFLbUdr?=
 =?utf-8?B?VjhRemVhaXMyRXJIUXpoU3FHVm1CcTdJKzUzakEyVVFKckN3ZlNxSER4ME10?=
 =?utf-8?B?WGViQWVyU3d2cTlEdCt1cFFZY3V2NXVMTjJhWGZxOUcvUWE2RTlqQlYwY0Vk?=
 =?utf-8?B?aVV0Z3JKenFPNUtsNmRnNFNTWE5XaGhLcDRROFZxNDlwVllWN1U4MStDWWh0?=
 =?utf-8?B?c0psZjN4Qk9XNlplZzNiMDcra3ltLzJneUtrYVN2ejdRdzJXYXF2U3h4WXNX?=
 =?utf-8?B?b0ZaUmRNV05uUS9ZemoxT1NqaUt2OXN0bkRHSEtWUURQVFlIbUlkazR3TnI0?=
 =?utf-8?B?ZVEzeFB4K2dHYzhJVGdSWCs5b3gxOVhhWDBseWZ1K1FmSzhUbklDYlh1RG5p?=
 =?utf-8?B?QTN3dEo0V1ZiSEVEY3FyUWRJUnRnSFh0R1VTeitZMFZVNjR5UlZpbCs5MzZM?=
 =?utf-8?B?UUhDU21yOC9UTEFoK2xPN0NYTHZlRkEvS00rWTJFY01VUVI3Yk9XSUZoYWg1?=
 =?utf-8?B?MFZpSXJUTWpyL2hsekNlaXgxeko1VFFEbkMrT0xYakdCa05UZURuNzBRdUxa?=
 =?utf-8?B?Y0JWK0YyQk8rb0VVN0tpSnBUNmVTLzZ1T1hDT1RHbnFBQ09DOGIyazBqZzdn?=
 =?utf-8?B?akxTMnBQVDdXQTdMczBrU0VodmxUNkswVHk3WXc3b29YR0E0SGNjNFFtaFFN?=
 =?utf-8?B?YWFQMUlxQWtKUmg1ZTU3TWRISXVoUDhNNlFZaGE3Q1Y4Z1JXNm9lSTA1cjZn?=
 =?utf-8?B?RnFyZ0JOS0xqLzVzanZ3OUt2UXhyNVdCOC9KaXZNQ2krVzhBSFN5b2U5KzBl?=
 =?utf-8?B?UWpycHdhS2lXV3ZwL0M1eVNLRElGdXRFVmJrZmk0WWlUYkNjY2JZbWxiN3R6?=
 =?utf-8?B?c1F6dmlwZXIyeWdXVUFZTXJkUTNiRDNoMHpXSHhzaHpXOTNqc2pNQkxTZzRK?=
 =?utf-8?B?RzFtUTYxMys1SnowbC9nY25ianJwMzNsa1I5N0xpVG1UaWg2SDIvVHdLR2VT?=
 =?utf-8?B?UVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 17587c50-c0f5-488b-e9f0-08dce13b78fc
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2024 10:34:33.0077
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fX1z6baFJqcIBR77YRIDOOVgYBVwIFknUKqdnx9L0B8FOfsvARAmUd4gP7NY+y+PVW5L0I9S9PmT4Ni5XESFH6CsUnq4mfH/HwhlMjU87YI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9553
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 30 Sep 2024 10:34:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/205114

Hi Purushottam,

On 9/30/24 12:11 PM, Purushottam Kumar wrote:
> Hi Quentin,
> 
> You are correct.
> As discussed earlier,
> In my opinion, Updating SRCREV instead of adding as patch will be a better
> option for Master and scarthgap branch.But for kirskstone, might will get
> compatiblity issue with gstreamer version. so focusing to address the patch.
> 

Correct, but it would better to have this in the commit log in my 
opinion. Steve (the maintainer) may have a different opinion but that 
would help him understand if this patch is ok to backport without doing 
the work by himself.

Cheers,
Quentin

