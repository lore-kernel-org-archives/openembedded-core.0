Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32FA8C28D13
	for <webhook@archiver.kernel.org>; Mon, 22 Aug 2022 09:28:54 +0000 (UTC)
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (EUR02-HE1-obe.outbound.protection.outlook.com [40.107.1.56])
 by mx.groups.io with SMTP id smtpd.web12.16044.1661160528427521861
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Aug 2022 02:28:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherrycloud.onmicrosoft.com
 header.s=selector2-cherrycloud-onmicrosoft-com header.b=pK1b0tyo;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.1.56,
 mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mjd6It3RWLKXxcAZqncXFpIvnOCoMbgAwR8ykhJG1DPHroP0S5PHL9AnS27hOQXvhz4M7S/UE+YEmBeuIFysM5mKi0kzLZxNW1P5Q3Xcv6foKdriTGkuBhByAxMhaly2Y2ulvqIb6B4sRM5FkUOjurgXqM51AghOL1F7SPC+L2RG3okdNZNF55eqfGk3quVFX7TsFoaWIQXBoAS0ZmfmjUKxyp2zN/N9rFzjCIKt3G73AasMB94eANZwhPTHXjOgfNJyCSIlTpn/IkMo+e5Sp5898dtKe+Brari/emwbajYpFuxtaNqs4aAb9XCEVHC4qOFI3jb3jekWOU/5YFgSHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IGYm54vNUZ1FQ+ir6/SCbgmqsrAoECLtKN/N6+NyyA=;
 b=Go8oozRKyJN636+IsH8npa2GaC+1fYWjSCLBiU4MaFk9W6gePIXx/R4XGrBdXVbr8VvqdpL5nXY5AY5Ife42tcIr0PX0EahG1/Z8ctW7Yam/h7kah7S/B0Vty8KKKHjjXEK9ZfTQlAoEvxNE4lsNCOaZ6o8vwQUoGHtMtnlp/Z0o+tCYc054J6pb62J2D+ZGzxmTLlu618zLxPbg8ow+HTZSUCbNYuLCTmXb23XkT3wQ4UI0rcPOQqSMCAF6c8GzhLBwgwrtx4yKASDLuetpAHgRXXntkiVPt8bbK8Z1BiPvbko93ytCBEe5z4DcYeEWrp5Zi9JbmkqjeyV8ePfDdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cherrycloud.onmicrosoft.com; s=selector2-cherrycloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IGYm54vNUZ1FQ+ir6/SCbgmqsrAoECLtKN/N6+NyyA=;
 b=pK1b0tyo/tDsfM3Rc47fO0pWAOoELVZPWvNyKffLZHNB6Sx6uwITLmhfNant+Q/MMZA0sXupznsrXKhWE/L+kdu3z/yfttzoQAoGJsW/YAaDvV7CFv3tY+B7VAfMTWYnx6/9Ht9MJx4UhB3C8i4RV0JEBqa9gIn3wyAzeh/M7W8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com (2603:10a6:102:2aa::7)
 by DB8PR04MB6506.eurprd04.prod.outlook.com (2603:10a6:10:109::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5546.22; Mon, 22 Aug
 2022 09:28:43 +0000
Received: from PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e]) by PA4PR04MB9367.eurprd04.prod.outlook.com
 ([fe80::81a8:1bbf:5e16:9b4e%4]) with mapi id 15.20.5546.022; Mon, 22 Aug 2022
 09:28:43 +0000
Message-ID: <cf290a54-3b62-9c0d-32cc-08195f682b99@theobroma-systems.com>
Date: Mon, 22 Aug 2022 11:28:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [OE-core][PATCH] bitbake.conf: Add resource vars to hash ignore
 list
Content-Language: en-US
To: Wes Lindauer <wesley.lindauer@gmail.com>,
 openembedded-core@lists.openembedded.org
References: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20220822045919.1262270-1-wesley.lindauer@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::19) To PA4PR04MB9367.eurprd04.prod.outlook.com
 (2603:10a6:102:2aa::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4638503b-0b3d-421f-ad01-08da8420b48e
X-MS-TrafficTypeDiagnostic: DB8PR04MB6506:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	4VFAuTXDZJrRE4SMYHBLoGDV3lwlDNTDzFuBU31UQEG3mZ9xGRdgerX30/QrW4LcSMKr8iM3QOB73kai4uB5K5/3ZYSY3BeMEZOVunUQwoqJEAUXPjxhU8y5VxmMnt3L+5EnH6AoAIDVTys6QNCzQtXhhik9+Bio00XX+a/fcHUgF+JL8KbknNUnh7c5kA76zIMvdyFOr0yCMOgHfCQVSXBTa3i9m8UckuqHvc9fFzn0lIL92n7vb7+vUUOlSk+CXMgr3ZyNT51b4y7FgxxnXFRlzg9q/A9RkREVbwRzmPH7rjkNCXGHePiQPEFthwEFNIx0rYlsE705kPBd5yfbjJr6G+PhTSYNiqTsG2f/wBdZEpD8pjNlgKgmDYj23dfk8IiC3JjejbqhhTJDkSzsWvXbPP31rltvYpNO1FypkMXdRqKvVZwViEAocA9EVLaSuCTNVnWO+byHV/pyGYPAm2yoEMa2gKmqM0xzf6tAb/UN6NH8qGhw+dCE6wumeUfaDkD6XHfRoi7fENqLSV2m0wyAgMF1lkyl9FkGiCUvUHc+iPJisHgT4zFqDruzZwP06ZxIstwnLXB1k1BihWsPo/zSt74v5vEmcvA+ZEXFQjmn3DpgBrPf7W5PZRdbSCYZd5/fXS25Niz/iFj55Y2+lItMFc5ZyXpO09Pxu3ltGduHV3Xewynxo47WNz2GcSaw7KLsK3nmgPqaSy3ZW8kXEm+NMBjbFEtRr+MW/yWpzkJnKk3wrF6X5wijOpZQE4jX6nYW0iKLzqFmTzfpu1pm3NMpFQUORfOTPQRzwcK3Vm5OnCsQMacWDQRAtvubLwpJ
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9367.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(136003)(396003)(376002)(39840400004)(346002)(4744005)(2906002)(86362001)(316002)(38100700002)(8676002)(66476007)(66556008)(44832011)(66946007)(8936002)(5660300002)(6506007)(41300700001)(31696002)(478600001)(966005)(6486002)(6512007)(53546011)(26005)(2616005)(186003)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?U1hKckJrd2ZvMUhWa1Jobkl1a0pEUFRtS1A5S0ZnWTlza3djeEgrQ0VPNUFY?=
 =?utf-8?B?aTA4Mmw5a1JRcEd5S2ZPWDNlTzczTTRVYlpZNGREZzQvSHZabzYrNXpkTDd0?=
 =?utf-8?B?eE5UbmoyUWxVYVpoQWQ0Vmh2cG5jODJvYU9qR3dRSGVZYkxwQ29IeVJEeG1D?=
 =?utf-8?B?b0tIT3Y0N0UyaXZLbXZpMkVHZG5SK21TazBmTVFxQlNkancrUDQ5TDV5RVlS?=
 =?utf-8?B?azFuRGdIckRGSnhEeU5lRWRIVXZKUHB3dTlzaEI5L0t0QmJENE9vb0ovaTdZ?=
 =?utf-8?B?Z0FJcnI2UnF0WGNqeEUzL0JldmpvWGdVbGhKSmQrcUY3RHA1MGdsQVE3OENH?=
 =?utf-8?B?b3ByVUo0MlZtWWorSy9iT2ovcmtCN0VpY2dtRU1IU0NvQ2I3RDF2VkJHU3lF?=
 =?utf-8?B?Y2VHODdibTZtQUVaVERLMG13clBtM0FOTFlIem5wTlR1WFRNK3AzU3F5NjVL?=
 =?utf-8?B?Wi9NM1BEZnZzTS9hbDdMVWR6N3huTFZnNy9WQk50ZUhQbDhqTnJpNDRqVkl4?=
 =?utf-8?B?RjdETG0wUmYvaVRYSUFCTElKRFpwSk80MFVuS05JUHIvSElTK3JOcmxrbEc4?=
 =?utf-8?B?Q0xFSUN2THRIL3Z4bElPT3lrUmR3UXpQQkhOY2F3NllmaGlIdjJDWFB6YzZu?=
 =?utf-8?B?elM2dHhwclRsOG9nUkhkdkI5YzRRUjR0UGkxRzhkMUpSWXB4Q1RKY2FDbTBC?=
 =?utf-8?B?NFA0cEt4WCs1SGJCTlJ1ZlliN2FZdmlvUmRFYkhwYlJiRW5jUllQeG5ZOURR?=
 =?utf-8?B?WEhwL0U5Vm91a0FvSWdpWnJxWktVZm9DckRjVHdHbVVtOGxDVHNDZHFoU1VH?=
 =?utf-8?B?UVp5cE9GRWNjK0dsTy95SDBxcERyR1ZZNGFqQVZZelIwb1pQdmtkbEoxT3Bi?=
 =?utf-8?B?TE9yUkZqT09zbkRhd3pjUTA3VlNoUUFqem1QaFQ0RjlnYTMxb2g5SXRISW1V?=
 =?utf-8?B?cHl3UFY4R3g0U2dHbXBXbnd5UDNPeW9vTHM0RFhNTG9LTE5IY3pkaVJsSFBp?=
 =?utf-8?B?N3FHUzlmTjBFcFYrZ2EwamREZEJ1dHpOdEVnTEhVOUxBeEd1WkV2Z2FBQlNC?=
 =?utf-8?B?bUtPMCt5WFNRRHhpREptVGRuTFhTcXg1YnRvdjlPU09XcjBtL1ZHWTdHL0ND?=
 =?utf-8?B?alpSRmFiNHZjRWN0RUl2TlVUYXMvTWQrSlduVTRvUVRtWEE5dWJYNUQrNGpP?=
 =?utf-8?B?L1haK3IxckJ0MmZ0R3p5WU9ocmM2VFhzR1hML0h1T0MwemJEckVRanFhV1R6?=
 =?utf-8?B?OXM5WXcwSWhaTDJ0dE52VG9KNEVaQnR4bTZlZWNRMnhHQ0VLWmpxYXM5TWll?=
 =?utf-8?B?dVdtMnhxaXEvUldQNGdUdC8rbWsyeHFjeVQ5UGg2Q0l3TGRlcXdaOUo4ZHJ2?=
 =?utf-8?B?Z0JKL0N0RXNZbTdkYVBNclI3bitHY09CZ3BwNFhqbWxlSGVjeTBMbWIybUYx?=
 =?utf-8?B?cW5Rc2wxWElvbmx4M3hsRWU2ZWk2c1M0cUxIaGM3NUhmcHVJNlFuWFpOeFV4?=
 =?utf-8?B?V0ZoWnNhUGloNGVVRjRGZWt0OUVkSGFJQnRUUktWSUFJT0dYb2ZpblpBVTNC?=
 =?utf-8?B?SVBWdGwxaVI2NC9hMDlMQ1IrSjdzRnY2clNTNVVsS2hkY2s1WFloUmJLWlZu?=
 =?utf-8?B?Q3ozT2FhdCs2K2FhZWhBcWk2eFVWZHJYMWUzTy9oSW1wcWJwSDN0QkR4K1pB?=
 =?utf-8?B?eFFWa2hxemdrY2QyQ0F0ZHJ1RW1hY3NRMjA5VUZpZzRtRk53M1dRRFFiMnc3?=
 =?utf-8?B?a0xGZ1ppYWE2UDRzNVlaRXh0VnIzaUQ5QlgyUElrYXRaRUlkWTBHUytlWTlY?=
 =?utf-8?B?OExwbVMxNDl2U05SRDFKcWtaMnR5cUdzdnZwanI0OFppWk9mRHFiTWtBNG1Z?=
 =?utf-8?B?bjNoVTk2THo1SEtKbHYyOHhKZzVoRThFUExxWGJJdGFHSTNkcnZLdCtXL1Ax?=
 =?utf-8?B?QkJIQTFHNFh0dTMvZ2FRTVZlYTE5eU5WOXczd1hTSkZBUEFsS1U5clBMSCtt?=
 =?utf-8?B?dUhGSUFJQXg5c28zcDg5dHpJTURMY1NsTUx0YmovVUU2SEU3VDA1dk1tTEhh?=
 =?utf-8?B?cFNzb1dLZ2l4S2hSc1c1QU5FbGU3K2hZZXBKVTJ0QUY3RWVaR2RRcHJkMm1i?=
 =?utf-8?B?VXQ5R3NjV1MrRUVHR1J0ZVlVWUUyc3JZSWVmSVVZY2JkalRqNWNZSTRYNlpY?=
 =?utf-8?Q?IhhHixrrjlAG8JBxoygjE5g=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4638503b-0b3d-421f-ad01-08da8420b48e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9367.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2022 09:28:43.4897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 UQV2Cg8z4d5eotzWvzWWPRti4QS3IsQbISeuu4OAv/m5GDkxS4VPq2se6ofgt1eE/kxGjBBtc+XQJSGdEA12gnsWIsdpiD2evI5ZXuqHnYPVsYEgx/DEblMa5gDmq3TQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6506
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Aug 2022 09:28:54 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169667

Hi Wes,

On 8/22/22 06:59, Wes Lindauer wrote:
> It should not matter what xz/zstd parallelism and resource usage is set to
> when determining hash signatures. This allows sharing more sstate across
> host machines with different CPU configurations.
> 

It seems like it does matter in some ways, c.f.:
https://git.openembedded.org/openembedded-core/commit/?id=0296dc71c01d1b7953d74ef37d56429e2f4fcfab
and
https://git.openembedded.org/openembedded-core/commit/?id=e72c0b94554a9bc293844ec2bddb0c04ea19791d

Cheers,
Quentin

